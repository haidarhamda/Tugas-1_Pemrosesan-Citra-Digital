function result = powerTransformImage(image, c, y)
    image = im2double(image);
    result = zeros(size(image), 'uint8');
    vectorized_image = numel(image);

    for i = 1 : vectorized_image
        X = image(i);
        result(i) = 255 * c * X^y;
    end
end