function derivativeOrganizer(Vinf,J)

global Data Raw

derivativeAdrress1.Vinf20.J16 = [1 8 9 16];
derivativeAdrress1.Vinf20.J20 = [4 5 12 13];
derivativeAdrress1.Vinf40.J16 = [2 7 10 15];
derivativeAdrress1.Vinf40.J20 = [3 6 11 14];

derivativeAdrress2.Vinf20.J16 = [4 5 12];
derivativeAdrress2.Vinf20.J20 = [1 8 9];
derivativeAdrress2.Vinf40.J16 = [3 6 11];
derivativeAdrress2.Vinf40.J20 = [2 7 10];

delta_r_listUnorg1 = [0 5 10 15];
delta_r_listUnorg2 = [-5 -10 -15];
delta_r = [delta_r_listUnorg1, delta_r_listUnorg2];


temp1 = Raw.DerivativeP(derivativeAdrress1.(Vinf).(J),:);
temp2 = Raw.DerivativeN(derivativeAdrress2.(Vinf).(J),:);

temp = [temp1; temp2];
temp = addvars(temp,delta_r');
temp = renamevars(temp, 'Var33', 'delta_r');

Data.Derivative.(Vinf).(J) = sortrows(temp,'delta_r');
end