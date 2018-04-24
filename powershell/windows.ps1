
# Set-Alias
Set-Alias -Name vim -Value "$env:OneDrive\Tool\vim\vim.exe"
Set-Alias -Name vi -Value "$env:OneDrive\Tool\vim\vim.exe"

# Global Env
$hosts = "$env:windir\system32\drivers\etc\hosts"
$D = [PSCustomObject][Ordered]@{
    Build = "$env:SystemDrive\build";
    Code = "$env:SystemDrive\BeamDataSubmissionTools";
    Doc = "$env:OneDrive\Work\Elekta\Doc";
    Task = "$env:SystemDrive\task";
    OneDrive = $env:OneDrive;
    Swap = "\\10.140.115.108\swap\JimmyLi";
    Tmp = "C:\Users\cnlizhi1\Desktop\tmp"
}

$files = [PSCustomObject][Ordered]@{
    Everything = "$env:ProgramFiles\Everything\Everything.exe"
}

# ShortName

function Doc () {
    Start-Process  -FilePath  $D.Doc;
}

function Task () {
    Start-Process  -FilePath  $D.Task;
}

function OneDrive () {
    Start-Process  -FilePath  $D.OneDrive;
}

function Swap () {
    Start-Process  -FilePath  $D.Swap;
}

function Tmp () {
    Start-Process  -FilePath  $D.Tmp;
}

function qfind () {
    start $files.Everything
}


# Init
Clear-Host
Write-Host "Welcome to windows"
