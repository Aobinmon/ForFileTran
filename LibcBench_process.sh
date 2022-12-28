#! /bin/sh

# $1: Type string(ARM/RISC-V)

if [ $# -ne 1 ]; then
    echo "Usage: sh LibcBench_process.sh parameter1"
    exit 1
fi


for index in `seq 10`
do
  perf record -e cpu-cycles -g ./libc-bench
done

perf report --no-children -G > $1"_libc_bench".txt

rm -f perf.data perf.data.old

