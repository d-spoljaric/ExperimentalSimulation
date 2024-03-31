function plotterThrust(Data,Vinf,J,Coeff,Angle,HoldAngleList)

if Vinf == "Vinf20"
    V = 20;
elseif Vinf == "Vinf40"
    V = 40;
end

if J == "J16"
    J_ = 1.6;
elseif J == "J20"
    J_ = 2;
end

if Angle == "AoA"
    HoldAngle = "AoS";
elseif Angle == "AoS"
    HoldAngle = "AoA";
end

hold on
for i = 1:length(HoldAngleList.(HoldAngle).Thrust.(Vinf).(J))
    holdValue = HoldAngleList.(HoldAngle).Thrust.(Vinf).(J)(i);
    plot(Data.Thrust.(Vinf).(J)(Data.Thrust.(Vinf).(J).(HoldAngle) == holdValue,:).(Angle), ...
         Data.Thrust.(Vinf).(J)(Data.Thrust.(Vinf).(J).(HoldAngle) == holdValue,:).(Coeff))
    if Angle == "AoA"
        legendAngle = "\beta";
        xlabelAngle = "\alpha";
    elseif Angle == "AoS"
        legendAngle = "\alpha";
        xlabelAngle = "\beta";
    end
    lgd_list{i} = strcat("$",legendAngle,"=", num2str(holdValue),"^\circ$");
end

legend(lgd_list,'Interpreter','latex');
xlabel(append("$",xlabelAngle,"\;[^\circ]$"),'Interpreter','latex')
ylabel(Coeff,'Interpreter','latex')
titleString = append("$V_{\infty} =",num2str(V),",\; J=",num2str(J_),"$");
title(titleString,'Interpreter','latex')

hold off
box on