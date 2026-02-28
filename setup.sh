#!/bin/bash

echo "🚀 GANTENGDANN PANEL DEPLOYER STARTING..."

# 1. Izin Folder
chmod -R 777 storage bootstrap/cache
chown -R www-data:www-data /var/gantengdann

# 2. Setup Database Status Online & Log
touch storage/admin_status.txt
touch /var/log/dann_guard.log
chmod 777 storage/admin_status.txt /var/log/dann_guard.log
chown www-data:www-data storage/admin_status.txt /var/log/dann_guard.log

# 3. Izin Sudoers buat Systemctl
if ! grep -q "dann_guard" /etc/sudoers; then
    echo "www-data ALL=(ALL) NOPASSWD: /usr/bin/systemctl start dann_guard, /usr/bin/systemctl stop dann_guard, /usr/bin/systemctl is-active dann_guard" >> /etc/sudoers
fi

# 4. Clear Cache Laravel
php artisan view:clear
php artisan config:clear
php artisan route:clear

echo "✅ SEMUA BERES! PANEL SIAP DI PAKE DI /var/gantengdann"
