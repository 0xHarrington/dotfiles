# Matt's Dotfiles

Look, we all love vim here. But its open-sourced successor NeoVim supports asynchronous function execution. We can't be waiting for execution to process in our CLI editor!

# Setup on a new Linux Machine

Assuming you can't link code editing on the remote box through VSCode, you'll want to get your command line set up nicely. That includes zsh or bash configs, as well as NeoVim and its plugins.

First and foremost, install a bunch of things through `apt`:

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install git yarn neovim -yy
sudo apt install nodejs && sudo apt install npm
```

Clone this repo to the machine, and copy the bash and nvim config to the local config location.

```bash
cd $HOME
git clone https://github.com/0xHarrington/dotfiles.git
mkdir .config/nvim
cp dotfiles/nvim/init.vim .config/nvim/init.vim
cp dotfiles/bash/.bashrc .bashrc
```

We need to have python for some vim plugins, so install Miniconda through the command line using `wget`:

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```

Now you can create any custom environments you want using `conda create -n ENV_NAME`. Whenever you do, or even for your base environment, make sure to install `jedi` for `coc.nvim`, and `pynvim` for general nvim <> python integration.

```bash
conda activate ENV_NAME
pip3 install pynvim
```

Now that we've got python and Linux packages installed, use `curl` to install Vim-Plug for downloading and configuring our plugins:

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Once installed, you can launch nvim and run `:PlugInstall`.

## Coc.nvim

| Note that both Deoplete and CoC require using NeoVim over vim (we love asynchronous execution here)

I've recently replaced Deoplete with [Conquer of Completion](https://github.com/neoclide/coc.nvim) as my autocomplete and formatting solution. Unfortunately, there's a fair amount of legwork necessary to get it working. Note that I've only set up Coc for python formatting, so your milage may vary given the demands of other development environments. Hopefully this will be an effective starting point for you.

Firstly, install the necessary dependencies to your envronment.

```bash
conda activate ENV_NAME
conda install black pylint
```

Now open up NeoVim and run `:CocInstall pyright`. This should give you some prompts, as well as create a `.vim/coc-settings.json` file. Open that, and make sure it looks like the following:

```json
{
  "coc.preferences.formatOnSaveFiletypes": ["python"],
  "python.formatting.provider": "black",
  "python.formatting.blackPath": "~/.miniconda/envs/[ENV_NAME]/bin/black",
  "python.linting.pylintPath": "~/.miniconda/envs/[ENV_NAME]/bin/pylint",
  "python.linting.pylintEnabled": true,
  "python.linting.enabled": true
}
```

Where `ENV_NAME` is the name of your conda environment. Re-open NeoVim, and run `:CocRebuild` to reset the extension. That should work...

***Edit this README for any steps that I forgot to add!***
