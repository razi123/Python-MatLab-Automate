function undistort_image_4()

clc;
clear ;
close all;

% Figure Window
T1 = clock;
STOPPED = 1;
TIME = 0;
LAPFLAG = 0;


hfig = figure('Name','MainWindow','Numbertitle','off','Position',[500 350 750 300],'Menubar','none','Resize','off');

uicontrol('Style', 'text', 'String', ' Do you want to undistort all the calibration images in black and white([],0) or as coloured images (1)??', ...
    'InnerPosition', [80,180,500,80], 'FontSize', 15, 'FontWeight', "bold");

ui1 = uicontrol('Style', 'ToggleButton', 'String', 'BLACK & WHITE', 'Position', [180,130,150,35], 'FontSize', 10, 'Callback', @pushButton);
ui2 = uicontrol('Style', 'ToggleButton', 'String', 'COLOURED', 'Position', [360,130,150,35], 'FontSize', 10, 'Callback', @pushButton);

% Text box to display the output file format 
UserInput = uicontrol(hfig,'Style','text','Position',[280 90 150 30],'BackgroundColor',[0.8 0.8 0.8],'FontSize',15);
% Text box to display the timer
DISPLAY = uicontrol(hfig,'Style','text','Position',[180 20 330 55],'BackgroundColor',[0.8 0.8 0.8],'FontSize',35);

% Hides handle from all callback functions
set(hfig,'HandleVisibility','off');

% Call's formatTimeFcn initially TIME=0
str = formatTimeFcn(TIME);
% Displays the timer in the text box
set(DISPLAY,'String',str);

% Start the Timer

% Initializes the timer with fixted rate mode
htimer = timer('TimerFcn',@timerFcn,'Period',0.001,'ExecutionMode','FixedRate');
start(htimer);

% function invokes for the callback pushbutton
% Prints button pressed on the command line
function pushButton(hObject, ~)
    fprintf('Button pressed = %s ', hObject.String); 
%   set(UserInput,'String',hObject.String);
end


% Invoked when timerFcn is called 
function timerFcn(varargin)
        if ~STOPPED
            % returns the time difference in seconds between GUI window popped up and pushbutton pressed
            time_elapsed = etime(clock,T1);
            % returns the timer in HH:MM:SS format 
            str = formatTimeFcn(TIME + time_elapsed);
            
            % If the 8th element in the str equals 5s then checks the
            % pushbutton user input, if no user input then select .jpg 
            % otherwise display the user input
            
            if(str(8) == '5')
                closeRequestFcn;
                set(UserInput,'String',"BLACK & WHITE");
                
            else
                 set(DISPLAY,'String',str);
                
                if(ui1.Value > 0)
                    set(UserInput,'String',"BLACK & WHITE");
                    closeRequestFcn;
                end
                
                if(ui2.Value > 0)
                    set(UserInput,'String',"COLOURED");
                    closeRequestFcn;
                end
            end
        end
end


function startFcn(varargin)
        % Start the Stopwatch
        if LAPFLAG
            T2 = clock;
            time_elapsed = etime(T2,T1);
            T1 = T2;
            TIME = TIME + time_elapsed;
        else
            T1 = clock;
        end
        STOPPED = 0;       
end

function str = formatTimeFcn(float_time)
        % Format the Time String
        float_time = abs(float_time);
        hrs = floor(float_time/3600);      % 1hr equals 3600 seconds
        mins = floor(float_time/60 - 60*hrs); % 1 min equals 60 seconds subtracts total minutes(60*hr) because 60 mins = 1hr
        secs = float_time - 60*(mins + 60*hrs);
        h = sprintf('%1.0f:',hrs);
        m = sprintf('%1.0f:',mins);
        s = sprintf('%1.3f',secs);
        if hrs < 10
            h = sprintf('0%1.0f:',hrs);
        end
        if mins < 10
            m = sprintf('0%1.0f:',mins);
        end        
        if secs < 9.9995
            s = sprintf('0%1.3f',secs);
        end
        str = [h m s];
end
    
function closeRequestFcn(varargin)
        % Stop the Timer
        try
            stop(htimer)
            delete(htimer)
        catch errmsg
            rethrow(errmsg);
        end
        % Close the Figure Window
        %closereq;
        
end

startFcn;

end
