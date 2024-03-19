function plotterThrust(Data,Vinf,J,Coeff,Angle,HoldAngleList)

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
hold off
box on