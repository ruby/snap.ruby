# snap.ruby

[![Snap Status](https://build.snapcraft.io/badge/ruby/snap.ruby.svg)](https://build.snapcraft.io/user/ruby/snap.ruby)

The official ruby packages for snapcraft.io. This is a work in progress.

https://snapcraft.io/ruby

## Download and Install

```
sudo snap install ruby --classic
```

## Development

### Linux

1. `apt install snapcraft`
2. OPTION: Maybe, You need to install lxd environent. see details https://docs.snapcraft.io/clean-build-using-lxc/4157.

### macOS

We recommend to use multipass and snapcraft package of homebrew.

1. Install multipass from https://github.com/CanonicalLtd/multipass/releases
2. `brew tap sergiusens/snapcraft`
3. `brew install —HEAD sergiusens/snapcraft/snapcraft`

You can invoke `snapcraft` command directly on your macOS environment used hyperkit. After that, You can build ruby snap package on this repository used by `snapcraft`.
