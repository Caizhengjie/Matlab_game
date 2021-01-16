function varargout = incident3(varargin)
% INCIDENT3 MATLAB code for incident3.fig
%      INCIDENT3, by itself, creates a new INCIDENT3 or raises the existing
%      singleton*.
%
%      H = INCIDENT3 returns the handle to a new INCIDENT3 or the handle to
%      the existing singleton*.
%
%      INCIDENT3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INCIDENT3.M with the given input arguments.
%
%      INCIDENT3('Property','Value',...) creates a new INCIDENT3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before incident3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to incident3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help incident3

% Last Modified by GUIDE v2.5 15-Jan-2021 09:14:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @incident3_OpeningFcn, ...
                   'gui_OutputFcn',  @incident3_OutputFcn, ...
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


% --- Executes just before incident3 is made visible.
function incident3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to incident3 (see VARARGIN)
% Choose default command line output for incident3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes incident3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = incident3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','map_state',0);
rate = unidrnd(100);
if rate >= 70
    character_feature = evalin('base','character_feature');
    plus_feature = unidrnd(100,[1,9]);
    character_feature = character_feature+plus_feature;
    set(handles.text5,'string','天选之人，30%命中，人物属性得到大幅度提升');
    assignin('base','character_feature',character_feature);
    assignin('base','plus_feature',plus_feature);
else
    set(handles.text5,'string','70%概率没中，正常。');
end
f = msgbox('事件3结束,请回到地图','incident3','warn');
waitfor(f);
pause(1);
close(incident3);
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','map_state',0);
rate = unidrnd(100);
if rate >= 30
    character_feature = evalin('base','character_feature');
    plus_feature = unidrnd(30,[1,9]);
    character_feature = character_feature+plus_feature;
    set(handles.text4,'string','恭喜，人物属性得到小幅度提升');
    assignin('base','character_feature',character_feature);
    assignin('base','plus_feature',plus_feature);
else
    set(handles.text4,'string','70%概率没中，你有点脸黑。');
end
f = msgbox('事件3结束,请回到地图','incident3','warn');
waitfor(f);
pause(1);
close(incident3);
