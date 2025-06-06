# Base frontend directory
$frontendPath = Join-Path "d:\DATA\Github\hiv-back-end" "frontend"

# Frontend directories to remove
$frontendDirs = @(
    "src",
    "public",
    "node_modules"
)

# Frontend config files to remove
$frontendFiles = @(
    "package.json",
    "package-lock.json",
    "vite.config.js",
    "index.html",
    "eslint.config.js",
    ".prettierrc",
    ".prettierignore",
    "tsconfig.json",
    "tailwind.config.js",
    "postcss.config.js",
    "babel.config.js",
    "README.md",
    "vite.svg"
)

# Confirmation before deletion
Write-Host "This script will delete frontend files and directories from: $frontendPath" -ForegroundColor Yellow
Write-Host "`nDirectories:" -ForegroundColor Cyan
$frontendDirs | ForEach-Object { Write-Host "- $_" }
Write-Host "`nFiles:" -ForegroundColor Cyan
$frontendFiles | ForEach-Object { Write-Host "- $_" }

Write-Host "`nWarning: This action cannot be undone!" -ForegroundColor Red
$confirm = Read-Host "`nDo you want to proceed? (y/N)"

if ($confirm -eq 'y') {
    # Check if frontend directory exists
    if (-not (Test-Path $frontendPath)) {
        Write-Host "`nFrontend directory not found at: $frontendPath" -ForegroundColor Red
        exit
    }

    # Remove directories
    foreach ($dir in $frontendDirs) {
        $path = Join-Path $frontendPath $dir
        if (Test-Path $path) {
            Write-Host "Removing frontend directory: $dir" -ForegroundColor Yellow
            Remove-Item -Path $path -Recurse -Force
        }
    }

    # Remove files
    foreach ($file in $frontendFiles) {
        $path = Join-Path $frontendPath $file
        if (Test-Path $path) {
            Write-Host "Removing frontend file: $file" -ForegroundColor Yellow
            Remove-Item -Path $path -Force
        }
    }

    Write-Host "`nFrontend files have been removed successfully." -ForegroundColor Green
} else {
    Write-Host "`nOperation cancelled." -ForegroundColor Cyan
}
