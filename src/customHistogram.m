function h = customHistogram(image)
    h = zeros(256, 1);
    vectorized_image = numel(image);
    for i = 1 : vectorized_image
        X = bitand(image(i), 0xFF);
        h(X + 1) = h(X + 1) + 1;
    end
end