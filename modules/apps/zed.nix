{ pkgs, inputs, settings, ... }: let
    unstable = import inputs.nixpkgs-unstable { inherit (pkgs) system; };
in{
    home-manager.users.${settings.account.name}.programs.zed-editor = {
        enable = true;
        package = unstable.zed-editor;

        ## This populates the userSettings "auto_install_extensions"
        extensions = ["nix" "toml" "elixir" "make" "haskell" "assembly" ];

        ## everything inside of these brackets are Zed options.
        userSettings = {

            autosave = "on_focus_change";

            indent_guides = {
              enabled = true;
              coloring = "indent_aware";
            };

            hour_format = "hour24";
            auto_update = false;
            terminal = {
                alternate_scroll = "off";
                blinking = "off";
                copy_on_select = false;
                dock = "bottom";
                detect_venv = {
                    on = {
                        directories = [".env" "env" ".venv" "venv"];
                        activate_script = "default";
                    };
                };
                env = {
                    TERM = "foot";
                };
                font_family = "FiraCode Nerd Font";
                font_features = null;
                font_size = null;
                line_height = "comfortable";
                option_as_meta = false;
                button = false;
                shell = "system";
                toolbar = {
                    title = true;
                };
                working_directory = "current_project_directory";
            };



            lsp = {
                rust-analyzer = {

                    binary = {
                        #                        path = lib.getExe pkgs.rust-analyzer;
                        path_lookup = true;
                    };
                };
                nix = {
                    binary = {
                        path_lookup = true;
                    };
                };

                haskell = {
                    binary = {
                      path_lookup = true;
                    };
                };

                };

            ## tell zed to use direnv and direnv can use a flake.nix enviroment.
            load_direnv = "shell_hook";
            base_keymap = "VSCode";
            theme = {
                mode = "system";
                light = "One Light";
                dark = "Catppuccin Espresso (Blur) [Heavy]";
            };
            show_whitespaces = "all";
            ui_font_size = 16;
            buffer_font_size = 16;
        };
    };
}
