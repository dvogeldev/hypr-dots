{ inputs, ... }:
{
  programs.fish.shellAliases = {
    # Utilities
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";
    cl = "clear";
    cla = "clear && ls -la";
    cll = "clear && eza -lh --group-directories-first";
    cls = "clear && ls";
    cat = "bat";
    man = "batman";
    # Nixos
    # nrb = "sudo nixos-rebuild boot --flake ~/mydots#dvpc";
    # nrs = "sudo nixos-rebuild switch --flake ~/mydots#dvpc";
    # nrt = "sudo nixos-rebuild test --flake ~/mydots#dvpc";
    # hms = "home-manager switch --flake ~/mydots#david@dvpc";
    sr = "sudo reboot";
    fb = "nh os boot --hostname nvidia";
    fr = "nh os switch --hostname nvidia";
    ft = "nh os test --hostname nvidia";
    fu = "nh os switch --hostname nvidia --update";
    # Eza
    ls = "eza --group-directories-first --icons --color-scale";
    lt = "eza --tree --level=2 --icons";
    l = "ls -a";
    ld = "l -D";
    ll = "ls -lbG --git";
    la = "ll -a";
    lC = "la --sort=changed";
    lM = "la --sort=modified";
    lS = "la --sort=size";
    lX = "la --sort=extension";
    # Program shortcuts
    v = "nvim";
    free = "free -h";
    # Git
    gall = "git add .";
    lg = "lazygit";
    gcom = "git commit -m";
    gd = "git diff";
    gf = "git fetch";
    gl = "git log --graph --pretty=format:'%Cred%h%Creset - %C(yellow)%d%Creset %s %C(green)(%cr)%C(bold blue) <%an>%Creset' --abbrev-commit";
    gph = "git push";
    gpl = "git pull";
    gs = "git status";
    # YT-DLP
    ytda = "yt-dlp -f bestaudio --extract-audio --audio-format ops --audio-quality 0";
    ytd = "yt-dlp -f bestaudio+bestvideo --merge-output-format mp4";
  };
}
