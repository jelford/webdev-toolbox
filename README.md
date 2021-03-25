# webdev-toolbox

`webdev-toolbox` provides a one-stop-shop container for the commandline tools
you were going to install anyway for web development.

The idea is to _speed up your builds_ and _make local development simpler_ by
pre-bundling the obvious things you're going to need, rather than having to
reach out and install them.

- CI Builds get faster because less time is spent installing your tooling
- Local development is easier because the basics are already in place

`webdev-toolbox` is what it sounds like: a _toolbox_ full of useful gadgets.
The emphasis is having the tooling you need close at hand and up to date, 
rather than minimalism or fine tuning: it's meant to lower the barrier to
getting started, so you can focus on your great project, not fiddling with
your environment and worrying about what you're leaving lying around your
system.

## Usage

The image is available here:
```
ghcr.io/jelford/webdev-toolbox:latest
# Or use a pinned version:
ghcr.io/jelford/webdev-toolbox:202103251507
```
The image tag is the output of $(date +%Y%m%d%H%M) at the time of build.

The following sections show specific use-cases, but they're all variations
on using this image.

### Local development

*`toolbox`*: If you use [toolbox](https://github.com/containers/toolbox) you can do:
```
toolbox create -i ghcr.io/jelford/webdev-toolbox:latest -c webdev
toolbox enter webdev
```

*Roll your own*: If you have an established `docker` workflow, or want to customize
the image to suite your needs, you can use this at the top of your `Dockerfile`:

```
FROM ghcr.io/jelford/webdev-toolbox:latest
```

*Build locally*: You can build locally as normal

```
podman build -t webdev .
# or if using docker:
sudo docker build -t webdev --file Containerfile 

# you can then initialize a toolbox using your local image:
toolbox create -i webdev -c webdev
```


### CI

You can use this image to get you started, but if you want to get the best
build speed, you'll want to create your own image containing just what you need.
Don't forget to use `npm ci` instead of `npm install` to speed up initializing
your package.

#### GitHub Actions

#### CircleCI

## What's in the box?

Where possible, tooling is installed directly from the Fedora repositories. That
may be a little behind the bleeding edge in some cases, but it helps manage
keeping this package as up to date as possible.

Things need to get up and running with JavaScript Development:
- Runtime: `nodejs`
- Package managers: `npm`, `yarn`
- Tooling that _wants_ to be globally installed: `grunt-cli`, `gulp-cli`,
  `browserify`

Things you need for testing your app:
- `chromium` and `chromedriver` for your Selenium tests
- `firefox` and `geckodriver`

A grab bag of standard developer tooling:
- VCS: `git`
- Build tooling: `make`, `gcc`
- Extra shells: `zsh` and `fish`

### What's not in the box?

You may have noticed that some standard JS tooling is not in the box:
`webpack`, `gulp`, `grunt` and friends. That's because
each project is likely to use its own version

## Why Fedora?

- Tooling and packages are generally up-to-date
- Permissive licensing around redistribution
- Restrictive licensing around what goes into the distribution itself (which
  enables it to be permissive about what you can do with it).

Ubuntu was the other obvious choice, but [Canonical's IP Policy](https://ubuntu.com/legal/intellectual-property-policy)
is less permissive than [Fedora's](https://fedoraproject.org/wiki/Distribution#Distribution).

