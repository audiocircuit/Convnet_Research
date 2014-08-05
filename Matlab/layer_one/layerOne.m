clc;
clear;
% test for input file
input_file = ones(224,224,3);

% zero pad the input file
input_matrix = zeros(227,227,3);
for x = 1:224
    for y = 1:224
        for z = 1:3
            input_matrix(x,y,z) = input_file(x,y,z);
        end
    end
end

% computing the inner_product for the input image
conv_matrix = zeros(55,55,96);
filters = ones(11,11,3,96);

ROI_x_offset = 1;
ROI_y_offset = 1;

for z = 1:96
    for x = 1:55
        for y = 1:55
            conv_matrix(x,y,z) = inner_product(filters(:,:,:,z),input_matrix(ROI_x_offset:ROI_x_offset+10,ROI_y_offset:ROI_y_offset+10,:));
            if(ROI_x_offset<216)
                ROI_x_offset = ROI_x_offset + 4;
            else
                if(ROI_y_offset<216)
                    ROI_y_offset = ROI_y_offset + 4;
                    ROI_x_offset = 1;
                end
            end
        end
    end
end
 
k = 2;
n = 5;
alpha = 10e-4;
beta = .75;
N = 96;




for z = 1:96
    for x = 1:55
        for y = 55
            normalized_matrix(x,y,z) = conv_matrix(x,y,z) 
        end
    end
end