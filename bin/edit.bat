@echo off
if "%EDITOR%" == "" (
	$ ^""${EDITOR:?}"^" %*
) else (
	"%EDITOR%" %*
)
