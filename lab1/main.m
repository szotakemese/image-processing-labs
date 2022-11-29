img = imread('./1.png');

[minimum, maximum, mean, standart_deviation, variance, snr] = image_statistical_analysis(img);

fprintf("Min - %d\n", minimum);
fprintf("Max - %d\n", maximum);
fprintf("Mean - %d\n", mean);
fprintf("Standart deviation - %d\n", standart_deviation);
fprintf("Variance - %d\n", variance);
fprintf("Signal-to-noise ratio - %d\n", snr);

[x, y] = plot_histogram(img);
bar(x, y);

equalized_img = histogram_equalization(img, x, y);
 
[eq_x, eq_y] = plot_histogram(equalized_img);
bar(eq_x, eq_y);
imwrite(equalized_img, './equalized_image.png');

corrected_image = linear_contrast_correction(img, 160, 60);
imwrite(corrected_image, './corrected_image.png');
