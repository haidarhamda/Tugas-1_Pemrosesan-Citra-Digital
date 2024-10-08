function [resutImg,resultHist]=histSpecification(imgTarget, imgRef)
    [n, m, ~] = size(imgTarget);
    [nref,mref,~] = size(imgRef);
    if(n~=nref || m~=mref)
        imgRef = imresize(imgRef,[n,m]);
    end
    dim=n*m;
    refHist=imhist(imgRef)/(dim);
    targetHist=imhist(imgTarget)/(dim);
    eqHist = zeros(256);
    refEqHist = zeros(256);
    invHist = zeros(256);
    for i=1:256
        sum=0.0;
        for j=1:i
            sum=sum+targetHist(j);
        end
        eqHist(i)=floor(256*sum);
    end

    for i=1:256
        sum=0.0;
        for j=1:i
            sum=sum+refHist(j);
        end
        refEqHist(i)=floor(256*sum);
    end

    for i=1:n
        minval=abs(eqHist(i)-refEqHist(1));
        minj=0;
        for j=1:256
            val=abs(eqHist(i)-refEqHist(j));
            if(val<minval)
                minval=val;
                minj=j;
            end
        end
        invHist(i)=minj;
    end

    for i=1:n
        for j=1:m
            imgTarget(i,j)=invHist(imgTarget(i,j)+1);
        end
    end
    %imshow(imgTarget);
    resutImg=imgTarget;
    resultHist=imhist(imgTarget);
end

%target = imread("images\boat.bmp");
%ref = imread("images\baboon24.bmp");
%histSpecification(target,ref);