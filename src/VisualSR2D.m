function varargout = VisualSR2D(varargin)
% VISUALSR2D MATLAB code for VisualSR2D.fig
%      VISUALSR2D, by itself, creates a new VISUALSR2D or raises the existing
%      singleton*.
%
%      H = VISUALSR2D returns the handle to a new VISUALSR2D or the handle to
%      the existing singleton*.
%
%      VISUALSR2D('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VISUALSR2D.M with the given input arguments.
%
%      VISUALSR2D('Property','Value',...) creates a new VISUALSR2D or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VisualSR2D_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VisualSR2D_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VisualSR2D

% Last Modified by GUIDE v2.5 17-Jun-2014 16:04:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VisualSR2D_OpeningFcn, ...
                   'gui_OutputFcn',  @VisualSR2D_OutputFcn, ...
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


% --- Executes just before VisualSR2D is made visible.
function VisualSR2D_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VisualSR2D (see VARARGIN)
clc

% Handles of the parameters window are hidden, but not the entire uipanel
% because this is the default view when the software is executed
set(handles.parameter_ra,'visible','off')
set(handles.A1,'visible','off')
set(handles.parameter_rq,'visible','off')
set(handles.A2,'visible','off')
set(handles.parameter_rp,'visible','off')
set(handles.A3,'visible','off')
set(handles.parameter_rv,'visible','off')
set(handles.A4,'visible','off')
set(handles.parameter_rt,'visible','off')
set(handles.A5,'visible','off')
set(handles.parameter_rsm,'visible','off')
set(handles.S1,'visible','off')
set(handles.parameter_rsk,'visible','off')
set(handles.parameter_rku,'visible','off')

% RSM window handles, hidden but the entire uipanel is not hidden 
% because this is the default view when the software is executed
set(handles.calculate_RSm_update,'visible','off')
set(handles.input_rsm_height_discrimination,'visible','off')
set(handles.hd1,'visible','off')
set(handles.hd2,'visible','off')
set(handles.input_rsm_spacing_discrimination,'visible','off')
set(handles.sd1,'visible','off')
set(handles.sd2,'visible','off')
set(handles.sd3,'visible','off')

% Parameters uipanels are the default view of the software
set(handles.uipanel_parameters1,'visible','on')
set(handles.uipanel_parameters2,'visible','on')
set(handles.uipanel_parameters3,'visible','on')

% The rest of the parameters are hidden in the preview
set(handles.uipanel_freq,'visible','off')
set(handles.uipanel_gaussian,'visible','off')
set(handles.uipanel_2rc,'visible','off')
set(handles.uipanel_psd,'visible','off')
set(handles.uipanel_correlation,'visible','off')
set(handles.uipanel_bac,'visible','off')

% Text outputs that are not visible when you first load a menu
set(handles.output_bin_location,'visible','off')

% Choose default command line output for VisualSR2D
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes VisualSR2D wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = VisualSR2D_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
guidata(hObject, handles);


% --- Executes on button press in browse_button.
function browse_button_Callback(hObject, eventdata, handles)
% hObject    handle to browse_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uigetfile({'*.smd';'*.*'},'File Selector');
if filename==0
    return
end
route = [pathname,filename];
set(handles.file_route,'String',route);
handles.route=route;
guidata(gcbo, handles);
guidata(hObject, handles);


% --- Executes on button press in load_button.
function load_button_Callback(hObject, ~, handles)
% hObject    handle to load_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%#########################################################################
%### GUI OPERATIONS IN CASE THIS IS NOT THE FIRST PROFILE TO BE LOADED ###
%#########################################################################

% If need to clear = 1 then handles must be cleared
aux=get(handles.pre_text_amplitude_parameters,'visible');

if strcmpi(aux,'off')==1
    
    % Clears all the data in mystuff
    handles=rmfield(handles,'mystuff');
    % Visibility of the greek letters of the filters parameters screen on
    % in case the Load Button is not pressed for the first time
    mu1=handles.greekletters.mu1; m1=get(mu1,'children'); set(m1,'visible','on')
    mu2=handles.greekletters.mu2; m2=get(mu2,'children'); set(m2,'visible','on')
    mu3=handles.greekletters.mu3; m3=get(mu3,'children'); set(m3,'visible','on')
    mu4=handles.greekletters.mu4; m4=get(mu4,'children'); set(m4,'visible','on')
    mu5=handles.greekletters.mu5; m5=get(mu5,'children'); set(m5,'visible','on')
    mu6=handles.greekletters.mu6; m6=get(mu6,'children'); set(m6,'visible','on')
    
else
    
    % Creates axes with a greek letter to display the Bin Location units (BAC)
    mu7=axes('units','pixels','position',[988 214 0.1 0.1],'visible','off');
    text(0,0,'(\mum)')
    handles.greekletters.mu7=mu7;
    m7=get(mu7,'children'); set(m7,'visible','off')
    set(handles.text_bin,'visible','off')
    
    % Due to a limitation in MATLAB GUI, introducing axes is the only
    % way to diaplay greek letters in the GUI window
    lambdac1=axes('position',[0.77 0.5 0.1 0.5],'visible','off'); %lambdac for Gaussian
    text(0,0,'Long Cutoff (\lambdac)')
    lambdac2=axes('position',[0.77 0.71 0.1 0.5],'visible','off'); %lambdac for 2RC
    text(0,0,'Long Cutoff (\lambdac)')
    handles.greekletters.lambdac1=lambdac1; handles.greekletters.lambdac2=lambdac2;
    guidata(hObject, handles);
    
end

mu7=handles.greekletters.mu7; m7=get(mu7,'children'); set(m7,'visible','off')
la1=handles.greekletters.lambdac1; l1=get(la1,'children'); set(l1,'visible','off')
la2=handles.greekletters.lambdac2; l2=get(la2,'children'); set(l2,'visible','off')

set(handles.uipanel_freq,'visible','off')
set(handles.uipanel_gaussian,'visible','off')
set(handles.uipanel_2rc,'visible','off')
set(handles.uipanel_psd,'visible','off')
set(handles.uipanel_correlation,'visible','off')
set(handles.uipanel_bac,'visible','off')
set(handles.export_filtered_data,'visible','off')
set(handles.uipanel_parameters1,'visible','on')
set(handles.uipanel_parameters2,'visible','on')
set(handles.uipanel_parameters3,'visible','on')
route=handles.route;



%#########################################################################
%###################### LOAD AND INITIAL COMPROBATIONS ###################
%#########################################################################

% Filter for .smd files
is_smd=route(end-3:end);
if strcmpi(is_smd,'.smd')~=1
    waitfor(msgbox('Error: The file selected is not a .smd file',...
        'Error','Error'))
    return
end

fid = fopen(route);
fid2 = fopen(route);
data_loaded = textscan(fid, '%s%s%s%s%s%s%s%s%s');

bvf=fread(fid2); %bvf stands for binary_values_file;

fclose(fid);
fclose(fid2);

nul_separators=find(bvf==0);

if isempty(nul_separators)
    waitfor(msgbox(sprintf(['No <NUL> separation characters where found.\n\nProbably the .smd file was saved with a Text Editor that did not support ASCII.\n\nVisualSR2D cannot continue.']),...
                'Critical error'))
    return
end

% Comprobations are based on the checksum, so the bvf vector is mirrored to
% work in an easier way
bvf2=flipud(bvf);

% Localizes the section separations
section_separation=find(bvf2==3);

% There must be 4 section separations in a valid smd file
if size(section_separation,1)~=4
    message=sprintf(['The file selected has an unexpected structure.' ...
    '\n\nContinuing may cause errors during the execution or in the results.' ...
    '\n\nDo you want to continue?']);
    continue_yes_no = questdlg(message,'Error','Yes','No','No');

    if strcmpi(continue_yes_no,'No')==1
        return
    end
end

% For the 2D profiles that VisualSR2D uses, Header must have 4 lines plus
% the end of section
ETX_header=double(data_loaded{1,1}{5,1});
if ETX_header~=3
    message=sprintf(['Unexpected Header stucture. Maybe not 2D data?' ...
    '\n\nContinuing may cause errors during the execution or in the results.' ...
    '\n\nDo you want to continue?']);
    continue_yes_no = questdlg(message,'Error','Yes','No','No');

    if strcmpi(continue_yes_no,'No')==1
        return
    end
end

% Checksum structure has to be recognized
if   bvf2(1)~=26 || bvf2(2)~=10 || bvf2(3)~=13 || bvf2(4)~=3 || ...
        bvf2(5)~=10 || bvf2(6)~=13
    if bvf2(1)~= 10 || bvf2(2)~=13
        message=sprintf(['The file selected has an unexpected checksum structure.' ...
            '\n\nContinuing may cause errors during the execution or in the results.' ...
            '\n\nDo you want to continue?']);
        continue_yes_no = questdlg(message,'Error','Yes','No','No');
        
        if strcmpi(continue_yes_no,'No')==1
            return
        end
    end
end

% Computes the real checksum of the file
real_checksum=mod(sum(double(bvf2(section_separation(2)-2:end))),65535);

% Gets the checksum written in the file
cont=1;
for i=section_separation(1)+3:section_separation(2)-3
    file_checksum_binary_flippedlr(cont)=bvf2(i);
    cont=cont+1;
end
file_checksum_binary=fliplr(file_checksum_binary_flippedlr);
file_checksum='';
for i=1:size(file_checksum_binary,2)
    file_checksum=[file_checksum char(file_checksum_binary(i))];
end
    file_checksum=str2num(file_checksum);


% Checksum comprobation
if file_checksum~=real_checksum
    er=sprintf('The checksum of the file is incorrect. It should be %d and it is %d.',real_checksum,file_checksum);
    
    message=sprintf([er,'\n\nContinuing may cause errors during the execution or in the results.' ...
        '\n\nDo you want to continue?']);
    continue_yes_no = questdlg(message,'Error','Yes','No','No');
    
    switch continue_yes_no
        case 'Yes'
            
        case 'No'
            return
    end
end

%#########################################################################
%####################### FILE INFORMATION: HEADER ########################
%#########################################################################

%------------------------- The_revision_number ----------------------------
The_revision_number='';
for i=1:nul_separators(1)-1
    The_revision_number=[The_revision_number char(bvf(i))];
end

if strcmpi(The_revision_number(1:8),'ISO 5436')~=1 && strcmpi(The_revision_number(1:7),'ISO5436')~=1 && ...
        strcmpi(The_revision_number(1:8),'ISO-5436')~=1
    message=sprintf(['The file selected is not based on ISO 5436 standards.' ...
    '\n\nVisualSR2D is adapted to these standards, so continuing may cause ' ...
    'errors during the execution or in the results.\n\nDo you want to continue?']);
    continue_yes_no = questdlg(message,'Error','Yes','No','No');

    if strcmpi(continue_yes_no,'No')==1
        return
    end
end

%--------------------------- File_identifier ------------------------------
File_identifier='';
for i=nul_separators(1)+1:nul_separators(2)-1
    File_identifier=[File_identifier char(bvf(i))];
end
handles.mystuff.file_identifier=File_identifier;
%----------------------------- Feature_type -------------------------------

Feature_type=deblank(data_loaded{1,1}{2,1});
if strcmpi(Feature_type,'PRF')~=1
    message=sprintf(['The file selected is does NOT contain a 2D profile.' ...
    '\n\nVisualSR2D is adapted to work with 2D profiles only.']);
    waitfor(msgbox(message,'Error','Error'));
    return
end

%---------------------------- Feature_number ------------------------------
Feature_number=deblank(data_loaded{1,2}{2,1});
isintstr = all(Feature_number >= '0') && all(Feature_number <= '9');

if isintstr~=1
    message=sprintf(['The Feature Number was expected to be a number, but it is not.' ...
    '\n\nContinuing may cause errors during the execution or in the results.\n\nDo you want to continue?']);
    continue_yes_no = questdlg(message,'Error','Yes','No','No');

    if strcmpi(continue_yes_no,'No')==1
        return
    end
end

%---------------------------- Feature_name ------------------------------
Feature_name=deblank(data_loaded{1,3}{2,1});

%---------------------------- X_Axis_name ------------------------------
X_Axis_name=deblank(data_loaded{1,1}{3,1});
if strcmpi(X_Axis_name,'CX')~=1
    err=sprintf('The horizontal axis was supposed to be CX, but instead it is called %s',X_Axis_name);
    message=sprintf([err '\n\nContinuing may cause errors during the execution or in the results.'...
    '\n\nDo you want to continue?']);
    continue_yes_no = questdlg(message,'Error','Yes','No','No');

    if strcmpi(continue_yes_no,'No')==1
        return
    end
end

%---------------------------- Z_Axis_name ------------------------------
Z_Axis_name=deblank(data_loaded{1,1}{4,1});
if strcmpi(Z_Axis_name,'CZ')~=1
    err=sprintf('The horizontal axis was supposed to be CZ, but instead it is called %s',Z_Axis_name);
    message=sprintf([err '\n\nContinuing may cause errors during the execution or in the results.'...
    '\n\nDo you want to continue?']);
    continue_yes_no = questdlg(message,'Error','Yes','No','No');

    if strcmpi(continue_yes_no,'No')==1
        return
    end
end

%---------------------------- X_Axis_type ------------------------------
X_Axis_type=deblank(data_loaded{1,2}{3,1});
if strcmpi(X_Axis_type,'I')~=1
    
    waitfor(msgbox('VisualSR2D only works with Incremental X axis data type',...
        'Error','Error'))
    return
end

%---------------------------- Z_Axis_type ------------------------------
Z_Axis_type=deblank(data_loaded{1,2}{4,1});
if strcmpi(Z_Axis_type,'R')~=1 && strcmpi(X_Axis_type,'I')~=1 ...
        && strcmpi(X_Axis_type,'A')~=1
    waitfor(msgbox('Invalid Z axis data type', 'Error','Error'))
    return
end

%--------------------------- Number_of_points -----------------------------
Number_of_points1=str2num(deblank(data_loaded{1,3}{3,1}));
Number_of_points2=str2num(deblank(data_loaded{1,3}{4,1}));

if Number_of_points1~=Number_of_points2
    
    waitfor(msgbox('Error: Different number of points in the X and the Z Axis',...
        'Error','Error'))
    return
end

Number_of_points=Number_of_points1; number_of_points=Number_of_points1;

%------------------------------ X_Units -----------------------------------
X_Units=deblank(data_loaded{1,4}{3,1});
if strcmpi(X_Units,'mm')~=1 && strcmpi(X_Units,'um')~=1
    err=sprintf('X axis units were found to be %s\n\n',X_Units);
    err2=sprintf('VisualSR2D only supports um and mm, please change the units');
    waitfor(msgbox([err err2], 'Error','Error'))
    return
end

%------------------------------ Z_Units -----------------------------------
Z_Units=deblank(data_loaded{1,4}{4,1});
if strcmpi(Z_Units,'mm')~=1 && strcmpi(Z_Units,'um')~=1
    err=sprintf('Z axis units were found to be %s\n\n',Z_Units);
    err2=sprintf('VisualSR2D only supports um and mm, please change the units');
    waitfor(msgbox([err err2], 'Error','Error'))
    return
end

%--------------------------- X_Scale_factor -------------------------------
X_Scale_factor=str2num(deblank(data_loaded{1,5}{3,1}));
if X_Scale_factor<=0
    waitfor(msgbox('There was an error with the X axis Scale factor', 'Error','Error'))
    return
end

%--------------------------- Z_Scale_factor -------------------------------
Z_Scale_factor=str2num(deblank(data_loaded{1,5}{4,1}));
if Z_Scale_factor<=0
    waitfor(msgbox('There was an error with the Z axis Scale factor', 'Error','Error'))
    return
end

%-------------------------- X_Axis_data_type ------------------------------
X_Axis_data_type=deblank(data_loaded{1,6}{3,1});

if strcmpi(X_Axis_data_type,'I')~=1 && strcmpi(X_Axis_data_type,'L')~=1 && ...
        strcmpi(X_Axis_data_type,'F')~=1 && strcmpi(X_Axis_data_type,'D')~=1
    waitfor(msgbox('Unexpected X Axis data type', 'Error','Error'))
    return
end

%-------------------------- Z_Axis_data_type ------------------------------
Z_Axis_data_type=deblank(data_loaded{1,6}{3,1});

if strcmpi(Z_Axis_data_type,'I')~=1 && strcmpi(Z_Axis_data_type,'L')~=1 && ...
        strcmpi(Z_Axis_data_type,'F')~=1 && strcmpi(Z_Axis_data_type,'D')~=1
    waitfor(msgbox('Unexpected X Axis data type', 'Error','Error'))
    return
end

%-------------------------- Incremental_value ------------------------------
Incremental_value=str2num(deblank(data_loaded{1,7}{3,1}));

if Incremental_value<=0
    waitfor(msgbox('There was an error with the incremental value', 'Error','Error'))
    return
end

%---------------------- Date created (if exists) --------------------------
loc=0;
for i=1:15
    if strcmpi(deblank(data_loaded{1,1}{i,1}),'DATE')==1
        loc=i;
        break
    end
end
if loc~=0
    Date=deblank([deblank(data_loaded{1,2}{loc,1}) ' ' ...
        deblank(data_loaded{1,3}{loc,1}) ' ' deblank(data_loaded{1,4}{loc,1}) ' ' ...
        deblank(data_loaded{1,5}{loc,1}) ' ' deblank(data_loaded{1,6}{loc,1})]);
else
    Date='-';
end

%---------------------- Created by (if exists) --------------------------
clear loc; loc=0;
for i=1:15
    if strcmpi(deblank(data_loaded{1,1}{i,1}),'CREATED_BY')==1
        loc=i;
        break
    end
end
if loc~=0
    Created_by=deblank([deblank(data_loaded{1,2}{loc,1}) ' ' ...
        deblank(data_loaded{1,3}{loc,1}) ' ' deblank(data_loaded{1,4}{loc,1}) ' ' ...
        deblank(data_loaded{1,5}{loc,1}) ' ' deblank(data_loaded{1,6}{loc,1}) ' '
        deblank(data_loaded{1,7}{loc,1})]);
else
    Created_by='-';
end

%---------------------- Profile Filter by (if exists) --------------------------
clear loc; loc=0;
smd_filter_type='';
smd_Lc_used='';
smd_filter_used='';
for i=1:15
    if strcmpi(deblank(data_loaded{1,1}{i,1}),'PROFILE_FILTER')==1 || ...
            strcmpi(deblank(data_loaded{1,1}{i,1}),'PROFILE FILTER')==1
        loc=i;
        break
    end
end
if loc~=0
    Profile_Filter=deblank([deblank(data_loaded{1,2}{loc,1}) ' ' ...
        deblank(data_loaded{1,3}{loc,1}) ' ' deblank(data_loaded{1,4}{loc,1}) ' ' ...
        deblank(data_loaded{1,5}{loc,1}) ' ' deblank(data_loaded{1,6}{loc,1}) ' '
        deblank(data_loaded{1,7}{loc,1})]);
    
    spaces=strfind(Profile_Filter,' ');
    
    % Filter name is supposed to be the first word written according to ISO
    % standards
    
    %---------------------------------------------
    smd_filter_used=Profile_Filter(1:spaces(1)-1);
    %---------------------------------------------
    
    % temp2 provides the location of Lc
    temp2=strfind(upper(Profile_Filter),'LC');
    
    if temp2+2>size(Profile_Filter,2)
        waitfor(msgbox('Error in the PROFILE_FILTER field: Unexpected structure','Critical error'));
    end
    
    % Guarantees that there are not spelling mistakes
    if isempty(temp2)==1
        smd_Lc_used='';
        waitfor(msgbox('The smd file had the field PROFILE_FILTER but Lc could not be read','Error'));
        
    elseif strcmpi(Profile_Filter(temp2+2),' ')~=1
        % Case there is no space between Lc and the value
        
        smd_Lc_used=deblank(Profile_Filter(temp2+2:end));
        
        if isempty(str2num(smd_Lc_used))==1
            smd_Lc_used='';
            waitfor(msgbox('The smd file had the field PROFILE_FILTER but Lc could not be read','Error'));
        end
        
    else
        
        % The value of Lc used must be between the space following Lc and the
        % immediately next
        for i=1:size(spaces,2)
            if spaces(i)>temp2
                
                % Takes the first space after Lc
                myspace=spaces(i);
                
                % Takes the second space after Lc. If it doesn't exist it makes
                % it up
                if i==size(spaces,2)
                    myspace2=size(Profile_Filter,2)+1;
                else
                    myspace2=spaces(i+1);
                end
                %---------------------------------------------
                smd_Lc_used=deblank(Profile_Filter(myspace+1:myspace2-1));
                
                if isempty(str2num(smd_Lc_used))==1
                    smd_Lc_used='';
                    waitfor(msgbox('The smd file had the field PROFILE_FILTER but Lc could not be read','Error'));
                end
                %---------------------------------------------
            end
        end
    end
    name_file=handles.route;
    
    if strfind(upper(File_identifier),'WAVINESS')~=0
        smd_filter_type='Waviness';
        
    elseif strfind(upper(name_file),'WAVINESS')~=0
        smd_filter_type='Waviness';
        
    elseif strfind(upper(File_identifier),'ROUGHNESS')~=0
        smd_filter_type='Roughness';
        
    elseif strfind(upper(name_file),'ROUGHNESS')~=0
        smd_filter_type='Roughness';
        
    else
        smd_filter_type='';
    end
    
    
    % Asks the user for the filter type if there is Lc but profile type
    % waviness or roughness is not found
    if isempty(smd_filter_type)==1 && isempty(smd_Lc_used)==0
        fff=0;
        while fff==0
            if strcmpi(smd_filter_type,'Waviness')==0 &&...
                    strcmpi(smd_filter_type,'Roughness')==0
                smd_filter_type=inputdlg(sprintf(['A Lc cutoff'...
                    ' was detected, but no information was found'...
                    ' about the filtered profile type.\n\nIf it'...
                    ' is a Waviness profile write Waviness.\n\n'...
                    'If it is a Roughness profile write Roughness.'...
                    '\n\nIf you do not know the type of profile'...
                    ' close this dialog\n.']),'Input needed');
                if isempty(smd_filter_type)==1
                    fff=1;
                end
                if strcmpi(smd_filter_type,'Waviness')==1
                    smd_filter_type='Waviness';
                    fff=1;
                elseif strcmpi(smd_filter_type,'Roughness')==1
                    smd_filter_type='Roughness';
                    fff=1;
                end
            end
        end
    end
end

% Data obtained
% smd_filter_used, smd_Lc_used, smd_filter_type

% Displays the additional comment above the .smd route
if isempty(smd_filter_used)==0 && isempty(smd_Lc_used)==0 &&...
        isempty(smd_filter_type)==0
    message=[smd_filter_type ' profile generated using a '...
        smd_filter_used ' filter with Lc = ' smd_Lc_used ' mm'];
    set(handles.filtering_info_smd,'string',message,'visible','on')
else
    set(handles.filtering_info_smd,'visible','off')
end

% Activates or not the double parameter calculation posibilities
if isempty(smd_Lc_used)==0 
    message=['All Sampling Lengths (' smd_Lc_used ' mm)'];
    set(handles.parameters_sampling_length,'string',message,'enable','on')
else
    message=['All Sampling Lengths (Lc not found)'];
    set(handles.parameters_sampling_length,'string',message,'enable','off')
end
set(handles.parameters_sampling_length,'value',0)
set(handles.parameters_evaluation_length,'value',1)

% Name of the Amplitude and Spacing parameters: P, R or W. Shape are
% changed when they are calculated

if strcmpi(smd_filter_type,'Waviness')==1
    set(handles.A1,'string','Wa')
    set(handles.A2,'string','Wq')
    set(handles.A3,'string','Wv')
    set(handles.A4,'string','Wt')
    set(handles.A5,'string','Wp')
    set(handles.S1,'string','WSm')
elseif strcmpi(smd_filter_type,'Roughness')==1
    set(handles.A1,'string','Ra')
    set(handles.A2,'string','Rq')
    set(handles.A3,'string','Rv')
    set(handles.A4,'string','Rt')
    set(handles.A5,'string','Rp')
    set(handles.S1,'string','RSm')
else
    set(handles.A1,'string','Pa')
    set(handles.A2,'string','Pq')
    set(handles.A3,'string','Pv')
    set(handles.A4,'string','Pt')
    set(handles.A5,'string','Pp')
    set(handles.S1,'string','PSm')
end

%#########################################################################
%######################## FILE INFORMATION: DATA #########################
%#########################################################################


for i=5:300
    if isempty(str2num(data_loaded{1,1}{i,1}))==0 && ...
            isempty(str2num(data_loaded{1,1}{i+1,1}))==0 && ...
            isempty(str2num(data_loaded{1,1}{i+2,1}))==0 && ...
            isempty(str2num(data_loaded{1,1}{i+3,1}))==0
        data_start=i;
        break
    end
end

for j=1:300
    if isempty(str2num(data_loaded{1,1}{end-j,1}))==0 && ...
            isempty(str2num(data_loaded{1,1}{end-j-1,1}))==0 && ...
            isempty(str2num(data_loaded{1,1}{end-j-2,1}))==0 && ...
            isempty(str2num(data_loaded{1,1}{end-j-3,1}))==0
        data_end=size(data_loaded{1,1},1)-j;
        break
    end
end

if (data_end-data_start+1)>Number_of_points
    
    message=sprintf(['An error occurred while loading the profile data: ' ...
    'There are more points than there should be. \n\nIf you continue, '...
    'errors are very likely to happen.\n\nDo you want to continue?\n\n']);
    continue_yes_no = questdlg(message,'Error','Yes','No','No');

    if strcmpi(continue_yes_no,'No')==1
        return
    end
    
elseif (data_end-data_start+1)<Number_of_points
    
    message=sprintf(['An error occurred while loading the profile data: ' ...
    'Some points might have been lost. \n\nIf you continue, '...
    'errors are very likely to happen.\n\nDo you want to continue?\n\n']);
    continue_yes_no = questdlg(message,'Error','Yes','No','No');

    if strcmpi(continue_yes_no,'No')==1
        return
    end
    
end

for i=1:Number_of_points
    z(i)=str2num(data_loaded{1,1}{data_start-1+i,1});
end
z=z';

%#########################################################################
%############################## DATA FORMAT ##############################
%#########################################################################

% Z axis type is RELATIVE or INCREMENTAL
if strcmpi(Z_Axis_type,'I')==1 || strcmpi(Z_Axis_type,'R')==1
    z2(1)=z(1);
    for i=2:number_of_points
        z2(i)=z(i)+z2(i-1);
    end
    z=z2;
end

% X axis units
if strcmpi(X_Units,'um')==1
    dx=Incremental_value;
    dx=dx/1000; %dx in mm
elseif strcmpi(X_Units,'mm')==1
    dx=Incremental_value;
end

% Z axis units
if strcmpi(Z_Units,'mm')==1
    %z in um
    z=z*1000;
end

% X axis scale
dx=dx*X_Scale_factor;
evaluation_length=(number_of_points-1)*dx;
x=(0:dx:evaluation_length)';
x=x*X_Scale_factor;

% Z axis scale
z=z*Z_Scale_factor;

set(handles.di_file_identifier,'string',File_identifier);
set(handles.di_the_revision_number,'string',The_revision_number);
set(handles.di_number_of_points,'string',num2str(number_of_points));
set(handles.di_created_by,'string',Created_by);
set(handles.di_date,'string',Date);
set(handles.data_information_panel,'visible','on');

handles.mystuff.x=x;
handles.mystuff.z=z;
handles.mystuff.dx=dx;
handles.mystuff.number_of_points=number_of_points;
handles.mystuff.evaluation_length=evaluation_length;
handles.mystuff.File_identifier=File_identifier;
handles.mystuff.Feature_type=Feature_type;
handles.mystuff.Feature_number=Feature_number;
handles.mystuff.Feature_name=Feature_name;
handles.mystuff.X_Axis_type=X_Axis_type;
handles.mystuff.Z_Axis_type=Z_Axis_type;
handles.mystuff.X_Units=X_Units;
handles.mystuff.Z_Units=Z_Units;
handles.mystuff.X_Scale_factor=X_Scale_factor;
handles.mystuff.Z_Scale_factor=Z_Scale_factor;
handles.mystuff.X_Axis_data_type=X_Axis_data_type;
handles.mystuff.Z_Axis_data_type=Z_Axis_data_type;
handles.mystuff.smd_Lc_used=smd_Lc_used;
guidata(gcbo, handles);

set(handles.calculate_over,'visible','on')
set(handles.calculate_over_buttons,'visible','on')

% Plots the profile
cla(handles.axes1); axes(handles.axes1)
h_line=zeros(number_of_points,1);
plot(x,h_line,'k'); hold on;
plot(x,z,'b'); hold off
max_yaxis=1.1*max(z); min_yaxis=min(z)*1.1;
ylim([min_yaxis max_yaxis]);
xlim([0 evaluation_length]); grid on;
xlabel('Evaluation length (mm)'); ylabel('Amplitude (\mum)'); 
title('Roughness trace'); xlim([0 evaluation_length])
set(handles.axes1,'Xscale','linear')
set(handles.axes1,'Yscale','linear')

%--------------------------------------------------------------------------
%------------------------- DATA READ FINISH -------------------------------
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%------------------------- PARAMETERS DEFINITION BEGINS -------------------
%--------------------------------------------------------------------------
%----- 1.- AMPLITUDE --------- 2.- SPACING ---------- 3.- SHAPE------------
%--------------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% AMPLITUDE PARAMETERS %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=z;
Ra=sum(abs(r))/number_of_points; Rq=sqrt(sum(r.*r)/number_of_points);
Rp=max(r); Rv=abs(min(r)); Rt=Rp+abs(Rv);

Ra_display=[' = ',num2str(Ra)];
Rq_display=[' = ',num2str(Rq)];
Rp_display=[' = ',num2str(Rp)];
Rv_display=[' = ',num2str(Rv)];
Rt_display=[' = ',num2str(Rt)]; handles.mystuff.rt=Rt;


% If aux=on means that the pre text is still visible, so this is the first
% profile to be loaded and IT IS NECESSARY TO GENERATE THE GREEK LETTERS
% (see explanation below). If pre text is not visible the greek letters
% have already been generated and there the if block is skipped
aux=get(handles.pre_text_amplitude_parameters,'visible');

if strcmpi(aux,'on')==1
    
    % Due to a limitation in MATLAB GUI, introducing axes is the only
    % way to diaplay greek letters in the GUI window
    mu1=axes('units','pixels','position',[895 499 0.1 0.1],'visible','off'); % mu Ra
    text(0,0,'(\mum)')
    mu2=axes('units','pixels','position',[1030 499 0.1 0.1],'visible','off'); % mu Rq
    text(0,0,'(\mum)')
    mu3=axes('units','pixels','position',[895 463 0.1 0.1],'visible','off'); % mu Rp
    text(0,0,'(\mum)')
    mu4=axes('units','pixels','position',[1030 463 0.1 0.1],'visible','off'); % mu Rv
    text(0,0,'(\mum)')
    mu5=axes('units','pixels','position',[895 427 0.1 0.1],'visible','off'); % mu Rt
    text(0,0,'(\mum)')
    
    handles.greekletters.mu1=mu1;handles.greekletters.mu2=mu2;handles.greekletters.mu3=mu3;
    handles.greekletters.mu4=mu4;handles.greekletters.mu5=mu5;
    guidata(gcbo, handles);
end

% sets the visibility of the 1st pre text off
set(handles.pre_text_amplitude_parameters,'visible','off')

set(handles.parameter_ra,'string',Ra_display,'visible','on')
set(handles.parameter_rq,'string',Rq_display,'visible','on')
set(handles.parameter_rp,'string',Rp_display,'visible','on')
set(handles.parameter_rv,'string',Rv_display,'visible','on')
set(handles.parameter_rt,'string',Rt_display,'visible','on')
set(handles.A1,'visible','on')
set(handles.A2,'visible','on')
set(handles.A3,'visible','on')
set(handles.A4,'visible','on')
set(handles.A5,'visible','on')
set(handles.S1,'visible','on')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% SPACING PARAMETERS %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=z;
hd=str2double(get(handles.input_rsm_height_discrimination,'string'));
sd=str2double(get(handles.input_rsm_spacing_discrimination,'string'));
HeightThreshold=hd*Rt/100;
SpacingThreshold=sd*evaluation_length/100;

% Finds all zeros in the profile and stores them in the vector B
cont= 1;

for j = 1:number_of_points - 1
    if (r(j) * r(j + 1)) < 0 || ((r(j) * r(j + 1)) == 0 && (r(j) * r(j - 1)) ~= 0)
        B(cont,1) = j;
        cont = cont + 1;
    end
end

filter=exist('B');

if filter==1
    
    hh1=msgbox('Computing RSm...');
    
    number_of_zeros=size(B,1);
    
    
    % Prepares some support data for the first iteration of the loops
    end_zero = B(1,1);
    current_zero=B(1,1);
    valid_zeros(1) = B(1,1);
    cont = 2;
    
    for p=1:number_of_zeros-1 % This loop represents the current zeros
        
        for k = 2:number_of_zeros-1 % This loop represents, for each current
            % zeor, the search of the next zero that
            % meets all the criteria
            
            % Position of the next zero in the profile x and r vectors
            end_zero = B(k,1);
            
            % First condition: Meeting the Spacing Threshold
            if x(end_zero) - x(current_zero) < SpacingThreshold
                continue
            end
            
            
            % Fourth condition: Between the next zero and the one inmediately
            % following that, there must be a peak that crosses the Upper
            % Threshold
            
            m0=max(r(B(k,1):B(k+1)));
            if m0<HeightThreshold
                continue
            end
            
            % Second condition: Meeting the Upper Height Threshold
            m1=max(r(current_zero+1:B(k,1)));
            if m1<HeightThreshold
                continue
            end
            
            % Third condition: Meeting the Lower Height Threshold
            m2=min(r(current_zero+1:B(k,1)));
            if m2>-HeightThreshold
                continue
            else % All the conditions are met. This zero points is valid and its
                % position is stored in the vector valid_zeros, which contains
                % the positions in the x and r vectors of all the VALID zeros
                valid_zeros(cont,1) = B(k);
                cont = cont + 1;
                
                % The new valid zero is set as the reference to start looking
                % for the next zero
                current_zero=end_zero;
                break
            end
            
        end
    end
    close(hh1)
    % For the RSm parameter purposes, the sumatory of Smi is the last x points
    % minus the first one. Note that this is different from the samplig lenght
    % because there might be some points at the beginning and that the end that
    % are left out because there are no valid zeros in those areas
    sumatory_smi=x(valid_zeros(end))-x(valid_zeros(1));
    
    % Definition of the Rsm parameter
    RSm = sumatory_smi*1000 / (size(valid_zeros,1)-1);
    
else
    
    RSm = 'NaN';
    
end

% If aux=on means that the pre text is still visible, so this is the first
% profile to be loaded and IT IS NECESSARY TO GENERATE THE GREEK LETTERS
% (see explanation below). If pre text is not visible the greek letters
% have already been generated and there the if block is skipped
aux=get(handles.pre_text_spacing_parameters,'visible');

if strcmpi(aux,'on')==1
    % Creates invisible axes to generate the greek letter of micrometres
    mu6=axes('units','pixels','position',[905 347 0.1 0.1],'visible','off'); % mu RSm
    text(0,0,'(\mum)')

    handles.greekletters.mu6=mu6;
    guidata(gcbo, handles);
end

% sets the visibility of the 2nd pre text off
set(handles.pre_text_spacing_parameters,'visible','off') 

RS_display=[' = ',num2str(RSm)];
set(handles.parameter_rsm,'string',RS_display,'visible','on')
set(handles.calculate_RSm_update,'visible','on')
set(handles.input_rsm_height_discrimination,'visible','on')
set(handles.hd1,'visible','on')
set(handles.hd2,'visible','on')
set(handles.input_rsm_spacing_discrimination,'visible','on')
set(handles.sd1,'visible','on')
set(handles.sd2,'visible','on')
set(handles.sd3,'visible','on')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% SHAPE PARAMETERS %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Rsk = (1/Rq^3)*sum(z.^3)/number_of_points; % compute Rsk
Rku = (1/Rq^4)*sum(z.^4)/number_of_points; % compute Rsk

% sets the visibility of the 3rd pre text off
set(handles.pre_text_shape_parameters,'visible','off')

if strcmpi(smd_filter_type,'Waviness')==1
    Rsk_display=['Wsk = ',num2str(Rsk)];
    Rku_display=['Wku = ',num2str(Rku)];
elseif strcmpi(smd_filter_type,'Roughness')==1
    Rsk_display=['Rsk = ',num2str(Rsk)];
    Rku_display=['Rku = ',num2str(Rku)];
else
    Rsk_display=['Psk = ',num2str(Rsk)];
    Rku_display=['Pku = ',num2str(Rku)];
end

handles.mystuff.smd_filter_type=smd_filter_type;

set(handles.parameter_rsk,'string',Rsk_display,'visible','on')
set(handles.parameter_rku,'string',Rku_display,'visible','on')

guidata(gcbo, handles);



% --- Executes on button press in calculate_RSm_update.
function calculate_RSm_update_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_RSm_update (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rsm_switch=get(handles.parameters_evaluation_length,'value');
clear B

switch rsm_switch
    
    case 1
        
        number_of_points=handles.mystuff.number_of_points;
        z=handles.mystuff.z;
        x=handles.mystuff.x;
        evaluation_length=handles.mystuff.evaluation_length;
        smd_filter_type=handles.mystuff.smd_filter_type;
        
        r=z;
        Rp=max(r); Rv=abs(min(r)); Rt=Rp+abs(Rv);
        hd=str2double(get(handles.input_rsm_height_discrimination,'string'));
        sd=str2double(get(handles.input_rsm_spacing_discrimination,'string'));
        HeightThreshold=hd*Rt/100;
        SpacingThreshold=sd*evaluation_length/100;
        
        % To see this function commented go to the original Calculate
        % Rsm function
        cont= 1;
        for j = 1:number_of_points - 1
            if (r(j) * r(j + 1)) < 0 || ((r(j) * r(j + 1)) == 0 && (r(j) * r(j - 1)) ~= 0)
                B(cont,1) = j;
                cont = cont + 1;
            end
        end
        
        filter=exist('B');
        
        if filter==1
            hh1=msgbox('Computing RSm...');
            number_of_zeros=size(B,1);
            end_zero = B(1,1);
            current_zero=B(1,1);
            valid_zeros(1) = B(1,1);
            cont = 2;
            for p=1:number_of_zeros-1 % This loop represents the current zeros
                for k = 2:number_of_zeros-1
                    end_zero = B(k,1);
                    if x(end_zero) - x(current_zero) < SpacingThreshold
                        continue
                    end
                    m0=max(r(B(k,1):B(k+1)));
                    if m0<HeightThreshold
                        continue
                    end
                    m1=max(r(current_zero+1:B(k,1)));
                    if m1<HeightThreshold
                        continue
                    end
                    m2=min(r(current_zero+1:B(k,1)));
                    if m2>-HeightThreshold
                        continue
                    else
                        valid_zeros(cont,1) = B(k);
                        cont = cont + 1;
                        current_zero=end_zero;
                        break
                    end
                end
            end
            close(hh1)
            sumatory_smi=x(valid_zeros(end))-x(valid_zeros(1));
            
            % Definition of the Rsm parameter
            RSm = sumatory_smi*1000 / (size(valid_zeros,1)-1);
        else
            RSm='NaN';
        end
        
        RS_display=[' = ',num2str(RSm)];
        set(handles.parameter_rsm,'string',RS_display)
        
    case 0
        
        number_of_points=handles.mystuff.number_of_points;
        z=handles.mystuff.z;
        x=handles.mystuff.x;
        dx=handles.mystuff.dx;
        evaluation_length=handles.mystuff.evaluation_length;
        smd_Lc_used=handles.mystuff.smd_Lc_used;
        Lc=str2num(smd_Lc_used);
        smd_filter_type=handles.mystuff.smd_filter_type;
        
        
        % Definition of the sampling lengths
        % -----------------------------------------------------------------
        points_in_sampling_length=round(1000*(round(Lc/dx)+1))/1000;
        
        point_start_sampling_length(1)=1;
        point_finish_sampling_length(1)=points_in_sampling_length;
        
        number_of_full_sampling_lengths=1;
        for i=2:ceil(number_of_points/points_in_sampling_length)
            
            point_start_sampling_length(i)=point_finish_sampling_length(i-1);
            
            point_finish_sampling_length(i)=point_start_sampling_length(i)+...
                points_in_sampling_length-1;
            
            number_of_full_sampling_lengths=number_of_full_sampling_lengths+1;
            if point_finish_sampling_length(i)+points_in_sampling_length-1>...
                    number_of_points
                break
            end
        end
        % -----------------------------------------------------------------
        
        for i=1:number_of_full_sampling_lengths
            z_sl=z(point_start_sampling_length(i):point_finish_sampling_length(i));
            
            r=z_sl;
            
            Rp_sl(i)=max(r);
            Rv_sl(i)=abs(min(r));
            Rt_sl(i)=Rp_sl(i)+abs(Rv_sl(i));
        end
        
        Rt=sum(Rt_sl)/number_of_full_sampling_lengths;

        hh1=msgbox('Computing RSm...');
        for i=1:number_of_full_sampling_lengths
            z_sl=z(point_start_sampling_length(i):point_finish_sampling_length(i));
            
            r=z_sl;
            
            hd=str2double(get(handles.input_rsm_height_discrimination,'string'));
            sd=str2double(get(handles.input_rsm_spacing_discrimination,'string'));
            HeightThreshold=hd*Rt/100;
            SpacingThreshold=sd*Lc/100;
            
            % To see this function commented go to the original Calculate
            % Rsm function
            cont= 1;
            B=0;
            for j = 1:points_in_sampling_length - 1
                if (r(j) * r(j + 1)) < 0 || ((r(j) * r(j + 1)) == 0 && (r(j) * r(j - 1)) ~= 0)
                    B(cont,1) = j;
                    cont = cont + 1;
                end
            end
            if B==0
                continue
            end
            number_of_zeros=size(B,1);
            end_zero = B(1,1);
            current_zero=B(1,1);
            valid_zeros(1) = B(1,1);
            cont = 2;
            for p=1:number_of_zeros-1 % This loop represents the current zeros
                for k = 2:number_of_zeros-1
                    end_zero = B(k,1);
                    if x(end_zero) - x(current_zero) < SpacingThreshold
                        continue
                    end
                    m0=max(r(B(k,1):B(k+1)));
                    if m0<HeightThreshold
                        continue
                    end
                    m1=max(r(current_zero+1:B(k,1)));
                    if m1<HeightThreshold
                        continue
                    end
                    m2=min(r(current_zero+1:B(k,1)));
                    if m2>-HeightThreshold
                        continue
                    else
                        valid_zeros(cont,1) = B(k);
                        cont = cont + 1;
                        current_zero=end_zero;
                        break
                    end
                end
            end
            sumatory_smi=x(valid_zeros(end))-x(valid_zeros(1));
            RSm_sl(i) = sumatory_smi*1000 / (size(valid_zeros,1)-1);
        end
        close(hh1)
        RSm=sum(RSm_sl)/number_of_full_sampling_lengths;
        RS_display=[' = ',num2str(RSm)];
        
        set(handles.parameter_rsm,'string',RS_display)
end


% --- Executes on button press in calculate_analyze_frequencies.
function calculate_analyze_frequencies_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_analyze_frequencies (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

z=handles.mystuff.z;
dx=handles.mystuff.dx;
number_of_points=handles.mystuff.number_of_points;
evaluation_length=handles.mystuff.evaluation_length;

% Fast Fourier Transform of the profile z
zf=fft(z); 

% Generate the wavelength array
j=(2:1:floor(number_of_points/2)+1)'; 
lambda=number_of_points*dx./(j-1); 
yaxis=abs(zf(2:floor(number_of_points/2)+1,1));

% Plot half of the % FFT array
cla(handles.axes1); axes(handles.axes1)
plot(lambda,yaxis);
xlabel('Wavelength (mm)'); ylabel('Scaled amplitude (\mum)');
title ('Discrete Fourier Transform of the profile');
max_yaxis=1.1*max(yaxis); min_yaxis=min(yaxis)*1.1;
ylim([min_yaxis max_yaxis]);
xlim([0 evaluation_length]); grid on;
set(handles.axes1,'Xscale','linear')
set(handles.axes1,'Yscale','linear')

handles.mystuff.lambda=lambda;
handles.mystuff.yaxis=yaxis;
guidata(gcbo, handles);


% --- Executes on button press in calculate_view_filter.
function calculate_view_filter_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_view_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

dx=handles.mystuff.dx;
number_of_points=handles.mystuff.number_of_points;
evaluation_length=handles.mystuff.evaluation_length; 
if ~isfield(handles.mystuff, 'lambda') || ~isfield(handles.mystuff, 'yaxis')
    waitfor(msgbox('Please analyze the frequencies before defining a filter','Error'))
    return
end

lambda=handles.mystuff.lambda;
yaxis=handles.mystuff.yaxis;

lambdac=get(handles.input_wavelength_filter,'String');

if isempty(lambdac)
    waitfor(msgbox('Please define a Wavelength Cutoff','Error'))
    return
end

lambdac=str2double(lambdac);

% Find indices of elements that represent wavelength >= cutoff(mm)
pass_filter= lambda >= lambdac; 


switch_waviness=get(handles.radiobutton_waviness_filter_freq,'Value');

% If Waviness (or High Pass filter) is selected, then pass_filter is formed
% by all the wavelengths higher than lambdac. If visualsr2d (or Low Pass
% filter) is selected, then pass_filter is formed by all the wavelengths
% smaller than lambdac

if switch_waviness==1 
    pass_filter= lambda >= lambdac;
else
    pass_filter= lambda <= lambdac;
end

Sf=zeros(size(lambda,1),1);

% Filter: 1 for those elements that meet the pass_filter condition and 0
% for the ones that don't
Sf(pass_filter)=1;

if mod(number_of_points,2) == 0 % mod(x,y) is x - n.*y where n = floor(x./y)
    Sf=[0; Sf; flipud(Sf(1:size(Sf,1)-1))];
else
    Sf=[0; Sf; flipud(Sf)];
end

cla(handles.axes1); axes(handles.axes1)
yaxis_filter=100*abs(Sf(2:floor(number_of_points/2)+1,1));
[hAx,hLine1,hLine2]=plotyy(lambda,yaxis,lambda,yaxis_filter);

% Profile in the freq. domain
ylabel(hAx(1),'Scaled amplitude (\mum)')
max_yaxis=1.1*max(yaxis);
min_yaxis=min(yaxis)*1.1;
ylim(hAx(1),[min_yaxis max_yaxis]);

% Filter amplitude
ylabel(hAx(2),'Amplitude (%)')
max_yaxis_filter=1.1*max(yaxis_filter);
min_yaxis_filter=min(yaxis_filter)*1.1;
ylim(hAx(2),[min_yaxis_filter max_yaxis_filter]);
set(hLine2,'LineWidth',2);

% Common x axis
xlabel('Wavelength (mm)');
title ('Filter in the Freq. Domain');
xlim(hAx(1),[0 evaluation_length]); grid on;
xlim(hAx(2),[0 evaluation_length]); grid on;

set(handles.axes1,'Xscale','linear')
set(handles.axes1,'Yscale','linear')


% --- Executes on button press in calculate_filter_freq_domain.
function calculate_filter_freq_domain_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_filter_freq_domain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

z=handles.mystuff.z;
dx=handles.mystuff.dx;
x=handles.mystuff.x;
number_of_points=handles.mystuff.number_of_points;
evaluation_length=handles.mystuff.evaluation_length;

lambdac=get(handles.input_wavelength_filter,'String');
lambdac=str2double(lambdac);

% Generate the wavelength array
j=(2:1:floor(number_of_points/2)+1)'; 
lambda=number_of_points*dx./(j-1); 

% Find indices of elements that represent wavelength >= lambdac(mm). 
% ****Note that in this case is fixed and does not depend on the user
% selection Waviness of visualsr2d because that differentiation is made
% later

pass_filter= lambda >= lambdac; 
Sf=zeros(size(lambda,1),1);

% Filter: 1 for those elements with wavelength > cutoff, 0 for the rest
Sf(pass_filter)=1; 

% mod(x,y) is x - n.*y where n = floor(x./y). It basically detects if there
% is an odd or an even number of points

if mod(number_of_points,2) == 0 
    Sf=[0; Sf; flipud(Sf(1:size(Sf,1)-1))];
else
    Sf=[0; Sf; flipud(Sf)];
end

% Fast Fourier Transform of the profile z
zf=fft(z); 

% Term by term multiplication
temp=zf.*Sf; 

% Extract the real part of ifft
w=real(ifft(temp)); 

switch_waviness=get(handles.radiobutton_waviness_filter_freq,'Value');

cla(handles.axes1); axes(handles.axes1)
 plot(x,z,'Color','g','LineWidth',1);hold on

if switch_waviness==1
    plot(x,w,'Color','b','LineWidth',2.2); hold off
    title ('Profile Waviness filtered in the Frequency Domain');
else
    w2=z-w;
    plot(x,w2,'Color','b','LineWidth',2.2); hold off
    title ('Profile Roughness filtered in the Frequency Domain');
end

xlabel('Distance (mm)'); ylabel('Amplitude (\mum)');
xlim([0 evaluation_length]); grid on; 
max_yaxis=1.1*max(z); min_yaxis=min(z)*1.1;
ylim([min_yaxis max_yaxis]);
set(handles.axes1,'Xscale','linear')
set(handles.axes1,'Yscale','linear')

% -------------- Link with the export module --------------------

handles.mystuff.lambdac=lambdac;
handles.mystuff.filter_used='FFT';
if switch_waviness==1
    handles.mystuff.filter_type='Waviness';
    handles.mystuff.z_export=w;
else
    handles.mystuff.filter_type='Roughness';
    handles.mystuff.z_export=w2;
end
set(handles.export_filtered_data,'visible','on')
guidata(hObject, handles);


% --- Executes on button press in calculate_gaussian_filter.
function calculate_gaussian_filter_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_gaussian_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

z=handles.mystuff.z;
dx=handles.mystuff.dx;
x=handles.mystuff.x;
number_of_points=handles.mystuff.number_of_points;
evaluation_length=handles.mystuff.evaluation_length;

% Gets the user input lambdac
lambdac=get(handles.input_gaussian_filter_cutoff,'String');

% Prevents errors
if isempty(lambdac)==1
    msgbox('Please specify the Long Cutoff','Error')
    return
end

lambdac=str2double(lambdac);

% Saves a copy of the original lambdac for the graph
lambdac_graph=lambdac;

% If the first window is selected, the appropriate lambdac is calculated
if get(handles.radiobutton_gaussian_half_lambdac,'value')==1
    lambdac=lambdac/2;
end

alpha=0.4697;
y=(-lambdac:dx:lambdac)';

% Generates the Gaussian Filter using its Mathematical definition
S=(1/(alpha*lambdac)).*exp(-pi*(y/(alpha*lambdac)).^2);

% Normalizes to unitary sum
S=S/sum(S); 

% m is the length of the Gaussian Filter
m=size(S,1);

% ###############################################################
% ## mod DEFITION:= mod(x,y) is x - n.*y where n = floor(x./y) ##
% ###############################################################

if mod(number_of_points,2) == 0 %if it is 0 then NUMBER OF POINTS IS ODD!
    S=[zeros(floor(number_of_points/2)-floor(m/2),1); S; zeros(floor(number_of_points/...
        2)-floor(m/2)-1,1)];
else %if mod(number_of_points,2) = 1 then NUMBER OF POINTS IS EVEN!
    S=[zeros(floor(number_of_points/2)-floor(m/2),1); S; zeros(floor(number_of_points/...
        2)-floor(m/2),1)];
end

% if mod(number_of_points,2) == 0 %if it is 0 then NUMBER OF POINTS IS ODD!
%     S=[zeros(number_of_points/2-floor(m/2),1); S; zeros(number_of_points/...
%         2-floor(m/2)-1,1)];
% else %if mod(number_of_points,2) = 1 then NUMBER OF POINTS IS EVEN!
%     S=[zeros(number_of_points/2-floor(m/2),1); S; zeros(number_of_points/...
%         2-floor(m/2),1)];
% end

method=get(handles.popupmenu_gaussian,'value');

switch method
    
    case 1 % FFT
        
        % Performs FFT of the generated Gaussian Filter S
        Sf=fft(S);
        
        % Defining a new z2 so that it matches NIST SOLUTION!
        % It makes zeros those components z<lambdac AND
        % z>(evaluation_length-lambdac)
        
        aux= zeros(round(lambdac/dx),1);
        z2=[aux; z(round(lambdac/dx+1):end-round(lambdac/dx)); aux];
        x2=[aux; x(round(lambdac/dx+1):end-round(lambdac/dx)); aux];
        zf=fft(z2); % Fast Fourier Transform of the profile z
        
        while size(zf,1)>size(Sf,1)
            zf=zf(1:end-1);
        end
        
        while size(Sf,1)>size(zf,1)
            Sf=Sf(1:end-1);
        end
        
        temp=zf.*Sf; % term by term multiplication
        w=real(ifft(temp)); % extract the real part of ifft
        w2=[ w(floor(size(w,1)/2)+1:end); w(1:floor(size(w,1)/2))]; %
        
        % w returns the filtered profile ACCORDING TO RAJA
        % w2 returns the filteres profile that matches the NIST SOLUTION
        % There's a need of reordering data
        % Therefore w2 is taken as the solution
        
        % Prepares the final solution, w3, to be exported
        % It also narrows the original x and z vectors so that all fit
        
        w3=w2(round(lambdac/dx+1):end-round(lambdac/dx));
        
    case 2 % Convolution
        
        C=conv(S,z);
        C=C(number_of_points/2:3/2*number_of_points-1);
        
        % Prepares the final solution, C3, to be exported
        % w3=C3 so that the final result has the same name as in FFT       
        
        C3=C(round(lambdac/dx+1):end-round(lambdac/dx));    
        w3=C3;
       
end

% Narrows the original x axis so that the filtered profile has an x_axis to
% be represented with
x3=x(round(lambdac/dx+1):end-round(lambdac/dx));

% Narrows the original z axis so that VisualSR2D can be obtained by
% subtracting the waviness to the total profile
z3=z(round(lambdac/dx)+1:end-round(lambdac/dx));

% General graph properties
cla(handles.axes1); axes(handles.axes1)
plot(x,z,'Color','g','LineWidth',1);hold on
xlabel('Distance (mm)'); ylabel('Amplitude (\mum)');
title (['Gaussian Filter with \lambdac = ' num2str(lambdac_graph) ' mm']);
xlim([0 evaluation_length]); grid on;
max_yaxis=1.1*max(z); min_yaxis=min(z)*1.1;
ylim([min_yaxis max_yaxis])

% Returns axis scale to linear in case they were not
set(handles.axes1,'Xscale','linear')
set(handles.axes1,'Yscale','linear')

% User selection of what is represented: Waviness or visualsr2d
switch_waviness=get(handles.radiobutton_waviness_gaussian,'Value');

if switch_waviness==1 % Represents waviness
    
    while size(x3,1)>size(w3,1)
        x3=x3(1:end-1);
    end
    
    while size(w3,1)>size(x3,1)
        w3=w3(1:end-1);
    end
    
    plot(x3,w3,'Color','b','LineWidth',2.2); hold off
    
else % Roughness is obtained as Total Profile - Waviness
    
    while size(z3,1)>size(w3,1)
        z3=z3(1:end-1);
    end
    
    while size(w3,1)>size(z3,1)
        w3=w3(1:end-1);
    end
        
    w4=z3-w3;
    
    while size(x3,1)>size(w4,1)
        x3=x3(1:end-1);
    end
    
    while size(w4,1)>size(x3,1)
        w4=w4(1:end-1);
    end
        
    plot(x3,w4,'Color','b','LineWidth',2.2); hold off
end

% -------------- Link with the export module --------------------
handles.mystuff.lambdac=lambdac;
handles.mystuff.filter_used='Gaussian';
if switch_waviness==1 
    handles.mystuff.filter_type='Waviness';
    handles.mystuff.z_export=w3;
else
    handles.mystuff.filter_type='Roughness';
    handles.mystuff.z_export=w4;
end
set(handles.export_filtered_data,'visible','on')
guidata(hObject, handles);


% --- Executes on button press in calculate_rc_filter.
function calculate_rc_filter_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_rc_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

z=handles.mystuff.z;
dx=handles.mystuff.dx;
x=handles.mystuff.x;
number_of_points=handles.mystuff.number_of_points;
evaluation_length=handles.mystuff.evaluation_length;

lambdac=get(handles.input_rc_filter_cutoff,'String');

% Prevents errors
if isempty(lambdac)==1
    msgbox('Please specify the Long Cutoff','Error')
    return
end

lambdac=str2double(lambdac);   

%############################### NOTE #####################################
%#######THIS FILTER SUFFERS A PHASE OFFSET THAT GROWS WITH LAMBDAC#########
%##########################################################################

%%%%%%%%%%%%%%%%%%%%% Definition of the 2RC filter %%%%%%%%%%%%%%%%%%%%%%%
A = 2*pi/sqrt(3);
y = (-2*lambdac:dx:0)';
for j=1:1:length(y) % generate weighting function
S(j,1)=(A/lambdac)*(2-(A/lambdac)*abs(y(j)))*...
exp(-(A/lambdac)*abs(y(j)));
end
S = S/sum(S); % normalize to unit sum
S = flipud(S); % mirror the non-symmetric weighting function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Method is defined by the user
method=get(handles.popmenu_2rc,'value');

switch method
    case 1 % Convolution Method
        C = conv(S, z); % conv performs a second flip before moving average
    case 2 % Recusive Method
        h = waitbar(0,'1 %','Name','Loading...');
        m=length(z); n=length(S);
        
        % Padding of n zeros
        Z=[z',zeros(1,n)];  
        
        % Padding of m zeros
        S2=[S',zeros(1,m)]; 
        
        for i=1:n+m-1
            C(i)=0;
            for j=1:i
                C(i)=C(i)+Z(j)*S2(i-j+1);
            end
            
            % Handles the waitbar
            if rem(i,800)==0
                msg_waitbar1=[num2str(i/(n+m-1)*100)];
                if i*100/(n+m-1)<10
                    msg_waitbar2=[msg_waitbar1(1:1),' %'];
                else
                    msg_waitbar2=[msg_waitbar1(1:2),' %'];
                end
                waitbar(i/(n+m-1),h,msg_waitbar2)
                
            elseif i==(n+m-1)
                msg_waitbar=[num2str(100),' %'];
                waitbar(i/(n+m-1),h,msg_waitbar)
            end
        end
        close(h)
        C=C';
end

% Prepares the parameters x and z to be represented removing the points
% not valid when using this filter
x2=x(2*round(lambdac/dx)+1:end);
z2=z(2*round(lambdac/dx)+1:end);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Extracts as many points as stored in number_of_points. Meanline is the
% waviness profile
MeanLine = C(1:number_of_points);

% Removes the first 2*lambdac/dx points because they are not valid
% when using this filter
MeanLine2 = C(2*round(lambdac/dx)+1:number_of_points);

% Rugosity profile = Profile - Waviness profile
r = z2-MeanLine2;

cla(handles.axes1); axes(handles.axes1)
plot(x,z,'Color','g','LineWidth',1);hold on

% Plots Mean Line or visualsr2d depending on the user input
if get(handles.radiobutton_meanline_2rc,'value')==1
    plot(x2,MeanLine2,'Color','b','LineWidth',2.2); hold off
else
    plot(x2,r,'Color','b','LineWidth',2.2); hold off
end

xlabel('Distance (mm)');
ylabel('Amplitude (\mum)');
title (['2RC Filter with \lambdac = ' num2str(lambdac) ' mm']);
xlim([0 evaluation_length]); grid on; 
max_yaxis=1.1*max(z); min_yaxis=min(z)*1.1;
ylim([min_yaxis max_yaxis]);
set(handles.axes1,'Xscale','linear')
set(handles.axes1,'Yscale','linear')

% -------------- Link with the export module --------------------
handles.mystuff.lambdac=lambdac;
handles.mystuff.filter_used='2RC';
if get(handles.radiobutton_meanline_2rc,'value')==1 
    handles.mystuff.filter_type='Waviness';
    handles.mystuff.z_export=MeanLine2;
else
    handles.mystuff.filter_type='Roughness';
    handles.mystuff.z_export=r;
end

set(handles.export_filtered_data,'visible','on')
guidata(hObject, handles);

% --- Executes on button press in calculate_psd.
function calculate_psd_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_psd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

z=handles.mystuff.z;
dx=handles.mystuff.dx;
x=handles.mystuff.x;
number_of_points=handles.mystuff.number_of_points;
evaluation_length=handles.mystuff.evaluation_length;

% Corrects z depending on the window chosen
if get(handles.window_rectangular,'value')==1
    z=z;
elseif get(handles.window_hann,'value')==1
    w=hann(number_of_points);
    z=w.*z;
elseif get(handles.window_hamming,'value')==1
    w=hamming(number_of_points);
    z=w.*z;
elseif get(handles.window_blackman,'value')==1
    w=blackman(number_of_points);
    z=w.*z;
end


method=get(handles.popupmenu_psd,'value');

% First method is Mixed Radix FFT
if method==1 
    
    % Evaluate DFT of z
    zf = fft(z);
    PSD = dx/number_of_points*(abs(zf).^2);
    j = (2:1:floor(number_of_points/2)+1)';
    
    % Generate frequency array
    freq = (j-1)/(number_of_points*dx);
        
    % Plot PSD as function of  frequency
    cla(handles.axes1); axes(handles.axes1)
    loglog(freq,PSD(2:floor(number_of_points/2)+1,1)); 

    
% Second method is FFT Zero Padding  
elseif method==2 
    
    z=[z; zeros(size(z,1),1)];
    
    % Evaluate DFT of z
    zf = fft(z); 
    PSD = dx/number_of_points*(abs(zf).^2);
    j = (2:1:floor(number_of_points/2)+1)';
    
    % Generate frequency array
    freq = (j-1)/(number_of_points*dx);
        
    % Plot PSD as function of  frequency
    cla(handles.axes1); axes(handles.axes1)
    loglog(freq,PSD(2:floor(number_of_points/2)+1,1));
end

% Changes the scale of the axes depending on what it is chosen in the popup
scale=get(handles.popupmenu_scale,'value');
if scale==1 % log-log
    set(handles.axes1,'Xscale','log')
    set(handles.axes1,'Yscale','log')
elseif scale==2 % log-linear
    set(handles.axes1,'Xscale','log')
    set(handles.axes1,'Yscale','linear')
elseif scale==3 % liner-log
    set(handles.axes1,'Xscale','linear')
    set(handles.axes1,'Yscale','log')
elseif scale==4 % linear-linear
    set(handles.axes1,'Xscale','linear')
    set(handles.axes1,'Yscale','linear')
end

% Common properties for the axes whichever is the method used
title('PSD'); xlabel('Frequency (1/mm)'); ylabel('PSD (\mum^3)');
max_xaxis=max(freq); min_xaxis=min(freq);
xlim([min_xaxis max_xaxis]);
max_yaxis=max(PSD); min_yaxis=min(PSD);
ylim([0 max_yaxis]);

% --- Executes on button press in calculate_correlation.
function calculate_correlation_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_correlation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
z=handles.mystuff.z;
dx=handles.mystuff.dx;
x=handles.mystuff.x;
number_of_points=handles.mystuff.number_of_points;
evaluation_length=handles.mystuff.evaluation_length;

% Computes Rq. It is necessary to normalize ADV and get ACF: ACF=ADV/Rq^2
Rq = sqrt(sum(z.*z)/number_of_points); % determine Rq

% Gets the user inputs: lag length and the display wanted
display_correlation=get(handles.popupmenu_correlation_side,'value');
lag_length=get(handles.input_correlation_lag_length,'string');
lag_length=str2num(lag_length);

if lag_length>evaluation_length
    msgbox('Lag Length cannot be greater than the Evaluation length!',...
        'Error')
    set(handles.input_correlation_lag_length,'string','0')
    return
end

% If input_correlation_lag_length=0 then the software takes automatically the max x value
if lag_length==0
    lag_length=x(end,1);
end

% This process takes a while so a waitbar is set
h = waitbar(0,'1 %','Name','Loading...');

% Starts the double loop required to compute the ADV math. definition
for k = 1:number_of_points
    temp = 0;
    
    for j=1:number_of_points-k % compute the sum of products
        temp = temp + z(j,1)*z(j+k-1,1);
    end
    
    % Depending on the case selected, a different operation is performed
    % Formally the Left Side would have been different from the beginning,
    % but it is easier to calculate the right side always and then mirror
    % it if the Left Side of Left and Right Side are requested by the user
    switch display_correlation
        
        % Right Side
        case 1
            ACV(k,1) = temp/(number_of_points-k);
            
        % Left Side
        case 2
            ACV(k,1) = temp/(number_of_points-k);
            
        % Right and left Side
        case 3
            ACV(k,1) = temp/(number_of_points-k);
            
        % Biased
        case 4 % The only difference in the biased version is the -k
            ACV(k,1) = temp/(number_of_points);
    end
    
    % Handles the waitbar
    if rem(k,800)==0
        msg_waitbar1=[num2str(k/number_of_points*100)];
        if (k/number_of_points*100)<10
            msg_waitbar2=[msg_waitbar1(1:1),' %'];
        else
            msg_waitbar2=[msg_waitbar1(1:2),' %'];
        end
        waitbar(k/number_of_points,h,msg_waitbar2)
    elseif k==number_of_points
        msg_waitbar=[num2str(100),' %'];
        waitbar(k/number_of_points,h,msg_waitbar)
        
    end
end

% Closes the waitbar
close(h)


% ACF is the normalized version of ACV
ACF=ACV/Rq^2;

% Builds up the x_axis and cuts ACF depending on the Lag Length defined
% by the user
switch display_correlation
    case 1
        x_axis=x(1:round(lag_length/dx)+1);
        ACF=ACF(1:size(x_axis,1));
    case 2
        x_axis=-flipud(x(1:round(lag_length/dx)+1));
        ACF=flipud(ACF(1:size(x_axis,1)));
    case 3
        x_axis=x(1:round(lag_length/dx)+1);
        ACF=ACF(1:size(x_axis,1));
        x_axis=[-flipud(x_axis);x_axis];
        ACF=[flipud(ACF);ACF];
    case 4
        x_axis=x(1:round(lag_length/dx)+1);
        ACF=ACF(1:size(x_axis,1));
end

%CorrelationLength = min(find(ACF<=0))*dx; % compute calculate_correlation length

% Axes properties
cla(handles.axes1); axes(handles.axes1)
plot(x_axis,ACF,'color','b');
xlabel('Lag Length (mm)'); ylabel('ACF');
title('Auto-Correlation'); grid on

switch display_correlation
    case 1
        xlim([0 lag_length])
    case 2
        xlim([-lag_length 0])
    case 3
        xlim([-lag_length lag_length])
    case 4
        xlim([0 lag_length])
end

guidata(hObject, handles);

% --- Executes on button press in calculate_number_of_points_in_each_bin.
function calculate_number_of_points_in_each_bin_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_number_of_points_in_each_bin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
z=handles.mystuff.z;
dx=handles.mystuff.dx;
x=handles.mystuff.x;
number_of_points=handles.mystuff.number_of_points;
evaluation_length=handles.mystuff.evaluation_length;

% The vertical range of the profile will be divided into the Number of
% Bins defined by the user
numBins=get(handles.input_number_of_bins,'string');
numBins=str2num(numBins);

% Prevents the execution of the rest of the code if wrong inputs are
% detected
if numBins==0
    msgbox('Please specify the Number of Bins','Error')
    return
elseif isempty(numBins)==1
    msgbox('Please specify the Number of Bins','Error')
    return
elseif numBins<0
    msgbox('Number of Bins has to be a positive integer','Error')
    return
end

% Maximum and minimum values in the original profile, z
a = max(z); b = min(z);

% binWidth is defined as the max amplitude of the profile z normalized
% with the Number of Beans defined by the user
binWidth = (a-b)/numBins;

t = 1;
for k=b:binWidth:a-binWidth
    
    % H is the number of points of the original profile z in each of the
    % bins defined by the user, i.e, how many points have a certain
    % amplitude
    H(t,1) = size(find(z>=k & z<k+binWidth),1);
    
    % binLocation stores the center of each bin
    binLocation(t,1) = k+binWidth/2;
    
    t = t+1;
end

cla(handles.axes1); axes(handles.axes1)
plot(H,binLocation);
xlabel('Number of points (#)');
ylabel('Bin location (\mum)');
title('Amplitude Density Function ADF'); grid on
xlim([0 max(H)*1.02]); 
max_yaxis=max(binLocation); min_yaxis=min(binLocation);
ylim([min_yaxis max_yaxis]);

guidata(hObject, handles);


% --- Executes on button press in calculate_bac.
function calculate_bac_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_bac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
z=handles.mystuff.z;
dx=handles.mystuff.dx;
x=handles.mystuff.x;
number_of_points=handles.mystuff.number_of_points;
evaluation_length=handles.mystuff.evaluation_length;

% The vertical range of the profile will be divided into the Number of
% Bins defined by the user
numBins=get(handles.input_number_of_bins,'string');
numBins=str2num(numBins);

% Prevents the execution of the rest of the code if wrong inputs are
% detected
if numBins==0
    msgbox('Please specify the Number of Bins','Error')
    return
elseif isempty(numBins)==1
    msgbox('Please specify the Number of Bins','Error')
    return
elseif numBins<0
    msgbox('Number of Bins has to be a positive integer','Error')
    return
end

% Maximum and minimum values in the original profile, z
a = max(z); b = min(z);

% binWidth is defined as the max amplitude of the profile z normalized
% with the Number of Beans defined by the user
binWidth = (a-b)/numBins;

t = 1;
for k=b:binWidth:a-binWidth
    
    % H is the number of points of the original profile z in each of the
    % bins defined by the user, i.e, how many points have a certain
    % amplitude
    H(t,1) = size(find(z>=k & z<k+binWidth),1);
    
    % binLocation stores the center of each bin
    binLocation(t,1) = k+binWidth/2;
    
    t = t+1;
end

% BAC is defined as the sum of the values of a bin and all the bins above
% it. Therefore for each k element in H its associated BAC value is the
% sum of that and all the following elements.
% It is normalized to be reported as a percentage of profile evaluation
% length
for k=size(H,1):-1:1
BAC(k,1) = sum(H(k:size(H,1),1))*dx*100/evaluation_length;
end

cla(handles.axes1); axes(handles.axes1)
plot(BAC,binLocation);
xlabel('Bearing length ratio (%)');
ylabel('Bin location (\mum)');
title('Bearing Area Curve'); grid on
xlim([0 100]); 
max_yaxis=max(binLocation); min_yaxis=min(binLocation);
ylim([min_yaxis max_yaxis]);

guidata(hObject, handles);



% --- Executes on button press in calculate_bin_location.
function calculate_bin_location_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_bin_location (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
z=handles.mystuff.z;
dx=handles.mystuff.dx;
x=handles.mystuff.x;
number_of_points=handles.mystuff.number_of_points;
evaluation_length=handles.mystuff.evaluation_length;

% The vertical range of the profile will be divided into the Number of
% Bins defined by the user
numBins=get(handles.input_number_of_bins,'string');
numBins=str2num(numBins);

% Prevents the execution of the rest of the code if wrong inputs are
% detected
if numBins==0
    msgbox('Please specify the Number of Bins','Error')
    return
elseif isempty(numBins)==1
    msgbox('Please specify the Number of Bins','Error')
    return
elseif numBins<0
    msgbox('Number of Bins has to be a positive integer','Error')
    return
end

% Maximum and minimum values in the original profile, z
a = max(z); b = min(z);

% binWidth is defined as the max amplitude of the profile z normalized
% with the Number of Beans defined by the user
binWidth = (a-b)/numBins;

t = 1;
for k=b:binWidth:a-binWidth
    
    % H is the number of points of the original profile z in each of the
    % bins defined by the user, i.e, how many points have a certain
    % amplitude
    H(t,1) = size(find(z>=k & z<k+binWidth),1);
    
    % binLocation stores the center of each bin
    binLocation(t,1) = k+binWidth/2;
    
    t = t+1;
end

% BAC is defined as the sum of the values of a bin and all the bins above
% it. Therefore for each k element in H its associated BAC value is the
% sum of that and all the following elements.
% It is normalized to be reported as a percentage of profile evaluation
% length
for k=size(H,1):-1:1
BAC(k,1) = sum(H(k:size(H,1),1))*dx*100/evaluation_length;
end

% Gets the user input
tp=get(handles.input_tp,'string');
tp=str2num(tp);

if tp<0
    msgbox('Porcentage has to be a positive number','Error')
    return
elseif isempty(tp)==1
    msgbox('Please specify a percentage','Error')
    return 
end

% Find the index of array CH1 so that BAC is just less than tp (%)
u = min(find(BAC <=tp)); 

% Index of BAC where BAC is greater than tp (%)
v=u-1; 

bin_location = (20-BAC(u,1))/(BAC(v,1)-BAC(u,1))*(binLocation(v,1)-...
    binLocation(u,1))+binLocation(u,1);
bin_location_display=[' = ',num2str(bin_location)];
set(handles.output_bin_location,'string',bin_location_display,...
    'visible','on')

% Visibility of the greek letters of the BAC screen ON
mu7=handles.greekletters.mu7; m7=get(mu7,'children'); set(m7,'visible','on')
set(handles.text_bin,'visible','on')


guidata(hObject, handles);


%##########################################################################
%##########################################################################
%########### THE REST OF THE CODE IS NEEDED FOR THE GUI TO WORK ###########
%###########   IT DOES NOT CONTAIN ANY OTHER MATH EXPRESSION    ###########
%##########################################################################
%##########################################################################


% --------------------------------------------------------------------
function menu_parameters_Callback(hObject, eventdata, handles)
% hObject    handle to menu_parameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function menu_filters_Callback(hObject, eventdata, handles)
% hObject    handle to menu_filters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% ##################################################################
% ########## DO NOT WRITE ANYTHING HERE. IT HAS SUBMENUS ###########
% ##################################################################

% --------------------------------------------------------------------
function menu_psd_Callback(hObject, eventdata, handles)
% hObject    handle to menu_psd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function menu_correlation_Callback(hObject, eventdata, handles)
% hObject    handle to menu_correlation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 %--------------------------------------------------------------------
function menu_bac_Callback(hObject, eventdata, handles)
% hObject    handle to menu_bac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function menu_load_parameters_Callback(hObject, eventdata, handles)
% hObject    handle to menu_load_parameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Prevents changing the default screen if no profile is loaded
stopper=get(handles.pre_text_amplitude_parameters,'visible');
if strcmpi(stopper,'on')==1
    msgbox('Please Load a profile to access all Software Features','Error')
    return
end

if strcmpi(get(handles.uipanel_freq,'visible'),'on')==1
    
    set(handles.uipanel_freq,'visible','off')
    
elseif strcmpi(get(handles.uipanel_gaussian,'visible'),'on')==1
    %---- GAUSSIAN FILTER OFF
    % Visibility of the greek letters of the gaussian filter screen off
    lambdac1=handles.greekletters.lambdac1;
    la1=handles.greekletters.lambdac1; l1=get(la1,'children'); set(l1,'visible','off')
    % Sets uipanel gaussian filter off
    set(handles.uipanel_gaussian,'visible','off')
    %----
    
elseif strcmpi(get(handles.uipanel_2rc,'visible'),'on')==1
    %---- 2RC FILTER OFF
    % Visibility of the greek letters of the 2rc filter screen off
    lambdac2=handles.greekletters.lambdac2;
    la2=handles.greekletters.lambdac2; l2=get(la2,'children'); set(l2,'visible','off')
    % Sets uipanel 2rc filter off
    set(handles.uipanel_2rc,'visible','off')
    %----
    
elseif strcmpi(get(handles.uipanel_psd,'visible'),'on')==1
    set(handles.uipanel_psd,'visible','off')
    
elseif strcmpi(get(handles.uipanel_correlation,'visible'),'on')==1
    set(handles.uipanel_correlation,'visible','off')
    
elseif strcmpi(get(handles.uipanel_bac,'visible'),'on')==1
    %---- BAC OFF
    % Sets uipanel BAC off
    set(handles.text_bin,'visible','off')
    set(handles.output_bin_location,'visible','off')
    % Visibility of the greek letters of the BAC screen OFF
    mu7=handles.greekletters.mu7; m7=get(mu7,'children'); set(m7,'visible','off')
    set(handles.uipanel_bac,'visible','off')
    %----
end

set(handles.export_filtered_data,'visible','off')
pause(0.1)

mu1=handles.greekletters.mu1; m1=get(mu1,'children'); set(m1,'visible','on')
mu2=handles.greekletters.mu2; m2=get(mu2,'children'); set(m2,'visible','on')
mu3=handles.greekletters.mu3; m3=get(mu3,'children'); set(m3,'visible','on')
mu4=handles.greekletters.mu4; m4=get(mu4,'children'); set(m4,'visible','on')
mu5=handles.greekletters.mu5; m5=get(mu5,'children'); set(m5,'visible','on')
mu6=handles.greekletters.mu6; m6=get(mu6,'children'); set(m6,'visible','on')

% ########################################################################
% ### When there is a change in module, the original profile is loaded ###
% ########################################################################

% Gets the data needed to load the original profile
x=handles.mystuff.x;
z=handles.mystuff.z;
dx=handles.mystuff.dx;
number_of_points=handles.mystuff.number_of_points;
evaluation_length=handles.mystuff.evaluation_length;

cla(handles.axes1); axes(handles.axes1)
h_line=zeros(number_of_points,1);
plot(x,h_line,'k'); hold on;
plot(x,z,'b'); hold off;
max_yaxis=1.1*max(z); min_yaxis=min(z)*1.1;
ylim([min_yaxis max_yaxis]);
xlim([0 evaluation_length]); grid on;
xlabel('Evaluation Length (mm)'); ylabel('Amplitude (\mum)'); 
title('Original Profile - Roughness trace'); xlim([0 evaluation_length])
set(handles.axes1,'Xscale','linear')
set(handles.axes1,'Yscale','linear')
set(handles.uipanel_parameters1,'visible','on')
set(handles.uipanel_parameters2,'visible','on')
set(handles.uipanel_parameters3,'visible','on')
set(handles.calculate_over,'visible','on')
set(handles.calculate_over_buttons,'visible','on')


% --------------------------------------------------------------------
function menu_load_filter_freq_Callback(hObject, eventdata, handles)
% hObject    handle to menu_load_filter_freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Prevents changing the default screen if no profile is loaded
stopper=get(handles.pre_text_amplitude_parameters,'visible');
if strcmpi(stopper,'on')==1
    msgbox('Please Load a profile to access all Software Features','Error')
    return
end

if strcmpi(get(handles.uipanel_parameters1,'visible'),'on')==1
    %---- PARAMETERS OFF
    % Visibility of the greek letters of the PARAMETERS screen OFF
    mu1=handles.greekletters.mu1; m1=get(mu1,'children'); set(m1,'visible','off')
    mu2=handles.greekletters.mu2; m2=get(mu2,'children'); set(m2,'visible','off')
    mu3=handles.greekletters.mu3; m3=get(mu3,'children'); set(m3,'visible','off')
    mu4=handles.greekletters.mu4; m4=get(mu4,'children'); set(m4,'visible','off')
    mu5=handles.greekletters.mu5; m5=get(mu5,'children'); set(m5,'visible','off')
    mu6=handles.greekletters.mu6; m6=get(mu6,'children'); set(m6,'visible','off')
    % Sets uipanel parameters off
    set(handles.uipanel_parameters1,'visible','off')
    set(handles.uipanel_parameters2,'visible','off')
    set(handles.uipanel_parameters3,'visible','off')
    set(handles.calculate_over,'visible','off')
    set(handles.calculate_over_buttons,'visible','off')
    %----
    
elseif strcmpi(get(handles.uipanel_gaussian,'visible'),'on')==1
    %---- GAUSSIAN FILTER OFF
    % Visibility of the greek letters of the gaussian filter screen off
    lambdac1=handles.greekletters.lambdac1;
    la1=handles.greekletters.lambdac1; l1=get(la1,'children'); set(l1,'visible','off')
    % Sets uipanel gaussian filter off
    set(handles.uipanel_gaussian,'visible','off')
    %----
    
elseif strcmpi(get(handles.uipanel_2rc,'visible'),'on')==1
    %---- 2RC FILTER OFF
    % Visibility of the greek letters of the 2rc filter screen off
    lambdac2=handles.greekletters.lambdac2;
    la2=handles.greekletters.lambdac2; l2=get(la2,'children'); set(l2,'visible','off')
    % Sets uipanel 2rc filter off
    set(handles.uipanel_2rc,'visible','off')
    %----
    
elseif strcmpi(get(handles.uipanel_psd,'visible'),'on')==1
    set(handles.uipanel_psd,'visible','off')
    
elseif strcmpi(get(handles.uipanel_correlation,'visible'),'on')==1
    set(handles.uipanel_correlation,'visible','off')
    
elseif strcmpi(get(handles.uipanel_bac,'visible'),'on')==1
    %---- BAC OFF
    % Sets uipanel BAC off
    set(handles.text_bin,'visible','off')
    set(handles.output_bin_location,'visible','off')
    % Visibility of the greek letters of the BAC screen OFF
    mu7=handles.greekletters.mu7; m7=get(mu7,'children'); set(m7,'visible','off')
    set(handles.uipanel_bac,'visible','off')
    %----
end

set(handles.export_filtered_data,'visible','off')
pause(0.1)

% ########################################################################
% ### When there is a change in module, the original profile is loaded ###
% ########################################################################

% Gets the data needed to load the original profile
x=handles.mystuff.x;
z=handles.mystuff.z;
dx=handles.mystuff.dx;
number_of_points=handles.mystuff.number_of_points;
evaluation_length=handles.mystuff.evaluation_length;

cla(handles.axes1); axes(handles.axes1)
h_line=zeros(number_of_points,1);
plot(x,h_line,'k'); hold on;
plot(x,z,'b');hold off
max_yaxis=1.1*max(z); min_yaxis=min(z)*1.1;
ylim([min_yaxis max_yaxis]);
xlim([0 evaluation_length]); grid on;
xlabel('Evaluation Length (mm)'); ylabel('Amplitude (\mum)'); 
title('Original Profile - Roughness trace'); xlim([0 evaluation_length])
set(handles.axes1,'Xscale','linear')
set(handles.axes1,'Yscale','linear')
set(handles.uipanel_freq,'visible','on')

% --------------------------------------------------------------------
function menu_load_gaussian_filter_Callback(hObject, eventdata, handles)
% hObject    handle to menu_load_gaussian_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Prevents changing the default screen if no profile is loaded

stopper=get(handles.pre_text_amplitude_parameters,'visible');
if strcmpi(stopper,'on')==1
    msgbox('Please Load a profile to access all Software Features','Error')
    return
end

if strcmpi(get(handles.uipanel_parameters1,'visible'),'on')==1
    %---- PARAMETERS OFF
    % Visibility of the greek letters of the PARAMETERS screen OFF
    mu1=handles.greekletters.mu1; m1=get(mu1,'children'); set(m1,'visible','off')
    mu2=handles.greekletters.mu2; m2=get(mu2,'children'); set(m2,'visible','off')
    mu3=handles.greekletters.mu3; m3=get(mu3,'children'); set(m3,'visible','off')
    mu4=handles.greekletters.mu4; m4=get(mu4,'children'); set(m4,'visible','off')
    mu5=handles.greekletters.mu5; m5=get(mu5,'children'); set(m5,'visible','off')
    mu6=handles.greekletters.mu6; m6=get(mu6,'children'); set(m6,'visible','off')
    % Sets uipanel parameters off
    set(handles.uipanel_parameters1,'visible','off')
    set(handles.uipanel_parameters2,'visible','off')
    set(handles.uipanel_parameters3,'visible','off')
    set(handles.calculate_over,'visible','off')
    set(handles.calculate_over_buttons,'visible','off')
    %----
 elseif strcmpi(get(handles.uipanel_freq,'visible'),'on')==1   
    set(handles.uipanel_freq,'visible','off')
    
elseif strcmpi(get(handles.uipanel_2rc,'visible'),'on')==1
    %---- 2RC FILTER OFF
    % Visibility of the greek letters of the 2rc filter screen off
    lambdac2=handles.greekletters.lambdac2;
    la2=handles.greekletters.lambdac2; l2=get(la2,'children'); set(l2,'visible','off')
    % Sets uipanel 2rc filter off
    set(handles.uipanel_2rc,'visible','off')
    %----
    
elseif strcmpi(get(handles.uipanel_psd,'visible'),'on')==1
    set(handles.uipanel_psd,'visible','off')
    
elseif strcmpi(get(handles.uipanel_correlation,'visible'),'on')==1
    set(handles.uipanel_correlation,'visible','off')
    
elseif strcmpi(get(handles.uipanel_bac,'visible'),'on')==1
    %---- BAC OFF
    % Sets uipanel BAC off
    set(handles.text_bin,'visible','off')
    set(handles.output_bin_location,'visible','off')
    % Visibility of the greek letters of the BAC screen OFF
    mu7=handles.greekletters.mu7; m7=get(mu7,'children'); set(m7,'visible','off')
    set(handles.uipanel_bac,'visible','off')
    %----
end

set(handles.export_filtered_data,'visible','off')
pause(0.1)

% Visibility of the greek letters of the filters screen on
lambdac1=handles.greekletters.lambdac1;
l1=get(lambdac1,'children'); set(l1,'visible','on')
imshow('gaussian_window.jpg', 'Parent', handles.axes2)


% ########################################################################
% ### When there is a change in module, the original profile is loaded ###
% ########################################################################

% Gets the data needed to load the original profile
x=handles.mystuff.x;
z=handles.mystuff.z;
dx=handles.mystuff.dx;
number_of_points=handles.mystuff.number_of_points;
evaluation_length=handles.mystuff.evaluation_length;

cla(handles.axes1); axes(handles.axes1)
h_line=zeros(number_of_points,1);
plot(x,h_line,'k'); hold on;
plot(x,z,'b');hold off
max_yaxis=1.1*max(z); min_yaxis=min(z)*1.1;
ylim([min_yaxis max_yaxis]);
xlim([0 evaluation_length]); grid on;
xlabel('Evaluation Length (mm)'); ylabel('Amplitude (\mum)'); 
title('Original Profile - Roughness trace'); xlim([0 evaluation_length])
set(handles.axes1,'Xscale','linear')
set(handles.axes1,'Yscale','linear')
set(handles.uipanel_gaussian,'visible','on')


% --------------------------------------------------------------------
function menu_load_2rc_Callback(hObject, eventdata, handles)
% hObject    handle to menu_load_2rc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Prevents changing the default screen if no profile is loaded

stopper=get(handles.pre_text_amplitude_parameters,'visible');
if strcmpi(stopper,'on')==1
    msgbox('Please Load a profile to access all Software Features','Error')
    return
end

if strcmpi(get(handles.uipanel_parameters1,'visible'),'on')==1
    %---- PARAMETERS OFF
    % Visibility of the greek letters of the PARAMETERS screen OFF
    mu1=handles.greekletters.mu1; m1=get(mu1,'children'); set(m1,'visible','off')
    mu2=handles.greekletters.mu2; m2=get(mu2,'children'); set(m2,'visible','off')
    mu3=handles.greekletters.mu3; m3=get(mu3,'children'); set(m3,'visible','off')
    mu4=handles.greekletters.mu4; m4=get(mu4,'children'); set(m4,'visible','off')
    mu5=handles.greekletters.mu5; m5=get(mu5,'children'); set(m5,'visible','off')
    mu6=handles.greekletters.mu6; m6=get(mu6,'children'); set(m6,'visible','off')
    % Sets uipanel parameters off
    set(handles.uipanel_parameters1,'visible','off')
    set(handles.uipanel_parameters2,'visible','off')
    set(handles.uipanel_parameters3,'visible','off')
    set(handles.calculate_over,'visible','off')
    set(handles.calculate_over_buttons,'visible','off')
    %----
elseif strcmpi(get(handles.uipanel_freq,'visible'),'on')==1
    set(handles.uipanel_freq,'visible','off')
    
elseif strcmpi(get(handles.uipanel_gaussian,'visible'),'on')==1
    %---- GAUSSIAN FILTER OFF
    % Visibility of the greek letters of the gaussian filter screen off
    lambdac1=handles.greekletters.lambdac1;
    la1=handles.greekletters.lambdac1; l1=get(la1,'children'); set(l1,'visible','off')
    % Sets uipanel gaussian filter off
    set(handles.uipanel_gaussian,'visible','off')
    %----
    
elseif strcmpi(get(handles.uipanel_psd,'visible'),'on')==1
    set(handles.uipanel_psd,'visible','off')
    
elseif strcmpi(get(handles.uipanel_correlation,'visible'),'on')==1
    set(handles.uipanel_correlation,'visible','off')
    
elseif strcmpi(get(handles.uipanel_bac,'visible'),'on')==1
    %---- BAC OFF
    % Sets uipanel BAC off
    set(handles.text_bin,'visible','off')
    set(handles.output_bin_location,'visible','off')
    % Visibility of the greek letters of the BAC screen OFF
    mu7=handles.greekletters.mu7; m7=get(mu7,'children'); set(m7,'visible','off')
    set(handles.uipanel_bac,'visible','off')
    %----
end

set(handles.export_filtered_data,'visible','off')
pause(0.1)

lambdac2=handles.greekletters.lambdac2;
l2=get(lambdac2,'children'); set(l2,'visible','on')

% ########################################################################
% ### When there is a change in module, the original profile is loaded ###
% ########################################################################

% Gets the data needed to load the original profile
x=handles.mystuff.x;
z=handles.mystuff.z;
dx=handles.mystuff.dx;
number_of_points=handles.mystuff.number_of_points;
evaluation_length=handles.mystuff.evaluation_length;

cla(handles.axes1); axes(handles.axes1)
h_line=zeros(number_of_points,1);
plot(x,h_line,'k'); hold on;
plot(x,z,'b');hold off
max_yaxis=1.1*max(z); min_yaxis=min(z)*1.1;
ylim([min_yaxis max_yaxis]);
xlim([0 evaluation_length]); grid on;
xlabel('Evaluation Length (mm)'); ylabel('Amplitude (\mum)'); 
title('Original Profile - Roughness trace'); xlim([0 evaluation_length])
set(handles.axes1,'Xscale','linear')
set(handles.axes1,'Yscale','linear')
set(handles.uipanel_2rc,'visible','on')

% --------------------------------------------------------------------
function menu_load_psd_Callback(hObject, eventdata, handles)
% hObject    handle to menu_load_psd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Prevents changing the default screen if no profile is loaded
stopper=get(handles.pre_text_amplitude_parameters,'visible');
if strcmpi(stopper,'on')==1
    msgbox('Please Load a profile to access all Software Features','Error')
    return
end

if strcmpi(get(handles.uipanel_parameters1,'visible'),'on')==1
    %---- PARAMETERS OFF
    % Visibility of the greek letters of the PARAMETERS screen OFF
    mu1=handles.greekletters.mu1; m1=get(mu1,'children'); set(m1,'visible','off')
    mu2=handles.greekletters.mu2; m2=get(mu2,'children'); set(m2,'visible','off')
    mu3=handles.greekletters.mu3; m3=get(mu3,'children'); set(m3,'visible','off')
    mu4=handles.greekletters.mu4; m4=get(mu4,'children'); set(m4,'visible','off')
    mu5=handles.greekletters.mu5; m5=get(mu5,'children'); set(m5,'visible','off')
    mu6=handles.greekletters.mu6; m6=get(mu6,'children'); set(m6,'visible','off')
    % Sets uipanel parameters off
    set(handles.uipanel_parameters1,'visible','off')
    set(handles.uipanel_parameters2,'visible','off')
    set(handles.uipanel_parameters3,'visible','off')
    set(handles.calculate_over,'visible','off')
    set(handles.calculate_over_buttons,'visible','off')
    %----
    
elseif strcmpi(get(handles.uipanel_freq,'visible'),'on')==1
    set(handles.uipanel_freq,'visible','off')

elseif strcmpi(get(handles.uipanel_gaussian,'visible'),'on')==1
    %---- GAUSSIAN FILTER OFF
    % Visibility of the greek letters of the gaussian filter screen off
    lambdac1=handles.greekletters.lambdac1;
    la1=handles.greekletters.lambdac1; l1=get(la1,'children'); set(l1,'visible','off')
    % Sets uipanel gaussian filter off
    set(handles.uipanel_gaussian,'visible','off')
    %----
    
elseif strcmpi(get(handles.uipanel_2rc,'visible'),'on')==1
    %---- 2RC FILTER OFF
    % Visibility of the greek letters of the 2rc filter screen off
    lambdac2=handles.greekletters.lambdac2;
    la2=handles.greekletters.lambdac2; l2=get(la2,'children'); set(l2,'visible','off')
    % Sets uipanel 2rc filter off
    set(handles.uipanel_2rc,'visible','off')
    %----
elseif strcmpi(get(handles.uipanel_correlation,'visible'),'on')==1
    set(handles.uipanel_correlation,'visible','off')
    
elseif strcmpi(get(handles.uipanel_bac,'visible'),'on')==1
    %---- BAC OFF
    % Sets uipanel BAC off
    set(handles.text_bin,'visible','off')
    set(handles.output_bin_location,'visible','off')
    % Visibility of the greek letters of the BAC screen OFF
    mu7=handles.greekletters.mu7; m7=get(mu7,'children'); set(m7,'visible','off')
    set(handles.uipanel_bac,'visible','off')
    %----
end

set(handles.export_filtered_data,'visible','off')
pause(0.1)

% ########################################################################
% ### When there is a change in module, the original profile is loaded ###
% ########################################################################

% Gets the data needed to load the original profile
x=handles.mystuff.x;
z=handles.mystuff.z;
dx=handles.mystuff.dx;
number_of_points=handles.mystuff.number_of_points;
evaluation_length=handles.mystuff.evaluation_length;

cla(handles.axes1); axes(handles.axes1)
h_line=zeros(number_of_points,1);
plot(x,h_line,'k'); hold on;
plot(x,z,'b');hold off
max_yaxis=1.1*max(z); min_yaxis=min(z)*1.1;
ylim([min_yaxis max_yaxis]);
xlim([0 evaluation_length]); grid on;
xlabel('Evaluation Length (mm)'); ylabel('Amplitude (\mum)'); 
title('Original Profile - Roughness trace'); xlim([0 evaluation_length])
set(handles.axes1,'Xscale','linear')
set(handles.axes1,'Yscale','linear')
set(handles.uipanel_psd,'visible','on')


% --------------------------------------------------------------------
function menu_load_correlation_Callback(hObject, eventdata, handles)
% hObject    handle to menu_load_correlation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Prevents changing the default screen if no profile is loaded
stopper=get(handles.pre_text_amplitude_parameters,'visible');
if strcmpi(stopper,'on')==1
    msgbox('Please Load a profile to access all Software Features','Error')
    return
end

if strcmpi(get(handles.uipanel_parameters1,'visible'),'on')==1
    %---- PARAMETERS OFF
    % Visibility of the greek letters of the PARAMETERS screen OFF
    mu1=handles.greekletters.mu1; m1=get(mu1,'children'); set(m1,'visible','off')
    mu2=handles.greekletters.mu2; m2=get(mu2,'children'); set(m2,'visible','off')
    mu3=handles.greekletters.mu3; m3=get(mu3,'children'); set(m3,'visible','off')
    mu4=handles.greekletters.mu4; m4=get(mu4,'children'); set(m4,'visible','off')
    mu5=handles.greekletters.mu5; m5=get(mu5,'children'); set(m5,'visible','off')
    mu6=handles.greekletters.mu6; m6=get(mu6,'children'); set(m6,'visible','off')
    % Sets uipanel parameters off
    set(handles.uipanel_parameters1,'visible','off')
    set(handles.uipanel_parameters2,'visible','off')
    set(handles.uipanel_parameters3,'visible','off')
    set(handles.calculate_over,'visible','off')
    set(handles.calculate_over_buttons,'visible','off')
    %----
    
elseif strcmpi(get(handles.uipanel_freq,'visible'),'on')==1
    set(handles.uipanel_freq,'visible','off')
    
elseif strcmpi(get(handles.uipanel_gaussian,'visible'),'on')==1
    %---- GAUSSIAN FILTER OFF
    % Visibility of the greek letters of the gaussian filter screen off
    lambdac1=handles.greekletters.lambdac1;
    la1=handles.greekletters.lambdac1; l1=get(la1,'children'); set(l1,'visible','off')
    % Sets uipanel gaussian filter off
    set(handles.uipanel_gaussian,'visible','off')
    %----
    
elseif strcmpi(get(handles.uipanel_2rc,'visible'),'on')==1
    %---- 2RC FILTER OFF
    % Visibility of the greek letters of the 2rc filter screen off
    lambdac2=handles.greekletters.lambdac2;
    la2=handles.greekletters.lambdac2; l2=get(la2,'children'); set(l2,'visible','off')
    % Sets uipanel 2rc filter off
    set(handles.uipanel_2rc,'visible','off')
    %----
    
elseif strcmpi(get(handles.uipanel_psd,'visible'),'on')==1
    set(handles.uipanel_psd,'visible','off')
    
elseif strcmpi(get(handles.uipanel_bac,'visible'),'on')==1
    %---- BAC OFF
    % Sets uipanel BAC off
    set(handles.text_bin,'visible','off')
    set(handles.output_bin_location,'visible','off')
    % Visibility of the greek letters of the BAC screen OFF
    mu7=handles.greekletters.mu7; m7=get(mu7,'children'); set(m7,'visible','off')
    set(handles.uipanel_bac,'visible','off')
    %----
end

set(handles.export_filtered_data,'visible','off')
pause(0.1)

% ########################################################################
% ### When there is a change in module, the original profile is loaded ###
% ########################################################################

% Gets the data needed to load the original profile
x=handles.mystuff.x;
z=handles.mystuff.z;
dx=handles.mystuff.dx;
number_of_points=handles.mystuff.number_of_points;
evaluation_length=handles.mystuff.evaluation_length;

cla(handles.axes1); axes(handles.axes1)
h_line=zeros(number_of_points,1);
plot(x,h_line,'k'); hold on;
plot(x,z,'b');hold off
max_yaxis=1.1*max(z); min_yaxis=min(z)*1.1;
ylim([min_yaxis max_yaxis]);
xlim([0 evaluation_length]); grid on;
xlabel('Evaluation Length (mm)'); ylabel('Amplitude (\mum)'); 
title('Original Profile - Roughness trace'); xlim([0 evaluation_length])
set(handles.axes1,'Xscale','linear')
set(handles.axes1,'Yscale','linear')
set(handles.uipanel_correlation,'visible','on')

% --------------------------------------------------------------------
function menu_load_BAC_Callback(hObject, eventdata, handles)
% hObject    handle to menu_load_BAC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Prevents changing the default screen if no profile is loaded
stopper=get(handles.pre_text_amplitude_parameters,'visible');
if strcmpi(stopper,'on')==1
    msgbox('Please Load a profile to access all Software Features','Error')
    return
end

if strcmpi(get(handles.uipanel_parameters1,'visible'),'on')==1
    %---- PARAMETERS OFF
    % Visibility of the greek letters of the PARAMETERS screen OFF
    mu1=handles.greekletters.mu1; m1=get(mu1,'children'); set(m1,'visible','off')
    mu2=handles.greekletters.mu2; m2=get(mu2,'children'); set(m2,'visible','off')
    mu3=handles.greekletters.mu3; m3=get(mu3,'children'); set(m3,'visible','off')
    mu4=handles.greekletters.mu4; m4=get(mu4,'children'); set(m4,'visible','off')
    mu5=handles.greekletters.mu5; m5=get(mu5,'children'); set(m5,'visible','off')
    mu6=handles.greekletters.mu6; m6=get(mu6,'children'); set(m6,'visible','off')
    % Sets uipanel parameters off
    set(handles.uipanel_parameters1,'visible','off')
    set(handles.uipanel_parameters2,'visible','off')
    set(handles.uipanel_parameters3,'visible','off')
    set(handles.calculate_over,'visible','off')
    set(handles.calculate_over_buttons,'visible','off')
    %----
    
elseif strcmpi(get(handles.uipanel_freq,'visible'),'on')==1
    set(handles.uipanel_freq,'visible','off')
    
elseif strcmpi(get(handles.uipanel_gaussian,'visible'),'on')==1
    %---- GAUSSIAN FILTER OFF
    % Visibility of the greek letters of the gaussian filter screen off
    lambdac1=handles.greekletters.lambdac1;
    la1=handles.greekletters.lambdac1; l1=get(la1,'children'); set(l1,'visible','off')
    % Sets uipanel gaussian filter off
    set(handles.uipanel_gaussian,'visible','off')
    %----
    
elseif strcmpi(get(handles.uipanel_2rc,'visible'),'on')==1
    %---- 2RC FILTER OFF
    % Visibility of the greek letters of the 2rc filter screen off
    lambdac2=handles.greekletters.lambdac2;
    la2=handles.greekletters.lambdac2; l2=get(la2,'children'); set(l2,'visible','off')
    % Sets uipanel 2rc filter off
    set(handles.uipanel_2rc,'visible','off')
    %----
    
elseif strcmpi(get(handles.uipanel_psd,'visible'),'on')==1
    set(handles.uipanel_psd,'visible','off')
    
elseif strcmpi(get(handles.uipanel_correlation,'visible'),'on')==1
    set(handles.uipanel_correlation,'visible','off')
end

set(handles.export_filtered_data,'visible','off')
pause(0.1)

% ########################################################################
% ### When there is a change in module, the original profile is loaded ###
% ########################################################################

% Gets the data needed to load the original profile
x=handles.mystuff.x;
z=handles.mystuff.z;
dx=handles.mystuff.dx;
number_of_points=handles.mystuff.number_of_points;
evaluation_length=handles.mystuff.evaluation_length;

cla(handles.axes1); axes(handles.axes1)
h_line=zeros(number_of_points,1);
plot(x,h_line,'k',x,z,'b'); hold on;
plot(x,z,'b'); hold off
max_yaxis=1.1*max(z); min_yaxis=min(z)*1.1;
ylim([min_yaxis max_yaxis]);
xlim([0 evaluation_length]); grid on;
xlabel('Evaluation Length (mm)'); ylabel('Amplitude (\mum)'); 
title('Original Profile - Roughness trace'); xlim([0 evaluation_length])
set(handles.axes1,'Xscale','linear')
set(handles.axes1,'Yscale','linear')
set(handles.uipanel_bac,'visible','on')

% --- Executes on selection change in popupmenu_psd.
function popupmenu_psd_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_psd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_psd contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_psd

% --- Executes during object creation, after setting all properties.

function popupmenu_psd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_psd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_scale.
function popupmenu_scale_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_scale contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_scale


% --- Executes during object creation, after setting all properties.
function popupmenu_scale_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_correlation_side.
function popupmenu_correlation_side_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_correlation_side (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_correlation_side contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_correlation_side


% --- Executes during object creation, after setting all properties.
function popupmenu_correlation_side_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_correlation_side (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu_gaussian.
function popupmenu_gaussian_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_gaussian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_gaussian contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_gaussian


% --- Executes during object creation, after setting all properties.
function popupmenu_gaussian_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_gaussian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function input_correlation_lag_length_Callback(hObject, eventdata, handles)
% hObject    handle to input_correlation_lag_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_correlation_lag_length as text
%        str2double(get(hObject,'String')) returns contents of input_correlation_lag_length as a double


% --- Executes during object creation, after setting all properties.
function input_correlation_lag_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_correlation_lag_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function input_wavelength_filter_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function input_wavelength_filter_Callback(hObject, eventdata, handles)
% hObject    handle to input_wavelength_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_wavelength_filter as text
%        str2double(get(hObject,'String')) returns contents of input_wavelength_filter as a double


% --- Executes on button press in load_button.


function input_number_of_bins_Callback(hObject, eventdata, handles)
% hObject    handle to input_number_of_bins (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_number_of_bins as text
%        str2double(get(hObject,'String')) returns contents of input_number_of_bins as a double


% --- Executes during object creation, after setting all properties.
function input_number_of_bins_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_number_of_bins (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function input_tp_Callback(hObject, eventdata, handles)
% hObject    handle to input_tp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_tp as text
%        str2double(get(hObject,'String')) returns contents of input_tp as a double


% --- Executes during object creation, after setting all properties.
function input_tp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_tp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function input_rsm_height_discrimination_Callback(hObject, eventdata, handles)
% hObject    handle to input_rsm_height_discrimination (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_rsm_height_discrimination as text
%        str2double(get(hObject,'String')) returns contents of input_rsm_height_discrimination as a double

% --- Executes during object creation, after setting all properties.
function input_rsm_height_discrimination_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_gaussian_filter_cutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function input_rsm_spacing_discrimination_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_gaussian_filter_cutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function input_rsm_spacing_discrimination_Callback(hObject, eventdata, handles)
% hObject    handle to input_rsm_spacing_discrimination (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_rsm_spacing_discrimination as text
%        str2double(get(hObject,'String')) returns contents of input_rsm_spacing_discrimination as a double

function input_rc_filter_cutoff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_rc_filter_cutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_rc_filter_cutoff as text
%        str2double(get(hObject,'String')) returns contents of input_rc_filter_cutoff as a double

% --- Executes during object creation, after setting all properties.

function input_gaussian_filter_cutoff_Callback(hObject, eventdata, handles)
% hObject    handle to input_gaussian_filter_cutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_gaussian_filter_cutoff as text
%        str2double(get(hObject,'String')) returns contents of input_gaussian_filter_cutoff as a double


% --- Executes during object creation, after setting all properties.
function input_gaussian_filter_cutoff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_gaussian_filter_cutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function input_rc_filter_cutoff_Callback(hObject, eventdata, handles)
% hObject    handle to input_gaussian_filter_cutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

% --- Executes during object creation, after setting all properties.
function file_route_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_route (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject, handles);

% --- Executes on button press in radiobutton_waviness_gaussian.
function radiobutton_waviness_gaussian_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_waviness_gaussian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_waviness_gaussian


% --- Executes on button press in radiobutton_waviness_gaussian.
function radiobutton_roughness_gaussian_Callback(hObject, eventdata, handles)
if (get(hObject,'Value') == get(hObject,'Max'))
	display('Selected');
else
	display('Not selected');
end
% hObject    handle to radiobutton_waviness_gaussian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_waviness_gaussian

function calculate_rc_filter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_gaussian_filter_cutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popmenu_2rc.
function popmenu_2rc_Callback(hObject, eventdata, handles)
% hObject    handle to popmenu_2rc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popmenu_2rc contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popmenu_2rc


% --- Executes during object creation, after setting all properties.
function popmenu_2rc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popmenu_2rc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function menu_menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_export_axes_Callback(hObject, eventdata, handles)
% hObject    handle to menu_export_axes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Gets the axes of the GUI
h = handles.axes1;

% Creates a new window and sets the size of the GUI axes
f1 = figure; 
sz=[610 850];

% Centers the figure in the window, depending on the screen resolution
screensize = get(0,'ScreenSize');
xpos = ceil((screensize(3)-sz(2))/2);
ypos = ceil((screensize(4)-sz(1))/2);

set(f1,'color','w','Position',[xpos, ypos, sz(2), sz(1)])

% Moves the GUI axes to the new window
s = copyobj(h,f1); % Copy axes object h into figure f1
set(gca,'Unit','normalized','Position',[0.1 0.12 0.85 0.8])


% --------------------------------------------------------------------
function menu_load_smd_generator_Callback(hObject, eventdata, handles)
% hObject    handle to menu_load_smd_generator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
VisualSR2D_smd_Generator


% --- Executes on button press in export_filtered_data.
function export_filtered_data_Callback(hObject, eventdata, handles)
% hObject    handle to export_filtered_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_identifier=handles.mystuff.file_identifier;
filter_used=handles.mystuff.filter_used;
filter_type=handles.mystuff.filter_type;
z_export=handles.mystuff.z_export;
number_of_points=size(z_export,1);
dx=handles.mystuff.dx; dx=dx*1000;
lambdac=handles.mystuff.lambdac;

route_exported_filtered_profile=export_filtered_profile(file_identifier,...
    filter_used,filter_type,number_of_points,dx,lambdac,z_export);

a=questdlg('Do you want to analyze the filtered profile now?',...
    'Load filtered profile','Yes','No','Yes');
switch a
    case 'Yes'
        handles.route=route_exported_filtered_profile;
        set(handles.file_route,'string',route_exported_filtered_profile)
        guidata(hObject, handles);
        load_button_Callback(hObject, eventdata, handles)
    case 'No'
end



% --- Executes when selected object is changed in calculate_over_buttons.
function calculate_over_buttons_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in calculate_over_buttons 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
ActiveButton=get(eventdata.NewValue,'tag');

switch ActiveButton
    
    case 'parameters_evaluation_length'
        
        number_of_points=handles.mystuff.number_of_points;
        z=handles.mystuff.z;
        x=handles.mystuff.x;
        evaluation_length=handles.mystuff.evaluation_length;
        smd_filter_type=handles.mystuff.smd_filter_type;
                 
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%% AMPLITUDE PARAMETERS %%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        r=z;
        Ra=sum(abs(r))/number_of_points; Rq=sqrt(sum(r.*r)/number_of_points);
        Rp=max(r); Rv=abs(min(r)); Rt=Rp+abs(Rv);
        
        Ra_display=[' = ',num2str(Ra)];
        Rq_display=[' = ',num2str(Rq)];
        Rp_display=[' = ',num2str(Rp)];
        Rv_display=[' = ',num2str(Rv)];
        Rt_display=[' = ',num2str(Rt)];
        
        if strcmpi(smd_filter_type,'Waviness')==1
            set(handles.A4,'string','Wt')
        elseif strcmpi(smd_filter_type,'Roughness')==1
            set(handles.A4,'string','Rt')
        else
            set(handles.A4,'string','Pt')
        end
              
        set(handles.parameter_ra,'string',Ra_display)
        set(handles.parameter_rq,'string',Rq_display)
        set(handles.parameter_rp,'string',Rp_display)
        set(handles.parameter_rv,'string',Rv_display)
        set(handles.parameter_rt,'string',Rt_display)

        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%% SPACING PARAMETERS %%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        r=z;
        hd=str2double(get(handles.input_rsm_height_discrimination,'string'));
        sd=str2double(get(handles.input_rsm_spacing_discrimination,'string'));
        HeightThreshold=hd*Rt/100;
        SpacingThreshold=sd*evaluation_length/100;
        hh1=msgbox('Computing RSm...');
        
        % To see this function commented go to the original Calculate
        % Rsm function
        cont= 1;
        for j = 1:number_of_points - 1
            if (r(j) * r(j + 1)) < 0 || ((r(j) * r(j + 1)) == 0 && (r(j) * r(j - 1)) ~= 0)
                B(cont,1) = j;
                cont = cont + 1;
            end
        end
        number_of_zeros=size(B,1);
        end_zero = B(1,1);
        current_zero=B(1,1);
        valid_zeros(1) = B(1,1);
        cont = 2;
        for p=1:number_of_zeros-1 % This loop represents the current zeros
            for k = 2:number_of_zeros-1
                end_zero = B(k,1);
                if x(end_zero) - x(current_zero) < SpacingThreshold
                    continue
                end
                m0=max(r(B(k,1):B(k+1)));
                if m0<HeightThreshold
                    continue
                end
                m1=max(r(current_zero+1:B(k,1)));
                if m1<HeightThreshold
                    continue
                end
                m2=min(r(current_zero+1:B(k,1)));
                if m2>-HeightThreshold
                    continue
                else
                    valid_zeros(cont,1) = B(k);
                    cont = cont + 1;
                    current_zero=end_zero;
                    break
                end
            end
        end
        close(hh1)
        sumatory_smi=x(valid_zeros(end))-x(valid_zeros(1));
        
        % Definition of the Rsm parameter
        RSm = sumatory_smi*1000 / (size(valid_zeros,1)-1);
        
        RS_display=[' = ',num2str(RSm)];
        set(handles.parameter_rsm,'string',RS_display)
                
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%% SHAPE PARAMETERS %%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        Rsk = (1/Rq^3)*sum(z.^3)/number_of_points; % compute Rsk
        Rku = (1/Rq^4)*sum(z.^4)/number_of_points; % compute Rsk
               
        if strcmpi(smd_filter_type,'Waviness')==1
            Rsk_display=['Wsk = ',num2str(Rsk)];
            Rku_display=['Wku = ',num2str(Rku)];
        elseif strcmpi(smd_filter_type,'Roughness')==1
            Rsk_display=['Rsk = ',num2str(Rsk)];
            Rku_display=['Rku = ',num2str(Rku)];
        else
            Rsk_display=['Psk = ',num2str(Rsk)];
            Rku_display=['Pku = ',num2str(Rku)];
        end
        
        set(handles.parameter_rsk,'string',Rsk_display)
        set(handles.parameter_rku,'string',Rku_display) 
        
        guidata(gcbo, handles);       
        
    case 'parameters_sampling_length'
        
        number_of_points=handles.mystuff.number_of_points;
        z=handles.mystuff.z;
        x=handles.mystuff.x;
        dx=handles.mystuff.dx;
        evaluation_length=handles.mystuff.evaluation_length;
        smd_Lc_used=handles.mystuff.smd_Lc_used;
        Lc=str2num(smd_Lc_used);
        smd_filter_type=handles.mystuff.smd_filter_type;
        
        
        % Definition of the sampling lengths
        % -----------------------------------------------------------------
        points_in_sampling_length=round(1000*(round(Lc/dx)+1))/1000;
                      
        point_start_sampling_length(1)=1;
        point_finish_sampling_length(1)=points_in_sampling_length;
        
        number_of_full_sampling_lengths=1;
        for i=2:ceil(number_of_points/points_in_sampling_length)
            
            point_start_sampling_length(i)=point_finish_sampling_length(i-1);
            
            point_finish_sampling_length(i)=point_start_sampling_length(i)+...
                points_in_sampling_length-1;
            
            number_of_full_sampling_lengths=number_of_full_sampling_lengths+1;
            if point_finish_sampling_length(i)+points_in_sampling_length-1>...
                    number_of_points
                break
            end
        end
        % -----------------------------------------------------------------
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%% AMPLITUDE PARAMETERS %%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        for i=1:number_of_full_sampling_lengths
            z_sl=z(point_start_sampling_length(i):point_finish_sampling_length(i));
            
            r=z_sl;
            
            Ra_sl(i)=sum(abs(r))/points_in_sampling_length;
            Rq_sl(i)=sqrt(sum(r.*r)/points_in_sampling_length);
            Rp_sl(i)=max(r);
            Rv_sl(i)=abs(min(r));
            Rt_sl(i)=Rp_sl(i)+abs(Rv_sl(i));
        end
        
        Ra=sum(Ra_sl)/number_of_full_sampling_lengths;
        Rq=sum(Rq_sl)/number_of_full_sampling_lengths;
        Rp=sum(Rp_sl)/number_of_full_sampling_lengths;
        Rv=sum(Rv_sl)/number_of_full_sampling_lengths;
        Rt=sum(Rt_sl)/number_of_full_sampling_lengths;
        
        Ra_display=[' = ',num2str(Ra)];
        Rq_display=[' = ',num2str(Rq)];
        Rp_display=[' = ',num2str(Rp)];
        Rv_display=[' = ',num2str(Rv)];
        Rt_display=[' = ',num2str(Rt)];
        
        if strcmpi(smd_filter_type,'Waviness')==1
            set(handles.A4,'string','Wz')
        elseif strcmpi(smd_filter_type,'Roughness')==1
            set(handles.A4,'string','Rz')
        else
            set(handles.A4,'string','Pz')
        end
              
        set(handles.parameter_ra,'string',Ra_display)
        set(handles.parameter_rq,'string',Rq_display)
        set(handles.parameter_rp,'string',Rp_display)
        set(handles.parameter_rv,'string',Rv_display)
        set(handles.parameter_rt,'string',Rt_display)
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%% SPACING PARAMETERS %%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        hh1=msgbox('Computing RSm...');
        for i=1:number_of_full_sampling_lengths
            z_sl=z(point_start_sampling_length(i):point_finish_sampling_length(i));
            
            r=z_sl;
            
            hd=str2double(get(handles.input_rsm_height_discrimination,'string'));
            sd=str2double(get(handles.input_rsm_spacing_discrimination,'string'));
            HeightThreshold=hd*Rt/100;
            SpacingThreshold=sd*Lc/100;
                      
            % To see this function commented go to the original Calculate
            % Rsm function
            cont= 1;
            B=0;
            for j = 1:points_in_sampling_length - 1
                if (r(j) * r(j + 1)) < 0 || ((r(j) * r(j + 1)) == 0 && (r(j) * r(j - 1)) ~= 0)
                    B(cont,1) = j;
                    cont = cont + 1;
                end
            end
            if B==0
                continue
            end
            number_of_zeros=size(B,1);
            end_zero = B(1,1);
            current_zero=B(1,1);
            valid_zeros(1) = B(1,1);
            cont = 2;
            for p=1:number_of_zeros-1 % This loop represents the current zeros
                for k = 2:number_of_zeros-1
                    end_zero = B(k,1);
                    if x(end_zero) - x(current_zero) < SpacingThreshold
                        continue
                    end
                    m0=max(r(B(k,1):B(k+1)));
                    if m0<HeightThreshold
                        continue
                    end
                    m1=max(r(current_zero+1:B(k,1)));
                    if m1<HeightThreshold
                        continue
                    end
                    m2=min(r(current_zero+1:B(k,1)));
                    if m2>-HeightThreshold
                        continue
                    else
                        valid_zeros(cont,1) = B(k);
                        cont = cont + 1;
                        current_zero=end_zero;
                        break
                    end
                end
            end
            sumatory_smi=x(valid_zeros(end))-x(valid_zeros(1));
            RSm_sl(i) = sumatory_smi*1000 / (size(valid_zeros,1)-1);
        end
        close(hh1)
        RSm=sum(RSm_sl)/number_of_full_sampling_lengths;
        RS_display=[' = ',num2str(RSm)];
        
        set(handles.parameter_rsm,'string',RS_display)
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%% SHAPE PARAMETERS %%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        for i=1:number_of_full_sampling_lengths
            
            z_sl=z(point_start_sampling_length(i):point_finish_sampling_length(i));
            
            Rsk_sl(i) = (1/Rq_sl(i)^3)*sum(z_sl.^3)/points_in_sampling_length;
            Rku_sl(i) = (1/Rq_sl(i)^4)*sum(z_sl.^4)/points_in_sampling_length;
        end

        Rsk=sum(Rsk_sl)/number_of_full_sampling_lengths;
        Rku=sum(Rku_sl)/number_of_full_sampling_lengths;
        
        if strcmpi(smd_filter_type,'Waviness')==1
            Rsk_display=['Wsk = ',num2str(Rsk)];
            Rku_display=['Wku = ',num2str(Rku)];
        elseif strcmpi(smd_filter_type,'Roughness')==1
            Rsk_display=['Rsk = ',num2str(Rsk)];
            Rku_display=['Rku = ',num2str(Rku)];
        else
            Rsk_display=['Psk = ',num2str(Rsk)];
            Rku_display=['Pku = ',num2str(Rku)];
        end
        
        set(handles.parameter_rsk,'string',Rsk_display)
        set(handles.parameter_rku,'string',Rku_display)
        
        guidata(gcbo, handles);
        
end

