from pathlib import Path
import re
import unittest


ROOT = Path(__file__).resolve().parents[1]
CONFIGURE_SCRIPT = ROOT / "dot_local" / "bin" / "executable_configure-hypr-plugins"
ACTION_SCRIPT = ROOT / "dot_local" / "bin" / "executable_hyprbar-window-action"


class HyprbarsActionsTest(unittest.TestCase):
    def test_titlebar_buttons_call_action_helper(self):
        script = CONFIGURE_SCRIPT.read_text()

        actions = re.findall(r'action = \[\[(.*?)\]\]', script)

        self.assertIn("/home/kogeki/.local/bin/hyprbar-window-action close", actions)
        self.assertIn("/home/kogeki/.local/bin/hyprbar-window-action minimize", actions)
        self.assertIn("/home/kogeki/.local/bin/hyprbar-window-action maximize", actions)

    def test_titlebar_actions_do_not_eval_lua_dispatcher_objects(self):
        script = CONFIGURE_SCRIPT.read_text()
        actions = re.findall(r'(?:action|on_double_click) = \[\[(.*?)\]\]', script)

        self.assertTrue(actions)
        self.assertFalse(any("hyprctl eval" in action for action in actions))

    def test_action_helper_dispatches_lua_window_actions(self):
        script = ACTION_SCRIPT.read_text()

        self.assertIn("hyprctl dispatch 'hl.dsp.window.close()'", script)
        self.assertIn('hyprctl dispatch \'hl.dsp.window.move({ workspace = "special:minimized", follow = false })\'', script)
        self.assertIn('hyprctl dispatch \'hl.dsp.window.fullscreen({ mode = "maximized" })\'', script)

    def test_minimize_does_not_focus_special_workspace(self):
        script = ACTION_SCRIPT.read_text()

        self.assertIn('workspace = "special:minimized", follow = false', script)
        self.assertNotIn('workspace = "special:minimized" })', script)

    def test_maximize_button_keeps_toggle_semantics(self):
        script = ACTION_SCRIPT.read_text()

        self.assertIn('fullscreen({ mode = "maximized" })', script)
        self.assertNotIn('fullscreen({ mode = "maximized", action = "set" })', script)


if __name__ == "__main__":
    unittest.main()
