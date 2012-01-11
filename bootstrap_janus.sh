# adapted from https://raw.github.com/carlhuda/janus/master/bootstrap.sh

make_old $HOME/.vim $HOME/.vimrc $HOME/.gvimrc

git clone https://github.com/carlhuda/janus.git $HOME/.vim \
  || die "Could not clone the repository to ${HOME}/.vim"

cd $HOME/.vim || die "Could not go into the ${HOME}/.vim"
rake || die "Rake failed."

make_old $HOME/.vimrc.before
rm_link $PWD/.vimrc.before $HOME/.vimrc.before

make_old $HOME/.vimrc.after
rm_link $PWD/.vimrc.after $HOME/.vimrc.after
