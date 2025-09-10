# Define the base registry path
$basePath = "HKLM:\SOFTWARE\extract-technology.lan\Detection"

# Map registry subkeys to printer share names
$printerMap = @{
    "HD-ETL-4505AC-FIN (Colour)" = "\\etlhdfs01\HD-ETL-4505AC-FIN"
    "HD-ETL-3005AC-STORES"       = "\\etlhdfs01\HD-ETL-3005AC-STORES"
    "HD-ETL-4505AC-ENG"          = "\\etlhdfs01\HD-ETL-4505AC-ENG"
    "HD-ETL-4505AC-OPS"          = "\\etlhdfs01\HD-ETL-4505AC-OPS"    
}

foreach ($printerKey in $printerMap.Keys) {
    $fullPath = Join-Path -Path $basePath -ChildPath $printerKey

    if (Test-Path $fullPath) {
        Write-Host "Registry key found: $fullPath"
        $printerShare = $printerMap[$printerKey]

        # Add the printer if not already installed
        if (-not (Get-Printer | Where-Object { $_.Name -eq $printerShare })) {
            Add-Printer -ConnectionName $printerShare
        }
    } else {
        Write-Host "Registry key NOT found: $fullPath"
    }
}
