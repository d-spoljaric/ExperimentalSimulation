clc; clear all; close all;

global Data Raw DataCorrected

BAL = importdata("BAL.mat");
PRS = importdata("PRS.mat");

DataCorrected.Thrust.Vinf20.J16 = readtable("corrected_data\thrust_v20_j16_corrected.csv");
DataCorrected.Thrust.Vinf20.J20 = readtable("corrected_data\thrust_v20_j20_corrected.csv");
DataCorrected.Thrust.Vinf40.J16 = readtable("corrected_data\thrust_v40_j16_corrected.csv");
DataCorrected.Thrust.Vinf40.J20 = readtable("corrected_data\thrust_v40_j20_corrected.csv");

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

AngleListCorrected.AoA.Thrust.Vinf40.J16 = unique(DataCorrected.Thrust.Vinf40.J16.AoA);
AngleListCorrected.AoA.Thrust.Vinf40.J20 = unique(DataCorrected.Thrust.Vinf40.J20.AoA);
AngleListCorrected.AoA.Thrust.Vinf20.J20 = unique(DataCorrected.Thrust.Vinf20.J20.AoA);
AngleListCorrected.AoA.Thrust.Vinf20.J16 = unique(DataCorrected.Thrust.Vinf20.J16.AoA);

AngleListCorrected.AoS.Thrust.Vinf40.J16 = unique(DataCorrected.Thrust.Vinf40.J16.AoS);
AngleListCorrected.AoS.Thrust.Vinf40.J20 = unique(DataCorrected.Thrust.Vinf40.J20.AoS);
AngleListCorrected.AoS.Thrust.Vinf20.J20 = unique(DataCorrected.Thrust.Vinf20.J20.AoS);
AngleListCorrected.AoS.Thrust.Vinf20.J16 = unique(DataCorrected.Thrust.Vinf20.J16.AoS);

%% Derivatives

% CL lift alpha
derivativeCalc("Thrust","Vinf20","J16","CL","AoA",AngleListCorrected)
derivativeCalc("Thrust","Vinf20","J20","CL","AoA",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J16","CL","AoA",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J20","CL","AoA",AngleListCorrected)

% CM pitch alpha
derivativeCalc("Thrust","Vinf20","J16","CMpitch","AoA",AngleListCorrected)
derivativeCalc("Thrust","Vinf20","J20","CMpitch","AoA",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J16","CMpitch","AoA",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J20","CMpitch","AoA",AngleListCorrected)

% CM pitch beta
derivativeCalc("Thrust","Vinf20","J16","CMpitch","AoS",AngleListCorrected)
derivativeCalc("Thrust","Vinf20","J20","CMpitch","AoS",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J16","CMpitch","AoS",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J20","CMpitch","AoS",AngleListCorrected)

% CM yaw alpha
derivativeCalc("Thrust","Vinf20","J16","CMyaw","AoA",AngleListCorrected)
derivativeCalc("Thrust","Vinf20","J20","CMyaw","AoA",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J16","CMyaw","AoA",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J20","CMyaw","AoA",AngleListCorrected)

% CM yaw beta
derivativeCalc("Thrust","Vinf20","J16","CMyaw","AoS",AngleListCorrected)
derivativeCalc("Thrust","Vinf20","J20","CMyaw","AoS",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J16","CMyaw","AoS",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J20","CMyaw","AoS",AngleListCorrected)

% Cy (sideforce) alpha
derivativeCalc("Thrust","Vinf20","J16","CY","AoA",AngleListCorrected)
derivativeCalc("Thrust","Vinf20","J20","CY","AoA",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J16","CY","AoA",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J20","CY","AoA",AngleListCorrected)

%Cy (sideforce) beta
derivativeCalc("Thrust","Vinf20","J16","CY","AoS",AngleListCorrected)
derivativeCalc("Thrust","Vinf20","J20","CY","AoS",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J16","CY","AoS",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J20","CY","AoS",AngleListCorrected)

% CM roll alpha
derivativeCalc("Thrust","Vinf20","J16","CMroll","AoA",AngleListCorrected)
derivativeCalc("Thrust","Vinf20","J20","CMroll","AoA",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J16","CMroll","AoA",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J20","CMroll","AoA",AngleListCorrected)

%CM roll beta
derivativeCalc("Thrust","Vinf20","J16","CMroll","AoS",AngleListCorrected)
derivativeCalc("Thrust","Vinf20","J20","CMroll","AoS",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J16","CMroll","AoS",AngleListCorrected)
derivativeCalc("Thrust","Vinf40","J20","CMroll","AoS",AngleListCorrected)

% CM yaw delta_r
derivativeCalcDeri("Derivative","Vinf20","J16","CMyaw","delta_r",AngleList)
derivativeCalcDeri("Derivative","Vinf20","J20","CMyaw","delta_r",AngleList)
derivativeCalcDeri("Derivative","Vinf40","J16","CMyaw","delta_r",AngleList)
derivativeCalcDeri("Derivative","Vinf40","J20","CMyaw","delta_r",AngleList)

%Cy (sideforce) delta_r
derivativeCalcDeri("Derivative","Vinf20","J16","CY","delta_r",AngleList)
derivativeCalcDeri("Derivative","Vinf20","J20","CY","delta_r",AngleList)
derivativeCalcDeri("Derivative","Vinf40","J16","CY","delta_r",AngleList)
derivativeCalcDeri("Derivative","Vinf40","J20","CY","delta_r",AngleList)

% CM roll delta_r
derivativeCalcDeri("Derivative","Vinf20","J16","CMroll","delta_r",AngleList)
derivativeCalcDeri("Derivative","Vinf20","J20","CMroll","delta_r",AngleList)
derivativeCalcDeri("Derivative","Vinf40","J16","CMroll","delta_r",AngleList)
derivativeCalcDeri("Derivative","Vinf40","J20","CMroll","delta_r",AngleList)

%% Plots
thrustGroupPlotter(DataCorrected,"CMyaw","AoA",AngleListCorrected) % CM yaw AoA
thrustGroupPlotter(DataCorrected,"CMyaw","AoS",AngleListCorrected) % CM yaw AoS
thrustGroupPlotter(DataCorrected,"CY","AoA",AngleListCorrected) % CY AoA
thrustGroupPlotter(DataCorrected,"CY","AoS",AngleListCorrected) % CY AoS
thrustGroupPlotter(DataCorrected,"CMroll","AoA",AngleListCorrected) % CMroll AoA
thrustGroupPlotter(DataCorrected,"CMroll","AoS",AngleListCorrected) % CMroll AoS

%%
thrustGroupPlotter(DataCorrected,"CMyawAoS","AoS",AngleListCorrected) % CM yaw AoS
thrustGroupPlotter(DataCorrected,"CYAoS","AoS",AngleListCorrected) % CY AoS
thrustGroupPlotter(DataCorrected,"CMrollAoS","AoS",AngleListCorrected) % CMroll AoS
%%
figure()
tiledlayout(2,3,'TileSpacing','tight')
nexttile
derivativeGroupPlotter(Data,"CMyaw")
nexttile
derivativeGroupPlotter(Data,"CMroll")
nexttile
derivativeGroupPlotter(Data,"CY")
nexttile
derivativeGroupPlotter(Data,"CMyawdelta_r")
nexttile
derivativeGroupPlotter(Data,"CMrolldelta_r")
nexttile
derivativeGroupPlotter(Data,"CYdelta_r")
