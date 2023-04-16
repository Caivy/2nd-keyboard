REM AutoGit
	REM AHK
		cd "C:\AHK\2nd-keyboard"
		git add --all
		git commit -m "AutoCommit %date:~10,4% %date:~4,2% %date:~7,2% %time:~0,2% %time:~3,2% %time:~6,2%
		git push
	REM Logos
		cd "E:\1. Aadi Sahni\4. Logos"
		git add --all
		git commit -m "AutoCommit %date:~10,4% %date:~4,2% %date:~7,2% %time:~0,2% %time:~3,2% %time:~6,2%
		git push
	REM AadiSahniTheme
		cd "E:\1. Aadi Sahni\2. Assets\OBS Themes\TheAadiSahniTheme"
		git add --all
		git commit -m "AutoCommit %date:~10,4% %date:~4,2% %date:~7,2% %time:~0,2% %time:~3,2% %time:~6,2%
		git push
REM AutoCopy
	REM Notepad++ Style(stylers.xml)
		cd "%appdata%\Notepad++\"
		copy stylers.xml "C:\AHK\2nd-keyboard\settings_and_shortcuts"
		cd "C:\AHK\2nd-keyboard\settings_and_shortcuts" 
		rename stylers.xml Notepad++_Styles.xml
	REM AutoExecute.bat
		cd %userprofile%\OneDrive\Documents\"
		copy AutoExecute.bat "C:\AHK\2nd-keyboard\settings_and_shortcuts"
		
		
exit