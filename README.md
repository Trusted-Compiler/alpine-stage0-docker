### What is it?

This is a [Alpine Linux](https://alpinelinux.org/) based Docker image with bootstrapped [stage0-posix](https://github.com/oriansj/stage0-posix) tools (mescc-tools + mescc-tools-extra + M2-Planet).

### Build steps

1. Build architecture specific `hex0-seed` and `kaem-optional-seed` with `builder-hex0` inside `qemu-system-x86_64` (could *theoretically* be run on bare-metal)
2. Run bootstrap script for stage0-posix (see [stage0 readme](https://github.com/oriansj/stage0-posix/blob/master/README.md#stage0-posix))

### Project structure

- `/arch/` - architecture specific files
- `/arch/env` - architecture specific variables used in scripts
- `/scripts/` - build steps entrypoints scripts
- `/external/` - external repositories used in build process

### [!] Binary dependencies

This is only a proof-of-concept model for trusted system, and we're **assuming** some parts to be trusted for convenience of experimenting.

Host system:
- Host system itself
- `Docker`
- `git` for obtaining the files 

Hosted system:
- `Alpine Linux` image
- `bash` needed for some initial build scripts (easly eliminated)
- `builder-hex0-x86-stage1.img` 
- `qemu-system-x86_64` as host for builder-hex0

### Build image

```console
$ git submodule update --init --recursive
$ docker build -t alpine-stage0:latest .
```

### Future

While it is not main goal for now, for the purposes of building a fully trusted compiler verification system, it is necessary for the host operating system to be bootstrapped from a minimal seed too. We are currently keeping an eye on advances at [live-bootstrap](https://github.com/fosslinux/live-bootstrap) project.
