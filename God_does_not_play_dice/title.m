function varargout = title(varargin)
% TITLE MATLAB code for title.fig
%      TITLE, by itself, creates a new TITLE or raises the existing
%      singleton*.
%
%      H = TITLE returns the handle to a new TITLE or the handle to
%      the existing singleton*.
%
%      TITLE('CALLBACK',hObject,eventData,handles,...) calls the local  

%      function named CALLBACK in TITLE.M with the given input arguments.
%
%      TITLE('Property','Value',...) creates a new TITLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before title_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to title_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help title

% Last Modified by GUIDE v2.5 16-Jan-2021 10:05:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @title_OpeningFcn, ...
                   'gui_OutputFcn',  @title_OutputFcn, ...
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


% --- Executes just before title is made visible.
function title_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to title (see VARARGIN)
% Choose default command line output for title
handles.output = hObject;
imshow(imread('title.jpg'));
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes title wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = title_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%人物属性随机生成
character_feature = round(unidrnd(100,[1,9]).*1.5);
character_feature(5) = character_feature(5)*10;
assignin('base','character_feature',character_feature);
%人物天赋随机生成
talent1 = unidrnd(5);
talent_list = {'勇猛','嗜血','凝神','笑佛','无我'};
assignin('base','talent1',talent1);
assignin('base','talent2',0);
assignin('base','talent_list',talent_list);
%人物初始技能生成
assignin('base','skill_selected',0);
assignin('base','skill_rank',0);
assignin('base','skill_list',{'猛虎下山','野猪撞树','恪行守正','明志成杰'});
%其他参数
assignin('base','current_step',0);
assignin('base','plus_feature',zeros(1,9));
assignin('base','map_state',0);
%----统计数据
%初始地，红包，休息，战斗，捡东西，发工资，手游，商店，武学，求婚，健身，996，马拉松，野外，跳槽，过生日,战斗逃跑,先手，后手
assignin('base','final_date',zeros(1,19));
assignin('base','origin_character',character_feature);
assignin('base','final',0);
map();
charactor();
close(title);
% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%人物属性随机生成
character_feature = unidrnd(100,[1,9]);
character_feature(5) = character_feature(5)*10;
assignin('base','character_feature',character_feature);
%人物天赋随机生成
talent1 = unidrnd(5);
talent_list = {'勇猛','嗜血','凝神','笑佛','无我'};
assignin('base','talent1',talent1);
assignin('base','talent2',0);
assignin('base','talent_list',talent_list);
%人物初始技能生成
assignin('base','skill_selected',0);
assignin('base','skill_rank',0);
assignin('base','skill_list',{'猛虎下山','野猪撞树','恪行守正','明志成杰'});
%其他参数
assignin('base','current_step',0);
assignin('base','plus_feature',zeros(1,9));
assignin('base','map_state',0);
%----统计数据
%初始地，红包，休息，战斗，捡东西，发工资，手游，商店，武学，求婚，健身，996，马拉松，野外，跳槽，过生日,战斗逃跑,先手，后手
assignin('base','final_date',zeros(1,19));
assignin('base','origin_character',character_feature);
assignin('base','final',0);
map();
charactor();
close(title);
% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%人物属性随机生成
character_feature = round(unidrnd(100,[1,9]).*0.5);
character_feature(5) = character_feature(5)*10;
assignin('base','character_feature',character_feature);
%人物天赋随机生成
talent1 = unidrnd(5);
talent_list = {'勇猛','嗜血','凝神','笑佛','无我'};
assignin('base','talent1',talent1);
assignin('base','talent2',0);
assignin('base','talent_list',talent_list);
%人物初始技能生成
assignin('base','skill_selected',0);
assignin('base','skill_rank',0);
assignin('base','skill_list',{'猛虎下山','野猪撞树','恪行守正','明志成杰'});
%其他参数
assignin('base','current_step',0);
assignin('base','plus_feature',zeros(1,9));
assignin('base','map_state',0);
%----统计数据
%初始地，红包，休息，战斗，捡东西，发工资，手游，商店，武学，求婚，健身，996，马拉松，野外，跳槽，过生日,战斗逃跑,先手，后手
assignin('base','final_date',zeros(1,19));
assignin('base','origin_character',character_feature);
assignin('base','final',0);
map();
charactor();
close(title);
% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
