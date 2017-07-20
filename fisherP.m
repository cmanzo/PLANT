

function [FF,nn]=fisherP(xpf,ypf,t,yreal)



FF=zeros(length(xpf)-2,1);
for i=1:length(xpf)-2
   [cc1,in1]=min(abs(t-xpf(i)));
   [cc2,in2]=min(abs(t-xpf(i+1)));
   [cc3,in3]=min(abs(t-xpf(i+2)));
   
   xdata=t(in1:in3);
   ydata=yreal(in1:in3); 

      
      tt=xdata;
      yy=ydata;
      slope = sum((tt-mean(tt)).*(yy-mean(yy)))/sum((tt-mean(tt)).^2);
      offset = mean(yy)-slope*mean(tt);  
      RSS1=sum(( yy-(offset+tt*slope)  ).^2);
      p1=2;
      n1=length(xdata);
      clear tt yy slope offset
   
  
   if in3-in2<=2 || in2-in1<=2 %This conditional is to eliminate the traces shorter than two points       
      display(['Houston we had a problem!!!',num2str(in1),' ',num2str(in2) , ' ',num2str(in3)])
       RSS2=100;
     
   else

      tt=t(in1:in2);
      yy=yreal(in1:in2);
      slope = sum((tt-mean(tt)).*(yy-mean(yy)))/sum((tt-mean(tt)).^2);
      offset = mean(yy)-slope*mean(tt);  
      RSS2_1=sum(( yy-(offset+tt*slope)  ).^2);
      clear tt yy slope offset

      tt=t(in2:in3);
      yy=yreal(in2:in3);
      slope = sum((tt-mean(tt)).*(yy-mean(yy)))/sum((tt-mean(tt)).^2);
      offset = mean(yy)-slope*mean(tt);  
      RSS2_2=sum(( yy-(offset+tt*slope)  ).^2);
      clear tt yy slope offset
      
      RSS2=RSS2_1+RSS2_2;
      
   end
   
   p2=4;
   FF(i)=((RSS1-RSS2)/(p2-p1))/(RSS2/(n1-p2)); 
   nn(i)=n1;



end


 if length(xpf)==2
    nn=length(yreal);
   end



end


