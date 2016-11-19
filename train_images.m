function [gabor_train,train_label] = train_images()
cat2 = {'003.backpack\','012.binoculars\','062.eiffel-tower\','078.fried-egg\'};
size_image = 64;
train_image = zeros(size_image,size_image,458);
train_image = read_images([1,1,1,1],[131,196,61,70],cat2);
[rows,cols,full_len]=size(train_image);
wavelengthMin = 4/sqrt(2);
wavelengthMax = hypot(rows,cols);
n = floor(log2(wavelengthMax/wavelengthMin));
wavelength = 2.^(0:(n-2)) * wavelengthMin;
deltaTheta = 45;
orientation = 0:deltaTheta:(180-deltaTheta);
g = gabor(wavelength,orientation);
gabor_train = zeros(size_image,size_image,full_len);
for j = 1 : full_len
    gabormag = imgaborfilt(train_image(:,:,j),g);
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
    gabor_train(:,:,j) = feature2DImage;
end
% train = mean(gabor_train,2);
% train = squeeze(train(:,1,:));
% train = train';
 train_label = label([1,1,1,1],[131,196,61,70],cat2);
return;
end