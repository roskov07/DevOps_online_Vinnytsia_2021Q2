## TASK 7.2

B. Using Apache log example create a script to answer the following questions:
1. From which ip were the most requests?
2. What is the most requested page?
3. How many requests were there from each ip?
4. What non-existent pages were clients referred to?
5. What time did site get the most requests?
6. What search bots have accessed the site? (UA + IP)

The code of script:
```
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
```

The result of implementation:
```
root@ubuntu:~# ./script.sh apache_logs.txt
1. From this IP 157.55.39.250 were the most requests - 62

2. This page /sitemap1.xml.gz has the most requests - 8

3. How many requests were there from each ip?

     62 157.55.39.250
     61 46.29.2.62
     34 207.46.13.48
     10 178.76.227.154
      7 176.59.119.104
      4 157.55.39.174
      3 37.140.141.30
      2 66.249.78.58
      2 217.69.134.29
      2 157.55.39.182
      1 95.108.158.190
      1 93.158.178.129
      1 66.249.78.72
      1 66.249.78.65
      1 66.249.69.39
      1 5.255.253.74
      1 5.255.253.45
      1 217.69.134.39
      1 217.69.134.15
      1 217.69.134.13
      1 217.69.134.12
      1 217.69.134.11
      1 213.87.151.38
      1 185.53.44.186

4. What non-existent pages were clients referred to?

 The script doesn't exist 404 responses

5. What time did site get the most requests?

      5 [30/Sep/2015:02:26:55
      5 [30/Sep/2015:02:26:53
      5 [30/Sep/2015:02:26:52
      5 [30/Sep/2015:02:26:51
      5 [30/Sep/2015:02:26:24
      5 [30/Sep/2015:02:26:23
      5 [30/Sep/2015:02:25:54
      5 [30/Sep/2015:02:25:53
      5 [30/Sep/2015:02:25:52
      5 [30/Sep/2015:02:25:50
      5 [30/Sep/2015:02:10:46
      5 [30/Sep/2015:00:42:46

6. What search bots have accessed the site? (UA + IP)

     62 157.55.39.250 bingbot/2.0;
     33 207.46.13.48 bingbot/2.0;
      3 157.55.39.174 bingbot/2.0;
      1 66.249.78.65 Googlebot/2.1;
      1 66.249.78.58 Googlebot/2.1;
      1 66.249.69.39 Googlebot/2.1;
      1 157.55.39.182 bingbot/2.0;

```
