clear all

R1 = [1 -1; -1 1];
R2 = -R1;
ite = 100000;
a_rec = zeros(ite,1);
b_rec = zeros(ite,1);
ur = R1(1,1) -R1(1,2) -R1(2,1) +R1(2,2);
uc = R2(1,1) -R2(1,2) -R2(2,1) +R2(2,2);
a = rand(1,1); b = rand(1,1);
% %  a = 0.2; b = 0.8;
eta  = 0.0001;
% V1 = a*b*R1(1,1) +a*(1-b)*R1(1,2) +(1-a)*b*R1(2,1) +(1-a)*(1-b)*R1(2,2);
% V2 = a*b*R2(1,1) +a*(1-b)*R2(1,2) +(1-a)*b*R2(2,1) +(1-a)*(1-b)*R2(2,2);
for i = 1:ite

    if i > 1
    a = a_rec(i-1,1) +eta*(b_rec(i-1,1)*ur +R1(1,2) -R1(2,2));
    b = b_rec(i-1,1) +eta*(a_rec(i-1,1)*uc +R2(2,1) -R2(2,2));
    else
    a = a +eta*(b*ur +R1(1,2) -R1(2,2));
    b = b +eta*(a*uc +R2(2,1) -R2(2,2));
    end
%     eta = eta/1.1;
    a_rec(i,1) = a; b_rec(i,1) = b;
end

plot(1:ite,a_rec);