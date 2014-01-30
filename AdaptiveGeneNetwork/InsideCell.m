classdef InsideCell
    %INSIDECELL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        xlocation;
        ylocation;
        Il2_in;
    end
    
    methods
        function insidecell = InsideCell(x,y,adaptiveNLMS);
            insidecell.xlocation=x;
            insidecell.ylocation=y;
            
            insidecell.Il2_in = NLMS.w1*outsidecell.Il2_out+NLMS.w2*ag.antgn
    end
    
end

