%---------------------------------------------------------%
%       This file has been been created by Reza Amin      %   
%           CSML lab, University of Connecticut           %
%---------------------------------------------------------%

%This class contains a method for making the cell division decision.
classdef CellDivision
    %CELLDIVISION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
      Time;% Simulation time
      Status;% Decision of the function (1=divide, 0= do not divide)
    end
    
    methods
        
        % The CellDivisionDecision function decides to divide each cell
        % if the remainder of (simulation time/cell division rate) is zero
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



