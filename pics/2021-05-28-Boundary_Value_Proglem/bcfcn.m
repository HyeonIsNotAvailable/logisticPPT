function res = bcfcn(xa, xb)
% xa: ���� �� Boundary Value
% xb: ������ �� Boundary Value
%
global BoundaryCondition
res = [...
    xa(1) - BoundaryCondition(1)
    xb(1) - BoundaryCondition(2)];
end