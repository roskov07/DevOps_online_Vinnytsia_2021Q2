## PART 1. HYPERVISORS
1. What are the most popular hypervisors for infrastructure virtualization?

The most popular hypervisors for infrastructure virtualization are VMware Workstation, Oracle VM VirtualBox, Microsoft Hyper-V, VMware ESX Server.

2. Briefly describe the main differences of the most popular hypervisors.

The main differences are that Type 1 hypervisors run as a control program directly on the hardware side of the computer. Virtual machine operating
systems run higher. In turn, Type 2 hypervisors run on the host operating system. Guest virtual machine operating systems are at a higher level. There is also Type 3 (Monolithic) and Type 4 (Microkernel). The monolithic hypervisor includes hardware device drivers (hardware virtualization).
In the case of microkernel, device drivers are located inside the host operating system. 



## PART 2. VirtualBox 
I've installed VirtualBox 6.1 on my PC. My operation system is Windows 10. After I downloaded the Ubuntu Server 18.04 from
the official site. In the next steps you can read the description of my actions with VirtualBox:

1. Creating VM1 and cloning an existing VM1 by creating a VM2 - [image_link](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m2/task2.1/images/creating_png.png)

2. I сreated a group for several VM . For VM1, I changed its state, took several different snapshots, formed a branched
tree of snapshots - [image_link](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m2/task2.1/images/snap_image.png)
3. Exporting VM1. Saving the .ova file to disk. Importing VM from .ova file - [image_link1](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m2/task2.1/images/image_1.8.png), [image_link2](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m2/task2.1/images/image.png)
4. Configuring virtual machines VM1(192.168.56.103) and VM2(192.168.56.104) for local access to each other, but without Internet access. For this, I selected the "Host-only adapter " network mode - [image_link](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m2/task2.1/images/local_ip_settings.png)
5. Configuring virtual machines for Internet access, for this I chose "Bridged networking" network mode - [image_link](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m2/task2.1/images/bridge_settings.png)
6. Working with CLI through VBoxManage. Executing the basic commands of VBoxManage list,
showvminfo, createvm, startvm, modifyvm, clonevm, snapshot, controlvm - [image_link1](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m2/task2.1/images/cli_list.png), [image_link2](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m2/task2.1/images/vm_cl2.png), [image_link3](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m2/task2.1/images/vm_cli1.png)

## PART 3. Vagrant
I downloaded the required version of Vagrant according to the instructions and
according to the host operating system (OS).
1. After creating work folder and initializing the environment I ran a command "vagrant up" - [image_link](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m2/task2.1/images/vagrant_up_1.png)
2. Connecting to the VM using the program PuTTY - [image_link](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m2/task2.1/images/vagrant_up_1.png)
3. Recording the date and time by executing the "date" command - [image_link](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m2/task2.1/images/vagrant_date.png)
4. Stopping and deleting the created VM - [image_link](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m2/task2.1/images/vagrant_destroy.png)
5. Creating and running my Vagrant box - [vagrantfile](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m2/task2.1/images/vagrant_file.png), [image_link](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m2/task2.1/images/own_vagrant_box_.png)

## Conclusion
As a result of the work, I can say that I learned creating VM in VirtualBox and Vagrant, configuring various parameters, network parameters and much more. Also I learned types of hypervisors and how the hypervisors work.
