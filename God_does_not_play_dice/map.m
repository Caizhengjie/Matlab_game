function varargout = map(varargin)
% MAP MATLAB code for map.fig
%      MAP, by itself, creates a new MAP or raises the existing
%      singleton*.
%
%      H = MAP returns the handle to a new MAP or the handle to
%      the existing singleton*.
%
%      MAP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAP.M with the given input arguments.
%
%      MAP('Property','Value',...) creates a new MAP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before map_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to map_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help map

% Last Modified by GUIDE v2.5 12-Jan-2021 19:45:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @map_OpeningFcn, ...
                   'gui_OutputFcn',  @map_OutputFcn, ...
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


% --- Executes just before map is made visible.
function map_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to map (see VARARGIN)
% Choose default command line output for map
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes map wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = map_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object deletion, before destroying properties.
function text0_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to text0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%扔色子
map_state = evalin('base','map_state');
if 0 == map_state
    step = unidrnd(6);
    step_str = num2str(step);
    set(handles.text56,'string',step_str);
    %位置颜色变化表示位移
    current_step = evalin('base','current_step');
    eval(['set(handles.text',num2str(current_step),',''BackgroundColor'',''w'');'])
    eval(['set(handles.text',num2str(current_step),',''ForegroundColor'',''k'');'])
    current_step = mod(current_step+step,26);
    eval(['set(handles.text',num2str(current_step),',''BackgroundColor'',''r'');'])
    eval(['set(handles.text',num2str(current_step),',''ForegroundColor'',''w'');'])
    %触发事件
    switch current_step
        case 0%初始地
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(1) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            %文本输出
            str1 = ['回乡受到热烈欢迎！(*^_^*) ',10];
            str2 = ['人物基本属性得到小幅度(<30)增加！',10];
            str3 = ['请在人物属性界面更新数据。'];
            str=[str1,str2,str3];
            set(handles.text57,'string',str);
            set(handles.text57,'FontSize',18);
            %奖励增幅数值：人物属性以及金钱小增幅
            plus_feature = unidrnd(30,[1,9]);
            %与原有人物属性求和
            character_feature = evalin('base','character_feature');
            character_feature = character_feature + plus_feature;
            assignin('base','character_feature',character_feature)
            assignin('base','plus_feature',plus_feature);
        case 1%开门红包
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(2) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            str1 = ['GOOD LUCK！',10];
            str2 = ['金钱得到大幅度增长(<100)',10];
            str3 = ['请在人物属性界面更新数据。'];
            str=[str1,str2,str3];
            set(handles.text57,'string',str);
            set(handles.text57,'FontSize',18);
            %奖励内容：金钱大增幅
            plus_feature = zeros(1,9);
            plus_feature(9) = unidrnd(100);
            character_feature = evalin('base','character_feature');
            character_feature = character_feature + plus_feature;
            assignin('base','character_feature',character_feature)
            assignin('base','plus_feature',plus_feature);
        case 2 %周末休息
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(3) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            set(handles.text57,'string','平静周末，无事发生。');
            set(handles.text57,'FontSize',18);
        case 3%战斗
            %地图数据记录
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(4) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            assignin('base','map_state',1);
            %战斗属性
            assignin('base','character_features',zeros(1,9));
            %-----生成对手属性数值
            enemy_feature = unidrnd(100,[1,8]);
            enemy_feature(5) = enemy_feature(5)*10;
            assignin('base','enemy_feature',enemy_feature);
            assignin('base','enemy_talent',unidrnd(5));
            %----战斗回合数
            assignin('base','battle_step',0);
            %----历史数据纪律
            character_feature = evalin('base','character_feature');
            hp_history = [character_feature(5);enemy_feature(5)];
            attack_history=[0;0];
            assignin('base','hp_history',hp_history);
            assignin('base','attack_history',attack_history);
            battle();
        case 4%事件:捡到东西
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(5) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            assignin('base','map_state',1);
            incident1();
        case 5%战斗
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(4) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            assignin('base','map_state',1);
            %战斗属性
            assignin('base','character_features',zeros(1,9));
                        %-----生成对手属性数值
            enemy_feature = unidrnd(100,[1,8]);
            enemy_feature(5) = enemy_feature(5)*10;
            assignin('base','enemy_feature',enemy_feature);
            assignin('base','enemy_talent',unidrnd(5));
            %----战斗回合数
            assignin('base','battle_step',0);
            %----历史数据纪律
            character_feature = evalin('base','character_feature');
            hp_history = [character_feature(5);enemy_feature(5)];
            attack_history=[0;0];
            assignin('base','hp_history',hp_history);
            assignin('base','attack_history',attack_history);
            battle();
        case 6%发工资日
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(6) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            employee = unidrnd(5000);
            set(handles.text57,'string',['本月您的工资收入为',num2str(employee),'(<5000)']);
            set(handles.text57,'FontSize',18);
            plus_feature = zeros(1,9);
            plus_feature(9) = employee;
            character_feature = evalin('base','character_feature');
            character_feature = character_feature + plus_feature;
            assignin('base','character_feature',character_feature)
            assignin('base','plus_feature',plus_feature);
        case 7%懒狗休息
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(3) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            set(handles.text57,'string','无事发生。');
            set(handles.text57,'FontSize',18);
        case 8%沉迷手游
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(7) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            plus_feature = zeros(1,9);
            plus_feature(9) = -unidrnd(1000);
            character_feature = evalin('base','character_feature');
            character_feature = character_feature + plus_feature;
            assignin('base','character_feature',character_feature)
            assignin('base','plus_feature',plus_feature);
            set(handles.text57,'string',['家里有矿啊，居然沉迷手游，损失',num2str(abs(plus_feature(9))),'（<1000）钱']);
            set(handles.text57,'FontSize',18);
        case 9
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(4) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            assignin('base','map_state',1);
            %战斗属性
            assignin('base','character_features',zeros(1,9));
                        %-----生成对手属性数值
            enemy_feature = unidrnd(100,[1,8]);
            enemy_feature(5) = enemy_feature(5)*10;
            assignin('base','enemy_feature',enemy_feature);
            assignin('base','enemy_talent',unidrnd(5));
            %----战斗回合数
            assignin('base','battle_step',0);
            %----历史数据纪律
            character_feature = evalin('base','character_feature');
            hp_history = [character_feature(5);enemy_feature(5)];
            attack_history=[0;0];
            assignin('base','hp_history',hp_history);
            assignin('base','attack_history',attack_history);
            battle();
        case 10%商店
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(8) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            assignin('base','map_state',1);
            shop();
        case 11%武学奇才
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(9) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            talent1 = evalin('base','talent1');
            talent_list = evalin('base','talent_list');
            talent2 = evalin('base','talent2');
            if talent2 ~= 0
                character_feature = evalin('base','character_feature');
                plus_feature = unidrnd(100,[1,9]);
                character_feature = character_feature+plus_feature;
                set(handles.text57,'string','检测到已领悟第二天赋，大幅度提升属性。');
                set(handles.text57,'FontSize',18);
                assignin('base','character_feature',character_feature)
                assignin('base','plus_feature',plus_feature);
            else
                talent2_list =[];
                for x =1:4
                    if x ~= talent1
                        talent2_list = cat(2,talent2_list,x);
                    end
                end
                count = unidrnd(3);
                talent2 = talent2_list(count);
                set(handles.text57,'string',['恭喜，领悟第二天赋',talent_list{talent2}]);
                set(handles.text57,'FontSize',18);
                assignin('base','talent2',talent2);
            end
        case 12
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(4) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            assignin('base','map_state',1);
            %战斗属性
            assignin('base','character_features',zeros(1,9));
                        %-----生成对手属性数值
            enemy_feature = unidrnd(100,[1,8]);
            enemy_feature(5) = enemy_feature(5)*10;
            assignin('base','enemy_feature',enemy_feature);
            assignin('base','enemy_talent',unidrnd(5));
            %----战斗回合数
            assignin('base','battle_step',0);
            %----历史数据纪律
            character_feature = evalin('base','character_feature');
            hp_history = [character_feature(5);enemy_feature(5)];
            attack_history=[0;0];
            assignin('base','hp_history',hp_history);
            assignin('base','attack_history',attack_history);
            battle();
        case 13%求婚
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(10) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            assignin('base','map_state',1);
            incident2();
        case 14%健身
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(11) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            character_feature = evalin('base','character_feature');
            plus_feature = unidrnd(50,[1,8]);
            plus_feature(9) =-500;
            character_feature = character_feature+ plus_feature;
            set(handles.text57,'string','健身费500，自身属性得到中幅度（<50）提升！');
            set(handles.text57,'FontSize',18);
            assignin('base','character_feature',character_feature);
            assignin('base','plus_feature',plus_feature);
        case 15
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(8) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            assignin('base','map_state',1);
            shop();
        case 16%996
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(12) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
           character_feature = evalin('base','character_feature');
            money = round(abs(character_feature(9))*(1+character_feature(8)/100));
            plus_feature = zeros(1,9);
            plus_feature(8) = -character_feature(8);
            plus_feature(9) = money;
            character_feature = character_feature+ plus_feature;
            set(handles.text57,'string','消耗自身全部幸运值，转换为金钱。');
            set(handles.text57,'FontSize',18);
            assignin('base','character_feature',character_feature);
            assignin('base','plus_feature',plus_feature);
        case 17
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(4) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            assignin('base','map_state',1);
            %战斗属性
            assignin('base','character_features',zeros(1,9));
                        %-----生成对手属性数值
            enemy_feature = unidrnd(100,[1,8]);
            enemy_feature(5) = enemy_feature(5)*10;
            assignin('base','enemy_feature',enemy_feature);
            assignin('base','enemy_talent',unidrnd(5));
            %----战斗回合数
            assignin('base','battle_step',0);
            %----历史数据纪律
            character_feature = evalin('base','character_feature');
            hp_history = [character_feature(5);enemy_feature(5)];
            attack_history=[0;0];
            assignin('base','hp_history',hp_history);
            assignin('base','attack_history',attack_history);
            battle();
        case 18%节假日休息
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(3) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            set(handles.text57,'string','放假休息咯');
        case 19%马拉松长跑
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(13) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            character_feature = evalin('base','character_feature');
            defense = unidrnd(100,[1,2]);
            plus_feature = zeros(1,9);
            plus_feature(3) = defense(1);
            plus_feature(4) = defense(2);
            character_feature = character_feature+ plus_feature;
            set(handles.text57,'string','物理魔法防御得到大幅度（<100）提升！');
            set(handles.text57,'FontSize',18);
            assignin('base','character_feature',character_feature);
            assignin('base','plus_feature',plus_feature);
        case 20%事件3：野外探险
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(14) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            assignin('base','map_state',1);
            incident3();
        case 21%跳槽涨薪
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(15) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            character_feature = evalin('base','character_feature');
            plus_feature = zeros(1,9);
            plus_feature(9) = unidrnd(10000);
            character_feature = character_feature+ plus_feature;
            set(handles.text57,'string','金钱提升（<10000）！');
            set(handles.text57,'FontSize',18);
            assignin('base','character_feature',character_feature);
            assignin('base','plus_feature',plus_feature);
        case 22
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(4) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            assignin('base','map_state',1);
            choose = questdlg('可选择最终决战或普通战斗','final battle or not','最终决战','普通战斗','最终决战');
            %战斗属性
            assignin('base','character_features',zeros(1,9));
            if strcmp(choose,'普通战斗')
                %-----生成对手属性数值
                enemy_feature = unidrnd(100,[1,8]);
                enemy_feature(5) = enemy_feature(5)*10;
                assignin('base','enemy_feature',enemy_feature);
                assignin('base','enemy_talent',unidrnd(5));
                %----战斗回合数
                assignin('base','battle_step',0);
                %----历史数据纪律
                character_feature = evalin('base','character_feature');
                hp_history = [character_feature(5);enemy_feature(5)];
                attack_history=[0;0];
                assignin('base','hp_history',hp_history);
                assignin('base','attack_history',attack_history);
                battle();
            else%最终决战
                assignin('base','final',1);
                %-----生成对手属性数值
                enemy_feature = unidrnd(200,[1,8]);
                enemy_feature(5) = enemy_feature(5)*10;
                assignin('base','enemy_feature',enemy_feature);
                assignin('base','enemy_talent',unidrnd(5));
                %----战斗回合数
                assignin('base','battle_step',0);
                %----历史数据纪律
                character_feature = evalin('base','character_feature');
                hp_history = [character_feature(5);enemy_feature(5)];
                attack_history=[0;0];
                assignin('base','hp_history',hp_history);
                assignin('base','attack_history',attack_history);
                battle();
    end
        case 23%事件4:过生日
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(16) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            assignin('base','map_state',1);
            incident4();
        case 24
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(4) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            assignin('base','map_state',1);
            %战斗属性
            assignin('base','character_features',zeros(1,9));
                        %-----生成对手属性数值
            enemy_feature = unidrnd(100,[1,8]);
            enemy_feature(5) = enemy_feature(5)*10;
            assignin('base','enemy_feature',enemy_feature);
            assignin('base','enemy_talent',unidrnd(5));
            %----战斗回合数
            assignin('base','battle_step',0);
            %----历史数据纪律
            character_feature = evalin('base','character_feature');
            hp_history = [character_feature(5);enemy_feature(5)];
            attack_history=[0;0];
            assignin('base','hp_history',hp_history);
            assignin('base','attack_history',attack_history);
            battle();
        case 25
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(8) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            assignin('base','map_state',1);
            shop();
    end
    assignin('base','current_step',current_step);
else
    msgbox('请先完成其他事件')
    error('请先完成其他事件')
end
guidata(hObject, handles);


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
skill();

% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
talent();

% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
charactor();

% --- Executes during object creation, after setting all properties.
function text56_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
guidata(hObject, handles);
