#! /usr/bin/bash
ren(){
T=;i=;o=;c=-iregex;I=i;
for a
{
let i++
case ${a:0:2} in
-t) T=1;;
-c) c=-regex;I=;;
-[A-Sa-suvz]) o="$o $a";;
*)
if [[ "$@" =~ ' ;;' ]]
then
x=${a%[^ ]*;;*};x=$x${a:${#x}:1}
y=${a#* ;;}
# PCRE --> GNU-ext regex
x=`echo $x |sed -E 's/(\[.*?)\\\w([^]]*\])/\1a-z0-9\2/g; s/(\[.*?)\\\d([^]]*\])/\10-9\2/g ;s/\\\d/[0-9]/g; s/([^\])\.\*/\1[^\/]*/g; s/\*\*/.*/g'`
# below RHS after $ '\n' for Linux, Windows port (Msys/mingw): '\r\n', Mac port: '\r'
IFS=$'\n'
l==;while([ "$l" ])
do l=
	if [[ "$x" =~ ^\(*/ ]] ;then
		s=`echo $x |sed -E 's/([^[|*+\\{.]+).*/\1/ ;s/[()]//g'`	# s is the first longest literal
		for F in `find ${s%/*} -regextype posix-extended $c "$x" |head -n99`
		{
		t=`echo $F | sed -E "s|$x|$y|$I"`
		if [ $T ] ;then echo -e '\033[0;36m'Would rename '\033[0m'"$F -> $t"
		else 
			mkdir -p "${t%/*}"
			mv -bvS .old $o "$F" "$t"
		fi
		}
	else
		for F in `find ~+ -regextype posix-extended $c "$PWD/$x" |head -n99`
		{
		t=`echo $F | sed -E "s|$x|$y|$I"`
		if [ $T ] ;then echo -e '\033[0;36m'Would rename '\033[0m'"$F -> $t"
		else
			mkdir -p "${t%/*}"
			mv -bvS .old $o "$F" "$t"
		fi
		};fi
done
unset IFS
else
	t=${@: -1}
	mkdir -p "${t%/*}"
	mv -bvS .old $o ${@:i} $t
fi;;
esac
}
}
