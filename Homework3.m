% Read the input image
image = imread('brain.jpg');  % Replace with your image file
image = rgb2gray(image);      % Convert to grayscale if it's RGB

% Define the Laplacian convolution kernel
kernel = [0 -1 0; -1 4 -1; 0 -1 0];

% Convert image to double for precision
image_double = double(image);

% Apply convolution using the Laplacian kernel
result = conv2(image_double, kernel, 'same');

% Display the original and convolved images
figure;
subplot(1, 2, 1);
imshow(image);
title('Original Image');

subplot(1, 2, 2);
imshow(result, []);
title('Laplacian Convolved Image');

% Optional: Calculate and display the SNR for analysis
noise = result - image_double;
signal_power = sum(image_double(:).^2) / numel(image_double);
noise_power = sum(noise(:).^2) / numel(noise);
snr_db = 10 * log10(signal_power / noise_power);
fprintf('Signal-to-Noise Ratio (SNR): %.2f dB\n', snr_db);
