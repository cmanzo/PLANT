function AA=Segm_alg(a,n0,prob1,sigP,flag)

h1=waitbar(0,'Calculating the variance of all possible segments >Nmin...');

t=a(:,1); 
y=a(:,2);

%% ----------------WINDLINFIT BLOCK---------------------------------------

%Fill the matrix M with likelihood values


clear M xx yy ff BB c i1 m
M=sparse(length(t)-n0+1,length(t)-n0+1); 
M(:,:)=-inf;

for istart=1:length(t)-n0+1
    waitbar(istart/100)
 for istop=istart+n0-1:length(t)
    
    tt=t(istart:istop);
    yy=y(istart:istop);
    slope = sum((tt-mean(tt)).*(yy-mean(yy)))/sum((tt-mean(tt)).^2);
    offset = mean(yy)-slope*mean(tt);  

    var=sum(( yy-(offset+tt*slope)  ).^2);

    n=length(tt);
    sigs=sqrt(var/n);    

    flog=((n-1)./2).*log(n./(2*sigP.^2))+(n-3).*log(sigs)-(n.*sigs.^2)./(2*sigP.^2)-gammaln((n-1)./2);
    M(istart,istop)=flog;

    clear tt yy slope
  end
    
end
close(h1)

%% 

h2=waitbar(0,'Finding the segments with maximum likelihood...');

M1=M;

cpold=[1];
counter=0;
while max(max(M))~=-inf
    counter=counter+1;
    waitbar(counter/100)
    [istar,jstar]=find((M)==max(max(M)),1,'last');
  
    M(:,istar:jstar)=-inf;
    M(istar:jstar-1,:)=-inf;
    M(1:istar-1,jstar:end)=-inf;
    
    cpold=[cpold; istar; jstar];

end
cpold=([length(t); cpold ]);
[cpnew]=unique(cpold);


for i=length(cpold):-1:1
    inop=find(cpnew==cpold(i),1,'first');
    
    if any(abs(cpnew(inop)-cpnew([1:inop-1, inop+1:end]))<=2) & cpnew(inop)~=1 & cpnew(inop)~=length(t)
       cpnew=cpnew([1:inop-1,inop+1:end]);
       clear inop
    end

end

cpnewnew=(unique(cpnew));


xx=cpnewnew;
xpf=t(xx);
ypf=y(xx);



%% Linear fit over every regions bound for the consecutive pair of change points found


for i=1:length(xx)-1
tt=t(xx(i):xx(i+1));
yy=y(xx(i):xx(i+1));
slope(i) = sum((tt-mean(tt)).*(yy-mean(yy)))/sum((tt-mean(tt)).^2);
offset(i) = mean(yy)-slope(i)*mean(tt);  

     %var=sum(( yy-(offset+tt*slope)  ).^2);
%      plot(tt,offset(i)+slope(i)*tt,'-g','linewidth',2)      
     
      clear tt yy
      
end

 

close(h2)
%% --------------MERGING BLOCK--------------------------------------------
%Determination of F for every point (from 2 to N-2)
 
h3=waitbar(0,'Runnig MERGING block...');

[FF,nn]=fisherP(xpf,ypf,t,y);
p1=2;
p2=4;

des_ind=0;
count2=0;
stop_cond=0;
while length(stop_cond)>0
    count2=count2+1;
    waitbar(count2/100)
   
    if des_ind==1
    FF(ind1)=inf;
    [cc,ind1]=min(FF);
    ftest=finv(prob1,p2-p1,nn(ind1)-p2);
    else
      [cc,ind1]=min(FF); 
   ftest=finv(prob1,p2-p1,nn(ind1)-p2);
    end
   
    if cc<ftest
    xpf(ind1+1)=[];
    ypf(ind1+1)=[];
    clear FF nn
    [FF,nn]=fisherP(xpf,ypf,t,y);
    des_ind=0;
    else
      
        des_ind=1;
    end
    
   stop_cond=find(FF~=inf);
    
end


 
  

%% fit for every region
clear cpnew
cpnew=[];
  for i=1:length(xpf)
     cpnew=[cpnew; find(t==xpf(i))];  
  end

if flag==1
    
  clear slope offset
  figure
  plot(t,y,'.b',xpf,ypf+3*sigP,'om','MArkerFAceColor','m')
  hold on
xlabel('time')
ylabel('coordinate')
  
  for i=1:length(cpnew)-1
   tt=t(cpnew(i):cpnew(i+1));
   yy=y(cpnew(i):cpnew(i+1));
   deltat(i)=tt(end)-tt(1);
   slope(i) = sum((tt-mean(tt)).*(yy-mean(yy)))/sum((tt-mean(tt)).^2);
   offset(i) = mean(yy)-slope(i)*mean(tt);  

   plot(tt,offset(i)+slope(i)*tt,'-r','linewidth',2)      
   clear tt yy     
  end

hold off

 
else
    
   for i=1:length(cpnew)-1
   tt=t(cpnew(i):cpnew(i+1));
   yy=y(cpnew(i):cpnew(i+1));
   deltat(i)=tt;
   slope(i) = sum((tt-mean(tt)).*(yy-mean(yy)))/sum((tt-mean(tt)).^2);
   offset(i) = mean(yy)-slope(i)*mean(tt);     
   clear tt yy     
  end     
    
end

    
clear xpf ypf
xpf=t(cpnew);
ypf=y(cpnew);
 
Mslope=[slope,NaN];
deltat=[deltat,NaN];
Moffset=[offset,NaN]; 
    
 AA=[xpf ypf deltat' Mslope' Moffset'];

 close(h3)





