# Linux Bootstrap

A tiny helper repo for installing the base packages I want on a minimal Debian system.

It is just a shortcut so I do not have to write the same apt install command every time.

Run it as root:

```bash
sudo sh debian/base.sh
```

The package list is in:

```text
packages/base.txt
```

This installs the basic Debian tools I use regularly after a minimal install.
