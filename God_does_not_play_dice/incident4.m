function varargout = incident4(varargin)
% INCIDENT4 MATLAB code for incident4.fig
%      INCIDENT4, by itself, creates a new INCIDENT4 or raises the existing
%      singleton*.
%
%      H = INCIDENT4 returns the handle to a new INCIDENT4 or the handle to
%      the existing singleton*.
%
%      INCIDENT4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INCIDENT4.M with the given input arguments.
%
%      INCIDENT4('Property','Value',...) creates a new INCIDENT4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before incident4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to incident4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help incident4

% Last Modified by GUIDE v2.5 16-Jan-2021 09:43:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @incident4_OpeningFcn, ...
                   'gui_OutputFcn',  @incident4_OutputFcn, ...
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


% --- Executes just before incident4 is made visible.
function incident4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to incident4 (see VARARGIN)
% Choose default command line output for incident4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes incident4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = incident4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','map_state',0);
character_feature = evalin('base','character_feature');
age = unidrnd(100);
if age < 31
    plus_feature = unidrnd(100,[1,8]);
    plus_feature(9) = 0;
    set(handles.text3,'string',[num2str(age),'     请在人物属性界面检查提升数值。'])
elseif age >= 31 && age <= 60
    plus_feature = unidrnd(30,[1,8]);
    plus_feature(9) = 0;
    set(handles.text3,'string',[num2str(age),'     大叔请您在人物属性界面检查提升数值。'])
else
    plus_feature = -unidrnd(50,[1,8]);
    plus_feature(9) = 0;
    set(handles.text3,'string',[num2str(age),'     老大爷请您在人物属性界面检查衰减数值。'])
end
character_feature = character_feature+plus_feature;
assignin('base','character_feature',character_feature);
assignin('base','plus_feature',plus_feature);
f = msgbox('事件4结束,请回到地图','incident4','warn');
waitfor(f);
pause(1);
close(incident4);