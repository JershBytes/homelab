<div align="center">
    <h1> Hardware </h1>
    </i> The Physical Infrastructure</i>
</div>
<br>

### ChonkProx (Proxmox)
This machine is running Proxmox. Handles the game servers and monitoring and other LXC's.

*  Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz (2)
* 256GB DDR4 (2100 MT/s)
* 200GB SAS SSD (Boot Drive)
* 3x200GB Raid 5 for Storage

### NASFeratu (TrueNAS)
This machine is running TrueNAS. It runs all my media shares and backups for proxmox.  

* 12th Gen Intel Core i5 1235U
* 32GB DDR3 (1600 MT/s)
* Kingstson 128GB (Boot Drive)
* x8 Seagate 6TB SAS HDD in a RAID-Z2

### Raspberry Pi 5 (INT-Docker)
This Runs all my internal docker apps that I use as their is not many it also handles some networking. 

* Broadcom BCM2712 2.4GHz quad-core 64-bit Arm Cortex-A76 CPU
* LPDDR4X-4267 SDRAM (8GB)
* Samsung 256GB NVME

### HP T620 Plus (DMZ-Docker)
This Host's all My External Apps like my arr stack and plex tools, also my search engine.

* AMD GX-420CA SOC
* 8GB DDR3(1600 MT/s)
* SanDisk SD8SN8U-256G

