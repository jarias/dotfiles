{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    starship
    terraform
    terraform-ls
    go
    modd
    heroku
    gitAndTools.git-trim
    packer
    shfmt
    minikube
    fluxctl
    doctl
    kustomize
    kubernetes-helm
    nodePackages.pnpm
    kubectl
    istioctl
    direnv
    nodejs
  ];

  programs.jq.enable = true;
  programs.neovim = {
    enable       = true;
    vimAlias     = true;
    vimdiffAlias = true;
    withNodeJs   = true;
    withPython   = true;
    withPython3  = true;
    withRuby     = true;
  };
#  programs.kitty = {
#    enable = true;
#    font = {
#      name = "Hack";
#    };
#    settings = {
#      background_opacity      = "0.95";
#      font_size               = "14.0";
#      enable_audio_bell       = "no";
#      visual_bell_duration    = "0.1";
#      background              = "#282936";
#      foreground              = "#e9e9f4";
#      selection_background    = "#e9e9f4";
#      selection_foreground    = "#282936";
#      url_color               = "#62d6e8";
#      cursor                  = "#e9e9f4";
#      active_border_color     = "#626483";
#      inactive_border_color   = "#3a3c4e";
#      active_tab_background   = "#282936";
#      active_tab_foreground   = "#e9e9f4";
#      inactive_tab_background = "#3a3c4e";
#      inactive_tab_foreground = "#62d6e8";
#      color0                  = "#282936";
#      color1                  = "#ea51b2";
#      color2                  = "#ebff87";
#      color3                  = "#00f769";
#      color4                  = "#62d6e8";
#      color5                  = "#b45bcf";
#      color6                  = "#a1efe4";
#      color7                  = "#e9e9f4";
#      color8                  = "#626483";
#      color9                  = "#ea51b2";
#      color10                 = "#ebff87";
#      color11                 = "#00f769";
#      color12                 = "#62d6e8";
#      color13                 = "#b45bcf";
#      color14                 = "#a1efe4";
#      color15                 = "#e9e9f4";
#      color16                 = "#b45bcf";
#      color17                 = "#00f769";
#      color18                 = "#3a3c4e";
#      color19                 = "#4d4f68";
#      color20                 = "#62d6e8";
#      color21                 = "#f1f2f8";
#    };
#    keybindings = {
#      "ctrl+shift+z" = "kitten zoom_toggle.py";
#    };
#  };

  services.dunst = {
    enable = true;
    settings = {
      global = {
        format = "<b>%s</b>\\n%b";
        sort = "yes";
        indicate_hidden = "yes";
        alignment = "left";
        bounce_freq = 0;
        show_age_threshold = 60;
        word_wrap = "yes";
        ignore_newline = "no";
        geometry = "300x5-30+20";
        title = "Dunst";
        class = "Dunst";
        shrink = "no";
        transparency = 5;
        idle_threshold = 120;
        monitor = 0;
        follow = "mouse";
        stack_duplicates = true;
        hide_duplicate_count = false;
        sticky_history = "yes";
        history_length = 20;
        show_indicators = "yes";
        line_height = 0;
        notification_height = 0;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        separator_color = "frame";
        startup_notification = false;
        icon_position = "left";
        always_run_script = true;
        frame_with = 3;
        frame_color = "#aaaaaa";
      };
      urgency_low = {
        background = "#2F343F";
        foreground = "#cccccc";
        frame_color = "#252730";
        timeout = 10;
      };
      urgency_normal = {
        background = "#2F343F";
        foreground = "#cccccc";
        frame_color = "#252730";
      };
      urgency_critical = {
        background = "#900000";
        foreground = "#ffffff";
        frame_color = "#ff0000";
        timeout = 0;
      };
    };
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.arc-theme;
      name = "Arc-Darker";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
  };

#  xsession = {
#    windowManager.command = "dwm";
#    enable = true;
#  };

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jarias";
  home.homeDirectory = "/home/jarias";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";

}
