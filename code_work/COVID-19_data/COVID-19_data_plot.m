%Initialisation
clc
clear
close all

%Fetching the data
data = webread('https://covid.ourworldindata.org/data/owid-covid-data.csv');

%% 
%Data_adjustments
data.location = categorical(data.location);
date_reported = data.date;
country = data.location;
cases = data.new_cases_smoothed_per_million;
data_1 = table(date_reported, country, cases);

%%
%Segragating the data for individual countries
data_India = (data_1(data_1.country == 'India',:));
data_US = (data_1(data_1.country == 'United States',:));
data_Canada = (data_1(data_1.country == 'Canada',:));
data_Italy = (data_1(data_1.country == 'Italy',:));
data_US(1:9,:) = [];
data_India(1,:) = [];
data_Canada(1:5,:) = [];

%%
%Plotting the data in MATLAB
figure(1);
plot(data_India.date_reported, data_India.cases, 'LineWidth', 2);
hold on
plot(data_US.date_reported, data_US.cases, 'LineWidth', 2);
plot(data_Canada.date_reported, data_Canada.cases, 'LineWidth', 2);
plot(data_Italy.date_reported, data_Italy.cases, 'LineWidth', 2);
hold off
legend('India', 'United States', 'Canada', 'Italy');
title('New Cases of COVID-19');
ylabel('New cases per million')


%%
%Variations - Area plot
figure(2);
area(data_Italy.date_reported, [data_India.cases, data_Canada.cases,... 
    data_US.cases, data_Italy.cases]);
legend('India', 'United States', 'Canada', 'Italy');
title('New Cases of COVID-19');
ylabel('New cases per million');

%%
%Variations - Bar graph
figure(3);
bar(1:733, [data_India.cases, data_Canada.cases,... 
    data_US.cases, data_Italy.cases], 0.5, 'stacked');
legend('India', 'United States', 'Canada', 'Italy');
title('New Cases of COVID-19');
ylabel('New cases per million');
