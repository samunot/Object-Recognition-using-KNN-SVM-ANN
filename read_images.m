function image = read_images(start,stop,cat)
size = 64;
full_len = 0;
for j = 1: 4
    len(j) = stop(j)-start(j);% the folder in which ur images exists
    full_len = full_len + len(j);
end
image = zeros(size,size,full_len);
k = 1;
for j = 1 : 4
    file = strcat('C:\Users\Shubham\Object-recognition\data\',cat(j),'*.jpg');
    srcFiles = dir(char(file));
    for i = start(j) : stop(j)
        filename = strcat('C:\Users\Shubham\Object-recognition\data\',cat(j),srcFiles(i).name);
        a = imread(char(filename));
        a = imresize(a, [size,size]);
        a = rgb2gray(a);
        image(:,:,k) = a;
        k = k+1;
    end
end
return;
end
