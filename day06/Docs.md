Questions: 

1.       How does the availability set work? What is fault/update domain? 
Availability sets are logical groupings of VMs that reduce the change of correlated failures bringing down related VMs at the same time. Each machine in an availaibility set is assigned an update domain and a fault domain by the underlying Azure platform. Update domains indicate groups of virtual machines and underlying physical hardware that can be rebooted at the same time. Fault domains define the group of virtual machines that share a common power source and network switch.
2.       Can we change availability set of an existing VM directly? What would you suggest if a customer wants to do so? 
No. Delete the VM, but keep the Disk, network, then recreate it using a different availability set from command line.

Availability Zone
 
Question: 

1.       What is availability zone and what is it used for?
Availability zones are separated groups of datacenters within a region, they are close enough to have low latency connections, but are also far enough apart to reduce the likelihood that more than one will be affected by local outages or weather. They are designed so that if one zone experiences an outage, the services in remaining zones remains available.

Proximity placement groups 
Question: 

1.       What is PPG and what is it used for? 
A proximity placement group is a logical grouping used to make sure that Azure compute resources are physically located close to each other. it is used for workloads where low latency is a requirement, providing low latency between standalone VMs, between VMs in a single availability set or a virtual machine scale set, between multiple application tiers using different hardware types.
2.       Is it possible to move the VMs which are located in different AV zones to the same PPG? Why? 
No. PPG VMs are in the same datacenter, AV zone VMs are in different datacenter.
