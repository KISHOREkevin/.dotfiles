from libqtile import qtile
from qtile_extras import bar,widget
from qtile_extras.widget.decorations import BorderDecoration, PowerLineDecoration,RectDecoration
from colors import catppuccin
terminal="kitty"

powerline={
        "decorations":[
            PowerLineDecoration(path="back_slash")
            ]
        }

sideBtn={
        "decorations":[
            #RectDecoration(colour=catppuccin[13], radius=2, filled=True)
            BorderDecoration(border_width=[2,0,0,0],colour=catppuccin[13])
            ]
        }

myBar=bar.Bar(
             
             [
                widget.TextBox(
                   **sideBtn,
                    text='  ',
                   
                    foreground=catppuccin[13],
                    
                    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(f"{terminal} sysinfo")}

                ),  
                widget.GroupBox(
                    active=catppuccin[13],
                    highlight_method='block',
                    block_highlight_text_color=catppuccin[11],
                    this_current_screen_border=catppuccin[3],
                    padding=5
                    ),
                widget.Spacer( **powerline ),
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
                    
                    **powerline,
                    background=catppuccin[18],
                    foreground=catppuccin[2],
                    format='  {uf} {m} / {s} {m} ',
                    partition="/home",
                    visible_on_warn = False,
                    
                    ),
                
                widget.Volume(
                    **powerline ,
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
                
                widget.Backlight(
                    **powerline , 
                    backlight_name='amdgpu_bl1',
                     format=" 󰃠 {percent:2.0%} ",
                     background=catppuccin[20],
                     foreground=catppuccin[2]
                     ),
                
                widget.Clock(
                     **powerline ,
                     format="  %d-%m-%Y %a | 󰥔 %H:%M ",
                     background=catppuccin[17],
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
                        **powerline,
                         hide_crash=True
                         ),
                 
                 widget.TextBox(
                        **sideBtn,
                         fmt=" ⏻ ",
                         foreground=catppuccin[13],
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

