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

## What's not in the box?

You may have noticed that some standard JS tooling is not in the box:
`webpack`, `gulp`, `grunt` and friends. That's because
each project is likely to use its own version
