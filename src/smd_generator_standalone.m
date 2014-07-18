clear; clc

% Defino los caracteres ASCII que voy a utilizar
NUL=char(0); % ASCII "NUL" character
CR=char(13); % ASCII "CR" character
LF=char(10); % ASCII "LF" character
ETX=char(3); % ASCII "ETX" character
SUB=char(26); % ASCII "SUB" character

% i_now is the vector [year month day hour minute seconds]
i_now=clock; year=num2str(i_now(1)); day=num2str(i_now(3));
hour=num2str(i_now(4)); minute=num2str(i_now(5));

if size(minute,2)==1
    minute=[num2str(0) minute];
end

if i_now(2)==1; month='January'; elseif i_now(2)==2; month='February';
elseif i_now(2)==3; month='March'; elseif i_now(2)==4; month='April';
elseif i_now(2)==5; month='May'; elseif i_now(2)==6; month='June';
elseif i_now(2)==7; month='July'; elseif i_now(2)==8; month='August';
elseif i_now(2)==9; month='September'; elseif i_now(2)==10; month='October';
elseif i_now(2)==11; month='November'; elseif i_now(2)==12; month='December';
end

% Current date and time
date_def=[day ' ' month ' ' year]; time_def=[hour ':' minute];

% Default answer for the Header Section - TO BE CHANGED
def_A = {'ISO 5436 - 1999','EDM','PRF','2','ISO5436','22401','I','um',...
    '1.0e0','D','0.25','A','um','1.0e0','D'};

% Default answer for the Optional Information Section
dB='This field is optional';
def_B = {date_def,time_def,dB,dB,dB,dB,dB,dB,dB,dB,dB,dB};

% A are the inputs of the Header section. They come with a filter because
% they ALL must be fulfilled
filter=0;
while filter==0;
    header=inputdlg({'Revision Number','File Identifier',...
        'Feature Type','Feature Number', 'Feature Name',...
        'Number of Points','X Axis Type','X Units',...
        'X Scale Factor','X Axis Data type','X Incremental Value',...
        'Z Axis Type','Z Units','Z Scale Factor','Z Axis Data Type'},...
        'Header Definition',[1 50; 1 50; 1 50; 1 50; 1 50; 1 50; 1 50; 1 50;...
        1 50; 1 50; 1 50; 1 50; 1 50; 1 50; 1 50],def_A); % quitar def_A para que no cargue datos de EDM.smd
    
    if size(header,1)==0 && size(header,2)==0
        return
    end
    
    for i=1:15
        if isempty(header{i})==1
            waitfor(msgbox('All fields of the Header section must be completed!',...
                'Error','error'));
            filter=0;
            def_A={header{1},header{2},header{3},header{4},header{5},...
                header{6},header{7},header{8},header{9},header{10},...
                header{11},header{12},header{13},header{14},header{15}};
            break
        else
            filter=1;
            
        end
    end
end

% B are the inputs of the Optional Information SECTION
o_i=inputdlg({'Date','Time','Created by','Instrument ID',...
    'Instrument Serial','Last Adjustment', 'Probing System', 'Comment',...
    'Offset (mm)','Speed (mm/s)','Profile Filter','Parameter Value'},...
    'Optional Information',[1 50; 1 50; 1 50; 1 50; 1 50; 1 50; 1 50;...
    1 50; 1 50; 1 50; 1 50;1 50],def_B);

% dtt are the inputs of the Data measured. They come with a filter in case
% the number of points does not match the ones specified in the Header
filter=0;
while filter==0;
        dtt=inputdlg('Vector with the Z components (one per row)',...
            'Data',[20 30]);
    
    if size(dtt,1)==0 && size(dtt,2)==0
        return
    end
    
    % Conversion of the data to a useful format
    data=str2num(dtt{1,1});
    
    if size(dtt{1},1) ~= str2num(header{6})
        waitfor(msgbox(['The number of points does NOT match the '...
            'number of points specified in the Header (' header{6} ')'],...
            'Error','error'));
    else
        filter=1;
    end
end

% Creates the new .smd file named as the File Identifier
f = fopen([header{2} '.smd'], 'w');

% ########################################################################
% ######################### SECTION 1: HEADER ############################
% ########################################################################
% LINE 1
h_line1=[header{1} NUL header{2} NUL CR LF];
fwrite(f,h_line1);

% LINE 2
h_line2=[header{3} NUL ' ' header{4} ' ' header{5} NUL CR LF];
fwrite(f,h_line2);

% LINE 3
h_line3=['CX' NUL ' ' header{7} NUL ' ' header{6} ' ' header{8} NUL ...
    ' ' header{9} ' ' header{10} NUL ' ' header{11} CR LF];
fwrite(f,h_line3);

% LINE 4
h_line4=['CZ' NUL ' ' header{12} NUL ' ' header{6} ' ' header{13} NUL...
    ' ' header{14} ' ' header{15} NUL CR LF];
fwrite(f,h_line4);

% LINE 5 - END OF SECTION 1
h_line5=[ETX CR LF];
fwrite(f,h_line5);

% Bytes of the SECTION 1: HEADER
bytes_header=sum(double(h_line1))+sum(double(h_line2))+...
    sum(double(h_line3))+sum(double(h_line4))+sum(double(h_line5));

% ########################################################################
% ################# SECTION 2: OPTIONAL INFORMATION ######################
% ########################################################################

% fff filter so that if it is 0 it is not necessary to add the end of
% section because nothing has been written
fff=0;

o_line1=char(0); o_line2=char(0);  o_line3=char(0);  o_line4=char(0);
o_line5=char(0); o_line6=char(0);  o_line7=char(0);  o_line8=char(0);
o_line9=char(0); o_line10=char(0); o_line11=char(0); o_line12=char(0);
o_line13=char(0);

% LINE 1
if strcmp(o_i{1},dB)~=1 && isempty(o_i{1})~=1 && strcmp(o_i{1},' ')~=1
    o_line1=['DATE ' o_i{1} NUL CR LF];
    fwrite(f,o_line1); fff=1;
end

% LINE 2
if strcmp(o_i{2},dB)~=1 && isempty(o_i{2})~=1 && strcmp(o_i{2},' ')~=1
    o_line2=['TIME ' o_i{2} NUL CR LF];
    fwrite(f,o_line2); fff=1;
end

% LINE 3
if strcmp(o_i{3},dB)~=1 && isempty(o_i{3})~=1 && strcmp(o_i{3},' ')~=1
    o_line3=['CREATED BY ' o_i{3} NUL CR LF];
    fwrite(f,o_line3); fff=1;
end

% LINE 4
if strcmp(o_i{4},dB)~=1 && isempty(o_i{4})~=1 && strcmp(o_i{4},' ')~=1
    o_line4=['INSTRUMENT ID ' o_i{4} NUL CR LF];
    fwrite(f,o_line4); fff=1;
end

% LINE 5
if strcmp(o_i{5},dB)~=1 && isempty(o_i{5})~=1 && strcmp(o_i{5},' ')~=1
    o_line5=['INSTRUMENT_SERIAL ' o_i{5} NUL CR LF];
    fwrite(f,o_line5); fff=1;
end

% LINE 6
if strcmp(o_i{6},dB)~=1 && isempty(o_i{6})~=1 && strcmp(o_i{6},' ')~=1
    o_line6=['LAST_ADJUSTEMENT ' o_i{6} NUL CR LF];
    fwrite(f,o_line6); fff=1;
end

% LINE 7
if strcmp(o_i{7},dB)~=1 && isempty(o_i{7})~=1 && strcmp(o_i{7},' ')~=1
    o_line7=['PROBING SYSTEM ' o_i{7} NUL CR LF];
    fwrite(f,o_line7); fff=1;
end

% LINE 8
if strcmp(o_i{8},dB)~=1 && isempty(o_i{8})~=1 && strcmp(o_i{8},' ')~=1
    o_line8=['COMMENT /* ' o_i{8} '*/' NUL CR LF];
    fwrite(f,o_line8); fff=1;
end

% Line 9
if strcmp(o_i{9},dB)~=1 && isempty(o_i{9})~=1 && strcmp(o_i{9},' ')~=1
    o_line9=['OFFSET ' o_i{9} NUL CR LF];
    fwrite(f,o_line9); fff=1;
end

% Line 10
if strcmp(o_i{10},dB)~=1 && isempty(o_i{10})~=1 && strcmp(o_i{10},' ')~=1
    o_line10=['SPEED ' o_i{10} NUL CR LF];
    fwrite(f,o_line10); fff=1;
end

% Line 11
if strcmp(o_i{11},dB)~=1 && isempty(o_i{11})~=1 && strcmp(o_i{11},' ')~=1
    o_line11=['PROFILE_FILTER ' o_i{11} NUL CR LF];
    fwrite(f,o_line11); fff=1;
end

% Line 12
if strcmp(o_i{12},dB)~=1 && isempty(o_i{12})~=1 && strcmp(o_i{12},' ')~=1
    o_line12=['PARAMETER VALUE ' o_i{12} NUL CR LF];
    fwrite(f,o_line12); fff=1;
end

% LINE 13 - END OF SECTION 2
if fff==1
    o_line13=[ETX CR LF];
    fwrite(f,o_line13);
end

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

for i=1:size(dtt{1},1)
    temp=dtt{1}(i,:);
    
    % ASCII charactes are taken as spaces. It is necessary to trim them and
    % add them again
    temp=strtrim(temp);
    temp=[temp CR LF];
    
    % Bytes of the SECTION 3: DATA
    bytes_data=bytes_data+sum(double(temp));
    
    fwrite(f,temp);
end

% FINAL LINE DATA
f_data=[ETX CR LF];
bytes_data=bytes_data+sum(double(f_data));
fwrite(f,f_data);

% ########################################################################
% ######################### SECTION 4: CHECKSUM ##########################
% ########################################################################

checksum_temp=bytes_header+bytes_optional_information+bytes_data;
checksum=mod(checksum_temp,65535);

fwrite(f,[num2str(checksum,30) CR LF ETX CR LF SUB CR LF]);

% -----------------------------------------------------------------------
fclose(f);

h = msgbox([header{2} '.smd has been generated in ' pwd], 'Done!');
