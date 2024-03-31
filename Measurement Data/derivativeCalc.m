function derivativeCalc(DataCat,Vinf,J,topVar,BotVar)

global Data

varName = append(topVar,BotVar);

if BotVar == "AoA"
    AoSList = [-4 0 3 7 10];
    for i = 1:length(AoSList)
        DataAoSOrdered.(DataCat).(Vinf).(J).(append("AoS",num2str(i))) = Data.(DataCat).(Vinf).(J)(Data.(DataCat).(Vinf).(J).AoS == AoSList(i),:);
        DataAoSOrdered.(DataCat).(Vinf).(J).(append("AoS",num2str(i))).temp = gradient(DataAoSOrdered.(DataCat).(Vinf).(J).(append("AoS",num2str(i))).(topVar), deg2rad(DataAoSOrdered.(DataCat).(Vinf).(J).(append("AoS",num2str(i))).AoA));
        for j = 1:25
            for k = 1:length(AoSList)
                if AoSList(i) == Data.(DataCat).(Vinf).(J).AoS(j) && DataAoSOrdered.(DataCat).(Vinf).(J).(append("AoS",num2str(i))).AoA(k) == Data.(DataCat).(Vinf).(J).AoA(j)
                    Data.(DataCat).(Vinf).(J).(varName)(j) = DataAoSOrdered.(DataCat).(Vinf).(J).(append("AoS",num2str(i))).temp(k);
                end
            end
        end
    end
elseif BotVar == "AoS"
    AoAList = [-3 0 3 6 10];
    for i = 1:length(AoAList)
        DataAoAOrdered.(DataCat).(Vinf).(J).(append("AoA",num2str(i))) = Data.(DataCat).(Vinf).(J)(Data.(DataCat).(Vinf).(J).AoA == AoAList(i),:);
        DataAoAOrdered.(DataCat).(Vinf).(J).(append("AoA",num2str(i))).temp = gradient(DataAoAOrdered.(DataCat).(Vinf).(J).(append("AoA",num2str(i))).(topVar), deg2rad(DataAoAOrdered.(DataCat).(Vinf).(J).(append("AoA",num2str(i))).AoS));
        for j = 1:25
            for k = 1:length(AoAList)
                if AoAList(i) == Data.(DataCat).(Vinf).(J).AoA(j) && DataAoAOrdered.(DataCat).(Vinf).(J).(append("AoA",num2str(i))).AoS(k) == Data.(DataCat).(Vinf).(J).AoS(j)
                    Data.(DataCat).(Vinf).(J).(varName)(j) = DataAoAOrdered.(DataCat).(Vinf).(J).(append("AoA",num2str(i))).temp(k);
                end
            end
        end
    end
elseif BotVar == "delta_r"
    Data.(DataCat).(Vinf).(J).(varName) = gradient(Data.(DataCat).(Vinf).(J).(topVar),Data.(DataCat).(Vinf).(J).delta_r);
end
end