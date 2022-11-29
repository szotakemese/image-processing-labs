function [x, y] =  plot_histogram (img)
  image_arr_length = length(img(:));

  image_arr = [];

  for i=1:image_arr_length
    image_arr(i) = img(i);
  end
  
  img = image_arr;
  
  img_dict = struct();
  x = 0:255;
  y = [];

  for i=0:255
    img_dict.("i"+int2str(i)) = 0;
  end

  for i=1:length(img)
    field = "i"+num2str(img(i));
    img_dict.(field) =img_dict.(field)+1 ;
  end

  for i=0:255
    y(end+1) = img_dict.("i"+int2str(i));
  end
end