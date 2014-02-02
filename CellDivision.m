classdef CellDivision
    %CELLDIVISION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
      Time;
      NewCellLifeSpan;
      NewCellCellDivisionRate;
      
    end
    
    methods
        function celldivision=CellDivision(time,newcelllifespan,newcellcelldivisionrate)
                celldivision.Time=time;
                celldivision.NewCellLifeSpan=newcelllifespan;
                celldivision.NewCellCellDivisionRate=newcellcelldivisionrate;
        end
        
        function newcell=CellDivisionDecision(celldivision,cell)
           if rem(celldivision.Time,cell.CellDivisionRate)==0
              
              R=randi([1,8]);
              newcellX=cell.NeighborsRow(R);
              newcellY=cell.NeighborsColumn(R);
              k=isempty(cell(newcellX,newcellY));
              
               if k==1
                newcell(newcellX,newcellY)=Cell(newcellX,newcellY,celldivision.NewCellLifeSpan,celldivision.NewCellCellDivisionRate,cell.TissueSize);

               end
               
           end
        end
    
    end
end



