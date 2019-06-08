function  rsvpvid(folder, vidName, speed)

%Creates rapid serial visual presentation (RSVP) video stream
%folder - the file path of the image folder
%vidName - the filename for the final video
%speed - how fast you want each image presented (i.e., frames per second). Default is 10 (100 ms).
%
%Example RSVP vid at ~70ms per image:
%RSVPVid('vayzenb/Stimuli/', 'exampleVid', 14)
%
%Created by Vlad Ayzenberg
%6.4.19

if exist('speed','var') == 0
	speed = 10
end

%pull files from filePath
%Change filetype if necessary
ImgDir = [dir([folder '*.jpg']); dir([folder '*.tif']); dir([folder '*.png']); dir([folder '*.bmp'])];

%Randomize image order
ImgDir = ImgDir(randperm(length(ImgDir)));


outputVideo = VideoWriter([vidName, '.avi']);
outputVideo.FrameRate = speed;
open(outputVideo)

%Iterate through images and write to video
for ii = 1:length(ImgDir)
	img = imread([folder, ImgDir(ii).name]);    
	writeVideo(outputVideo,img)
end

close(outputVideo)