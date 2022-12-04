function psnr = peaksnr(I1, I2)
  img_size = size(I1);
  columns = img_size(1);
  rows = img_size(2);
  
  squaredErrorImage = (double(I1) - double(I2)) .^ 2;
  mse = sum(sum(squaredErrorImage)) / (rows * columns);
  
  psnr = 10 * log10(255 ^ 2 / mse);
end