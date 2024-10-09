# Unix Windows Dressing for your Command Line
## Intent
Linux is my preferred dev OS but a lot of life revolves around Windows.
The absence of the command line experience, though, is what rests heaviest on my fingertips.
This repository details my attempt at trying to get some of that back, hopefully it is somewhat helpful for you too. 

## Details
Unix has an expressive and well-designed array of core utilities, even when limited to filesystem operations (`ls`, `cp`, `mv`, `rm` >>> Powershell's `Set-Item`, `Remove-Item`, etc.).
This repo offers a set of config files and instructions to be able to use these coreutils inside `cmd.exe` like you would on Unix, along with a simplistic substitute for the `|` pipe operator.

## Requirements
* Alacritty (optional) - speedy terminal emulator, feel free to replace with your pick (Wezterm, Kitty, etc). Config files included here are specific to Alacritty though.
* [Clink](https://github.com/chrisant996/clink) - injects GNU `readline` functionality into `cmd.exe`, giving you `vi` editing mode; also comes with amazing auto-completion functionality
* [uutils/coreutils](https://github.com/uutils/coreutils) - Cross-platform GNU coreutils rewritten in Rust and available across MacOS, Linux, and Windows

## Instructions
1. Install [Alacritty](https://github.com/alacritty/alacritty) or terminal emulator of choice. 
   1. Copy repo's `sample_alacritty.toml` to `%userprofile%/AppData/Roaming/alacritty/alacritty.toml`
2. Install [uutils/coreutils](https://github.com/uutils/coreutils)
    1. You may need to install [Rust](https://win.rustup.rs/) which will give you `cargo` to install `coreutils`.
3. Coreutils is generally run using `coreutils <command>` so everything gets run like:
    ```
    ls ==> coreutils ls
    mv ==> coreutils mv
    ```
    which feels really clunky.
4. To fix the above, copy `sample_cmdprofile.bat` to `%userprofile%/cmdprofile.bat`. Then open the Registry Editor (press `Win + R` and type `regedit`)
   1. In the top address bar, navigate to `Computer\HKEY_CURRENT_USER\Software\Microsoft\Command Processor`
   2. Right-click in the empty pane on the right and create a new `String Value` and title it `AutoRun`
   3. Type in the path of the `cmdprofile.bat` file.
   4. This will add a set `doskey` macros that expand strings like `ls` to `coreutils ls` so the command line experience feels much more Unix-esque.
5. Install [Clink](https://github.com/chrisant996/clink)
   1. Copy `sample.inputrc` to `%userprofile%/.inputrc`
   2. This will enable vi editing mode on the command line, skip creating a `.inputrc` file if you don't want this
   3. Clink gives you a pipe operator that will function like a Unix pipe, passing output from one command to another.
