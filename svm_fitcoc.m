model_svm = fitcecoc(train,train_label);
label_svm = predict(model_svm,test);
error_svm = 0;
for i = 1 : full_len_test
    if label_svm(i,1) ~= test_label(i,1)
       error_svm =error_svm+1;
    end
end
accuracy_svm = ((full_len_test-error_svm)/full_len_test)*100;
c_svm = confusionmat(test_label,label_svm);
