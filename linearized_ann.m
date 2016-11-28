cat2 = {'003.backpack\','012.binoculars\','062.eiffel-tower\','078.fried-egg\'};
train_image = read_images([1,1,1,1],[131,196,61,70],cat2);
train_image = reshape(train_image,[784 458]);
test_image = read_images([132,197,62,71],[151,216,81,90],cat2);
test_image = reshape(test_image,[784 80]);
train_test_combi = [train_image,test_image]';

label=zeros(538,4);
for i = 1:538
    if(i<132 || (459<=i)&&(i<=478))
        label(i,:)=[1,0,0,0];
    else
        if(132<=i)&&(i<=327) || (479<=i)&&(i<=498)
            label(i,:)=[0,1,0,0];
        
        else
            if((328<=i)&&(i<=388) || (499<=i)&&(i<=518))
                label(i,:)=[0,0,1,0];
            
            else
                if((389<=i)&&(i<=458) || (519<=i)&&(i<=538))
                    label(i,:)=[0,0,0,1];
                end
            end
        end
    end
end
                    
    
