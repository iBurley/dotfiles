{ pkgs, ... }:

let
  devicePath = "/dev/input/by-id/usb-PCsensor_FootSwitch-event-kbd";
  onSound = "${pkgs.sound-theme-freedesktop}/share/sounds/freedesktop/stereo/audio-volume-change.oga";
  offSound = "${pkgs.sound-theme-freedesktop}/share/sounds/freedesktop/stereo/dialog-information.oga";

  pttScript = pkgs.writeShellScriptBin "wayland-ptt" ''
    set -ux
    ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1

    ${pkgs.evtest}/bin/evtest "${devicePath}" | while read line; do
      if [[ "$line" == *"(KEY_F24), value 1"* ]]; then
        ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0
        ${pkgs.pipewire}/bin/pw-play "${onSound}" &
      elif [[ "$line" == *"(KEY_F24), value 0"* ]]; then
        ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1
        ${pkgs.pipewire}/bin/pw-play "${offSound}" &
      fi
    done
  '';
in
{

  environment.systemPackages = with pkgs; [
    evtest
    sound-theme-freedesktop
  ];

  services.udev.extraRules = ''
    KERNEL=="event*", ATTRS{name}=="PCsensor FootSwitch", MODE="0660", GROUP="input"
  '';

  systemd.user.services.wayland-ptt = {
    description = "System-wide Push-to-Talk";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${pttScript}/bin/wayland-ptt";
      Restart = "always";
      RestartSec = 3;
    };
  };

  users.users.iburley.extraGroups = [ "input" ];

}
