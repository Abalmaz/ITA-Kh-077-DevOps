#### 2. VM2 has one interface (internal), VM1 has 2 interfaces (NAT and internal). Configure all network interfaces in order to make VM2 has an access to the Internet (iptables, forward, masquerade).
VM1:
<br>
![VM1_ip](images/VM1_ip.png)
![VM1_interfaces](images/VM1_interfaces.png)
![VM1_iptables](images/VM1_iptables.png)
VM2:
![VM2_ip_route](images/VM2_ip_route.png)
![VM2_interfaces](images/VM2_interfaces.png)
#### 3. Check the route from VM2 to Host.
![VM2_ping_host](images/VM2_ping_host.png)
#### 4. Check the access to the Internet, (just ping, for example, 8.8.8.8).
![VM2_ping](images/VM2_ping.png)
#### 5. Determine, which resource has an IP address 8.8.8.8.
![resource_ip](images/resource_ip.png)
#### 6. Determine, which IP address belongs to resource epam.com.
![ip_from_hostname](images/ip_from_hostname.png)
#### 7. Determine the default gateway for your HOST and display routing table.
![host_routing](images/host_routing.png)
#### 8. Trace the route to google.com.
![traceroute_google](images/traceroute_google.png)
