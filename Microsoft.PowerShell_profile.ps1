function rmrf {
    rm -Recurse -Force $Args
}

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

function restartdb { NET STOP /Y MSSQLSERVER ; NET START MSSQLSERVER }
Set-Alias time Measure-Command
 
function story ($story_number) { $env:story_number = $story_number }
function devs { $env:devs_working = $args}
function ci { $msg = "$($env:story_number) - $($args) ($($env:devs_working))" ; git ci -m $msg}
function cia { $msg = "$($env:story_number) - $($args) ($($env:devs_working))" ; git add . ; git ci -m $msg}
 
function add { git add $Args }
function st { git st }

function d {cd ..}
function u {cd ..}
