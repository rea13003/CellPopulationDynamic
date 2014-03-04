%---------------------------------------------------------%
%       This file has been been created by Reza Amin      %   
%           CSML lab, University of Connecticut           %
%---------------------------------------------------------%

%This class generate the random samples for random properties of cells 
%based on the statistic information of that propertie.

classdef RandomGenerator
    %RANDOMGENERATOR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        NumSample; %Number of random samples we want to generate
        Mean; %Mean value of the random samples we want to generate
        StanDeviation; %Standard deviation of the random samples
        Samples; % Array of generated samples 
    end
    
    methods
        function thisSample=RandomGenerator(numsample,mean,standeviation)
            thisSample.NumSample=numsample;
            thisSample.Mean=mean;
            thisSample.StanDeviation=standeviation;
            
            %Generate array of samples
            thisSample.Samples=round(thisSample.Mean + thisSample.StanDeviation.*randn(thisSample.NumSample, 1));
        end
        
    end
    
end

