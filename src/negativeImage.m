function result = negativeImage(image)
    result = zeros(size(image), 'uint8');
    vectorized_image = numel(image);

    for i = 1 : vectorized_image
        X = bitand(image(i), 0xFF);
        result(i) = 0xFF - X;
    end
end