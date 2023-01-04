#! /bin/sh

# $1: The directory where the program to be tested is stored  ;  $2: Output result directory ; $3: Type string(ARM/RISC-V)  ;  $4: times(perf record)

if [ $# -ne 4 ]; then
    echo "Usage: sh RT-tests_process.sh parameter1 parameter2 parameter3 parameter4"
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
    if [ "svsematest" = "${file##*/}" ]; then
      perf record -e cpu-cycles -g $file -a -t -p99 -i100 -d25 -l5000
    elif [ "pi_stress" = "${file##*/}" ]; then
      perf record -e cpu-cycles -g $file --inversions=2000
    elif [ "signaltest" = "${file##*/}" ]; then
      perf record -e cpu-cycles -g $file --loops=2000 --quiet
    elif [ "sigwaittest" = "${file##*/}" ]; then
      perf record -e cpu-cycles -g $file -a -t 1 -p99 -i100 -d25 -l5000
    elif [ "ptsematest" = "${file##*/}" ]; then
      perf record -e cpu-cycles -g $file -a -t 1 -p99 -i100 -d25 -l5000
    elif [ "rt-migrate-test" = "${file##*/}" ]; then
      perf record -e cpu-cycles -g $file --loops=30
    elif [ "cyclictest" = "${file##*/}" ]; then
      perf record -e cpu-cycles -g $file -t 1 -p 80 -n -q -i 1000 -l 4000
    fi
  done

  perf report --no-children -G > $3"_"${file##*/}.txt

  mv $3"_"${file##*/}.txt $2

  rm -f perf.data perf.data.old

  echo -e "\n\n"
done


