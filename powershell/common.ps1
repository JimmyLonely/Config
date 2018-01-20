
## Alias
function ll () {
    Get-ChildItem -Path . -Force
}

# Git
function Git-Rebase ($count) {
    git rebase -i "HEAD~$count"
}
Set-Alias -Name rebase -Value Git-Rebase

function Git-Commit-Temp () {
    git add .
    git commit -m 'refine code'
}
Set-Alias -Name gct -Value Git-Commit-Temp

function Git-Branch ($name) {
    if(!$name) {
        git branch
    } else {
        git checkout $name
    }
}
Set-Alias -Name gb -Value Git-Branch
Set-Alias -Name branch -Value Git-Branch

function Git-Branch-Deleted ($name) {
    if(!$name) {
        git branch
    } else {
        git branch --delete --force $name
    }
}
Set-Alias -Name gbd -Value Git-Branch-Deleted

function Git-Log () {
    Write-Host '-------- Log ---------'
    git log --oneline --max-count=5
}
Set-Alias -Name log -Value Git-Log

function Git-Status () {
    git status
}
Set-Alias -Name status -Value Git-Status

# Custom command
function Get-Child-Directory ($fileName) {
    $filter = "*$fileName*"
    Get-ChildItem -Path . -Filter $filter -Recurse -Force -ErrorAction Ignore | Where-Object {$_.PSIsContainer -eq $true}
}
Set-Alias -Name gcd -Value Get-Child-Directory

function Get-Red-Record ($fileName) {
    if ($fileName) {
        $tmpFile = Get-Content -Path $fileName
        $regex = [Regex] 'openid"=>"(.{28}).*?err_code_des"=>"([^,]*)",'
        $regex.Matches($tmpFile) | ForEach-Object -Process {$_.Groups[1].Value + ',' + $_.Groups[2].Value + ',' + $_.Groups[3].Value} |Out-File -FilePath "formated$fileName.csv"
    } else {
        Write-Host "Invalid params - fileName"
    }
}

function Split-Files ($count) {
    $files = Get-ChildItem -Path . -Filter * | Where-Object -FilterScript {$_.PSIsContainer -eq $false}
    $splitCount = [math]::Ceiling($files.Length/$count)
    For($i = 0; $i -lt $splitCount; $i++)
    {
        New-Item -Path "$i" -ItemType Directory
        $tmpFiles = $files |Select-Object -Skip ($i * $count) -First $count
        $tmpFiles| ForEach-Object -Process {Move-Item -Destination $i -Path $_.fullName }

    }
}

function Join-Files()
{
    $files = Get-ChildItem -Path . -Filter * -Recurse | Where-Object -FilterScript {$_.psisContainer -eq $false}
    For ($i = 0; $i -lt $files.Length; $i++)
    {
        Move-Item -Path $files[$i].FullName -Destination .
    }

    $folders = Get-ChildItem -Path . -Filter * | Where-Object -FilterScript {$_.psisContainer -eq $true}
    $folders | del
}

# Init

