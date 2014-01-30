classdef adaptiveNLMS
    %ADAPTIVENLMS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        error;
        mu;
        mu0;
        w1;
        w2;

    end
    
    methods
        function NLMS = adaptiveNLMS(InsideCell,OutsideCell)
            
            NLMS.error=outsidecell.Il2_out-insidecell.Il2_in;
            NLMS.mu=NLMS.mu0/(NLMS.epsilon+outsidecell.Il2_out*outsidecell.Il2_out+ag.antgn*ag.antgn);
            NLMS.w1=NLMS.w1+NLMS.mu*NLMS.error*outsidecell.Il2_out;
            NLMS.w2=NLMS.w2+NLMS.mu*NLMS.error*ag.antgn;
        end

    end
    
end

