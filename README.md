Great thanks to @ZiyueWang25 for the original program: I've just updated it to make it work on Plasma (by using `kdotool`), and have made it extensible to any number of apps :)

# Deps

- `kdotool`
  - e.g. `dnf search kdotool` -> `sudo dnf install kdotool`
- `keyd`
  - https://github.com/rvaiya/keyd
  - `sudo usermod -aG keyd "$(whoami)"`
