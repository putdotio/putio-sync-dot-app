# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import biplist
import os.path

application = defines.get('app', './build/Applications/Putio.app')
appname = os.path.basename(application)

def icon_from_app(app_path):
    plist_path = os.path.join(app_path, 'Contents', 'Info.plist')
    plist = biplist.readPlist(plist_path)
    icon_name = plist['CFBundleIconFile']
    icon_root,icon_ext = os.path.splitext(icon_name)
    if not icon_ext:
        icon_ext = '.icns'
    icon_name = icon_root + icon_ext
    return os.path.join(app_path, 'Contents', 'Resources', icon_name)

format = defines.get('format', 'UDBZ')
size = defines.get('size', '100M')
files = [ application ]
symlinks = { 'Applications': '/Applications' }
badge_icon = icon_from_app(application)
icon_locations = {
    appname:        (140, 120),
    'Applications': (500, 120)
}
background = 'builtin-arrow'
window_rect = ((500, 500), (640, 280))
