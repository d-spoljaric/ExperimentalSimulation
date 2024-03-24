function CMalphaCalc(ThrustOrWindmill,Vinf,J)

global Data

AoSList = [-4 0 3 7 10];

for i = 1:length(AoSList)
    DataAoSOrdered.(ThrustOrWindmill).(Vinf).(J).(append("AoS",num2str(i))) = Data.(ThrustOrWindmill).(Vinf).(J)(Data.(ThrustOrWindmill).(Vinf).(J).AoS == AoSList(i),:);
    DataAoSOrdered.(ThrustOrWindmill).(Vinf).(J).(append("AoS",num2str(i))).CMalpha = gradient(DataAoSOrdered.(ThrustOrWindmill).(Vinf).(J).(append("AoS",num2str(i))).CMpitch, deg2rad(DataAoSOrdered.(ThrustOrWindmill).(Vinf).(J).(append("AoS",num2str(i))).AoA));
    for j = 1:25
        for k = 1:length(AoSList)
            if AoSList(i) == Data.(ThrustOrWindmill).(Vinf).(J).AoS(j) && DataAoSOrdered.(ThrustOrWindmill).(Vinf).(J).(append("AoS",num2str(i))).AoA(k) == Data.(ThrustOrWindmill).(Vinf).(J).AoA(j)
                Data.(ThrustOrWindmill).(Vinf).(J).CMalpha(j) = DataAoSOrdered.(ThrustOrWindmill).(Vinf).(J).(append("AoS",num2str(i))).CMalpha(k);
            end
        end
    end
end
end