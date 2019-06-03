{
++\\
{{@{
            Enable = $true
            # Lists the PowerShell versions we want to check compatibility with
            # More information about this: https://github.com/PowerShell/PSScriptAnalyzer/blob/master/RuleDocumentation/UseCompatibleSyntax.md
            TargetVersions = @(
                '3.0'
                '5.1',
                '6.2'
            )
        }
    }
}