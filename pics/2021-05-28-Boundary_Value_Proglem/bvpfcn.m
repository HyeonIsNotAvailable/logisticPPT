function res = bvpfcn(t, z)
% t: ��������
% z: ���� ����. z�� 2���� �����̸� [x; y]�� ��� ����.
global A

res(1, 1) = A(1,1) * z(1) + A(1, 2) * z(2);
res(2, 1) = A(2,1) * z(1) + A(2, 2) * z(2);

end