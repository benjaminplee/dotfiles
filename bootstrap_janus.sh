# adapted from https://raw.github.com/carlhuda/janus/master/bootstrap.sh

make_old $HOME/.vim $HOME/.vimrc $HOME/.gvimrc

git clone https://github.com/carlhuda/janus.git $HOME/.vim \
  || die "Could not clone the repository to ${HOME}/.vim"

cd $HOME/.vim || die "Could not go into the ${HOME}/.vim"
rake || die "Rake failed."

for i in .vimrc.before .vimrc.after .gvimrc.before .gvimrc.after ; do
  if [[ ( -e $i ) || ( -h $i ) ]]; then
    make_old $HOME/$i
    rm_link $PWD/$i $HOME/$i
  fi
done
