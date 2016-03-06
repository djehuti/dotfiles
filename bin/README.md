## What's in here ##

This directory contains a few posibly-useful things.

  * `check_workspaces`
  * `git_workspace_status`

These are a couple of Python scripts for managing multiple
workspaces, which depend on the `djehuti.git` package from my
[`dotfiles` repo][dotfiles]. (TODO: Move that into this repo, or merge these
repos altogether.)

The `check_workspaces` script should be run from within a git repo
working directory. It will find the root of the repo (if this is a
`git-new-workdir` repo, it will change to root of the main copy of the
repo) and run `git branch -vv` there, which lists all of the local
branches, their upstreams, and their ahead/behind statuses. It then
prints a summary of all of the working directories for this repo
(assuming they are all sibling subdirectories of a common directory)
and which branch they have checked out. (This is so you can avoid
checking the same branch out on two workdirs at once, which can lead
to a confusing situation.)

The `git_workspace_status` script is intended to be run in a separate
window and left open all the time (maybe in a tmux session...). It
repeatedly runs `check_workspaces` and then `git fetch --all --prune`,
then waits a while and does it again. This keeps your repo up-to-date
(without actually updating any local branches) constantly.

  * `git-new-workdir`

This is the `git-new-workdir` script from the official Git source
repo. Run it with no arguments to see its usage. tl;dr: cd to the
parent of your project repo and run `git-new-workdir proj proj2 master`
and it will create a `proj2` working directory (with `master` checked out
on it) that is a peer of `proj`, and its `.git/*` subdirectories are
(mostly) symlinked to `../../proj/.git/*` so they share all of the same
local state. See [this link][gnw] or Google for more info on this.

  * `ctw`
  * `gbv`

A couple of helper scripts. `ctw` is a filter that cuts its input to
the width of the current tty. I.e., if your terminal is 80 columns
wide and you `cat` something through `ctw` that is 120 columns wide,
it will cut it off at 80 columns instead of wrapping. `gbv` just runs
`git branch -vv | ctw`.

  * `edit`

Useful as an external editor for git/arc/whatever if you use
emacs-server. If you have an emacs running with a server started, it
opens the file to be edited in that emacs instead of firing up a new
one. With `-w`, it waits for the server to finish; without, it
doesn't. (`git config --global core.editor "edit -w"`)

  * `launch`

Running `launch X` is the same as running
`(nohup X < /dev/null > /dev/null 2>&1 &)`.
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

[gnw]: http://nuclearsquid.com/writings/git-new-workdir/
[dotfiles]: https://github.com/djehuti/dotfiles
