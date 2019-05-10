$Boom = 1
$Blast = 2
$And = 3
$Ruin = 4

$HashSet = [System.Collections.Generic.HashSet[Int]]::new()

#Or try a different object with the same name.

# Union All
foreach ($item in $Boom,$Blast,$And,$Ruin) {
    $HashSet.Add($Item)
}
$HashSet

# Duplicate time.
$HashSet.Clear()
foreach ($item in $Boom,$Blast,$And,$Boom) {
    $HashSet.Add($item)
}
$HashSet

#Hide the output
$HashSet.Clear()
$null = foreach ($item in $Boom,$Blast,$And,$Ruin) {
    $HashSet.Add($Item)
}
$HashSet