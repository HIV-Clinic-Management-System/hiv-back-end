# Remove frontend-related directories
$dirsToRemove = @(
    "src\components",
    "src\contexts", 
    "src\features",
    "src\routes",
    "src\utils"
)

foreach ($dir in $dirsToRemove) {
    if (Test-Path $dir) {
        Write-Host "Removing $dir..."
        Remove-Item -Path $dir -Recurse -Force
    }
}

# Remove frontend-related files
$filesToRemove = @(
    "src\App.jsx",
    "src\App.css",
    "src\main.jsx", 
    "src\index.css",
    "index.html",
    "vite.config.js",
    "eslint.config.js"
)

foreach ($file in $filesToRemove) {
    if (Test-Path $file) {
        Write-Host "Removing $file..."
        Remove-Item -Path $file -Force
    }
}

# Remove .vite directory if it exists
if (Test-Path ".vite") {
    Write-Host "Removing .vite directory..."
    Remove-Item -Path ".vite" -Recurse -Force
}

Write-Host "Frontend cleanup completed successfully!"
