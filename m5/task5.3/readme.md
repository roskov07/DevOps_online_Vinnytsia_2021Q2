## TASK 5.2
1) Analyze the structure of the /etc/passwd and /etc/group file, what fields are
present in it, what users exist on the system? Specify several pseudo-users, how
to define them?

/etc/passwd - this file contains information about users. For expample:
```
root:x:0:0:root:/root:/bin/bash
```
where:
```
username: pswd: uid: gid: uid comments: directory: shell
```
/etc/group - this file contains information about groups and groups members:
```
adm:x:4:syslog
```
where:
```
groupname: pswd: gid: groupmembers
```
Only the root user has a special status for the Linux kernel. There are, however, a few more pseudo-user
accounts that are used for system purposes. These bogus accounts can be identified by UID values,
which are typically less than 100. Typically, accounts with UIDs less than 10 belong to the system, and
UIDs 10 to 100 are reserved for pseudo-users associated with special programs.

2) What are the uid ranges? What is UID? How to define it?

UID - unique identifier of the user within the system. UID is a simple numeric designation for an individual user. This is usually a positive number not more
than 65535 (sometimes 32-bit). Some identifiers are reserved for special use. These include 0 (root),
1-999(daemons, pseudo-users, system and reserved users), 1000+ (regular users).

3) What is GID? How to define it?

GID - unique identifier of the group within the system to which the user belongs

4) How to determine belonging of user to the specific group?

I can know GID by executing "id":
```
ubuntu@ubuntu:/root$ id
uid=1000(ubuntu) gid=1000(ubuntu) groups=1000(ubuntu)
```
Or I can know user group by executing "groups" :
```
root@ubuntu:~# groups ubuntu2
ubuntu2 : ubuntu
```
5) What are the commands for adding a user to the system? What are the basic
parameters required to create a user?

The commands for adding a user to the system are "useradd" and "adduser".
Basic parameters are: useradd [-c uid comment] [-d dir] [-e expire] [-f inactive] [-g gid] [-m [-k skel_dir]] [-s shell]
[-u uid [-o]] username
When we create a user without additional keys, we get the following result:
```
root@ubuntu:~# useradd ubuntu4

root@ubuntu:~# cat /etc/passwd | grep ubuntu4
ubuntu4:x:1003:1003::/home/ubuntu4:
```
UID, GUID, home directory was created by default.

6) How do I change the name (account name) of an existing user?
Changing name of user:
```
usermod -l newusername olusername
```
```
root@ubuntu:~# usermod -l ubuntu3 ubuntu23
ubuntu23:x:1002:1000::/home/ubuntu3:
```
But this command changes only username, not GID, UID, home directory.

7) What is skell_dir? What is its structure?

skel_dir - this directory contains files which must be copied to the new user's home directory.

```
root@ubuntu:~# ls -la /etc/skel/
total 20
drwxr-xr-x  2 root root 4096 Apr 17 19:21 .
drwxr-xr-x 91 root root 4096 Apr 22 22:51 ..
-rw-r--r--  1 root root  220 Sep  1  2015 .bash_logout
-rw-r--r--  1 root root 3771 Sep  1  2015 .bashrc
-rw-r--r--  1 root root  655 Jul 12  2019 .profile
```
8) How to remove a user from the system (including his mailbox)?

deluser - this command uses for removing users. File /etc/deluser.conf contains configuration of removing. 

To delete a user's mailbox I need to point "REMOVE_HOME = 1" in /etc/deluser.conf
```
root@ubuntu:~# cat /etc/deluser.conf
```
```
# /etc/deluser.conf: `deluser' configuration.

# Remove home directory and mail spool when user is removed
REMOVE_HOME = 1

# Remove all files on the system owned by the user to be removed
REMOVE_ALL_FILES = 0

# Backup files before removing them. This options has only an effect if
# REMOVE_HOME or REMOVE_ALL_FILES is set.
BACKUP = 0

# target directory for the backup file
BACKUP_TO = "."

# delete a group even there are still users in this group
ONLY_IF_EMPTY = 0

# exclude these filesystem types when searching for files of a user to backup
EXCLUDE_FSTYPES = "(proc|sysfs|usbfs|devpts|tmpfs|afs)"
```
9) What commands and keys should be used to lock and unlock a user account?

usrmod -L -  lock the user account

usrmod -U - unlock the user account

10) How to remove a user's password and provide him with a password-free
login for subsequent password change?
```
passwd --expire "username"
```
11) Display the extended format of information about the directory, tell about
the information columns displayed on the terminal.
```
root@ubuntu:~# ls -la
total 84
drwx------ 11 root root 4096 Apr 25 19:39 .
drwxr-xr-x 23 root root 4096 Apr 17 19:47 ..
-rw-------  1 root root 8885 Apr 24 21:18 .bash_history
-rw-r--r--  1 root root 3106 Oct 22  2015 .bashrc
drwx------  2 root root 4096 Apr 18 17:44 .cache
drwx------  3 root root 4096 Apr 24 17:44 .config
-rw-------  1 root root   42 Apr 18 20:36 .lesshst
drwxr-xr-x  2 root root 4096 Apr 18 17:20 .nano
-rw-r--r--  1 root root  148 Aug 17  2015 .profile
drwxr-xr-x  2 root root 4096 Apr 18 17:41 .ssh
drwxr-xr-x  3 root root 4096 Apr 18 22:05 tes0000
drwxr-xr-x  2 root root 4096 Apr 18 22:56 test
drwxr-xr-x  3 root root 4096 Apr 18 21:32 test1
drwxr-xr-x  3 root root 4096 Apr 18 21:33 test111
-rw-r--r--  1 root root  156 Apr 19 22:01 test.txt
drwxr-xr-x  2 root root 4096 Apr 22 22:37 .vim
-rw-------  1 root root 4384 Apr 25 19:39 .viminfo
-rw-------  1 root root  104 Apr 25 19:38 .Xauthority
```
where:
```
permisson, count of hard links,owner,group,size,create/modefication date, name of file
```
12) What access rights exist and for whom (i. e., describe the main roles)?
Briefly describe the acronym for access rights.

For example [permisson](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m5/task5.2/images/12.png)

14) What commands are used to change the owner of a file (directory), as well
as the mode of access to the file? Give examples, demonstrate on the terminal.

chown USER FILE - this command is used for changing the owner of a file:

```
root@ubuntu:~# chown ubuntu: test.txt
-rw-r--r-- 1 ubuntu ubuntu 156 Apr 19 22:01 test.txt
```

chown -R USER DIRECTORY - recursive changing the owner of a files in directory: 

Before:
```
root@ubuntu:~/test1# ls -la test1/
total 12
drwxr-xr-x  3 root root 4096 Apr 18 21:32 .
drwx------ 11 root root 4096 Apr 25 19:39 ..
drwxr-xr-x  3 root root 4096 Apr 18 21:33 test2
-rwxr-xr-x  1 root root    0 Apr 18 21:32 text.sh
-rw-r--r--  1 root root    0 Apr 18 21:32 text.txt
```
After:
```
root@ubuntu:~# chown -R ubuntu: test1/
root@ubuntu:~# ls -la test1/
total 12
drwxr-xr-x  3 ubuntu ubuntu 4096 Apr 18 21:32 .
drwx------ 11 root   root   4096 Apr 25 19:39 ..
drwxr-xr-x  3 ubuntu ubuntu 4096 Apr 18 21:33 test2
-rwxr-xr-x  1 ubuntu ubuntu    0 Apr 18 21:32 text.sh
-rw-r--r--  1 ubuntu ubuntu    0 Apr 18 21:32 text.txt
```
chmod PERMISSON FILE - this command is used for changing the mode of access to the file

chmod -R PERMISSION DIRECTORY - recursive changing the mode of access to the files in directory.
Before:
```
ls -la test1/
total 12
drw-r--r--  3 ubuntu ubuntu 4096 Apr 18 21:32 .
drwx------ 11 root   root   4096 Apr 25 19:39 ..
drw-r--r--  3 ubuntu ubuntu 4096 Apr 18 21:33 test2
-rw-r--r--  1 ubuntu ubuntu    0 Apr 18 21:32 text.sh
-rw-r--r--  1 ubuntu ubuntu    0 Apr 18 21:32 text.txt
```
After:
```
root@ubuntu:~# chmod -R 666 test1/
root@ubuntu:~# ls -la test1/
total 12
drw-rw-rw-  3 ubuntu ubuntu 4096 Apr 18 21:32 .
drwx------ 11 root   root   4096 Apr 25 19:39 ..
drw-rw-rw-  3 ubuntu ubuntu 4096 Apr 18 21:33 test2
-rw-rw-rw-  1 ubuntu ubuntu    0 Apr 18 21:32 text.sh
-rw-rw-rw-  1 ubuntu ubuntu    0 Apr 18 21:32 text.txt
```
15) What is an example of octal representation of access rights? Describe the
umask command.

When you create a file, you don’t have to decide permissions up front. Permissions have defaults.
Those defaults can be controlled and modified using the umask command.

```root@ubuntu:~# umask
0022
```
Using umask -S to see a human-readable notation:
```
root@ubuntu:~# umask -S
u=rwx,g=rx,o=rx
```
In this case, the user (u), owner of the file, has read, write and execution permissions on files.
Other users belonging to the same group (g) have read and execution permission, same as all the other users (o).

In the numeric notation, we typically change the last 3 digits.

Here’s a list that gives a meaning to the number:
```
0 read, write, execute
1 read and write
2 read and execute
3 read only
4 write and execute
5 write only
6 execute only
7 no permissions
```
I can set a new value for the mask setting the value in numeric format:
```
umask 002
```
or I can change a specific role’s permission:
```
umask g+r
```

16) Give definitions of sticky bits and mechanism of identifier substitution. Give
an example of files and directories with these attributes.

The sticky bit works on directories only. If a user wants to create or delete a file/directory in some directory, he needs write permission on that directory. The write permission on a directory gives a user the privilege to create a file as well as the privilege to remove it.

The /tmp directory is the directory for temporary files/directories. This directory has all the rights on all the three levels because all the users need to create/delete their temporary files. But as the users have write permission on this directory, they can delete any file in this directory. The permissions of that file do not have any effect on deletion.

But with sticky bit set on a directory, anyone can create a file/directory in it, but can delete his own files only. Files owned by other users cannot be deleted.
Example:
```
ubuntu@ubuntu:/home$ chmod +t ubuntunew2
ubuntu@ubuntu:/home$ ls -la
total 20
drwxr-xr-x  5 root    root    4096 Apr 26 21:35 .
drwxr-xr-x 23 root    root    4096 Apr 17 19:47 ..
drwxr-xr-x  3 root    root    4096 Apr 17 20:07 .ecryptfs
drwxr-xr-x  2 ubuntu3 ubuntu3 4096 Apr 26 22:37 ubuntu3
drwxrwxrwt  2 ubuntu  ubuntu  4096 Apr 26 21:35 ubuntunew2

ubuntu@ubuntu:/home$ cd ubuntunew2/
ubuntu@ubuntu:~$ ls -la
total 12
drwxrwxrwt 2 ubuntu ubuntu 4096 Apr 26 21:35 .
drwxr-xr-x 5 root   root   4096 Apr 26 21:35 ..
-rwxrwxr-x 1 ubuntu ubuntu    0 Apr 26 21:33 test4.txt
-rwxrwxr-x 1 ubuntu ubuntu    0 Apr 26 21:33 test5.txt

root@ubuntu:/home/ubuntunew2# su ubuntu3
ubuntu3@ubuntu:/home/ubuntunew2$ rm -f test4.txt
rm: cannot remove 'test4.txt': Operation not permitted
```
In Linux, file attributes are meta-data properties that describe the file’s behavior. For example, an attribute can indicate whether a file is compressed or specify if the file can be deleted.

Some attributes like immutability can be set or cleared, while others like encryption are read-only and can only be viewed. The support for certain attributes depends on the filesystem being used.

17) What file attributes should be present in the command script?

In Linux, file attributes are meta-data properties that describe the file’s behavior. For example, an attribute can indicate whether a file is compressed or specify if the file can be deleted.

Some attributes like immutability can be set or cleared, while others like encryption are read-only and can only be viewed. The support for certain attributes depends on the filesystem being used.
Using the chattr command to change file attributes on Linux file systems:
The chattr command takes the following general form:
```
chattr [OPTIONS] [OPERATOR][ATTRIBUTES] FILE...
```
The value of the [OPERATOR] part can be one of the following symbols:
```
+ - The plus operator tells the chattr to add specified attributes to the existing ones.
- - The minus operator tells the chattr to remove specified attributes from the existing ones.
= - The equal operator tells the chattr to set specified attributes as the only attributes.
The operator is followed by one or more [ATTRIBUTES] flags that you want to add or remove from the file attributes. Below is a list of a few common attributes and associated flags:

a - When this attribute is set, the file can only be opened in append mode for writing.
A - When a file with this attribute set is open, its atime record is not changed. atime (access time) is the last time the file was accessed/opened by some command or application.
e - This attribute denotes that the file is using extents for mapping the blocks on disk. The e attribute cannot be modified with chattr.
i - This attribute indicates that the file is immutable, which means that the file cannot be deleted or renamed.
```
For example:
```
root@ubuntu:~# lsattr
-------------e-- ./test.txt
-------------e-- ./testcopy.txt
-------------e-- ./tes0000
-------------e-- ./test
-------------e-- ./test111
```
```
root@ubuntu:~# chattr +i test.txt
root@ubuntu:~# rm -f test.txt
rm: cannot remove 'test.txt': Operation not permitted
root@ubuntu:~# lsattr
----i--------e-- ./test.txt
-------------e-- ./testcopy.txt
-------------e-- ./tes0000
-------------e-- ./test
-------------e-- ./test111
```
In this example I showed how to set the file ./test.txt as an immutable file.

