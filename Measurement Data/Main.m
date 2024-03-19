clc; clear all; close all;

BAL = importdata("BAL.mat");
PRS = importdata("PRS.mat");

%%
Raw.WindMilling = data2table(BAL.windOn.wind_on_27);
Raw.Thrust{1} = data2table(BAL.windOn.wind_on_77);
Raw.Thrust{2} = data2table(BAL.windOn.wind_on_127);
Raw.Thrust{3} = data2table(BAL.windOn.wind_on_152);


Raw.WindMilling(49,:) = []; % Adrian Beno!

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

figure
hold on
for i = 1:length(AngleList.AoS.Thrust.Vinf20.J16)
    AoS = AngleList.AoS.Thrust.Vinf20.J16(i);
    plot(Data.Thrust.Vinf20.J16(Data.Thrust.Vinf20.J16.AoS == AoS,:).AoA, ...
         Data.Thrust.Vinf20.J16(Data.Thrust.Vinf20.J16.AoS == AoS,:).CN)
    lgd_list{i} = strcat("$ \alpha=", num2str(AoS),"^\circ$");
end
legend(lgd_list,'Interpreter','latex');

hold off
box on