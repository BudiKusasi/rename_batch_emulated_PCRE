# GNU-extended regex controlled rename and copy operation globally, in bulk, using Linux Bash script  
Requirements:  
Bash, find, sed, mkdir, and mv or cp, use mv to rename, use cp to copy.  
As Windows port, get MSYS2 on https://sourceforge.net/projects/msys2/files/latest/download?source=directory As Mac port, get on https://www.macports.org or Homebrew https://brew.sh/  
  
Copy the Bash script and paste inserting it into ~/.bashrc file  
The script here is for renaming. For copying, duplicate the function namedly 'ren' and change to what you like for instance 'copy', use that instead of 'ren' shown below. In line 21 and 29, replace 'mv'with 'cp'  

# Usage  
ren [mv option] SOURCE DEST  
literal rename operation by mv command

ren [mv option] 'SOURCE  ;;DEST'  

or if to duplicate and change the function name to copy:  
copy [cp option] 'SOURCE  ;;DEST'  

rename GNU-extended regex pattern SOURCE to become DEST which may backrefer to any captured group in the SOURCE  
Note the doubled semicolon (;;) as the start of destination field and the enclosure by quote pair either ' ' or " "  

The mv option if any is a spaceless field/string of single or multi option put sequentially e.g:  
-fu if the DEST name exists, force to overwrite it only if SOURCE is newer so it will be Updating  
type mv --help, for explanations  

The searching is ignoring (insensitive to) the letter case. It'd accept either absolute or relative path argument whose patterns will match. As for relative path argument, it'll be concatenated directly thus it must be on current directory, if it's meant to be recursively anywhere under current directory, prefix it with keyword: **  
E.g,  
Let /home/hello folder containing files:  
$ cd /home/hello  
world001  
world002  
wood001  
wood002  
wine007  

In absolute path reference:  

ren ':(/home/.*?lo/\w+?d)\d+(\d) :\1xxx\2'  

So /home/hello will be containing:  
worldxxx1  
worldxxx2   
woodxxx1  
woodxxx2  
wine007  

For its relative path usage:  

ren ':(w\w+?d)\d+(\d) :\1xxx\2'  
  or  
ren ':(**w\w+?d)\d+(\d) :\1xxx\2'  

But the latter will also search and rename /home/hello/world/world007 to /home/hello/world/worldxxx7  if such exists   

It'd always backup by renaming the target DEST if the name exists by adding '_old' suffix  

DISCLAIMER:  
It's been sucessfully tested though not exhaustively and just provided "as is".   
Do on your own risk, you'd better back up your data first. No guarantee for perfect accuracy and no warranty for data loss and damage.
