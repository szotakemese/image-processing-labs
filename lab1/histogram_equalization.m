function equalized_img = histogram_equalization (img, x, y)
  image_arr_length = length(img(:));
  
  columns = length(img);
  rows = image_arr_length / columns;
  
  image_arr = [];
  for i=1:image_arr_length
    image_arr(i) = img(i);
  end
  
  img = image_arr;
  
  cdf = [];
  sum = 0;
  for i=1:255
    sum =  sum + y(i);
    cdf(i) = sum;
  end
  
  cdf_min = 0;
  
  for i=1:length(cdf)
    if (cdf(i) ~= 0)
      cdf_min = cdf(i);
      break
    end
  end
  
  contrasts_map = struct();
  field_zero = "i0";
  contrasts_map.(field_zero) = 0;
  
  for i=1:255
    contrasts_map.("i"+int2str(i)) = round(((cdf(i) - cdf_min) / (length(img) - cdf_min)) * 255);
  end
  
  equalized_img = [];
  
  for i=1:length(img)
    equalized_img(i) = contrasts_map.("i"+int2str(img(i)));
  end
  
  equalized_img = uint8(reshape(equalized_img, columns, rows));
end
