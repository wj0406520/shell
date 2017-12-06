#判断一个数是不是素数
#时间复杂度为nlogn
NUMBER=${1}

#字符串和0相加依然等于0
let n=${1}+0 2>/dev/null
if [[ ${n} -le 0 ]]
then
  echo -base: ${1} is not number or 0 or little 0
  exit 2
fi

let num=${1}%2
if [[ $num -eq 0 ]]
then
    echo ${1} is not prime number
    exit 0
fi

if [[ ${1} -le 3 ]]
then
    echo ${1} is prime number
    exit 0
fi

num=`echo "sqrt(${1})+1" | bc`
i=3
while [[ ${i} -le ${num} ]]
do
  let num=${1}%${i}
  if [[ $num -eq 0 ]]
  then
      echo ${1} is not prime number
      exit 0
  fi
  i=${i}+2
done
echo  ${1} is prime number

