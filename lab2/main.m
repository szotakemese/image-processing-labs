img = imread('./1.png');

[minimum, maximum, mean, standart_deviation, variance, snr] = image_statistical_analysis(img);
fprintf("Min - %d\n", minimum);
fprintf("Max - %d\n", maximum);
fprintf("Mean - %d\n", mean);
fprintf("Standart deviation - %d\n", standart_deviation);
fprintf("Variance - %d\n", variance);
fprintf("Signal-to-noise ratio - %d\n", snr);

noised_img = additive_gaussian_noise(img, 0.3);
imwrite(noised_img, "./noised_img_03.png");

kernel = 1/16 * [1 2 1; 2 4 2; 1 2 1];

filtered_img = filtering(noised_img, kernel);
imwrite(filtered_img, "./filtered_03.png");

psnr_noised_and_original = psnr(img, noised_img);
rmse_noised_and_original = rmse(img, noised_img);
fprintf("RMSE between noised & original image - %d\n", rmse_noised_and_original);
fprintf("PSNR between noised & original image - %d\n", psnr_noised_and_original);

psnr_filtered_and_original = psnr(img, filtered_img);
rmse_filtered_and_original = rmse(img, filtered_img);
fprintf("RMSE between filtered & original image - %d\n", rmse_filtered_and_original);
fprintf("PSNR between filtered & original image - %d\n", psnr_filtered_and_original);