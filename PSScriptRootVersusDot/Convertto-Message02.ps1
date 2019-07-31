function ConvertTo-Message02 {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [String]
        $Receiver
    )

    begin {
        Push-Location -Path ..\
        Write-Verbose "We had to go back up for some reason to $((Get-Location).Path)"

        Write-Verbose -Message "[$((Get-Date).TimeOfDay)][$($MyInvocation.MyCommand)] Importing function Get-Name"
        . .\Get-Name.ps1
    }

    process {
        $GetNameParams = @{}

        if ($PSBoundParameters.ContainsKey('Receiver')) {
            $GetNameParams.Add('Name', $Receiver)
            Write-Verbose ($GetNameParams | Out-String)
        }

        $MessageDetails = Get-Name @GetNameParams

        "To $($MessageDetails.Name), $($MessageDetails.Message)"
    }

    end {
        Pop-Location
        Write-Verbose "We're back to $((Get-Location).Path)!"
    }
}

