#!/usr/bin/env python3
import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gdk, GLib
import subprocess

css = b"""
window {
    background-color: #282A2E;
}
button {
    background: #373B41;
    color: #C5C8C6;
    border: none;
    border-radius: 6px;
    padding: 10px 20px;
    font-size: 14px;
    min-width: 90px;
}
button:hover {
    background: #F0C674;
    color: #282A2E;
}
#shutdown:hover {
    background: #A54242;
    color: #ffffff;
}
"""

class PowerMenu(Gtk.Window):
    def __init__(self):
        super().__init__(title="Power Menu")
        self.set_position(Gtk.WindowPosition.CENTER)
        self.set_resizable(False)
        self.set_decorated(False)
        self.set_border_width(16)
        self.set_keep_above(True)

        provider = Gtk.CssProvider()
        provider.load_from_data(css)
        Gtk.StyleContext.add_provider_for_screen(
            Gdk.Screen.get_default(),
            provider,
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
        )

        self.connect("key-press-event", self.on_key)
        self.connect("destroy", Gtk.main_quit)
        GLib.timeout_add(300, self._connect_focus_out)

        box = Gtk.Box(spacing=12)
        self.add(box)

        for label, action, name in [
            ("󰌾  Lock",     self.lock,     "lock"),
            ("󰜉  Restart",  self.restart,  "restart"),
            ("󰐥  Shutdown", self.shutdown, "shutdown"),
        ]:
            btn = Gtk.Button(label=label)
            btn.set_name(name)
            btn.connect("clicked", action)
            box.pack_start(btn, True, True, 0)

        self.set_focus_on_map(True)
        self.show_all()
        self.present()

    def _connect_focus_out(self):
        self.connect("focus-out-event", lambda *_: Gtk.main_quit())
        return False

    def on_key(self, widget, event):
        if event.keyval == Gdk.KEY_Escape:
            Gtk.main_quit()

    def lock(self, _):
        subprocess.Popen(["loginctl", "lock-session"])
        Gtk.main_quit()

    def restart(self, _):
        subprocess.Popen(["systemctl", "reboot"])
        Gtk.main_quit()

    def shutdown(self, _):
        subprocess.Popen(["systemctl", "poweroff"])
        Gtk.main_quit()

PowerMenu()
Gtk.main()
