% Create noised image
% img = imread("./1.png");
% noised_image = impulse_noise(img, "salt-and-pepper", 0.2);
% imwrite(noised_image, "./salt_and_pepper_02.png");
% 
% Filter image
% img = imread("./salt_and_pepper_01.png");
% filtered_img = median_filtering(img, 2, 5);
% imwrite(filtered_img, "./filtered_salt_and_pepper_01_r2_s5.png");

% Measure PSNR and RMSE
% initial_img = imread("./1.png");
% filtered_img = imread("./filtered_salt_and_pepper_01_r6_s15.png");
% fprintf("PSNR: %d\n", peaksnr(initial_img, filtered_img));
% fprintf("RMSE: %d\n", rmse(initial_img, filtered_img));