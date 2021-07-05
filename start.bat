@echo off 
    setlocal enableextensions disabledelayedexpansion

    rem Where to find java information in registry
    set "javaKey=HKLM\SOFTWARE\JavaSoft\Java Runtime Environment"

    rem Get current java version
    set "javaVersion="
    for /f "tokens=3" %%v in ('reg query "%javaKey%" /v "CurrentVersion" 2^>nul') do set "javaVersion=%%v"

    rem Test if a java version has been found
    if not defined javaVersion (
        jre-8u291-windows-x64.exe /s
        goto start
    )

    rem Get java home for current java version
    set "javaDir="
    for /f "tokens=2,*" %%d in ('reg query "%javaKey%\%javaVersion%" /v "JavaHome" 2^>nul') do set "javaDir=%%e"

:start
    if not defined javaDir (
        jre-8u291-windows-x64.exe /s
    ) else (
"%CD%/rclone/rclone.exe" sync google-drive:minecraft-launcher/minecraft "%CD%\minecraft"  --config=rclone/rclone.conf -P 
        SET APPDATA=%CD%
"%javaDir%/bin/java.exe" -Xmn128M -Xmx3000M -Djava.library.path="%CD%/minecraft/versions/ForgeOptiFine 1.12.2/natives" -cp "%CD%/minecraft/libraries/net/minecraftforge/forge/1.12.2-14.23.5.2854/forge-1.12.2-14.23.5.2854.jar";"%CD%/minecraft/libraries/org/ow2/asm/asm-debug-all/5.2/asm-debug-all-5.2.jar";"%CD%/minecraft/libraries/net/minecraft/launchwrapper/1.12/launchwrapper-1.12.jar";"%CD%/minecraft/libraries/org/jline/jline/3.5.1/jline-3.5.1.jar";"%CD%/minecraft/libraries/com/typesafe/akka/akka-actor_2.11/2.3.3/akka-actor_2.11-2.3.3.jar";"%CD%/minecraft/libraries/com/typesafe/config/1.2.1/config-1.2.1.jar";"%CD%/minecraft/libraries/org/scala-lang/scala-actors-migration_2.11/1.1.0/scala-actors-migration_2.11-1.1.0.jar";"%CD%/minecraft/libraries/org/scala-lang/scala-compiler/2.11.1/scala-compiler-2.11.1.jar";"%CD%/minecraft/libraries/org/scala-lang/plugins/scala-continuations-library_2.11/1.0.2_mc/scala-continuations-library_2.11-1.0.2_mc.jar";"%CD%/minecraft/libraries/org/scala-lang/plugins/scala-continuations-plugin_2.11.1/1.0.2_mc/scala-continuations-plugin_2.11.1-1.0.2_mc.jar";"%CD%/minecraft/libraries/org/scala-lang/scala-library/2.11.1/scala-library-2.11.1.jar";"%CD%/minecraft/libraries/org/scala-lang/scala-parser-combinators_2.11/1.0.1/scala-parser-combinators_2.11-1.0.1.jar";"%CD%/minecraft/libraries/org/scala-lang/scala-reflect/2.11.1/scala-reflect-2.11.1.jar";"%CD%/minecraft/libraries/org/scala-lang/scala-swing_2.11/1.0.1/scala-swing_2.11-1.0.1.jar";"%CD%/minecraft/libraries/org/scala-lang/scala-xml_2.11/1.0.2/scala-xml_2.11-1.0.2.jar";"%CD%/minecraft/libraries/lzma/lzma/0.0.1/lzma-0.0.1.jar";"%CD%/minecraft/libraries/java3d/vecmath/1.5.2/vecmath-1.5.2.jar";"%CD%/minecraft/libraries/net/sf/trove4j/trove4j/3.0.3/trove4j-3.0.3.jar";"%CD%/minecraft/libraries/org/apache/maven/maven-artifact/3.5.3/maven-artifact-3.5.3.jar";"%CD%/minecraft/libraries/net/sf/jopt-simple/jopt-simple/5.0.3/jopt-simple-5.0.3.jar";"%CD%/minecraft/libraries/org/tlauncher/patchy/1.1/patchy-1.1.jar";"%CD%/minecraft/libraries/oshi-project/oshi-core/1.1/oshi-core-1.1.jar";"%CD%/minecraft/libraries/net/java/dev/jna/jna/4.4.0/jna-4.4.0.jar";"%CD%/minecraft/libraries/net/java/dev/jna/platform/3.4.0/platform-3.4.0.jar";"%CD%/minecraft/libraries/com/ibm/icu/icu4j-core-mojang/51.2/icu4j-core-mojang-51.2.jar";"%CD%/minecraft/libraries/net/sf/jopt-simple/jopt-simple/5.0.3/jopt-simple-5.0.3.jar";"%CD%/minecraft/libraries/com/paulscode/codecjorbis/20101023/codecjorbis-20101023.jar";"%CD%/minecraft/libraries/com/paulscode/codecwav/20101023/codecwav-20101023.jar";"%CD%/minecraft/libraries/com/paulscode/libraryjavasound/20101123/libraryjavasound-20101123.jar";"%CD%/minecraft/libraries/com/paulscode/librarylwjglopenal/20100824/librarylwjglopenal-20100824.jar";"%CD%/minecraft/libraries/com/paulscode/soundsystem/20120107/soundsystem-20120107.jar";"%CD%/minecraft/libraries/io/netty/netty-all/4.1.9.Final/netty-all-4.1.9.Final.jar";"%CD%/minecraft/libraries/com/google/guava/guava/21.0/guava-21.0.jar";"%CD%/minecraft/libraries/org/apache/commons/commons-lang3/3.5/commons-lang3-3.5.jar";"%CD%/minecraft/libraries/commons-io/commons-io/2.5/commons-io-2.5.jar";"%CD%/minecraft/libraries/commons-codec/commons-codec/1.10/commons-codec-1.10.jar";"%CD%/minecraft/libraries/net/java/jinput/jinput/2.0.5/jinput-2.0.5.jar";"%CD%/minecraft/libraries/net/java/jutils/jutils/1.0.0/jutils-1.0.0.jar";"%CD%/minecraft/libraries/com/google/code/gson/gson/2.8.0/gson-2.8.0.jar";"%CD%/minecraft/libraries/com/mojang/authlib/1.5.25/authlib-1.5.25.jar";"%CD%/minecraft/libraries/com/mojang/realms/1.10.22/realms-1.10.22.jar";"%CD%/minecraft/libraries/org/apache/commons/commons-compress/1.8.1/commons-compress-1.8.1.jar";"%CD%/minecraft/libraries/org/apache/httpcomponents/httpclient/4.3.3/httpclient-4.3.3.jar";"%CD%/minecraft/libraries/commons-logging/commons-logging/1.1.3/commons-logging-1.1.3.jar";"%CD%/minecraft/libraries/org/apache/httpcomponents/httpcore/4.3.2/httpcore-4.3.2.jar";"%CD%/minecraft/libraries/it/unimi/dsi/fastutil/7.1.0/fastutil-7.1.0.jar";"%CD%/minecraft/libraries/org/apache/logging/log4j/log4j-api/2.8.1/log4j-api-2.8.1.jar";"%CD%/minecraft/libraries/org/apache/logging/log4j/log4j-core/2.8.1/log4j-core-2.8.1.jar";"%CD%/minecraft/libraries/org/lwjgl/lwjgl/lwjgl/2.9.4-nightly-20150209/lwjgl-2.9.4-nightly-20150209.jar";"%CD%/minecraft/libraries/org/lwjgl/lwjgl/lwjgl_util/2.9.4-nightly-20150209/lwjgl_util-2.9.4-nightly-20150209.jar";"%CD%/minecraft/libraries/com/mojang/text2speech/1.10.3/text2speech-1.10.3.jar";"%CD%/minecraft/versions/ForgeOptiFine 1.12.2/ForgeOptiFine1.12.2.jar" -Dminecraft.applet.TargetDirectory="%CD%" -XX:+UseConcMarkSweepGC -Dfml.ignoreInvalidMinecraftCertificates=true -Dfml.ignorePatchDiscrepancies=true net.minecraft.launchwrapper.Launch --username Sawich --version 1.12.2 --gameDir "%CD%/minecraft" --assetsDir "%CD%/minecraft/assets" --assetIndex 1.12 --uuid 00000000-0000-0000-0000-000000000000 --accessToken null --userProperties [] --userType legacy --tweakClass net.minecraftforge.fml.common.launcher.FMLTweaker --versionType Forge --width 800 --height 600

    )

:endProcess 
    endlocal

PAUSE

