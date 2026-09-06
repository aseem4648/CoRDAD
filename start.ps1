Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "  CONTACTLESS RESPIRATORY DISTRESS AND APNEA SYSTEM" -ForegroundColor White
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

if (-not (Test-Path "$PSScriptRoot\backend\node_modules")) {
    Write-Host "[SETUP] Installing backend dependencies (first run)..." -ForegroundColor Yellow
    Push-Location "$PSScriptRoot\backend"
    npm install
    Pop-Location
}

if (-not (Test-Path "$PSScriptRoot\frontend\node_modules")) {
    Write-Host "[SETUP] Installing frontend dependencies (first run)..." -ForegroundColor Yellow
    Push-Location "$PSScriptRoot\frontend"
    npm install
    Pop-Location
}

Write-Host "Starting Backend on port 5000..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\backend'; npm run dev"

Start-Sleep -Seconds 3

Write-Host "Starting Frontend on port 3000..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\frontend'; npm run dev"

Write-Host ""
Write-Host "System started in separate windows!" -ForegroundColor Yellow
Write-Host "Frontend: http://localhost:3000" -ForegroundColor Cyan
Write-Host "Backend:  http://localhost:5000" -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
