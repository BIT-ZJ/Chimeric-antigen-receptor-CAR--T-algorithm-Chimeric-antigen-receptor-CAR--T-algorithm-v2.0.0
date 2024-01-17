function [D]=body2(map,sizeE,Sx,Sy,Ex,Ey)
Pathx=zeros(sizeE);
Pathy=zeros(sizeE);
Pathx(Sy,Sx)=Sx;
Pathy(Sy,Sx)=Sy;

C0=zeros(sizeE); C0(Sy,Sx)=15;% initial cell concentration
Betak=zeros(sizeE);% modification rate of T cells modified to CAR-T cells
Ck=zeros(sizeE);% cell concentration of the newly generated child neighbours
N=1;
D=inf*ones(20,1);% record the search distance after each iteration
MinD=zeros(1,20);% record the index of the shortest historical search path
Loopx=zeros(30,100); Loopy=zeros(30,100);% record the search path after each iteration
Ctotal=zeros(sizeE);

tic
for loop=1:100 % iterations
    Dk=Inf*ones(sizeE); Dk(Sy,Sx)=0;% the path distance travelled
    Hk=Inf*ones(sizeE); Hk(Sy,Sx)=sqrt((Ex-Sx)^2+(Ey-Sy)^2);% the receptor information, that is, the distance information between the current search neighbour and the destination (target cell)
    T2=[];% record parent neighbours
    T1=[Sy,Sx];% record child neighbours
    Npath=0;
    N1=1;
    while isempty(T1)==0 && Npath==0
        CT1=zeros(size(T1,1),1);% record the cell concentration of child neighbours
        for i=1:size(T1,1)
            CT1(i,:)= Ctotal(T1(i,1),T1(i,2));
        end
        [~,MaxCT1]=max(CT1);
        ychild=T1(MaxCT1,1); xchild=T1(MaxCT1,2);% child neighbors with the highest cell concentration in T1;
        Parentneighbour=[ychild, xchild];% parent neighbours 
        if xchild==Ex && ychild==Ey
            Npath=1;
        else
            T2(size(T2,1)+1,:)=Parentneighbour;% Departure is the first parent neighbor in T2.
            T1=T1(horzcat(1:MaxCT1-1,MaxCT1+1:size(T1,1)),:);
            for i=-1:1
                for j=-1:1
                    if xchild-1>0 && ychild-1>0 && xchild+1<=sizeE(2) && ychild+1<=sizeE(1)
                        check_T1=max(sum([ychild+j==T1(:,1) xchild+i==T1(:,2)],2));
                        check_T2=max(sum([ychild+j==T2(:,1) xchild+i==T2(:,2)],2));
                        if isempty(check_T1)==1
                            check_T1=0;
                        end
                        if isempty(check_T2)==1
                            check_T2=0;
                        end
                        if check_T1<2 && check_T2<2
                            T1(size(T1,1)+1,:)=[ychild+j, xchild+i];
                            d=Dk(ychild,xchild)+sqrt(i^2+j^2);
                            if  d<Dk(ychild+j,xchild+i)
                                Dk(ychild+j,xchild+i)=d; 
                            end
                            Hk(ychild+j,xchild+i)=sqrt((Ex-(xchild+i))^2+(Ey-(ychild+j))^2);% Eq.(2)
                            allowed=sort([Hk(ychild+1,xchild+1),Hk(ychild+1,xchild-1),Hk(ychild-1,xchild+1),Hk(ychild-1,xchild-1)]);% Eq.(3),diagonal child neighbors (To guarantee an efficient search, not all eight child neighbors are necessarily included in allowed.)
                            Pki=randsample(allowed,1,true,[0.4 0.3 0.2 0.1]);
                            if Pki==Hk(ychild+1,xchild+1)
                                Hk(ychild+1,xchild+1)= allowed(:,1);
                                Hk(ychild+1,xchild-1)=allowed(:,4);
                                Hk(ychild-1,xchild+1)=allowed(:,4);
                                Hk(ychild-1,xchild-1)=allowed(:,4);
                            elseif Pki==Hk(ychild+1,xchild-1)
                                Hk(ychild+1,xchild+1)=allowed(:,4);
                                Hk(ychild+1,xchild-1)=allowed(:,1);
                                Hk(ychild-1,xchild+1)=allowed(:,4);
                                Hk(ychild-1,xchild-1)=allowed(:,4);
                            elseif Pki==Hk(ychild-1,xchild+1)
                                Hk(ychild+1,xchild+1)=allowed(:,4);
                                Hk(ychild+1,xchild-1)=allowed(:,4);
                                Hk(ychild-1,xchild+1)=allowed(:,1);
                                Hk(ychild-1,xchild-1)=allowed(:,4); 
                            elseif Pki==Hk(ychild-1,xchild-1)
                                Hk(ychild+1,xchild+1)= allowed(:,4);
                                Hk(ychild+1,xchild-1)=allowed(:,4);
                                Hk(ychild-1,xchild+1)=allowed(:,4);
                                Hk(ychild-1,xchild-1)=allowed(:,1);
                            end
                            Betak(ychild+j,xchild+i)=1/Hk(ychild+j,xchild+i);% Eq.(2)
                            Ck(ychild+j,xchild+i)=(1+ceil(roundn(Betak(ychild+j,xchild+i)*C0(ychild,xchild),-1))/(6*Dk(ychild+j,xchild+i)))*C0(ychild,xchild)*0.76;% Eq.(1)
                            if map(ychild+j,xchild+i)<0
                                Ck(ychild+j,xchild+i)=-inf;
                            else
                                Ck(ychild+j,xchild+i)=Ck(ychild+j,xchild+i);
                            end
                            Ctotal(ychild+j,xchild+i)=Ctotal(ychild+j,xchild+i)+Ck(ychild+j,xchild+i);
                            C0(ychild+j,xchild+i)=Ck(ychild+j,xchild+i);
                            Pathx(ychild+j,xchild+i)=xchild;
                            Pathy(ychild+j,xchild+i)=ychild;                             
                        end
                    end
                end
            end
        end
    end
    ychild1=ychild;
    xchild1=xchild;
    path_backwards=[ychild1,xchild1];
    i=2;
    while xchild1~=Sx || ychild1~=Sy
        path_backwards(i,:)=[Pathy(ychild1,xchild1) Pathx(ychild1,xchild1)];
        ychild1=path_backwards(i,1);
        xchild1=path_backwards(i,2);    
        i=i+1;   
    end
    Numpath=size(path_backwards,1);
    path=path_backwards(Numpath+1-(1:Numpath),:);
    path(1,:)=[Sy Sx];
    path(Numpath,:)=[Ey Ex];
    path=GenerateSmoothPath(path,map);
    path_distance=zeros(size(path,1),1);
    for N2=1:numel(path(:,1))
        Loopy(N1,loop)=path(N2,1);
        Loopx(N1,loop)=path(N2,2);
        N1=N1+1;
    end
    for N3=2:size(path,1)
        path_distance(N3)=path_distance(N3-1)+sqrt((path(N3,2)-path(N3-1,2))^2+(path(N3,1)-path(N3-1,1))^2);
    end
    D(loop,1)=path_distance(size(path,1),1);
    [Dx,~]=find(D==min(min(D)));
    MinD(1,N)=Dx(1);
    MinD(MinD==0)=[];
    N=N+1;
    [V1,V2]=unique(MinD,'first');
    result=sortrows([V2,V1']);
    new_MinD=result(:,2)';
    r=0.0002*(loop-2).^2;
    Ctotal=zeros(sizeE);
    Searchx=Loopy(:,new_MinD(end)); Searchy=Loopx(:,new_MinD(end));% the shortest historical search path 
    Searchx(Searchx==0)=[];
    Searchy(Searchy==0)=[];
    for N4=1:numel(Searchx)
        Ctotal(Searchx(N4,1),Searchy(N4,1))=r*15;
    end
end
toc  