{ pkgs, pkgs-unstable, ... }:

{

  programs.zed-editor = {
    enable = true;
    package = pkgs-unstable.zed-editor;
    extensions = [
      "docker-compose"
      "html"
      "kanagawa"
      "nix"
    ];
    extraPackages = with pkgs; [
      nil
      nixd
      nixfmt-rfc-style
    ];
    userSettings = {
      theme = {
        mode = "system";
        light = "Kanagawa Lotus";
        dark = "Kanagawa Wave";
      };
      buffer_font_family = "MonaspiceAr Nerd Font Mono";
      buffer_font_size = 12;
      buffer_font_weight = 500;
      buffer_line_height = "standard";
      ui_font_family = "MonaspiceAr Nerd Font Mono";
      ui_font_weight = 500;
      ui_font_size = 14;
      # vim_mode = true;
      toolbar = {
        breadcrumbs = false;
        quick_actions = false;
        selections_menu = false;
        agent_review = false;
      };
      title_bar = {
        show_onboarding_banner = false;
        show_user_picture = false;
        show_sign_in = false;
      };
      gutter = {
        runnables = false;
        breakpoints = false;
        folds = false;
        min_line_number_digits = 1;
      };
      indent_guides = {
        enabled = false;
      };
      project_panel = {
        indent_guides = {
          show = "never";
        };
      };
      collaboration_panel = {
        button = false;
      };
      chat_panel = {
        button = "never";
      };
      notification_panel = {
        button = false;
      };
      show_call_status_icon = false;
      tabs = {
        git_status = true;
        file_icons = true;
      };
      tab_size = 2;
      disable_ai = true;
      terminal = {
        toolbar = {
          breadcrumbs = false;
        };
        font_weight = 500;
      };
      debugger = {
        button = false;
      };
      languages = {
        Nix = {
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
        };
      };
    };
  };

}
