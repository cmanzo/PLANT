function varargout = PLANT(varargin)
% PLANT MATLAB code for PLANT.fig
%      PLANT, by itself, creates a new PLANT or raises the existing
%      singleton*.
%
%      H = PLANT returns the handle to a new PLANT or the handle to
%      the existing singleton*.
%
%      PLANT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLANT.M with the given input arguments.
%
%      PLANT('Property','Value',...) creates a new PLANT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PLANT_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PLANT_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PLANT

% Last Modified by GUIDE v2.5 19-Dec-2016 17:33:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PLANT_OpeningFcn, ...
                   'gui_OutputFcn',  @PLANT_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT




% --- Executes just before PLANT is made visible.
function PLANT_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PLANT (see VARARGIN)

% Choose default command line output for PLANT
handles.output = hObject;
handles.flag1=0; %% (new) initialize the variables Thr=30 and Nmin=3 in case the setting have not been modified;
handles.flag2=0;
handles.flag3=0;
handles.flag4=0; %load simulated (radiobox selected by default)
handles.runind=0;% to indicate that the data is already loaded. If ruind is 0 then show a warning message
handles.simind=0; %not data has been simulated. Show error mesage if this value is equal to 0
handles.alpha=0.95;
handles.Nmin=3;
handles.sigmap=0; %default value

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PLANT wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PLANT_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)

% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double






% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Estimate_sigma.
function Estimate_sigma_Callback(hObject, eventdata, handles)
% hObject    handle to Estimate_sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rgb2=get(handles.Estimate_sigma,'BackgroundColor');
set(handles.Load,'BackgroundColor',rgb2);

if handles.runind==0
    warndlg('You need to load some data!')
    return
end


fg=handles.flag1;

if fg==1
Thr=handles.val1n;
n0=handles.val2n;
else
    Thr=30;
    n0=3;
end

XY=handles.AA;

sigP=Sigma_estimator(XY,Thr,n0);
handles.sigmap=sigP;


guidata(hObject,handles);
set(handles.Sigma_value,'String',sigP)





% --- Executes on button press in Segment_data.
function Segment_data_Callback(hObject, eventdata, handles)
% hObject    handle to Segment_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rgb3=get(handles.Segment_data,'BackgroundColor');
set(handles.Load,'BackgroundColor',rgb3);


if handles.runind==0
    warndlg('You need to load some data!')
    return
end

if handles.sigmap<=0
    warndlg('You need to introduce a sigma value>0 !')
    return
end

if handles.alpha<0 || handles.alpha>1 
    warndlg('You need to introduce a valid alpha value! (0<alpha<1)')
    return
end

if handles.Nmin<3 
    warndlg('Nmin have to be >2!!')
    return
end

XY=handles.AA;
sigP1=handles.sigmap;
prob=handles.alpha;
n0=handles.Nmin;

AA=Segm_alg(XY,n0,prob,sigP1,1);

alldata=handles.AA;
guidata(hObject,handles);
dlmwrite('segmentedata.txt',alldata,'delimiter','\t')




% --- Executes on button press in settings.
function settings_Callback(hObject, eventdata, handles)
% hObject    handle to settings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Number of points to fit:','Min number of points to fit:'};
dlg_title = 'Input';
num_lines = 1;
defaultans = {'30','3'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);

val1=str2num(answer{1});
val2=str2num(answer{2});
handles.val1n=val1;
handles.val2n=val2;

handles.flag1=1; % to indicate that the button was pressed

guidata(hObject,handles);






function Sigma_value_Callback(hObject, eventdata, handles)
% hObject    handle to Sigma_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Sigma_value as text
%        str2double(get(hObject,'String')) returns contents of Sigma_value as a double
val=get(hObject,'String');
newval=str2double(val);
handles.sigmap=newval;
guidata(hObject,handles);



 
function Nmin_value_Callback(hObject, eventdata, handles)
% hObject    handle to Nmin_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Nmin_value as text
%        str2double(get(hObject,'String')) returns contents of Nmin_value as a double
clear val newval
val=get(hObject,'String');
newval=str2double(val);
handles.Nmin=newval;
guidata(hObject,handles);


function alpha_value_Callback(hObject, eventdata, handles)
% hObject    handle to alpha_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha_value as text
%        str2double(get(hObject,'String')) returns contents of alpha_value as a double
clear val newval
val=get(hObject,'String');
newval=str2double(val);
handles.alpha=newval;
guidata(hObject,handles);




% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1

if (get(hObject,'Value') == get(hObject,'Max'))
	flag=1;
else
	flag=0;
end

handles.flag2=flag;
guidata(hObject,handles);




function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Load.
function Load_Callback(hObject, eventdata, handles)
% hObject    handle to Load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


fg4=handles.flag4;
% guidata(hObject,handles);
% set(handles.edit7,'String',test)
if fg4==0 %load simulated (radiobox selected by default)
 
  if handles.simind==0
     warndlg('You need to simulate some data first!!')
      return
    
  end
  
  temp=handles.Asim1;
  handles.AA=temp;
  handles.Asim1=[];
else %load experimental
   [Filename,Path]=uigetfile({'.txt'},'Open file with X, Y coordinates');

     if isequal(Filename,0)
         return
     else
         AA0=importdata([Path Filename]);
     end

handles.AA=AA0;
end
set(handles.Load,'BackgroundColor',[1 0 0]);
indrun=1;
handles.runind=indrun;% to indicate that the data is already loaded. If ruind is 0 then show a warning message
guidata(hObject,handles);




% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in settings1.
function settings1_Callback(hObject, eventdata, handles)
% hObject    handle to settings1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Number of points in the trace:',...
    'Standard deviation:','Min velocity:','Max velocity:',...
    'Average segment duration'};

dlg_title = 'Input';
num_lines = 1;
defaultans = {'200','0.5','-0.2','0.4','20'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);

%val1=str2double(answer{1});
val2=str2num(answer{1});
val3=str2double(answer{2});
val4=str2double(answer{3});
val5=str2double(answer{4});
val6=str2double(answer{5});


handles.dt=1;%val1;
handles.Ntot=val2;
handles.sigsim=val3;
handles.vmin=val4;
handles.vmax=val5;
handles.tau=val6;

handles.flag3=1; % to indicate that the button was pressed

guidata(hObject,handles);




% --- Executes on button press in simulated.
function simulated_Callback(hObject, eventdata, handles)
% hObject    handle to simulated (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of simulated


% --- Executes on button press in experimental.
function experimental_Callback(hObject, eventdata, handles)
% hObject    handle to experimental (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of experimental


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rgb1=get(handles.pushbutton15,'BackgroundColor');
set(handles.Load,'BackgroundColor',rgb1);
fg3=handles.flag3;


if fg3==1
   dt1=handles.dt;
   Ntot1=handles.Ntot;
   sigsim1=handles.sigsim;
   vmin1=handles.vmin;
   vmax1=handles.vmax;
   tau1=handles.tau;

else
   dt1=1;
   Ntot1=200;
   sigsim1=0.5;
   vmin1=-0.2;
   vmax1=0.4;
   tau1=20;

       
end

Asim=generate_trace(dt1,Ntot1,sigsim1,vmin1,vmax1,tau1);
handles.Asim1=Asim;

dlmwrite('simtrace.txt',Asim,'delimiter','\t')
handles.simind=1;
guidata(hObject,handles);


% --- Executes when selected object is changed in uipanel4.
function uipanel4_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel4 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

% set(handles.experimental,'Value','max');

if hObject==handles.simulated
    fg4=0; %simulated trace
else
    fg4=1; %experimental trace
    
end

handles.flag4=fg4;
guidata(hObject,handles);
    
    


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 msgbox('PLANT. SOFTWARE VERSION 1.1. A.Sosa-Costa & C. Manzo, Dec. 2016' )
