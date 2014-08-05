function conv_value = inner_product(ROI,K) 
conv_value = 0;
for x = 1:11
   for y = 1:11
       for z = 1: 3
            conv_value = conv_value + ROI(x,y,z)*K(x,y,z);
       end
   end
end
