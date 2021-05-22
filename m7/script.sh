#!/bin/bash
file_out=./file_out.txt
awk '{print $1}' $1 | sort | uniq -c | sort -gr | head -n 1 > $file_out
arg1=`awk '{print $1}' $file_out`
arg2=`awk '{print $2}' $file_out`
echo 1. From this IP $arg2  were the most requests - $arg1
echo ''

awk '{print $7}' $1 | sort | uniq -c | sort -gr | head -n 1 >> $file_out
arg3=`head -n 2 $file_out | tail -n 1 | awk '{print $1}'`
arg4=`head -n 2 $file_out | tail -n 1 | awk '{print $2}'`
echo 2. This page "$arg4" has the most requests - $arg3
echo ''

echo 3. How many requests were there from each ip?
echo ''
awk '{print $1}' $1 | sort | uniq -c | sort -gr
echo''

echo 4. What non-existent pages were clients referred to?
com4=`awk '{print $9}' $1 | sort | uniq -c | sort -gr | grep "404"`
if [ $? -eq 0 ]; then
echo $com4
else
echo''
echo " The script doesn't exist 404 responses"
fi

echo ''
echo 5. What time did site get the most requests?
echo ''
awk '{print $4}' $1 | sort | uniq -c | sort -gr | head -n 12
echo ''

echo 6. What search bots have accessed the site? "(UA + IP)"
echo ''
awk '{print $1,$14}' $1 | grep 'bot' | sort | uniq -c | sort -gr

