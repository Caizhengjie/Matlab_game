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
%��������
character_feature = evalin('base','character_feature');
origin_character = evalin('base','origin_character');
plus_feature1 = character_feature - origin_character;
plus_feature2 = round(plus_feature1./origin_character.*100);
achieve = round(sum(plus_feature2)/9);
if achieve < 100
    set(handles.text130,'string','ս�����');%һ���޷�ʵ��
elseif achieve > 100 && achieve < 200
    set(handles.text130,'string','��������');
elseif achieve > 200 && achieve < 300
    set(handles.text130,'string','������ʦ');
elseif achieve > 300 
    set(handles.text130,'string','ɨ��ɮ');
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
%ս������
set(handles.text201,'string',[num2str(final_date(4)),'��']);
set(handles.text202,'string',[num2str(final_date(18)),'��']);
set(handles.text203,'string',[num2str(final_date(19)),'��']);
set(handles.text204,'string',[num2str(final_date(17)),'��']);
if final_date(18) >= final_date(19) && final_date(18) >= final_date(17)
    set(handles.text205,'string','��������');
elseif final_date(19) >= final_date(18) && final_date(19) >= final_date(17)
    set(handles.text205,'string','������ɽ');
elseif final_date(17) >= final_date(18) && final_date(17) >= final_date(19)
     set(handles.text205,'string','���ܱ���');
end
%��ͼ����
for x = 1:9
    eval(['set(handles.text30',num2str(x),',''string'',[num2str(final_date(',num2str(x),')),''��'']);'])
end
for x=10:16
    eval(['set(handles.text3',num2str(x),',''string'',[num2str(final_date(',num2str(x),')),''��'']);'])
end
count = sum(final_date(1:16));
if count <= 10
    set(handles.text317,'string','����ͨ����');
elseif count > 10 && count < 50
    set(handles.text317,'string','���м�');
elseif count >=50 && count < 100
    set(handles.text317,'string','ð�ռ�');
else
    set(handles.text317,'string','ʱ�մ�����');
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
