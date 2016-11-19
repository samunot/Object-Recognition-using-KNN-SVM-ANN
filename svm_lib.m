libsvmwrite('features.txt', train_label, sparse(gabor_train));
system('svm-scale.exe -l -1 -u 1 -s range_file.txt features.txt > scaled_features.txt');
[label_vector, instance_matrix] = libsvmread('scaled_features.txt');

%% make model

model = svmtrain(label_vector, instance_matrix, '-c 2.0 -g 0.0078125');

p = svmpredict(label_vector, instance_matrix, model);