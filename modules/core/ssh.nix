{ config, ... }:
{
  programs.ssh.extraConfig = ''
    Host dvpc
      Hostname 192.168.1.210
      User david
      RequestTTY force
      # If the port is not 22, uncomment and set it like this:
      # Port 19999
    Host dvtp
      Hostname 192.168.1.205
      User david
      RequestTTY force
      # If the port is not 22, uncomment and set it like this:
      # Port 19999
  '';
}
