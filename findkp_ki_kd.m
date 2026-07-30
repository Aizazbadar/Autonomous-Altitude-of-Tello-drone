a=3.721;
b=0.2353;
c=23.53;



l1 = -0.661 + 1.653i;
l2 = -0.661 - 1.653i;
l3 = -3.6;

s1=l1+l2+l3;
s2=(l1*l2) + (l1*l3) +(l2*l3);
s3=l1*l2*l3;

M=[ 0, -c, -s3*b;
    -c, -b, s2*b;
    0, 0, -(c+b+s1*b)];
C=[s3;
    -s2;
    a+s1];

gaina=M\C;

kp = gaina(1);
ki = gaina(2);
kd = gaina(3);

fprintf('kp :%4f, ki:%4f, kd:%4f \n',kp,ki,kd);

