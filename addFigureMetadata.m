function addFigureMetadata(figHandle)
% addFigureMetadata
% Adds standardized metadata annotations to a MATLAB figure.
%
% The following information is added automatically:
%   - Toolset and version (bottom left)
%   - Figure creation date and time in UTC (bottom right)
%
% If no figure handle is provided, the current figure (gcf) is used.
%
% Usage:
%   addFigureMetadata
%   addFigureMetadata(gcf)

    % Use current figure if no handle is provided
    if nargin < 1 || isempty(figHandle)
        figHandle = gcf;
    end

    % Ensure the figure is current
    figure(figHandle);

    % Generate metadata
    creationTime = datestr(datetime('now','TimeZone','UTC'), ...
                           'yyyy-mm-dd HH:MM:ss UTC');
    toolInfo = ['MATLAB ' version];

    % Common annotation properties
    fontSize = 8;
    boxHeight = 0.04;

    % Bottom-left: tool information
    annotation(figHandle, 'textbox', [0.01 0.01 0.45 boxHeight], ...
        'String', ['Generated with ' toolInfo], ...
        'EdgeColor', 'none', ...
        'FontSize', fontSize, ...
        'Interpreter', 'none', ...
        'HorizontalAlignment', 'left');

    % Bottom-right: creation timestamp
    annotation(figHandle, 'textbox', [0.54 0.01 0.45 boxHeight], ...
        'String', ['Created: ' creationTime], ...
        'EdgeColor', 'none', ...
        'FontSize', fontSize, ...
        'Interpreter', 'none', ...
        'HorizontalAlignment', 'right');

end
