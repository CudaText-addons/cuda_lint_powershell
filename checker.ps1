Param (
    [string]$file = "_",
    [string]$cfg = "_"
)

Import-Module PSScriptAnalyzer;
if (Test-Path $cfg)
{
    $FullResult = Invoke-ScriptAnalyzer $file -Setting $cfg
}
else
{
    if ($GlobalPSScriptAnalyzerSettingsPath)
    {
        $FullResult = Invoke-ScriptAnalyzer $file -Setting $GlobalPSScriptAnalyzerSettingsPath
    }
    else
    {
        $FullResult = Invoke-ScriptAnalyzer -Path $file
    }
};

foreach ($Result in $FullResult)
{
    $Line       =   $Result.Line ;
    $Message    =   $Result.Message ;
    $RuleName   =   $Result.RuleName ;
    $Severity   =   $Result.Severity ;
    $Column     =   $Result.column ;
    $Extent     =   $Result.Extent.Text.trim() ;
    $Suggestion =   $Result.SuggestedCorrections.description ;

    if ($Extent)
    {
        Write-Host "Line:$Line RuleName:$RuleName Severity:$Severity Extent:$Extent Message:$Message $Suggestion"
    }
    else
    {
        Write-Host "Line:$Line RuleName:$RuleName Severity:$Severity Column:$Column Message:$Message $Suggestion"
    }
}
