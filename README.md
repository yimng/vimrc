### vim配置

Use below command to install:
```sh
sh <(curl https://raw.githubusercontent.com/yimng/vimrc/master/install.sh -L)
```
This command will install the vimrc into $HOME/.lukun-vim dir

We use the [vundle](https://github.com/VundleVim/Vundle.vim) to manage the plugins, below is the common command for manage the plugins
```sh

Brief help
PluginList       - lists configured plugins
PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
PluginSearch foo - searches for foo; append `!` to refresh local cache
PluginClean      - confirms removal of unused plugins; append `!` to auto-approve remova
```
>There is just one rule you must follow when crafting your own .vimrc.
>Don't put any lines in your vimrc that you don't understand.
