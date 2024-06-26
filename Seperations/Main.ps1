# Import required modules
Import-Module 'C:\Scripts\Separations\MicrosoftGraphAPI.psm1' -Force
Import-Module 'C:\Scripts\Separations\ActiveDirectoryUtils.psm1' -Force



# Import configuration settings
$config = Import-PowerShellDataFile -Path 'C:\Scripts\Separations\Config.psd1'

# Use configuration settings
$clientId = $config.clientId
$clientSecret = $config.clientSecret
$tenantId = $config.tenantId
$scope = $config.scope
$emailToken = $config.emailToken
$projectKey = $config.projectKey
$maxResults = $config.maxResults
$startAt = $config.startAt

$bytes = [System.Text.Encoding]::UTF8.GetBytes($emailToken)
$encodedCred = "Basic " + [System.Convert]::ToBase64String($bytes)

# Set header parameters for Jira API
$headers = @{
    "Accept" = "application/json"
    "Content-Type" = "application/json"
    "Authorization" = $encodedCred
    "X-ExperimentalApi" = "opt-in"
    
}

# Import Active Directory Module
Import-Module ActiveDirectory

Import-Module 'C:\Scripts\Separations\ADSeparationAutomation.psm1' -Force

