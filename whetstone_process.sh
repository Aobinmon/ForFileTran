#! /bin/sh

# $1: Type string(ARM/RISC-V)

if [ $# -ne 1 ]; then
    echo "Usage: sh whetstone_process.sh parameter1"
    exit 1
fi


for index in `seq 10`
do
  perf record -e cpu-cycles -g ./whetstone 100000
done

perf report --no-children -G > $1"_whetstone_bench".txt

rm -f perf.data perf.data.old

