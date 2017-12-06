#屏幕打印实心棱形，问题和解释
NUMBER=${1}

#字符串和0相加依然等于0
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
let n=${1}%2
if [[ ${n} -eq 0 ]]
then
  echo -base: ${1} is not odd
  exit 2
fi


repeat (){
   let all=${NUMBER}+${1}
   for (( i=1; i<${all}; i++ )){
      let num=${NUMBER}-${1}

      if [ ${i} -gt ${num} ]
      then
        let line=${1}-${NUMBER}
        if [ ${1} -gt ${NUMBER} ] && [ ${i} -le ${line} ]
        then
          echo -ne " "
        else 
          let end=${all}-${1}*2+${NUMBER}*2
          if [ ${i} -ge ${end} ]
          then
             break
          fi
          echo -n \*
        fi
      else
        echo -ne " "
      fi
   }
}

for ((a=1; a<=${NUMBER}*2-1; a++)){
  repeat ${a}
  echo ''
}
exit 0

