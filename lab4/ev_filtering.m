function filtered_image = ev_filtering (image)
  mirrored_image = mirror_image(image, 3);
  
  image_size = size(image);
  columns = image_size(1);
  rows = image_size(2);
  
  [minimum, maximum, img_mean, standart_deviation, variance, snr] = image_statistical_analysis(image);

  filtered_image = [];
  
  for i = 1 + 1:columns + 1
    for j = 1 + 1:rows + 1
      
      pixels = mirrored_image(i, j);
           
      variational_series = sort(reshape(mirrored_image(i-1:i+1, j-1:j+1), 9, 1));
      ev = variational_series(abs(pixels - variational_series) <= standart_deviation);
      ev_mean = round(mean(ev));
      
      filtered_image(end+1) = ev_mean;
    end
  end
  
  filtered_image = uint8(reshape(filtered_image, columns, rows)');
end
