Great thanks to @ZiyueWang25 for the original program: I've just updated it to make it work on Plasma (by using `kdotool`), and have made it extensible to any number of apps :)

# Deps

- `kdotool`
  - e.g. `dnf search kdotool` -> `sudo dnf install kdotool`
- `keyd`
  - https://github.com/rvaiya/keyd
  - `sudo usermod -aG keyd "$(whoami)"`

# Example run

```
./autosave.sh org.kde.okular com.vscodium.codium 1
```
Making it run every second is also a good way of checking the app you want to autosave's ID 💡

# Hacking

- `keyd do "C-s"` can be customised, check out what the keys you are pressing's names are with `sudo keyd monitor`
