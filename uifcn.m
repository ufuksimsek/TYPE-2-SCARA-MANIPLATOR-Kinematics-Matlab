function varargout = uifcn(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @uifcn_OpeningFcn, ...
                   'gui_OutputFcn',  @uifcn_OutputFcn, ...
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


% --- Executes just before uifcn is made visible.
function uifcn_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to uifcn (see VARARGIN)

% Choose default command line output for uifcn
handles.output = hObject;
global teta1 
global teta2 
global teta4
global teta5 
global teta6
global d3
global kaciklik 
kaciklik= 0;
global px 
global py 
global pz
global alfa 
global beta
global gamma
global psbt
global T06

teta1 = 0;
teta2 = 0;
teta4 = 0;
teta5 = 0;
teta6 = 0;
d3 = 1;
axes(handles.axes1);
ilerifcn(teta1,teta2,teta4,teta5,teta6,d3);
axes(handles.axes2);
tersfcn(1 , 0 , 1 , 0 , 0 , 1, 1, kaciklik);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes uifcn wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = uifcn_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function teta1_Callback(hObject, eventdata, handles)
% hObject    handle to teta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global teta1 
global teta2 
global teta4
global teta5 
global teta6
global d3
global T06

teta1=get(hObject,'Value')
axes(handles.axes1);
ilerifcn(teta1,teta2,teta4,teta5,teta6,d3);
set(handles.ileri,'Data',T06);
R01 = [cos(teta1) -sin(teta1) 0 ; sin(teta1) cos(teta1) 0; 0 0 1];
    
R12 = [cos(teta2) -sin(teta2) 0 ; sin(teta2) cos(teta2) 0; 0 0 1];    

R23 = [1 0 0 ; 0 1 0; 0 0 -1];     

R34 = [cos(teta4) -sin(teta4) 0 ; sin(teta4) cos(teta4) 0; 0 0 1];    
   
R45 = [cos(teta5) -sin(teta5) 0 ; 0 0 -1; sin(teta5) cos(teta5) 0];     
    
R56 = [cos(teta6) -sin(teta6) 0 ; 0 0 1; -sin(teta6) -cos(teta6) 0];     
   
R01=R01;
R02=R01*R12;
R03=R01*R12*R23;
R04=R01*R12*R23*R34;
R05=R01*R12*R23*R34*R45;
R06=R01*R12*R23*R34*R45*R56;

Z01=R01*[0;0;1]
Z02=R02*[0;0;1]
Z03=R03*[0;0;0]
Z04=R04*[0;0;1]
Z05=R05*[0;0;1]
Z06=R06*[0;0;1]

J = [ - sin(teta1) - cos(teta1)*sin(teta2) - cos(teta2)*sin(teta1), - cos(teta1)*sin(teta2) - cos(teta2)*sin(teta1), 0, 0, 0, 0;
      cos(teta1) + cos(teta1)*cos(teta2) - sin(teta1)*sin(teta2),   cos(teta1)*cos(teta2) - sin(teta1)*sin(teta2), 0, 0, 0, 0;
      0, 0, -1, 0, 0, 0;
      Z01,Z02,Z03,Z04,Z05,Z06]
  set(handles.uitable7,'Data',J);
  set(handles.teta1t,'String',num2str(teta1));


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function teta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to teta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function teta2_Callback(hObject, eventdata, handles)
% hObject    handle to teta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global teta1 
global teta2 
global teta4
global teta5 
global teta6
global d3
global T06

teta2=get(hObject,'Value')
axes(handles.axes1);
ilerifcn(teta1,teta2,teta4,teta5,teta6,d3);
set(handles.ileri,'Data',T06);
R01 = [cos(teta1) -sin(teta1) 0 ; sin(teta1) cos(teta1) 0; 0 0 1];
    
R12 = [cos(teta2) -sin(teta2) 0 ; sin(teta2) cos(teta2) 0; 0 0 1];    

R23 = [1 0 0 ; 0 1 0; 0 0 -1];     

R34 = [cos(teta4) -sin(teta4) 0 ; sin(teta4) cos(teta4) 0; 0 0 1];    
   
R45 = [cos(teta5) -sin(teta5) 0 ; 0 0 -1; sin(teta5) cos(teta5) 0];     
    
R56 = [cos(teta6) -sin(teta6) 0 ; 0 0 1; -sin(teta6) -cos(teta6) 0];     
   
R01=R01;
R02=R01*R12;
R03=R01*R12*R23;
R04=R01*R12*R23*R34;
R05=R01*R12*R23*R34*R45;
R06=R01*R12*R23*R34*R45*R56;

Z01=R01*[0;0;1]
Z02=R02*[0;0;1]
Z03=R03*[0;0;0]
Z04=R04*[0;0;1]
Z05=R05*[0;0;1]
Z06=R06*[0;0;1]

J = [ - sin(teta1) - cos(teta1)*sin(teta2) - cos(teta2)*sin(teta1), - cos(teta1)*sin(teta2) - cos(teta2)*sin(teta1), 0, 0, 0, 0;
      cos(teta1) + cos(teta1)*cos(teta2) - sin(teta1)*sin(teta2),   cos(teta1)*cos(teta2) - sin(teta1)*sin(teta2), 0, 0, 0, 0;
      0, 0, -1, 0, 0, 0;
      Z01,Z02,Z03,Z04,Z05,Z06]
  set(handles.uitable7,'Data',J);
  set(handles.teta2t,'String',num2str(teta2));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function teta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to teta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function teta4_Callback(hObject, eventdata, handles)
% hObject    handle to teta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global teta1 
global teta2 
global teta4
global teta5 
global teta6
global d3
global T06

teta4=get(hObject,'Value');
axes(handles.axes1);
ilerifcn(teta1,teta2,teta4,teta5,teta6,d3);
set(handles.ileri,'Data',T06);
R01 = [cos(teta1) -sin(teta1) 0 ; sin(teta1) cos(teta1) 0; 0 0 1];
    
R12 = [cos(teta2) -sin(teta2) 0 ; sin(teta2) cos(teta2) 0; 0 0 1];    

R23 = [1 0 0 ; 0 1 0; 0 0 -1];     

R34 = [cos(teta4) -sin(teta4) 0 ; sin(teta4) cos(teta4) 0; 0 0 1];    
   
R45 = [cos(teta5) -sin(teta5) 0 ; 0 0 -1; sin(teta5) cos(teta5) 0];     
    
R56 = [cos(teta6) -sin(teta6) 0 ; 0 0 1; -sin(teta6) -cos(teta6) 0];     
   
R01=R01;
R02=R01*R12;
R03=R01*R12*R23;
R04=R01*R12*R23*R34;
R05=R01*R12*R23*R34*R45;
R06=R01*R12*R23*R34*R45*R56;

Z01=R01*[0;0;1]
Z02=R02*[0;0;1]
Z03=R03*[0;0;0]
Z04=R04*[0;0;1]
Z05=R05*[0;0;1]
Z06=R06*[0;0;1]

J = [ - sin(teta1) - cos(teta1)*sin(teta2) - cos(teta2)*sin(teta1), - cos(teta1)*sin(teta2) - cos(teta2)*sin(teta1), 0, 0, 0, 0;
      cos(teta1) + cos(teta1)*cos(teta2) - sin(teta1)*sin(teta2),   cos(teta1)*cos(teta2) - sin(teta1)*sin(teta2), 0, 0, 0, 0;
      0, 0, -1, 0, 0, 0;
      Z01,Z02,Z03,Z04,Z05,Z06]
  set(handles.uitable7,'Data',J);
  set(handles.teta4t,'String',num2str(teta4));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function teta4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to teta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function teta5_Callback(hObject, eventdata, handles)
% hObject    handle to teta5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global teta1 
global teta2 
global teta4
global teta5 
global teta6
global d3
global T06

teta5=get(hObject,'Value')
axes(handles.axes1);
set(handles.ileri,'Data',T06);
ilerifcn(teta1,teta2,teta4,teta5,teta6,d3);
R01 = [cos(teta1) -sin(teta1) 0 ; sin(teta1) cos(teta1) 0; 0 0 1];
    
R12 = [cos(teta2) -sin(teta2) 0 ; sin(teta2) cos(teta2) 0; 0 0 1];    

R23 = [1 0 0 ; 0 1 0; 0 0 -1];     

R34 = [cos(teta4) -sin(teta4) 0 ; sin(teta4) cos(teta4) 0; 0 0 1];    
   
R45 = [cos(teta5) -sin(teta5) 0 ; 0 0 -1; sin(teta5) cos(teta5) 0];     
    
R56 = [cos(teta6) -sin(teta6) 0 ; 0 0 1; -sin(teta6) -cos(teta6) 0];     
   
R01=R01;
R02=R01*R12;
R03=R01*R12*R23;
R04=R01*R12*R23*R34;
R05=R01*R12*R23*R34*R45;
R06=R01*R12*R23*R34*R45*R56;

Z01=R01*[0;0;1]
Z02=R02*[0;0;1]
Z03=R03*[0;0;0]
Z04=R04*[0;0;1]
Z05=R05*[0;0;1]
Z06=R06*[0;0;1]

J = [ - sin(teta1) - cos(teta1)*sin(teta2) - cos(teta2)*sin(teta1), - cos(teta1)*sin(teta2) - cos(teta2)*sin(teta1), 0, 0, 0, 0;
      cos(teta1) + cos(teta1)*cos(teta2) - sin(teta1)*sin(teta2),   cos(teta1)*cos(teta2) - sin(teta1)*sin(teta2), 0, 0, 0, 0;
      0, 0, -1, 0, 0, 0;
      Z01,Z02,Z03,Z04,Z05,Z06]
  set(handles.uitable7,'Data',J);
  set(handles.teta5t,'String',num2str(teta5));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function teta5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to teta5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function teta6_Callback(hObject, eventdata, handles)
% hObject    handle to teta6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global teta1 
global teta2 
global teta4
global teta5 
global teta6
global d3
global T06

teta6=get(hObject,'Value')
axes(handles.axes1);
ilerifcn(teta1,teta2,teta4,teta5,teta6,d3);
set(handles.ileri,'Data',T06);
R01 = [cos(teta1) -sin(teta1) 0 ; sin(teta1) cos(teta1) 0; 0 0 1];
    
R12 = [cos(teta2) -sin(teta2) 0 ; sin(teta2) cos(teta2) 0; 0 0 1];    

R23 = [1 0 0 ; 0 1 0; 0 0 -1];     

R34 = [cos(teta4) -sin(teta4) 0 ; sin(teta4) cos(teta4) 0; 0 0 1];    
   
R45 = [cos(teta5) -sin(teta5) 0 ; 0 0 -1; sin(teta5) cos(teta5) 0];     
    
R56 = [cos(teta6) -sin(teta6) 0 ; 0 0 1; -sin(teta6) -cos(teta6) 0];     
   
R01=R01;
R02=R01*R12;
R03=R01*R12*R23;
R04=R01*R12*R23*R34;
R05=R01*R12*R23*R34*R45;
R06=R01*R12*R23*R34*R45*R56;

Z01=R01*[0;0;1]
Z02=R02*[0;0;1]
Z03=R03*[0;0;0]
Z04=R04*[0;0;1]
Z05=R05*[0;0;1]
Z06=R06*[0;0;1]

J = [ - sin(teta1) - cos(teta1)*sin(teta2) - cos(teta2)*sin(teta1), - cos(teta1)*sin(teta2) - cos(teta2)*sin(teta1), 0, 0, 0, 0;
      cos(teta1) + cos(teta1)*cos(teta2) - sin(teta1)*sin(teta2),   cos(teta1)*cos(teta2) - sin(teta1)*sin(teta2), 0, 0, 0, 0;
      0, 0, -1, 0, 0, 0;
      Z01,Z02,Z03,Z04,Z05,Z06]
  set(handles.uitable7,'Data',J);
  set(handles.teta6t,'String',num2str(teta6));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function teta6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to teta6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function d3_Callback(hObject, eventdata, handles)
% hObject    handle to d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global teta1 
global teta2 
global teta4
global teta5 
global teta6
global d3
global T06

d3=get(hObject,'Value')
axes(handles.axes1);
ilerifcn(teta1,teta2,teta4,teta5,teta6,d3);
set(handles.ileri,'Data',T06);
R01 = [cos(teta1) -sin(teta1) 0 ; sin(teta1) cos(teta1) 0; 0 0 1];
    
R12 = [cos(teta2) -sin(teta2) 0 ; sin(teta2) cos(teta2) 0; 0 0 1];    

R23 = [1 0 0 ; 0 1 0; 0 0 -1];     

R34 = [cos(teta4) -sin(teta4) 0 ; sin(teta4) cos(teta4) 0; 0 0 1];    
   
R45 = [cos(teta5) -sin(teta5) 0 ; 0 0 -1; sin(teta5) cos(teta5) 0];     
    
R56 = [cos(teta6) -sin(teta6) 0 ; 0 0 1; -sin(teta6) -cos(teta6) 0];     
   
R01=R01;
R02=R01*R12;
R03=R01*R12*R23;
R04=R01*R12*R23*R34;
R05=R01*R12*R23*R34*R45;
R06=R01*R12*R23*R34*R45*R56;

Z01=R01*[0;0;1]
Z02=R02*[0;0;1]
Z03=R03*[0;0;0]
Z04=R04*[0;0;1]
Z05=R05*[0;0;1]
Z06=R06*[0;0;1]

J = [ - sin(teta1) - cos(teta1)*sin(teta2) - cos(teta2)*sin(teta1), - cos(teta1)*sin(teta2) - cos(teta2)*sin(teta1), 0, 0, 0, 0;
      cos(teta1) + cos(teta1)*cos(teta2) - sin(teta1)*sin(teta2),   cos(teta1)*cos(teta2) - sin(teta1)*sin(teta2), 0, 0, 0, 0;
      0, 0, -1, 0, 0, 0;
      Z01,Z02,Z03,Z04,Z05,Z06]
  set(handles.uitable7,'Data',J);
  set(handles.d3t,'String',num2str(d3));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function d3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function ileri_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ileri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider10_Callback(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider11_Callback(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider12_Callback(hObject, eventdata, handles)
% hObject    handle to slider12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider13_Callback(hObject, eventdata, handles)
% hObject    handle to slider13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function teta4t_Callback(hObject, eventdata, handles)
% hObject    handle to teta4t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of teta4t as text
%        str2double(get(hObject,'String')) returns contents of teta4t as a double


% --- Executes during object creation, after setting all properties.
function teta4t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to teta4t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function teta1t_Callback(hObject, eventdata, handles)
% hObject    handle to teta1t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of teta1t as text
%        str2double(get(hObject,'String')) returns contents of teta1t as a double


% --- Executes during object creation, after setting all properties.
function teta1t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to teta1t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function teta6t_Callback(hObject, eventdata, handles)
% hObject    handle to teta6t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of teta6t as text
%        str2double(get(hObject,'String')) returns contents of teta6t as a double


% --- Executes during object creation, after setting all properties.
function teta6t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to teta6t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function teta2t_Callback(hObject, eventdata, handles)
% hObject    handle to teta2t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of teta2t as text
%        str2double(get(hObject,'String')) returns contents of teta2t as a double


% --- Executes during object creation, after setting all properties.
function teta2t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to teta2t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function teta5t_Callback(hObject, eventdata, handles)
% hObject    handle to teta5t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of teta5t as text
%        str2double(get(hObject,'String')) returns contents of teta5t as a double


% --- Executes during object creation, after setting all properties.
function teta5t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to teta5t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d3t_Callback(hObject, eventdata, handles)
% hObject    handle to d3t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d3t as text
%        str2double(get(hObject,'String')) returns contents of d3t as a double


% --- Executes during object creation, after setting all properties.
function d3t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d3t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cizileri.
function cizileri_Callback(hObject, eventdata, handles)
% hObject    handle to cizileri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global teta1 
global teta2 
global teta4
global teta5 
global teta6
global d3
global T06

teta1= str2double(get(handles.teta1t,'String'))
teta2= str2double(get(handles.teta2t,'String'))
teta4= str2double(get(handles.teta4t,'String'))
teta5= str2double(get(handles.teta5t,'String'))
teta6= str2double(get(handles.teta6t,'String'))
d3= str2double(get(handles.d3t,'String'))
axes(handles.axes1);
ilerifcn(teta1,teta2,teta4,teta5,teta6,d3);
set(handles.ileri,'Data',T06);



function px_Callback(hObject, eventdata, handles)
% hObject    handle to px (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of px as text
%        str2double(get(hObject,'String')) returns contents of px as a double


% --- Executes during object creation, after setting all properties.
function px_CreateFcn(hObject, eventdata, handles)
% hObject    handle to px (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function py_Callback(hObject, eventdata, handles)
% hObject    handle to py (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of py as text
%        str2double(get(hObject,'String')) returns contents of py as a double


% --- Executes during object creation, after setting all properties.
function py_CreateFcn(hObject, eventdata, handles)
% hObject    handle to py (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pz_Callback(hObject, eventdata, handles)
% hObject    handle to pz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pz as text
%        str2double(get(hObject,'String')) returns contents of pz as a double


% --- Executes during object creation, after setting all properties.
function pz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alfa_Callback(hObject, eventdata, handles)
% hObject    handle to alfa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alfa as text
%        str2double(get(hObject,'String')) returns contents of alfa as a double


% --- Executes during object creation, after setting all properties.
function alfa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alfa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function beta_Callback(hObject, eventdata, handles)
% hObject    handle to beta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of beta as text
%        str2double(get(hObject,'String')) returns contents of beta as a double


% --- Executes during object creation, after setting all properties.
function beta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to beta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gama_Callback(hObject, eventdata, handles)
% hObject    handle to gama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gama as text
%        str2double(get(hObject,'String')) returns contents of gama as a double


% --- Executes during object creation, after setting all properties.
function gama_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tersbtn.
function tersbtn_Callback(hObject, eventdata, handles)
% hObject    handle to tersbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global px 
global py 
global pz
global alfa 
global beta
global gamma
global psbt
global T06
global kaciklik


px= str2double(get(handles.px,'String'))
py= str2double(get(handles.py,'String'))
pz= str2double(get(handles.pz,'String'))
alfa= str2double(get(handles.alfa,'String'))
beta= str2double(get(handles.beta,'String'))
gamma= str2double(get(handles.gama,'String'))


axes(handles.axes2);
tersfcn(px , py , pz , alfa , beta , gamma, psbt, kaciklik);
set(handles.ters,'Data',T06);



% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global psbt
psbt=2;
% Hint: get(hObject,'Value') returns toggle state of radiobutton2



% --- Executes when selected object is changed in uipanel4.
function uipanel4_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel4 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
global psbt
newButton=get(eventdata.NewValue,'tag');
switch newButton
     case 'radiobutton1'
        psbt=1
     case 'radiobutton2'
        psbt=2
end
         
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global kaciklik 
if get(hObject,'Value') kaciklik=0.3;
else kaciklik=0;
end
% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
