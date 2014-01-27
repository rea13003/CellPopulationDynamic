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
        TissueSize;
    end
    
    methods
        function thisCell=Cell(x,y,lifespan,celldivisionrate,tissuesize)
           if nargin==5
            thisCell.XLocation=x;
            thisCell.YLocation=y;
            
            thisCell.LifeSpan=lifespan;
            thisCell.CellDivisionRate=celldivisionrate;
            thisCell.TissueSize=tissuesize;
            
             %Find number of neighboring cells
            %up left
            thisCell.NeighborsRow(1)=rem(thisCell.XLocation-2+thisCell.TissueSize,thisCell.TissueSize)+1;
            thisCell.NeighborsColumn(1)=rem(thisCell.YLocation-2+thisCell.TissueSize,thisCell.TissueSize)+1;
            
            %up
             thisCell.NeighborsRow(2)=rem(thisCell.XLocation-2+thisCell.TissueSize,thisCell.TissueSize)+1;
             thisCell.NeighborsColumn(2)=thisCell.YLocation;
             
		    %up right
            thisCell.NeighborsRow(3)=rem(thisCell.XLocation-2+thisCell.TissueSize,thisCell.TissueSize)+1;
            thisCell.NeighborsColumn(3)=rem(thisCell.YLocation,thisCell.TissueSize)+1;            
        
            %right
            thisCell.NeighborsRow(4)=thisCell.XLocation;
            thisCell.NeighborsColumn(4)=rem(thisCell.YLocation,thisCell.TissueSize)+1;
            
            %bottom right
            thisCell.NeighborsRow(5)=rem(thisCell.XLocation,thisCell.TissueSize)+1;
            thisCell.NeighborsColumn(5)=rem(thisCell.YLocation,thisCell.TissueSize)+1;
        	
            %bottom
            thisCell.NeighborsRow(6)=rem(thisCell.XLocation,thisCell.TissueSize)+1;
            thisCell.NeighborsColumn(6)=thisCell.YLocation;
        
            %bottom left
            thisCell.NeighborsRow(7)=rem(thisCell.XLocation,thisCell.TissueSize)+1;
            thisCell.NeighborsColumn(7)=rem(thisCell.YLocation-2+thisCell.TissueSize,thisCell.TissueSize)+1;           
         
            %left
            thisCell.NeighborsRow(8)=thisCell.XLocation;
            thisCell.NeighborsColumn(8)=rem(thisCell.YLocation-2+thisCell.TissueSize,thisCell.TissueSize)+1;
           
           end
        end
        function thisCell=delete(thisCell)
           
               thisCell.XLocation=[];
               thisCell.YLocation=[];
               thisCell.LifeSpan=[];
               thisCell.CellDivisionRate=[];
               thisCell.NeighborsRow=[];
               thisCell.NeighborsColumn=[];
               thisCell.TissueSize=[];
        end
        
        
        
    end
end