#!/bin/sh

dconf load / <<EOM
[org/gnome/desktop/wm/keybindings]
switch-to-workspace-1=['<Control><Alt>1']
switch-to-workspace-3=['<Control><Alt>3']
switch-to-workspace-2=['<Control><Alt>2']
switch-to-workspace-4=['<Control><Alt>4']

[org/compiz/profiles/Default/plugins/thumbnail]
thumb-color='#0000007f'
font-background-color='#0000007f'
fade-speed=0.0

[org/compiz/profiles/Default/plugins/grid]
put-maximize-key='<Super>Up'
put-left-key='<Super>Left'
put-restore-key='<Super>Down'
put-right-key='<Super>Right'

[org/compiz/profiles/Default/plugins/core]
hsize=4
active-plugins=['core', 'composite', 'opengl', 'decor', 'compiztoolbox', 'move', 'gnomecompat', 'imgpng', 'regex', 'place', 'animation', 'snap', 'vpswitch', 'resize', 'mousepoll', 'wall', 'grid', 'switcher', 'session', 'workarounds', 'expo', 'thumbnail', 'fade', 'scale']

EOM

