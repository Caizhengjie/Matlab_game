function varargout = hp_history(varargin)
% HP_HISTORY MATLAB code for hp_history.fig
%      HP_HISTORY, by itself, creates a new HP_HISTORY or raises the existing
%      singleton*.
%
%      H = HP_HISTORY returns the handle to a new HP_HISTORY or the handle to
%      the existing singleton*.
%
%      HP_HISTORY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HP_HISTORY.M with the given input arguments.
%
%      HP_HISTORY('Property','Value',...) creates a new HP_HISTORY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hp_history_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hp_history_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hp_history

% Last Modified by GUIDE v2.5 15-Jan-2021 11:58:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hp_history_OpeningFcn, ...
                   'gui_OutputFcn',  @hp_history_OutputFcn, ...
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


% --- Executes just before hp_history is made visible.
function hp_history_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hp_history (see VARARGIN)
hp_history = evalin('base','hp_history');
[~,n] = size(hp_history);
plot(1:n,hp_history(1,:),1:n,hp_history(2,:))
axes(handles.axes6)
legend('我方气血','敌方气血')
% Choose default command line output for hp_history
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes hp_history wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = hp_history_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes6
