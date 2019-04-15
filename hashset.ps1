$Foo = [PSCustomObject]@{
    A = 1
    B = 2
}
$Bar = [PSCustomObject]@{
    A = 1
    B = 5
}
$HashSet = [System.Collections.Generic.HashSet[PSCustomObject]]::new()

# Union All
$HashSet.Add($Foo)
$HashSet.Add($Bar)

$HashSet

# Union
foreach ($Key in ($Foo.PSObject.Properties.Name)) {
    $HashSet.Add(($Foo.$Key))
}
foreach ($Key in ($Bar.PSObject.Properties.Name)) {
    $HashSet.Add(($Bar.$Key))
}

$HashSet

# Proper Union?
$Foo02 = [System.Collections.Generic.HashSet[Int]]::new()
$Bar02 = [System.Collections.Generic.HashSet[Int]]::new()

1..10 | ForEach-Object { $null = $Foo02.Add($_) }
5..15 | ForEach-Object { $null = $Bar02.Add($_) }

$Foo02
$Bar02

$Foo02.UnionWith($Bar02)
$Foo02