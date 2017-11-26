
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


plot(day_data_index, day_data_sht31)
