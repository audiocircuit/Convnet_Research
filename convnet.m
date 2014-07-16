clear;
clc;
%clf;

%=================Read In 256x256 Image========================
image_size = 256;
image_depth = 3;
sample_size = 11;
array_placement = 0;

test_image  = imread('image.jpg');

%=================Read in small test image====================
% image_size = 6;
% image_depth = 3;
% sample_size = 4;
% array_placement = 0;
% 
% test_image = randn(image_size, image_size, image_depth)

%figure(1)
%imshow(test_image)

%=================Seperate Red Layer===========================
% red_layer   = test_image(:,:,1);            % Seperates Red Layer
% blank_image = zeros(size(red_layer));
% red_image   = cat(3, red_layer, blank_image, blank_image);  % Must combine image into 3 dimmensional array before displaying
% %figure(2)
% %imshow(red_image)
% 
% %=================Seperate Green Layer=========================
% green_layer  = test_image(:,:,2);           % Seperates Green Layer
% green_image   = cat(3, blank_image, green_layer, blank_image);  % Must combine image into 3 dimmensional array before displaying
% %figure(3)
% %imshow(green_image)
% 
% %=================Seperate Blue Layer==========================
% blue_layer = test_image(:,:,3);             % Seperates Blue Layer
% blue_image   = cat(3, blank_image, blank_image, blue_layer);    % Must combine image into 3 dimmensional array before displaying
% %figure(4)
% %imshow(blue_image)

%===================Initilizations===============================
sections = zeros(sample_size, sample_size, image_depth);

%=======Obtain 5 224x224 images from the 256x256 Red Image=====
for k = 1:3
    for i = 0:1
        for j = 0:1
            
            array_placement = array_placement + 1;
            
            
            start_pixel_x = i*(image_size-sample_size)+1;
            start_pixel_y = j*(image_size-sample_size)+1;
        
            sections(:,:,array_placement) = test_image(start_pixel_x : start_pixel_x + (sample_size-1), start_pixel_y : start_pixel_y + (sample_size-1),k);
        
           fprintf('x: %d y: %d z: %d\n', start_pixel_x, start_pixel_y, k);
        end
    end
    
    array_placement = array_placement + 1;
    
    start_pixel_x = (image_size - sample_size)/2 + 1;
    start_pixel_y = (image_size - sample_size)/2 + 1;
    
    sections(:,:,array_placement) = test_image(start_pixel_x : start_pixel_x + (sample_size-1), start_pixel_y : start_pixel_y + (sample_size-1),k);
    
    fprintf('x: %d y: %d z: %d\n', start_pixel_x, start_pixel_y, k);
    
end

sections_flipped = flip(sections,2);

sections
fprintf('===============================================');
fprintf('===============================================');
fprintf('===============================================');
sections_flipped