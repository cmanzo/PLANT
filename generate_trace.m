%   clear all
%   close all
% % 
% tau=20; %%(s) average segment duration
% Ntot=200; % (steps) length of trajectory
% dt= 1; %%(s)
% sigteo=.2; % standard deviation
% vmin=-0.3;
% vmax=0.5;



 function [Asim, Adat]=generate_trace(dt,Ntot,sigteo,vmin,vmax,tau)
     
     slo_1=[];
    off_1=[];
 
    Ntot=Ntot-1;
    dd=[];
    trac=[0];
    t=[0];
    xps(1)=0;
    duration=random('exp',tau,1,1).*random('unif',0,1-1E-12,1,1);
    
    
    
  
   
    
    fla0=0;
    i=1;
    ig=0;
    fla1=min([floor(duration./dt) Ntot]);
    if fla1>fla0 %duration>=dt;%
        ig=ig+1;
        dd=[dd; fla1-fla0];
        
          slo_1=[slo_1; random('unif',vmin,vmax,1,1)]
    off_1=[off_1; trac(end)-slo_1(end)*t(end)];
    t=[t; ([duration/10:duration/10:duration])'];
    
    trac=[trac; trac(end)+slo_1(end).*([duration/10:duration/10:duration])'];
   
        
        
        xps(2)=fla1;  
    end
    
    s=3;
    while duration<Ntot*dt
        tip=random('exp',tau,1,1);
        fla0=floor(duration./dt);
        duration=duration+tip;
        
    
        
       
        
        i=i+1;
        fla1=min([floor(duration./dt) Ntot]);
        if fla1>fla0 %tip>=dt;%
            ig=ig+1;
            dd=[dd; fla1-fla0];
            
            
             slo_1=[slo_1; random('unif',vmin,vmax,1,1)];
        off_1=[off_1; trac(end)-slo_1(end)*t(end)];
        t=[t; t(end)+([tip/10:tip/10:tip])'];
        
        trac=[trac; trac(end)+slo_1(end).*[tip/10:tip/10:tip]'];
        
       
            
            
             xps(s)=fla1;
             s=s+1;
        end
        
    end
    
    tra=interp1(t/dt,trac,[0:Ntot]','linear');
    tra_noi=tra+random('norm',0,sigteo,size(tra,1),size(tra,2) );
    xx=[0:Ntot].*dt;
    
    Asim=[xx' tra_noi];
    
     if xps(2)==0
         xps(2)=[];
     end
%     
     yps=zeros(size(xps));
     yps(1)=tra(1);
     yps(2:end)=tra(xps(2:end)+1);
%     
%     figure
%     plot(t/dt,trac,'o-')
%     hold on
%     plot([0:Ntot].*dt,tra,'sr-')
%     plot(xps,yps,'og')
%     hold off
%     
    figure
    plot([0:Ntot].*dt,tra_noi,'.')
hold on
     plot(xps,yps+3*sigteo,'og','MArkerFaceColor','g')

xlabel('time')
ylabel('coordinate')

%if size(slo_1)<size(xps,2)
slo_1=[slo_1; NaN];
off_1=[off_1; NaN];
%end

Adat=[xps' yps' [diff(xps) NaN]' slo_1 off_1];

hold on
for i=1:size(Adat,1)-1
   plot(linspace(Adat(i,1),Adat(i+1,1),30), linspace(Adat(i,1),Adat(i+1,1),30)*Adat(i,4)+Adat(i,5),'m-', 'linewidth',2  )

end




