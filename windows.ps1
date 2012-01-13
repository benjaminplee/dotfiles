# Command to allow locally created scripts to run, enforce signing on remote
# set-executionpolicy remotesigned

"Bootstrapping Dot Files in Windows"
"----------------------------------"

function Is_Link([string]$path) {
  $file = Get-Item $path -Force -ea 0
  return [bool]($file.Attributes -band [IO.FileAttributes]::ReparsePoint)
}

$profile_folder = [IO.Path]::GetDirectoryName($Profile)

If ( !( Test-Path $profile_folder ) ) {
    "PowerShell profile folder did not exist; creating."
    mkdir -p $profile_folder
}
Else {
	If (Test-Path $Profile) {
			If (Is_Link($profile)) {
				"Profile already present as link; removing"
				del $Profile
			}
			Else {
				"Profile already present; moving to ${profile}.old"
				$date_string = Get-Date -Format "%y-%m-%d--%H-%M-%s" 
				mv $profile "${profile}.${date_string}"
			}
	}
}

"Creating link to new powershell profile"

cmd /c mklink $profile "${pwd}\Microsoft.PowerShell_profile.ps1"
