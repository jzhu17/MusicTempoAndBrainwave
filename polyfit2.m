function result=polyfit2(mat1,a)
% Calculate the three coefficients of an 2nd degree equation in least squares sense
% Format of call: polyfit2(mat1, num) 
% Returns the three coefficients in a vector

A=zeros(3,3);%create a 3 by 3 matrixs with zeros

%value of the matrix to get matrix B in the polynomial regression alogrithm 
B=[0;0;0];
matp=mat1(:,a);%matp represent the ath column of the input mat
matpp=1:801;

for i=1:3
    B(i,1)=sum(cumsum(matp)+matpp.^i*matp);
end
%based on the alogrithm, set values of matrix A by
%initialize four sum variables to record the value

%according to the alogrithm,matrix A could be 
%represent as[x,x^3,x^4;x^4,x^3,x^5;x^4,x^5,x^5] and x is the row index
%form 1 to 800
matd=1:801;
sum4=sum(matd);
sum1=sum(matd.^3);
sum2=sum(matd.^4);
sum3=sum(matd.^5);
%set the value of x into the matrix
A(1,1)=sum4;

A(1,2)=sum1;
A(2,1)=sum1;
A(2,2)=sum1;

A(1,3)=sum2;
A(3,1)=sum2;

A(2,3)=sum3;
A(3,2)=sum3;
A(3,3)=sum3;
%calculate the result matrix using matrix multiplication

result=inv(A)*B;

end
