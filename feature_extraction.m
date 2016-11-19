[feat_test,label_test] = test_images();
feat_test = reshape(feat_test,size(feat_test,1)*size(feat_test,2),size(feat_test,3));
feat_test = feat_test';
[feat_train,label_train] = train_images();
feat_train = reshape(feat_train,size(feat_train,1)*size(feat_train,2),size(feat_train,3));
feat_train = feat_train';