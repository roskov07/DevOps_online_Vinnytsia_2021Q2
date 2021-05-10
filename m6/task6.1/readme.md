## TASK 6.1

1. Create virtual machines connection according to figure 1.

I created firs virtual machine (VM1) that has 2 interfaces (NAT and internal), network config file of machine - [image1](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.1/image/config_vm1.png)
And I created second virtual machine (VM2) that has one interface (internal), network config file of machine - [image2](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.1/image/config_vm2.png)

2. VM2 has one interface (internal), VM1 has 2 interfaces (NAT and internal). Configure all network
interfaces in order to make VM2 has an access to the Internet (iptables, forward, masquerade).

I configured network between virtual machines according to the task and got the next result - [image1](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.1/image/6.2.png)

3. Check the route from VM2 to Host.

In this case is implementening next command - [image3](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.1/image/6.3.png)

4. Check the access to the Internet, (just ping, for example, 8.8.8.8).

Checking the access to the Internet - [image4](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.1/image/6.4.png)

5. Determine, which resource has an IP address 8.8.8.8.

Determining, which resource has an IP address 8.8.8.8 - [image5](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.1/image/6.5.png)

6. Determine, which IP address belongs to resource epam.com.

Determining, which IP address belongs to resource epam.com - [image6](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.1/image/6.6.png)

7. Determine the default gateway for your HOST and display routing table.

Determining the default gateway for my HOST and displaying routing table(in windows it is 'print route' command) - [image7.1](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.1/image/6.7.1.png),[image7.2](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.1/image/6.7.2.png)

8. Trace the route to google.com.

Tracing the route to google.com - [image8](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.1/image/6.8.png)
