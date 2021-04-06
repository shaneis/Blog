#! /usr/bin/pwsh

[CmdletBinding()]
param (
    [Parameter(
        Mandatory,
        Position = 0,
        ValueFromPipeline,
        ValueFromPipelineByPropertyName
    )]
    [ValidateScript({Test-Path -Path $_ -PathType Leaf})]
    [string] $file
)

Invoke-Pester -Path $file -Output Detailed