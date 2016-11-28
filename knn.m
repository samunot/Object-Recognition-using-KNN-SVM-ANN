
k={1,5,10,50};
distance = {'euclidean','cosine','mahalanobis','manhattan'};
label_knn = knnclassify(feat_test,feat_train,label_train,50,'correlation');
error_knn = 0;
[full_len_test,]=size(label_test);
for i = 1 : full_len_test
    if label_knn(i,1) ~= label_test(i,1)
        error_knn =error_knn+1;
    end
end
accuracy_knn = ((full_len_test-error_knn)/full_len_test)*100;
c_knn = confusionmat(label_test,label_knn);