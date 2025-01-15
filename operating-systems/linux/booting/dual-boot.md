### **Dual-Boot Installation**

**Step-by-Step Instructions:**

1. **Prepare the Existing OS:**
   - Back up data to avoid loss.
   - Shrink the OS partition:
     - **Windows:** Use Disk Management to shrink the partition.
     - **Linux:** Use `GParted`.

2. **Create Bootable Media:**
   - Use a USB or DVD as described earlier.

3. **Install Linux:**
   - Boot from the media.
   - In the installer, select "Install alongside existing OS" or manually partition:
     - Create a root partition (`/`), optionally a `/home` partition, and swap space.

4. **Install Bootloader:**
   - The installer will set up GRUB. Verify that both OS options are listed.

5. **Reboot and Verify:**
   - Restart and choose the desired OS from GRUB.