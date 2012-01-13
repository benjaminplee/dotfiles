# Command to allow locally created scripts to run, enforce signing on remote
# set-executionpolicy remotesigned

function make_old([string]$target) {
	If (Test-Path $target) {
			If (Is_Link $target) {
				"${target} file already present as link; removing"
				del $target
			}
			Else {
				"${target} already present; moving to ${target}.old"
				$date_string = Get-Date -Format "%y-%m-%d--%H-%M-%s" 
				mv $target "${target}.${date_string}"
			}
	}
}

function Is_Link([string]$path) {
  $file = Get-Item $path -Force -ea 0
  return [bool]($file.Attributes -band [IO.FileAttributes]::ReparsePoint)
}

function link($target, $source) {
	Write-Host "Creating link to new " $source
echo $target
echo $source
	cmd /c mklink $target $source
}

"Bootstrapping Dot Files in Windows"
"----------------------------------"

########## powershell profile ###########
"Bootstrapping powershell profile"
"--------------------------------"

$profile_folder = [IO.Path]::GetDirectoryName($Profile)

If ( !( Test-Path $profile_folder ) ) {
    "PowerShell profile folder did not exist; creating."
    mkdir -p $profile_folder
}
Else {
	make_old $profile
}

link $profile $pwd\Microsoft.PowerShell_profile.ps1

########## .gitconfig ###########
"Bootstrapping .gitconfig"
"------------------------"

make_old $home\.gitconfig
link $home\.gitconfig $pwd\.gitconfig

########## VIM (Janus) ###########
"Bootstrapping VIM (Janus)"
"------------------------"

#make_old $home\.vimrc
#make_old %home\.gvimrc
#make_old $home\_vimrc
#make_old %home\_gvimrc
#make_old $home\.vimrc
#make_old %home\.gvimrc

If (Test-Path $home\vimfiles) {
	pushd
	cd $home\vimfiles
	git pull origin
	popd
}
Else {
	git clone https://github.com/carlhuda/janus.git $home\vimfiles
}

pushd
cd $home\vimfiles
rake
popd

link $home\_vimrc $home\vimfiles\.vimrc
link $home\.vimrc.before $pwd\.vimrc.before
link $home\.vimrc.after $pwd\.vimrc.after
link $home\.gvimrc.before $pwd\.gvimrc.before
link $home\.gvimrc.after $pwd\.gvimrc.after
