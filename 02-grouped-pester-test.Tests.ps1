BeforeDiscovery -ScriptBlock {
    $Groups = @(
        [PSCustomObject] @{
        Name = 'Server01'
        Value = 1
    }, 
    [PSCustomObject] @{
        Name = 'Server02'
        Value = 2
    },
    [PSCustomObject] @{
        Name = 'Server01'
        Value = 3
    },
    [PSCustomObject] @{
        Name = 'Server02'
        Value = 4
    }
    )

    $groupedGroups = $Groups | Group-Object -Property Name
}

Describe -Name 'Groups in foreach - <_.Name>' -ForEach $groupedGroups -Fixture {
    Context -Name 'Groups in context - <_.Name>' -Fixture {
        It -Name 'Should have a name <_.Name> and a value <_.Value>' -ForEach $_.Group -Test {
            $_.Name | Should -match 'Server\d{2}'
            $_.Value | Should -BeOfType [int]
        }
    }
}
