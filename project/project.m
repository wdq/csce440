
% CSV data files
% Format: Counter, SHT31-D temperature, BMP180 temperature, DHT22 temperature
% As of right now I'm just going off of the SHT31-D's data.
% The sensor readings could be averaged instead.
% All units are degrees C. Null values (sensor read failed) are -1.
% There is approximately 2.5 minutes between each data point

% Data from a single day: 2017-11-24
day_data = csvread('csce440-2017-11-24.csv');

% Data from a week: 2017-11-18 through 2017-11-24
week_data = csvread('csce440-2017-11-24-week.csv');

% Create vectors of the actual data (index counter, and sht31 temp)    
day_data_index = zeros(size(day_data, 1), 1);
day_data_sht31 = zeros(size(day_data, 1), 1);

% Copy the values from the array to the vectors
for arrayRowCount = 1:size(day_data, 1)
    day_data_index(arrayRowCount) = day_data(arrayRowCount, 1);
    day_data_sht31(arrayRowCount) = day_data(arrayRowCount, 2);
end

% Remove every other data point from the vectors
% Used to compare the interpolation with the actual
% known values that were removed.
day_data_index_filtered = day_data_index;
day_data_sht31_filtered = day_data_sht31;
day_data_index_filtered(2:2:end,:) = [];
day_data_sht31_filtered(2:2:end,:) = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Using Lagrange Polynomial Interpolation
% Doesn't work well at all. 
% It takes several minutes to process.
% The numbers used for the calculation match, but the other numbers don't.
% Because there are so many data points a really high degree polynomial is
% generated with lots of extreme features that don't match the actual data.
% I'll probably use this as an example of a method that doesn't work very
% well for my data.

%day_lagrange = LagrangeInterpolation(day_data_index_filtered, day_data_sht31_filtered)
%day_data_sht31_lagrange = zeros(size(day_data, 1), 1);

%for arrayRowCount = 1:size(day_data, 1)
%    day_data_sht31_lagrange(arrayRowCount) = subs(day_lagrange, day_data_index(arrayRowCount));
%end

%scatter(day_data_index, day_data_sht31);
%hold on;
%scatter(day_data_index, day_data_sht31_lagrange);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Using Piecewise Linear Interpolation
% Works really well.
% It's pretty quick to process, and the difference in real vs. actual
% values is usually under a quarter of a degree, which is less than the
% precision of most temperature sensors. 
% Quick oscillations in temperature seem to cause the accuracy to decrease
% the most.

piecewise_linear = PiecewiseLinearInterpolation(day_data_index_filtered, day_data_sht31_filtered, day_data_index);

difference = abs(day_data_sht31 - piecewise_linear);

scatter(day_data_index, day_data_sht31);
hold on;
scatter(day_data_index, piecewise_linear);
hold on;
scatter(day_data_index, difference);
