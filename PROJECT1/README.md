# Basic Linux Commands Implementation on ubuntu terminal
## Pre-requisites
-    Linux Operating System:
     Install a Linux distribution on your computer or set up a virtual machine. There are various Linux distributions available such as Ubuntu, CentOS, Fedora, Debian, etc.I Choose the one **[ubuntu]** that suits my needs and install it.
-   Terminal Emulator: Ubuntu comes with a default terminal emulator called "GNOME Terminal." You can access it by pressing Ctrl + Alt + T 
-   User Account: Make sure you have a user account with administrative privileges (sudo access). This will allow you to execute
    commands with elevated permissions when necessary.

#   FILE MANIPULATION

## 1. sudo command

sudo: Shot for superuser do, this is used to perform tasks that requires administartive or root priviledgies 
Upadte a list of packages in package manager

`run` 

`sudo apt ugrade`

![Alt text](images/sudo.png)

#   pwd command

The "pwd" command prints the full name (the full path) of current/working directory.

`run`

`pwd`

![Alt text](images/pwd.png)

# cd command
To navigate through the Linux files and directories, use the **cd** command. Depending on your current working directory, it requires either the full path 
Currently I'm in `/home/ibukun` . Therefore to navigate to subdirectory of ibukun *secondFolder* with fullpath.
To do so, enter the following command:

`cd Desktop/First_folder/secondFolder`

![Alt text](images/cd_2_sub_with_fullpath.png)


## NB:

Running `cd` *command* in the subdirectory without an option will take you to the home folder. Keep in mind that only users with sudo privileges can execute it.
Let's say you're in /home/ubuntu and want to go to a new subdirectory of ubuntu. 