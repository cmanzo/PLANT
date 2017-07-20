
function sigP=Sigma_estimator(a,thrn,n0);

%% ------------------------------------------------------------------------
% Matrix containing the standard deviation calculated from the different
% lineal fits. 
% All possible combinations of segments longer than n0 are fitted to a 
% linear model and for each of them the standard deviation from the fit are
% calculated and arranged into the he matrix M.
%--------------------------------------------------------------------------

h=waitbar(0,'Estimating standard deviation from the data...');
t=a(:,1); 
y=a(:,2);

dt=1;
to=t(1:dt:length(t));
yo=y(1:dt:length(y));

M=sparse(length(to)-n0+1,length(to)-n0+1); 
M(:,:)=-inf;

for istart=1:length(to)-n0+1
    waitbar(istart/100)
 for istop=istart+n0-1:length(to)
    
tt=to(istart:istop);
yy=yo(istart:istop);
slope = sum((tt-mean(tt)).*(yy-mean(yy)))/sum((tt-mean(tt)).^2);
      offset = mean(yy)-slope*mean(tt);  

      var=sum(( yy-(offset+tt*slope)  ).^2);


M(istart,istop)=(var/length(tt));


clear tt yy slope
    end
    
end


%% Determining the median values of the std for each value of n

[row col]=find(M~=-inf);

m=1;
for i=n0:length(row)-10
 ind=find((col-row)==i-1);

 if isempty(ind)==0
 
  xi=row(ind);
  yi=col(ind);
  
  for k=1:length(xi)
  sigmas(k)=M(xi(k),yi(k));
  end
  
%    
%   figure(2)
%   plot(i*ones(1,length(sigmas)),sigmas,'.')
%   hold on
%   errorbar(i,median(sigmas),std(sigmas),'rs')
  
  sig_med=median(sigmas);
  sig_error=std(sigmas);
  
  BB(m,1)=i;
  BB(m,2)=sig_med;
  BB(m,3)=sig_error;
  
  m=m+1;
  clear xi yi sigmas ind sig_med sig_error
 

 else
  break  
 end
end


%% Calculates the sigma of the population by fitting the median values over
%the thrn points

[c,i1]=min(abs(BB(:,1)-thrn));
xx=BB(1:i1,1);
yy=BB(1:i1,2);

ff=@(pp,xx) pp(1).*(xx-1)./xx + pp(2);
options = optimoptions('lsqcurvefit','Algorithm','levenberg-marquardt','Display','off');%);
beta0=lsqcurvefit(ff,[0.5 0.5],xx,yy,[],[],options);


sigP=beta0(1)+beta0(2); %Sigma of the population

% figure(3)
% plot(xx,yy,'.',xx,ff(beta0,xx),'-')


% beta0(1)
% beta0(2)
sigP=sqrt(sigP);

close(h)
