function [ret] = histEqualization(img)
    [n, m, c] = size(img);
    
    for channel=1:c
        imgChannel=img(:,:,channel);
        hist=customHistogram(imgChannel)/(n*m);
        histEq = zeros(256,1);
        sum=0.0;
        for i=1:256
            sum=0.0;
            for j=1:i-1
                sum=sum+hist(j);
            end
            histEq(i)=floor(256*sum);
        end

        for i=1:n
            for j=1:m
                imgChannel(i,j)=histEq(imgChannel(i,j)+1);
            end
        end
        
        ret(:,:,channel) = imgChannel;
    end
end

%i = imread("images\Lena512warna.bmp");
%imshow(histEquaaalization(i));
%imshow(histeq(i))
