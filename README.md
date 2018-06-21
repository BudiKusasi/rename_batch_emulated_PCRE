# PCRE2-controlled rename and copy operation in bulk and global using Linux Bash script  
Requirements:  
Bash, find, sed, pcre2grep, and mv or cp, to rename use mv, to copy use cp.  
As Windows port get MSYS2: https://sourceforge.net/projects/msys2/files/latest/download?source=directory  
As Mac port get on https://www.macports.org or Apple’s developer website or Mac App Store: https://itunes.apple.com/id/app/xcode/id497799835?mt=12&ign-mpt=uo%3D4 or Homebrew https://brew.sh/  

To get pcre2grep try type: sudo apt-get pcre2grep
For Windows port, on Msys2 terminal type
pacman -S mingw-w64-x86_64-pcre2
or get from many other sources such as: https://github.com/luvit/pcre2/blob/master/src/pcre2grep.c compile and install  
In any case rename it to 'gre' for brevity  

The script here is for renaming process. For copying one, duplicate the function namedly 'ren' and change it to word you like say 'copy', use 'copy' instead of 'ren' shown below. And replace 'mv' in line 22 and 27 with 'cp'   

# Usage  
ren [mv option] SOURCE DEST  
usual/literal rename operation by mv command

ren [mv option] ':SOURCE  :DEST'  
rename PCRE regex pattern SOURCE to become DEST which may backrefer to any captured group in SOURCE  
Note the double colon (:) starting the source/destination field and note the enclosure by pair of either quotes ' or " 

The mv option if any is a spaceless field/string of single or multi option put sequentially
e.g, -bu  Backup with add '_old' suffix if the target name exists  
  -fu such case above but Force to overwrite it only if SOURCE is newer than it i.e. it will Update  
type mv --help  

The searching is insensitive to (ignoring) letter case. It'd accept either absolute or relative path argument which pattern will match. If it's relative that argument will be concatenated directly so it means it's on the current directory only, if it's meant to be anywhere recursively under the current directory prefix it with regex .*?. It's good to read the comments within script.  
E.g,
Let /c/usr/bin/hello folder containing files:  
world001  
world002  
wood001  
wood002  
wine00

ren ':(/c/u.*?hel.*?w\w+?d)\d+(\d) :\1xxx\2'  

it'd be containing files:  
worldxxx1  
worldxxx2   
woodxxx1  
woodxxx2  
wine00  

In relative way:  
cd /c/usr/bin/hello  
ren ':(w\w+?d)\d+(\d) :\1xxx\2'  
  or  
ren ':(.*?w\w+?d)\d+(\d) :\1xxx\2'  

But the latter will also search and rename /c/usr/bin/hello/world/world001 to /c/usr/bin/hello/world/worldxxx1  if such exists   

DISCLAIMER:  
It was sucessfully tested though not exhaustively. It's just provided "as is". Do on your own risk, you'd better back up the data first. No guarantee for perfect accuracy and no warranty for data loss and damage.
