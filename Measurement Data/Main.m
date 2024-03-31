clc; clear all; close all;

global Data Raw

BAL = importdata("BAL.mat");
PRS = importdata("PRS.mat");

DataCorrected.Vinf20.J16 = readtable("corrected_data\thrust_v20_j16_corrected.csv");
DataCorrected.Vinf20.J20 = readtable("corrected_data\thrust_v20_j20_corrected.csv");
DataCorrected.Vinf40.J16 = readtable("corrected_data\thrust_v40_j16_corrected.csv");
DataCorrected.Vinf40.J20 = readtable("corrected_data\thrust_v40_j20_corrected.csv");

%%
Raw.WindMilling = data2table(BAL.windOn.wind_on_27);
Raw.Thrust{1} = data2table(BAL.windOn.wind_on_77);
Raw.Thrust{2} = data2table(BAL.windOn.wind_on_127);
Raw.Thrust{3} = data2table(BAL.windOn.wind_on_152);
Raw.DerivativeP = data2table(BAL.windOn.wind_on_177);
Raw.DerivativeN = data2table(BAL.windOn.wind_on_negative);

Raw.WindMilling(49,:) = []; % Adrian Beno!
Raw.Thrust{2}(22,:) = []; % Adrian Beno!

Data.WindMilling.Vinf20 = Raw.WindMilling(1:25,:);
Data.WindMilling.Vinf40 = Raw.WindMilling(26:50,:);
Data.Thrust.Vinf40.J16 = Raw.Thrust{1}(1:25,:);
Data.Thrust.Vinf40.J20 = Raw.Thrust{1}(26:50,:);
Data.Thrust.Vinf20.J20 = Raw.Thrust{2};
Data.Thrust.Vinf20.J16 = Raw.Thrust{3};

Data.WindMilling.Vinf20.AoA = round(Data.WindMilling.Vinf20.AoA);
Data.WindMilling.Vinf40.AoA = round(Data.WindMilling.Vinf40.AoA);
Data.Thrust.Vinf40.J16.AoA = round(Data.Thrust.Vinf40.J16.AoA);
Data.Thrust.Vinf40.J20.AoA = round(Data.Thrust.Vinf40.J20.AoA);
Data.Thrust.Vinf20.J20.AoA = round(Data.Thrust.Vinf20.J20.AoA);
Data.Thrust.Vinf20.J16.AoA = round(Data.Thrust.Vinf20.J16.AoA);

Data.WindMilling.Vinf20.AoS = round(Data.WindMilling.Vinf20.AoS);
Data.WindMilling.Vinf40.AoS = round(Data.WindMilling.Vinf40.AoS);
Data.Thrust.Vinf40.J16.AoS = round(Data.Thrust.Vinf40.J16.AoS);
Data.Thrust.Vinf40.J20.AoS = round(Data.Thrust.Vinf40.J20.AoS);
Data.Thrust.Vinf20.J20.AoS = round(Data.Thrust.Vinf20.J20.AoS);
Data.Thrust.Vinf20.J16.AoS = round(Data.Thrust.Vinf20.J16.AoS);

derivativeOrganizer("Vinf20","J16")
derivativeOrganizer("Vinf20","J20")
derivativeOrganizer("Vinf40","J16")
derivativeOrganizer("Vinf40","J20")

AngleList.AoA.WindMilling.Vinf20 = unique(Data.WindMilling.Vinf20.AoA);
AngleList.AoA.WindMilling.Vinf40 = unique(Data.WindMilling.Vinf40.AoA);
AngleList.AoA.Thrust.Vinf40.J16 = unique(Data.Thrust.Vinf40.J16.AoA);
AngleList.AoA.Thrust.Vinf40.J20 = unique(Data.Thrust.Vinf40.J20.AoA);
AngleList.AoA.Thrust.Vinf20.J20 = unique(Data.Thrust.Vinf20.J20.AoA);
AngleList.AoA.Thrust.Vinf20.J16 = unique(Data.Thrust.Vinf20.J16.AoA);

AngleList.AoS.WindMilling.Vinf20 = unique(Data.WindMilling.Vinf20.AoS);
AngleList.AoS.WindMilling.Vinf40 = unique(Data.WindMilling.Vinf40.AoS);
AngleList.AoS.Thrust.Vinf40.J16 = unique(Data.Thrust.Vinf40.J16.AoS);
AngleList.AoS.Thrust.Vinf40.J20 = unique(Data.Thrust.Vinf40.J20.AoS);
AngleList.AoS.Thrust.Vinf20.J20 = unique(Data.Thrust.Vinf20.J20.AoS);
AngleList.AoS.Thrust.Vinf20.J16 = unique(Data.Thrust.Vinf20.J16.AoS);

%% Derivatives

% CL lift alpha
derivativeCalc("Thrust","Vinf20","J16","CL","AoA")
derivativeCalc("Thrust","Vinf20","J20","CL","AoA")
derivativeCalc("Thrust","Vinf40","J16","CL","AoA")
derivativeCalc("Thrust","Vinf40","J20","CL","AoA")

% CM pitch alpha
derivativeCalc("Thrust","Vinf20","J16","CMpitch","AoA")
derivativeCalc("Thrust","Vinf20","J20","CMpitch","AoA")
derivativeCalc("Thrust","Vinf40","J16","CMpitch","AoA")
derivativeCalc("Thrust","Vinf40","J20","CMpitch","AoA")

% CM pitch beta
derivativeCalc("Thrust","Vinf20","J16","CMpitch","AoS")
derivativeCalc("Thrust","Vinf20","J20","CMpitch","AoS")
derivativeCalc("Thrust","Vinf40","J16","CMpitch","AoS")
derivativeCalc("Thrust","Vinf40","J20","CMpitch","AoS")

% CM yaw alpha
derivativeCalc("Thrust","Vinf20","J16","CMyaw","AoA")
derivativeCalc("Thrust","Vinf20","J20","CMyaw","AoA")
derivativeCalc("Thrust","Vinf40","J16","CMyaw","AoA")
derivativeCalc("Thrust","Vinf40","J20","CMyaw","AoA")

% CM yaw beta
derivativeCalc("Thrust","Vinf20","J16","CMyaw","AoS")
derivativeCalc("Thrust","Vinf20","J20","CMyaw","AoS")
derivativeCalc("Thrust","Vinf40","J16","CMyaw","AoS")
derivativeCalc("Thrust","Vinf40","J20","CMyaw","AoS")

% Cy (sideforce) alpha
derivativeCalc("Thrust","Vinf20","J16","CY","AoA")
derivativeCalc("Thrust","Vinf20","J20","CY","AoA")
derivativeCalc("Thrust","Vinf40","J16","CY","AoA")
derivativeCalc("Thrust","Vinf40","J20","CY","AoA")

%Cy (sideforce) beta
derivativeCalc("Thrust","Vinf20","J16","CY","AoS")
derivativeCalc("Thrust","Vinf20","J20","CY","AoS")
derivativeCalc("Thrust","Vinf40","J16","CY","AoS")
derivativeCalc("Thrust","Vinf40","J20","CY","AoS")

% CM roll alpha
derivativeCalc("Thrust","Vinf20","J16","CMroll","AoA")
derivativeCalc("Thrust","Vinf20","J20","CMroll","AoA")
derivativeCalc("Thrust","Vinf40","J16","CMroll","AoA")
derivativeCalc("Thrust","Vinf40","J20","CMroll","AoA")

%CM roll beta
derivativeCalc("Thrust","Vinf20","J16","CMroll","AoS")
derivativeCalc("Thrust","Vinf20","J20","CMroll","AoS")
derivativeCalc("Thrust","Vinf40","J16","CMroll","AoS")
derivativeCalc("Thrust","Vinf40","J20","CMroll","AoS")

% CM yaw delta_r
derivativeCalc("Derivative","Vinf20","J16","CMyaw","delta_r")
derivativeCalc("Derivative","Vinf20","J20","CMyaw","delta_r")
derivativeCalc("Derivative","Vinf40","J16","CMyaw","delta_r")
derivativeCalc("Derivative","Vinf40","J20","CMyaw","delta_r")

%Cy (sideforce) delta_r
derivativeCalc("Derivative","Vinf20","J16","CY","delta_r")
derivativeCalc("Derivative","Vinf20","J20","CY","delta_r")
derivativeCalc("Derivative","Vinf40","J16","CY","delta_r")
derivativeCalc("Derivative","Vinf40","J20","CY","delta_r")

% CM roll delta_r
derivativeCalc("Derivative","Vinf20","J16","CMroll","delta_r")
derivativeCalc("Derivative","Vinf20","J20","CMroll","delta_r")
derivativeCalc("Derivative","Vinf40","J16","CMroll","delta_r")
derivativeCalc("Derivative","Vinf40","J20","CMroll","delta_r")

%% Plots
figure()
tiledlayout(2,2,"TileSpacing","compact")

nexttile
plotterThrust(Data,"Vinf20","J16","CL","AoS",AngleList)
nexttile
plotterThrust(Data,"Vinf20","J20","CL","AoS",AngleList)
nexttile
plotterThrust(Data,"Vinf40","J16","CL","AoS",AngleList)
nexttile
plotterThrust(Data,"Vinf40","J20","CL","AoS",AngleList)

figure
