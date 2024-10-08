function result = logTransformImage(image, c)
    image = im2double(image);
    result = zeros(size(image), 'uint8');
    vectorized_image = numel(image);

    for i = 1 : vectorized_image
        X = image(i);
        result(i) = 255 * c*log(1 + X);
    end
end