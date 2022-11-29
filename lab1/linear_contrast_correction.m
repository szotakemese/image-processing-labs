function corrected_image = linear_contrast_correction(img, new_mean, new_sd)
  image_arr_length = length(img(:));
  
  columns = length(img);
  rows = image_arr_length / columns;
  
  image_arr = [];
  for i=1:image_arr_length
    image_arr(i) = img(i);
  end
  
  img = image_arr;
  
  old_mean = sum(img) / length(img);
  old_std = std(img);
  
  corrected_image = [];
  for i=1:length(img)
    corrected_image(end+1) = round(img(i) * new_sd / old_std + (new_mean - old_mean * new_sd / old_std));
  end
  
  corrected_image = uint8(reshape(corrected_image, columns, rows));
end
