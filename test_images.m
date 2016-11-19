function [gabor_test,test_label] = test_images()
cat2 = {'003.backpack\','012.binoculars\','062.eiffel-tower\','078.fried-egg\'};
size_image = 64;
test_image = zeros(size_image,size_image,458);
test_image = read_images([132,197,62,71],[151,216,81,90],cat2);
[rows,cols,full_len_test]=size(test_image);
wavelengthMin = 4/sqrt(2);
wavelengthMax = hypot(rows,cols);
n = floor(log2(wavelengthMax/wavelengthMin));
wavelength = 2.^(0:(n-2)) * wavelengthMin;
deltaTheta = 45;
orientation = 0:deltaTheta:(180-deltaTheta);
g = gabor(wavelength,orientation);
gabor_test = zeros(size_image,size_image,full_len_test);
for j = 1 : full_len_test
    gabormag = imgaborfilt(test_image(:,:,j),g);
    for i = 1:length(g)
        sigma = 0.5*g(i).Wavelength;
        K = 3;
        gabormag(:,:,i) = imgaussfilt(gabormag(:,:,i),K*sigma);
    end
    X = 1:cols;
    Y = 1:rows;
    [X,Y] = meshgrid(X,Y);
    featureSet = cat(3,gabormag,X);
    featureSet = cat(3,featureSet,Y);
    numPoints = rows*cols;
    X = reshape(featureSet,rows*cols,[]);
    X = bsxfun(@minus, X, mean(X));
    X = bsxfun(@rdivide,X,std(X));
    coeff = pca(X);
    feature2DImage = reshape(X*coeff(:,1),rows,cols);
    gabor_test(:,:,j) = feature2DImage;
end
%  test = mean(gabor_test,2);
%  test = squeeze(test(:,1,:));
%  test = test';
 test_label = label([132,197,62,71],[151,216,81,90],cat2);
 return;
end