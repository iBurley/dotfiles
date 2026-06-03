{
  config,
  lib,
  ...
}:

{

  options.apps.zed.enable = lib.mkEnableOption "Zed Editor";

  config = lib.mkIf config.apps.zed.enable {

    home-manager.users.iburley =
      { pkgs, pkgs-unstable, ... }:

      {

        programs.zed-editor = {
          enable = true;
          package = pkgs-unstable.zed-editor;
          extraPackages = with pkgs; [
            nixd
            nixfmt
            shellcheck
            shfmt
            stylua
          ];
          userSettings = {
            theme = {
              dark = "Vague";
              light = "Vague";
            };
            buffer_font_family = "JetBrainsMono Nerd Font Mono";
            buffer_font_size = 12;
            buffer_font_weight = 500;
            buffer_line_height = "standard";
            ui_font_family = "JetBrainsMono Nerd Font Mono";
            ui_font_weight = 500;
            ui_font_size = 14;
            active_pane_modifiers.border_size = 1;
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
              bookmarks = false;
              breakpoints = false;
              folds = false;
              min_line_number_digits = 1;
            };
            project_panel.dock = "left";
            outline_panel.dock = "left";
            collaboration_panel.button = false;
            git_panel.dock = "left";
            show_call_status_icon = false;
            tabs = {
              git_status = true;
            };
            tab_size = 2;
            telemetry = {
              diagnostics = false;
              metrics = false;
            };
            disable_ai = true;
            git.inline_blame.enabled = false;
            terminal = {
              font_weight = 500;
            };
            auto_install_extensions = {
              "basher" = true;
              "docker-compose" = true;
              "html" = true;
              "ini" = true;
              "kdl" = true;
              "lua" = true;
              "nix" = true;
              "toml" = true;
              "vague" = true;
            };
            languages = {
              Lua = {
                format_on_save = "on";
                formatter.external = {
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
              Nix = {
                format_on_save = "on";
                formatter.external.command = "nixfmt";
                language_servers = [
                  "nixd"
                  "!nil"
                ];
              };
            };
            lsp.lua-language-server.settings.Lua = {
              diagnostics.globals = [ "vim" ];
              runtime.version = "LuaJIT";
              telemetry.enable = false;
            };
            debugger.button = false;
          };
        };

      };

    programs.nix-ld.enable = true;

  };

}
