<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER ExitCode
Parameter description

.PARAMETER LocalJSONFilePath
Parameter description

.PARAMETER GithubJSONUrl
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
Function Get-ErrorDetail
{
    [cmdletbinding()]
    [alias("err")]
    Param(
        [Parameter(ValueFromPipeline = $true)] 
        [int32] $ErrorCode
    )

    Begin
    {
        Try
        {
            $Data = Import-csv "$(Split-Path (Split-Path $PSScriptRoot))\Data\ErrorCode.csv"
        }
        Catch
        {
            "Something went wrong! please try running the script again."
        }
    }

    Process
    {
        Foreach ($Item in $ErrorCode)
        {
            If ($Item)
            {
                $Data | Where-Object {$_.exitCode -eq $ErrorCode}
            }
            else
            {
                $Data
                break;
            }
        }

    }

    End
    {}

}
