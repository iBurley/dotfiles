{ pkgs, ... }:

let
  devicePath = "/dev/input/by-id/usb-PCsensor_FootSwitch-event-kbd";
  onSound = "${pkgs.sound-theme-freedesktop}/share/sounds/freedesktop/stereo/audio-volume-change.oga";
  offSound = "${pkgs.sound-theme-freedesktop}/share/sounds/freedesktop/stereo/dialog-information.oga";

  pttScript = pkgs.writeShellScriptBin "wayland-ptt" ''
    ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1

    ${pkgs.evtest}/bin/evtest "${devicePath}" | while IFS= read -r line; do
      if [[ "$line" == *"(KEY_F24), value 1"* ]]; then
        ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0
        ${pkgs.procps}/bin/pkill pw-play || true
        ${pkgs.pipewire}/bin/pw-play "${onSound}" &
      elif [[ "$line" == *"(KEY_F24), value 0"* ]]; then
        ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1
        ${pkgs.procps}/bin/pkill pw-play || true
        ${pkgs.pipewire}/bin/pw-play "${offSound}" &
      fi
    done
  '';
in
{

  systemd.user.services.wayland-ptt = {
    description = "System-wide Push-to-Talk";
    after = [
      "pipewire.service"
      "wireplumber.service"
    ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${pttScript}/bin/wayland-ptt";
      Restart = "always";
    };
  };

  users.users.iburley.extraGroups = [ "input" ];

}
