$command = "net localgroup administrators 2>&1"
$error_str = ""
$output = cmd /c "$command"

# Write-Host "Output -> $output"

# Check if execution is successful
$res = $output | ? { $_.Contains("command completed successfully") }

# Write-Host "res -> $res"
# Write-Host "exit code -> $LASTEXITCODE"


If ($res -eq $null -And $LASTEXITCODE -ne 0) {
	Write-Host "Failure"
    # Remove blank lines
    $output = $output | ? { $_ -ne "" }
    # Delimit all output lines using ;
    $error_str = $output -join ";"
    Write-Host "Error String -> $error_str"
    
}
Else {
	Write-Host "Success"
}
 