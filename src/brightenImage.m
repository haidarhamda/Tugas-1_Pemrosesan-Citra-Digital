function result = brightenImage(image, a, b)
    % if (a == 0)
    %     a = 1;
    % end

    result = zeros(size(image), 'uint8');
    vectorized_image = numel(image);

    for i = 1 : vectorized_image
        X = bitand(image(i), 0xFF);
        result(i) = a * X + b;
    end
end