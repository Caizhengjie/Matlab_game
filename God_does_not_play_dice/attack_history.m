function varargout = attack_history(varargin)
% ATTACK_HISTORY MATLAB code for attack_history.fig
%      ATTACK_HISTORY, by itself, creates a new ATTACK_HISTORY or raises the existing
%      singleton*.
%
%      H = ATTACK_HISTORY returns the handle to a new ATTACK_HISTORY or the handle to
%      the existing singleton*.
%
%      ATTACK_HISTORY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ATTACK_HISTORY.M with the given input arguments.
%
%      ATTACK_HISTORY('Property','Value',...) creates a new ATTACK_HISTORY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before attack_history_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to attack_history_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help attack_history

% Last Modified by GUIDE v2.5 14-Jan-2021 19:16:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @attack_history_OpeningFcn, ...
                   'gui_OutputFcn',  @attack_history_OutputFcn, ...
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


% --- Executes just before attack_history is made visible.
function attack_history_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to attack_history (see VARARGIN)
% Choose default command line output for attack_history
handles.output = hObject;
attack_history = evalin('base','attack_history');
[~,n] = size(attack_history);
plot(1:n,attack_history(1,:),1:n,attack_history(2,:))
axes(handles.axes2)
legend('Œ“∑Ω…À∫¶','µ–∑Ω…À∫¶')
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes attack_history wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = attack_history_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2
