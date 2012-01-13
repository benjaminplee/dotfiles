function rmrf {
    rm -Recurse -Force $Args
}

Set-Alias gitk gitk.cmd

function prompt {
    Write-Host("" + $(get-location) + ">") -nonewline -ForegroundColor Yellow
    return " "
}

function envs {Get-ChildItem Env:}

# run command until it fails
# e.g. insanity rake test
function insanity {
  do { iex $Args } while ($?)
}

cd $home
