function Get-Name {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [String]
        $Name
    )

    begin {}

    process {
        if (-not ($PSBoundParameters.ContainsKey('Name'))) {
            $Name = 'there'
        }
        
        [PSCustomObject]@{
            Name = $Name
            Message = "Hello $Name"
        }
    }

    end {}
}
