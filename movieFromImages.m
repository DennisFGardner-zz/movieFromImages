%% MAIN 
% movieFromImages.m
%
% created: 01/15/2017
% author: Dennis F. Gardner
%
% Goal: creat a movie from separate images (timelapse) 
function movieFromImages

% path to directory containing the images (nothing else in directory)
path2dir = 'C:\Users\Gardner\Documents\GitHub\movieFromImages\images';

% get all the file names inside the specified directory 
[fileNames,L] = getFileNames(path2dir);

% prepare to make a video file
writerObj = VideoWriter('timelapse.avi');
writerObj.FrameRate = 15;
open(writerObj);

% create a handle to the figure
hfig = figure('name','Displaying Each Movie Frame','color','w');
imshow([path2dir,'\',fileNames{1}]); 
axis image;
set(gca,'nextplot','replacechildren');
set(gcf,'Renderer','zbuffer');


for ii = 1: 10,
    imshow([path2dir,'\',fileNames{ii}]);
    axis image
    frame = getframe(hfig);
    writeVideo(writerObj,frame);
end
% 
close(writerObj);





end













%% Sub-functions
function [fileNames,L] = getFileNames(pathName)
% getFileNames - Creates a cell array of the filenames from the directory
% spefified by the pathname. Does not include the "." or the "..".
%
% Syntax:  [ fileNames ] = function_name( pathName )
%
% Inputs:
%    pathName - a string that inculdes the full path to the directory
%
% Outputs:
%    fileNames - a cell srting array containng the name of each file in
%                the directory
%
% Example: 
%    pathName = 'C:\Users\Dennis Gardner\Documents\2013_KM3\2013_10_17_reflectionModeData\2013_10_15_samsungSilicon\Set 6\converted_s6\scan';
%    fileNames=getFileNames(pathName);
%    disp(fileNames{1});
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: processPtychScan

% Author: Dennis Gardner, Ph.D. canidate
% JILA, Dept. of Physics, 440 UCB, Boulder, CO 80309
% email address: dennis.gardner@colorado.edu 
% Website: http://jila.colorado.edu/kmgroup/
% June 2013; Last revision: 18-Oct-2013

listing = dir(pathName);

L = length(listing);

fileNames=cell(L-2,1);

for x=3:L

   fileNames{x-2} = listing(x,1).name;

end

end

