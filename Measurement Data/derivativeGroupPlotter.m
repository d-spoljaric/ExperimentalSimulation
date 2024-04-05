function derivativeGroupPlotter(Data,Coeff)
hold on
plot(Data.Derivative.Vinf20.J16.delta_r,Data.Derivative.Vinf20.J16.(Coeff),'LineWidth',0.7,'Marker','o')
plot(Data.Derivative.Vinf20.J20.delta_r,Data.Derivative.Vinf20.J20.(Coeff),'LineWidth',0.7,'Marker','o')
plot(Data.Derivative.Vinf40.J16.delta_r,Data.Derivative.Vinf40.J16.(Coeff),'LineWidth',0.7,'Marker','o')
plot(Data.Derivative.Vinf40.J20.delta_r,Data.Derivative.Vinf40.J20.(Coeff),'LineWidth',0.7,'Marker','o')
hold off
box on
xlabel("$\delta_r\; [^\circ]$",'Interpreter','latex')
ylabel(Coeff,'Interpreter','latex')
legend("$Re_\infty=2.24\times 10^5,\;J=1.6$", ...
       "$Re_\infty=2.24\times 10^5,\;J=2$", ...
       "$Re_\infty=4.46\times 10^5,\;J=1.6$", ...
       "$Re_\infty=4.46\times 10^5,\;J=2$",'Interpreter','latex')
end