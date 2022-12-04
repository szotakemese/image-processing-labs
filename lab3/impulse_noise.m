function noised_image = impulse_noise(img, noise_type, corruption_rate)
  noised_image = [];
  
  img_size = size(img);
  columns = img_size(1);
  rows = img_size(2);
  
  if strcmp(noise_type, "random") == 1
    min_intensity = 0;
    max_intensity = 255;
    
    for i=1:rows
      for j=1:columns
        
        if rand <= corruption_rate
          noised_image(end+1) = randi([min_intensity, max_intensity]);
        else
          noised_image(end+1) = img(i, j);
        end
        
      end
    end
    
  elseif strcmp(noise_type, "salt-and-pepper") == 1
    corruption_rate = corruption_rate/2;
    
    for i=1:rows
      for j=1:columns
        
        if rand <= corruption_rate
          noised_image(end+1) = 0;
        elseif rand <= corruption_rate
          noised_image(end+1) = 255;
        else
          noised_image(end+1) = img(i, j);
        end
          
      end
    end
    
  else
    error("Not recognized type of noise");
  end

  noised_image = uint8(reshape(noised_image, columns, rows)');
end