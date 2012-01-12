#!/bin/bash

source bootstrap_include.sh

profile_dir = $HOME\Documents\WindowsPowerShell
profile_file = Microsoft.PowerShell_profile.ps1

mkdir -p $profile_dir

make_old $profile_dir/$profile_file
rm_link $profile_dir/%profile_file $PWD/$profile_file
