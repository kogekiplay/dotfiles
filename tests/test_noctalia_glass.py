from pathlib import Path
import re
import unittest


ROOT = Path(__file__).resolve().parents[1]
NOCTALIA_SETTINGS = ROOT / "dot_config" / "noctalia" / "settings.toml"
HYPRLAND_CONFIG = ROOT / "dot_config" / "hypr" / "hyprland.lua"


def section(text, name):
    match = re.search(rf"^\[{re.escape(name)}\]\n(?P<body>.*?)(?=^\[|\Z)", text, re.M | re.S)
    if not match:
        raise AssertionError(f"Missing [{name}] section")
    return match.group("body")


def nested_section(text, name):
    match = re.search(rf"^\s+\[{re.escape(name)}\]\n(?P<body>.*?)(?=^\s+\[|^\[|\Z)", text, re.M | re.S)
    if not match:
        raise AssertionError(f"Missing [{name}] section")
    return match.group("body")


def float_value(text, key):
    match = re.search(rf"^\s*{re.escape(key)}\s*=\s*([0-9.]+)", text, re.M)
    if not match:
        raise AssertionError(f"Missing {key}")
    return float(match.group(1))


class NoctaliaGlassTest(unittest.TestCase):
    def test_bar_and_dock_are_translucent_enough_for_layer_blur(self):
        settings = NOCTALIA_SETTINGS.read_text()
        bar_default = nested_section(settings, "bar.default")
        dock = section(settings, "dock")

        self.assertLessEqual(float_value(bar_default, "background_opacity"), 0.70)
        self.assertGreaterEqual(float_value(bar_default, "background_opacity"), 0.55)
        self.assertLessEqual(float_value(bar_default, "capsule_opacity"), 0.36)
        self.assertLessEqual(float_value(dock, "background_opacity"), 0.65)
        self.assertGreaterEqual(float_value(dock, "background_opacity"), 0.45)

    def test_noctalia_surfaces_have_hyprland_layer_blur_enabled(self):
        config = HYPRLAND_CONFIG.read_text()
        layer_rule = config[config.index('name = "noctalia-surfaces"') :]

        self.assertIn('namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$"', layer_rule)
        self.assertIn("blur = true", layer_rule)
        self.assertIn("blur_popups = true", layer_rule)
        self.assertIn("ignore_alpha = 0.5", layer_rule)


if __name__ == "__main__":
    unittest.main()
