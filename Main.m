clc
clear all
close all

LSnumsample=input('Insert the number of Cell Life Span samples');
LSmean=input('Insert the mean of Cell Life Span samples');
LSstandeviation=input('Insert the standard deviation of Cell Life Span samples');
LSsamples=RandomGenerator(LSnumsample,LSmean,LSstandeviation);



CDRnumsample=input('Insert the number of Cell Division Rate samples');
CDRmean=input('Insert the mean of Cell Division Rate samples');
CDRstandeviation=input('Insert the standard deviation of Cell Division Rate samples');
CDRsamples=RandomGenerator(CDRnumsample,CDRmean,CDRstandeviation);

TissueX=input('Insert the Tissue X');
TissueY=input('Insert the Tissue Y');

SimulationTime=input('Insert the simulation Time in hour');

TransplantedCellX=input('Insert X of Transplanted Cell');
TransplantedCellY=input('Insert Y of Transplanted Cell');

cell=Cell(TissueX,TissueY);

cell=TransplantCell(cell,TransplantedCellX,TransplantedCellY,LSsamples,CDRsamples);

apoptosis=Apoptosis;
celldivision=CellDivision;

for Time=1:SimulationTime
    i=0;
    for i=1:TissueY
        j=0;
        for j=1:TissueX
        
            cell=CellFunction(cell,apoptosis,celldivision,Time,i,j,LSsamples,CDRsamples);
            TISSUE(i,j)=isempty(cell(i,j).LifeSpan);
        end
    end
       imagesc(TISSUE)
       pause(.00001)
end


