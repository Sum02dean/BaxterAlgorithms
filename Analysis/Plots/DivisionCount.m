function DivisionCount(aCells, aFigure)
% Plots the cumulative number of cell divisions as a function of time.
%
% The division count is normalized to percent of the starting population.
% Each experimental condition is plotted in a different color. The function
% PrintStyle is called to make the plotting style consistent with other
% plots.
%
% Inputs:
% aCells - Array of Cell objects.
% aFigure - Figure to plot in.
%
% See also:
% LiveCount, DeadCount, SurvivingCount, PlotGUI, PrintStyle

[numFrames, t] = TimeSpan(aCells);

% Group the cells by experimental condition.
[pCellVec, pLabels] = PartitionCells(aCells, 'condition');

% Create axes to plot in.
ax = axes('Parent', aFigure);

maxValue = 0;  % Maximum y-value plotted (used to set limits).
for p = 1:length(pCellVec)
    % Count the number of divisions and cells.
    numberOfDivisions = zeros(numFrames, 1);
    numberOfCells = zeros(numFrames, 1);
    for i = 1:length(pCellVec{p})
        c = pCellVec{p}(i);
        ff = c.firstFrame;
        lf = c.lastFrame;
        % Increase the cell count.
        numberOfCells(ff:lf) = numberOfCells(ff:lf) + 1;
        if c.divided
            % Increase the division count.
            numberOfDivisions(lf+1:end) = numberOfDivisions(lf+1:end) + 1;
        end
    end
    
    % Normalize to 100 starting cells.
    numberOfDivisions = numberOfDivisions / numberOfCells(1) * 100;
    maxValue = max(maxValue, max(numberOfDivisions));
    
    plot(ax, t, numberOfDivisions)
    hold(ax, 'all')
end

xlim(ax, [t(1) t(end)])
ylim(ax, [0 1.1*max(maxValue,1)])

xlabel(ax, 'Time (hours)')
ylabel(ax, 'Normalized division count')
legend(ax, pLabels, 'Location', 'northwest')

PrintStyle(ax)
end