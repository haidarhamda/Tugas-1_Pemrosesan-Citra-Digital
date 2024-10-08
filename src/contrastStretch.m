function result = contrastStretch(image)
    result = zeros(size(image), 'uint8');

    for i = 1 : size(image, 3)
        color = image(:,:,i);
        minimum = double(min(color(:)));
        maximum = double(max(color(:)));

        result(:,:,i) = uint8(255 * (double(color) - minimum) / (maximum - minimum));
    end
end