{
  enable = true;
  extraConfig = ''
      local config = {}
      local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
      workspace_switcher.zoxide_path='~/.nix-profile/bin/zoxide'

      config.color_scheme = 'Catppuccin Frappe'
      config.default_prog = { '/Users/jfrikker/.nix-profile/bin/zsh', '-l' }
      config.font_size = 13.0
      -- config.font = wezterm.font("JetBrains Mono")
      config.inactive_pane_hsb = {
          saturation = 0.5,
          brightness = 0.5,
      }
      config.pane_focus_follows_mouse = true
      config.switch_to_last_active_tab_when_closing_tab = true
      config.tab_bar_at_bottom = true
      config.use_fancy_tab_bar = false
      config.window_decorations = "RESIZE"

      wezterm.on('smart_workspace_switcher.workspace_switcher.created', function(window, path, workspace)
          local editor = window:active_tab()
          editor:set_title("edit")
          editor:panes()[1]:send_text("hx\n")
          local run = window:spawn_tab {}
          run:set_title "run"
          local term = window:spawn_tab {}
          term:set_title "term"
          editor:activate()
        end)

      -- From https://alexplescan.com/posts/2024/08/10/wezterm/
      local function segments_for_right_status(window)
        return {
          window:active_workspace(),
        }
      end

      wezterm.on('update-status', function(window, _)
        local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
        local segments = segments_for_right_status(window)

        local color_scheme = window:effective_config().resolved_palette
        -- Note the use of wezterm.color.parse here, this returns
        -- a Color object, which comes with functionality for lightening
        -- or darkening the colour (amongst other things).
        local bg = wezterm.color.parse(color_scheme.background)
        local fg = color_scheme.foreground

        -- Each powerline segment is going to be coloured progressively
        -- darker/lighter depending on whether we're on a dark/light colour
        -- scheme. Let's establish the "from" and "to" bounds of our gradient.
        local gradient_to, gradient_from = bg
        gradient_from = gradient_to:lighten(0.2)

        -- Yes, WezTerm supports creating gradients, because why not?! Although
        -- they'd usually be used for setting high fidelity gradients on your terminal's
        -- background, we'll use them here to give us a sample of the powerline segment
        -- colours we need.
        local gradient = wezterm.color.gradient(
          {
            orientation = 'Horizontal',
            colors = { gradient_from, gradient_to },
          },
          #segments -- only gives us as many colours as we have segments.
        )

        -- We'll build up the elements to send to wezterm.format in this table.
        local elements = {}

        for i, seg in ipairs(segments) do
          local is_first = i == 1

          if is_first then
            table.insert(elements, { Background = { Color = 'none' } })
          end
          table.insert(elements, { Foreground = { Color = gradient[i] } })
          table.insert(elements, { Text = SOLID_LEFT_ARROW })

          table.insert(elements, { Foreground = { Color = fg } })
          table.insert(elements, { Background = { Color = gradient[i] } })
          table.insert(elements, { Text = ' ' .. seg .. ' ' })
        end

        window:set_right_status(wezterm.format(elements))
      end)

      config.leader = { key = ' ', mods = 'CTRL', timeout_milliseconds = 10000 }
      config.keys = {
          {
              key = "s",
              mods = "CMD",
              action = workspace_switcher.switch_workspace(),
          },
          {
              key = "-",
              mods = "CMD",
              action = wezterm.action.SplitVertical {},
          },
          {
              key = "\\",
              mods = "CMD",
              action = wezterm.action.SplitHorizontal {},
          },
          {
              key = "h",
              mods = "CMD",
              action = wezterm.action.ActivatePaneDirection "Left",
          },
          {
              key = "j",
              mods = "CMD",
              action = wezterm.action.ActivatePaneDirection "Down",
          },
          {
              key = "k",
              mods = "CMD",
              action = wezterm.action.ActivatePaneDirection "Up",
          },
          {
              key = "l",
              mods = "CMD",
              action = wezterm.action.ActivatePaneDirection "Right",
          },
          {
              key = "g",
              mods = "CMD",
              action = wezterm.action.SpawnCommandInNewTab {
                  args = { wezterm.home_dir .. "/.nix-profile/bin/zsh", "-l", "-c", "lazygit" }
              }
          },
          {
              key = "t",
              mods = "CMD",
              action = wezterm.action.SpawnCommandInNewTab {}
          },
          {
              key = 'z',
              mods = 'CMD',
              action = wezterm.action.TogglePaneZoomState,
          },
          {
              key = 'd',
              mods = 'CMD',
              action = wezterm.action.CloseCurrentTab { confirm = true },
          },
      }

      for i = 1, 9 do
        -- CTRL+ALT + number to activate that tab
        table.insert(config.keys, {
          key = tostring(i),
          mods = 'LEADER',
          action = wezterm.action.ActivateTab(i - 1),
        })
      end

      return config
  '';
}
