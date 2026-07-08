#!/bin/sh
case ":${GTK_MODULES:-}:" in
  *:appmenu-gtk-module:*) ;;
  *)
    if [ -n "${GTK_MODULES:-}" ]; then
      GTK_MODULES="${GTK_MODULES}:appmenu-gtk-module"
    else
      GTK_MODULES="colorreload-gtk-module:appmenu-gtk-module"
    fi
    ;;
esac
export GTK_MODULES
export UBUNTU_MENUPROXY=1
