label_knn = knnclassify(test,train,train_label,10,'cosine');
error_knn = 0;
for i = 1 : full_len_test
    if label_knn(i,1) ~= test_label(i,1)
        error_knn =error_knn+1;
    end
end
accuracy_knn = ((full_len_test-error_knn)/full_len_test)*100;
c_knn = confusionmat(test_label,label_knn);