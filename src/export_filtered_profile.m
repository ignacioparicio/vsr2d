function [route_exported_filtered_profile]=export_filtered_profile(file_identifier,...
    filter_used,filter_type,number_of_points,dx,lambdac,z_export)
% This function exports a profile that has been filtered in one of the
% filtering modules of VisualSR2D: FFT, Gaussian or 2RC
h=msgbox('Exporting...');
new_file_identifier=[file_identifier '_' filter_used '_' filter_type];
    
    header{1}='ISO 5436-2:2001';
    header{2}=new_file_identifier;
    header{3}='PRF';
    header{4}='0';
    header{5}='ISO5436';
    header{6}=num2str(number_of_points);
    header{7}='I';
    header{8}='A';
    header{9}='um';
    header{10}='um';
    header{11}='1.0e0';
    header{12}='1.0e0';
    header{13}='D';
    header{14}='D';
    header{15}=num2str(dx);
    
    % Calls the external function current_date_and_time
    [date_def, time_def] = current_date_and_time;
    
    % Defines the values as empty
    for i=1:12
        o_i{i}='';
    end
    
    o_i{1}=date_def;
    o_i{2}=time_def;
    o_i{3}='VisualSR2D';
    o_i{11}=[filter_used ' Lc ' num2str(lambdac)];
    


    
%---------------- DATA WRITTING AND CHECKSUM COMPUTATION ------------------   
    
    
% Creates the new .smd file named as the File Identifier
smd_file = fopen([header{2} '.smd'], 'w');

% ASCII chars to be used
NUL=char(0); % ASCII "NUL" character
CR=char(13); % ASCII "CR" character
LF=char(10); % ASCII "LF" character
ETX=char(3); % ASCII "ETX" character
SUB=char(26); % ASCII "SUB" character

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

for i=1:size(z_export,1)
        
    % ASCII charactes are taken as spaces. It is necessary to trim them and
    % add them again
    temp=mat2str(z_export(i));
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
close(h);
waitfor(msgbox([header{2} '.smd has been generated in ' pwd], 'Done!'));
route_exported_filtered_profile=[pwd '\' new_file_identifier '.smd'];
end

