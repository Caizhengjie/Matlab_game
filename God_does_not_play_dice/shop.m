function varargout = shop(varargin)
% SHOP MATLAB code for shop.fig
%      SHOP, by itself, creates a new SHOP or raises the existing
%      singleton*.
%
%      H = SHOP returns the handle to a new SHOP or the handle to
%      the existing singleton*.
%
%      SHOP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHOP.M with the given input arguments.
%
%      SHOP('Property','Value',...) creates a new SHOP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before shop_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to shop_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help shop

% Last Modified by GUIDE v2.5 16-Jan-2021 09:44:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @shop_OpeningFcn, ...
                   'gui_OutputFcn',  @shop_OutputFcn, ...
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


% --- Executes just before shop is made visible.
function shop_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to shop (see VARARGIN)
% Choose default command line output for shop
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes shop wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = shop_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
character_feature = evalin('base','character_feature');
%确定价格
expense = round(3000*(1-(character_feature(7)/1000)));
%检查钱
valid_money = character_feature(9);
if valid_money >= expense
    skill_rank = evalin('base','skill_rank');
    %判断是否已有第四技能
    if skill_rank > 0
        skill_selected = evalin('base','skill_selected');
        if 1 == skill_selected%升级
            skill_rank = skill_rank+1;
        else
            skill_selected = 1;
            skill_rank = 1;
        end
    else
        skill_selected = 1;
        skill_rank = 1;
    end
    assignin('base','skill_selected',skill_selected);
    assignin('base','skill_rank',skill_rank);
    plus_feature = zeros(1,8);
    plus_feature(9) = -expense;
    character_feature = character_feature+plus_feature;
    assignin('base','character_feature',character_feature);
    assignin('base','plus_feature',plus_feature);
    msgbox('购买成功，请在属性界面确认')
else
    msgbox('携带金钱不足')
end

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
character_feature = evalin('base','character_feature');
%确定价格
expense = round(3000*(1-(character_feature(7)/1000)));
%检查钱
valid_money = character_feature(9);
if valid_money >= expense
    skill_rank = evalin('base','skill_rank');
    %判断是否已有第四技能
    if skill_rank > 0
        skill_selected = evalin('base','skill_selected');
        if 3 == skill_selected%升级
            skill_rank = skill_rank+1;
        else
            skill_selected = 3;
            skill_rank = 1;
        end
    else
        skill_selected = 3;
        skill_rank = 1;
    end
    assignin('base','skill_selected',skill_selected);
    assignin('base','skill_rank',skill_rank);
    plus_feature = zeros(1,8);
    plus_feature(9) = -expense;
    character_feature = character_feature+plus_feature;
    assignin('base','character_feature',character_feature);
    assignin('base','plus_feature',plus_feature);
    msgbox('购买成功，请在属性界面确认')
else
    msgbox('携带金钱不足')
end

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
character_feature = evalin('base','character_feature');
%确定价格
expense = round(3000*(1-(character_feature(7)/1000)));
%检查钱
valid_money = character_feature(9);
if valid_money >= expense
    skill_rank = evalin('base','skill_rank');
    %判断是否已有第四技能
    if skill_rank > 0
        skill_selected = evalin('base','skill_selected');
        if 2 == skill_selected%升级
            skill_rank = skill_rank+1;
        else
            skill_selected = 2;
            skill_rank = 1;
        end
    else
        skill_selected = 2;
        skill_rank = 1;
    end
    assignin('base','skill_selected',skill_selected);
    assignin('base','skill_rank',skill_rank);
    plus_feature = zeros(1,8);
    plus_feature(9) = -expense;
    character_feature = character_feature+plus_feature;
    assignin('base','character_feature',character_feature);
    assignin('base','plus_feature',plus_feature);
    msgbox('购买成功，请在属性界面确认')
else
    msgbox('携带金钱不足')
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
character_feature = evalin('base','character_feature');
%确定价格
expense = round(3000*(1-(character_feature(7)/1000)));
%检查钱
valid_money = character_feature(9);
if valid_money >= expense
    skill_rank = evalin('base','skill_rank');
    %判断是否已有第四技能
    if skill_rank > 0
        skill_selected = evalin('base','skill_selected');
        if 4 == skill_selected%升级
            skill_rank = skill_rank+1;
        else
            skill_selected = 4;
            skill_rank = 1;
        end
    else
        skill_selected = 4;
        skill_rank = 1;
    end
    assignin('base','skill_selected',skill_selected);
    assignin('base','skill_rank',skill_rank);
    plus_feature = zeros(1,8);
    plus_feature(9) = -expense;
    character_feature = character_feature+plus_feature;
    assignin('base','character_feature',character_feature);
    assignin('base','plus_feature',plus_feature);
    msgbox('购买成功，请在属性界面确认')
else
    msgbox('携带金钱不足')
end

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
talent1 = evalin('base','talent1');
if 1 == talent1
    %天赋是否重复
    msgbox('天赋重复')
else
    character_feature = evalin('base','character_feature');
    %确定价格
expense = round(3000*(1-(character_feature(7)/1000)));
    %检查钱
    valid_money = character_feature(9);
    if valid_money >= expense
        plus_feature = zeros(1,8);
        plus_feature(9) = -expense;
        character_feature = character_feature+plus_feature;
        assignin('base','character_feature',character_feature);
        assignin('base','plus_feature',plus_feature);
        assignin('base','talent2',1);
        msgbox('购买成功，请在属性界面确认')
    else
        msgbox('携带金钱不足')
    end
end

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
talent1 = evalin('base','talent1');
if 3 == talent1
    %天赋是否重复
    msgbox('天赋重复')
else
    character_feature = evalin('base','character_feature');
    %确定价格
expense = round(3000*(1-(character_feature(7)/1000)));
    %检查钱
    valid_money = character_feature(9);
    if valid_money >= expense
        plus_feature = zeros(1,8);
        plus_feature(9) = -expense;
        character_feature = character_feature+plus_feature;
        assignin('base','character_feature',character_feature);
        assignin('base','plus_feature',plus_feature);
        assignin('base','talent2',3);
        msgbox('购买成功，请在属性界面确认')
    else
        msgbox('携带金钱不足')
    end
end

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
talent1 = evalin('base','talent1');
if 2 == talent1
    %天赋是否重复
    msgbox('天赋重复')
else
    character_feature = evalin('base','character_feature');
    %确定价格
expense = round(3000*(1-(character_feature(7)/1000)));
    %检查钱
    valid_money = character_feature(9);
    if valid_money >= expense
        plus_feature = zeros(1,8);
        plus_feature(9) = -expense;
        character_feature = character_feature+plus_feature;
        assignin('base','character_feature',character_feature);
        assignin('base','plus_feature',plus_feature);
        assignin('base','talent2',2);
        msgbox('购买成功，请在属性界面确认')
    else
        msgbox('携带金钱不足')
    end
end

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
talent1 = evalin('base','talent1');
if 4 == talent1
    %天赋是否重复
    msgbox('天赋重复')
else
    character_feature = evalin('base','character_feature');
    %确定价格
expense = round(3000*(1-(character_feature(7)/1000)));
    %检查钱
    valid_money = character_feature(9);
    if valid_money >= expense
        plus_feature = zeros(1,8);
        plus_feature(9) = -expense;
        character_feature = character_feature+plus_feature;
        assignin('base','character_feature',character_feature);
        assignin('base','plus_feature',plus_feature);
        assignin('base','talent2',4);
        msgbox('购买成功，请在属性界面确认')
    else
        msgbox('携带金钱不足')
    end
end

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
talent1 = evalin('base','talent1');
if 5 == talent1
    %天赋是否重复
    msgbox('天赋重复')
else
    character_feature = evalin('base','character_feature');
    %确定价格
expense = round(3000*(1-(character_feature(7)/1000)));
    %检查钱
    valid_money = character_feature(9);
    if valid_money >= expense
        plus_feature = zeros(1,8);
        plus_feature(9) = -expense;
        character_feature = character_feature+plus_feature;
        assignin('base','character_feature',character_feature);
        assignin('base','plus_feature',plus_feature);
        assignin('base','talent2',5);
        msgbox('购买成功，请在属性界面确认')
    else
        msgbox('携带金钱不足')
    end
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
character_feature = evalin('base','character_feature');
%确定价格
expense = round(1500*(1-(character_feature(7)/1000)));
%检查钱
valid_money = character_feature(9);
if valid_money >= expense
    plus_feature = zeros(1,9);
    plus_feature(1) = 100;
    plus_feature(9) = -expense;
    character_feature = character_feature+plus_feature;
    assignin('base','character_feature',character_feature);
    assignin('base','plus_feature',plus_feature);
    msgbox('购买成功，请在属性界面确认')
else
    msgbox('携带金钱不足');
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
character_feature = evalin('base','character_feature');
%确定价格
expense = round(1500*(1-(character_feature(7)/1000)));
%检查钱
valid_money = character_feature(9);
if valid_money >= expense
    plus_feature = zeros(1,9);
    plus_feature(2) = 100;
    plus_feature(9) = -expense;
    character_feature = character_feature+plus_feature;
    assignin('base','character_feature',character_feature);
    assignin('base','plus_feature',plus_feature);
    msgbox('购买成功，请在属性界面确认')
else
    msgbox('携带金钱不足');
end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
character_feature = evalin('base','character_feature');
%确定价格
expense = round(2000*(1-(character_feature(7)/1000)));
%检查钱
valid_money = character_feature(9);
if valid_money >= expense
    plus_feature = zeros(1,9);
    plus_feature(3) = 100;
    plus_feature(4) = 100;
    plus_feature(9) = -expense;
    character_feature = character_feature+plus_feature;
    assignin('base','character_feature',character_feature);
    assignin('base','plus_feature',plus_feature);
    msgbox('购买成功，请在属性界面确认')
else
    msgbox('携带金钱不足');
end

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
character_feature = evalin('base','character_feature');
%确定价格
expense = round(3000*(1-(character_feature(7)/1000)));
%检查钱
valid_money = character_feature(9);
if valid_money >= expense
    plus_feature = zeros(1,9);
    plus_feature(1) = 100;
    plus_feature(2) = 100;
    plus_feature(9) = -expense;
    character_feature = character_feature+plus_feature;
    assignin('base','character_feature',character_feature);
    assignin('base','plus_feature',plus_feature);
    msgbox('购买成功，请在属性界面确认')
else
    msgbox('携带金钱不足');
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
character_feature = evalin('base','character_feature');
%确定价格
expense = round(1200*(1-(character_feature(7)/1000)));
%检查钱
valid_money = character_feature(9);
if valid_money >= expense
    plus_feature = unidrnd(60,[1,8]);
    plus_feature(9) = -expense;
    character_feature = character_feature+plus_feature;
    assignin('base','character_feature',character_feature);
    assignin('base','plus_feature',plus_feature);
    msgbox('购买成功，请在属性界面确认')
else
    msgbox('携带金钱不足');
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
character_feature = evalin('base','character_feature');
%确定价格
expense = round(2000*(1-(character_feature(7)/1000)));
%检查钱
valid_money = character_feature(9);
if valid_money >= expense
    plus_feature = unidrnd(100,[1,8]);
    plus_feature(9) = -expense;
    character_feature = character_feature+plus_feature;
    assignin('base','character_feature',character_feature);
    assignin('base','plus_feature',plus_feature);
    msgbox('购买成功，请在属性界面确认')
else
    msgbox('携带金钱不足');
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
character_feature = evalin('base','character_feature');
%确定价格
expense = round(500*(1-(character_feature(7)/1000)));
%检查钱
valid_money = character_feature(9);
if valid_money >= expense
    plus_feature = unidrnd(30,[1,8]);
    plus_feature(9) = -expense;
    character_feature = character_feature+plus_feature;
    assignin('base','character_feature',character_feature);
    assignin('base','plus_feature',plus_feature);
    msgbox('购买成功，请在属性界面确认')
else
    msgbox('携带金钱不足');
end


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignin('base','map_state',0);
f = msgbox('回到地图','shop','warn');
waitfor(f);
pause(1);
close(shop);
