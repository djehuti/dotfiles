#!/usr/bin/env bash

source "${DJEHUTI_SCRIPTLIB:-"${HOME}/.scriptlib"}/init"

djehuti::load term

djehuti::term::begin_altscreen
djehuti::term::hidecursor
djehuti::term::clear

djehuti::term::placestring 20  1 "$(djehuti::term::embolden "Hello, World!")"
djehuti::term::placestring  3  3 "I bet you never thought you'd be here in 2023."
djehuti::term::placestring 30 15 "(press $(djehuti::term::makereverse any) key to exit)"

# Give a filename as an argument; keeps running until that file disappears.
function doclock() {
    local tempfile="$1"
    while [[ -f "$1" ]]; do
        djehuti::term::placestring 60 20 "$(date +'%I:%M:%S%P')"
        sleep 1
    done
}

# Create a dumb unique temp file for us to use.
tempfile="$(mktemp)"
# When this script exits, remove the file. The background job will stop.
trap "rm -f ${tempfile}" EXIT
# Run the function in the background, trusting it to stop when we finish.
doclock "${tempfile}" &

keystroke="$(djehuti::term::getch -t60)"

djehuti::term::normcursor
djehuti::term::end_altscreen

escapedkey="$(echo -ne "${keystroke}" | sed -e $'s/\e/\\\\e/g')"
echo "You pressed '${escapedkey}'."

# cub1 doesn't work because `tput cub1` returns `\b`.
if [[ "${keystroke}" == "$(tput cuf1)" ]]; then
    echo "It was the right arrow key, wasn't it?"
fi

exit 0
