classdef RandomGenerator
    %RANDOMGENERATOR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        NumSample;
        Mean;
        StanDeviation;
        Samples;
    end
    
    methods
        function thisSample=RandomGenerator(numsample,mean,standeviation)
            thisSample.NumSample=numsample;
            thisSample.Mean=mean;
            thisSample.StanDeviation=standeviation;
            thisSample.Samples=round(thisSample.Mean + thisSample.StanDeviation.*randn(thisSample.NumSample, 1));
        end
        
    end
    
end

