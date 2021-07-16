clc;
close all;

hfig = figure('units','pixels',...
              'position',[730 600 400 150],...
              'menubar','none',...
              'name','GUI_17',...
              'numbertitle','off',...
              'resize','off');
          
% Menus

filemenu = uimenu('Label','File');
uimenu(filemenu,'Label','Open','Callback',@openFile);
uimenu(filemenu,'Label','Exit','Callback',@exitFigure);

helpmenu = uimenu('Label','Help');
uimenu(helpmenu,'Label','Help Notes','Callback',['help ' mfilename]);
uimenu(helpmenu,'Label','About','Separator','on','Callback',@aboutFcn);




function openFile(~, ~)
%folderName = {10};
sel = 1;
i= 1;
rootDir = "C:\Users\khazi\Documents\MATLAB\Programing IWG Khazi\2 - Script 2 undistorting images in MATLAB";
folderNameList = [];
folderPath = [];
filePath = [];
fullPath = [];

while(sel)
    
    folderName{i} = uigetdir('*.m','Select Folders');
    folder = fullfile(folderName{i});
    
    %out = regexp(folderName{i},'\','split');
    %folderNameList = [folderNameList, out(end)];
  
   [file,path,indx] = uigetfile("*.*",'Select One or More Files','MultiSelect', 'on');
    
    if isequal(file,0)
      disp('User selected Cancel')
    else
      %disp(['User selected ', fullfile(path, file),' and filter index: ', num2str(indx)])
      
    end    
    
    %folder = fullfile(rootDir, file);
    folderPath = [folderPath, folder];  
    filePath = [filePath, file];
    
    for i = 1 : length(file)
        fullPath = [fullPath strcat(folder,'\',file(i))];
        %disp(strcat(folder,'\', file(i)));
        disp(fullPath);
    end 
        
%  S = dir(fullfile(folderName{i},'*'));
%  disp(S);
%  X = [S.isdir] & ~ismember({S.name},{'.','..'});
%  disp(X);
% N = {S(X).name};
% disp(N);
% % Y = randperm(numel(N));
% % Z = N(Y(1:4));

    i = i + 1;
    ans = questdlg('Do you want to continue further:','Yes', 'No');
    
    switch ans
        case 'Yes'
            sel = 1;
        case 'No'
            sel = 0;
        case 'Cancel'
            sel = 0;
            break;
    end

 end

%disp(folderPath);
disp(length(fullPath));
loadImages(fullPath);
 
%out = regexp(folderNameList{1},'\','split');
%disp(out(end));
  
end


function exitFigure(~, ~)

closereq;
end

function loadImages(fPath)
%rootDir = "C:\Users\khazi\Documents\MATLAB\Programing IWG Khazi\2 - Script 2 undistorting images in MATLAB\";
%imgPath = strcat(rootDir, fPath)
class(fPath)
%for i = 1:length(fPath)
%    figure;
%x = imread(strcat(fPath(i),'\'));
%pause(2);

disp(fPath);
%end 
end 
