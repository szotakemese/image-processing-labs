initial_img = imread("./1.png");

noised_img = additive_gaussian_noise(initial_img, 0.5);
imwrite(noised_img, "./noised.png");

ev_filtered_img = ev_filtering(noised_img);
imwrite(ev_filtered_img, "./ev_filtered.png");

kernel = 1/16 * [1 2 1; 2 4 2; 1 2 1];

linear_filtered_img = linear_filtering(noised_img, kernel);
imwrite(linear_filtered_img, "./linear_filtered.png");

fprintf("RMSE between EV filtered & original image - %d\n", rmse(initial_img, ev_filtered_img));
fprintf("PSNR between EV filtered & original image - %d\n", psnr(initial_img, ev_filtered_img));

fprintf("RMSE between linear filtered & original image - %d\n", rmse(initial_img, linear_filtered_img));
fprintf("PSNR between linear filtered & original image - %d\n", psnr(initial_img, linear_filtered_img));