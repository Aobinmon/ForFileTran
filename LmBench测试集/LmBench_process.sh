#! /bin/sh

# $1: The directory where the program to be tested is stored  ;  $2: Output result directory ; $3: Type string(ARM/RISC-V)  ;  $4: times(perf record)

if [ $# -ne 4 ]; then
    echo "Usage: sh UnixBench_process.sh parameter1 parameter2 parameter3 parameter4"
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
    if [ "lat_syscall" = "${file##*/}" ]; then
      perf record -e cpu-cycles -F 399 -g $file open 111.txt
    elif [ "lat_fs" = "${file##*/}" ]; then
      perf record -e cpu-cycles -F 399 -g $file 111
    elif [ "lat_proc" = "${file##*/}" ]; then
      perf record -e cpu-cycles -F 399 -g $file fork
    elif [ "lat_usleep" = "${file##*/}" ]; then
      perf record -e cpu-cycles -F 399 -g $file usecs
    elif [ "lat_sig" = "${file##*/}" ]; then
      perf record -e cpu-cycles -F 399 -g $file catch 111.txt
    elif [ "bw_file_rd" = "${file##*/}" ]; then
      perf record -e cpu-cycles -g $file 64 open2close 111.txt
    elif [ "bw_mem" = "${file##*/}" ]; then
      perf record -e cpu-cycles -F 399 -g $file 100M cp
    elif [ "lmdd" = "${file##*/}" ]; then
      perf record -e cpu-cycles -g $file if=/dev/zero of=/dev/null bs=1M count=4024
    elif [ "lat_mmap" = "${file##*/}" ]; then
      perf record -e cpu-cycles -g $file 1024 111.txt
    elif [ "lat_ctx" = "${file##*/}" ]; then
      perf record -e cpu-cycles -F 399 -g $file -P 2 -s 1 2
    else
      perf record -e cpu-cycles -F 399 -g $file
    fi
  done

  perf report --no-children -G > $3"_"${file##*/}.txt

  mv $3"_"${file##*/}.txt $2

  rm -f perf.data perf.data.old

  echo -e "\n\n"
done


