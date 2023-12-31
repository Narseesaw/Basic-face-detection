clear
clc

img = imread(imgetfile); 

faceDetector = vision.CascadeObjectDetector();

% Detect faces
bbox = step(faceDetector, img);

detectedImg = insertShape(img, 'Rectangle', bbox, 'LineWidth', 10);

for i = 1:size(bbox, 1)
    face = imcrop(img, bbox(i, :));
end

montage({img,detectedImg, face},'Size',[1 3])

title('Original Image, Detected Faces and cut faces');
