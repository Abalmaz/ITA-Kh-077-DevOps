#### 2. Install and configure DHCP server on VM1.
**Configure DHCP using VBoxManage**
<br>
![VBoxManager_dhcp](images/VBoxManager_dhcp.png)
![DHCP_ip_VBoxManager](images/DHCP_ip_VBoxManager.png)
**Configure DHCP using DNSMASQ**
![VM1_interfaces](images/VM1_interfaces.png)
![VM1_dnsmasq_conf](images/VM1_dnsmasq_conf.png)
![DHCP_ip_DNSMASQ](images/DHCP_ip_DNSMASQ.png)
#### Using existed network for three VMs (from p.1) install and configure DNS server on VM1. (You can use DNSMASQ, BIND9 or something else).
![VM1_ip](images/VM1_ip.png)
![VM1_dhcp_conf](images/VM1_dhcp_conf.png)
![VM1_iptables](images/VM1_iptables.png)
#### Check VM2 and VM3 for gaining access to DNS server (naming services).
![VM2_dig](images/VM2_dig.png)
![VM3_dig](images/VM3_dig.png)