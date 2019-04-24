$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Test-FakeFunction" {
    It "does something useful" {
        It 'should pass by deafult' {
            $true | Should -Be $false
        }
    }
}
