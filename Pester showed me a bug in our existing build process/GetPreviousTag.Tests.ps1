$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "GetPreviousTag" {
    Context -Name 'Pass' -Fixture {
        Mock -CommandName git -MockWith {
            'refs/tags/8.1.0.a.60-61-gc6eefe4'
        }

        It -Name 'returns expected previous tag' -Test {
            GetPreviousTag | Should -BeExactly '8.1.0.a.60'
        }
    }

    Context -Name 'Fail : empty git describe' -Fixture {
        Mock -CommandName git -MockWith {}

        It -Name 'returns false' -Test {
            GetPreviousTag | Should -BeFalse
        }
    }

    Context -Name 'Fail : regex does not match' -Fixture {
        Mock -CommandName git -MockWith {
            'refs/tags/NothingToSeeHere-61-gc6eefe4'
        }

        It -Name 'returns false' -Test {
            GetPreviousTag | Should -BeFalse
        }
    }
}
