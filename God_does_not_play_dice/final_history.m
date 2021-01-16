function varargout = final_history(varargin)
% FINAL_HISTORY MATLAB code for final_history.fig
%      FINAL_HISTORY, by itself, creates a new FINAL_HISTORY or raises the existing
%      singleton*.
%
%      H = FINAL_HISTORY returns the handle to a new FINAL_HISTORY or the handle to
%      the existing singleton*.
%
%      FINAL_HISTORY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL_HISTORY.M with the given input arguments.
%
%      FINAL_HISTORY('Property','Value',...) creates a new FINAL_HISTORY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_history_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_history_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final_history

% Last Modified by GUIDE v2.5 16-Jan-2021 11:57:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_history_OpeningFcn, ...
                   'gui_OutputFcn',  @final_history_OutputFcn, ...
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


% --- Executes just before final_history is made visible.
function final_history_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final_history (see VARARGIN)

% Choose default command line output for final_history
handles.output = hObject;
%人物属性
character_feature = evalin('base','character_feature');
origin_character = evalin('base','origin_character');
plus_feature1 = character_feature - origin_character;
plus_feature2 = round(plus_feature1./origin_character.*100);
achieve = round(sum(plus_feature2)/9);
if achieve < 100
    set(handles.text130,'string','战术天才');%一般无法实现
elseif achieve > 100 && achieve < 200
    set(handles.text130,'string','武术高手');
elseif achieve > 200 && achieve < 300
    set(handles.text130,'string','绝代宗师');
elseif achieve > 300 
    set(handles.text130,'string','扫地僧');
end
for x = 1:9
    eval(['set(handles.text10',num2str(x),',''string'',num2str(origin_character(',num2str(x),')));'])
    eval(['set(handles.text11',num2str(x),',''string'',num2str(character_feature(',num2str(x),')));'])
    if plus_feature1(x) < 0
        eval(['str = strcat(num2str(plus_feature1(',num2str(x),')),''('',num2str(plus_feature2(',num2str(x),')),''%)'');'])
        eval(['set(handles.text12',num2str(x),',''string'',str);'])
    else
        eval(['str = strcat(''+'',num2str(plus_feature1(',num2str(x),')),''('',num2str(plus_feature2(',num2str(x),')),''%)'');'])
        eval(['set(handles.text12',num2str(x),',''string'',str);'])
    end
end
final_date = evalin('base','final_date');
%战斗经历
set(handles.text201,'string',[num2str(final_date(4)),'次']);
set(handles.text202,'string',[num2str(final_date(18)),'次']);
set(handles.text203,'string',[num2str(final_date(19)),'次']);
set(handles.text204,'string',[num2str(final_date(17)),'次']);
if final_date(18) >= final_date(19) && final_date(18) >= final_date(17)
    set(handles.text205,'string','疾如闪电');
elseif final_date(19) >= final_date(18) && final_date(19) >= final_date(17)
    set(handles.text205,'string','不动如山');
elseif final_date(17) >= final_date(18) && final_date(17) >= final_date(19)
     set(handles.text205,'string','明哲保身');
end
%地图剧情
for x = 1:9
    eval(['set(handles.text30',num2str(x),',''string'',[num2str(final_date(',num2str(x),')),''次'']);'])
end
for x=10:16
    eval(['set(handles.text3',num2str(x),',''string'',[num2str(final_date(',num2str(x),')),''次'']);'])
end
count = sum(final_date(1:16));
if count <= 10
    set(handles.text317,'string','最速通关者');
elseif count > 10 && count < 50
    set(handles.text317,'string','旅行家');
elseif count >=50 && count < 100
    set(handles.text317,'string','冒险家');
else
    set(handles.text317,'string','时空穿梭者');
end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final_history wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = final_history_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
