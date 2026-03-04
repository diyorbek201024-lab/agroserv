#!/bin/bash

echo "========================================"
echo "   AgroServ Web App - O'rnatish         "
echo "========================================"
echo ""

# Node.js tekshirish
echo "1. Node.js tekshirilmoqda..."
if command -v node &>/dev/null; then
    echo "   Node.js mavjud: $(node --version)"
else
    echo "   Node.js topilmadi!"
    echo "   Mac uchun: brew install node"
    echo "   Yoki: https://nodejs.org dan yuklab o'rnating"
    exit 1
fi

echo "2. npm: $(npm --version)"
echo ""

echo "3. Kutubxonalar o'rnatilmoqda..."
npm install

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================"
    echo "   O'rnatish muvaffaqiyatli!             "
    echo "========================================"
    echo ""
    echo "Ilovani ishga tushirish:"
    echo "   npm start"
    echo ""
    echo "Brauzer: http://localhost:3000"
else
    echo "Xatolik yuz berdi!"
fi
