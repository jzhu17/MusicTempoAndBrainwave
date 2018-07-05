function resultMat = pValue(mat1, mat2)
% Calculate the P-value of difference between means of slow tempo data and fast tempo data 
% Format of call: pValue(slowMat, fastMat) 
% Returns the values of p in a vector 

a = zeros(4:1);
for i = 1:4
    slowTempo=mat1(1:801, i);
    fastTempo=mat2(1:801, i);
    %get difference at each point
    diffVector=fastTempo - slowTempo;
    sumDiff=sum(diffVector);
    %find average of difference, by adding all diff/801
    averageDiff = sumDiff/801;
    %with vector of diff, subtract mean diff
    vec4=diffVector - averageDiff;
    %for this new vector, square each value
    vec5=vec4.^2;
    %add this new vector and divide by 800 (called Sd)
    Sd=sum(vec5)/800;
    tRatio=averageDiff/sqrt(Sd/800); 
    a(i,:) = tRatio;
end 
resultMat=a;
end 