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
Searchdistance=zeros(6,20);% Record the search distance over multiple repetitions
Searchtime=zeros(6,20);% Record the search time over multiple repetitions
Searchpathx=cell(1,6); Searchpathy=cell(1,6);% Record the search paths over multiple repetitions
for i=1:6
    Searchpathx{1,i}=zeros(30,20);
    Searchpathy{1,i}=zeros(30,20);
end
Repetition=cell(1,20);
%% 20 repetitions
for i=1:20 
    % map1
    [D1,path1,new_MinD,Searchtime1]=body1(map1,sizeE1,Sx,Sy,Ex1,Ey1);
    path1(30,1)=0;
    Searchpathy{1,1}(:,i)=path1(:,1);
    Searchpathx{1,1}(:,i)=path1(:,2);
    Searchdistance(1,i)=D1(new_MinD(end),1);
    Searchtime(1,i)=Searchtime1;
    
    % map2
    [D2,path2,new_MinD,Searchtime2]=body1(map2,sizeE1,Sx,Sy,Ex1,Ey1);
    path2(30,1)=0;
    Searchpathy{1,2}(:,i)=path2(:,1);
    Searchpathx{1,2}(:,i)=path2(:,2);
    Searchdistance(2,i)=D2(new_MinD(end),1);
    Searchtime(2,i)=Searchtime2; 
    
    % map3
    [D3,path3,new_MinD,Searchtime3]=body1(map3,sizeE1,Sx,Sy,Ex1,Ey1);
    path3(30,1)=0;
    Searchpathy{1,3}(:,i)=path3(:,1);
    Searchpathx{1,3}(:,i)=path3(:,2);
    Searchdistance(3,i)=D3(new_MinD(end),1);
    Searchtime(3,i)=Searchtime3;
    
    % map4
    [D4,path4,new_MinD,Searchtime4]=body1(map4,sizeE2,Sx,Sy,Ex2,Ey2);
    path4(30,1)=0;
    Searchpathy{1,4}(:,i)=path4(:,1);
    Searchpathx{1,4}(:,i)=path4(:,2);
    Searchdistance(4,i)=D4(new_MinD(end),1);
    Searchtime(4,i)=Searchtime4;
    
    % map5
    [D5,path5,new_MinD,Searchtime5]=body1(map5,sizeE2,Sx,Sy,Ex2,Ey2);
    path5(30,1)=0;
    Searchpathy{1,5}(:,i)=path5(:,1);
    Searchpathx{1,5}(:,i)=path5(:,2);
    Searchdistance(5,i)=D5(new_MinD(end),1);
    Searchtime(5,i)=Searchtime5; 
    
    % map6
    [D6,path6,new_MinD,Searchtime6]=body1(map6,sizeE2,Sx,Sy,Ex2,Ey2);
    path6(30,1)=0;
    Searchpathy{1,6}(:,i)=path6(:,1);
    Searchpathx{1,6}(:,i)=path6(:,2);
    Searchdistance(6,i)=D6(new_MinD(end),1);
    Searchtime(6,i)=Searchtime6; 
end
%% the result figures of search paths (maps 1-6)
figure(1)% map1
imagesc(map1');
hold on
for j=1:20
    Newy=Searchpathy{1,1}(:,j);
    Newx=Searchpathx{1,1}(:,j);
    Newy(Newy==0)=[];
    Newx(Newx==0)=[];
    plot(Newy,Newx,'linewidth',1);
    hold on
    Repetition{j}=['Repetition',num2str(j)];
    Repetition(cellfun(@isempty,Repetition))=[];
end
colormap('gray');
title('Search paths','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
xlabel('m','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
ylabel('m','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
text(Sy,Sx,'S','HorizontalAlignment','center','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
text(Ey1,Ex1,'E','HorizontalAlignment','center','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
legend(Repetition,'FontName','Times New Roman','FontSize',8,'FontWeight','normal','LineWidth',1,'NumColumns',2);

figure(2)% map2
imagesc(map2');
hold on
for j=1:20
    Newy=Searchpathy{1,2}(:,j);
    Newx=Searchpathx{1,2}(:,j);
    Newy(Newy==0)=[];
    Newx(Newx==0)=[];
    plot(Newy,Newx,'linewidth',1);
    hold on
end
colormap('gray');
title('Search paths','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
xlabel('m','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
ylabel('m','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
text(Sy,Sx,'S','HorizontalAlignment','center','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
text(Ey1,Ex1,'E','HorizontalAlignment','center','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
legend(Repetition,'FontName','Times New Roman','FontSize',8,'FontWeight','normal','LineWidth',1,'NumColumns',2);

figure(3)% map3
imagesc(map3');
hold on
for j=1:20
    Newy=Searchpathy{1,3}(:,j);
    Newx=Searchpathx{1,3}(:,j);
    Newy(Newy==0)=[];
    Newx(Newx==0)=[];
    plot(Newy,Newx,'linewidth',1);
    hold on
end
colormap('gray');
title('Search paths','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
xlabel('m','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
ylabel('m','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
text(Sy,Sx,'S','HorizontalAlignment','center','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
text(Ey1,Ex1,'E','HorizontalAlignment','center','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
legend(Repetition,'FontName','Times New Roman','FontSize',8,'FontWeight','normal','LineWidth',1,'NumColumns',2);

figure(4)% map4
imagesc(map4');
hold on
for j=1:20
    Newy=Searchpathy{1,4}(:,j);
    Newx=Searchpathx{1,4}(:,j);
    Newy(Newy==0)=[];
    Newx(Newx==0)=[];
    plot(Newy,Newx,'linewidth',1);
    hold on
end
colormap('gray');
title('Search paths','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
xlabel('m','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
ylabel('m','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
text(Sy,Sx,'S','HorizontalAlignment','center','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
text(Ey2,Ex2,'E','HorizontalAlignment','center','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
legend(Repetition,'FontName','Times New Roman','FontSize',8,'FontWeight','normal','LineWidth',1,'NumColumns',2);

figure(5)% map5
imagesc(map5');
hold on
for j=1:20
    Newy=Searchpathy{1,5}(:,j);
    Newx=Searchpathx{1,5}(:,j);
    Newy(Newy==0)=[];
    Newx(Newx==0)=[];
    plot(Newy,Newx,'linewidth',1);
    hold on
end
colormap('gray');
title('Search paths','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
xlabel('m','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
ylabel('m','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
text(Sy,Sx,'S','HorizontalAlignment','center','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
text(Ey2,Ex2,'E','HorizontalAlignment','center','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
legend(Repetition,'FontName','Times New Roman','FontSize',8,'FontWeight','normal','LineWidth',1,'NumColumns',2);

figure(6)% map6
imagesc(map6');
hold on
for j=1:20
    Newy=Searchpathy{1,6}(:,j);
    Newx=Searchpathx{1,6}(:,j);
    Newy(Newy==0)=[];
    Newx(Newx==0)=[];
    plot(Newy,Newx,'linewidth',1);
    hold on
end
colormap('gray');
title('Search paths','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
xlabel('m','FontName','Times New Roman','FontSize',8,'FontWeight','normal'); 
ylabel('m','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
text(Sy,Sx,'S','HorizontalAlignment','center','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
text(Ey2,Ex2,'E','HorizontalAlignment','center','FontName','Times New Roman','FontSize',8,'FontWeight','normal');
legend(Repetition,'FontName','Times New Roman','FontSize',8,'FontWeight','normal','LineWidth',1,'NumColumns',2);
%% the excel table of search distance (Searchdistance.xls), and the excel table of search time (Searchtime.xls)
xlswrite('Searchdistance.xls',Searchdistance);
xlswrite('Searchtime.xls',Searchtime);