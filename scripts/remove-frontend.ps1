# Remove frontend directory
$frontEndPath = "..\frontend"
if (Test-Path $frontEndPath) {
    Write-Host "Removing frontend directory..."
    Remove-Item -Path $frontEndPath -Recurse -Force
}

# Clean up package.json references if they exist
$packageJsonPath = "..\package.json"
if (Test-Path $packageJsonPath) {
    Write-Host "Updating package.json..."
    $packageJson = Get-Content $packageJsonPath -Raw | ConvertFrom-Json
    # Remove frontend-related scripts and dependencies
    $packageJson.scripts.PSObject.Properties | Where-Object { $_.Name -match 'frontend' } | ForEach-Object {
        $packageJson.scripts.PSObject.Properties.Remove($_.Name)
    }
    $packageJson | ConvertTo-Json -Depth 10 | Set-Content $packageJsonPath
}

Write-Host "Frontend removal completed successfully!"
