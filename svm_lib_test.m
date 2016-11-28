libsvmwrite('features_test.txt', label_test, sparse(feat_test));
system('svm-scale.exe -l -1 -u 1 -s range_file.txt features_test.txt > scaled_features_test.txt');
[label_vector_test, instance_matrix_test] = libsvmread('scaled_features_test.txt');

p = svmpredict(label_vector_test, instance_matrix_test, model);