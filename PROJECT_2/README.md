##  INITIALIZING A REPOSITORY AND MAKING COMMITS
### WHAT IS GIT?
Git is a type of version control system designed to monitor alterations made to your code, facilitating collaboration among developers. Prior to Git, alternative technologies like SVN addressed this issue, with Git taking a distinct approach. Unlike SVN, Git enables developers to create individual copies of the central repository, earning it the classification of a Distributed Version Control System (DVCS).

### INITIALIZING A GIT REPOSITORY
Before we can initialize a git repository, we must have installed git on our computer. After installing, to initialize a repo. We follow the below steps;

-   Open a terminal on the computer e.g Git bash; the default terminal after downloading and installing Git.

-   We open the terminal and create a working folder or directory e.g DevOps folder using this command 
```
mkdir DevOps.
```

-   After creating the folder or directory, we'll have to change or move into the working directory using this command 
```
cd DevOps.
```

-   While inside the folder/directory, we use the below command to initialize our repository.
```
git init
``` 
![Alt text](images/initialization.png)

![Alt text](images/git_repo.png)

##  MAKING THE FIRST COMMIT
In the picture above, we successfully created our working directory and initialized a git repository. Now we will make our first commit. In git, commit simply means saving the changes (adding, modifying or deleting files or text) you made to your files. When we make a commit, git takes a snapshot of the current state of our repository and saves a copy in the .git folder inside our working directory().
let's make our first commit by following the below steps;

-   Inside our working directory, we create a new file called index.txt using this command touch index.txt.

-   After creating, input any text in the text file.

-   Then we add the changes to git staging area using this command git add .

-   To commit the changes to git, we use this command git commit -m "my first commit on index.html". The -m option/flag is used to add a commit message. The commit message provides context about the commit.

![Alt text](images/first_commit.png)