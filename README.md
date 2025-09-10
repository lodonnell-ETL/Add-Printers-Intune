# Add-Printers-Intune
First, please follow the excellent guide over at Rock My Printers - https://www.rockenroll.tech/2023/03/14/rock-my-printers/ as this is a required step, in the ETL tenant the Enterprise App is already configured.
Once the above has been completed, the script in this repo can be used, make sure you change the following variables.

This variable points the script to the hive in the registry, change the domain to whatever you specified in your config.txt file for Rock My Printers.
$basePath = "HKLM:\SOFTWARE\extract-technology.lan\Detection"

The below is the printers, the left side is what the registry shows, the right is the full network path, this can be FQDN or Non-FQDN, this is used for the foreach loop later.
$printerMap = @{
    "HD-ETL-4505AC-FIN (Colour)" = "\\etlhdfs01\HD-ETL-4505AC-FIN"
    "HD-ETL-3005AC-STORES"       = "\\etlhdfs01\HD-ETL-3005AC-STORES"
    "HD-ETL-4505AC-ENG"          = "\\etlhdfs01\HD-ETL-4505AC-ENG"
    "HD-ETL-4505AC-OPS"          = "\\etlhdfs01\HD-ETL-4505AC-OPS"    
}

Once these have been reconfigured, you can run the script, it is designed to be ran as the logged in user via Intune, but can be used manually.
