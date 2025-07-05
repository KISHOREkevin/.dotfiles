from qtilekeys import mykeys
from libqtile.lazy import lazy
from libqtile.config import Key,Group,ScratchPad,DropDown
from globalvars import mod

mygroups =[Group(i) for i in "1234"]
for i in mygroups:
    mykeys.extend(
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

mygroups.append(ScratchPad(' ',[DropDown("terminal","kitty",width=0.9, height=0.9, x=0.05, y=0.05)]))

mykeys.extend(
        [
            Key([mod],"semicolon",lazy.group[' '].dropdown_toggle("terminal"))

        ]
 )

