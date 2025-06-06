# Base directory (root instead of frontend folder)
$basePath = "d:\DATA\Github\hiv-back-end"

# Frontend directories to remove
$frontendDirs = @(
    "src",
    "node_modules"
)

# Frontend files to remove
$frontendFiles = @(
    "package.json",
    "package-lock.json",
    "vite.config.js",
    "index.html",
    "eslint.config.js",
    ".prettierrc",
    ".prettierignore",
    "tsconfig.json",
    "App.css",
    "App.jsx",
    "main.jsx"
)

# Confirmation before deletion
Write-Host "This script will delete frontend files and directories from: $basePath" -ForegroundColor Yellow
Write-Host "`nDirectories:" -ForegroundColor Cyan
$frontendDirs | ForEach-Object { Write-Host "- $_" }
Write-Host "`nFiles:" -ForegroundColor Cyan
$frontendFiles | ForEach-Object { Write-Host "- $_" }

Write-Host "`nWarning: This action cannot be undone!" -ForegroundColor Red
$confirm = Read-Host "`nDo you want to proceed? (y/N)"

if ($confirm -eq 'y') {
    # Remove directories
    foreach ($dir in $frontendDirs) {
        $path = Join-Path $basePath $dir
        if (Test-Path $path) {
            Write-Host "Removing directory: $dir" -ForegroundColor Yellow
            Remove-Item -Path $path -Recurse -Force
        }
    }

    # Remove files
    foreach ($file in $frontendFiles) {
        $path = Join-Path $basePath $file
        if (Test-Path $path) {
            Write-Host "Removing file: $file" -ForegroundColor Yellow
            Remove-Item -Path $path -Force
        }
    }

    Write-Host "`nFrontend files have been removed successfully." -ForegroundColor Green
} else {
    Write-Host "`nOperation cancelled." -ForegroundColor Cyan
}
