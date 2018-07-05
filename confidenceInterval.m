function resultMat = confidenceInterval(mat1, mat2)
% Calculate the 95% confidence interval of difference between means of slow tempo data and fast tempo data 
% Format of call: confidenceInterval(slowMat, fastMat) 
% Returns the upper boundary and the lower boundary in a vector

a = zeros(4:2);
%loops through column 1 to 4, size 801 per tempo 
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
    %final is mean diff +- that t value * sqroot(Sd/800)
    subAns = averageDiff - 1.96 * sqrt(Sd/801);
    addAns = averageDiff + 1.96 * sqrt(Sd/801);
    %store the answer into a vector (b) then into a 4*2 matrix (a)
    b = [subAns addAns];
    a(i,:) = b;
end
resultMat = a;
end



