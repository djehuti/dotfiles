# Script Library

The files in this directory may be `source`d from other shell scripts
to provide library functions, as modules.

Each file `foo` in this directory should add functions that are prefixed
by `djehuti::foo::`, reinforcing the notion of modules.

These functions were written for bash, but should work fine for zsh also
for interactive use. (For scripting, you should be using bash. Shut up.)

The `init` module does a couple of things:

* Points the `DJEHUTI_SCRIPTLIB` environment variable to this directory

* Installs a shell function `djehuti::load` that takes a filename
  (relative to this directory) and sources it. I.e., "djehuti::load term"
  will `source` the `term` file here (which should contain functions
  named `djehuti::term::...`). Specifically, it will load it from the
  `${DJEHUTI_SCRIPTLIB}` directory if that variable is defined, and it
  will default to `~/.scriptlib`, which probably oughta be a symlink
  that points to this directory.

So, in your calling script:

1. `source "${djehuti_SCRIPTLIB:-"${HOME}/.scriptlib"}/init"`.
2. Now you can `djehuti::load term` and whatever other modules you want.

You may want to put #1 above into your .zshrc so you can do djehuti::load
interactively and call those functions too.
