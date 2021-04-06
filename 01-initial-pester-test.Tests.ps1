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
}

Describe -Name 'Groups in foreach - <_>' -ForEach $Groups -Fixture {
    Context -Name 'Current group - <_.Name>' -Fixture {
        It -Name 'Should have a name that matches "Server\d{2}" - <_.Name>' -Test {
            $_.Name | Should -match 'Server\d{2}'
        }
    }
}