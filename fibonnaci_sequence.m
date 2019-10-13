%Fibonnaci Sequence
%Kieran Hobden
%08-Oct-'19

F(1) = 0;
F(2) = 1;
for i = 3:100
    F(i) = F(i-1) + F(i-2);
end

plot(1:9, F(1:9)./F(2:10), 'o')
hold on
xlabel('n')
legend('Ratio of terms f_{[n-1]}/f_n')
plot([0,10], (sqrt(5)-1)/2*[1,1], '--')