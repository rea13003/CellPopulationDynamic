clear all
clc

% Generating Life Span random variable with Standard Diviation of LSSD (unit=hour)
numsamples = 1000;
LS = 240;% Mean Cell Life Span
LSSD = 100;% Cell Life Span Standard Deviation
LSsamples = round(LS + LSSD.*randn(numsamples, 1));% Generating Vector of Gaussian Random Value

% Generating Cell Devision Rate random variable with Standard Diviation of CDRSD (unit=hour) 
numsamples = 1000;
CDR = 10; % Mean Cell Division Rate 
CDRSD = 3; % Cell Division Rate Standard Deviation
CDRsamples = round(CDR + CDRSD.*randn(numsamples, 1)); % Generating Vector of Gaussian Random Value

% Initialization
Tsize=100;% Initializing the size of Tissue
TISSUE=zeros(Tsize);% Initializing the Tissue Cells
LSREC=zeros(Tsize);% Initializing the Life Span Record
CDREC=zeros(Tsize);% Initializing the Cell Division Rate Record 

%Transplantation of cell
TISSUE(50,50)=1;
CDREC(50,50)=CDRsamples(randi([1,numsamples])); % Initializing the Cell Division Rate of transplanted cell
LSREC(50,50)=LSsamples(randi([1,numsamples])); % Initializing the Life Span of transplanted cell


for h=1:1500 % Duration of Simulation in hour
    
    
    [I,J] = find(TISSUE);            %Find the cells
    N=length(I);                     %Number of availible cells
   
    
    k=0;                              %Initializing cell counter
    for k=1:N;
        
   % Cell decision making for all availible cell
        if LSREC(I(k),J(k))==h
            TISSUE(I(k),J(k))=0;
            LSREC(I(k),J(k))=0;
            CDREC(I(k),J(k))=0;
        elseif rem(h,CDREC(I(k),J(k)))==0
                    
            
         %Find number of neighboring cells
            %up left
            row_of_neighbors(1)=rem(I(k)-2+Tsize,Tsize)+1;
            column_of_neighbors(1)=rem(J(k)-2+Tsize,Tsize)+1;
            
            %up
             row_of_neighbors(2)=rem(I(k)-2+Tsize,Tsize)+1;
             column_of_neighbors(2)=J(k);
             
		    %up right
            row_of_neighbors(3)=rem(I(k)-2+Tsize,Tsize)+1;
            column_of_neighbors(3)=rem(J(k),Tsize)+1;            
        
            %right
            row_of_neighbors(4)=I(k);
            column_of_neighbors(4)=rem(J(k),Tsize)+1;
            
            %bottom right
            row_of_neighbors(5)=rem(I(k),Tsize)+1;
            column_of_neighbors(5)=rem(J(k),Tsize)+1;
        	
            %bottom
            row_of_neighbors(6)=rem(I(k),Tsize)+1;
            column_of_neighbors(6)=J(k);
        
            %bottom left
            row_of_neighbors(7)=rem(I(k),Tsize)+1;
            column_of_neighbors(7)=rem(J(k)-2+Tsize,Tsize)+1;           
         
            %left
            row_of_neighbors(8)=I(k);
            column_of_neighbors(8)=rem(J(k)-2+Tsize,Tsize)+1;
            
            %Select the place for daughter cell randomly
             p=randi([1,8]);
          % Producing and Locating daughter cell 
             if TISSUE(row_of_neighbors(p),column_of_neighbors(p))==0
                TISSUE(row_of_neighbors(p),column_of_neighbors(p))=1;
                LSREC(row_of_neighbors(p),column_of_neighbors(p))=LSsamples(randi([1,numsamples]))+h;
                CDREC(row_of_neighbors(p),column_of_neighbors(p))=CDRsamples(randi([1,numsamples]));
             end
            
        end
       proliferation(h)=length(find(TISSUE)); 
    end
   imagesc(TISSUE)
   pause(.001)
end

figure, plot(proliferation)