#!/bin/bash
set -u

profile="${HOME}/.local/share/color/icc/27GX-Ultra.icc"
log_dir="${XDG_STATE_HOME:-${HOME}/.local/state}/icc"
log_file="${log_dir}/27gx-dispwin.log"

mkdir -p "$log_dir"

if ! command -v dispwin >/dev/null 2>&1; then
    printf '%s\n' "dispwin not found" >>"$log_file"
    exit 0
fi

if [ ! -f "$profile" ]; then
    printf '%s\n' "profile missing: $profile" >>"$log_file"
    exit 0
fi

export DISPLAY="${DISPLAY:-:0}"

{
    printf '\n[%s] loading %s\n' "$(date -Is)" "$profile"
    dispwin -d 1 -I "$profile" || dispwin -d 1 "$profile"
    dispwin -d 1 -V "$profile"
} >>"$log_file" 2>&1
