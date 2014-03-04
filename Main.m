%---------------------------------------------------------%
%       This file has been been created by Reza Amin      %   
%           CSML lab, University of Connecticut           %
%---------------------------------------------------------%

clc
clear all
close all
%__________________________________________________________________________
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Initializing the Simulation Variables        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Receiving the statistic data of Cells Life Span and creating Gaussian random generator class.
%The unit of the Cells Life Span is in hour.  
LSnumsample=1000;
LSmean=input('Insert the mean value of Cell Life Span random variables (the unit is in hour):');
LSstandeviation=input('Insert the standard deviation of Cell Life Span random variables:');
LSsamples=RandomGenerator(LSnumsample,LSmean,LSstandeviation);

%Receiving the statistic data of Cell Division Rate and creating Gaussian random generator class.
%The unit of the Cell Division Rate is in hour
CDRnumsample=1000;
CDRmean=input('Insert the mean value of Cell Division Rate random variables(the unit is in hour):');
CDRstandeviation=input('Insert the standard deviation of Cell Division Rate random variables:');
CDRsamples=RandomGenerator(CDRnumsample,CDRmean,CDRstandeviation);

%Receiving the number of cells in X axis and Y axis which define the size
%of tissue.
TissueX=input('Insert the number of cells in X axis which indicates size of tissue:');
TissueY=input('Insert the number of cells in Y axis which indicates size of tissue:');

%Receiving the time we want to run the simulation of cell population dynamics.
%The unit is in hour. 
SimulationTime=input('Insert the simulation Time in hour');

%Receiving the the X and Y location of the first parent cell. We assume the first
%cell has been transplanted inside the tissue
TransplantedCellX=input('Insert X location of first parent cell, to transplant first cell in tissue:');
TransplantedCellY=input('Insert Y location of first parent cell, to transplant first cell in tissue:');

%Creating a class of cells base on the size of tissue defined above
cell=Cell(TissueX,TissueY);

%Locating first parent cell inside the tissue
cell=TransplantCell(cell,TransplantedCellX,TransplantedCellY,LSsamples,CDRsamples);

%Creating "Appoptosis" class which contains the apoptosis method.
%The method makes the apoptosis decision for cells.  
apoptosis=Apoptosis;

%Creating "CellDivision" class which contains the cell division method.
%The method makes the cell division decision for cells.
celldivision=CellDivision;
%_________________________________________________________________________
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Make the Simulation for Defined Variables       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Run the "CellFunction" for all the cells in tissue, for defined duration itratively 
for Time=1:SimulationTime
    i=0;
    for i=1:TissueY
        j=0;
        for j=1:TissueX
        
            %CellFunction is a method inside the "Cell" class which govern
            %devision and appoptosis of each cell 
            cell=CellFunction(cell,apoptosis,celldivision,Time,i,j,LSsamples,CDRsamples);
            
            %Storing the location of live cells in matrix called TISSUE for
            %each itration
            TISSUE(i,j)=isempty(cell(i,j).LifeSpan);
        end
    end
    % Plot the location of live cells in tissue for each itration
    imagesc(TISSUE)
    pause(.00001)
end


