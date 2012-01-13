# Command to allow locally created scripts to run, enforce signing on remote
# set-executionpolicy remotesigned

function make_old([string]$target) {
	If (Test-Path $target) {
			If (Is_Link($target)) {
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
	make_old($profile)
}

"Creating link to new powershell profile"
cmd /c mklink $profile "${pwd}\Microsoft.PowerShell_profile.ps1"

########## .gitconfig ###########
"Bootstrapping .gitconfig"
"------------------------"


