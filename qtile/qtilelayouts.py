from colors import catppuccin
from libqtile import layout

mylayouts=[
    layout.Columns(border_focus=catppuccin["blue"],border_on_single=catppuccin["blue"],margin=2,margin_on_single=5, border_width=2),
    layout.Max(margin=5,border_focus=catppuccin["blue"],border_width=2),
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

