clc 
clear all

LSnumsample=input('Insert the number of Cell Life Span samples');
LSmean=input('Insert the mean of Cell Life Span samples');
LSstandeviation=input('Insert the standard deviation of Cell Life Span samples');
LSsamples=RandomGenerator(LSnumsample,LSmean,LSstandeviation);



CDRnumsample=input('Insert the number of Cell Division Rate samples');
CDRmean=input('Insert the mean of Cell Division Rate samples');
CDRstandeviation=input('Insert the standard deviation of Cell Division Rate samples');
CDRsamples=RandomGenerator(CDRnumsample,CDRmean,CDRstandeviation);

TransplantedCellX=input('Insert X of Transplanted Cell');
TransplantedCellY=input('Insert Y of Transplanted Cell');
TransplantedCellLS=LSsamples.Samples(randi([1,LSnumsample]));
TransplantedCellCDR=CDRsamples.Samples(randi([1,CDRnumsample]));
TissueSize=input('Insert the Tissue Size');
cell(TissueSize,TissueSize)=Cell;
cell(TransplantedCellX,TransplantedCellY)=Cell(TransplantedCellX,TransplantedCellY,TransplantedCellLS,TransplantedCellCDR,TissueSize);


SimulationTime=input('Insert the simulation Time in hour');

for Time=1:SimulationTime
    
    apoptosis=Apoptosis(Time);

    for i=1:TissueSize
    for j=1:TissueSize
        
        cell(i,j)=ApoptosisDecision(apoptosis,Cell(i,j));
        
        NewCellLS=LSsamples.Samples(randi([1,LSsamples.NumSample]))+Time;
        NewCellCDR=CDRsamples.Samples(randi([1,CDRsamples.NumSample]));
        celldivision=CellDivision(Time,NewCellLS,NewCellCDR);
        cell=CellDivisionDecision(celldivision,cell(i,j));
        
        
    end
    end
    
end
