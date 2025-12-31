# Festina Lente Website - Quick Commands
# Windows PowerShell helper script for common Docker/Hugo tasks

# Colors for output
$Green = "Green"
$Yellow = "Yellow"
$Red = "Red"

function Show-Menu {
    Write-Host "`n=== Festina Lente Hugo Site ===" -ForegroundColor $Green
    Write-Host "1. Start Hugo server (Docker)" -ForegroundColor $Yellow
    Write-Host "2. Build Docker image" -ForegroundColor $Yellow
    Write-Host "3. Start Hugo server (native)" -ForegroundColor $Yellow
    Write-Host "4. Build site (Hugo)" -ForegroundColor $Yellow
    Write-Host "5. Stop Docker container" -ForegroundColor $Yellow
    Write-Host "6. Clean build artifacts" -ForegroundColor $Yellow
    Write-Host "7. View logs" -ForegroundColor $Yellow
    Write-Host "8. Run tests" -ForegroundColor $Yellow
    Write-Host "q. Quit" -ForegroundColor $Red
    Write-Host ""
}

function Start-DockerServer {
    Write-Host "`nStarting Hugo server with Docker..." -ForegroundColor $Green
    Write-Host "Site will be available at: http://localhost:1313" -ForegroundColor $Yellow
    docker-compose up
}

function Build-DockerImage {
    Write-Host "`nBuilding Docker image..." -ForegroundColor $Green
    docker-compose build
}

function Start-NativeServer {
    Write-Host "`nStarting Hugo server (native)..." -ForegroundColor $Green
    Write-Host "Site will be available at: http://localhost:1313" -ForegroundColor $Yellow
    hugo server --buildDrafts --buildFuture
}

function Build-Site {
    Write-Host "`nBuilding Hugo site..." -ForegroundColor $Green
    hugo --minify
    Write-Host "Build complete! Output in ./public/" -ForegroundColor $Green
}

function Stop-DockerServer {
    Write-Host "`nStopping Docker container..." -ForegroundColor $Green
    docker-compose down
}

function Clean-BuildArtifacts {
    Write-Host "`nCleaning build artifacts..." -ForegroundColor $Yellow
    Remove-Item -Path "public" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "resources" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path ".hugo_build.lock" -Force -ErrorAction SilentlyContinue
    Write-Host "Clean complete!" -ForegroundColor $Green
}

function Show-Logs {
    Write-Host "`nShowing Docker logs..." -ForegroundColor $Green
    docker-compose logs -f
}

function Run-Tests {
    Write-Host "`nRunning tests..." -ForegroundColor $Green
    Write-Host "Not implemented yet - add htmltest, lighthouse, pa11y tests here" -ForegroundColor $Yellow
}

# Main loop
do {
    Show-Menu
    $choice = Read-Host "Select an option"
    
    switch ($choice) {
        "1" { Start-DockerServer }
        "2" { Build-DockerImage }
        "3" { Start-NativeServer }
        "4" { Build-Site }
        "5" { Stop-DockerServer }
        "6" { Clean-BuildArtifacts }
        "7" { Show-Logs }
        "8" { Run-Tests }
        "q" { Write-Host "`nGoodbye!" -ForegroundColor $Green; break }
        default { Write-Host "`nInvalid choice, try again." -ForegroundColor $Red }
    }
    
    if ($choice -ne "q") {
        Write-Host "`nPress any key to continue..." -ForegroundColor $Yellow
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
} while ($choice -ne "q")
