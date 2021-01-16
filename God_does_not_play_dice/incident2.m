function varargout = incident2(varargin)
% INCIDENT2 MATLAB code for incident2.fig
%      INCIDENT2, by itself, creates a new INCIDENT2 or raises the existing
%      singleton*.
%
%      H = INCIDENT2 returns the handle to a new INCIDENT2 or the handle to
%      the existing singleton*.
%
%      INCIDENT2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INCIDENT2.M with the given input arguments.
%
%      INCIDENT2('Property','Value',...) creates a new INCIDENT2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before incident2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to incident2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help incident2

% Last Modified by GUIDE v2.5 14-Jan-2021 19:56:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @incident2_OpeningFcn, ...
                   'gui_OutputFcn',  @incident2_OutputFcn, ...
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


% --- Executes just before incident2 is made visible.
function incident2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to incident2 (see VARARGIN)
% Choose default command line output for incident2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes incident2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = incident2_OutputFcn(hObject, eventdata, handles) 
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
set(handles.text5,'string','哈哈哈哈')
f = msgbox('事件2结束,请回到地图','incident2','warn');
waitfor(f);
pause(1);
close(incident2);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','map_state',0);
character_feature = evalin('base','character_feature');
if character_feature(9) <= 100
    set(handles.text5,'string','小伙纸，没钱求啥婚呢，你这不是闹么')
else
    married_rate = unidrnd(100);
    if married_rate+character_feature(7)/10+character_feature(8)/10 >50
        %求婚成功
        plus_feature =character_feature;
        plus_feature(9) = -round(character_feature(9)/2);
        character_feature = character_feature+plus_feature;
        set(handles.text5,'string','恭喜恭喜，求婚成功！人物属性翻倍，请在人物属性界面查看！');
        assignin('base','character_feature',character_feature)
        assignin('base','plus_feature',plus_feature)
    else
        plus_feature = zeros(1,9);
        plus_feature(9) = -round(character_feature(9)/2);
        character_feature = character_feature+plus_feature;
        set(handles.text5,'string','嘻嘻，恭喜单身');
        assignin('base','character_feature',character_feature)
        assignin('base','plus_feature',plus_feature)
    end
end
f = msgbox('事件2结束,请回到地图','incident2','warn');
waitfor(f);
pause(1);
close(incident2);
        
    
