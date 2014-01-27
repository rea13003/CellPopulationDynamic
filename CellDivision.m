classdef CellDivision
    %CELLDIVISION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
      Time;  
    end
    
    methods
        function celldevision=CellDivision(Time)
                celldevision.Time=Time;
        end
        
        function CellDivisionDecision(celldevision,cell)
           if rem(celldevision.Time,cell.CellDivisionRate)==0
               cell(thisCell.NeighborsRow(randi([1,8])),thisCell.NeighborsColumn(randi([1,8])))=Cell(thisCell.NeighborsRow(randi([1,8])),thisCell.NeighborsColumn(randi([1,8]))),LSsamples(randi([1,numsamples]))+celldevision.Time,CDRsamples(randi([1,numsamples]))
               
        end
    end
    
end

