### **Booting from a CD/DVD**

**Step-by-Step Instructions:**

1. **Prepare the CD/DVD:**
   - Download the Linux ISO.
   - Burn it to a disc using:
     - **Windows:** Use [ImgBurn](http://www.imgburn.com/) or similar.
     - **Linux:** Use `Brasero` or the command-line `wodim`:
       ```bash
       wodim dev=/dev/sr0 path-to-iso
       ```

2. **Change Boot Order:**
   - Enter the BIOS/UEFI and set the optical drive as the first boot device.

3. **Boot and Install:**
   - Insert the disc and reboot.
   - Select the installation option and follow the on-screen instructions.