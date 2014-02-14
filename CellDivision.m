classdef CellDivision
    %CELLDIVISION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
      Time;
      Status;
    end
    
    methods
        
        function thisCellDivision=CellDivisionDecision(thisCellDivision,thisCell,time)
            thisCellDivision.Time=time;
           if rem(thisCellDivision.Time,thisCell.CellDivisionRate)==0
              thisCellDivision.Status=1;
           else
              thisCellDivision.Status=0;
                    
           end
        end
    
    end
end



