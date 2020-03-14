function varargout = IPAtrans(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IPAtrans_OpeningFcn, ...
                   'gui_OutputFcn',  @IPAtrans_OutputFcn, ...
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
end
function IPAtrans_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
end
function varargout = IPAtrans_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end
function edit1_Callback(hObject, eventdata, handles)
end
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
function edit2_Callback(hObject, eventdata, handles)
end
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
function pushbutton1_Callback(hObject, eventdata, handles)
[rawDataNum, rawDataStr] = xlsread('IPA¿â1.3.0.csv');
str1=get(handles.edit1,'String');
str2=strrep(convertCharsToStrings(str1')," ","");
character=rawDataStr(2:21573,2);
IPA=rawDataStr(2:21573,4+get(handles.popupmenu1, 'value'));
for i=1:21572 
    str2=strrep(str2,character(i,1),IPA(i,1));
end
str2=strrep(str2,"¡¤"," ");
set(handles.edit2,'String',str2);
end
function popupmenu1_Callback(hObject, eventdata, handles)


end
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
