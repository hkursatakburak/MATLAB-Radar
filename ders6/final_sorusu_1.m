function A = final_sorusu_1(n)
A = zeros(n,2*n);

for ii =1:1:n
    for jj = 1:1:2*n
        A(ii,jj) = ii + jj;
    end
end

end




