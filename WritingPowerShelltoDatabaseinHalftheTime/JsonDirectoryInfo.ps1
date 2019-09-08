$JsonDirectory = 'C:\Users\shane.oneill\Documents\Kneat\dbachecks\PreviousDataSources'

$FormattedProperties = @(
    Count
)

Get-ChildItem -Path $JsonDirectory |
    Measure-Object -Property Length -AllStats |
    Select-Object -Property