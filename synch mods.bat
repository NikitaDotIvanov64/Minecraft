@echo off 

"%CD%/rclone/rclone.exe" sync google-drive:/mods "%CD%\minecraft\mods"  --config=rclone/rclone.conf -P 
      


PAUSE

