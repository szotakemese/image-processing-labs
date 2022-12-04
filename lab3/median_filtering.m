function filtered_image = median_filtering(img, r, s)
  extended_image = mirror_image(img, 3);
  filtered_image = [];
  
  image_size = size(extended_image);
  columns = image_size(1);
  rows = image_size(2);
  
  for i=2:rows-1
    for j=2:columns-1
      
      variational_series = sort(reshape(extended_image(i-1:i+1, j-1:j+1), 9, 1));
      med = variational_series(5);
      
      pixel_of_interest = extended_image(i, j);
      
      search_pixel = pixel_of_interest == variational_series;
      for k=1:9
        if search_pixel(k) == 1
          rank = k;
          break
        end
      end
      
      if any(pixel_of_interest == variational_series(1:r))
        d_xy = variational_series(rank+1) - pixel_of_interest;
      elseif any(pixel_of_interest == variational_series(end-r:end))
        d_xy = pixel_of_interest - variational_series(rank-1);
      else
        d_xy = 0;
      end
      
      if (d_xy >= s)
        filtered_image(end+1) = med;
      else
        filtered_image(end+1) = pixel_of_interest;
      end

    end
  end
  
  filtered_image = uint8(reshape(filtered_image, columns-2, rows-2)');
end