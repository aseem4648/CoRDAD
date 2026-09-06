@echo off
title Contactless Respiratory Radar System Launcher
echo ========================================================
echo   CONTACTLESS RESPIRATORY DISTRESS AND APNEA SYSTEM
echo ========================================================
echo.

if not exist "%~dp0backend\node_modules" (
  echo [SETUP] Installing backend dependencies...
  cd /d "%~dp0backend" && call npm install
)

if not exist "%~dp0frontend\node_modules" (
  echo [SETUP] Installing frontend dependencies...
  cd /d "%~dp0frontend" && call npm install
)

echo Starting Backend on port 5000...
start "Respiratory Radar Backend (Port 5000)" cmd /k "cd /d %~dp0backend && npm run dev"

timeout /t 3 /nobreak >nul

echo Starting Frontend on port 3000...
start "Respiratory Radar Frontend (Port 3000)" cmd /k "cd /d %~dp0frontend && npm run dev"

echo.
echo ========================================================
echo System started!
echo Frontend: http://localhost:3000
echo Backend:  http://localhost:5000
echo ========================================================
