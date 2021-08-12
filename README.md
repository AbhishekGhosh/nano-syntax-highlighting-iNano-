Description 
-----------
[![Build Status](https://travis-ci.org/AbhishekGhosh/openshift-docs.svg?branch=master)](https://travis-ci.org/AbhishekGhosh/nano-syntax-highlighting-iNano-)

The syntax highlighting definitions that come bundled with nano are of
pretty poor quality. This is an attempt at providing a good set of accurate
syntax definitions to replace and expand the defaults.

Note : This is continuation of an unmaintained repo. I have not created all the stuffs.
Nano is practical for me on SSH. 

OS X Nano
---------

Apple forgot to update Nano. This way the best way to update OS X Nano - [OS X Nano Syntax highlighting](https://thecustomizewindows.com/2015/01/os-x-nano-syntax-highlighting/)

Installation
------------

Shortcut :smile:
--------

Applicable to GNU Linux, OS X (After Updating Nano from Vintage 2.0 version).

````
cd ~ && git clone https://github.com/AbhishekGhosh/nano-syntax-highlighting-iNano-.git
cd nano-syntax* && sudo make install-global TEXT=white
nano ~/.nanorc

````
Add these lines and save it

```` 
# include "/usr/local/share/nano/nanorc.nanorc" 
# concatenated by my script #
include "/usr/local/share/nano/ALL.nanorc"

````

Done. Do the same on your Linux Server. `cd ~` always will point towards `$HOME`.

Tl;dr :angry:
-----

Using `make install` will install the syntax definitions to the
`~/.nano/syntax/` directory.

To enable highlighting for *all* languages after installation, add the
following command to your `~/.nanorc` file:

    include ~/.nano/syntax/ALL.nanorc

To enable only a subset of languages, `include` them individually:

    include ~/.nano/syntax/c.nanorc
    include ~/.nano/syntax/python.nanorc
    include ~/.nano/syntax/sh.nanorc
    # ...

If you prefer to install to a location that all users can access, using
`sudo make install-global` will install to `/usr/local/share/nano/`.
Syntax files installed under this directory can then be `include`d in
either `/etc/nanorc` or any user's personal `~/.nanorc`.

**Note**: If your terminal **text** color isn't black, you'll need to
specify it when installing, using `make install TEXT=color`, where
`color` must be one of: `red`, `green`, `yellow`, `blue`, `magenta`,
`cyan` or `white`.

After installation, the various source code samples in the `examples`
directory can be used to check that highlighting is working correctly.
If it doesn't work as expected, see the FAQ below.

Theme System
------------

All `*.nanorc` files are passed through [mixins.sed] and [theme.sed] before
installation. These scripts allow rules to be specified in terms of token
names or [mixins], instead of hard-coded colors.

For example, the following named rule:

    TYPE: "int|bool|string"

becomes:

    color green "int|bool|string"

and the following "mixin":

    +BOOLEAN

becomes:

    color brightcyan "\<(true|false)\>"

This system helps to keep colors uniform across different languages and
also to keep the definitions clear and maintainable, which is something that
becomes quite awkward using only plain [nanorc] files.

**Note:** if `~/.nanotheme` exists it will be used as a custom theme, in
place of [theme.sed]. A custom theme may also be specified by installing
with `make THEME=your-custom-theme.sed`. Themes must be valid sed scripts,
defining *all* color codes found in [theme.sed] in order to work correctly.

FAQ
----

### Why does syntax highlighting only work for a subset of supported files?

There appears to be a bug in older versions of nano that causes
highlighting to fail when `/etc/nanorc` and `~/.nanorc` both contain
`syntax` rules. The usual workaround is to remove all `syntax` and `include`
commands from one file or the other, or to use a newer version of nano.

### Why do I get weird errors when running nano < 2.1.5 on *BSD systems?

In order to reliably highlight keywords, this projects makes heavy use of
the GNU regex word boundary extensions (`\<` and `\>`). BSD implementations
also have these extensions but use a different, incompatible syntax
(`[[:<:]]` and `[[:>:]]`). Since version 2.1.5, nano can automatically
translate the GNU syntax to BSD syntax at run-time, but for the benefit of
people running a pre-2.1.5 version of nano on OS X or *BSD, the `.nanorc`
file itself can be translated by installing with `make BSDREGEX=1`.

### Why not use `\s` instead of the verbose `[[:space:]]` pattern?

Because nano compiles against the platform's native regex library and some
platforms don't support `\s` (as it's not required by POSIX [ERE]).

License
---------

GNU GPL 3.0
