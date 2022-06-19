<#

Version 1.0
Robert Strom
2021-06-05

This script was designed to be run from a Windows VM that has the current KAPE
version stored on the Desktop and the most current version of the supporting files
located on the VM Host. The host file location is mapped as a network drive (drive Z:)
with the current file versions stored in a directory structure under the IRTools directory.

Copy updated Zimmerman tools to Kape directory structure

Copy updated Sysinternals tools to KAPE directory structure

Get File Version Information

(get-item .\bstrings.exe).Versioninfo

(get-item .\bstrings.exe).Versioninfo.ProductVersion

(get-item .\bstrings.exe).Versioninfo.FileVersion

Files:

EvtxExplorer EvtxECmd.exe
EvtxExplorer Maps directory
Registry Explorer RECmd.exe
Registry Explorer BatchExamples
Registry Explorer Plugins
AmcacheParser.exe
AppCompatCacheParser.exe
bstrings.exe
JLECmd.exe
LECmd.exe
MFTECmd.exe
PECmd.exe
RBCmd.exe
RecentFileCacheParser.exe
SrumECmd.exe
SumECmd.exe
VSCMount.exe
WxTCmd.exe

#>

## $CurrentKAPEZimmermanFiles = "$env:USERPROFILE\Downloads\ZimmermanTools"

$CurrentKAPEZimmermanFiles = "Z:\HostDownloads\IRTools\Eric Zimmerman Tools"

$KAPEDestinationFiles = "$env:USERPROFILE\Desktop\KAPE_v1.0.0.0"

$CurrentSysinternalsFiles = "Z:\HostDownloads\IRTools\Sysinternals"

$KAPESysinternalsDestinationFIles = "C:\Users\rstrom\Desktop\KAPE_v1.0.0.0\Modules\bin"

$CurrEvtxECmdVer = (get-item $CurrentKAPEZimmermanFiles\EvtxExplorer\EvtxECmd.exe).Versioninfo.FileVersion

$KAPEDirEvtxECmdVer = (get-item $KAPEDestinationFiles\Modules\Bin\EvtxECmd\EvtxECmd.exe).Versioninfo.FileVersion

if ($CurrEvtxECmdVer -gt $KAPEDirEvtxECmdVer) { Copy-Item -Path $CurrentKAPEZimmermanFiles\EvtxExplorer\EvtxECmd.exe -Destination $KAPEDestinationFiles\Modules\Bin\EvtxECmd\EvtxECmd.exe -Force }

## Perform a sync of the EvtxECmd Map files

Push-Location $KAPEDestinationFiles\modules\bin\EvtxECmd

.\EvtxECmd.exe --sync

Pop-Location

## $CurrBstringsVer = (get-item $CurrentKAPEZimmermanFiles\bstrings.exe).Versioninfo.FileVersion

## $KAPEDirBstringsVer = (get-item $KAPEDestinationFiles\Modules\Bin\bstrings.exe).Versioninfo.FileVersion

## if ($CurrBstringsVerVer -gt $KAPEDirBstringsVerVer) { Copy-Item -Path $CurrentKAPEZimmermanFiles\bstrings.exe -Destination $KAPEDestinationFiles\Modules\Bin\bstrings.exe }

$ZimmermanToolsFiles = @(
    'AmcacheParser.exe',
    'AppCompatCacheParser.exe',
    'bstrings.exe',
    'JLECmd.exe',
    'LECmd.exe',
    'MFTECmd.exe',
    'PECmd.exe',
    'RBCmd.exe',
    'RecentFileCacheParser.exe',
    'SrumECmd.exe',
    'SumECmd.exe',
    'VSCMount.exe',
    'WxTCmd.exe'
)

## foreach ($File in $ZimmermanToolsFiles) {
##	Write-Host $File
## }


foreach ($File in $ZimmermanToolsFiles)
{
    Write-Host "The current Zimmmerman Tool file being procesed is $CurrentKAPEZimmermanFiles\$file"
    $CurrentFileVersion = (get-item $CurrentKAPEZimmermanFiles\$file).Versioninfo.FileVersion
    Write-Host "The current version of the Zimmerman Tool $CurrentKAPEZimmermanFiles\$file is $CurrentFileVersion"
    $KAPEFileVersion = (get-item $KAPEDestinationFiles\Modules\Bin\$file).Versioninfo.FileVersion
    Write-Host "The KAPE file version of the Zimmerman Tool is $KAPEFileVersion"
    Write-Host ""
    if ($CurrentFileVersion -gt $KAPEFileVersion)
    {
        Write-Host "Copying updated file, $file, to KAPE location" -ForegroundColor Red
        Copy-Item -Path $CurrentKAPEZimmermanFiles\$file -Destination $KAPEDestinationFiles\Modules\Bin\$file -force
    }
    Write-Host "The current Zimmerman Tool file being processed is $CurrentKAPEZimmermanFiles\$file"
    $CurrentFileSize = (get-item $CurrentKAPEZimmermanFiles\$file).Length
    Write-Host "The current Zimmerman Tool file size is $CurrentFileSize"
    $KAPEFileSize = (get-item $KAPEDestinationFiles\Modules\Bin\$file).Length
    Write-Host "The current KAPE file size is $KAPEFileSize"
    Write-Host ""
    if ($CurrentFileSize -ne $KAPEFileSize)
    {
        Write-Host "Copying updated file, $file, to KAPE location" -ForegroundColor Red
        Copy-Item -Path $CurrentKAPEZimmermanFiles\$file -Destination $KAPEDestinationFiles\Modules\Bin\$file -force
    }
    Write-Host ""
}

$SysinternalsFIles = @(
    
    'autoruns.chm',
    'Autoruns.exe',
    'Autoruns64.exe',
    'autorunsc.exe',
    'autorunsc64.exe',
    'handle.exe',
    'handle64.exe',
    'psfile.exe',
    'psfile64.exe',
    'PsInfo.exe',
    'pslist.exe',
    'pslist64.exe',
    'PsLoggedon.exe',
    'PsLoggedon64.exe',
    'PsService.exe',
    'PsService64.exe',
    'sigcheck64.exe',
    'Tcpvcon.exe'
)

foreach ($File in $SysinternalsFIles)
{
    Write-Host "The current Sysinternals file being procesed is $CurrentSysinternalsFiles\$file"
    $CurrentFileVersion = (get-item $CurrentSysinternalsFiles\$file).Versioninfo.FileVersion
    Write-Host "The current version of the Sysinternals $CurrentSysinternalsFiles\$file is $CurrentFileVersion"
    $KAPEFileVersion = (get-item $KAPEDestinationFiles\Modules\Bin\$file).Versioninfo.FileVersion
    Write-Host "The KAPE file version of the Sysinternals $file` is $KAPEFileVersion"
    Write-Host ""
    if ($CurrentFileVersion -gt $KAPEFileVersion)
    {
        Write-Host "Copying updated file, $file, to KAPE location" -ForegroundColor Red
        Copy-Item -Path $CurrentSysinternalsFiles\$file -Destination $KAPEDestinationFiles\Modules\Bin\$file -force
    }
    Write-Host "The current Sysinternals file being processed is $CurrentSysinternalsFiles\$file"
    $CurrentFileSize = (get-item $CurrentSysinternalsFiles\$file).Length
    Write-Host "The current Sysinternals file size is $CurrentFileSize"
    $KAPEFileSize = (get-item $KAPEDestinationFiles\Modules\Bin\$file).Length
    Write-Host "The current KAPE file size is $KAPEFileSize"
    Write-Host ""
    if ($CurrentFileSize -ne $KAPEFileSize)
    {
        Write-Host "Copying updated file, $file, to KAPE location" -ForegroundColor Red
        Copy-Item -Path $CurrentSysinternalsFiles\$file -Destination $KAPEDestinationFiles\Modules\Bin\$file -force
    }
    Write-Host ""
}
