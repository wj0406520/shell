#脚本加注释和解注释(之后再写)

if [ ! -e $1 ] || [ -z $1 ]
then
  echo -bash:$0: $1 is not a file
  exit 0
fi

var=''
while read -r line
do
 #这里用2个中括号，这样$line里面的内容不会当成命令去执行
 if [[ -z $line ]]
 then
    var=$var$line;
    continue
 fi
 var=$var\#$line"\n"
done < $1
echo -e $var > $1


exit 0
for line in $(cat $1)
do
 echo $line
done

exit 0
for line in `cat $1`
do
 if [ -z $line ]
 then
    echo '';
    continue
 fi
 echo \#$line
done

exit 0
while read -r line
do
 if [ -z $line ]
 then
    echo '';
    continue
 fi
 echo \#$line
done < $1


