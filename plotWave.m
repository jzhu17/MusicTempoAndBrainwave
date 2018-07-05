function plotting=plotWave(mat1, mat2)
% Plots the graphs of fast and slow tempo beta waves of 4 electrodes
% Format of call: plotWave(slowMat, fastMat)
% Prints out the graph 

%plots the slow and fast tempo beta waves of the first electrode 
s=1;
    subplot(4,1,s)
    plot(mat1(:,s),'-b'); hold on; 
    plot(mat2(:,s),'-r'); 
    
    title('Two Beta Waves for four electrodes')
    grid on; grid minor;
    legend('slow tempo','fast tempo');
    xticks([0:200:800]);
%plots the slow and fast tempo beta waves of the second electrode
s=2;
    subplot(4,1,s)
    plot(mat1(:,s),'-b'); hold on; 
    plot(mat2(:,s),'-r'); 
%plots the slow and fast tempo beta waves of the third electrode
s=3;
    subplot(4,1,s)
    plot(mat1(:,s),'-b'); hold on; 
    plot(mat2(:,s),'-r'); 
%plots the slow and fast tempo beta waves of the forth electrode
s=4;
    subplot(4,1,s)
    plot(mat1(:,s),'-b'); hold on; 
    plot(mat2(:,s),'-r'); 

hold off;
plotting=1.0;
end
