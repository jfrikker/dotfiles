pkgs:
  {
    enable = true;
    shellAliases = {
        cd = "z";
        du = "dust";
        http = "xh";
        https = "xh";
        nsh = "nix-shell --command fish";
      };

#    interactiveShellInit = ''
#      function fish_prompt
#        set -l last_status $status
#        if not set -q __fish_git_prompt_show_informative_status
#            set -g __fish_git_prompt_show_informative_status 1
#        end
#        if not set -q __fish_git_prompt_hide_untrackedfiles
#            set -g __fish_git_prompt_hide_untrackedfiles 1
#        end
#
#        if not set -q __fish_git_prompt_color_branch
#            set -g __fish_git_prompt_color_branch magenta --bold
#        end
#        if not set -q __fish_git_prompt_showupstream
#            set -g __fish_git_prompt_showupstream "informative"
#        end
#        if not set -q __fish_git_prompt_char_upstream_ahead
#            set -g __fish_git_prompt_char_upstream_ahead "↑"
#        end
#        if not set -q __fish_git_prompt_char_upstream_behind
#            set -g __fish_git_prompt_char_upstream_behind "↓"
#        end
#        if not set -q __fish_git_prompt_char_upstream_prefix
#            set -g __fish_git_prompt_char_upstream_prefix ""
#        end
#
#        if not set -q __fish_git_prompt_char_stagedstate
#            set -g __fish_git_prompt_char_stagedstate "●"
#        end
#        if not set -q __fish_git_prompt_char_dirtystate
#            set -g __fish_git_prompt_char_dirtystate "✚"
#        end
#        if not set -q __fish_git_prompt_char_untrackedfiles
#            set -g __fish_git_prompt_char_untrackedfiles "…"
#        end
#        if not set -q __fish_git_prompt_char_invalidstate
#            set -g __fish_git_prompt_char_invalidstate "✖"
#        end
#        if not set -q __fish_git_prompt_char_cleanstate
#            set -g __fish_git_prompt_char_cleanstate "✔"
#        end
#
#        if not set -q __fish_git_prompt_color_dirtystate
#            set -g __fish_git_prompt_color_dirtystate blue
#        end
#        if not set -q __fish_git_prompt_color_stagedstate
#            set -g __fish_git_prompt_color_stagedstate yellow
#        end
#        if not set -q __fish_git_prompt_color_invalidstate
#            set -g __fish_git_prompt_color_invalidstate red
#        end
#        if not set -q __fish_git_prompt_color_untrackedfiles
#            set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
#        end
#        if not set -q __fish_git_prompt_color_cleanstate
#            set -g __fish_git_prompt_color_cleanstate green --bold
#        end
#
#        if not set -q __fish_prompt_normal
#            set -g __fish_prompt_normal (set_color normal)
#        end
#
#        set -l color_cwd
#        set -l prefix
#        set -l suffix
#        switch "$USER"
#            case root toor
#                if set -q fish_color_cwd_root
#                    set color_cwd $fish_color_cwd_root
#                else
#                    set color_cwd $fish_color_cwd
#                end
#                set suffix '#'
#            case '*'
#                set color_cwd $fish_color_cwd
#                set suffix '$'
#        end
#
#        # PWD
#        set_color $color_cwd
#        echo -n (prompt_pwd)
#        set_color normal
#
#        printf '%s ' (fish_git_prompt)
#
#        if not test $last_status -eq 0
#            set_color $fish_color_error
#            echo -n "[$last_status] "
#            set_color normal
#        end
#
#        echo -n "$suffix "
#      end
#      '';
    plugins = [
        {
          name = "nix-env";
          src = pkgs.fetchFromGitHub {
            owner = "lilyball";
            repo = "nix-env.fish";
            rev = "7b65bd228429e852c8fdfa07601159130a818cfa";
            sha256 = "RG/0rfhgq6aEKNZ0XwIqOaZ6K5S4+/Y5EEMnIdtfPhk=";
          };
        }
        # {
        #   name = "fzf";
        #   src = pkgs.fetchFromGitHub {
        #     owner = "PatrickF1";
        #     repo = "fzf.fish";
        #     rev = "63c8f8e65761295da51029c5b6c9e601571837a1";
        #     sha256 = "036n50zr9kyg6ad408zn7wq2vpfwhmnfwab465km4dk60ywmrlcb";

        #   };
        # }
      ];
  }
