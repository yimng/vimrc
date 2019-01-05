vim配置
=====
Use below command to install:
```sh
sh <(curl https://raw.githubusercontent.com/yimng/vimrc/master/install.sh -L)
```
This command will install the vimrc into $HOME/.lukun-vim dir

We use the vim-plug to manage the plugins, below is the common command for manage the plugins
```sh

PlugInstall    install plugins
PlugUpgrade    Upgrade vim-plug itself
PlugUpdate     Install or Update plugins
PlugStatus     Check the status of plugins
PlugDiff       Examine changes from the previous update and the pending changes
```



>There is just one rule you must follow when crafting your own .vimrc.
>Don't put any lines in your vimrc that you don't understand.
