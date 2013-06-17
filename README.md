vim
===

To set up on a new machine:

1. `rm -rf ~/.vim` (backup first if necessary)
2. `mkdir ~/.vim && cd ~/.vim`
2. `git init`
3. `git remote add origin git@github.com:danxshap/vim.git`
4. `git pull origin master`
5. Launch vim and run `:BundleInstall`

Compile YCM using instructions @ https://github.com/Valloric/YouCompleteMe
