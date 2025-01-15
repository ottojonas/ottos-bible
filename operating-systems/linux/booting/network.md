### **Network Boot (PXE)**

**Step-by-Step Instructions:**

1. **Set Up PXE Server:**
   - Install and configure a PXE server on a machine in the network:
     - **DHCP and TFTP:** Use `dnsmasq` or `isc-dhcp-server`.
     - Place bootable files (kernel and initrd) in the TFTP directory.

2. **Prepare Boot Images:**
   - Use a distribution’s netboot files (e.g., Debian/Ubuntu provide these on their mirrors).

3. **Configure Client System:**
   - In the target system's BIOS/UEFI, enable PXE boot and ensure the network adapter supports PXE.

4. **Boot and Install:**
   - Start the client system.
   - The PXE server will serve boot files and begin installation.