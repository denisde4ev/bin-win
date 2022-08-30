
:: busybox64 sh "%~dpn0".sh %*
$ . "%~dpn0".sh %*
pause
exit


:: :: :: 
:: :: :: :: :: :: :: :: :: :: :: :: ::
:: :: :: 
:: :: :: if "%~dp1" == "" (
:: :: :: 	if "%~dp0" == "%CD%" (
:: :: :: 		echo 1
:: :: :: 		cd ..
:: :: :: 		:: if "%CD%" == "C:\Windows\System32"  (
:: :: :: 		:: 		cd "%USERPROFILE%"
:: :: :: 		:: ) else ( 
:: :: :: 		:: )
:: :: :: 	) else (
:: :: :: 		echo 2
:: :: :: 		if "%USERPROFILE%" == "" (
:: :: :: 		echo 21
:: :: :: 		) else (
:: :: :: 			echo 22
:: :: :: 		)
:: :: :: 	)
:: :: :: 	echo IFIIIIII
:: :: :: ) else (
:: :: :: 	echo 3
:: :: :: 	cd "%~dp1"
:: :: :: )
:: :: :: explorer .
:: :: :: pause
:: :: :: 
