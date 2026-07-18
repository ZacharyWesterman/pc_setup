# pc_setup

This repo exists purely to streamline setting up ubuntu with all the applications I like.

For a simple one-step setup, run the following command:
```sh
# If curl isn't installed, can use wget
wget https://zacharywesterman.github.io/pc_setup.sh -O - 2>/dev/null | bash
# Or you can use curl, if installed
curl https://zacharywesterman.github.io/pc_setup.sh | bash
```

---

Alternatively, you can clone this repo and manually run the commands.

To install everything, run `./install.sh`. It will prompt for sudoers password and various configs, and will then automatically install all apt and web packages I use often, as well as my repositories.

To update Gnome settings to my preferences, run `./settings.sh`.
