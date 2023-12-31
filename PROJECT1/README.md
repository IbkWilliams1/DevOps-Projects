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


```
sudo apt ugrade

```


![Alt text](images/sudo.png)


## 2.  pwd command

The "pwd" command prints the full name (the full path) of current/working directory.

To do this, enter the following command.

```
pwd

```

![Alt text](images/pwd.png)

## 3. cd command
To navigate through the Linux files and directories, use the **cd** command with option for either subdirectory or parent directory. Depending on your current working directory, it requires either the full path, and  
presently I'm in `/home/ibukun`. Therefore to navigate to subdirectory of ibukun *secondFolder* with fullpath.
To do so, enter the following command:

```
cd Desktop/First_folder/secondFolder
```

![Alt text](images/cd_2_sub_with_fullpath.png)


NB: Running `cd` *command* in the subdirectory without an option will take you to the home folder. Keep in mind that only users with sudo privileges can execute it.
As you are currently in **/home/ibukun/Desktop/First_folder/secondFolder**
To do so, enter the following command:
`cd`

![Alt text](images/cd_wtout_option.png)

Here are some shotcuts to you navigate.
To move up directory, enter the below command

```
cd ..

```

![Alt text](images/cd_up_directory.png)

To move to the previous directory, enter the below command


```
cd -

```

![Alt text](images/cd_2_previous_directory.png)

## 4.  ls Command

ls is a Linux shell command that lists directory contents of files and directories.  It provides valuable information about files, directories, and their attributes.
### Syntax of `ls` command in Linux 

#### ls [option] [file/directory]

Description
```
ls -R   

ls -a

ls -lh

```

![Alt text](<images/ls with options.png>)

## 5.  cat Command
Cat command is used to display the content of files

### - Display a FIle content with cat command
![Alt text](images/cat_4_view_file.png)

### - Create a File with cat command
To create a file called “report.txt”, Type:

```
cat > report.txt
```


Type the following text:

``This is a test in the report.txt.``

You need to press [CTRL] + [D] i.e. hold the control key down, then tap d.

![Alt text](images/cat_create_file_wt_text.png)

Another way to use ***cat*** command

### - To Combine Two Or More Files and store the output in another file
![Alt text](images/cat_2_combine_files.png)

## 6. CP Command
cp command in linux is used to coppy files or directories
For examples 

`cp [sourcefile] [destination]`

```
cp [filename1.txt filename2.txt filename3.txt] [/home/username/Documents]
```

![Alt text](images/cp_2_another_destination.png)

If copying a directory, you can use "-r" option
For examples 
```
cp -r sourcedirectory destination
```


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

```
mv myscript.sh darey_script.sh
```

![Alt text](images/mv_rename.png)

##  8. mkdir command
-   To make a directory TeraBox, use this command

`mkdir TeraBox`

![Alt text](images/mkdir_2_directory.png)

-   To make a new directory "songs" inside TeraBox, type this command

```
mkdir TeraBox/song
```


![Alt text](images/mkdir_new_dir_in2_dir.png)

## 9. rmdir Command

-   This command is used to permanently delete an empty directory.

```
rmdir songs/
```
![Alt text](images/rmdir_empty.png)

-   To delete directory that has content, cd to the super-directory or parent directory, then type the following command

```
rm -r TeraBox/songs
```

![Alt text](images/rm_delete_dir.png)

## 10. Touch command

This is use to create file or files by separating the files with a space
First list the content of TeraBox and it return nothing. Then **cd into TeraBox**
Type the following command

```
touch file1.txt file2.txt
```

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

```
find /home -name file1.txt
```

![Alt text](images/find.png)

## 13. Grep COmmand

Grep can be use to find or search a regular expression or string in a text file. This is demonstrated below.
Run the command below

```
grep Warrior project.sh
```

![output](images/grep.png)

As you can see, grep has not only searched and matched the string “Warrior” but has also printed the lines in which the string appears.

## 14.  df Command:
The syntax below is use to check the current directory's system disk space usage in a human-readable format

```
df -h
```

`df [options] [file]`

![Alt text](images/df.png)
##  15. du command:
Du command run  to identify which part of system uses the storage excessively.
Adding a flag to the du command will modify the operation such as below.

![Alt text](images/du_with_options.png)

##  16. Head Command

This command allows you to view the first 10 lines in a text.
Adding an option lets you change the number of lines shown. 
Here's the general syntax:

*head [option] [file]*

For instance, you want to view the first ten lines of history.txt, located in the /home/ibukun
To know the full content of history file

RUN this command

```
cat history.txt
```

![Alt text](images/history_view.png)

Then type this command to see the first ten lines

```
head history.txt
```

![Alt text](images/history_head.png)

The head command is also used
to output piped data to the CLI.

```
cat historty.txt | head
```

![Alt text](images/some_command_piped_2_head.png)

This will take the output of *cat history.txt* and display only the first five lines of that output specifying the number of lines you want to display with the -n option, like this:

```
cat history.txt | head -n 5
```

![Alt text](images/head_view_n_line.png)

##  17. tail Command

This command is like a reverse of *head command* . It allows you to view the last 10 lines in a text.
Adding an option lets you change the number of lines shown. 
Here's the general syntax:

*tail [option] [file]*

```
tail history.txt
```

![Alt text](images/tail_view.png)

This will take the output of *cat history.txt* and display only the last two lines of that output specifying the number of lines you want to display with the -n option, like this:


```
cat history.txt | tail -n 2
```

![Alt text](images/tail_view_n_line.png)

##  18. diff Command

diff stands for difference. This command is used to display the differences in the files by comparing the files ***line by line***

```
diff - compare files line by line
```

***diff [options] File1 File2***

`OPTION`
Linux system offers two different ways to view the diff command output i.e. context mode and unified mode. 

Applying diff command without any option we get the following output: 

![Alt text](images/diff.png)


Applying diff command with -c option we get the following output: 

-   *context mode*

![Alt text](<images/diff -c.png>)

-   *unified mode.*

 It is similar to context mode but it doesn’t display any redundant information or it shows the information in concise form. 

Applying diff command with -u option we get the following output: 

![Alt text](<images/diff -u.png>)

The first file **superman** is indicated by —, and the second file **superman2** is indicated by +++. 
The first two lines of this output show us information about **superman** and **superman2**. It lists the file name, modification date, and modification time of each of our files, one per line. 
After that the next line has two at sign @ followed by a line range from the first file (in our case lines 1 through 3, separated by a comma) prefixed by – and then space and then again followed by a line range from the second file prefixed by + and at the end two at sign @. Followed by the file content in output tells us which line remain unchanged and which lines needs to added or deleted(indicated by symbols) in the file 1 to make it identical to file 2. 

##### The OPTION can  be any of these below 
Depending on the task to achieve
```-- normal
output a normal diff (the default)

-q, -- brief
report only when files differ

-s, -- report-identical-files
report when two files are the same

-c, -C NUM, -- context[=NUM]
output NUM (default 3) lines of copied context

-u, -U NUM, -- unified[=NUM]
output NUM (default 3) lines of unified context
```

##  20. tar command:
1. ###  Tar command to archive files

The tar command archives multiple files into a TAR file - a common Linux format similar to ZIP, with optional compression.

Here's the basic syntax:
To compress files e.g `superman` and `superman2` to make `super.tar`
```
tar [options] [archive_file] [file or directory to be archived] 
```
```
tar cvf /home/ibukun/Desktop/super. tar superman superman2
```
![Alt text](images/tar.png)

The ***options***

-   ***c*** means create file

-   ***v*** means view file

-   ***f*** means file

the above code will create a archived super.tar file on the Desktop directory.

2. #### Tar command to extract file
 
 ```
 tar xvf super. tar 
```

While the above command will extract super.tar file to same directory.

![Alt text](images/tar_extract.png)

![Alt text](<images/tar viewed.png>)

The ***options***

-   ***x*** means extract file
    -   To compress super.tar 
    ```
    gzip super.tar
    ```
    -   To list the content of super.tar

    ``` 
    tar -tvf super.tar 
    ```
    -   To archive and add to existing archive

    ```
    tar -uvf super.tar spoon
    ```
    ![Alt text](images/2_extract.png)
    ![Alt text](images/2_extract_2.png)

File Permissions and Ownership

##  21. chmod command:
This is a command that modifies a file or directory's read, write and execute permissions.Each file in Linux is associated with 3 user classes - Owner, group member, and others.
The bellow command shows the level of permissions on files and directories 
```
ls -ltr
```
```
chmod 000 practiky  
```
![Alt text](images/chmod_1.png)
![Alt text](images/chmod_2.png)

The permission of project.sh is modified by the following command

```
chmod 400 project.sh
```
![Alt text](images/chmod_3.png)

##  22. chown command:
This is used to change the ownership of a file, directory or symbollic link to a specified username.
The existing owner of assignment1 file is root user, root group.
Run the following command to change the user from root to ibukun

```
sudo chown ibukun assignment1
```
![Alt text](images/chown_1.png)

##  23. jobs command

The command can be jobs [-lnprs]

```
jobs -l
```
```
jobs -r
```
![Alt text](images/jobs.png)

##  24. kill

The kill command is use terminate a process. To terminate a process you must know (PID) process ID.

Run below command to identify the process and ID
```
ps -C
```
and below will kill the processs
```
kill [PID]
```
![Alt text](images/kill.png)

##  25. ping command

```
ping [option] [hostname_or_IP_address]
```

The ping command is use to test the reachability of a host on internet Protocol (IP) network.

For example:

```
ping google.com
```
![Alt text](images/ping1.png)
To stop the command, you can usually press Ctrl + C

##  26. wget command

The  wget command in linux  is used to download files from the internet. It works in the background without hindering others processes

```
wget [URL]
```
For examples:

```
wget https://nhcps.com/wp-content/uploads/2023/08/CPR-Handbook.pdf
```
![Alt text](images/wget.png)

This command will download the specified pdf file from the given directory

##  27. uname command
The uname command in Linux is used to display system information. When used without any options, it provides basic information about the operating system. To use it, open a terminal and type:

RUN

```
uname
```
You can also use various options with uname to get specific information. For example:

To display the operating system name, use:

```
uname -s
```
To show the kernel name, use:

RUN

```
uname -r
```

![Alt text](images/uname.png)

##  28. Top command

The ***top*** command in Linux provides a dynamic, rea-time view of system processes. It displays information  such as CPU usage, memory usage, and a list of processes. Pressing 'q' exists the top command.
![Alt text](images/top.png)

##  29. history command
With history, the system will list up to 500 previously executed commands, allowing you to reuse them without re-
entering.
This command supports many options, such as:

-c clears the complete history list. -d offset deletes the history entry at the OFFSET position. -a appends history lines.
To run it, enter the command below:

```
history
```
![Alt text](images/history.png)

To delete an history position  For example ***258*** position 
run it, enter the command below:

```
history -d 258
```
![Alt text](images/history_position_258.png)

Run history to confirm deletion.

![Alt text](images/history_position_258_delete_confirm.png)

##  30. man command

The man command provides a user manual of any commands or utilities you can run in Terminal, including the name,
description, and options.

It consists of nine sections:

Executable programs or shell commands System calls Library calls Games Special files File formats and conventions System
administration commands Kernel routines Miscellaneous To display the complete manual, enter:

```
man man
```
![Alt text](images/man_man.png)

Press 'q' to quit

##  31. echo command

The ***echo*** command in Linux is used to display text on the terminal. For example:

```
echo Oluwafemi Ibukun
```
```
echo 'I am learning Linux for DevOps'
```
![Alt text](images/echo.png)

##  32. zip, unzip commands:

zip command to compress your files into a ZIP file, a universal format commonly used on Linux. It automatically
choose the best compression ratio.

The zip command is also useful for archiving files and directories and reducing disk usage.

To use the zip command to archive files and directories in Linux, you can use the following syntax:

list the content of the Desktop directory to see the files and sub-directories

```
ls
```

```
zip file2Achieve.zip superman history.txt
```
![Alt text](images/zip_files2zip.png)
![Alt text](images/zip_files2zip2.png)
The above create file@Achieve.zip containing files "superman" and "history.txt" 
To include directories and thier contents, I use the '-r' (recursive) option:

```
zip -r zippedirectory.zip practiky/ TeraBox/
```
![Alt text](images/zippedirectory.png)

##  33. hostname command:

Run the hostname command to know the system's hostname. I can execute it with or without an option. Here's the

general syntax:

***hostname [option]***

There are many optional flags to use, including:

-a or -alias displays the hostname's alias. -A or -all-fqdns displays the machine's Fully Qualified Domain Name (FQDN). -i or
-ip-address displays the machine's IP address. For example, enter the following command to know your computer's IP
address:

```
hostname -i
```
![Alt text](images/hostname.png)

##  34. useradd, userdel commands:

Linux is a multi-user system, meaning more than one person can use it simultaneously. useradd is used to create a new
account, while the passwd command allows you to add a password. Only those with root privileges or sudo can run the
useradd command.

When you use the useradd command, it performs some major changes:

Edits the /etc/passwd, /etc/shadow, /etc/group, and /etc/gshadow files for the newly created accounts. Creates and
populates a home directory for the user. Sets file permissions and ownerships to the home directory. Here's the basic
syntax:

***useradd [option] username***

```
sudo useradd lois
```
![Alt text](images/usseradd.png)

##  35. apt-get command

```
apt-get
```
![Alt text](images/apt-get.png)

##  36. nano, vi, jed command

'nano' is a simple text editor that is commonly used in Unix-based operating systems, including Linux. It's user-friendly and easy to use, making it a popular choice for quick edits and simple text manipulation. 
nano and vi come with the operating system, while jed has to be installed.

The nano command denotes keywords and can work with most languages. To use it, enter the following command:
1. For opening a file

   ```
    nano project.sh
    ```
![Alt text](images/nano_command.png)
2. Saving a file:

To save changes, press ***Ctrl + O*** (Hold down the Control key and press the O key).
Press Enter to confirm the file name.
The basic syntax
3. Exiting nano:
To exit nano, press Ctrl + X. If you have unsaved changes, nano will prompt you to save before exiting.
4. Cut, copy, and paste:

***Ctrl + K:*** Cut the current line.
***Ctrl + U:*** Paste the cut text at the cursor.

![Alt text](images/nano_editor.png)

##  37. alias, unalias commands:

alias allows you to create a shortcut with the same functionality as a command, file name, or text. When executed, it
instructs the shell to replace one string with another.

To use the alias command, enter this syntax:

***alias Name=String***

Type the below command

```
alias openthem="ls -lh"
```
It can be just one character to store your command like:
```
alias l="ls -lh"
```
![Alt text](images/alias_4_command.png)

Typing 'alias' will list all the default aliases depending on the distribution

![Alt text](images/alias.png)

On the other hand, the unalias command delete the existing alias.
Here is what the general syntax looks like:

***unalias [alias_name]***

Type the below command 

```
unalias openthem
```

##  38. su command:

The switch user or su command allows you to run a program as a different user. It changes the administrative account in
the current log-in session. This command is especially beneficial for accessing the system through SSH or using the GUI
display manager when the root user is unavailable.

Here's the general syntax of the command:

***su [options] [username [argument]]***

```
sudo su sam
```
![Alt text](images/su.png)
![Alt text](images/su_option.png)

##  39. htop command
'htop' is a command-line utility in Linux used for viewing and managing system processes. It provides an interactive, colorized display that allows you to monitor system resource usage in real-time. Here are some key features and usage information for the htop command:
```
sudo apt-get install htop
```
The above  command must be Run to install it on Debian-based systems, e.g ubuntu like mine
![Alt text](images/htop_not_found.png)
![Alt text](images/htop_install.png)

***Running htop:***
Once installed, you can run htop by simply typing the command in the terminal:

```
htop
```
![Alt text](images/htop_runing.png)
####    Key features of htop:
1.  Color-coded display:
-   Different colors represent different types of resource usage, making it easier to identify processes.

2.  Process list:
-   The main part of the display shows a list of processes with information such as process ID (PID), user, CPU usage, memory usage, etc.

3.  Column sorting:
-   You can sort the process list based on various criteria such as CPU usage, memory usage, process age, etc. Use arrow keys to navigate and F6 to choose the sort column.

4.  Search functionality:
-   Press F3 to search for a specific process by name.
5.  Process tree:
-   You can visualize the process hierarchy as a tree to understand the parent-child relationships between processes.
6.  Resource meters:
-   Visual meters at the top of the screen show CPU, memory, and swap usage in real-time.
7.  Process manipulation:
-   You can send signals to processes (kill, stop, continue) directly from the htop interface.

**Basic htop controls:**

Arrow keys: Navigate through the process list.
-   F1: Help menu with a list of keybindings.
-   F2: Setup menu for configuration options.
-   F3: Search for a process by name.
-   F4: Filter processes by various criteria.
-   F5: Tree view of processes.
-   F6: Choose a column for sorting.
-   F9: Kill a process (sends a signal).
-   F10: Quit htop.

##  40. ps command
The **ps** command is a command-line utility in Unix-like operating systems, including Linux, that provides information about currently running processes. It can display information such as process IDs (PIDs), terminal associated with the process, CPU and memory usage, and more

Here are some common uses of the ps command:
1. Display Information for All Processes:

```
ps aux
```
![Alt text](images/ps_aux.png)
This command shows a detailed list of all processes running on the system.

2.  Display Information for a Specific Process:
```
ps -p <PID>
```
![Alt text](images/ps_PID.png)
Replace '<PID>' with the actual process ID. This command shows detailed information about a specific process.

3. TreeView Processes
This command displays processes in a tree-like structure, showing parent-child relationships.

```
ps auxf
```
This command below sorts processes by CPU usage, with the most CPU-intensive processes at the top.
```
ps aux --sort=-%cpu
```
![Alt text](images/ps_aux_CPU_usage.png)
