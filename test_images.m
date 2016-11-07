cat = {'003.backpack\','012.binoculars\','062.eiffel-tower\','078.fried-egg\'};
test_image = zeros(64,64,458);
test_image = read_images([132,197,62,71],[151,216,81,90],cat);
[rows,cols,full_len_test]=size(test_image);
wavelengthMin = 4/sqrt(2);
wavelengthMax = hypot(rows,cols);
n = floor(log2(wavelengthMax/wavelengthMin));
wavelength = 2.^(0:(n-2)) * wavelengthMin;
deltaTheta = 45;
orientation = 0:deltaTheta:(180-deltaTheta);
g = gabor(wavelength(1),0);
gabor_test = zeros(64,64,full_len_test);
for i = 1 : full_len_test
    gabor_test(:,:,i) = imgaborfilt(test_image(:,:,i),g);
end
test = mean(gabor_test,2);
test = squeeze(test(:,1,:));
test = test';
test_label = label([132,197,62,71],[151,216,81,90],cat);

class = knnclassify(test,train,train_label,10);
error = 0;
for i = 1 : full_len_test
    if class(i,1) ~= test_label(i,1)
        error =error+1;
    end
end
accuracy = ((full_len_test-error)/full_len_test)*100;