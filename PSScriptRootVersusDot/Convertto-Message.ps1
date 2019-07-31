function ConvertTo-Message {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [String]
        $Receiver
    )

    begin {
        Write-Verbose -Message "[$((Get-Date).TimeOfDay)][$($MyInvocation.MyCommand)] Importing function Get-Name"
        . .\Get-Name.ps1
    }

    process {
        $GetNameParams = @{}

        if ($PSBoundParameters.ContainsKey('Receiver')) {
            $GetNameParams.Add('Name', $Receiver)
            Write-Verbose $GetNameParams
        }

        $MessageDetails = Get-Name @GetNameParams

        "To $($MessageDetails.Name), $($MessageDetails.Message)"
    }
}