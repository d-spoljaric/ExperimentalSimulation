function derivativeCalc(DataCat,Vinf,J,topVar,BotVar,AngleList)

global DataCorrected 

varName = append(topVar,BotVar);

if BotVar == "AoA"
    AoSList = AngleList.AoS.Thrust.(Vinf).(J);
%     AoSList = [-4 0 3 7 10];
    for i = 1:length(AoSList)
        DataAoSOrdered.(DataCat).(Vinf).(J).(append("AoS",num2str(i))) = DataCorrected.(DataCat).(Vinf).(J)(DataCorrected.(DataCat).(Vinf).(J).AoS == AoSList(i),:);
        DataAoSOrdered.(DataCat).(Vinf).(J).(append("AoS",num2str(i))).temp = gradient(DataAoSOrdered.(DataCat).(Vinf).(J).(append("AoS",num2str(i))).(topVar), deg2rad(DataAoSOrdered.(DataCat).(Vinf).(J).(append("AoS",num2str(i))).AoA));
        for j = 1:25
            for k = 1:length(AoSList)
                if AoSList(i) == DataCorrected.(DataCat).(Vinf).(J).AoS(j) && DataAoSOrdered.(DataCat).(Vinf).(J).(append("AoS",num2str(i))).AoA(k) == DataCorrected.(DataCat).(Vinf).(J).AoA(j)
                    DataCorrected.(DataCat).(Vinf).(J).(varName)(j) = DataAoSOrdered.(DataCat).(Vinf).(J).(append("AoS",num2str(i))).temp(k);
                end
            end
        end
    end
elseif BotVar == "AoS"
    AoAList = AngleList.AoA.Thrust.(Vinf).(J);
    for i = 1:length(AoAList)
        DataAoAOrdered.(DataCat).(Vinf).(J).(append("AoA",num2str(i))) = DataCorrected.(DataCat).(Vinf).(J)(DataCorrected.(DataCat).(Vinf).(J).AoA == AoAList(i),:);
        DataAoAOrdered.(DataCat).(Vinf).(J).(append("AoA",num2str(i))).temp = gradient(DataAoAOrdered.(DataCat).(Vinf).(J).(append("AoA",num2str(i))).(topVar), deg2rad(DataAoAOrdered.(DataCat).(Vinf).(J).(append("AoA",num2str(i))).AoS));
        for j = 1:25
            for k = 1:length(AoAList)
                if AoAList(i) == DataCorrected.(DataCat).(Vinf).(J).AoA(j) && DataAoAOrdered.(DataCat).(Vinf).(J).(append("AoA",num2str(i))).AoS(k) == DataCorrected.(DataCat).(Vinf).(J).AoS(j)
                    DataCorrected.(DataCat).(Vinf).(J).(varName)(j) = DataAoAOrdered.(DataCat).(Vinf).(J).(append("AoA",num2str(i))).temp(k);
                end
            end
        end
    end
elseif BotVar == "delta_r"
    DataCorrected.(DataCat).(Vinf).(J).(varName) = gradient(DataCorrected.(DataCat).(Vinf).(J).(topVar),deg2rad(DataCorrected.(DataCat).(Vinf).(J).delta_r));
end

end