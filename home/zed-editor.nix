{ pkgs, pkgs-unstable, ... }:

{

  programs.zed-editor = {
    enable = true;
    package = pkgs-unstable.zed-editor;
    extensions = [
      "basher"
      "docker-compose"
      "html"
      "kanagawa"
      "lua"
      "nix"
    ];
    extraPackages = with pkgs; [
      nixd
      nixfmt-rfc-style
      shellcheck
      shfmt
      stylua
    ];
    userSettings = {
      theme = {
        mode = "system";
        light = "Kanagawa Lotus";
        dark = "Kanagawa Wave";
      };
      buffer_font_family = "JetBrainsMono Nerd Font Mono";
      buffer_font_size = 12;
      buffer_font_weight = 500;
      buffer_line_height = "standard";
      ui_font_family = "JetBrainsMono Nerd Font Mono";
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
      indent_guides.enabled = false;
      project_panel.indent_guides.show = "never";
      collaboration_panel.button = false;
      notification_panel.button = false;
      show_call_status_icon = false;
      tabs = {
        git_status = true;
        file_icons = true;
      };
      tab_size = 2;
      disable_ai = true;
      git.inline_blame.enabled = false;
      terminal = {
        toolbar.breadcrumbs = false;
        font_weight = 500;
      };
      debugger.button = false;
      languages = {
        Lua = {
          format_on_save = "on";
          formatter = {
            external = {
              command = "stylua";
              arguments = [
                "--syntax=LuaJIT"
                "--respect-ignores"
                "--stdin-filepath"
                "{buffer_path}"
                "-"
              ];
            };
          };
        };
        Nix = {
          format_on_save = "on";
          formatter.external.command = "nixfmt";
          language_servers = [
            "nixd"
            "!nil"
          ];
        };
      };
      lsp = {
        lua-language-server = {
          settings = {
            Lua = {
              diagnostics = {
                globals = [ "vim" ];
              };
            };
          };
        };
      };
    };
  };

}
