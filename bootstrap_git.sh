source bootstrap_include.sh

make_old $HOME/.gitconfig
rm_link $HOME/.gitconfig $PWD/.gitconfig

make_old $HOME/.git_bash_prompt
rm_link $HOME/.git_bash_prompt $PWD/.git_bash_prompt
