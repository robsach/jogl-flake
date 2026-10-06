Nix devShell flake for following [this tutorial](https://github.com/stevemaddock/jogl). Useful if using Nix package manager + a flake for your project. Uses instructions [here](https://github.com/stevemaddock/jogl/blob/e91c5656a83cdb9bfb5db7367888f286050ab963/docs/appendixA.md) as reference.

Use `nix develop` to enter the devshell.

Use command `source aliases.sh` to load an alias called `run`, following recommendation from the tutorial.

As recommended, fetches jdk21 and `jogamp-fat.jar` for version 2.6.0 from https://jogamp.org/deployment/archive/rc/v2.6.0/fat/jogamp-fat.jar.
