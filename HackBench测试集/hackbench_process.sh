#! /bin/sh

# $1: Type string(ARM/RISC-V)

if [ $# -ne 1 ]; then
    echo "Usage: sh hackbench_process.sh parameter1"
    exit 1
fi


for index in `seq 10`
do
  perf record -e cpu-cycles -F 1499 -g ./hackbench
done

perf report --no-children -G > $1"_hackbench".txt

rm -f perf.data perf.data.old

