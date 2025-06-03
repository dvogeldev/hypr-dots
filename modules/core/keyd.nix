_: {
  services.keyd = {
    enable = true;
    keyboards.default.settings = {
      main = {
        capslock = "(control, esc)";
        esc = "capslock";
      };
    };
  };
}
