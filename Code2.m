clc
clear 
load (['map\map1'])
load (['map\map2'])
load (['map\map3'])
load (['map\map4'])
load (['map\map5'])
load (['map\map6'])
sizeE1=[21 21];% Maps 1–3, that is, 20 m × 20 m grid environments
sizeE2=[31 31];% Maps 4–6, that is, 30 m × 30 m grid environments
Sx=2; Sy=2;% Departure
Ex1=21; Ey1=21;% Destination (Maps 1–3)
Ex2=31; Ey2=31;% Destination (Maps 4–6)
Repetition=cell(1,20);
%% 20 repetitions (Note that 20 repetitions will take longer)
for i=1:20
    figure(1)% map1
    [D1]=body2(map1,sizeE1,Sx,Sy,Ex1,Ey1);
    plot(D1,'linewidth',1); 
    hold on 
    grid on 
    title('Convergence Curve','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
    xlabel('Loop Iterations','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
    ylabel('Path Distance (m)','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
    Repetition{i}=['Repetition',num2str(i)];
    Repetition(cellfun(@isempty,Repetition))=[];
    legend(Repetition,'FontName','Times New Roman','FontSize',8,'FontWeight','normal','LineWidth',1,'NumColumns',2);
    
    figure(2)% map2
    [D2]=body2(map2,sizeE1,Sx,Sy,Ex1,Ey1);
    plot(D2,'linewidth',1); 
    hold on 
    grid on 
    title('Convergence Curve','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
    xlabel('Loop Iterations','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
    ylabel('Path Distance (m)','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
    legend(Repetition,'FontName','Times New Roman','FontSize',8,'FontWeight','normal','LineWidth',1,'NumColumns',2);
    
    figure(3)% map3
    [D3]=body2(map3,sizeE1,Sx,Sy,Ex1,Ey1);
    plot(D3,'linewidth',1); 
    hold on 
    grid on 
    title('Convergence Curve','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
    xlabel('Loop Iterations','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
    ylabel('Path Distance (m)','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
    legend(Repetition,'FontName','Times New Roman','FontSize',8,'FontWeight','normal','LineWidth',1,'NumColumns',2);
    
    figure(4)% map4
    [D4]=body2(map4,sizeE2,Sx,Sy,Ex2,Ey2);
    plot(D4,'linewidth',1); 
    hold on 
    grid on 
    title('Convergence Curve','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
    xlabel('Loop Iterations','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
    ylabel('Path Distance (m)','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
    legend(Repetition,'FontName','Times New Roman','FontSize',8,'FontWeight','normal','LineWidth',1,'NumColumns',2);
    
    figure(5)% map5
    [D5]=body2(map5,sizeE2,Sx,Sy,Ex2,Ey2);
    plot(D5,'linewidth',1); 
    hold on 
    grid on 
    title('Convergence Curve','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
    xlabel('Loop Iterations','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
    ylabel('Path Distance (m)','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
    legend(Repetition,'FontName','Times New Roman','FontSize',8,'FontWeight','normal','LineWidth',1,'NumColumns',2);
    
    figure(6)% map6
    [D6]=body2(map6,sizeE2,Sx,Sy,Ex2,Ey2);
    plot(D6,'linewidth',1); 
    hold on 
    grid on 
    title('Convergence Curve','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
    xlabel('Loop Iterations','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
    ylabel('Path Distance (m)','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
    legend(Repetition,'FontName','Times New Roman','FontSize',8,'FontWeight','normal','LineWidth',1,'NumColumns',2);
end