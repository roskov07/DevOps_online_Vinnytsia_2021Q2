## TASK 5.3
1. How many states could has a process in Linux?
- RUNNING & RUNNABLE
- INTERRRUPTABLE_SLEEP
- UNINTERRUPTABLE_SLEEP
- STOPPED
- ZOMBIE

2. Examine the pstree command. Make output (highlight) the chain (ancestors) of the current process.

The chain (ancestors) of the 14125 process:
```
root@ubuntu:~# pstree -sp 14125
systemd(1)---sshd(3687)---sshd(13992)---bash(14125)---pstree(14179)
```
3. What is a proc file system?

Proc file system (procfs) is virtual file system created on fly when system boots and is dissolved at time of system shut down. It contains the useful information about the processes that are currently running, it is regarded as control and information centre for kernel. The proc file system also provides communication medium between kernel space and user space.

4. Print information about the processor (its type, supported technologies, etc.).

In linux, /proc includes a directory for each running process, including kernel processes, in directories named /proc/PID, these are the directories present:

Directory	description:
- /proc/PID/cmdline	Command line arguments.
- /proc/PID/cpu	Current and last cpu in which it was executed.
- /proc/PID/cwd	Link to the current working directory.
- /proc/PID/environ	Values of environment variables.
- /proc/PID/exe	Link to the executable of this process.
- /proc/PID/fd	Directory, which contains all file descriptors.
- /proc/PID/maps	Memory maps to executables and library files.
- /proc/PID/mem	Memory held by this process.
- /proc/PID/root	Link to the root directory of this process.
- /proc/PID/stat	Process status.
- /proc/PID/statm	Process memory status information.
- /proc/PID/status	Process status in human readable form.

For example:
```
root@ubuntu:/proc# cat 14125/status
Name:   bash
State:  S (sleeping)
Tgid:   14125
Ngid:   0
Pid:    14125
PPid:   13992
TracerPid:      0
Uid:    0       0       0       0
Gid:    0       0       0       0
FDSize: 256
Groups: 0
NStgid: 14125
NSpid:  14125
NSpgid: 14125
NSsid:  14125
VmPeak:    22736 kB
VmSize:    22672 kB
VmLck:         0 kB
VmPin:         0 kB
VmHWM:      5492 kB
VmRSS:      5460 kB
VmData:     1868 kB
VmStk:       132 kB
VmExe:       976 kB
VmLib:      2312 kB
VmPTE:        68 kB
VmPMD:        12 kB
VmSwap:        0 kB
HugetlbPages:          0 kB
Threads:        1
SigQ:   0/3798
SigPnd: 0000000000000000
ShdPnd: 0000000000000000
SigBlk: 0000000000010000
SigIgn: 0000000000380004
SigCgt: 000000004b817efb
CapInh: 0000000000000000
CapPrm: 0000003fffffffff
CapEff: 0000003fffffffff
CapBnd: 0000003fffffffff
CapAmb: 0000000000000000
Seccomp:        0
Speculation_Store_Bypass:       thread vulnerable
Cpus_allowed:   1
Cpus_allowed_list:      0
Mems_allowed:   00000000,00000001
Mems_allowed_list:      0
voluntary_ctxt_switches:        1207
nonvoluntary_ctxt_switches:     508
```
5. Use the ps command to get information about the process. The information should be as follows: the owner of the process, the arguments with which the process was launched for execution, the group owner of this process, etc.
```
root@ubuntu:~# ps -F --pid 14920
UID        PID  PPID  C    SZ   RSS PSR STIME TTY          TIME CMD
root     14920 14866 49  1831   704   0 22:25 pts/1    00:07:43 dd if=/dev/zero of=/dev/null
```
```
root@ubuntu:~# ps -o group --pid 14920
GROUP
root
```
6. How to define kernel processes and user processes?

There are two different types of background processes.
There are kernel threads. These are a part of the Linux kernel, and each of them is started with its own process identification number (PID). When managing processes, it is easy to recognize the kernel processes because they have a name that is between square brackets. As an administrator, it is important to know that kernel threads cannot be managed. You cannot adjust their priority; neither is it possible to kill them, except by taking the entire machine down. 

7. Print the list of processes to the terminal. Briefly describe the statuses of the processes.
What condition are they in, or can they be arriving in?

```
root@ubuntu:~# ps auxfS
root         1  0.2  0.5  37756  5812 ?        Ss   Apr26  10:47 /sbin/init
root       337  0.0  0.2  28348  3004 ?        Ss   Apr26   0:01 /lib/systemd/systemd-journald
root       409  0.0  0.1 102964  1764 ?        Ss   Apr26   0:00 /sbin/lvmetad -f
root       423  0.0  0.4  44812  4440 ?        Ss   Apr26   0:12 /lib/systemd/systemd-udevd
systemd+   702  0.0  0.2 100320  2544 ?        Ssl  Apr26   0:00 /lib/systemd/systemd-timesyncd
root       855  0.0  0.3  28648  3200 ?        Ss   Apr26   0:00 /lib/systemd/systemd-logind
syslog     856  0.0  0.3 256388  3372 ?        Ssl  Apr26   0:00 /usr/sbin/rsyslogd -n
root       863  0.0  0.1   4392  1216 ?        Ss   Apr26   0:00 /usr/sbin/acpid
message+   865  0.0  0.3  42884  3784 ?        Ss   Apr26   0:01 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
root       921  0.0  0.2  16120  2816 ?        Ss   Apr26   0:02 /sbin/dhclient -1 -v -pf /run/dhclient.enp0s3.pid -lf /var/lib/dhcp/dhclient.enp0s3.leases -I -df /var/lib/dhcp/dhclient6.en
daemon     951  0.0  0.2  26040  2272 ?        Ss   Apr26   0:00 /usr/sbin/atd -f
root       954  0.0  0.2  29004  3028 ?        Ss   Apr26   0:01 /usr/sbin/cron -f
root       956  0.0  0.6 275852  6260 ?        Ssl  Apr26   0:07 /usr/lib/accountsservice/accounts-daemon
root       959  0.0  0.2 644980  2980 ?        Ssl  Apr26   0:01 /usr/bin/lxcfs /var/lib/lxcfs/
root      1041  0.0  1.9 174628 19964 ?        Ssl  Apr26   0:00 /usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgrade-shutdown --wait-for-signal
root      1077  0.0  0.0  13368   160 ?        Ss   Apr26   0:00 /sbin/mdadm --monitor --pid-file /run/mdadm/monitor.pid --daemonise --scan --syslog
root      1085  0.0  0.0   5216   152 ?        Ss   Apr26   0:14 /sbin/iscsid
root      1086  0.0  0.3   5716  3520 ?        S<Ls Apr26   1:06 /sbin/iscsid
root      1156  0.0  0.6 277176  6108 ?        Ssl  Apr26   0:00 /usr/lib/policykit-1/polkitd --no-debug
root      3687  0.0  0.6  65508  6288 ?        Ss   Apr26   0:55 /usr/sbin/sshd -D
root     14743  0.0  0.7 109352  7496 ?        Ss   22:14   0:01  \_ sshd: root@pts/1
root     14866  0.0  0.5  22580  5236 pts/1    Ss   22:14   0:01  |   \_ -bash
root     14920 49.7  0.0   7324   704 pts/1    R    22:25   8:52  |       \_ dd if=/dev/zero of=/dev/null
root     14983  0.0  0.3  37504  3404 pts/1    R+   22:43   0:00  |       \_ ps auxfS
```
PROCESS STATE CODES

Here are the different values that the s, stat and state output specifiers (header "STAT" or "S") will display to describe the state of a process:
D    uninterruptible sleep (usually IO)
I    Idle kernel thread
R    running or runnable (on run queue)
S    interruptible sleep (waiting for an event to complete)
T    stopped by job control signal
t    stopped by debugger during the tracing
W    paging (not valid since the 2.6.xx kernel)
X    dead (should never be seen)
Z    defunct ("zombie") process, terminated but not reaped by its parent

For BSD formats and when the stat keyword is used, additional characters may be displayed:

               <    high-priority (not nice to other users)
               N    low-priority (nice to other users)
               L    has pages locked into memory (for real-time and custom IO)
               s    is a session leader
               l    is multi-threaded (using CLONE_THREAD, like NPTL pthreads do)
               +    is in the foreground process group

8. Display only the processes of a specific user.
```
root@ubuntu:~# ps -fu ubuntu
UID        PID  PPID  C STIME TTY          TIME CMD
ubuntu    8773     1  0 Apr27 ?        00:00:00 /lib/systemd/systemd --user
ubuntu    8780  8773  0 Apr27 ?        00:00:00 (sd-pam)
ubuntu    8784  4432  0 Apr27 tty1     00:00:00 -bash
```

9. What utilities can be used to analyze existing running tasks (by analyzing the help for the ps command)?

For example:
```
root@ubuntu:~# ps auxfS | grep dd
root         2  0.0  0.0      0     0 ?        S    Apr27   0:00 [kthreadd]
root        67  0.0  0.0      0     0 ?        S<   Apr27   0:00  \_ [ipv6_addrconf]
root       414  0.0  0.0      0     0 ?        S<   Apr27   0:00  \_ [ib_addr]
message+   865  0.0  0.3  42884  3784 ?        Ss   Apr27   0:01 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
root     14920 49.5  0.0   7324   704 pts/1    R    19:11  72:40  |       \_ dd if=/dev/zero of=/dev/null
root     15680  0.0  0.0  14220   972 pts/2    S+   21:38   0:00  |       \_ grep --color=auto dd
root     14281 76.4  0.0   7324   736 ?        R    16:19 243:24 dd if=/dev/zero of=/dev/null
```

10. What information does top command display?
top command is used to show the Linux processes. It provides a dynamic real-time view of the running system. Usually, this command shows the summary information of the system and the list of processes or threads which are currently managed by the Linux Kernel.

11.Display the processes of the specific user using the top command.
top -u "username" - this command shows processes of the specific user
```
root@ubuntu:~# top -u ubuntu

%Cpu(s): 30.8 us, 69.2 sy,  0.0 ni,  0.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  1015852 total,   340564 free,    72876 used,   602412 buff/cache
KiB Swap:  1003004 total,  1003004 free,        0 used.   765992 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND
 8773 ubuntu    20   0   45304   4772   3984 S  0.0  0.5   0:00.10 systemd
 8780 ubuntu    20   0   79536   2008      0 S  0.0  0.2   0:00.00 (sd-pam)
 8784 ubuntu    20   0   22592   5236   3348 S  0.0  0.5   0:00.10 bash

```
12. What interactive commands can be used to control the top command? Give a couple of examples.
- htop, atop are interactive commands.

13. Sort the contents of the processes window using various parameters (for example, the amount of processor time taken up, etc.)

For example:
```
<Shift>+<N> — sort by PID;
<Shift>+<P> — sort by CPU usage;
<Shift>+<M> — sort by Memory usage;
<Shift>+<T> — sort by Time usage;
```
14. Concept of priority, what commands are used to set priority?

When Linux processes are started, they are started with a specific priority. By default, all regular processes are equal and are started with the same priority, which is the priority number 20. In some cases, it is useful to change the default priority that was assigned to the process when it was started.
You can do that using the nice and renice commands. Use nice if you want to start a process with an adjusted priority. Use renice to change the priority for a currently active process.

15. Can I change the priority of a process using the top command? If so, how?
With the help of using "r" command from the "top" utility I can change the priority of a currently running process.

16. Examine the kill command. How to send with the kill command process control signal? Give an example of commonly used signals

The Linux kernel allows many signals to be sent to processes. cesses. Use man for a complete overview of all the available
signals:

- The signal SIGTERM (15) is used to ask a process to stop.
- The signal SIGKILL (9) is used to force a process to stop. 
- The SIGHUP (1) signal is used to hang up a process. The effect is that the process will reread its configuration files, which makes this a useful signal to use after making modifications to a process configuration file.

```
root@ubuntu:~# kill -l
 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL       5) SIGTRAP
 6) SIGABRT      7) SIGBUS       8) SIGFPE       9) SIGKILL     10) SIGUSR1
11) SIGSEGV     12) SIGUSR2     13) SIGPIPE     14) SIGALRM     15) SIGTERM
16) SIGSTKFLT   17) SIGCHLD     18) SIGCONT     19) SIGSTOP     20) SIGTSTP
21) SIGTTIN     22) SIGTTOU     23) SIGURG      24) SIGXCPU     25) SIGXFSZ
26) SIGVTALRM   27) SIGPROF     28) SIGWINCH    29) SIGIO       30) SIGPWR
31) SIGSYS      34) SIGRTMIN    35) SIGRTMIN+1  36) SIGRTMIN+2  37) SIGRTMIN+3
38) SIGRTMIN+4  39) SIGRTMIN+5  40) SIGRTMIN+6  41) SIGRTMIN+7  42) SIGRTMIN+8
43) SIGRTMIN+9  44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12 47) SIGRTMIN+13
48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14 51) SIGRTMAX-13 52) SIGRTMAX-12
53) SIGRTMAX-11 54) SIGRTMAX-10 55) SIGRTMAX-9  56) SIGRTMAX-8  57) SIGRTMAX-7
58) SIGRTMAX-6  59) SIGRTMAX-5  60) SIGRTMAX-4  61) SIGRTMAX-3  62) SIGRTMAX-2
63) SIGRTMAX-1  64) SIGRTMAX
```
For example:
```
root@ubuntu:~# kill -9 14253
root@ubuntu:~# kill -15 12253
```
There are some commands that are related to kill: killall and pkill . The pkill command is a bit easier to use because it takes the name rather than the PID of the process as an argument. You can use the killall command if multiple processes using the same name need to be killed simultaneously. 

17. Commands jobs, fg, bg, nohup. What are they for? Use the sleep, yes command to
demonstrate the process control mechanism with fg, bg.

When we work with the Linux command line, sometimes we want to start a process and let it run in the background as a job.
In this way, it doesn’t block the terminal, and we can do some other work while it’s running.
There are several ways to achieve this. In this tutorial, we’re going to discuss three common approaches: the disown and nohup commands, and the & operator.
Some job control commands and keyboard shortcuts first:

- Ctrl-C: Kill the process running in the foreground by sending the signal SIGINT
- Ctrl-Z: Suspend the process running in the foreground by sending the signal SIGTSTP
- jobs: Display a list of the jobs with their status
- fg: Move a background job into the foreground
- bg: Resume suspended jobs by running them as background jobs
- nohup: short for no hang up is a command in Linux systems that keep processes running even after exiting the shell or terminal. Nohup prevents the processes or jobs from receiving the SIGHUP (Signal Hang UP) signal. This is a signal that is sent to a process upon closing or exiting the terminal.

For example:
```
root@ubuntu:~# sleep 1000 & 
[3] 15719
root@ubuntu:~# jobs
[2]+  Stopped                 top
[3]-  Running                 sleep 1000 &
root@ubuntu:~# fg 3
sleep 1000
^Z
[3]+  Stopped                 sleep 1000
root@ubuntu:~# bg 3
[3]+ sleep 1000 &
root@ubuntu:~# jobs
[2]+  Stopped                 top
[3]-  Running                 sleep 1000 &
```
## PART 2

2. Implement basic SSH settings to increase the security of the client-server connection (at least)

I disabled Server SSH Root Login in file /etc/ssh/sshd_config. Also I changed ssh-port to 41111. [image1](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m5/task5.3/images/5.3.2.png). After these changes I wasn't able to connect as a root [image2](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m5/task5.3/images/5.3.2.2.png) And now I can connect using ssh only as a 'ubuntumain' user:  [image3](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m5/task5.3/images/5.3.2.3.png) 

3. List the options for choosing keys for encryption in SSH. Implement 3 of them.
Three ways to generate ssh-keys, what I have used: [image4](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m5/task5.3/images/5.3.3.1.png), [image5](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m5/task5.3/images/5.3.3.2.png), [image6](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m5/task5.3/images/5.3.3.3.png)

4. Implement port forwarding for the SSH client from the host machine to the guest Linux virtual machine behind NAT. 

My host machine is 192.168.0.104, the guest machine is 10.0.2.15. I run the next command in the quest machine:
```
sudo ssh -N -R 22322:localhost:41111 ssh_user@192.168.0.104 -p 41111
```
In this case I created SSH-tunnel. My host machine was opened 22322 port which connected to 41111 port on my quest machine. Then I tried to connect to my quest machine from host machine by implementing the next command:
```
ssh ssh_usernat@localhost -p22322
```
It was saccessful and I got ssh access to guest machine behind NAT: [image7](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m5/task5.3/images/5.4.1.png)

5. Intercept (capture) traffic (tcpdump, wireshark) while authorizing the remote client on the server using ssh, telnet, rlogin. Analyze the result.

Intercepting ssh-trafic between my host machine and my guest machine by tcpdump: [image8](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m5/task5.3/images/5%2C3%2C5.1.png) [image9](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m5/task5.3/images/5.3.5.2.png):
```
13:45:14.523712 IP 10.0.2.15.40170 > 192.168.0.104.41111: Flags [P.], seq 4920:4996, ack 2689, win 65535, length 76
```
Description:
- The first field, 13:45:14.523712, represents the timestamp of the received packet as per the local clock.

- Next, IP represents the network layer protocol—in this case, IPv4. For IPv6 packets, the value is IP6.

- The next field, 10.0.2.15.40170, is the source IP address and port. This is followed by the destination IP address and port, represented by 192.168.0.104.41111.

- After the source and destination, you can find the TCP Flags Flags [P.]. Typical values for this field include:
Value	Flag Type	Description
S	SYN	Connection Start
F	FIN	Connection Finish
P	PUSH	Data push
R	RST	Connection reset
.	ACK	Acknowledgment

- This field can also be a combination of these values, such as [S.] for a SYN-ACK packet.

- Next is the sequence number of the data contained in the packet. For the first packet captured, this is an absolute number. Subsequent packets use a relative number to make it easier to follow. In this example, the sequence is seq 196:568, which means this packet contains bytes 4920 to 4996 of this flow.

- This is followed by the Ack Number: ack 2689. In this case, it is 2689 since this is the side sending data. For the side receiving data, this field represents the next expected byte (data) on this flow.

- The next field is the window size win 65535, which represents the number of bytes available in the receiving buffer, followed by TCP options such as the MSS (Maximum Segment Size) or Window Scale. 

- Finally, we have the packet length, length 76, which represents the length, in bytes, of the payload data. The length is the difference between the last and first bytes in the sequence number.
