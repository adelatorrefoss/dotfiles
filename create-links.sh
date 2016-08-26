# create links to config files

cd ~
ln -fs ~/bin/dotfiles/awesome
ln -fs ~/bin/dotfiles/.bash_aliases
ln -fs ~/bin/dotfiles/.bashrc
ln -fs ~/bin/dotfiles/.ctags
ln -fs ~/bin/dotfiles/.git-completion.bash
ln -fs ~/bin/dotfiles/.gitconfig
ln -fs ~/bin/dotfiles/.i3/
ln -fs ~/bin/dotfiles/.profile
ln -fs ~/bin/dotfiles/.vim/
ln -fs .vim/vimrc .vimrc
ln -fs ~/bin/dotfiles/.i3status.conf
ln -fs ~/bin/dotfiles/.tmux.conf
ln -fs ~/bin/dotfiles/.zshrc
ln -fs ~/bin/dotfiles/.oh-my-zsh
ln -fs ~/bin/dotfiles/.emacs.d
ln -fs ~/bin/dotfiles/.globalrc

mkdir ~/.grails
cd ~/.grails
ln -fs ~/bin/dotfiles/.grails/settings.groovy

mkdir ~/.lein
cd ~/.lein
ln -fs ~/bin/dotfiles/emacs/lein/profiles.clj

#mkdir ~/.gradle
#cd ~/.gradle
#ln -fs ~/bin/dotfiles/gradle.properties

cd ~
