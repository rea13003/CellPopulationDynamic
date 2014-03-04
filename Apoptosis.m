%---------------------------------------------------------%
%       This file has been been created by Reza Amin      %   
%           CSML lab, University of Connecticut           %
%---------------------------------------------------------%

%This class contains a method for making the apoptosis decision.

classdef Apoptosis
    %APOPTOSIS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    Time; % Simulation time
    Status; % Decision of the function (1=apoptosis, 0= continue living)
    end
    
    methods
        
         % The ApoptosisDecision function decides the apoptosis of each cell
         % if the simulation time reaches to the life span of cell
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

