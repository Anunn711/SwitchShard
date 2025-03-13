$gamePath = "C:\Program Files (x86)\Steam\steamapps\common"

# Names of the folders
$activeName = "Stoneshard"
$vanillaBackup = "Stoneshard - vanilla"
$moddedBackup = "Stoneshard - modded"

# Full paths
$activePath = Join-Path $gamePath $activeName
$vanillaPath = Join-Path $gamePath $vanillaBackup
$moddedPath = Join-Path $gamePath $moddedBackup

# If active ("Stoneshard") and vanilla backup ("Stoneshard - vanilla") exist, then the active is the modded version.
if ((Test-Path $activePath) -and (Test-Path $vanillaPath)) {
    Write-Host "The game is currently in Modded mode. Do you want to switch to Vanilla? (Y/N)"
    $choice = Read-Host
    if ($choice -eq 'Y' -or $choice -eq 'y') {
        # Save the modded version and activate vanilla:
        Rename-Item -Path $activePath -NewName $moddedBackup
        Rename-Item -Path $vanillaPath -NewName $activeName
        Write-Host "Switched to Vanilla mode."
    } else {
        Write-Host "No changes made."
    }
}
# If active ("Stoneshard") and modded backup ("Stoneshard - modded") exist, then the active is the vanilla version.
elseif ((Test-Path $activePath) -and (Test-Path $moddedPath)) {
    Write-Host "The game is currently in Vanilla mode. Do you want to switch to Modded? (Y/N)"
    $choice = Read-Host
    if ($choice -eq 'Y' -or $choice -eq 'y') {
        # Save the vanilla version and activate modded:
        Rename-Item -Path $activePath -NewName $vanillaBackup
        Rename-Item -Path $moddedPath -NewName $activeName
        Write-Host "Switched to Modded mode."
    } else {
        Write-Host "No changes made."
    }
} else {
    Write-Host "Could not determine the current game mode. Ensure that both the active and one backup folder exist."
}