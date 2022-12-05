function [minimum, maximum, mean, standart_deviation, variance, snr] = image_statistical_analysis(img)
  image_arr_length = length(img(:));

  image_arr = [];

  for i=1:image_arr_length
    image_arr(i) = img(i);
  end
  
  img = image_arr;
  
  img_length = length(img);
  
  img_min = img(1);
  img_max = img(1);
  img_sum = 0;
  for i=1:img_length
    if (img_min > img(i))
      img_min = img(i);
    end
    
    if (img_max < img(i))
      img_max = img(i);
    end
    
    img_sum = img_sum + img(i);
  end
  
  minimum = img_min;
  maximum = img_max;
  mean = img_sum / length(img);
  
  distance = 0;
  for i=1:img_length
    distance = distance + (img(i) - mean) ^ 2;
  end
  
  standart_deviation = sqrt(distance / img_length);
  variance = distance / img_length;
  snr = mean / standart_deviation;
end
