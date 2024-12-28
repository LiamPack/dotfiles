# Dotfiles

usage: 

```bash
bash setup.sh
```

```bash
bash package_setup.sh
```

Components:
- `setup.sh` -- Moves relevant configuration files to home directory.
- `package_setup.sh` -- Installation commands for more niche packages
  - `emacs` manual compile and install (emacs28, out of
    date). Trickiest part is setting library and header file path
    flags.
  - `akku` manual compile and install (scheme)
  - `rg` manual install
  - various apt packages
- `.config` -- config files
  - `redshift.conf` -- Temperatures and brightness for day and night.
- `.bashrc` -- loads `.bash_profile`
- `.bash_profile` -- basic bash config. Adds autocorrect for `cd` and
  recursive globbing with `globstar`. Basic Tmux printing improvement,
  not of my own creation but I'm not sure where I found it.
- `.mbsyncrc` -- Mail configuration. Leaving this here so I know how
  it works if I go back to it someday.
- `.tmux.conf` -- Basic configuration for my needs. Rebindings,
  minimal visual noise.
- `.vimrc` -- A vimrc made byAmir Salihefendic — @amix3k. Minimal,
  does the job. I use Emacs anyhow.
