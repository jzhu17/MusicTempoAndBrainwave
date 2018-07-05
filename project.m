%This script loads the brainwave data into two matrices and call 5
%functions that analyze the data and prints out results

load juliaJazz.txt %sample: julia's jazz file 
mat=juliaJazz;
%put the brainwave data into three matrices
slowMat=mat(50:850, 6:9); %slow tempo muic: 801 rows, 4 columns 
fastMat=mat(1250:2050, 6:9); %fast tempo music: 801 rows, 4 columns  

%calls the function that plots the slow and fast tempo brainwaves 
plotWave(slowMat, fastMat);

%calls the function that calculates the 95% CI of difference between means
conIntMat=confidenceInterval(slowMat, fastMat);
fprintf('The 95 percent Confidence Interval of the difference between the true means are: \n')
for i=1:4
    fprintf('Electrode %.d:\n', i)
    fprintf('  From %.4f to %.4f.\n',conIntMat(i,1),conIntMat(i,2));
end 
fprintf('\n');

%calls the function that calculates the p-value of difference between means
pVal=pValue(slowMat, fastMat);
fprintf('The p-value of the difference between the true means are: \n')
for i=1:4
    fprintf('Electrode %.d: ', i)
    fprintf('%.4f.\n',pVal(i,1));
end

%calls the function that calculates the three coefficients of an 2nd degree equation in least squares sense
for i=1:4
    %compares only one column from slow to one column from fast 
    figure()
    slow=polyfit2(slowMat,i); 
    fast=polyfit2(fastMat,i);
    %plots the graph using polyval2
    polyval2(slow,fast);
end
