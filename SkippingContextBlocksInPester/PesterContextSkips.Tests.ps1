Describe -Name 'Context Skipping' -Tag SkipThis -Fixture {
    Context -Name 'Skip this' -Fixture {
        It -Name 'should return 2 when passed 1 + 1' -Test {
            1 - 1 | Should -Be 2
        }
    }
}

Describe -Name 'Context Skipping 2' -Tag NoSkip -Fixture {
    Context -Name 'Do not skip this' -Fixture {
        It -Name 'should return 4 when passed 2 + 2' -Test {
            2 + 2 | Should -Be 4
        }
    }
}