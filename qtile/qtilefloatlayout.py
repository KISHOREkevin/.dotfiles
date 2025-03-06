from libqtile.config import Match
from libqtile import layout
myfloatlayout=layout.Floating(
        float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),# GPG key password entry
        Match(wm_class="blueman-manager"), # bluetooth
        Match(wm_class="wihotspot"), # hotspot
        Match(wm_class="gufw.py"), # firewall
        Match(wm_class="geany"), # notepad
        Match(wm_class="nwg-look") # gtk settings
    ]

)

