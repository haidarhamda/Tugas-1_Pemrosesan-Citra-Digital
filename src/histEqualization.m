function histogramEqualizaation(img)
    [n, m, ~] = size(img);
    hist=imhist(img)/(n*m);
    histEq = zeros(256);

    sum=0.0;
    for i=1:256
        sum=0.0;
        for j=1:i
            sum=sum+hist(j);
        end
        histEq(i)=floor(256*sum);
    end

    for i=1:n
        for j=1:m
            img(i,j)=histEq(img(i,j)+1);
        end
    end
    imshow(img);
end

%i = imread("images\boat.bmp");
%histogramEqualizaation(i);
%histeq(i)
