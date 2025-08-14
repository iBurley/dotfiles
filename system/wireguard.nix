let
  secrets = import ./secrets.nix;
in

{

  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };

  networking.wireguard.enable = true;
  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "192.168.3.2/24" ];
      listenPort = 51820;

      privateKey = secrets.wireguard.privateKey;

      peers = [
        {
          publicKey = secrets.wireguard.serverPublicKey;
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = secrets.wireguard.serverEndpoint;
          persistentKeepalive = 25;
        }
      ];
    };
  };

}
