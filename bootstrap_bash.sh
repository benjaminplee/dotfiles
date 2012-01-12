#!/bin/bash

source bootstrap_include.sh

make_old $HOME/.bashrc
rm_link $HOME/.bashrc $PWD/.bashrc
