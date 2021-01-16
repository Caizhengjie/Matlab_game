function varargout = charactor(varargin)
% CHARACTOR MATLAB code for charactor.fig
%      CHARACTOR, by itself, creates a new CHARACTOR or raises the existing
%      singleton*.
%
%      H = CHARACTOR returns the handle to a new CHARACTOR or the handle to
%      the existing singleton*.
%
%      CHARACTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHARACTOR.M with the given input arguments.
%
%      CHARACTOR('Property','Value',...) creates a new CHARACTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before charactor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to charactor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help charactor

% Last Modified by GUIDE v2.5 14-Jan-2021 18:48:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @charactor_OpeningFcn, ...
                   'gui_OutputFcn',  @charactor_OutputFcn, ...
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


% --- Executes just before charactor is made visible.
function charactor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to charactor (see VARARGIN)
%人物属性
character_feature = evalin('base','character_feature');
set(handles.text1,'string',num2str(character_feature(1)));
set(handles.text2,'string',num2str(character_feature(2)));
set(handles.text3,'string',num2str(character_feature(3)));
set(handles.text4,'string',num2str(character_feature(4)));
set(handles.text5,'string',num2str(character_feature(5)));
set(handles.text6,'string',num2str(character_feature(6)));
set(handles.text7,'string',num2str(character_feature(7)));
set(handles.text8,'string',num2str(character_feature(8)));
set(handles.text9,'string',num2str(character_feature(9)));
%天赋属性
talent_list= evalin('base','talent_list');
talent1= evalin('base','talent1');
set(handles.text216,'string',talent_list{talent1});
talent2 = evalin('base','talent2');
if talent2 ~= 0
    set(handles.text218,'string',talent_list{talent2});
end
%技能
set(handles.text401,'string','物理平砍');
set(handles.text402,'string','魔法普攻');
set(handles.text403,'string','逃跑');

skill_selected = evalin('base','skill_selected');
skill_list = evalin('base','skill_list');
skill_rank = evalin('base','skill_rank');
if skill_selected ~= 0 && skill_rank > 0
    set(handles.text404,'string',[skill_list{skill_selected},' Lv:',num2str(skill_rank)]);
end
% Choose default command line output for charactor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes charactor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = charactor_OutputFcn(hObject, eventdata, handles) 
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
character_feature = evalin('base','character_feature');
set(handles.text1,'string',num2str(character_feature(1)));
set(handles.text2,'string',num2str(character_feature(2)));
set(handles.text3,'string',num2str(character_feature(3)));
set(handles.text4,'string',num2str(character_feature(4)));
set(handles.text5,'string',num2str(character_feature(5)));
set(handles.text6,'string',num2str(character_feature(6)));
set(handles.text7,'string',num2str(character_feature(7)));
set(handles.text8,'string',num2str(character_feature(8)));
set(handles.text9,'string',num2str(character_feature(9)));
plus_feature = evalin('base','plus_feature');
for x = 1:9
    if 0 > plus_feature(x)
        eval(['set(handles.text1',num2str(x),',''string'',num2str(plus_feature(',num2str(x),')));'])
    elseif 0 <= plus_feature(x)
        eval(['strr = strcat(''+'',num2str(plus_feature(',num2str(x),')));'])
        eval(['set(handles.text1',num2str(x),',''string'',strr);'])
    end
end
assignin('base','plus_feature',zeros(1,9))

%第二天赋
talent2 = evalin('base','talent2');
if talent2 ~=0
    talent_list = evalin('base','talent_list');
    set(handles.text218,'string',talent_list{talent2});
end
%第四技能
skill_selected = evalin('base','skill_selected');
skill_list = evalin('base','skill_list');
skill_rank = evalin('base','skill_rank');
skill_selected = evalin('base','skill_selected');
skill_rank = evalin('base','skill_rank');
if skill_rank > 0 && skill_selected ~=0
    set(handles.text404,'string',[skill_list{skill_selected},' Lv',num2str(skill_rank)]);
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function text100_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text100 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text218_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text218 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text404_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text404 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
