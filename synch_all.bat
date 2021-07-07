@echo off 





    setlocal enableextensions disabledelayedexpansion

    rem Where to find java information in registry
    set "javaKey=HKLM\SOFTWARE\JavaSoft\Java Runtime Environment"

    rem Get current java version
    set "javaVersion="
    for /f "tokens=3" %%v in ('reg query "%javaKey%" /v "CurrentVersion" 2^>nul') do set "javaVersion=%%v"

    rem Test if a java version has been found
    if not defined javaVersion (
        jre.exe /s
        goto start
    )

    rem Get java home for current java version
    set "javaDir="
    for /f "tokens=2,*" %%d in ('reg query "%javaKey%\%javaVersion%" /v "JavaHome" 2^>nul') do set "javaDir=%%e"


:start
    if not defined javaDir (
        jre.exe /s
    ) else (
"%CD%/rclone/rclone.exe" sync google-drive:minecraft-launcher/minecraft "%CD%\minecraft"  --config=rclone/rclone.conf -P 
      
    )

:endProcess 
    endlocal

PAUSE

