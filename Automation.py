# -*- coding: utf-8 -*-
"""
Spyder Editor

Dies ist eine temporäre Skriptdatei.
"""

#import numpy as np
import os 
import shutil
#import subprocess, sys
from pywinauto.application import Application  
import pyautogui                                    # Control the Mouse and Keyboard
import time

curDir = os.getcwd()
rootPath = "C:\\Users\\khazi\\PIV_matlab"

# Path to the virtual dub exe file 
videoDir = rootPath + "\\1 - Script for virtual dub\\DV-eck-A60-l2_3-AB6-I0.9-T-Z1- 1"

Vlist = []
Videolist = []
Videolist_new = []
orignalDir_path = []
videoDir_path = []
videoPath = []


def creatDirectory():
    #fileNames = [Fname.rsplit(".MP4",1)[0] for Fname in os.listdir(videoDir)]
    # Creates the list of all the elements in the folder 
    Vname = os.listdir(videoDir)
    
    # Create a lists only those file with .mp4 
    for count, videoName in enumerate(Vname):
        if videoName.endswith(".MP4"):
            Videolist.append(videoName)
    print(Videolist)


    # creates the folder for each video with the same name as the video file
    # creates the folder only if it does not exist, if previously exists then it ignores
    for count, videoFile in enumerate(Videolist):
        if not os.path.exists(curDir):
            os.mkdir(videoFile)
        else:
        # If already folder exists then pass
           pass
        
    #print(curDir)
    curDir_new = curDir + "\\"
    #print(curDir_new)


    for count, videoFile in enumerate(Videolist):
        videoPath = curDir_new + videoFile + "\\"
        videoDir_path.append(videoPath)
        orignalDir = videoPath + "orignal"
        orignalDir_path.append(orignalDir)
        
        if len(os.listdir(videoPath)) == 0:
            #orignalDir_path.append(os.path.join(orignalDir,"orignal"))
            #os.makedirs(os.path.join(orignalDir,"orignal"))
            os.makedirs(orignalDir)
        else:
            pass
    return(1)

def loadVideo():
    time.sleep(2)
    # starts the applicaion in backend, please change the path as per your computer
    app = Application(backend = "uia").start("C:\\Users\\khazi\\Desktop\\VirtualDub-1.10.4\\VirtualDub.exe")
    time.sleep(2)

    # Random click on the virtual window 
    currentMouseX, currentMouseY = pyautogui.position()
    print(currentMouseX)
    print(currentMouseY)
    #time.sleep(5)fOSvideo1.MP4
    time.sleep(2)
    
    # Maximise the virtual dub software 
    pyautogui.hotkey('alt', 'space', 'x')
    time.sleep(2)
    pyautogui.press('enter')
    time.sleep(2)

    #pyautogui.moveTo(33, 133)
    # Mouse click on  file 
    pyautogui.click(907,508)
    time.sleep(5)
    
    # Mouse click and File open operation
    pyautogui.hotkey('alt', 'f', 'O')
    time.sleep(3)
    
    # Change it only if required 
    #pyautogui.hotkey('alt', 'S')
    #time.sleep(3)
    #pyautogui.typewrite('Desktop')
    #time.sleep(3)
    #pyautogui.press('enter')

    # Mouse click
    pyautogui.hotkey('alt', 'n')
    time.sleep(3)
    # Search for the .spyder-py3 file 
    pyautogui.typewrite('.spyder-py3') 
    time.sleep(3)
    pyautogui.press('enter')
    
    # Mouse click
    pyautogui.hotkey('alt', 'n')
    time.sleep(3)
    # Search for the videolist file
    pyautogui.typewrite(Videolist[2]) 
    time.sleep(3)
    pyautogui.press('enter')
    time.sleep(3)
    
    # Mouse Click
    pyautogui.hotkey('alt','t')
    time.sleep(3)
    # 11 times down arrow key
    for i in range(11):
        pyautogui.press('down')
    time.sleep(3)
    pyautogui.press('enter')    
    time.sleep(3)
    
    # Mouse click
    pyautogui.hotkey('alt','n')
    time.sleep(3)
    # Search for the video3.mp4 file
    pyautogui.typewrite("video3.MP4")
    time.sleep(3)
    pyautogui.press('enter')
    
    #pywinauto.typewrite()
    #pyautogui.moveTo(48, 300)

    
    return (1)

def extractFrame():
    
    # Mouse click export
    pyautogui.hotkey('alt','f','x')
    time.sleep(3)
    pyautogui.press('enter')
    time.sleep(3)
    
    # Type the file name in the image output filter 
    pyautogui.typewrite(Videolist[2])
    time.sleep(3)
    
    # File name suffix 
    pyautogui.hotkey('alt','s')
    time.sleep(3)
    # Only selects .jpg
    pyautogui.typewrite(".jpg")
    time.sleep(3)
    # set to default=4,  Minimum number of digits  
    pyautogui.hotkey('alt','n')
    time.sleep(3)
    pyautogui.typewrite("4")
    
    # Enter the directory path
    pyautogui.hotkey('alt','D')
    time.sleep(3)
    pyautogui.typewrite("C:\\Users\\khazi\\.spyder-py3\\video3.MP4\\orignal")
    time.sleep(3)
    
    # Check if the folder is empty or not 
    if len(os.listdir("C:\\Users\\khazi\\.spyder-py3\\video3.MP4\\orignal")) == 0:
          # Select the .JPG format
          pyautogui.hotkey('alt','J')
          time.sleep(3)
          pyautogui.press('enter')
    else:    
       #shutil.rmtree("C:\\Users\\khazi\\.spyder-py3\\video3.MP4\\orignal")
       print("folder not empty")
    
    
  
    #app.kill()
    
    
    
    return(1)


# Main code starts here

creatDirectory()    
time.sleep(3)
loadVideo()
time.sleep(5)
extractFrame()


