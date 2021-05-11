## TASK 6.2

1. Use already created internal-network for three VMs (VM1-VM3). VM1 has NAT and internal,
VM2, VM3 – internal only interfaces.

I created firs virtual machine (VM1) that has 2 interfaces (NAT and internal), network config file of machine - [image1](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.2/image/vmmainconf.png)

The second virtual machine (VM2) that has one interface (internal), network config file of machine - [image2](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.2/image/vm2conf.png)

The third virtual machine (VM3) that has one interface (internal), network config file of machine - [image3](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.2/image/vm3conf.png)

2. Install and configure DHCP server on VM1.

I installed adn configures DHCP server dnsmasq. 

My /etc/dnsmasq.conf - [image4](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.2/image/dnsmasqconf1.png),[image5](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.2/image/dnsmasqconf2.png)

My /etc/resolv.conf - [image6](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.2/image/resolvmain.png)

My /etc/dhcp/dhcpclient.conf - [image7](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.2/image/dhcp_clientconf.png)

3. Check VM2 and VM3 for obtaining network addresses from DHCP server.

Checking VM2 and VM3 for obtaining network addresses from DHCP server - 
[image8](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.2/image/dhcpall.png)

4. Using existed network for three VMs (from p.1) install and configure DNS server on VM1. (You can
use DNSMASQ, BIND9 or something else).

I configured DNS server on VM1 and my machines have the internet access - [image9](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.2/image/dhcalldig.png)

Also I configured DHCP by virtualbox [image10](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.2/image/vboxdhcp1.png), [image11](https://github.com/rostislavkozlov07/DevOps_online_Vinnytsia_2021Q2/blob/main/m6/task6.2/image/vboxdhcp2.png)
