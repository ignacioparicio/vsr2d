function [ date_def, time_def ] = current_date_and_time( ~ )
% Returns the current date and time in an appropriate format

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
 end

