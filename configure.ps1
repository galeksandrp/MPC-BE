function setPath {
    $env:PATH = [Environment]::SystemDirectory,
    $env:WINDIR,
    "$([Environment]::SystemDirectory)\Wbem",
    "$([Environment]::SystemDirectory)\WindowsPowerShell\v1.0\",
    "$env:LOCALAPPDATA\Microsoft\WindowsApps",
    "$env:ProgramFiles\Git\cmd" -join ';'
}

function install {
    & "$((ls _bin\MPC-BE.*.x64.exe)[-1])" /VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP-
}

if ($args[0]) {
    & $args[0]
}
