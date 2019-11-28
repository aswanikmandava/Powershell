$ProgressPreference="SilentlyContinue"; 
$ProgressPreference = "SilentlyContinue"; 
$password = ConvertTo-SecureString -String "F!rs5B100d#Sc" -AsPlainText -Force; 
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList "svc-ScienceLogic",$password; 
$session_option = New-PSSessionOption -SkipCACheck; 
$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://mspwpa-ctwdg2g.cs.nycnet/PowerShell -Credential $credential -SessionOption $session_option -Authentication Kerberos; 
$session_output = Import-PSSession $session -CommandName Get-ExchangeServer -DisableNameChecking -AllowClobber; 
$output = "RoleFound : 0`r`n`r`n";  
$ErrorActionPreference = "Stop"; 
try
{
    $results = Get-ExchangeServer | Where-Object { $_.ServerRole -match "Mailbox" -and $_.Name -eq $env:computername -and $_.AdminDisplayVersion -Like "Version 14*" }; 
    $counterset = Get-Counter -listset "MSExchange Database ==> Instances", "MSExchange Database"
    
    if ($results -ne $null -and $counterset -ne $null)
    {
        $output = "RoleFound : 1`r`n`r`n"; 
    }
}
catch {} 
Write-Output $output | Format-List; 
Remove-PSSession $session | Format-List | Out-String -Width 250;