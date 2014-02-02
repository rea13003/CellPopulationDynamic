classdef Apoptosis
    %APOPTOSIS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    Time;
    end
    
    methods
        
        function thisapop=Apoptosis(Time)
            thisapop.Time=Time;
         end
         function cell=ApoptosisDecision(thisapop,cell)
            if thisapop.Time==cell.LifeSpan
               cell=delete(cell);
                
            end
            
        end
    end
    
end

