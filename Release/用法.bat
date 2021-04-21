@echo off
@REM "SelectMyParent支持Unicode"
@REM chcp 65001
cd /d "%~dp0"
@REM "设置程序父进程,不是所有的程序都能做父进程，有一些系统进程没有权限的。"
set parentProcess=ChsIME.exe
@REM "设置子进程路径"
set childProcess="c:\windows\system32\cmd.exe /c reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v 测试_32 /t REG_SZ /d C:\测试.exe /f"
@REM set childProcess="c:\windows\system32\notepad.exe"

@REM "是否显示子进程窗口，0=隐藏，1=显示"
set showWindow=0
for /f "tokens=2 delims=," %%A in ('tasklist /fi "imagename eq %parentProcess%" /nh /fo csv') do (
   SelectMyParent.exe %childProcess% %%A %showWindow%
)
echo errorlevel=%errorlevel%
pause
exit /b