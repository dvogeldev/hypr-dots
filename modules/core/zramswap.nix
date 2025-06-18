{ config, ... }:
{
  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };
}
