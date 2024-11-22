self: super: {
  linuxPackages_minimal = super.linuxPackages.extend (linux: {
    kernel = linux.kernel.overrideAttrs (old: {
      extraConfig = ''
        # Include only necessary kernel features
        CONFIG_EMBEDDED=y
        CONFIG_MODULES=n
        CONFIG_BLK_DEV_INITRD=n
        CONFIG_KERNEL_XZ=y
        CONFIG_PRINTK=n
        CONFIG_EXPERT=y
      '';
    });
  });
}