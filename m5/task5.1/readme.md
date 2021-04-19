## PART 1.
1. I logged in to the system as root.
2. I changed passwd for user ubuntu. Basic parameters of the 'passwd' [imagelink](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m5/task5.1/images/passwd.png):
```
-S --status - report password status on the named account
-l, --lock - lock the password of the named account
-u, --unlock - unlock the password of the named account
-d, --delete - delete the password for the named account
```
3. "/etc/passwd" - this file contains information about users. For expample:
```
root:x:0:0:root:/root:/bin/bash
```
where:
```
username: pswd: uid: gid: uid comments: directory: shell
```
"/etc/shadow" - this file contains information about users passwords.
"w" - this command shows list of active system users and what command they execute [imagelink](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m5/task5.1/images/w.png). Also this command shows LA, uptime, date, login time.

4. I changed home directory for ubuntu user with the help of 'usermod'
```
root@ubuntu:~# usermod -d /home/ubuntunew2 -m ubuntu
root@ubuntu:~# cat /etc/passwd | grep ubuntu
```
Information what I changed about 'ubuntu' user in "/etc/passwd":
```
ubuntu:x:1000:1000::/home/ubuntunew2:/bin/bash
```
5. Using --help , for example: 
```
root@ubuntu:~# usermod -help
-d, --home HOME_DIR - new home directory for the user account.
-m, --move-home - move contents of the home directory to the new location (use only with -d).
```
6. Opening file /root/.bashrc with the help of 'less' and searching phrase 'debian' using '/pattern' - [imagelink](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m5/task5.1/images/less.png)
8. List the contents of the home directory using the ls command:
```
root@ubuntu:~# ls -la
total 44
drwx------  5 root root 4096 Apr 18 20:36 .
drwxr-xr-x 23 root root 4096 Apr 17 19:47 ..
-rw-------  1 root root  736 Apr 18 17:41 .bash_history
-rw-r--r--  1 root root 3106 Oct 22  2015 .bashrc
drwx------  2 root root 4096 Apr 18 17:44 .cache
-rw-------  1 root root   42 Apr 18 20:36 .lesshst
drwxr-xr-x  2 root root 4096 Apr 18 17:20 .nano
-rw-r--r--  1 root root  148 Aug 17  2015 .profile
drwxr-xr-x  2 root root 4096 Apr 18 17:41 .ssh
-rw-------  1 root root 2512 Apr 18 18:11 .viminfo
-rw-------  1 root root   52 Apr 18 17:46 .Xauthority

./.bash_history - this file contains bash history.

./.bashrc - this file defines shell behavior.

./.ssh/ - this directory contains information about ssh keys

./.cache/ - this directory contains cache
```
## PART 2.
1. Using tree:
```
-L - sets the nesting level to display in the output. For example:

root@ubuntu:~# tree -L 2
.
+-- tes0000
¦   +-- test0001
¦   +-- text.sh
¦   L-- text.txt
+-- test1
¦   +-- test2
¦   +-- text.sh
¦   L-- text.txt
L-- test111
    +-- test222
    +-- text.sh
    L-- text.txt

-f - shows absolute file path.
-P - searching using pattern.
```
In example I search the executable files:
```
root@ubuntu:~# tree -f -P '*sh'
.
+-- ./tes0000
¦   +-- ./tes0000/test0001
¦   ¦   +-- ./tes0000/test0001/test0002
¦   ¦   ¦   L-- ./tes0000/test0001/test0002/test.sh
¦   ¦   L-- ./tes0000/test0001/test.sh
¦   L-- ./tes0000/text.sh
+-- ./test1
¦   +-- ./test1/test2
¦   ¦   +-- ./test1/test2/test3
¦   ¦   ¦   L-- ./test1/test2/test3/text.sh
¦   ¦   L-- ./test1/test2/text.sh
¦   L-- ./test1/text.sh
L-- ./test111
    +-- ./test111/test222
    ¦   +-- ./test111/test222/test333
    ¦   ¦   L-- ./test111/test222/test333/text.sh
    ¦   L-- ./test111/test222/text.sh
    L-- ./test111/text.sh
```
2. "file" - this command is used to determine file type. Examples:
```
root@ubuntu:/bin# ls -al | grep 'vdir'
-rwxr-xr-x  1 root root  126584 Mar  2  2017 vdir
root@ubuntu:/bin# file vdir
vdir: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=7908e06a2212d5cbe899263fdd1c0e67da29145a, stripped

root@ubuntu:~/tes0000# file text.txt
text.txt: ASCII text
```
3. Navigating:
I am in /etc/ssh:
```
root@ubuntu:/etc/ssh# pwd
/etc/ssh
```
To come back to home directory I input next command:
```
root@ubuntu:/etc/ssh# cd ~
root@ubuntu:~# pwd
/root
```
4. Using ls:
```
-l - to show data in a long listing format 

root@ubuntu:~# ls -l
total 12
drwxr-xr-x 3 root root 4096 Apr 18 22:05 tes0000
drwxr-xr-x 3 root root 4096 Apr 18 21:32 test1
drwxr-xr-x 3 root root 4096 Apr 18 21:33 test111

-a - do not ignore entries starting with .

root@ubuntu:~# ls -la
total 56
drwx------  8 root root 4096 Apr 18 22:05 .
drwxr-xr-x 23 root root 4096 Apr 17 19:47 ..
-rw-------  1 root root  736 Apr 18 17:41 .bash_history
-rw-r--r--  1 root root 3106 Oct 22  2015 .bashrc
drwx------  2 root root 4096 Apr 18 17:44 .cache
-rw-------  1 root root   42 Apr 18 20:36 .lesshst
drwxr-xr-x  2 root root 4096 Apr 18 17:20 .nano
-rw-r--r--  1 root root  148 Aug 17  2015 .profile
drwxr-xr-x  2 root root 4096 Apr 18 17:41 .ssh
drwxr-xr-x  3 root root 4096 Apr 18 22:05 tes0000
drwxr-xr-x  3 root root 4096 Apr 18 21:32 test1
drwxr-xr-x  3 root root 4096 Apr 18 21:33 test111
-rw-------  1 root root 4027 Apr 18 22:05 .viminfo
-rw-------  1 root root   52 Apr 18 17:46 .Xauthority
```
5. Performing file operations:
```
root@ubuntu:~# mkdir testdirectory
root@ubuntu:~# ls -la > testdirectory/lslist.txt
root@ubuntu:~# cat testdirectory/lslist.txt
total 60
drwx------  9 root root 4096 Apr 18 22:15 .
drwxr-xr-x 23 root root 4096 Apr 17 19:47 ..
-rw-------  1 root root  736 Apr 18 17:41 .bash_history
-rw-r--r--  1 root root 3106 Oct 22  2015 .bashrc
drwx------  2 root root 4096 Apr 18 17:44 .cache
-rw-------  1 root root   42 Apr 18 20:36 .lesshst
drwxr-xr-x  2 root root 4096 Apr 18 17:20 .nano
-rw-r--r--  1 root root  148 Aug 17  2015 .profile
drwxr-xr-x  2 root root 4096 Apr 18 17:41 .ssh
drwxr-xr-x  3 root root 4096 Apr 18 22:05 tes0000
drwxr-xr-x  3 root root 4096 Apr 18 21:32 test1
drwxr-xr-x  3 root root 4096 Apr 18 21:33 test111
drwxr-xr-x  2 root root 4096 Apr 18 22:15 testdirectory
-rw-------  1 root root 4027 Apr 18 22:05 .viminfo
-rw-------  1 root root   52 Apr 18 17:46 .Xauthority
root@ubuntu:~# cp testdirectory/lslist.txt ./
root@ubuntu:~# rm -rf testdirectory
root@ubuntu:~# rm -f lslist.txt
```
6. Working wirh hard links and  soft links:
```
root@ubuntu:~# mkdir test
root@ubuntu:~# cp .bash_history ./test/labwork2
root@ubuntu:~# cd ./test/
root@ubuntu:~# ln ./labwork2 hardlink
root@ubuntu:~# ln -s ./labwork2 softlink
root@ubuntu:~/test# ls -li
total 8
140037 -rw------- 2 root root 736 Apr 18 22:20 hardlink
140037 -rw------- 2 root root 736 Apr 18 22:20 labwork2
140038 lrwxrwxrwx 1 root root  10 Apr 18 22:38 softlink -> ./labwork2
```
A hard link is sent to the same block of memory where the data is stored as well as the main file. Also hardlink and labwork2 have the same inode.
A soft link is just a pointer to a file.
I changed the data by opening a symbolic link and the data was changed in ./labwork2 and ./hardlink. It must be so, because I changed main file ./labwork2 by symbolic link.
```
root@ubuntu:~/test# mv hardlink hard_lnk_labwork2
root@ubuntu:~/test# mv softlink  symb_lnk_labwork2
root@ubuntu:~/test# rm labwork2
root@ubuntu:~/test# ls -la
total 12
drwxr-xr-x 2 root root 4096 Apr 18 22:56 .
drwx------ 9 root root 4096 Apr 18 22:47 ..
-rw------- 1 root root  744 Apr 18 22:47 hard_lnk_labwork2
lrwxrwxrwx 1 root root   10 Apr 18 22:38 symb_lnk_labwork2 -> ./labwork2
```
After removing ./labwork2 symb.link doesn't work because file ./labwork2 doesn't exist. But ./hard_lnk_labwork2 contains the data, because hard link points to the same block of memory where the data is stored as well as the main file.

7. Using locate:
```
root@ubuntu:~# locate -b traceroute
/etc/alternatives/traceroute6
/etc/alternatives/traceroute6.8.gz
/lib/modules/4.4.0-186-generic/kernel/drivers/tty/n_tracerouter.ko
/usr/bin/traceroute6
/usr/bin/traceroute6.iputils
/usr/share/man/man8/traceroute6.8.gz
/usr/share/man/man8/traceroute6.iputils.8.gz
/var/lib/dpkg/alternatives/traceroute6

root@ubuntu:~# locate -b squid
/usr/share/sosreport/sos/plugins/squid.py
/usr/share/sosreport/sos/plugins/__pycache__/squid.cpython-35.pyc
/usr/share/vim/vim74/syntax/squid.vim
```
8. Using "lsblk". This command shows disks, patritions and their type.
```
NAME                  MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
sda                     8:0    0    10G  0 disk
├─sda1                  8:1    0   731M  0 part  /boot
├─sda2                  8:2    0     1K  0 part
└─sda5                  8:5    0   9.3G  0 part
  ├─ubuntu--vg-root   252:0    0   8.3G  0 lvm   /
  └─ubuntu--vg-swap_1 252:1    0   980M  0 lvm
    └─cryptswap1      252:2    0 979.5M  0 crypt [SWAP]
sr0                    11:0    1  1024M  0 rom
```
For exmaple:
```
sda - is disk
sda2 - is partition
ubuntu--vg-root is lvm. lvm is a abstraction under a partition, in simpe terms pertition in partition.
```
9. Counting the number of lines. For this I use "wc". 
File ./test.txt has 15 lines and I can know it by using 'wc -l':
```
root@ubuntu:~# wc -l test.txt
15 test.txt
```
10.Using "find":
```
root@ubuntu:~# find /etc  -type f -name '*host*'
/etc/hosts.allow
/etc/host.conf
/etc/ssh/ssh_host_ed25519_key
/etc/ssh/ssh_host_rsa_key
/etc/ssh/ssh_host_ecdsa_key.pub
/etc/ssh/ssh_host_dsa_key
/etc/ssh/ssh_host_ecdsa_key
/etc/ssh/ssh_host_dsa_key.pub
/etc/ssh/ssh_host_ed25519_key.pub
/etc/ssh/ssh_host_rsa_key.pub
/etc/dbus-1/system.d/org.freedesktop.hostname1.conf
/etc/init.d/hostname.sh
/etc/init/hostname.sh.conf
/etc/init/hostname.conf
/etc/hosts
/etc/hosts.deny
/etc/hostname
```
11. Using "ls -la" + "grep" for searcing file whicn contains 'ss':
```
root@ubuntu:~# ls -la /etc | grep 'ss'
drwxr-xr-x  3 root root    4096 Apr 17 19:43 gss
drwxr-xr-x  3 root root    4096 Apr 17 19:21 insserv
-rw-r--r--  1 root root     771 Mar  6  2015 insserv.conf
drwxr-xr-x  2 root root    4096 Mar  6  2015 insserv.conf.d
-rw-r--r--  1 root root      26 Aug  5  2020 issue
-rw-r--r--  1 root root      19 Aug  5  2020 issue.net
-rw-r--r--  1 root root     497 May  4  2014 nsswitch.conf
-rw-r--r--  1 root root    1562 Apr 18 19:18 passwd
-rw-------  1 root root    1561 Apr 18 19:16 passwd-
drwxr-xr-x  2 root root    4096 Apr 18 17:40 ssh
drwxr-xr-x  4 root root    4096 Apr 17 19:51 ssl
```
12. The Linux kernel provides support for two types of devices - character and block. Their main difference is that for block devices, input / output operations are carried out not in separate bytes (characters), but in blocks of a fixed size.
```
root@ubuntu:~# ls -l /dev/
total 0
crw-------  1 root root     10, 235 Apr 18 12:04 autofs
drwxr-xr-x  2 root root         360 Apr 18 12:04 block
drwxr-xr-x  2 root root          80 Apr 18 12:04 bsg
crw-rw----  1 root disk     10, 234 Apr 18 12:04 btrfs-control
drwxr-xr-x  3 root root          60 Apr 18 12:04 bus
lrwxrwxrwx  1 root root           3 Apr 18 12:04 cdrom -> sr0
drwxr-xr-x  2 root root        3540 Apr 18 12:04 char
crw-------  1 root root      5,   1 Apr 18 12:05 console
lrwxrwxrwx  1 root root          11 Apr 18 12:03 core -> /proc/kcore
crw-------  1 root root     10,  59 Apr 18 12:04 cpu_dma_latency
crw-------  1 root root     10, 203 Apr 18 12:04 cuse
drwxr-xr-x  5 root root         100 Apr 18 12:04 disk
brw-rw----  1 root disk    252,   0 Apr 18 12:04 dm-0
brw-rw----  1 root disk    252,   1 Apr 18 12:04 dm-1

b - block devices
c- character devices
```
14. file - this command is used to determine file type. Examples:
```
root@ubuntu:/bin# ls -al | grep 'vdir'
-rwxr-xr-x  1 root root  126584 Mar  2  2017 vdir
root@ubuntu:/bin# file vdir
vdir: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=7908e06a2212d5cbe899263fdd1c0e67da29145a, stripped
```
15. I completed this task as follows [imagelink](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m5/task5.1/images/15png.png):
```
root@ubuntu:~# find /etc -type f | head -n 5 | xargs stat | grep -e File -e Access -e Modify -e Change
 File: '/etc/rcS.d/README'
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2016-01-19 20:33:50.000000000 +0200
Modify: 2016-01-19 20:33:50.000000000 +0200
Change: 2021-04-17 19:21:28.099927000 +0300
  File: '/etc/cron.hourly/.placeholder'
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2016-04-06 00:59:09.000000000 +0300
Modify: 2016-04-06 00:59:09.000000000 +0300
Change: 2021-04-17 19:21:28.007927000 +0300
  File: '/etc/dhcp/dhclient-enter-hooks.d/resolvconf'
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2021-04-19 20:51:10.641495863 +0300
Modify: 2015-06-03 23:58:21.000000000 +0300
Change: 2021-04-17 19:21:28.019927000 +0300
  File: '/etc/dhcp/dhclient-exit-hooks.d/timesyncd'
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2021-04-19 20:51:10.657495919 +0300
Modify: 2020-04-18 16:37:15.000000000 +0300
Change: 2021-04-17 19:21:28.019927000 +0300
  File: '/etc/dhcp/dhclient-exit-hooks.d/rfc3442-classless-routes'
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2021-04-19 20:51:10.657495919 +0300
Modify: 2016-04-13 18:56:48.000000000 +0300
Change: 2021-04-17 19:21:28.019927000 +0300
```

Where:
```
"find /etc -type f | head -n 5 " - showing first 5 files in /etc directory

"xargs stat | grep -e File -e Access -e Modify -e Change" and for first 5 files in /etc directory I implement 'stat' and 'grep -е'. 'stat' shows status of file and 'grep -e' does searching by pattern 
```
