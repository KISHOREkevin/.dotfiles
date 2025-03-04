from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen,ScratchPad,DropDown
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
mod = "mod4"
terminal = "kitty"


keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
   # Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "Left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "Right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key( [mod, "shift"],"Return",lazy.layout.toggle_split(),desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "w", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "Right",lazy.layout.next(),desc="Toggle between windows (next)"),
    Key([mod],"Left",lazy.layout.previous(),desc="Toggle between windows (previous)"),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod,"shift"], "space", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    ]


groups = [Group(i) for i in "1234"]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Columns(border_focus="#f5e0dc",border_on_single="#f5e0dc",margin=2,margin_on_single=5, border_width=2),
    layout.Max(margin=5,border_focus="#f5e0dc",border_width=2),
    #layout.Spiral(main_pane="left",clockwise=False)
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="CaskaydiaCove Nerd Font",
    fontsize=14,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens=[
          Screen(
         top=bar.Bar(
             
             [
                widget.TextBox(
                    text='  ',
                    background="#89b4fa",
                    foreground="#1e1e2e",
                    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(f"{terminal} sysinfo")}

                ),  
                widget.GroupBox(
                    active="#89b4fa",
                    highlight_method='block',
                    block_highlight_text_color="#f9e2af",
                    this_current_screen_border="#313244",
                    padding=5
                    ),
                widget.WindowName(
                    foreground="#89b4fa" 
                    ),
                widget.Sep(
                    foreground="#313244"  
                )
                ,
                widget.DF(
                    background="#313244",
                    foreground="#f9e2af",
                    visible_on_warn=False,
                    partition="/home",
                    format='   {uf}{m}/{s}{m} '
                ),
                widget.Sep(
                    foreground="#313244"
                    ),
                widget.Memory(
                    format='  {Available: .2f}{mm}/{MemTotal: .2f}{mm} ',
                    measure_mem='G',
                    background="#313244",
                    foreground="#f9e2af",
                    update_interval=10
                    ) ,
                widget.Sep(
                    foreground="#313244"
                    ),
                widget.Battery(
                      background="#313244",
                     foreground="#f9e2af",
                     format=" 󰁹 {percent:2.0%} ",
                     update_interval=10,
                     low_foreground="#f38ba8",
                     low_percentage=0.4,
                     unknown_char="?",
                     show_short_text=False,
                     notify_below=40
                 ),              
                widget.Sep(
                    foreground="#313244"
                    ),

                widget.Volume(
                    background="#313244",
                    foreground="#f9e2af", 
                    get_volume_command='pactl get-sink-volume @DEFAULT_SINK@| awk -F " %" "{print $1}" | awk "{print $5}"',
                    volume_up_command="pactl set-sink-volume @DEFAULT_SINK@ +10%",
                    volume_down_command="pactl set-sink-volume @DEFAULT_SINK@ -10%",
                    mute_command='pactl set-sink-mute @DEFAULT_SINK@ toggle',
                    check_mute_command='pactl list sinks | grep -i -m 1 "Mute" | awk -F ":" "{print $2}"',
                    check_mute_string="yes",
                    unmute_format='   {volume}% ',
                    mute_format='   {volume}% ',
                        mute_foreground='#f38ba8'
                                        ),
                widget.Sep(
                    foreground="#313244"
                    ),

                 widget.Backlight(
                     backlight_name='amdgpu_bl1',
                     format=" 󰃠 {percent:2.0%} ",
                     background="#313244",
                     foreground="#f9e2af"
                     ),
                widget.Sep(
                    foreground="#313244"
                    ),

                 widget.Clock(
                     format="  %d-%m-%Y %a | 󰥔 %H:%M ",
                     background="#313244",
                     foreground="#f9e2af"
        
                 ),
                 widget.TextBox(
                         text=" 󰎆 ",
                         mouse_callbacks={
                             "Button1": lambda: qtile.cmd_spawn("ambients")
                             }
                         ),
                 widget.Sep(
                    foreground="#1e1e2e"
                 ), 
                 widget.Systray(),
                 widget.Sep(
                   foreground="#1e1e2e" 
                 ),
                 widget.TextBox(
                         fmt=" ⏻ ",
                         background="#89b4fa",
                         foreground="#1e1e2e",
                         mouse_callbacks={
                             "Button1": lambda: qtile.cmd_spawn(f"powerscript")
                             }
                         ) 
             ],
             24,
             background="#1e1e2e",
         ),
            ),
        ]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# Scratchpad

groups.append(ScratchPad(' ',[DropDown("terminal","kitty",width=0.9, height=0.9, x=0.05, y=0.05,opacity=1)]))
keys.extend(
        [
            Key([mod],"semicolon",lazy.group[' '].dropdown_toggle("terminal"))

        ]
 )

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24
# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
