# application_start.ps1

# Append to the deploy.log file indicating the script has started
Add-Content "C:\AWS\P13-Authentication\deploy.log" "Running application_start.ps1"

# Navigate to the directory where app.js is located
Set-Location -Path "C:\AWS\P13-Authentication"

# Start or restart the Node.js application using PM2
Add-Content "C:\AWS\P13-Authentication\deploy.log" "Starting or Restarting nodejs-express-app with PM2"
pm2 start app.js --name "nodejs-express-app" | Out-File "C:\AWS\P13-Authentication\deploy.log" -Append