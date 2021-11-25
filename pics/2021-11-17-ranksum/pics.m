%% ������ ���̺� ����� (7�� �� 3�� �����ϴ� ����� ��)

my_select = nchoosek(1:7, 3);

for i = 1:size(my_select,1)
    temp_str = '       ';
    temp_str(my_select(i,:)) = 'o';
    xlswrite('select_table.xlsx', temp_str, 1, ['A',num2str(i)]);
    xlswrite('select_table.xlsx', sum(my_select(i,:)), 1, ['H',num2str(i)])
end

%%

sum_of_ranks = sum(my_select, 2);

figure;
w = histogram(sum_of_ranks);
grid on;
xlabel('������ T');
xlim([4, 20])
ylim([0, 6])
set(gca,'ytick',0:5)
ylabel('��')
title('7�� �� 3�� ������ ������ ����')
set(gca,'fontname','�������')