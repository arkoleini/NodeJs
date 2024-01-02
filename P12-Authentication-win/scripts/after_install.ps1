# after_install.ps1

# Write to the deploy.log file
Add-Content "C:\AWS\P13-Authentication\deploy.log" "run after_install.ps1"

# Change directory to the application's path
Set-Location -Path "C:\AWS\P13-Authentication"

# Append 'npm install' to the deploy.log file and execute npm install
Add-Content "C:\AWS\P13-Authentication\deploy.log" "npm install"
npm install >> "C:\AWS\P13-Authentication\deploy.log"