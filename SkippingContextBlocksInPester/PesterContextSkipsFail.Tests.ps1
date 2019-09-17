Describe -Name 'Context Skipping' -Fixture {
    Context -Name 'Skip this' -Tag SkipThis -Fixture {
        It -Name 'should return 2 when passed 1 + 1' -Test {
            1 - 1 | Should -Be 2
        }
    }

    Context -Name 'Do not skip this' -Tag RunThis -Fixture {
        It -Name 'should return 4 when passed 2 + 2' -Test {
            2 + 2 | Should -Be 4
        }
    }
}
