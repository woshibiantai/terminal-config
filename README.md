# terminal-config
The configurations here are mostly for my Neovim set up, which is optimized to my preference when developing web applications on Angular. I use Neovim in the terminal using iTerm and zsh. The configurations for the terminal can be found in the `/iterm` folder. 

## Installation instructions
1. Make sure you have [ Neovim ](https://github.com/neovim/neovim/wiki/Installing-Neovim) installed. 
2. Clone this repository into your `~/.config/nvim` directory.
3. Open the `init.vim` file using `nvim`: 
```
$ nvim ~/.config/nvim/init.vim
```
4. There will be some errors shown about missing plugins/colorschemes. Just run the vim command: `:PlugInstall`, and all the missing plugins/colorschemes will be installed automatically. If you face any issues regarding post installation webhooks, please ensure that you have `npm` installed. 
5. Quit Neovim and reopen it: The configurations should now be ready :)



