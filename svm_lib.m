libsvmwrite('features.txt', label_train, sparse(feat_train));
system('svm-scale.exe -l -1 -u 1 -s range_file.txt features.txt > scaled_features.txt');
[label_vector, instance_matrix] = libsvmread('scaled_features.txt');

%% make model

model = svmtrain(label_vector, instance_matrix, '-c 128.0 -g 0.00003051757813 -t 3');

p = svmpredict(label_vector, instance_matrix, model);