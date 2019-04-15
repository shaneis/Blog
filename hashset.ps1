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
