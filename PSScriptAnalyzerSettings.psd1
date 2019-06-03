# ScriptAnalyzerSettings.psd1
# Example settings file for PSScriptAnalyzer.
@{
    # Uncomment next line to choose which diagnostic records will be shown.
    # Severity = @('Error', 'Warning', 'Information')

    # If you have created custom rules you want to use, uncomment next line and put the path to your custom rule in the CustomRulePath variable
    # CustomRulePath = 'path\to\CustomRuleModule.psm1'

    # A list of all rules can be aquired with Get-ScriptAnalyzerRule from a powershel prompt
    # More informaton about rules: https://github.com/PowerShell/PSScriptAnalyzer/tree/master/RuleDocumentation#psscriptanalyzer-rules
    # Include all default rules
    IncludeDefaultRules = $true

    # Specific rules to exclude.
    ExcludeRules = @(
        'PSAvoidTrailingWhitespace'
        )

    # Specific rules to include. If this is used, all other rules are excluded!
    IncludeRules = @()

    # Compability rules
    Rules = @{
        PSUseCompatibleCommands = @{
            # Enable compatible commands check
            Enable = $false

            # Lists the PowerShell platforms we want to check compatibility with
            # More informaton about this: https://github.com/PowerShell/PSScriptAnalyzer/blob/master/RuleDocumentation/UseCompatibleCommands.md#usecompatiblecommands
            TargetProfiles = @(
                'win-8_x64_10.0.17763.0_6.1.3_x64_4.0.30319.42000_core',
                'win-8_x64_10.0.17763.0_5.1.17763.316_x64_4.0.30319.42000_framework',
                'win-8_x64_6.2.9200.0_3.0_x64_4.0.30319.42000_framework'
            )
        }
        PSUseCompatibleSyntax = @{
            # Enable compatible syntax check
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