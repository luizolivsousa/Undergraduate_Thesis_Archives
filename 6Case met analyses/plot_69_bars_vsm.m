clear;

% Specify the file path
file_path = 'VSMs_by_voltage_csvs/69_bars_vsm.csv';

% Read the CSV file into a table
matlabTable = readtable(file_path);

% Convert the table to a matrix
matlabMatrix = table2array(matlabTable);

% Create x and y vectors
x = 1:size(matlabMatrix, 2);
y = 1:size(matlabMatrix, 1);

% Create a 3D bar plot
figure;
bar3(matlabMatrix);

% Customize the plot
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('3D Bar Plot Example');

% Add color map
colormap('parula');

% Add color bar
colorbar;

% Adjust the view
view(45, 30);  % You can adjust the view angle as needed
