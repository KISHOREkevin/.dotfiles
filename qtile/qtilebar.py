from libqtile import bar,widget,qtile
from colors import catppuccin
terminal="kitty"
myBar=bar.Bar(
             
             [
                widget.TextBox(
                    text='  ',
                    background=catppuccin[13],
                    foreground=catppuccin[2],
                    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(f"{terminal} sysinfo")}

                ),  
                widget.GroupBox(
                    active=catppuccin[13],
                    highlight_method='block',
                    block_highlight_text_color=catppuccin[2],
                    this_current_screen_border=catppuccin[13],
                    padding=5
                    ),
                widget.Spacer(),
                # widget.Battery(
                #       background=colors["widgetbg"],
                #      foreground=colors["widgetfg"],
                #      format=" 󰁹 {percent:2.0%} ",
                #      update_interval=10,
                #      low_foreground=colors["danger"],
                #      low_percentage=0.4,
                #      unknown_char="?",
                #      show_short_text=False,
                #      notify_below=40
                #  ),
                widget.DF(
                    background=catppuccin[18],
                    foreground=catppuccin[2],
                    format='  {uf} {m} / {s} {m} ',
                    partition="/home",
                    visible_on_warn = False
                    ),
                widget.Sep(
                    foreground=catppuccin[2]
                    ),
                widget.Volume(
                    background=catppuccin[19],
                    foreground=catppuccin[2], 
                    get_volume_command='volumecontrol get-volume',
                    volume_up_command="volumecontrol up",
                    volume_down_command="volumecontrol down",
                    mute_command='volumecontrol mute',
                    check_mute_command='volumecontrol get-mute',
                    check_mute_string="on",
                    unmute_format='   {volume}% ',
                    mute_format='   {volume}% ',
                    mute_foreground=catppuccin[21]
                                        ),
                widget.Sep(
                    foreground=catppuccin[2]
                    ),
                widget.Backlight(
                     backlight_name='amdgpu_bl1',
                     format=" 󰃠 {percent:2.0%} ",
                     background=catppuccin[20],
                     foreground=catppuccin[2]
                     ),
                widget.Sep(
                    foreground=catppuccin[2]
                    ),
                widget.Clock(
                     format="  %d-%m-%Y %a | 󰥔 %H:%M ",
                     background=catppuccin[17],
                     foreground=catppuccin[2]
        
                 ),
                widget.Sep(
                    foreground=catppuccin[2]
                    ),
                 widget.TextBox(
                         text=" 󰎆 ",
                         mouse_callbacks={
                             "Button1": lambda: qtile.cmd_spawn("ambients")
                             }
                 ),
                 widget.TextBox(
                    text=" 󰸉 ",
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn("wallpaper random"),
                        "Button3": lambda: qtile.cmd_spawn("wallpaper set")
                    }
                 ), 
                 widget.Systray( 
                         hide_crash=True
                         ),
                 
                 widget.TextBox(
                         fmt=" ⏻ ",
                         background=catppuccin[13],
                         foreground=catppuccin[2],
                         mouse_callbacks={
                             "Button1": lambda: qtile.cmd_spawn(f"powerscript")
                             }
                         ) 
             ],
             24,
             background=catppuccin[2],
         )

othertweaks=dict(
    font="JetBrainsMonoNL Nerd Font",
    fontsize=14,
    padding=3,
)

