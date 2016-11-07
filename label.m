function group = label(start,stop,cat)
size = 64;
full_len = 0;
for j = 1: 4
    len(j) = stop(j)-start(j)+1;% the folder in which ur images exists
    disp(len(j));
    full_len = full_len + len(j);
end
group = zeros(full_len,1);
k = 1;
for j = 1 : 4
    for i = 1 : len(j)
        group(k,1)=j;
        k = k+1;
    end
end
return;
end

