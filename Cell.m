%---------------------------------------------------------%
%       This file has been been created by Reza Amin      %   
%           CSML lab, University of Connecticut           %
%---------------------------------------------------------%

classdef Cell
    %CELL Summary of this class goes here
    %Detailed explanation goes here
    
    properties
        XLocation; % X location of each cell in the tissue.
        YLocation; % Y location of each cell in the tissue.
              
        LifeSpan; % Life span of each cell.
        CellDivisionRate; % Cell division rate of each cell.
        NeighborsRow; %Arrey of 8 neighbor's Y location.
        NeighborsColumn; % Arrey of 8 neighbor's X location.

    end
    
    methods
        
        %Construct a tissue of cells base on the size of tissue.
        function thisCell=Cell(tissueX,tissueY)
           if nargin==2
               
               thisCell(tissueY,tissueX)=Cell;
               
               for i=1:tissueY
                   for j=1:tissueX
                      thisCell(i,j).XLocation=i;
                      thisCell(i,j).YLocation=j;
                      
                      %Find number of neighboring cells
            %up left
            thisCell(i,j).NeighborsRow(1)=rem(thisCell(i,j).XLocation-2+tissueY,tissueY)+1;
            thisCell(i,j).NeighborsColumn(1)=rem(thisCell(i,j).YLocation-2+tissueX,tissueX)+1;
            
            %up
             thisCell(i,j).NeighborsRow(2)=rem(thisCell(i,j).XLocation-2+tissueY,tissueY)+1;
             thisCell(i,j).NeighborsColumn(2)=thisCell(i,j).YLocation;
             
		    %up right
            thisCell(i,j).NeighborsRow(3)=rem(thisCell(i,j).XLocation-2+tissueY,tissueY)+1;
            thisCell(i,j).NeighborsColumn(3)=rem(thisCell(i,j).YLocation,tissueX)+1;            
        
            %right
            thisCell(i,j).NeighborsRow(4)=thisCell(i,j).XLocation;
            thisCell(i,j).NeighborsColumn(4)=rem(thisCell(i,j).YLocation,tissueX)+1;
            
            %bottom right
            thisCell(i,j).NeighborsRow(5)=rem(thisCell(i,j).XLocation,tissueY)+1;
            thisCell(i,j).NeighborsColumn(5)=rem(thisCell(i,j).YLocation,tissueX)+1;
        	
            %bottom
            thisCell(i,j).NeighborsRow(6)=rem(thisCell(i,j).XLocation,tissueY)+1;
            thisCell(i,j).NeighborsColumn(6)=thisCell(i,j).YLocation;
        
            %bottom left
            thisCell(i,j).NeighborsRow(7)=rem(thisCell(i,j).XLocation,tissueY)+1;
            thisCell(i,j).NeighborsColumn(7)=rem(thisCell(i,j).YLocation-2+tissueX,tissueX)+1;           
         
            %left
            thisCell(i,j).NeighborsRow(8)=thisCell(i,j).XLocation;
            thisCell(i,j).NeighborsColumn(8)=rem(thisCell(i,j).YLocation-2+tissueX,tissueX)+1;
           
                       
                   end
               end
           end
        end
        
        % "TransplantCell" is to locate parent cell in defined
        % location of tissue and set its properties.
        function thisCell=TransplantCell(thisCell,TransplantedCellX,TransplantedCellY,LSsamples,CDRsamples)
           
            TransplantedCellLS=LSsamples.Samples(randi([1,LSsamples.NumSample]));
            TransplantedCellCDR=CDRsamples.Samples(randi([1,CDRsamples.NumSample]));
            
            thisCell(TransplantedCellY,TransplantedCellX).LifeSpan=TransplantedCellLS;
            thisCell(TransplantedCellY,TransplantedCellX).CellDivisionRate=TransplantedCellCDR;
        end
        
        % "CellFunction" is the governor function for division and
        % apoptosis in each cell
        function thisCell=CellFunction(thisCell,thisApop,thisCellDivision,time,i,j,LSsamples,CDRsamples)
            %Call "ApoptosisDecision" method inside "Apoptosis" class
            thisApop=ApoptosisDecision(thisApop,thisCell(i,j),time);
            %Kill the cell if the "ApoptosisDecision" makes the thisApop.Status==1
            if thisApop.Status==1
                thisCell(i,j)=delete(thisCell(i,j));
            end
            
            %Call "CellDivisionDecision" method inside "CellDivision" class
            thisCellDivision=CellDivisionDecision(thisCellDivision,thisCell(i,j),time);
            
             %Divide if thisCellDivision.Status==1 and the randomly
             %selected location (among neighbors) for new cell is empty
              if thisCellDivision.Status==1
              R=randi([1,8]);
              newcellY=thisCell(i,j).NeighborsRow(R);
              newcellX=thisCell(i,j).NeighborsColumn(R);
              k=isempty(thisCell(newcellY,newcellX).LifeSpan);
              
              %Set the properties of daughter cell if the randomly selected
              %location is free (k==1).
               if k==1
                 NewCellLS=LSsamples.Samples(randi([1,LSsamples.NumSample]))+time;
                 NewCellCDR=CDRsamples.Samples(randi([1,CDRsamples.NumSample]));
                 thisCell(newcellY,newcellX).LifeSpan=NewCellLS;
                 thisCell(newcellY,newcellX).CellDivisionRate=NewCellCDR;
               end
           end
            
        end
        
        %"delete" is a method of this class to make the properties of
        %killed cell equal to zero
        function thisCell=delete(thisCell)
           
%                thisCell.XLocation=[];
%                thisCell.YLocation=[];
               thisCell.LifeSpan=[];
               thisCell.CellDivisionRate=[];
%                thisCell.NeighborsRow=[];
%                thisCell.NeighborsColumn=[];
               
        end   
      end
end