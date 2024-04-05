function thrustGroupPlotter(Data,Y,X,AngleList)
figure()
tiledlayout(2,2,"TileSpacing","tight")

nexttile
plotterThrust(Data,"Vinf20","J16",Y,X,AngleList)
nexttile
plotterThrust(Data,"Vinf20","J20",Y,X,AngleList)
nexttile
plotterThrust(Data,"Vinf40","J16",Y,X,AngleList)
nexttile
plotterThrust(Data,"Vinf40","J20",Y,X,AngleList)

end