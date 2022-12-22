#! /bin/sh

# $1: The directory where the program to be tested is stored  ;  $2: Output result directory ; $3: Type string(ARM/RISC-V)  ;  $4: times(perf record)

if [ $# -ne 4 ]; then
    echo "Usage: sh CoreMarkPro_process.sh parameter1 parameter2 parameter3 parameter4"
    exit 1
fi

num=$((`find $1 -type f | wc -l`))
echo $num

if [ -d $2 ]; then
  rm -rf $2
fi

mkdir $2

for file in `find $1 -type f` ; do
  echo $file

  for index in `seq $4`
  do
    if [ "fstime" = "${file##*/}" ]; then
      perf record -e cpu-cycles -g $file
    else
      perf record -e cpu-cycles -g $file
    fi
  done

  perf report --no-children -G > $3"_"${file##*/}.txt

  mv $3"_"${file##*/}.txt $2

  rm -f perf.data perf.data.old

  echo -e "\n\n"
done


