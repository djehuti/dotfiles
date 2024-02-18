## What's in here ##

This directory contains a few posibly-useful things.

  * `ctw`
  * `gbv`

A couple of helper scripts. `ctw` is a filter that cuts its input to
the width of the current tty. I.e., if your terminal is 80 columns
wide and you `cat` something through `ctw` that is 120 columns wide,
it will cut it off at 80 columns instead of wrapping. `gbv` just runs
`git branch -vv | ctw`.

  * `launch`

Running `launch X` is the same as running
`(nohup X < /dev/null > /dev/null 2>&1 &)`.
except that it does dbus stuff.
Handy for running gnome apps from your terminal and detaching them.

  * `waitfor`
  * `signal`

Run `waitfor /tmp/somespecificname`. It will wait. In another window,
run `signal /tmp/somespecificname`. The other window will continue.
Let's say you have three trees you want to build.

In Window 1:

    git rebase && \
    make clean && \
    make && \
    signal /tmp/build1done

In Window 2:

    git rebase && \
    waitfor /tmp/build1done && \
    make clean && \
    make && \
    signal /tmp/build2done

In Window 3:

    git rebase && \
    waitfor /tmp/build2done && \
    make clean && \
    make

This builds the three trees sequentially.

[dotfiles]: https://github.com/djehuti/dotfiles
