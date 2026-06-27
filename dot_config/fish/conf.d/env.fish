# Load .env file
if test -f ~/.env
    while read -l line
        if string match -qr '^[^#]' -- "$line"
            set -l parts (string split -m 1 '=' -- "$line")
            if test (count $parts) -eq 2
                set -gx $parts[1] (string trim -c '"' -- $parts[2])
            end
        end
    end < ~/.env
end
