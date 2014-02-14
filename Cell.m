classdef Cell
    %CELL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        XLocation;
        YLocation;
              
        LifeSpan;
        CellDivisionRate;
        NeighborsRow;
        NeighborsColumn;

    end
    
    methods
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
        
        function thisCell=TransplantCell(thisCell,TransplantedCellX,TransplantedCellY,LSsamples,CDRsamples)
           
            TransplantedCellLS=LSsamples.Samples(randi([1,LSsamples.NumSample]));
            TransplantedCellCDR=CDRsamples.Samples(randi([1,CDRsamples.NumSample]));
            
            thisCell(TransplantedCellY,TransplantedCellX).LifeSpan=TransplantedCellLS;
            thisCell(TransplantedCellY,TransplantedCellX).CellDivisionRate=TransplantedCellCDR;
        end
                    
        function thisCell=CellFunction(thisCell,thisApop,thisCellDivision,time,i,j,LSsamples,CDRsamples)
            thisApop=ApoptosisDecision(thisApop,thisCell(i,j),time);
            if thisApop.Status==1
                thisCell(i,j)=delete(thisCell(i,j));
            end
            
            thisCellDivision=CellDivisionDecision(thisCellDivision,thisCell(i,j),time);
            
           if thisCellDivision.Status==1
              R=randi([1,8]);
              newcellY=thisCell(i,j).NeighborsRow(R);
              newcellX=thisCell(i,j).NeighborsColumn(R);
              k=isempty(thisCell(newcellY,newcellX).LifeSpan);
              
               if k==1
                 NewCellLS=LSsamples.Samples(randi([1,LSsamples.NumSample]))+time;
                 NewCellCDR=CDRsamples.Samples(randi([1,CDRsamples.NumSample]));
                 thisCell(newcellY,newcellX).LifeSpan=NewCellLS;
                 thisCell(newcellY,newcellX).CellDivisionRate=NewCellCDR;
               end
           end
            
        end
                           
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