#!/bin/bash
export ELECTRON_OZONE_PLATFORM_HINT=wayland
exec kando "$@"
