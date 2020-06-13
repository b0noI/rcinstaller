# rcinstaller

Nano framework that allows to install any rc files easely with one liner:

```
local RC_PATH=...
curl -s https://raw.githubusercontent.com/b0noI/rcinstaller/master/install.sh | bash /dev/stdin "${RC_PATH}"
```

# How Does It Work?

Overall, the script executes the following steps:

1. checks if the ~/.profile.d directory exists and if not - created it;
2. adds "[ -f ${HOME}/.profile.d/*.sh ] && source ${HOME}/.profile.d/*.sh" to the .zshrc (if it is not exists there already);
3. same for the .bashrc;
4. copies the rc file from the input (or .commonrc if there is no input) from the current directory to the: ~/.profile.d.
