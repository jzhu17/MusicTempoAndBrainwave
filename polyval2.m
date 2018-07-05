function result=polyval2(vec1,vec2)
% Plots the results calculated from polyfit2 with input of two 3 by 1 column vectors 
% Format of call: polyval2(vec1, vec2) 
% Plots the graph 

c1=vec1(1,1);%first row represents the constant in the polynomial  
c2=vec1(2,1);%second row represents the parameter of x in the polynomial
c3=vec1(3,1);%third row represents the parameter of x squire in the polynomial
x=1:800;
y=c1+c2*x+c3*x.^2;
plot(x,y);%plot the first graph and hold on
hold on
d1=vec2(1,1);
d2=vec2(2,1);
d3=vec2(3,1);
x=1:800;
y=d1+d2*x+d3*x.^2;
plot(x,y);%plot the second one and compare the graph
legend('slow tempo','fast tempo');
hold off 

result=1.0;

end