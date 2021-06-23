p = 100;
imdata = imread('original.jpg');
s = size(imdata);
O = zeros(s);
R = imdata(:,:,1);
for i = [1 2 3]
    [a,b,c] = svd(double(imdata(:,:,i)));
    o = zeros(s(1),s(2));
    for m = 1:p
        if b(m,m) < 10^-14
            b(m,m) = 0;
        end
        o = o + b(m,m)*a(:,m)*c(:,m)';
    end
    O(:,:,i) = (o);
    O = uint8(O);
end
imwrite(O,'compressed.jpg');
imshow('compressed.jpg')