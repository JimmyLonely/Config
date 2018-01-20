                     ## Powershell Config For Linux ##
# alias
Set-Alias -Name ps -Value Get-Process

# folder
function omn () {
    Set-Location -Path ~/workspace/omnisocials
}

function back () {
    Set-Location -Path ~/workspace/omnisocials/omnisocials-backend/src/modules/nelnmomclub
}

function front () {
    Set-Location -Path ~/workspace/omnisocials/omnisocials-frontend/src/modules/nelnmomclub
}

function task () {
    Set-Location -Path ~/task
}

function home () {
    Set-Location -Path ~
}

# docker
function d-ssh () {
    $sshId = docker ps --filter='name=omnisocials-ssh' -aq
    if ($sshI) {
        docker rm -f $sshId
    }

    $originPath = pwd
    Set-Location -Path ~/workspace/omnisocials/
    ./build.sh ssh -p 8081:8081
    Set-Location -Path $originPath
}

# Software

function Start-Electronic-Wechat () {
    Start-Process  -FilePath '~/private/software/electronic-wechat-linux-x64/electronic-wechat'
}
Set-Alias -Name wechat -Value Start-Electronic-Wechat

# Init
Clear-Host
Write-Host 'Welcome to Linux'
