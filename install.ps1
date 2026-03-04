# AgroServ Web App - O'rnatish skripti (PowerShell)
# Windows uchun

Write-Host "========================================" -ForegroundColor Green
Write-Host "   AgroServ Web App O'rnatish Skripti   " -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Node.js tekshirish
Write-Host "1. Node.js tekshirilmoqda..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version 2>&1
    Write-Host "   Node.js mavjud: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "   Node.js topilmadi. Iltimos https://nodejs.org dan yuklab o'rnating (LTS versiya)." -ForegroundColor Red
    Write-Host "   O'rnatilgandan so'ng bu skriptni qayta ishga tushiring." -ForegroundColor Red
    pause
    exit
}

# npm tekshirish
Write-Host "2. npm tekshirilmoqda..." -ForegroundColor Yellow
$npmVersion = npm --version 2>&1
Write-Host "   npm mavjud: $npmVersion" -ForegroundColor Green

# Loyiha papkasiga o'tish
Write-Host ""
Write-Host "3. Loyiha papkasiga o'tilmoqda..." -ForegroundColor Yellow
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptPath
Write-Host "   Papka: $scriptPath" -ForegroundColor Green

# Kutubxonalarni o'rnatish
Write-Host ""
Write-Host "4. Kutubxonalar o'rnatilmoqda (bir necha daqiqa ketishi mumkin)..." -ForegroundColor Yellow
Write-Host "   npm install ishga tushirilmoqda..." -ForegroundColor Cyan

npm install

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "   O'rnatish muvaffaqiyatli yakunlandi!  " -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Ilovani ishga tushirish uchun quyidagi buyruqni bajaring:" -ForegroundColor Cyan
    Write-Host "   npm start" -ForegroundColor White
    Write-Host ""
    Write-Host "Brauzer avtomatik ochiladi: http://localhost:3000" -ForegroundColor Cyan
    Write-Host ""
    
    $startNow = Read-Host "Hozir ishga tushirasizmi? (y/n)"
    if ($startNow -eq "y" -or $startNow -eq "Y") {
        Write-Host "Ilova ishga tushirilmoqda..." -ForegroundColor Green
        npm start
    }
} else {
    Write-Host ""
    Write-Host "O'rnatishda xatolik yuz berdi!" -ForegroundColor Red
    Write-Host "Iltimos Internet ulanishingizni tekshiring va qayta urinib ko'ring." -ForegroundColor Red
}

pause
