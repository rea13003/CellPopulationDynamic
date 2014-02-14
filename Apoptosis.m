classdef Apoptosis
    %APOPTOSIS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    Time;
    Status;
    end
    
    methods
        
       
         function thisapop=ApoptosisDecision(thisapop,thisCell,time)
             thisapop.Time=time;
             if thisapop.Time==thisCell.LifeSpan
               thisapop.Status=1;
            else
               thisapop.Status=0;
                
            end
            
        end
    end
    
end

