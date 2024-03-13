clc; clear all; close all;

BAL = importdata("BAL.mat");
PRS = importdata("PRS.mat");



plot(BAL.windOn.wind_on_77.AoA(1:25),BAL.windOn.wind_on_77.CMyaw(1:25), '* ')