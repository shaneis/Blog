$TestCsv = @'
This,Is,A,Test
Blanks,Are,So,
Blanks,Are,,Awkward
Blanks,,So,Awkward
,Are,So,Awkward
'@

class MyCsv  {
    [String]$Here
    [String]$Is
    [String]$A
    [String]$Test

    MyCsv([String]$Column01, [String]$Column02, [String]$Column03, [String]$Column04) {
        $this.Here = ($Column01, 'N/A')[[String]::IsNullOrWhiteSpace($Column01)]
        $this.Is = ($Column02, 'N/A')[[String]::IsNullOrWhiteSpace($Column02)]
        $this.A = ($Column03, 'N/A')[[String]::IsNullOrWhiteSpace($Column03)]
        $this.Test = ($Column04, 'N/A')[[String]::IsNullOrEmpty($Column04)]
    }
}

ConvertFrom-Csv -InputObject $TestCsv | ForEach-Object {
        [MyCsv]::new($_.This, $_.Is, $_.A, $_.Test)
}
