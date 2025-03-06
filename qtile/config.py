from qtilebar import myBar,othertweaks
from globalvars import mod,terminal
from qtilekeys import mykeys
from qtilemouse import mymouse
from qtilegroups import mygroups
from qtilelayouts import mylayouts
from qtilescreens import myscreens
from qtilefloatlayout import myfloatlayout

keys = mykeys

groups = mygroups
layouts = mylayouts
widget_defaults = othertweaks
extension_defaults = widget_defaults.copy()

screens=myscreens
# Drag floating layouts.
mouse = mymouse



dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = myfloatlayout
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
