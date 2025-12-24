% Create a grid
[x, y] = meshgrid(linspace(-5,5,100), linspace(-5,5,100));

% Define an arbitrary 3D function
z = sin(x).*cos(y) + 0.1*(x.^2 + y.^2);

% Create 3D contour plot
figure
contour3(x, y, z, 20)
grid on
xlabel('X')
ylabel('Y')
zlabel('Z')
title('Arbitrary 3D Contour Plot')

% Add standardized figure metadata (visible on MATLAB figure)
addFigureMetadata;

% ---- Metadata for export (authoritative) ----
metadata.created_at = datestr(datetime('now','TimeZone','UTC'), ...
                              'yyyy-mm-dd HH:MM:ss UTC');
metadata.tool = ['MATLAB ' version];

% ---- Export data for HTML / Plotly ----
plotData.X = x;
plotData.Y = y;
plotData.Z = z;
plotData.metadata = metadata;

fid = fopen('contourData.json','w');
fprintf(fid, '%s', jsonencode(plotData));
fclose(fid);
