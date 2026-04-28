#!/usr/bin/env python3
import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gdk, GLib

css = b"""
window {
    background-color: #282A2E;
    border-radius: 8px;
}
calendar {
    background-color: #282A2E;
    color: #C5C8C6;
    border: none;
    padding: 8px;
    font-size: 13px;
}
calendar:selected {
    background-color: #F0C674;
    color: #282A2E;
    border-radius: 4px;
}
calendar.header {
    background-color: #282A2E;
    color: #F0C674;
    font-weight: bold;
}
calendar.button {
    color: #F0C674;
}
calendar:indeterminate {
    color: #707880;
}
"""

class Calendar(Gtk.Window):
    def __init__(self):
        super().__init__(title="Calendar")
        self.set_position(Gtk.WindowPosition.MOUSE)
        self.set_resizable(False)
        self.set_decorated(False)
        self.set_keep_above(True)
        self.set_border_width(8)

        provider = Gtk.CssProvider()
        provider.load_from_data(css)
        Gtk.StyleContext.add_provider_for_screen(
            Gdk.Screen.get_default(),
            provider,
            Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
        )

        self.connect("key-press-event", lambda w, e: Gtk.main_quit() if e.keyval == Gdk.KEY_Escape else None)
        self.connect("destroy", Gtk.main_quit)
        GLib.timeout_add(300, self._connect_focus_out)

        cal = Gtk.Calendar()
        self.add(cal)

        self.set_focus_on_map(True)
        self.show_all()
        self.present()

    def _connect_focus_out(self):
        self.connect("focus-out-event", lambda *_: Gtk.main_quit())
        return False

Calendar()
Gtk.main()
