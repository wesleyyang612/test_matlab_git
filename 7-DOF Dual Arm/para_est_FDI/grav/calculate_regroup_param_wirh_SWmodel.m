clear;clc;

m7=0.653;x7=3.334/1e3;z7=11.784/1e3;y7=0.007/1e3;

I7xx=657.078/1e6;I7yy=293.998/1e6;I7zz=700.728/1e6;I7xy=-3.982/1e6;I7xz=-0.021/1e6;I7yz=-0.051/1e6;
mx7=m7*x7;my7=m7*y7;mz7=m7*z7;

m6=0.758;x6=9.732/1e3;y6=-1.581/1e3;z6=-10.125/1e3;

I6xx=710.768/1e6;I6yy=1114.253/1e6;I6zz=862.656/1e6;I6xy=-68.558/1e6;I6xz=-1.296/1e6;I6yz=-0.863/1e6;
mx6=m6*x6;my6=m6*y6;mz6=m6*z6;

m5=0.819;x5=-0.013/1e3;y5=-0.863/1e3;z5=-82.912/1e3;
I5xx=7047.498/1e6;I5yy=6874.269/1e6;I5zz=569.332/1e6;I5xy=0.009/1e6;I5xz=0.671/1e6;I5yz=-0.376/1e6;
mx5=m5*x5;my5=m5*y5;mz5=m5*z5;

m4=1.800;x4=-0.025/1e3;y4=-3.943/1e3;z4=-8.351/1e3;
I4xx=2675.751/1e6;I4yy=2263.441/1e6;I4zz=1941.875/1e6;I4xy=-0.617/1e6;I4xz=-1.814/1e6;I4yz=15.07/1e6;
mx4=m4*x4;my4=m4*y4;mz4=m4*z4;

m3=1.930;x3=-0.028/1e3;y3=-1.036/1e3;z3=-102.128/1e3;
I3xx=25287.232/1e6;I3yy=24727.851/1e6;I3zz=2362.491/1e6;I3xy=-1.488/1e6;I3xz=2.936/1e6;I3yz=19.798/1e6;
mx3=m3*x3;my3=m3*y3;mz3=m3*z3;

m2=2.801;x2=-0.018/1e3;y2=-8.190/1e3;z2=-7.344/1e3;
I2xx=6233.7/1e6;I2yy=4885.997/1e6;I2zz=4125.128/1e6;I2xy=6.187/1e6;I2xz=2.369/1e6;I2yz=-12.969/1e6;
mx2=m2*x2;my2=m2*y2;mz2=m2*z2;

m1=0.989;x1=-0.019/1e3;y1=-2.456/1e3;z1=-48.792/1e3;
I1xx=5026.614/1e6;I1yy=5016.057/1e6;I1zz=1577.493/1e6;I1xy=0.030/1e6;I1xz=1.179/1e6;I1yz=7.266/1e6;
mx1=m1*x1;my1=m1*y1;mz1=m1*z1;

ILxx=0;ILyy=0;ILzz=0;ILxy=0;ILxz=0;ILyz=0;mxL=0;myL=0;mzL=0;mL=0;
Fc1=0;Fc2=0;Fc3=0;Fc4=0;Fc5=0;Fc6=0;Fc7=0;
Fv1=0;Fv2=0;Fv3=0;Fv4=0;Fv5=0;Fv6=0;Fv7=0;
Ia1=0;Ia2=0;Ia3=0;Ia4=0;Ia5=0;Ia6=0;Ia7=0;

% syms L1 L2 L3 L4 L5
L1=0.065;L2=0.25;L3=0.21;L4=0.062;L5=0;

ZZ1R=I1zz + I2yy + Ia1;


MY1R=my1 + mz2;


XX2R=I2xx - I2yy + I3yy + L2^2*(m3 + m4 + m5 + m6 + m7 + mL) + 2*L2*mz3


ZZ2R=I2zz + I3yy + Ia2 + L2^2*(m3 + m4 + m5 + m6 + m7 + mL) + 2*L2*mz3;


MY2R=-(L2*(m3 + m4 + m5 + m6 + m7 + mL)) + my2 - mz3;


XX3R=I3xx - I3yy + I4yy;


ZZ3R=I3zz + I4yy;


MY3R=my3 + mz4;


XX4R=I4xx - I4yy + I5yy + L3^2*(m5 + m6 + m7 + mL) + 2*L3*mz5;


ZZ4R=I4zz + I5yy + L3^2*(m5 + m6 + m7 + mL) + 2*L3*mz5;


MY4R=-(L3*(m5 + m6 + m7 + mL)) + my4 - mz5;


XX5R=I5xx - I5yy + I6yy + L4^2*(m7 + mL);


ZZ5R=I5zz + I6yy + L4^2*(m7 + mL);


MY5R=my5 + mz6;


XX6R=I6xx - I6yy + I7yy + ILyy + L5^2*mL - L4^2*(m7 + mL) + 2*L5*mxL;


XY6R=I6xy + L4*(mz7 + mzL);


ZZ6R=I6zz + I7yy + ILyy + L5^2*mL + L4^2*(m7 + mL) + 2*L5*mxL;


MX6R=L4*(m7 + mL) + mx6;


MY6R=my6 - mz7 - mzL;


XX7R=I7xx - I7yy + ILxx - ILyy - L5^2*mL - 2*L5*mxL;


XY7R=I7xy + ILxy - L5*myL;


XZ7R=I7xz + ILxz - L5*mzL;


YZ7R=I7yz + ILyz;


ZZ7R=I7zz + ILzz + L5^2*mL + 2*L5*mxL;


MX7R=L5*mL + mx7 + mxL;


MY7R=my7 + myL;

betasw1=XX2R;betasw2=XX3R;betasw3=XX4R;betasw4=XX5R;betasw5=XX6R;betasw6=XX7R;
betasw7=I2xy;betasw8=I3xy;betasw9=I4xy;betasw10=I5xy;betasw11=XY6R;betasw12=XY7R;
betasw13=I2xz;betasw14=I3xz;betasw15=I4xz;betasw16=I5xz;betasw17=I6xz;betasw18=XZ7R;
betasw19=I2yz;betasw20=I3yz;betasw21=I4yz;betasw22=I5yz;betasw23=I6yz;betasw24=YZ7R;
betasw25=ZZ1R;betasw26=ZZ2R;betasw27=ZZ3R;betasw28=ZZ4R;betasw29=ZZ5R;betasw30=ZZ6R;
betasw31=ZZ7R;betasw32=mx1;betasw33=mx2;betasw34=mx3;betasw35=mx4;betasw36=mx5;
betasw37=MX6R;betasw38=MX7R;betasw39=MY1R;betasw40=MY2R;betasw41=MY3R;betasw42=MY4R;
betasw43=MY5R;betasw44=MY6R;betasw45=MY7R;

%% 存入mat文件
save('beta_dualArm_SWmodel.mat', ...
    'betasw1','betasw2','betasw3','betasw4','betasw5','betasw6','betasw7',...
    'betasw8','betasw9','betasw10','betasw11','betasw12','betasw13','betasw14','betasw15',...
    'betasw16','betasw17','betasw18','betasw19','betasw20','betasw21','betasw22',...
    'betasw23','betasw24','betasw25','betasw26','betasw27','betasw28','betasw29',...
    'betasw30','betasw31',...
    'betasw32','betasw33','betasw34','betasw35','betasw36','betasw37','betasw38', ...
    'betasw39','betasw40','betasw41','betasw42','betasw43','betasw44','betasw45')