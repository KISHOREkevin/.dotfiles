from libqtile import bar,widget,qtile
from colors import colors
terminal="kitty"
myBar=bar.Bar(
             
             [
                widget.TextBox(
                    text='  ',
                    background=colors["sidewidgetbg"],
                    foreground=colors["sidewidgetfg"],
                    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(f"{terminal} sysinfo")}

                ),  
                widget.GroupBox(
                    active=colors["sidewidgetbg"],
                    highlight_method='block',
                    block_highlight_text_color=colors["widgetfg"],
                    this_current_screen_border=colors["widgetbg"],
                    padding=5
                    ),
                widget.Spacer(),
                widget.Sep(
                    foreground=colors["widgetfg"]  
                )
                ,
                widget.Sep(
                    foreground=colors["widgetfg"],
                    linewidth=3
                    ),
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
                    background=colors["widgetbg"],
                    foreground=colors["widgetfg"],
                    format='  {uf} {m} / {s} {m} ',
                    partition="/home",
                    visible_on_warn = False
                    ),
                widget.Sep(
                    foreground=colors["widgetfg"],
                    linewidth=3
                    ),

                widget.Volume(
                    background=colors["widgetbg"],
                    foreground=colors["widgetfg"], 
                    get_volume_command='volumecontrol get-volume',
                    volume_up_command="volumecontrol up",
                    volume_down_command="volumecontrol down",
                    mute_command='volumecontrol mute',
                    check_mute_command='volumecontrol get-mute',
                    check_mute_string="on",
                    unmute_format='   {volume}% ',
                    mute_format='   {volume}% ',
                        mute_foreground=colors["danger"]
                                        ),
                widget.Sep(
                    foreground=colors["widgetfg"],
                    linewidth=3
                    ),

                 widget.Backlight(
                     backlight_name='amdgpu_bl1',
                     format=" 󰃠 {percent:2.0%} ",
                     background=colors["widgetbg"],
                     foreground=colors["widgetfg"]
                     ),
                widget.Sep(
                    foreground=colors["widgetfg"],
                    linewidth=3
                    ),

                 widget.Clock(
                     format="  %d-%m-%Y %a | 󰥔 %H:%M ",
                     background=colors["widgetbg"],
                     foreground=colors["widgetfg"]
        
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
                 widget.Sep(
                    foreground=colors["widgetfg"],
                    linewidth=3
                 ), 
                 widget.Systray( 
                         hide_crash=True
                         ),
                 widget.Sep(
                   foreground=colors["widgetfg"]
                 ),
                 widget.TextBox(
                         fmt=" ⏻ ",
                         background=colors["sidewidgetbg"],
                         foreground=colors["sidewidgetfg"],
                         mouse_callbacks={
                             "Button1": lambda: qtile.cmd_spawn(f"powerscript")
                             }
                         ) 
             ],
             24,
             background=colors["barbg"],
         )

othertweaks=dict(
    font="JetBrainsMonoNL Nerd Font",
    fontsize=14,
    padding=3,
)

