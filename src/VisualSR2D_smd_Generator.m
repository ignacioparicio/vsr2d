function varargout = VisualSR2D_smd_Generator(varargin)
% VISUALSR2D_SMD_GENERATOR MATLAB code for VisualSR2D_smd_Generator.fig
%      VISUALSR2D_SMD_GENERATOR, by itself, creates a new VISUALSR2D_SMD_GENERATOR or raises the existing
%      singleton*.
%
%      H = VISUALSR2D_SMD_GENERATOR returns the handle to a new VISUALSR2D_SMD_GENERATOR or the handle to
%      the existing singleton*.
%
%      VISUALSR2D_SMD_GENERATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VISUALSR2D_SMD_GENERATOR.M with the given input arguments.
%
%      VISUALSR2D_SMD_GENERATOR('Property','Value',...) creates a new VISUALSR2D_SMD_GENERATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VisualSR2D_smd_Generator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VisualSR2D_smd_Generator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VisualSR2D_smd_Generator

% Last Modified by GUIDE v2.5 04-Jun-2014 17:37:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VisualSR2D_smd_Generator_OpeningFcn, ...
                   'gui_OutputFcn',  @VisualSR2D_smd_Generator_OutputFcn, ...
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


% --- Executes just before VisualSR2D_smd_Generator is made visible.
function VisualSR2D_smd_Generator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)
% varargin   command line arguments to VisualSR2D_smd_Generator (see VARARGIN)

% Choose default command line output for VisualSR2D_smd_Generator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% message=fprintf(['VisualSR2D smd Generator is an independent module of VisualSR2D'...
%     ' that allows you to generate .smd files according to UNE-EN ISO ' ...
%     '5436-2 standards.\n\nNo previous action in VisualSR2D is required'...
%     ' to use this module.\n\n It is divided in three sections:\n'...
%     '-> Header: Obligaroty information for the .smd file\n-> Optional '...
%     'Information: Data that might be included in the .smd file\n -> Data'...
%     ': Vector with the values of the profile Z']);
% waitfor(msgbox(message,'Information'));

waitfor(msgbox({'"VisualSR2D .smd Generator" is an independent module of VisualSR2D that allows you to generate .smd files according to UNE-EN ISO 5436-2 standards.';...
    '';'No previous action in VisualSR2D is required to use this module.';...
    '';'';'';'It is divided in three sections:';'';...
    '-> Header: Obligaroty information for the .smd file';'';...
    '-> Optional Information: Data that might be included in the .smd file';'';
    '-> Data: Vector with the values of the profile Z';'';''},'About VisualSR2D .smd Generator'))

% UIWAIT makes VisualSR2D_smd_Generator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = VisualSR2D_smd_Generator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function revision_number_Callback(hObject, eventdata, handles)
% hObject    handle to revision_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of revision_number as text
%        str2double(get(hObject,'String')) returns contents of revision_number as a double


% --- Executes during object creation, after setting all properties.
function revision_number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to revision_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function file_identifier_Callback(hObject, eventdata, handles)
% hObject    handle to file_identifier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_identifier as text
%        str2double(get(hObject,'String')) returns contents of file_identifier as a double


% --- Executes during object creation, after setting all properties.
function file_identifier_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_identifier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in feature_type.
function feature_type_Callback(hObject, eventdata, handles)
% hObject    handle to feature_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns feature_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from feature_type
f_t=getCurrentPopupString(handles.feature_type);
if strcmp(f_t,'SUR')==1
    message=sprintf(['VisualSR2D smd Generator only supports 2D data.']);
    waitfor(msgbox(message,'Error','Error'));
    set(handles.feature_type,'value',1);
end

% --- Executes during object creation, after setting all properties.
function feature_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to feature_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function feature_number_Callback(hObject, eventdata, handles)
% hObject    handle to feature_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of feature_number as text
%        str2double(get(hObject,'String')) returns contents of feature_number as a double


% --- Executes during object creation, after setting all properties.
function feature_number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to feature_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function feature_name_Callback(hObject, eventdata, handles)
% hObject    handle to feature_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of feature_name as text
%        str2double(get(hObject,'String')) returns contents of feature_name as a double


% --- Executes during object creation, after setting all properties.
function feature_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to feature_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in x_axis_type.
function x_axis_type_Callback(hObject, eventdata, handles)
% hObject    handle to x_axis_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns x_axis_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from x_axis_type
x_a_t=getCurrentPopupString(handles.x_axis_type);
if strcmp(x_a_t,'I')==0
    message=sprintf(['Only Incremental data for the X axis is supported']);
    waitfor(msgbox(message,'Error','Error'));
    set(handles.x_axis_type,'value',1);
end

% --- Executes during object creation, after setting all properties.
function x_axis_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_axis_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in x_units.
function x_units_Callback(hObject, eventdata, handles)
% hObject    handle to x_units (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns x_units contents as cell array
%        contents{get(hObject,'Value')} returns selected item from x_units


% --- Executes during object creation, after setting all properties.
function x_units_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_units (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x_scale_factor_Callback(hObject, eventdata, handles)
% hObject    handle to x_scale_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_scale_factor as text
%        str2double(get(hObject,'String')) returns contents of x_scale_factor as a double


% --- Executes during object creation, after setting all properties.
function x_scale_factor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_scale_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in z_axis_type.
function z_axis_type_Callback(hObject, eventdata, handles)
% hObject    handle to z_axis_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns z_axis_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from z_axis_type


% --- Executes during object creation, after setting all properties.
function z_axis_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_axis_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in z_units.
function z_units_Callback(hObject, eventdata, handles)
% hObject    handle to z_units (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns z_units contents as cell array
%        contents{get(hObject,'Value')} returns selected item from z_units


% --- Executes during object creation, after setting all properties.
function z_units_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_units (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function z_scale_factor_Callback(hObject, eventdata, handles)
% hObject    handle to z_scale_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z_scale_factor as text
%        str2double(get(hObject,'String')) returns contents of z_scale_factor as a double


% --- Executes during object creation, after setting all properties.
function z_scale_factor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_scale_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in z_axis_data_type.
function z_axis_data_type_Callback(hObject, eventdata, handles)
% hObject    handle to z_axis_data_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns z_axis_data_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from z_axis_data_type


% --- Executes during object creation, after setting all properties.
function z_axis_data_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_axis_data_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in x_axis_data_type.
function x_axis_data_type_Callback(hObject, eventdata, handles)
% hObject    handle to x_axis_data_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns x_axis_data_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from x_axis_data_type


% --- Executes during object creation, after setting all properties.
function x_axis_data_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_axis_data_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function number_of_points_Callback(hObject, eventdata, handles)
% hObject    handle to number_of_points (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of number_of_points as text
%        str2double(get(hObject,'String')) returns contents of number_of_points as a double


% --- Executes during object creation, after setting all properties.
function number_of_points_CreateFcn(hObject, eventdata, handles)
% hObject    handle to number_of_points (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x_incremental_value_Callback(hObject, eventdata, handles)
% hObject    handle to x_incremental_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_incremental_value as text
%        str2double(get(hObject,'String')) returns contents of x_incremental_value as a double


% --- Executes during object creation, after setting all properties.
function x_incremental_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_incremental_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function date_Callback(hObject, eventdata, handles)
% hObject    handle to date (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of date as text
%        str2double(get(hObject,'String')) returns contents of date as a double


% --- Executes during object creation, after setting all properties.
function date_CreateFcn(hObject, eventdata, handles)
% hObject    handle to date (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function time_Callback(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time as text
%        str2double(get(hObject,'String')) returns contents of time as a double


% --- Executes during object creation, after setting all properties.
function time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function instrument_id_Callback(hObject, eventdata, handles)
% hObject    handle to instrument_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of instrument_id as text
%        str2double(get(hObject,'String')) returns contents of instrument_id as a double


% --- Executes during object creation, after setting all properties.
function instrument_id_CreateFcn(hObject, eventdata, handles)
% hObject    handle to instrument_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function instrument_serial_Callback(hObject, eventdata, handles)
% hObject    handle to instrument_serial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of instrument_serial as text
%        str2double(get(hObject,'String')) returns contents of instrument_serial as a double


% --- Executes during object creation, after setting all properties.
function instrument_serial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to instrument_serial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function profile_filter_Callback(hObject, eventdata, handles)
% hObject    handle to profile_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of profile_filter as text
%        str2double(get(hObject,'String')) returns contents of profile_filter as a double


% --- Executes during object creation, after setting all properties.
function profile_filter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to profile_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function last_adjustement_Callback(hObject, eventdata, handles)
% hObject    handle to last_adjustement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of last_adjustement as text
%        str2double(get(hObject,'String')) returns contents of last_adjustement as a double


% --- Executes during object creation, after setting all properties.
function last_adjustement_CreateFcn(hObject, eventdata, handles)
% hObject    handle to last_adjustement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function parameter_value_Callback(hObject, eventdata, handles)
% hObject    handle to parameter_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of parameter_value as text
%        str2double(get(hObject,'String')) returns contents of parameter_value as a double


% --- Executes during object creation, after setting all properties.
function parameter_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to parameter_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function probing_system_Callback(hObject, eventdata, handles)
% hObject    handle to probing_system (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of probing_system as text
%        str2double(get(hObject,'String')) returns contents of probing_system as a double


% --- Executes during object creation, after setting all properties.
function probing_system_CreateFcn(hObject, eventdata, handles)
% hObject    handle to probing_system (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function comment_Callback(hObject, eventdata, handles)
% hObject    handle to comment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comment as text
%        str2double(get(hObject,'String')) returns contents of comment as a double


% --- Executes during object creation, after setting all properties.
function comment_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function offset_Callback(hObject, eventdata, handles)
% hObject    handle to offset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of offset as text
%        str2double(get(hObject,'String')) returns contents of offset as a double


% --- Executes during object creation, after setting all properties.
function offset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to offset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function speed_Callback(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of speed as text
%        str2double(get(hObject,'String')) returns contents of speed as a double


% --- Executes during object creation, after setting all properties.
function speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function created_by_Callback(hObject, eventdata, handles)
% hObject    handle to created_by (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of created_by as text
%        str2double(get(hObject,'String')) returns contents of created_by as a double


% --- Executes during object creation, after setting all properties.
function created_by_CreateFcn(hObject, eventdata, handles)
% hObject    handle to created_by (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function data_Callback(hObject, eventdata, handles)
% hObject    handle to data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data as text
%        str2double(get(hObject,'String')) returns contents of data as a double


% --- Executes during object creation, after setting all properties.
function data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

% #########################################################################
% ############################# FIRST NEXT ################################
% #########################################################################

if strcmp(get(handles.revision_number,'visible'),'on')==1
    
     % Calls the external function current_date_and_time
    [date_def, time_def] = current_date_and_time;
    set(handles.date,'string',date_def); set(handles.time,'string',time_def);


    % handles visibilities
    %----------------------------------------------------------------------
    set(handles.static1,'visible','off'); set(handles.static2,'visible','off');
    set(handles.static3,'visible','off'); set(handles.static4,'visible','off');
    set(handles.static5,'visible','off'); set(handles.static6,'visible','off');
    set(handles.static7,'visible','off'); set(handles.static8,'visible','off');
    set(handles.static9,'visible','off'); set(handles.static10,'visible','off');
    set(handles.static11,'visible','off'); set(handles.static12,'visible','off');
    set(handles.static13,'visible','off'); set(handles.static14,'visible','off');
    set(handles.static15,'visible','off');
    
    set(handles.revision_number,'visible','off');
    set(handles.file_identifier,'visible','off');
    set(handles.feature_type,'visible','off');
    set(handles.feature_number,'visible','off');
    set(handles.feature_name,'visible','off');
    set(handles.number_of_points,'visible','off');
    set(handles.x_axis_type,'visible','off');
    set(handles.z_axis_type,'visible','off');
    set(handles.x_units,'visible','off');
    set(handles.z_units,'visible','off');
    set(handles.x_scale_factor,'visible','off');
    set(handles.z_scale_factor,'visible','off');
    set(handles.x_axis_data_type,'visible','off');
    set(handles.z_axis_data_type,'visible','off');
    set(handles.x_incremental_value,'visible','off');
    
    set(handles.static16,'visible','on'); set(handles.static17,'visible','on');
    set(handles.static18,'visible','on'); set(handles.static19,'visible','on');
    set(handles.static20,'visible','on'); set(handles.static21,'visible','on');
    set(handles.static22,'visible','on'); set(handles.static23,'visible','on');
    set(handles.static24,'visible','on'); set(handles.static25,'visible','on');
    set(handles.static26,'visible','on'); set(handles.static27,'visible','on');
    
    set(handles.date,'visible','on');
    set(handles.time,'visible','on');
    set(handles.created_by,'visible','on');
    set(handles.instrument_id,'visible','on');
    set(handles.instrument_serial,'visible','on');
    set(handles.last_adjustement,'visible','on');
    set(handles.probing_system,'visible','on');
    set(handles.comment,'visible','on');
    set(handles.offset,'visible','on');
    set(handles.speed,'visible','on');
    set(handles.profile_filter,'visible','on');
    set(handles.help_profile_filter,'visible','on');
    set(handles.parameter_value,'visible','on');
    
    set(handles.header,'visible','off')
    set(handles.other_information,'visible','on')
    
    set(handles.back,'visible','on');
    
% #########################################################################
% ############################ SECOND NEXT ################################
% #########################################################################  
elseif strcmp(get(handles.date,'visible'),'on')==1
    
    
    set(handles.static16,'visible','off'); set(handles.static17,'visible','off');
    set(handles.static18,'visible','off'); set(handles.static19,'visible','off');
    set(handles.static20,'visible','off'); set(handles.static21,'visible','off');
    set(handles.static22,'visible','off'); set(handles.static23,'visible','off');
    set(handles.static24,'visible','off'); set(handles.static25,'visible','off');
    set(handles.static26,'visible','off'); set(handles.static27,'visible','off');
    
    set(handles.date,'visible','off');
    set(handles.time,'visible','off');
    set(handles.created_by,'visible','off');
    set(handles.instrument_id,'visible','off');
    set(handles.instrument_serial,'visible','off');
    set(handles.last_adjustement,'visible','off');
    set(handles.probing_system,'visible','off');
    set(handles.comment,'visible','off');
    set(handles.offset,'visible','off');
    set(handles.speed,'visible','off');
    set(handles.profile_filter,'visible','off');
    set(handles.help_profile_filter,'visible','off');
    set(handles.parameter_value,'visible','off');
    

    set(handles.other_information,'visible','off')
    
    set(handles.static28,'visible','on');
    set(handles.data_title,'visible','on')
    set(handles.data,'visible','on')
    set(handles.reset_data,'visible','on')
    
    set(handles. next,'string','Finish')
    
% #########################################################################
% ############################### FINISH ##################################
% ######################################################################### 

elseif strcmp(get(handles.data,'visible'),'on')==1
    % ASCII chars to be used
    NUL=char(0); % ASCII "NUL" character
    CR=char(13); % ASCII "CR" character
    LF=char(10); % ASCII "LF" character
    ETX=char(3); % ASCII "ETX" character
    SUB=char(26); % ASCII "SUB" character
    
    header{1}=get(handles.revision_number,'string');
    header{2}=get(handles.file_identifier,'string');
    header{3}=getCurrentPopupString(handles.feature_type);
    header{4}=get(handles.feature_number,'string');
    header{5}=get(handles.feature_name,'string');
    header{6}=get(handles.number_of_points,'string');
    header{7}=getCurrentPopupString(handles.x_axis_type);
    header{8}=getCurrentPopupString(handles.z_axis_type);
    header{9}=getCurrentPopupString(handles.x_units);
    header{10}=getCurrentPopupString(handles.z_units');
    header{11}=get(handles.x_scale_factor,'string');
    header{12}=get(handles.z_scale_factor,'string');
    header{13}=getCurrentPopupString(handles.x_axis_data_type);
    header{14}=getCurrentPopupString(handles.z_axis_data_type);
    header{15}=get(handles.x_incremental_value,'string');
    
    for i=1:15
        if isempty(header{i})==1
            waitfor(msgbox('All fields of the Header section must be completed!',...
                'Error','error'));
            return
        end
    end
    
    o_i{1}=get(handles.date,'string');
    o_i{2}=get(handles.time,'string');
    o_i{3}=get(handles.created_by,'string');
    o_i{4}=get(handles.instrument_id,'string');
    o_i{5}=get(handles.instrument_serial,'string');
    o_i{6}=get(handles.last_adjustement,'string');
    o_i{7}=get(handles.probing_system,'string');
    o_i{8}=get(handles.comment,'string');
    o_i{9}=get(handles.offset,'string');
    o_i{10}=get(handles.speed,'string');
    o_i{11}=get(handles.profile_filter,'string');
    o_i{12}=get(handles.parameter_value,'string');
    
    data=get(handles.data,'string');
    data=deblank(data);
    assignin('base','data',data)

    if size(data,1) ~= str2num(header{6})
        waitfor(msgbox(['The number of points introduced (' num2str(size(data,1)) ')' ...
            ' does NOT match the number of points specified in the Header (' ...
            header{6} ')'],'Error','error'));
        return
    end
    

    
%---------------- DATA WRITTING AND CHECKSUM COMPUTATION ------------------   
    
    
    % Creates the new .smd file named as the File Identifier
smd_file = fopen([header{2} '.smd'], 'w');

% ########################################################################
% ######################### SECTION 1: HEADER ############################
% ########################################################################
% LINE 1
h_line1=[header{1} NUL header{2} NUL CR LF];
fwrite(smd_file,h_line1);

% LINE 2
h_line2=[header{3} NUL ' ' header{4} ' ' header{5} NUL CR LF];
fwrite(smd_file,h_line2);

% LINE 3
h_line3=['CX' NUL ' ' header{7} NUL ' ' header{6} ' ' header{9} NUL ...
    ' ' header{11} ' ' header{13} NUL ' ' header{15} CR LF];
fwrite(smd_file,h_line3);

% LINE 4
h_line4=['CZ' NUL ' ' header{8} NUL ' ' header{6} ' ' header{10} NUL...
    ' ' header{12} ' ' header{14} NUL CR LF];
fwrite(smd_file,h_line4);

% LINE 5 - END OF SECTION 1
h_line5=[ETX CR LF];
fwrite(smd_file,h_line5);

% Bytes of the SECTION 1: HEADER
bytes_header=sum(double(h_line1))+sum(double(h_line2))+...
    sum(double(h_line3))+sum(double(h_line4))+sum(double(h_line5));

% ########################################################################
% ################# SECTION 2: OPTIONAL INFORMATION ######################
% ########################################################################

o_line1=char(0); o_line2=char(0);  o_line3=char(0);  o_line4=char(0);
o_line5=char(0); o_line6=char(0);  o_line7=char(0);  o_line8=char(0);
o_line9=char(0); o_line10=char(0); o_line11=char(0); o_line12=char(0);
o_line13=char(0);

% LINE 1
if isempty(o_i{1})~=1 && strcmp(o_i{1},' ')~=1
    o_line1=['DATE ' o_i{1} NUL CR LF];
    fwrite(smd_file,o_line1);
end

% LINE 2
if isempty(o_i{2})~=1 && strcmp(o_i{2},' ')~=1
    o_line2=['TIME ' o_i{2} NUL CR LF];
    fwrite(smd_file,o_line2);
end

% LINE 3
if isempty(o_i{3})~=1 && strcmp(o_i{3},' ')~=1
    o_line3=['CREATED_BY ' o_i{3} NUL CR LF];
    fwrite(smd_file,o_line3);
end

% LINE 4
if isempty(o_i{4})~=1 && strcmp(o_i{4},' ')~=1
    o_line4=['INSTRUMENT_ID ' o_i{4} NUL CR LF];
    fwrite(smd_file,o_line4);
end

% LINE 5
if isempty(o_i{5})~=1 && strcmp(o_i{5},' ')~=1
    o_line5=['INSTRUMENT_SERIAL ' o_i{5} NUL CR LF];
    fwrite(smd_file,o_line5);
end

% LINE 6
if isempty(o_i{6})~=1 && strcmp(o_i{6},' ')~=1
    o_line6=['LAST_ADJUSTEMENT ' o_i{6} NUL CR LF];
    fwrite(smd_file,o_line6);
end

% LINE 7
if isempty(o_i{7})~=1 && strcmp(o_i{7},' ')~=1
    o_line7=['PROBING_SYSTEM ' o_i{7} NUL CR LF];
    fwrite(smd_file,o_line7);
end

% LINE 8
if isempty(o_i{8})~=1 && strcmp(o_i{8},' ')~=1
    o_line8=['COMMENT /* ' o_i{8} '*/' NUL CR LF];
    fwrite(smd_file,o_line8);
end

% Line 9
if isempty(o_i{9})~=1 && strcmp(o_i{9},' ')~=1
    o_line9=['OFFSET ' o_i{9} NUL CR LF];
    fwrite(smd_file,o_line9);
end

% Line 10
if isempty(o_i{10})~=1 && strcmp(o_i{10},' ')~=1
    o_line10=['SPEED ' o_i{10} NUL CR LF];
    fwrite(smd_file,o_line10);
end

% Line 11
if isempty(o_i{11})~=1 && strcmp(o_i{11},' ')~=1
    o_line11=['PROFILE_FILTER ' o_i{11} NUL CR LF];
    fwrite(smd_file,o_line11);
end

% Line 12
if isempty(o_i{12})~=1 && strcmp(o_i{12},' ')~=1
    o_line12=['PARAMETER_VALUE ' o_i{12} NUL CR LF];
    fwrite(smd_file,o_line12);
end

% LINE 13 - END OF SECTION 2
o_line13=[ETX CR LF];
fwrite(smd_file,o_line13);


% Bytes of the SECTION 2: OPTIONAL INFORMATION
bytes_optional_information=sum(double(o_line1))+sum(double(o_line2))+...
    sum(double(o_line3))+sum(double(o_line4))+sum(double(o_line5))+...
    sum(double(o_line6))+sum(double(o_line7))+sum(double(o_line8))+...
    sum(double(o_line9))+sum(double(o_line10))+sum(double(o_line11))+...
    sum(double(o_line12))+sum(double(o_line13));

% ########################################################################
% ########################### SECTION 3: DATA ############################
% ########################################################################

bytes_data=0;

for i=1:size(data,1)
        
    % ASCII charactes are taken as spaces. It is necessary to trim them and
    % add them again
    temp=deblank(data(i,:));
    temp=[temp CR LF];
    
    % Bytes of the SECTION 3: DATA
    bytes_data=bytes_data+sum(double(temp));
    
    fwrite(smd_file,temp);
end

% FINAL LINE DATA
f_data=[ETX CR LF];
bytes_data=bytes_data+sum(double(f_data));
fwrite(smd_file,f_data);

% ########################################################################
% ######################### SECTION 4: CHECKSUM ##########################
% ########################################################################

checksum_temp=bytes_header+bytes_optional_information+bytes_data;
checksum=mod(checksum_temp,65535);

fwrite(smd_file,[num2str(checksum,30) CR LF ETX CR LF SUB CR LF]);

% -----------------------------------------------------------------------
fclose(smd_file);

waitfor(msgbox([header{2} '.smd has been generated in ' pwd], 'Done!'));
delete(handles.figure1); 

end


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data_title (see GUIDATA)

if strcmp(get(handles.date,'visible'),'on')==1
    
    set(handles.static1,'visible','on'); set(handles.static2,'visible','on');
    set(handles.static3,'visible','on'); set(handles.static4,'visible','on');
    set(handles.static5,'visible','on'); set(handles.static6,'visible','on');
    set(handles.static7,'visible','on'); set(handles.static8,'visible','on');
    set(handles.static9,'visible','on'); set(handles.static10,'visible','on');
    set(handles.static11,'visible','on'); set(handles.static12,'visible','on');
    set(handles.static13,'visible','on'); set(handles.static14,'visible','on');
    set(handles.static15,'visible','on');
    
    set(handles.revision_number,'visible','on');
    set(handles.file_identifier,'visible','on');
    set(handles.feature_type,'visible','on');
    set(handles.feature_number,'visible','on');
    set(handles.feature_name,'visible','on');
    set(handles.number_of_points,'visible','on');
    set(handles.x_axis_type,'visible','on');
    set(handles.z_axis_type,'visible','on');
    set(handles.x_units,'visible','on');
    set(handles.z_units,'visible','on');
    set(handles.x_scale_factor,'visible','on');
    set(handles.z_scale_factor,'visible','on');
    set(handles.x_axis_data_type,'visible','on');
    set(handles.z_axis_data_type,'visible','on');
    set(handles.x_incremental_value,'visible','on');
    
    set(handles.static16,'visible','off'); set(handles.static17,'visible','off');
    set(handles.static18,'visible','off'); set(handles.static19,'visible','off');
    set(handles.static20,'visible','off'); set(handles.static21,'visible','off');
    set(handles.static22,'visible','off'); set(handles.static23,'visible','off');
    set(handles.static24,'visible','off'); set(handles.static25,'visible','off');
    set(handles.static26,'visible','off'); set(handles.static27,'visible','off');
    
    set(handles.date,'visible','off');
    set(handles.time,'visible','off');
    set(handles.created_by,'visible','off');
    set(handles.instrument_id,'visible','off');
    set(handles.instrument_serial,'visible','off');
    set(handles.last_adjustement,'visible','off');
    set(handles.probing_system,'visible','off');
    set(handles.comment,'visible','off');
    set(handles.offset,'visible','off');
    set(handles.speed,'visible','off');
    set(handles.profile_filter,'visible','off');
    set(handles.help_profile_filter,'visible','off');
    set(handles.parameter_value,'visible','off');
    
    set(handles.header,'visible','on')
    set(handles.other_information,'visible','off')
    
    set(handles.back,'visible','off');
    
elseif strcmp(get(handles.data,'visible'),'on')==1
    
    
    set(handles.static16,'visible','on'); set(handles.static17,'visible','on');
    set(handles.static18,'visible','on'); set(handles.static19,'visible','on');
    set(handles.static20,'visible','on'); set(handles.static21,'visible','on');
    set(handles.static22,'visible','on'); set(handles.static23,'visible','on');
    set(handles.static24,'visible','on'); set(handles.static25,'visible','on');
    set(handles.static26,'visible','on'); set(handles.static27,'visible','on');
    
    set(handles.date,'visible','on');
    set(handles.time,'visible','on');
    set(handles.created_by,'visible','on');
    set(handles.instrument_id,'visible','on');
    set(handles.instrument_serial,'visible','on');
    set(handles.last_adjustement,'visible','on');
    set(handles.probing_system,'visible','on');
    set(handles.comment,'visible','on');
    set(handles.offset,'visible','on');
    set(handles.speed,'visible','on');
    set(handles.profile_filter,'visible','on');
    set(handles.help_profile_filter,'visible','on');
    set(handles.parameter_value,'visible','on');
    
    set(handles.other_information,'visible','on')
    set(handles.static28,'visible','off');
    set(handles.data_title,'visible','off')
    set(handles.data,'visible','off')
    set(handles.reset_data,'visible','off')
    
    set(handles. next,'string','Next >')
end


% --- Executes on button press in reset_data.
function reset_data_Callback(hObject, eventdata, handles)
% hObject    handle to reset_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of reset_data
set(handles.data,'string','')


% --- Executes on button press in help_profile_filter.
function help_profile_filter_Callback(hObject, eventdata, handles)
% hObject    handle to help_profile_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

message=sprintf('If you know that you are working with a profile that has been filtered, please consider giving information about the filtering process applied to it.\n\nParameters such as Lc are very importante since they define the sampling length of the profile.\n\nThe proper way to fill this field is by indicating the type of filter used (FFT/Gaussian/2RC...) followed by an space, then the name of the cutoff to define (Lc/Ls...) followed by another space, and finally the value of that cutoff in mm (0.08/2.5e-1...)\n\n\nExample:\n\nGaussian Lc 0.8\n\n\nPlease do NOT indicate if the profile obtained was Waviness or Roughness here. You should indicate that in the File Identifier field (for instance renaming your file to myfile_Waviness or myfile_Roughness).');
waitfor(msgbox(message,'Help'))
