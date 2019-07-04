[CmdletBinding()]
param (
    [Parameter(ValueFromPipelineByPropertyName)]
    [ValidateNotNullOrEmpty()]
    [Alias('ServerInstance')]
    [String]
    $SqlInstance = 'localhost',

    [Parameter(ValueFromPipelineByPropertyName)]
    [ValidateNotNullOrEmpty()]
    [Alias('DB')]
    [String]
    $Database = 'tempdb'
)

