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

## 2.  pwd command

The "pwd" command prints the full name (the full path) of current/working directory.

To do this, enter the following command.

`pwd`

![Alt text](images/pwd.png)

## 3. cd command
To navigate through the Linux files and directories, use the **cd** command with option for either subdirectory or parent directory. Depending on your current working directory, it requires either the full path, and  
presently I'm in `/home/ibukun`. Therefore to navigate to subdirectory of ibukun *secondFolder* with fullpath.
To do so, enter the following command:

`cd Desktop/First_folder/secondFolder`

![Alt text](images/cd_2_sub_with_fullpath.png)


NB: Running `cd` *command* in the subdirectory without an option will take you to the home folder. Keep in mind that only users with sudo privileges can execute it.
As you are currently in **/home/ibukun/Desktop/First_folder/secondFolder**
To do so, enter the following command:
`cd`

![Alt text](images/cd_wtout_option.png)

Here are some shotcuts to you navigate.
To move up directory, enter the below command

`cd ..`

![Alt text](images/cd_up_directory.png)

To move to the previous directory, enter the below command

`cd -`

![Alt text](images/cd_2_previous_directory.png)

## 4.  ls Command

ls is a Linux shell command that lists directory contents of files and directories.  It provides valuable information about files, directories, and their attributes.
### Syntax of `ls` command in Linux 

#### ls [option] [file/directory]

Description

`ls -R`   

`ls -a`

`ls -lh`

![Alt text](<images/ls with options.png>)

## 5.  cat Command
Cat command is used to display the content of files

### - Display a FIle content with cat command
![Alt text](images/cat_4_view_file.png)

### - Create a File with cat command
To create a file called “report.txt”, enter:

`cat >report.txt`

Type the following text:

``This is a test in the report.txt.``

You need to press [CTRL] + [D] i.e. hold the control key down, then tap d.

![Alt text](images/cat_create_file_wt_text.png)

Another way to use "cat" command

### - To Combine Two Or More Files and store the output in another file
![Alt text](images/cat_2_combine_files.png)

## 6. cp Command
cp command in linux is used to coppy files or directories
For examples 

`cp sourcefile destination`

`cp filename1.txt filename2.txt filename3.txt /home/username/Documents`

![Alt text](images/cp_2_another_destination.png)

If copying a directory, you can use "-r" option
For examples 

`cp -r sourcedirectory destination`

![Alt text](images/cp_directory_2_another_destination.png)

## 7. mv command
The primary use of mv command is to move and rename files and directories. Additionally, it doesn't produce an output upon execution.
For example.

-   mv command for moving file

`mv sqlite.sh /home/username/Documents directory`

![Alt text](images/mv_move.png)

-   mv command for renaming file

change directory "cd" to the Documents, list the content of the directory with ls command and then rename 
myscript.sh to darey_script.sh with the bellow command

`mv myscript.sh darey_script.sh`

![Alt text](images/mv_rename.png)

##  8. mkdir command
-   To make a directory TeraBox, use this command

`mkdir TeraBox`

![Alt text](images/mkdir_2_directory.png)

-   To make a new directory "songs" inside TeraBox, type this command

`mkdir TeraBox/song`

![Alt text](images/mkdir_new_dir_in2_dir.png)

## 9. rmdir Command

-   This command is used to permanently delete an empty directory.

`rmdir songs/`

![Alt text](images/rmdir_empty.png)

-   To delete directory that has content, cd to the super-directory or parent directory, then type the following command

`rm -r TeraBox/songs`

![Alt text](images/rm_delete_dir.png)

## 10. Touch command

This is use to create file or files by separating the files with a space
First list the content of TeraBox and it return nothing. Then **cd into TeraBox**
Type the following command

`touch file1.txt file2.txt`

ls the content to show what is inside

![Alt text](images/touch_2_create_file.png)

## 11. locate command

The locate command can find a file in the database system
To use locate command, first install 

![Alt text](images/locate_install.png)
![Alt text](images/locate.png)

## 12. find command
The find command to search for files within a specific directory and perform subsequent operations.

Use the following command

`find /home -name file1.txt`

![Alt text](images/find.png)

## 13. Grep COmmand

Grep can be use to find or search a regular expression or string in a text file. This is demonstrated below.
Run the command below

`grep Warrior project.sh`

![output](images/grep.png)

As you can see, grep has not only searched and matched the string “Warrior” but has also printed the lines in which the string appears.