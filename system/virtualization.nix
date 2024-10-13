{ pkgs, ... }:

{

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  # Workaround to get UEFI working in GNOME Boxes
  # Hopefully temporary
  systemd.tmpfiles.rules =
  let
    firmware =
      pkgs.runCommandLocal "qemu-firmware" { } ''
        mkdir $out
        cp ${pkgs.qemu}/share/qemu/firmware/*.json $out
        substituteInPlace $out/*.json --replace ${pkgs.qemu} /run/current-system/sw
      '';
  in
  [ "L+ /var/lib/qemu/firmware - - - - ${firmware}" ];

  users.users.iburley = { extraGroups = [ "libvirtd" ]; };

}
