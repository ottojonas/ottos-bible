### **Booting from a USB Drive**

**Step-by-Step Instructions:**

1. **Prepare the USB Drive:**

   - Download the ISO file of your chosen Linux distribution from its official website.
   - Use a tool to create a bootable USB:
     - **Windows:** Use [Rufus](https://rufus.ie/). Select the USB drive, the ISO file, and choose the partition scheme (MBR for BIOS or GPT for UEFI).
     - **Linux/macOS:** Use `dd`:
       ```bash
       sudo dd if=path-to-iso of=/dev/sdX bs=4M status=progress
       ```
       Replace `/dev/sdX` with the USB drive identifier (`lsblk` can help identify it).

2. **Change Boot Order:**

   - Reboot the system and enter the BIOS/UEFI settings (`F2`, `F12`, `Esc`, or `Del` during startup).
   - Set the USB drive as the first boot device.

3. **Boot from USB:**

   - Save BIOS settings and reboot.
   - Select the Linux installation option or test the live environment.

4. **Proceed with Installation:**
   - Choose language, keyboard layout, and installation type (e.g., erase disk, manual partitioning).
   - Follow the installer prompts to complete the setup.
