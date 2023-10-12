clear;
clc;

baseFilename = 'VSMs_csvs/vsm_matrix_%d_pen_level_%d.csv';

years = 2026:2:2036;
penLevels = 1:10;

dataMatrices = cell(length(years), length(penLevels));

g1 = [];
g2 = [];

for i = 1:length(years)
    for j = 1:length(penLevels)
        filename = sprintf(baseFilename, years(i), penLevels(j));
        
        % Ends up being 6x10 cell
        dataMatrices{i, j} = readmatrix(filename);
        
        % Create grouping variables
        g1 = [g1; repmat(years(i), size(dataMatrices{i, j}, 1) * size(dataMatrices{i, j}, 2), 1)];
        g2 = [g2; repmat(penLevels(j), size(dataMatrices{i, j}, 1) * size(dataMatrices{i, j}, 2), 1)];
        
        % Print information for debugging
        fprintf('Loaded matrix from %s. Size: %dx%d\n', filename, size(dataMatrices{i, j}));
    end
end

% Print grouping variable information
fprintf('Size of g1: %dx1\n', size(g1));
fprintf('Size of g2: %dx1\n', size(g2));

% 14400x1x60 matrix
combinedMatrix = cat(3, dataMatrices{:});

% Save the combined matrix to a CSV file
combinedFilename = 'VSMs_csvs/combined_matrix.csv';
writematrix(combinedMatrix, combinedFilename);

% Group by pen level and year
boxPlot3D(combinedMatrix, g1, g2);
