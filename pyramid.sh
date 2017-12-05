#屏幕打印金字塔，问题和解释
NUMBER=${1}

#字符串和0相加依然等于0
#类似"1aa"这样的字符串let会报错，所以我把错误给屏蔽了
let n=${1}+0 2>/dev/null
if [[ ${n} -eq 0 ]]
then
  echo -base: ${1} is not number or 0
  exit 2
fi
if [[ ${1} -gt 10 ]]
then
  echo -base: ${1} is bigger 10
  exit 2
fi
repeat (){
   let all=${NUMBER}+${1}
   for (( i=1; i<${all}; i++ )){
      let num=${NUMBER}-${1}

      #在${i}大于10的情况下，这个公式就出问题了 
      #因为[[]]是比较2个字符串大小的，并不是比较数字
      #if [[ ${i} > ${num} ]]

      if [ ${i} -gt ${num} ]
      then
        echo -n \*
      else
        echo -ne " "
      fi
   }
}

for ((a=1; a<=${NUMBER}; a++)){
  repeat ${a}
  echo ''
}
exit 0

#在这种情况下，输出的结果会出乎意料
#函数中的${i}和for中相同，值被修改
#2个${i}在同一个域下面
for ((i=1; a<=${NUMBER}; i++)){
  repeat ${i}
  echo ''
}

exit 0

#有关{1..6}这个是固定的写法
#不能写成{1..${NUMBER}}
for i in {1..6}
do
 repeat ${i}
 echo ''
done
exit 0


