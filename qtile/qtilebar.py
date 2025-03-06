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
                widget.Spacer()
                    ,
                widget.Sep(
                    foreground=colors["widgetfg"]  
                )
                ,
                widget.Sep(
                    foreground=colors["widgetfg"],
                    linewidth=3
                    ),
                widget.Battery(
                      background=colors["widgetbg"],
                     foreground=colors["widgetfg"],
                     format=" 󰁹 {percent:2.0%} ",
                     update_interval=10,
                     low_foreground=colors["danger"],
                     low_percentage=0.4,
                     unknown_char="?",
                     show_short_text=False,
                     notify_below=40
                 ),              
                widget.Sep(
                    foreground=colors["widgetfg"],
                    linewidth=3
                    ),

                widget.Volume(
                    background=colors["widgetbg"],
                    foreground=colors["widgetfg"], 
                    get_volume_command='pactl get-sink-volume @DEFAULT_SINK@| awk -F " %" "{print $1}" | awk "{print $5}"',
                    volume_up_command="pactl set-sink-volume @DEFAULT_SINK@ +10%",
                    volume_down_command="pactl set-sink-volume @DEFAULT_SINK@ -10%",
                    mute_command='pactl set-sink-mute @DEFAULT_SINK@ toggle',
                    check_mute_command='pactl list sinks | grep -i -m 1 "Mute" | awk -F ":" "{print $2}"',
                    check_mute_string="yes",
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
                 widget.Sep(
                    foreground=colors["widgetfg"],
                    linewidth=3
                 ), 
                 widget.Systray(),
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
    font="CaskaydiaCove Nerd Font",
    fontsize=14,
    padding=3,
)

