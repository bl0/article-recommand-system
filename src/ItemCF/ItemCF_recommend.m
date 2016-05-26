function recommend = ItemCF_recommend(train, num_user, num_article, k)
    itemMat = zeros(num_user,num_user);
    for i = 1 : num_article
        for j = i + 1 : num_article
            total_i = 0;
            total_j = 0;
            for h = 1 : num_user
                if (train(h,i) == 1) && (train(h,j) == 1)
                    itemMat(i,j) = itemMat(i,j) + 1;
                end
                if train(h,i)==1
                    total_i = total_i+1;
                end
                if train(h,j)==1
                    total_j = total_j+1;
                end
            end
            itemMat(i,j) = itemMat(i,j)/sqrt(total_i*total_j);
        end
    end      
    recommend=itemMat;
end