function filtered_image = filtering(img, kernel)
  flipped_kernel = flip(fliplr(kernel));

  [kernel_size,] = size(kernel);
  
  extended_image = mirror_image(img, kernel_size);
  
  [columns,rows] = size(img);
  
  if kernel_size == 3
    additional_pixels = 1;
  elseif kernel_size == 5
    additional_pixels = 2;
  elseif kernel_size == 7
    additional_pixels = 3;
  end
  
  filtered_image = [];
  
  for i=additional_pixels + 1:rows + additional_pixels
    for j=additional_pixels + 1:columns + additional_pixels
      m = extended_image(i-additional_pixels:i+additional_pixels, j-additional_pixels:j+additional_pixels);
      pixel = sum(sum(flipped_kernel .* double(m)));
      filtered_image(end+1) = pixel;
    end
  end
  
  filtered_image = uint8(reshape(filtered_image, columns, rows)');
end
