function varargout = battle(varargin)
% BATTLE MATLAB code for battle.fig
%      BATTLE, by itself, creates a new BATTLE or raises the existing
%      singleton*.
%
%      H = BATTLE returns the handle to a new BATTLE or the handle to
%      the existing singleton*.
%
%      BATTLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BATTLE.M with the given input arguments.
%
%      BATTLE('Property','Value',...) creates a new BATTLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before battle_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to battle_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help battle

% Last Modified by GUIDE v2.5 14-Jan-2021 19:11:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @battle_OpeningFcn, ...
                   'gui_OutputFcn',  @battle_OutputFcn, ...
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


% --- Executes just before battle is made visible.
function battle_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to battle (see VARARGIN)
enemy_feature = evalin('base','enemy_feature');
for x = 1:8
    eval(['set(handles.text',num2str(x),',''string'',num2str(enemy_feature(',num2str(x),')));'])
end
enemy_talent = evalin('base','enemy_talent');
talent_list = evalin('base','talent_list ');
set(handles.text9,'string',talent_list{enemy_talent});
%------��������
character_feature = evalin('base','character_feature');
for x = 1:9
    eval(['set(handles.text40',num2str(x),',''string'',num2str(character_feature(',num2str(x),')));'])
end
%�츳
talent1 = evalin('base','talent1');
set(handles.text410,'string',talent_list{talent1});
talent2 = evalin('base','talent2');
if talent2 ~=0
    set(handles.text301,'enable','on');
    set(handles.text411,'enable','on');
    set(handles.text411,'string',talent_list{talent2});
end
%����
assignin('base','skill_state',0);
skill_selected = evalin('base','skill_selected');
if skill_selected ~=0
    set(handles.checkbox4,'enable','on');
    skill_rank = evalin('base','skill_rank');
    skill_selected = evalin('base','skill_selected');
    skill_list = evalin('base','skill_list');
    set(handles.checkbox4,'string',[skill_list{skill_selected},'LV',num2str(skill_rank)]);
end
final = evalin('base','final');
if 1 == final
    set(handles.checkbox3,'enable','off');
end
% Choose default command line output for battle
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes battle wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = battle_OutputFcn(hObject, eventdata, handles)
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
%------��ʷ��¼
hp_history = evalin('base','hp_history');
attack_history = evalin('base','attack_history');
final = evalin('base','final');
%----�غ���
battle_step = evalin('base','battle_step');
battle_step = battle_step + 1;
set(handles.text49,'string',num2str(battle_step));
assignin('base','battle_step',battle_step);
skill_state = evalin('base','skill_state');
enemy_feature = evalin('base','enemy_feature');
character_feature = evalin('base','character_feature');
character_features = evalin('base','character_features');
if sum(character_features) == 0
    character_features = character_feature;
end
if skill_state == 0
    error('δѡ����')
elseif skill_state == 3
    set(handles.text49,'string',num2str(battle_step));
    assignin('base','battle_step',battle_step);
    %-----��ʷ����
    hp_history = evalin('base','hp_history');
    attack_history = evalin('base','attack_history');
    rate = unidrnd(50,[1,2]);
    if character_features(6)*(1+character_features(8)/100)+rate(1) > enemy_feature(6)+rate(2)
        excape_money = 0;
        %������ʧ��Ǯ
        if sum(character_features) == 0
            character_features = character_feature;
        end
        excape_money = character_feature(9)-character_features(9);
        plus_feature = zeros(1,9);
        plus_feature(9) = -excape_money;%�ܻ�ý�ǮΪ������Ǯ-������ʧ��Ǯ
        assignin('base','map_state',0);
        set(handles.text51,'string','���ܳɹ�')
        set(handles.text55,'string',['��ʧ��Ǯ',num2str(plus_feature(9))])
        set(handles.text56,'string','���������������ֵ��')
        assignin('base','plus_feature',plus_feature);
        assignin('base','character_feature',plus_feature+character_feature);
        %��¼���ܴ���
        final_date = evalin('base','final_date');
        current_date = zeros(1,19);
        current_date(17) = 1;
        final_date = final_date+current_date;
        assignin('base','final_date',final_date);
        f = msgbox('���ܳɹ�');
        waitfor(f);
        close(battle);
    else
        msgbox('����ʧ�ܣ���ʧ10%��Ѫ��10%��Ǯ')
        character_features(9) = round(character_features(9)*0.9);
        character_feature(9) = round(character_feature(9)*0.9);
        character_features(5) = round(character_features(5)*0.9);
        set(handles.text405,'string',num2str(character_features(5)));
        set(handles.text409,'string',num2str(character_features(9)));
        set(handles.text51,'string',['����ʧ�ܡ���ʧ��Ѫ��',num2str(round(character_features(5)/9)),'����Ǯ��',num2str(round(character_features(9)/9))]);
        assignin('base','character_features',character_features);
        assignin('base','character_feature',character_feature);
        %��ʷ����
        hp_history = cat(2,hp_history,[character_features(5);enemy_feature(5)]);
        attack_history = cat(2,attack_history,[0;0]);
        assignin('base','hp_history',hp_history);
        assignin('base','attack_history',attack_history);
    end
else
    %�츳ϵ������
    talent1 = evalin('base','talent1');
    K = zeros(1,7);
    % ��������Ѫ����ɱ������������Ѫ������
    switch talent1
        case 1%����
            K = K+[0.2 0 0 0 0 0 0];
        case 2%��Ѫ
            K = K+[0 0.2 0 0 0 0 0];
        case 3%����
            arate = rand(1);
            if arate > 0.3
                K = K+[0 0 0 0 0 0 0];
            else
                K = K+[0 0 1 0 0 0 0];
            end
        case 4%Ц��
            K = K+[0.1 0 0 0.1 0 0 0];
        case 5%����
            K = K+[0 0 0 1 -0.5 0 0];
    end
    talent2 = evalin('base','talent2');
    if talent2 ~=0
        switch talent2
            case 1%����
                K = K+[0.2 0 0 0 0 0 0];
            case 2%��Ѫ
                K = K+[0 0.2 0 0 0 0 0];
            case 3%����
                arate = rand(1);
                if arate > 0.3
                    K = K+[0 0 0 0 0 0 0];
                else
                    K = K+[0 0 1 0 0 0 0];
                end
            case 4%Ц��
                K = K+[0.1 0 0 0.1 0 0 0];
            case 5%����
                K = K+[0 0 0 1 -0.5 0 0];
        end
    end
    %���ܼ���
    if skill_state == 4
        skill_selected = evalin('base','skill_selected');
        skill_rank = evalin('base','skill_rank');
        switch skill_selected
            case 1
                origin = 0.8+0.1*(skill_rank-1);
                rate =0.7*unidrnd(100)/100;
                af = origin+rate;
                K = K+[0 0 0 af 0 0 0];
            case 2
                K = K+[0 0 0 1.5+0.1*(skill_rank-1) 0 1 0];
            case 3
                origin = 0.8+0.1*(skill_rank-1);
                rate =0.7*unidrnd(100)/100;
                af = origin+rate;
                K = K+[0 0 0 af 0 0 0];
            case 4
                da =rand(1);
                if da > 0.5+0.1*(skill_rank-1)
                    K = K+[0 0 0 0 0.1+0.1*(skill_rank-1) 0 0];
                else
                    K = K+[0 0 0 0 0.1+0.1*(skill_rank-1) 0 1];
                end
        end
    end
    attack = unidrnd(2);%�������ħ������
    enemy_talent = evalin('base','enemy_talent');
    hostle_K = zeros(1,5);
    switch enemy_talent
        case 1%����
            hostle_K = hostle_K+[0.2 0 0 0 0];
        case 2%��Ѫ
            hostle_K = hostle_K+[0 0.2 0 0 0];
        case 3%����
            arate = rand(1);
            if arate > 0.3
                hostle_K = hostle_K+[0 0 0 0 0];
            else
                hostle_K = hostle_K+[0 0 1 0 0];
            end
        case 4%Ц��
            hostle_K = hostle_K+[0.1 0 0 0.1 0];
        case 5%����
            hostle_K = hostle_K+[0 0 0 1 -0.5];
    end
    %�����ٶ��ж��Ⱥ���
    if character_features(6) > enemy_feature(6)
        %������
        if skill_state == 1 || (skill_state == 4&&(skill_selected == 1||skill_selected == 2))
            attack_way = 1;
            %ħ������
        elseif skill_state == 2 || (skill_state == 4&&(skill_selected == 3||skill_selected == 4))
            attack_way = 2;
        end
        my_damage = round(character_features(attack_way).*(1+K(4)).*(1+K(3))-enemy_feature(attack_way+2).*(1-K(1)));
        if my_damage < 0
            my_damage = 0;
        end
        if my_damage >= enemy_feature(5)
            excape_money = 0;
            %������ʧ��Ǯ
            if sum(character_features) == 0
                character_features = character_feature;
            end
            excape_money = character_feature(9)-character_features(9);
            plus_feature = zeros(1,9);
            plus_feature(9) = enemy_feature(8)-excape_money;%�ܻ�ý�ǮΪ������Ǯ-������ʧ��Ǯ
            assignin('base','map_state',0);
            set(handles.text51,'string','��ϲ�����ֻ�ʤ��')
            set(handles.text52,'string',['��ɶԷ�',num2str(my_damage),'�˺���'])
            set(handles.text55,'string',['��ý�Ǯ',num2str(plus_feature(9))])
            set(handles.text56,'string','���������������ֵ��')
            assignin('base','plus_feature',plus_feature);
            assignin('base','character_feature',plus_feature+character_feature);
            %---ս�����ݼ�¼
            final_date = evalin('base','final_date');
            current_date = zeros(1,19);
            current_date(18) = 1;
            final_date = final_date+current_date;
            assignin('base','final_date',final_date);
            if 0 == final
                f = msgbox('����ʤ��');
                waitfor(f);
                pause(1);
                close(battle);
            else
                close all
                final_history();
                win();
            end
        else
            enemy_feature(5) = enemy_feature(5)-my_damage;%��Ѫ
            character_features(5) = round(character_features(5)+my_damage.*K(2)-character_features(5).*0.1.*K(6));%��Ѫ
            character_features(3) = round(character_features(3).*(1+K(5)));%����
            character_features(4) = round(character_features(4).*(1+K(5)));%����
            hostle_damage = round(enemy_feature(attack).*(1+hostle_K(4)).*(1+hostle_K(3))-character_features(attack+2).*(1-hostle_K(1)));
            if hostle_damage < 0
                hostle_damage = 0;
            end
            if hostle_damage >= character_features(5)
                set(handles.text51,'string','��Ǹ��������ſ���ˡ�')
                f = msgbox('���ֱ����ܣ���Ϸ������');
                waitfor(f);
                pause(1);
                close all
            else
                character_features(5) = character_features(5)-hostle_damage;%��Ѫ
                enemy_feature(5) = round(enemy_feature(5)+hostle_damage.*hostle_K(2));%��Ѫ
                enemy_feature(3) = round(enemy_feature(3).*(1+hostle_K(5)));%����
                enemy_feature(4) = round(enemy_feature(4).*(1+hostle_K(5)));%����
                set(handles.text5,'string',num2str(enemy_feature(5)));%���µ�����Ѫ
                set(handles.text405,'string',num2str(character_features(5)));%��������Ѫ
                set(handles.text51,'string','�����ֹ�����')
                set(handles.text52,'string',['��ɶԷ�',num2str(my_damage),'�˺���'])
                set(handles.text55,'string','���˺��ֹ�����')
                set(handles.text56,'string',['�����',num2str(hostle_damage),'�˺���'])
                assignin('base','enemy_feature',enemy_feature);
                assignin('base','character_features',character_features);
                %��ʷ����
                hp_history = cat(2,hp_history,[character_features(5);enemy_feature(5)]);
                attack_history = cat(2,attack_history,[my_damage;hostle_damage]);
                assignin('base','hp_history',hp_history);
                assignin('base','attack_history',attack_history);
            end
        end
    else
        %����
        %������
        hostle_damage = round(enemy_feature(attack).*(1+hostle_K(4)).*(1+hostle_K(3))-character_features(attack+2).*(1-hostle_K(1)));
        if hostle_damage < 0
            hostle_damage = 0;
        end
        if hostle_damage >= character_features(5)
            set(handles.text51,'string','��Ǹ��������ſ���ˡ�')
            f = msgbox('���ֱ����ܣ���Ϸ������');
            waitfor(f);
            pause(1);
            close all
        else
            character_features(5) = character_features(5)-hostle_damage;%��Ѫ
            enemy_feature(5) = round(enemy_feature(5)+hostle_damage.*hostle_K(2));%��Ѫ
            enemy_feature(3) = round(enemy_feature(3).*(1+hostle_K(5)));%����
            enemy_feature(4) = round(enemy_feature(4).*(1+hostle_K(5)));%����
            %������
            if skill_state == 1 || (skill_state == 4&&(skill_selected == 1||skill_selected == 2))
                attack_way = 1;
                %ħ������
            elseif skill_state == 2 || (skill_state == 4&&(skill_selected == 3||skill_selected == 4))
                attack_way = 2;
            end
            my_damage = round(character_features(attack_way).*(1+K(4)).*(1+K(3))-enemy_feature(attack_way+2).*(1-K(1)));
            if my_damage < 0
                my_damage = 0;
            end
            if my_damage >= enemy_feature(5)
                excape_money = 0;
                %������ʧ��Ǯ
                try
                    character_features = evalin('base','character_features');
                catch
                    character_features = evalin('base','character_feature');
                    excape_money = character_feature(9)-character_features(9);
                end
                plus_feature = zeros(1,9);
                plus_feature(9) = enemy_feature(8)-excape_money;%�ܻ�ý�ǮΪ������Ǯ-������ʧ��Ǯ
                assignin('base','map_state',0);
                set(handles.text51,'string','��ϲ�����ֻ�ʤ��')
                set(handles.text52,'string',['��ɶԷ�',num2str(my_damage),'�˺���'])
                set(handles.text55,'string',['��ý�Ǯ',num2str(plus_feature(9))])
                set(handles.text56,'string','���������������ֵ��')
                assignin('base','plus_feature',plus_feature);
                assignin('base','character_feature',character_feature+plus_feature);
                %---ս�����ݼ�¼
                final_date = evalin('base','final_date');
                current_date = zeros(1,19);
                current_date(19) = 1;
                final_date = final_date+current_date;
                assignin('base','final_date',final_date);
                if 0 == final
                    f = msgbox('����ʤ��');
                    waitfor(f);
                    pause(1);
                    close(battle);
                else
                    close all
                    win();
                    final_history();
                end
            else
                enemy_feature(5) = enemy_feature(5)-my_damage;%��Ѫ
                character_features(5) = round(character_features(5)+my_damage.*K(2)-character_features(5).*0.1.*K(6));%��Ѫ
                character_features(3) = round(character_features(3).*(1+K(5)));%����
                character_features(4) = round(character_features(4).*(1+K(5)));%����
                set(handles.text5,'string',num2str(enemy_feature(5)));%���µ�����Ѫ
                set(handles.text405,'string',num2str(character_features(5)));%��������Ѫ
                set(handles.text51,'string','�������ֹ�����')
                set(handles.text52,'string',['�����',num2str(hostle_damage),'�˺���'])
                set(handles.text55,'string','�����ֹ�����')
                set(handles.text56,'string',['��ɶ���',num2str(my_damage),'�˺���'])
                assignin('base','enemy_feature',enemy_feature);
                assignin('base','character_features',character_features);
                %��ʷ����
                hp_history = cat(2,hp_history,[character_features(5);enemy_feature(5)]);
                attack_history = cat(2,attack_history,[my_damage;hostle_damage]);
                assignin('base','hp_history',hp_history);
                assignin('base','attack_history',attack_history);
            end
        end
    end
end
% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
skill_state = 1;
assignin('base','skill_state',skill_state);
% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
skill_state = 2;
assignin('base','skill_state',skill_state);
% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
skill_state = 3;
assignin('base','skill_state',skill_state);
% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
skill_state = 4;
assignin('base','skill_state',skill_state);
% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
attack_history();

% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hp_history();


% --- Executes during object creation, after setting all properties.
function text5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
