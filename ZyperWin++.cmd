@echo off

title ZyperWin++ v2.2

:: ����Ĭ�Ͽ���̨������ǰ��ɫ
color 1f
set ConsoleBackColor=Blue
set ConsoleForeColor=White

net session >nul 2>&1
if %errorlevel% neq 0 (
	echo.=========================================================
	echo.���󣺴˽ű���Ҫ�Թ���Ա������С�
	echo.���Ҽ��������ļ���Ȼ��ѡ���Թ���Ա������С���
	echo.
	echo.=========================================================
	echo.
	pause>nul|set /p=�밴���������ִ�С���
	color 00
	endlocal
	exit
)

if not "%cd%"=="%cd: =%" (
	echo.=========================================================
	echo.��ǰĿ¼����·���а����ո�
	echo.�뽫Ŀ¼�ƶ���������Ϊ�������ո��Ŀ¼��
	echo.
	echo.=========================================================
	echo.
	pause>nul|set /p=�밴���������ִ�С���
	color 00
	endlocal
	exit
)

if not exist "%~dp0Defender_Control.exe" (
	echo.=========================================================
	echo ����δ�ҵ� Defender_Control.exe
	echo ��ȷ�����ű��� Defender_Control.exe ��ͬһĿ¼��
	echo.
	echo.=========================================================
	pause>nul|set /p=�밴���������ִ�С���
	color 00
	endlocal
	exit
)

if not exist "%~dp0MAS_AIO_CN.cmd" (
	echo.=========================================================
	echo ����δ�ҵ� MAS_AIO_CN.cmd
	echo ��ȷ�����ű��� MAS_AIO_CN.cmd ��ͬһĿ¼��
	echo.
	echo.=========================================================
	pause>nul|set /p=�밴���������ִ�С���
	color 00
	endlocal
	exit
)

if not exist "%~dp0NSudoLG.exe" (
	echo.=========================================================
	echo ����δ�ҵ� NSudoLG.exe
	echo ��ȷ�����ű��� NSudoLG.exe ��ͬһĿ¼��
	echo.
	echo.=========================================================
	pause>nul|set /p=�밴���������ִ�С���
	color 00
	endlocal
	exit
)

::-------------------------------------------------------------------------------------------
:: ZyperWin++ - �����û����Э��
::-------------------------------------------------------------------------------------------
cls

echo.===============================================================================
echo.####################### ZyperWin++ - �����û����Э�� ########################
echo.===============================================================================
echo.
echo.
echo.  ZyperWin++��һ������Windows�Ż����ߣ�������Win7-Win11���°���Ż���
echo.  ���������Ż����������Ż�����������Ȳ�������֧��ϵͳ�����Office���ٰ�װ��
echo.
echo.  ZyperWin++�ѿ�Դ��https://github.com/ZyperWave/ZyperWinOptimize��
echo.  û�в����������ʹ�ã�
echo.
echo.  ��ZyperWin++����ԭ�����ṩ�����Ҳ����κ���ʾ��ʾ�Եı�֤�����κ����֮�£�
echo.  ���߾��������Ϊʹ�ô˽ű����߶����¿��ܵ��κ��ƻ��е����Ρ�
echo.
echo.
echo.  ϵͳ�Ż�ǰ��ǵô���ϵͳ��ԭ�㣬��������������˻أ�
echo.
echo.
echo.  ���������⣬�뼰ʱ����������Ⱥ��312820776����Ҳ��л����ʹ�ã�
echo.
echo.
echo.
echo.===============================================================================
choice /C:AR /N /M "########################[ ����A��ͬ�� / ����R���ܾ� ]#########################"
if errorlevel 2 (
	"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /f >nul

	color 00
	endlocal

	exit
)



::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ���˵�
::-------------------------------------------------------------------------------------------
:MainMenu

cls
echo.===============================================================================
echo.                          ZyperWin++ - ��  ��  ��
echo.===============================================================================
echo.
echo.
echo.                           [1]   �� �� �� ��
echo.
echo.
echo.                           [2]   �Զ����Ż�
echo.
echo.
echo.                           [3]   �� �� �� ԭ
echo.
echo.                           
echo.                           [4]   �� �� �� ��
echo.                           
echo.                             
echo.                           [5]   �� �� �� ��
echo.                             
echo.
echo.                           [X]   ��      ��
echo.
echo.===============================================================================
choice /C:12345X /N /M "���������ѡ�� ��"
if errorlevel 6 goto :Quit
if errorlevel 5 goto :about
if errorlevel 4 goto :others
if errorlevel 3 goto :recover_optimize
if errorlevel 2 goto :custom_optimize
if errorlevel 1 goto :quick_optimize
::-------------------------------------------------------------------------------------------


::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ���˵�
::-------------------------------------------------------------------------------------------
:quick_optimize

cls
echo.===============================================================================
echo.                          ZyperWin++ - �� �� �� ��
echo.===============================================================================
echo.
echo.
echo.  [1]   �� �� �� ��
echo.
echo.
echo.  [2]   �� �� �� ��
echo.
echo.
echo.  [3]   �� �� �� ��
echo.
echo.                           
echo.
echo.                           
echo.                             
echo.
echo.                             
echo.
echo.  [X]   ��      ��
echo.
echo.===============================================================================
choice /C:123X /N /M "���������ѡ�� ��"
if errorlevel 4 goto :MainMenu
if errorlevel 3 goto :all_optimize
if errorlevel 2 goto :deep_optimize
if errorlevel 1 goto :basic_optimize
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: ZyperWin++ - �� �� �� ��
::-------------------------------------------------------------------------------------------
:basic_optimize

cls
echo.===============================================================================
echo.                          ZyperWin++ - �� �� �� ��
echo.===============================================================================
echo.
echo.  ����ִ�л����Ż�...
echo.
echo.  ע�⣺�˹��̿��ܴ˹��̿�����Ҫ������ʱ�䣬����رմ���
echo.
echo.  ==============================================================================
echo ���ڼ��Windows Defender����״̬...
sc query "WinDefend" | findstr /i "RUNNING" >nul
if %errorlevel% equ 0 (
    echo [!] Defender�����������У����ֶ��رգ�Disable��...
    "%~dp0Defender_Control.exe"
    pause
) else (
    echo [��] Defender����δ���У��Զ�����...
)

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f >nul
echo [��] ������������Cortana

:: ���������ںϲ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d 1 /f >nul
echo [��] ���������������ںϲ�

:: ��Դ����������ʾ"�˵���"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f >nul
echo [��] ��Դ��������ʱ��ʾ"�˵���"

:: ���Ǵ��ڴ�ж������DLL
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "AlwaysUnloadDLL" /t REG_DWORD /d 1 /f >nul
echo [��] �����ô��ڴ�ж������DLL

:: ��ֹ�����𻵵Ŀ�ݷ�ʽ
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ø����𻵵Ŀ�ݷ�ʽ

:: �Ż��ļ��б�ˢ�²���
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_DWORD /d 0 /f >nul
echo [��] ���Ż�Windows�ļ��б�ˢ�²���

:: ������ݷ�ʽ�����"��ݷ�ʽ"����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /t REG_BINARY /d 00000000 /f >nul
echo [��] ������ݷ�ʽʱ�����"��ݷ�ʽ"����

:: ��ֹ�Զ�����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d 255 /f >nul
echo [��] �ѽ����Զ�����

:: �ڵ��������д��ļ���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d 1 /f >nul
echo [��] ���ڵ��������д��ļ��д���

:: ���ٷ��ʲ���ʾ�����ļ���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 0 /f >nul
echo [��] ���ٷ��ʲ�����ʾ�����ļ���

:: ���ٷ��ʲ���ʾ���ʹ���ļ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 0 /f >nul
echo [��] ���ٷ��ʲ�����ʾ���ʹ���ļ�

:: ���������ص�������
reg add "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /t REG_DWORD /d 3 /f >nul
echo [��] �����������ص�������

:: ����������������ť
reg add "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" /t REG_DWORD /d 0 /f >nul
echo [��] �������������ϵİ�����ť

:: ��Դ�����������Զ�����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /t REG_DWORD /d 1 /f >nul
echo [��] ��Դ����������ʱ���Զ�����

:: ��ʾ�ļ���չ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f >nul
echo [��] ����ʾ��֪�ļ����͵���չ��

:: ������ʾ"�˵���"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f >nul
echo [��] ��������ʾ"�˵���"

:: ������ʾ"����վ"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0 /f >nul
echo [��] ��������ʾ"����վ"

:: ���ü��������ѽ���Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
echo [��] �ѽ��ÿ�ִ���ļ���"���������ѽ��"�Ҽ��˵�

:: ����Windows Defenderɨ���Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" /f >nul 2>&1
echo [��] �ѽ����ļ�/�ļ��е�"ʹ��Windows Defenderɨ��"�Ҽ��˵�

:: ����Bitlocker�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Drive\shell\BitLocker" /f >nul 2>&1
echo [��] �ѽ��ô��̵�"����Bitlocker"�Ҽ��˵�

:: ����"��Ϊ��Я�豸��"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Drive\shell\PortableDeviceMenu" /f >nul 2>&1
echo [��] �ѽ��ô��̵�"��Ϊ��Я�豸��"�Ҽ��˵�

:: �����½���ϵ���Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\.contact\ShellNew" /f >nul 2>&1
echo [��] �ѽ����½���"��ϵ��"�Ҽ��˵�

:: ����"��ԭ��ǰ�汾"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
echo [��] �ѽ����ļ�/���̵�"��ԭ��ǰ�汾"�Ҽ��˵�

:: ����"��¼������"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{B327765E-D724-4347-8B16-78AE18552FC3}" /f >nul 2>&1
echo [��] �ѽ��ô��̵�"��¼������"�Ҽ��˵�

:: ����"�������Ȩ��"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Sharing" /f >nul 2>&1
echo [��] �ѽ���"�������Ȩ��"�Ҽ��˵�

:: ����"ʼ���ѻ�����"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Offline Files" /f >nul 2>&1
echo [��] �ѽ����ļ�/�ļ��е�"ʼ���ѻ�����"�Ҽ��˵�

:: ����"�̶������ٷ���"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shell\pintohome" /f >nul 2>&1
echo [��] �ѽ����ļ��е�"�̶������ٷ���"�Ҽ��˵�

:: ���ù����ļ����Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\WorkFolders" /f >nul 2>&1
echo [��] �ѽ���"�����ļ���"�Ҽ��˵�

:: ���û�ͼ3D�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.3mf\Shell\3D Edit" /f >nul 2>&1
echo [��] �ѽ����ļ���"��ͼ3D"�Ҽ��˵�

:: ����"����������"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Library Location" /f >nul 2>&1
echo [��] �ѽ����ļ��е�"����������"�Ҽ��˵�

:: ���ÿ�ʼ�˵�����Ӧ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ÿ�ʼ�˵�App�б�-��õ�Ӧ��

:: ���ÿ�ʼ�˵�������Ӧ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ÿ�ʼ�˵�App�б�-�����ӵ�Ӧ��

:: ���±������Զ�����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "fWrap" /t REG_DWORD /d 1 /f >nul
echo [��] ���±��������Զ�����

:: ���±���ʾ״̬��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "StatusBar" /t REG_DWORD /d 1 /f >nul
echo [��] ���±�������״̬����ʾ

:: �˳�ʱ���������ĵ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ClearRecentDocsOnExit" /t REG_DWORD /d 1 /f >nul
echo [��] �������˳�ϵͳʱ�������򿪵��ĵ�

:: �ָ�Win11�����Ҽ��˵�
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve >nul
echo [��] �ѻָ�Win11�����Ҽ��˵�

:: �ָ�Win11������Դ������
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}" /ve /t REG_SZ /d "CLSID_ItemsViewAdapter" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}\InProcServer32" /ve /t REG_SZ /d "C:\\Windows\\System32\\Windows.UI.FileExplorer.dll_" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}\InProcServer32" /v ThreadingModel /t REG_SZ /d Apartment /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{6480100b-5a83-4d1e-9f69-8ae5a88e9a33}" /ve /t REG_SZ /d "File Explorer Xaml Island View Adapter" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{6480100b-5a83-4d1e-9f69-8ae5a88e9a33}\InProcServer32" /ve /t REG_SZ /d "C:\\Windows\\System32\\Windows.UI.FileExplorer.dll_" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{6480100b-5a83-4d1e-9f69-8ae5a88e9a33}\InProcServer32" /v ThreadingModel /t REG_SZ /d Apartment /f >nul
echo [��] �ѻָ�Win11������Դ������

echo ����������Դ������...
taskkill /f /im explorer.exe >nul
start explorer.exe >nul
echo ��Դ������������

:: �����Ż�����
:: �������ڿ�ʼ�˵���ʾ����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�ֹ�ڿ�ʼ�˵���ʾ����

:: ��Ҫ��Ӧ���̵��в��ҹ���Ӧ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�ֹ��Ӧ���̵��в��ҹ���Ӧ��

:: �ر��̵�Ӧ���ƹ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر��̵�Ӧ���ƹ�

:: �ر�����ʱ��Windows�۽��ƹ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�����ʱ��Windows�۽��ƹ�

:: �ر�"ʹ��Windowsʱ��ȡ���ɺͽ���"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�"ʹ��Windowsʱ��ȡ���ɺͽ���"

:: �ر���Ϸ¼�ƹ���
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر���Ϸ¼�ƹ���

:: �رն����С��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹرն����С��

:: �ӿ�ػ��ٶ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "1000" /f >nul
echo [��] �Ѽӿ�ػ��ٶ�

:: ���̹رշ���ȴ�ʱ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "ServicesPipeTimeout" /t REG_DWORD /d 2000 /f >nul
echo [��] �����̹رշ���ȴ�ʱ��

:: ���ó������������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "PcaSvc" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "PcaSvc" >nul 2>&1
echo [��] �ѽ��ó������������

:: ������Ϸ���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "DPS" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "DPS" >nul 2>&1
echo [��] �ѽ�����Ϸ���

:: ����SysMain
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SysMain" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "SysMain" >nul 2>&1
echo [��] �ѽ���SysMain

:: ����Windows Search
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WSearch" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WSearch" >nul 2>&1
echo [��] �ѽ���Windows Search

:: ���ô��󱨸�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ô��󱨸�

:: ���ÿͻ�������Ƽƻ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ÿͻ�������Ƽƻ�

:: ����NTFS���Ӹ��ٷ���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "TrkWks" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "TrkWks" >nul 2>&1
echo [��] �ѽ���NTFS���Ӹ��ٷ���

:: ��ֹ�Զ�ά���ƻ�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ�ֹ�Զ�ά���ƻ�

:: ���ô�ϵͳ�������������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f >nul
echo [��] �����ô�ϵͳ�������������

:: ��ֹϵͳ�ں������������ҳ��Ӳ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ�ֹϵͳ�ں������������ҳ��Ӳ��

:: ���ļ�����ϵͳ����������256MB
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d 4194304 /f >nul
echo [��] �ѽ��ļ�����ϵͳ����������256MB

:: ��WindowsԤ������Ϊ�ر�Ԥ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�WindowsԤ������

:: VHD����ʱ��ʡ���̿ռ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FsDepends\Parameters" /v "VirtualDiskExpandOnMount" /t REG_DWORD /d 4 /f >nul
echo [��] VHD����ʱ�ѽ�ʡ���̿ռ�

:: �ر�ϵͳ�Զ����Թ���
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�ϵͳ�Զ����Թ���

:: �����̴�����ȴ�ʱ�����̵�����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "AutoChkTimeOut" /t REG_DWORD /d 5 /f >nul
echo [��] �ѽ����̴�����ȴ�ʱ�����̵�����

:: �豸��װ��ֹ����ϵͳ��ԭ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "DisableSystemRestore" /t REG_DWORD /d 1 /f >nul
echo [��] �豸��װ�ѽ�ֹ����ϵͳ��ԭ��

:: ����USB���̺󳹵׶Ͽ���Դ
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v "DisableOnSoftRemove" /t REG_DWORD /d 0 /f >nul
echo [��] ����USB���̺��ѳ��׶Ͽ���Դ

:: �رտ�������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹرտ�������

:: �ر�����
powercfg /h off >nul
echo [��] �ѹر�����

:: ��������������������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions" /v "MitigationOptions_FontBocking" /t REG_SZ /d "10000000000000000000000000000000" /f >nul
echo [��] �Ѹ�������������������

:: ΢��ƴ�����뷨�ر��Ƽ���
reg add "HKEY_CURRENT_USER\Software\Microsoft\InputMethod\Settings\CHS" /v "CloudCandidate" /t REG_DWORD /d 0 /f >nul
echo [��] ΢��ƴ�����뷨�ѹر��Ƽ���

:: �������ݴ����Ż�����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ������ݴ����Ż�����
:: ���ó������������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "PcaSvc" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "PcaSvc" >nul 2>&1
echo [��] �ѽ���: PcaSvc �������������

:: ������Ϸ���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "DPS" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "DPS" >nul 2>&1
echo [��] �ѽ���: DPS ��ϲ��Է���

:: ����SysMain (SuperFetch����)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SysMain" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "SysMain" >nul 2>&1
echo [��] �ѽ���: SysMain SuperFetch����

:: ����Windows Search
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WSearch" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WSearch" >nul 2>&1
echo [��] �ѽ���: WSearch Windows��������

:: ����NTFS���Ӹ��ٷ���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "TrkWks" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "TrkWks" >nul 2>&1
echo [��] �ѽ���: TrkWks �ֲ�ʽ���Ӹ��ٷ���

:: ������Ϸ�������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WdiServiceHost" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WdiServiceHost" >nul 2>&1
echo [��] �ѽ���: WdiServiceHost ��Ϸ�������

:: �������ϵͳ����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WdiSystemHost" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WdiSystemHost" >nul 2>&1
echo [��] �ѽ���: WdiSystemHost ���ϵͳ����

:: �����ֶ�: MapsBroker (��ͼ����)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "MapsBroker" start= demand >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "MapsBroker" >nul 2>&1
echo [��] �������ֶ�: MapsBroker ��ͼ����

:: ������������ռ���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "diagnosticshub.standardcollector.service" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "diagnosticshub.standardcollector.service" >nul 2>&1
echo [��] �ѽ���: diagnosticshub.standardcollector.service ��������ռ���

echo.  ========================================
echo �����Ż������! 
echo �������������ʹ���и�����Ч
pause
goto MainMenu


::-------------------------------------------------------------------------------------------
:: ZyperWin++ - �� �� �� ��
::-------------------------------------------------------------------------------------------
:deep_optimize

cls
echo.===============================================================================
echo.                          ZyperWin++ - �� �� �� ��
echo.===============================================================================
echo.
echo.  ����ִ������Ż�...
echo.
echo.  ע�⣺�˹��̿��ܴ˹��̿�����Ҫ������ʱ�䣬����رմ���
echo.
echo.  ==============================================================================
echo ���ڼ��Windows Defender����״̬...
sc query "WinDefend" | findstr /i "RUNNING" >nul
if %errorlevel% equ 0 (
    echo [!] Defender�����������У����ֶ��رգ�Disable��...
    "%~dp0Defender_Control.exe"
    pause
) else (
    echo [��] Defender����δ���У��Զ�����...
)

:: ���/��Դ�������Ż�
:: ����������Cortana
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f >nul
echo [��] ������������Cortana

:: ���������ںϲ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d 1 /f >nul
echo [��] ���������������ںϲ�

:: ��Դ����������ʾ"�˵���"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f >nul
echo [��] ��Դ��������ʱ��ʾ"�˵���"

:: ���Ǵ��ڴ�ж������DLL
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "AlwaysUnloadDLL" /t REG_DWORD /d 1 /f >nul
echo [��] �����ô��ڴ�ж������DLL

:: ��ֹ�����𻵵Ŀ�ݷ�ʽ
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ø����𻵵Ŀ�ݷ�ʽ

:: �Ż��ļ��б�ˢ�²���
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_DWORD /d 0 /f >nul
echo [��] ���Ż�Windows�ļ��б�ˢ�²���

:: ������ݷ�ʽ�����"��ݷ�ʽ"����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /t REG_BINARY /d 00000000 /f >nul
echo [��] ������ݷ�ʽʱ�����"��ݷ�ʽ"����

:: ��ֹ�Զ�����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d 255 /f >nul
echo [��] �ѽ����Զ�����

:: �ڵ��������д��ļ���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d 1 /f >nul
echo [��] ���ڵ��������д��ļ��д���

:: ���ٷ��ʲ���ʾ�����ļ���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 0 /f >nul
echo [��] ���ٷ��ʲ�����ʾ�����ļ���

:: ���ٷ��ʲ���ʾ���ʹ���ļ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 0 /f >nul
echo [��] ���ٷ��ʲ�����ʾ���ʹ���ļ�

:: ���������ص�������
reg add "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /t REG_DWORD /d 3 /f >nul
echo [��] �����������ص�������

:: ����������������ť
reg add "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" /t REG_DWORD /d 0 /f >nul
echo [��] �������������ϵİ�����ť

:: ��Դ�����������Զ�����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /t REG_DWORD /d 1 /f >nul
echo [��] ��Դ����������ʱ���Զ�����

:: ��ʾ�ļ���չ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f >nul
echo [��] ����ʾ��֪�ļ����͵���չ��

:: ������ʾ"�˵���"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f >nul
echo [��] ��������ʾ"�˵���"

:: ������ʾ"����վ"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0 /f >nul
echo [��] ��������ʾ"����վ"

:: ���ü��������ѽ���Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
echo [��] �ѽ��ÿ�ִ���ļ���"���������ѽ��"�Ҽ��˵�

:: ����Windows Defenderɨ���Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" /f >nul 2>&1
echo [��] �ѽ����ļ�/�ļ��е�"ʹ��Windows Defenderɨ��"�Ҽ��˵�

:: ����Bitlocker�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Drive\shell\BitLocker" /f >nul 2>&1
echo [��] �ѽ��ô��̵�"����Bitlocker"�Ҽ��˵�

:: ����"��Ϊ��Я�豸��"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Drive\shell\PortableDeviceMenu" /f >nul 2>&1
echo [��] �ѽ��ô��̵�"��Ϊ��Я�豸��"�Ҽ��˵�

:: �����½���ϵ���Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\.contact\ShellNew" /f >nul 2>&1
echo [��] �ѽ����½���"��ϵ��"�Ҽ��˵�

:: ����"��ԭ��ǰ�汾"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
echo [��] �ѽ����ļ�/���̵�"��ԭ��ǰ�汾"�Ҽ��˵�

:: ����"��¼������"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{B327765E-D724-4347-8B16-78AE18552FC3}" /f >nul 2>&1
echo [��] �ѽ��ô��̵�"��¼������"�Ҽ��˵�

:: ����"�������Ȩ��"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Sharing" /f >nul 2>&1
echo [��] �ѽ���"�������Ȩ��"�Ҽ��˵�

:: ����"ʼ���ѻ�����"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Offline Files" /f >nul 2>&1
echo [��] �ѽ����ļ�/�ļ��е�"ʼ���ѻ�����"�Ҽ��˵�

:: ����"�̶������ٷ���"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shell\pintohome" /f >nul 2>&1
echo [��] �ѽ����ļ��е�"�̶������ٷ���"�Ҽ��˵�

:: ���ù����ļ����Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\WorkFolders" /f >nul 2>&1
echo [��] �ѽ���"�����ļ���"�Ҽ��˵�

:: ���û�ͼ3D�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.3mf\Shell\3D Edit" /f >nul 2>&1
echo [��] �ѽ����ļ���"��ͼ3D"�Ҽ��˵�

:: ����"����������"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Library Location" /f >nul 2>&1
echo [��] �ѽ����ļ��е�"����������"�Ҽ��˵�

:: ���ÿ�ʼ�˵�����Ӧ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ÿ�ʼ�˵�App�б�-��õ�Ӧ��

:: ���ÿ�ʼ�˵�������Ӧ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ÿ�ʼ�˵�App�б�-�����ӵ�Ӧ��

:: ���±������Զ�����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "fWrap" /t REG_DWORD /d 1 /f >nul
echo [��] ���±��������Զ�����

:: ���±���ʾ״̬��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "StatusBar" /t REG_DWORD /d 1 /f >nul
echo [��] ���±�������״̬����ʾ

:: �˳�ʱ���������ĵ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ClearRecentDocsOnExit" /t REG_DWORD /d 1 /f >nul
echo [��] �������˳�ϵͳʱ�������򿪵��ĵ�

:: �ָ�Win11�����Ҽ��˵�
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve >nul
echo [��] �ѻָ�Win11�����Ҽ��˵�

:: �ָ�Win11������Դ������
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}" /ve /t REG_SZ /d "CLSID_ItemsViewAdapter" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}\InProcServer32" /ve /t REG_SZ /d "C:\\Windows\\System32\\Windows.UI.FileExplorer.dll_" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}\InProcServer32" /v ThreadingModel /t REG_SZ /d Apartment /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{6480100b-5a83-4d1e-9f69-8ae5a88e9a33}" /ve /t REG_SZ /d "File Explorer Xaml Island View Adapter" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{6480100b-5a83-4d1e-9f69-8ae5a88e9a33}\InProcServer32" /ve /t REG_SZ /d "C:\\Windows\\System32\\Windows.UI.FileExplorer.dll_" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{6480100b-5a83-4d1e-9f69-8ae5a88e9a33}\InProcServer32" /v ThreadingModel /t REG_SZ /d Apartment /f >nul
echo [��] �ѻָ�Win11������Դ������

echo ����������Դ������...
taskkill /f /im explorer.exe >nul
start explorer.exe >nul
echo ��Դ������������

:: �����Ż�����
:: �������ڿ�ʼ�˵���ʾ����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�ֹ�ڿ�ʼ�˵���ʾ����

:: ��Ҫ��Ӧ���̵��в��ҹ���Ӧ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�ֹ��Ӧ���̵��в��ҹ���Ӧ��

:: �ر��̵�Ӧ���ƹ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر��̵�Ӧ���ƹ�

:: �ر�����ʱ��Windows�۽��ƹ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�����ʱ��Windows�۽��ƹ�

:: �ر�"ʹ��Windowsʱ��ȡ���ɺͽ���"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�"ʹ��Windowsʱ��ȡ���ɺͽ���"

:: �ر���Ϸ¼�ƹ���
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر���Ϸ¼�ƹ���

:: �رն����С��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹرն����С��

:: �ӿ�ػ��ٶ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "1000" /f >nul
echo [��] �Ѽӿ�ػ��ٶ�

:: ���̹رշ���ȴ�ʱ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "ServicesPipeTimeout" /t REG_DWORD /d 2000 /f >nul
echo [��] �����̹رշ���ȴ�ʱ��

:: ���ó������������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "PcaSvc" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "PcaSvc" >nul 2>&1
echo [��] �ѽ��ó������������

:: ������Ϸ���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "DPS" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "DPS" >nul 2>&1
echo [��] �ѽ�����Ϸ���

:: ����SysMain
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SysMain" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "SysMain" >nul 2>&1
echo [��] �ѽ���SysMain

:: ����Windows Search
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WSearch" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WSearch" >nul 2>&1
echo [��] �ѽ���Windows Search

:: ���ô��󱨸�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ô��󱨸�

:: ���ÿͻ�������Ƽƻ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ÿͻ�������Ƽƻ�

:: ����NTFS���Ӹ��ٷ���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "TrkWks" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "TrkWks" >nul 2>&1
echo [��] �ѽ���NTFS���Ӹ��ٷ���

:: ��ֹ�Զ�ά���ƻ�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ�ֹ�Զ�ά���ƻ�

:: ���ô�ϵͳ�������������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f >nul
echo [��] �����ô�ϵͳ�������������

:: ��ֹϵͳ�ں������������ҳ��Ӳ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ�ֹϵͳ�ں������������ҳ��Ӳ��

:: ���ļ�����ϵͳ����������256MB
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d 4194304 /f >nul
echo [��] �ѽ��ļ�����ϵͳ����������256MB

:: ��WindowsԤ������Ϊ�ر�Ԥ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�WindowsԤ������

:: VHD����ʱ��ʡ���̿ռ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FsDepends\Parameters" /v "VirtualDiskExpandOnMount" /t REG_DWORD /d 4 /f >nul
echo [��] VHD����ʱ�ѽ�ʡ���̿ռ�

:: �ر�ϵͳ�Զ����Թ���
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�ϵͳ�Զ����Թ���

:: �����̴�����ȴ�ʱ�����̵�����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "AutoChkTimeOut" /t REG_DWORD /d 5 /f >nul
echo [��] �ѽ����̴�����ȴ�ʱ�����̵�����

:: �豸��װ��ֹ����ϵͳ��ԭ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "DisableSystemRestore" /t REG_DWORD /d 1 /f >nul
echo [��] �豸��װ�ѽ�ֹ����ϵͳ��ԭ��

:: ����USB���̺󳹵׶Ͽ���Դ
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v "DisableOnSoftRemove" /t REG_DWORD /d 0 /f >nul
echo [��] ����USB���̺��ѳ��׶Ͽ���Դ

:: �رտ�������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹرտ�������

:: �ر�����
powercfg /h off >nul
echo [��] �ѹر�����

:: ��������������������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions" /v "MitigationOptions_FontBocking" /t REG_SZ /d "10000000000000000000000000000000" /f >nul
echo [��] �Ѹ�������������������

:: ΢��ƴ�����뷨�ر��Ƽ���
reg add "HKEY_CURRENT_USER\Software\Microsoft\InputMethod\Settings\CHS" /v "CloudCandidate" /t REG_DWORD /d 0 /f >nul
echo [��] ΢��ƴ�����뷨�ѹر��Ƽ���

:: �������ݴ����Ż�����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ������ݴ����Ż�����

:: ����SmartScreenɸѡ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���SmartScreenɸѡ��

:: ����Windows��ȫ���ı���
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Security Health\Platform" /v "Registered" /t REG_DWORD /d 0 /f >nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows Security Health\State" /v "Disabled" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���Windows��ȫ���ı���

:: ����Edge�����SmartScreen
reg add "HKEY_CURRENT_USER\Software\Microsoft\Edge" /v "SmartScreenEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Edge�����SmartScreen

:: �����ļ���Դ������SmartScreen
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "off" /f >nul
echo [��] �ѽ����ļ���Դ������SmartScreen

:: ����Microsoft StoreӦ��SmartScreen
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Microsoft StoreӦ��SmartScreen

:: ����UAC(�û��˻�����)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���UAC

:: �رշ���ǽ
netsh advfirewall set allprofiles state off >nul
echo [��] �ѹرշ���ǽ

:: �ر�Ĭ�Ϲ���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d 0 /f >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�Ĭ�Ϲ���

:: �ر�Զ��Э��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�Զ��Э��

:: ����Ӳ������GPU�ƻ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f >nul
echo [��] ������Ӳ������GPU�ƻ�

:: �Ż����������ܺ��ڴ�����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d 1 /f >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ16Priority" /t REG_DWORD /d 2 /f >nul
echo [��] ���Ż����������ܺ��ڴ�����

:: ����Cortana���ܼ���CPUռ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Cortana���ܣ�����CPUռ��

:: �رչ��ID
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d 1 /f >nul
echo [��] �ѹرչ��ID

:: �ر�Ӧ����������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�Ӧ����������

:: ȥ������ҳ����Ϣ��������
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1 /f >nul
echo [��] ��ȥ������ҳ����Ϣ��������

:: ���ø߾����¼���ʱ��(HPET)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hpet" /v "Start" /t REG_DWORD /d 4 /f >nul
echo [��] �ѽ��ø߾����¼���ʱ��

:: ����Game Bar
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Game Bar

:: ����Զ���޸�ע���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" /v "RemoteRegAccess" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Զ���޸�ע���

:: ���ñ����ռ�
DISM.exe /Online /Set-ReservedStorageState /State:Disabled >nul 2>&1
echo [��] �ѽ��ñ����ռ�

:: ���������Ĳ˵���ʾ�ӳ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >nul
echo [��] �ѽ��������Ĳ˵���ʾ�ӳ�

:: �����������Զ�����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ����������Զ�����

:: ����Installer detection
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Installer detection

:: ���ù��ܸ��°�ȫ��ʩ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX" /v "IsConvergedUpdateStackEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ù��ܸ��°�ȫ��ʩ

:: ���ý����Ż�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ý����Ż�

:: ����΢��ͻ�����Ľ��ƻ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���΢��ͻ�����Ľ��ƻ�

:: ����ң�����
sc config "DiagTrack" start= disabled >nul
sc stop "DiagTrack" >nul
echo [��] �ѽ���ң�����

:: ���ô��󱨸�(WER)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ô��󱨸�

:: ������������(Cortana)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsActivateWithVoice" /t REG_DWORD /d 2 /f >nul
echo [��] �ѽ�����������

:: ����λ�÷���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���λ�÷���

:: �������������ռ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ������������ռ�

:: ���ö�����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ö�����

:: ����Wi-Fi��֪
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���Wi-Fi��֪

:: ���ò����¼��
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\ProblemReports" /v "DisableProblemReports" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ò����¼��

:: ����д�������Ϣ
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Debug Print Filter" /v "DEFAULT" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���д�������Ϣ

:: ����Windows��ӭ����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableFirstRunAnimate" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���Windows��ӭ����

:: ���÷���Ƶ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��÷���Ƶ��

:: ������������ռ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�����������ռ�

:: ����д��ϰ�߸���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "Inking&TypingPersonalization" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���д��ϰ�߸���

:: ��������Ӧ�ý���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�������Ӧ�ý���

:: ����Bing�������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Bing�������

:: ����������ʷ
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���������ʷ

:: ����������Ӧ�ð�װ
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���������Ӧ�ð�װ

:: �����Զ������ȵ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ����Զ������ȵ�

:: �����������ݸ��Ի�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Personalization\Settings" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ����������ݸ��Ի�

:: ���ü������
reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "EnableTypingInsights" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ü������

:: ����Ԥ��װӦ��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "DisablePreInstalledApps" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���Ԥ��װӦ��

:: ����.NETң��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DisableNetFrameworkTelemetry" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���.NETң��

:: ����PowerShellң��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell" /v "EnablePowerShellTelemetry" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���PowerShellң��

:: �����Զ���װ�Ƽ���Ӧ�ó���
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d 2 /f >nul
echo [��] �ѽ�ֹ�Զ���װ�Ƽ���Ӧ�ó���

:: ��ֹWin10/11���д�汾����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableOSUpgrade" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ�ֹWin10/11���д�汾����

:: Windows���²������������ɾ������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d 1 /f >nul
echo [��] Windows�����Ѳ������������ɾ������

:: �����Զ������̵�Ӧ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore" /v "AutoDownload" /t REG_DWORD /d 2 /f >nul
echo [��] �ѽ����Զ������̵�Ӧ��

:: �����Զ����µ�ͼ
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ����Զ����µ�ͼ

:: ���ó������������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "PcaSvc" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "PcaSvc" >nul 2>&1
echo [��] �ѽ���: PcaSvc �������������

:: ������Ϸ���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "DPS" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "DPS" >nul 2>&1
echo [��] �ѽ���: DPS ��ϲ��Է���

:: ����SysMain (SuperFetch����)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SysMain" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "SysMain" >nul 2>&1
echo [��] �ѽ���: SysMain SuperFetch����

:: ����Windows Search
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WSearch" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WSearch" >nul 2>&1
echo [��] �ѽ���: WSearch Windows��������

:: ����NTFS���Ӹ��ٷ���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "TrkWks" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "TrkWks" >nul 2>&1
echo [��] �ѽ���: TrkWks �ֲ�ʽ���Ӹ��ٷ���

:: ������Ϸ�������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WdiServiceHost" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WdiServiceHost" >nul 2>&1
echo [��] �ѽ���: WdiServiceHost ��Ϸ�������

:: �������ϵͳ����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WdiSystemHost" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WdiSystemHost" >nul 2>&1
echo [��] �ѽ���: WdiSystemHost ���ϵͳ����

:: �����ֶ�: MapsBroker (��ͼ����)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "MapsBroker" start= demand >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "MapsBroker" >nul 2>&1
echo [��] �������ֶ�: MapsBroker ��ͼ����

:: ������������ռ���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "diagnosticshub.standardcollector.service" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "diagnosticshub.standardcollector.service" >nul 2>&1
echo [��] �ѽ���: diagnosticshub.standardcollector.service ��������ռ���

:: ����IP���ַ���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "iphlpsvc" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "iphlpsvc" >nul 2>&1
echo [��] �ѽ���: iphlpsvc IP���ַ���

:: ����SMS·��������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SmsRouter" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "SmsRouter" >nul 2>&1
echo [��] �ѽ���: SmsRouter SMS·��������

:: �����ֶ�: ShellӲ�����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "ShellHWDetection" start= demand >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "ShellHWDetection" >nul 2>&1
echo [��] �������ֶ�: ShellHWDetection Shell Ӳ�����

:: �����ֶ�: ����ƻ�����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "Schedule" start= demand >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "Schedule" >nul 2>&1
echo [��] �������ֶ�: Schedule ����ƻ�����

:: ����Windows�¼��ռ�����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "Wecsvc" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "Wecsvc" >nul 2>&1
echo [��] �ѽ���: Wecsvc Windows�¼��ռ�����

:: ����ң�����
sc config "DiagTrack" start= disabled >nul
sc stop "DiagTrack" >nul
echo [��] �ѽ���: DiagTrack ң�����

echo.  ========================================
echo ����Ż������! 
echo �������������ʹ���и�����Ч
pause
goto MainMenu



::-------------------------------------------------------------------------------------------
:: ZyperWin++ - �� �� �� ��
::-------------------------------------------------------------------------------------------
:all_optimize

cls
echo.===============================================================================
echo.                          ZyperWin++ - �� �� �� ��
echo.===============================================================================
echo.
echo.  ����ִ�м����Ż�...
echo.
echo.  ע�⣺�˹��̿��ܴ˹��̿�����Ҫ������ʱ�䣬����رմ���
echo.
echo.  ==============================================================================
echo ���ڼ��Windows Defender����״̬...
sc query "WinDefend" | findstr /i "RUNNING" >nul
if %errorlevel% equ 0 (
    echo [!] Defender�����������У����ֶ��رգ�Disable��...
    "%~dp0Defender_Control.exe"
    pause
) else (
    echo [��] Defender����δ���У��Զ�����...
)

:: ����LSA����(RunAsPPL)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "RunAsPPL" /t REG_DWORD /d 0 /f >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RunAsPPL" /t REG_DWORD /d 0 /f >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RunAsPPLBoot" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���LSA����

:: ����SmartScreenɸѡ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���SmartScreenɸѡ��

:: ����Windows��ȫ���ı���
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Security Health\Platform" /v "Registered" /t REG_DWORD /d 0 /f >nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows Security Health\State" /v "Disabled" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���Windows��ȫ���ı���

:: ��������������ֹ�б�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�������������ֹ�б�

:: ����Edge�����SmartScreen
reg add "HKEY_CURRENT_USER\Software\Microsoft\Edge" /v "SmartScreenEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Edge�����SmartScreen

:: �����ļ���Դ������SmartScreen
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "off" /f >nul
echo [��] �ѽ����ļ���Դ������SmartScreen

:: ����Microsoft StoreӦ��SmartScreen
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Microsoft StoreӦ��SmartScreen

:: ���ù�������ٹ���(ASR)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR" /v "ExploitGuard_ASR_Rules" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ù�������ٹ���

:: ����UAC(�û��˻�����)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���UAC

:: �������⻯��ȫ(VBS)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 0 /f >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "HypervisorEnforcedCodeIntegrity" /t REG_DWORD /d 0 /f >nul
bcdedit /set hypervisorlaunchtype off >nul 2>&1
echo [��] �ѽ������⻯��ȫ

:: ����ƾ֤����(Credential Guard)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\CredentialGuard" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���ƾ֤����

:: �����ܿ��ļ��з���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access" /v "EnableControlledFolderAccess" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ����ܿ��ļ��з���

:: �������籣��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" /v "EnableNetworkProtection" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ������籣��

:: ����AMSI
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableAmsi" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���AMSI

:: ���ô���������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ô���������

:: �رշ���ǽ
netsh advfirewall set allprofiles state off >nul
echo [��] �ѹرշ���ǽ

:: �ر�Ĭ�Ϲ���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d 0 /f >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�Ĭ�Ϲ���

:: �ر�Զ��Э��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�Զ��Э��

:: ���ò���ȫ��������¼
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "AllowInsecureGuestAuth" /t REG_DWORD /d 1 /f >nul
echo [��] �����ò���ȫ��������¼

:: ���/��Դ�������Ż�
:: ����������Cortana
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f >nul
echo [��] ������������Cortana

:: ���������ںϲ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d 1 /f >nul
echo [��] ���������������ںϲ�

:: ��Դ����������ʾ"�˵���"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f >nul
echo [��] ��Դ��������ʱ��ʾ"�˵���"

:: ���Ǵ��ڴ�ж������DLL
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "AlwaysUnloadDLL" /t REG_DWORD /d 1 /f >nul
echo [��] �����ô��ڴ�ж������DLL

:: ��ֹ�����𻵵Ŀ�ݷ�ʽ
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ø����𻵵Ŀ�ݷ�ʽ

:: �Ż��ļ��б�ˢ�²���
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_DWORD /d 0 /f >nul
echo [��] ���Ż�Windows�ļ��б�ˢ�²���

:: ������ݷ�ʽ�����"��ݷ�ʽ"����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /t REG_BINARY /d 00000000 /f >nul
echo [��] ������ݷ�ʽʱ�����"��ݷ�ʽ"����

:: ��ֹ�Զ�����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d 255 /f >nul
echo [��] �ѽ����Զ�����

:: �ڵ��������д��ļ���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d 1 /f >nul
echo [��] ���ڵ��������д��ļ��д���

:: ���ٷ��ʲ���ʾ�����ļ���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 0 /f >nul
echo [��] ���ٷ��ʲ�����ʾ�����ļ���

:: ���ٷ��ʲ���ʾ���ʹ���ļ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 0 /f >nul
echo [��] ���ٷ��ʲ�����ʾ���ʹ���ļ�

:: ���������ص�������
reg add "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /t REG_DWORD /d 3 /f >nul
echo [��] �����������ص�������

:: ����������������ť
reg add "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" /t REG_DWORD /d 0 /f >nul
echo [��] �������������ϵİ�����ť

:: ��Դ�����������Զ�����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /t REG_DWORD /d 1 /f >nul
echo [��] ��Դ����������ʱ���Զ�����

:: ��ʾ�ļ���չ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f >nul
echo [��] ����ʾ��֪�ļ����͵���չ��

:: ������ʾ"�˵���"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f >nul
echo [��] ��������ʾ"�˵���"

:: ������ʾ"����վ"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0 /f >nul
echo [��] ��������ʾ"����վ"

:: ���ü��������ѽ���Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
echo [��] �ѽ��ÿ�ִ���ļ���"���������ѽ��"�Ҽ��˵�

:: ����Windows Defenderɨ���Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" /f >nul 2>&1
echo [��] �ѽ����ļ�/�ļ��е�"ʹ��Windows Defenderɨ��"�Ҽ��˵�

:: ����Bitlocker�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Drive\shell\BitLocker" /f >nul 2>&1
echo [��] �ѽ��ô��̵�"����Bitlocker"�Ҽ��˵�

:: ����"��Ϊ��Я�豸��"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Drive\shell\PortableDeviceMenu" /f >nul 2>&1
echo [��] �ѽ��ô��̵�"��Ϊ��Я�豸��"�Ҽ��˵�

:: �����½���ϵ���Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\.contact\ShellNew" /f >nul 2>&1
echo [��] �ѽ����½���"��ϵ��"�Ҽ��˵�

:: ����"��ԭ��ǰ�汾"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
echo [��] �ѽ����ļ�/���̵�"��ԭ��ǰ�汾"�Ҽ��˵�

:: ����"��¼������"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{B327765E-D724-4347-8B16-78AE18552FC3}" /f >nul 2>&1
echo [��] �ѽ��ô��̵�"��¼������"�Ҽ��˵�

:: ����"�������Ȩ��"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Sharing" /f >nul 2>&1
echo [��] �ѽ���"�������Ȩ��"�Ҽ��˵�

:: ����"ʼ���ѻ�����"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Offline Files" /f >nul 2>&1
echo [��] �ѽ����ļ�/�ļ��е�"ʼ���ѻ�����"�Ҽ��˵�

:: ����"�̶������ٷ���"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shell\pintohome" /f >nul 2>&1
echo [��] �ѽ����ļ��е�"�̶������ٷ���"�Ҽ��˵�

:: ���ù����ļ����Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\WorkFolders" /f >nul 2>&1
echo [��] �ѽ���"�����ļ���"�Ҽ��˵�

:: ���û�ͼ3D�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.3mf\Shell\3D Edit" /f >nul 2>&1
echo [��] �ѽ����ļ���"��ͼ3D"�Ҽ��˵�

:: ����"����������"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Library Location" /f >nul 2>&1
echo [��] �ѽ����ļ��е�"����������"�Ҽ��˵�

:: ���ÿ�ʼ�˵�����Ӧ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ÿ�ʼ�˵�App�б�-��õ�Ӧ��

:: ���ÿ�ʼ�˵�������Ӧ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ÿ�ʼ�˵�App�б�-�����ӵ�Ӧ��

:: ���±������Զ�����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "fWrap" /t REG_DWORD /d 1 /f >nul
echo [��] ���±��������Զ�����

:: ���±���ʾ״̬��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "StatusBar" /t REG_DWORD /d 1 /f >nul
echo [��] ���±�������״̬����ʾ

:: �˳�ʱ���������ĵ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ClearRecentDocsOnExit" /t REG_DWORD /d 1 /f >nul
echo [��] �������˳�ϵͳʱ�������򿪵��ĵ�

:: �ָ�Win11�����Ҽ��˵�
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve >nul
echo [��] �ѻָ�Win11�����Ҽ��˵�

:: �ָ�Win11������Դ������
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}" /ve /t REG_SZ /d "CLSID_ItemsViewAdapter" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}\InProcServer32" /ve /t REG_SZ /d "C:\\Windows\\System32\\Windows.UI.FileExplorer.dll_" /f
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}\InProcServer32" /v ThreadingModel /t REG_SZ /d Apartment /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{6480100b-5a83-4d1e-9f69-8ae5a88e9a33}" /ve /t REG_SZ /d "File Explorer Xaml Island View Adapter" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{6480100b-5a83-4d1e-9f69-8ae5a88e9a33}\InProcServer32" /ve /t REG_SZ /d "C:\\Windows\\System32\\Windows.UI.FileExplorer.dll_" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{6480100b-5a83-4d1e-9f69-8ae5a88e9a33}\InProcServer32" /v ThreadingModel /t REG_SZ /d Apartment /f >nul
echo [��] �ѻָ�Win11������Դ������

echo ����������Դ������...
taskkill /f /im explorer.exe >nul
start explorer.exe >nul
echo ��Դ������������

:: �����Ż�����
:: �������ڿ�ʼ�˵���ʾ����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�ֹ�ڿ�ʼ�˵���ʾ����

:: ��Ҫ��Ӧ���̵��в��ҹ���Ӧ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�ֹ��Ӧ���̵��в��ҹ���Ӧ��

:: �ر��̵�Ӧ���ƹ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر��̵�Ӧ���ƹ�

:: �ر�����ʱ��Windows�۽��ƹ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�����ʱ��Windows�۽��ƹ�

:: �ر�"ʹ��Windowsʱ��ȡ���ɺͽ���"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�"ʹ��Windowsʱ��ȡ���ɺͽ���"

:: ��ֹ�Զ���װ�Ƽ���Ӧ�ó���
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d 2 /f >nul
echo [��] �ѽ�ֹ�Զ���װ�Ƽ���Ӧ�ó���

:: �ر���Ϸ¼�ƹ���
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر���Ϸ¼�ƹ���

:: �رն����С��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹرն����С��

:: �ӿ�ػ��ٶ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "1000" /f >nul
echo [��] �Ѽӿ�ػ��ٶ�

:: ���̹رշ���ȴ�ʱ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "ServicesPipeTimeout" /t REG_DWORD /d 2000 /f >nul
echo [��] �����̹رշ���ȴ�ʱ��

:: ���ó������������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "PcaSvc" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "PcaSvc" >nul 2>&1
echo [��] �ѽ��ó������������

:: ����Զ���޸�ע���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" /v "RemoteRegAccess" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Զ���޸�ע���

:: ������Ϸ���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "DPS" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "DPS" >nul 2>&1
echo [��] �ѽ�����Ϸ���

:: ����SysMain
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SysMain" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "SysMain" >nul 2>&1
echo [��] �ѽ���SysMain

:: ����Windows Search
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WSearch" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WSearch" >nul 2>&1
echo [��] �ѽ���Windows Search

:: ���ô��󱨸�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ô��󱨸�

:: ���ÿͻ�������Ƽƻ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ÿͻ�������Ƽƻ�

:: ����NTFS���Ӹ��ٷ���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "TrkWks" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "TrkWks" >nul 2>&1
echo [��] �ѽ���NTFS���Ӹ��ٷ���

:: ��ֹ�Զ�ά���ƻ�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ�ֹ�Զ�ά���ƻ�

:: ���ô�ϵͳ�������������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f >nul
echo [��] �����ô�ϵͳ�������������

:: ��ֹϵͳ�ں������������ҳ��Ӳ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ�ֹϵͳ�ں������������ҳ��Ӳ��

:: ���ļ�����ϵͳ����������256MB
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d 4194304 /f >nul
echo [��] �ѽ��ļ�����ϵͳ����������256MB

:: ��WindowsԤ������Ϊ�ر�Ԥ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�WindowsԤ������

:: ���ô�������������۶ϲ���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 3 /f >nul
echo [��] �ѽ��ô�������������۶ϲ������������

:: VHD����ʱ��ʡ���̿ռ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FsDepends\Parameters" /v "VirtualDiskExpandOnMount" /t REG_DWORD /d 4 /f >nul
echo [��] VHD����ʱ�ѽ�ʡ���̿ռ�

:: �ر�ϵͳ�Զ����Թ���
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�ϵͳ�Զ����Թ���

:: �����̴�����ȴ�ʱ�����̵�����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "AutoChkTimeOut" /t REG_DWORD /d 5 /f >nul
echo [��] �ѽ����̴�����ȴ�ʱ�����̵�����

:: �豸��װ��ֹ����ϵͳ��ԭ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "DisableSystemRestore" /t REG_DWORD /d 1 /f >nul
echo [��] �豸��װ�ѽ�ֹ����ϵͳ��ԭ��

:: ����USB���̺󳹵׶Ͽ���Դ
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v "DisableOnSoftRemove" /t REG_DWORD /d 0 /f >nul
echo [��] ����USB���̺��ѳ��׶Ͽ���Դ

:: �رտ�������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹرտ�������

:: �ر�����
powercfg /h off >nul
echo [��] �ѹر�����

:: ��������������������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions" /v "MitigationOptions_FontBocking" /t REG_SZ /d "10000000000000000000000000000000" /f >nul
echo [��] �Ѹ�������������������

:: ΢��ƴ�����뷨�ر��Ƽ���
reg add "HKEY_CURRENT_USER\Software\Microsoft\InputMethod\Settings\CHS" /v "CloudCandidate" /t REG_DWORD /d 0 /f >nul
echo [��] ΢��ƴ�����뷨�ѹر��Ƽ���

:: �������ݴ����Ż�����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ������ݴ����Ż�����

:: ���ù��ܸ��°�ȫ��ʩ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX" /v "IsConvergedUpdateStackEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ù��ܸ��°�ȫ��ʩ

:: �����������Զ�����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ����������Զ�����

:: ����Installer detection
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Installer detection

:: ���������Ĳ˵���ʾ�ӳ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >nul
echo [��] �ѽ��������Ĳ˵���ʾ�ӳ�

:: ���ñ����ռ�
DISM.exe /Online /Set-ReservedStorageState /State:Disabled >nul 2>&1
echo [��] �ѽ��ñ����ռ�

:: ����Ӳ������GPU�ƻ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f >nul
echo [��] ������Ӳ������GPU�ƻ�

:: �Ż����������ܺ��ڴ�����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d 1 /f >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ16Priority" /t REG_DWORD /d 2 /f >nul
echo [��] ���Ż����������ܺ��ڴ�����

:: ����Cortana���ܼ���CPUռ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Cortana���ܣ�����CPUռ��

:: �ر�Exploit Protection
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "MitigationOptions" /t REG_BINARY /d 22222200000200000002000000000000 /f >nul
echo [��] �ѹر�Exploit Protection

:: �رչ��ID
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d 1 /f >nul
echo [��] �ѹرչ��ID

:: �ر�Ӧ����������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�Ӧ����������

:: ȥ������ҳ����Ϣ��������
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1 /f >nul
echo [��] ��ȥ������ҳ����Ϣ��������

:: �ر�TSX©������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "DisableTsx" /t REG_DWORD /d 1 /f >nul
echo [��] �ѹر�TSX©������

:: �Ż���������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_SZ /d "ffffffff" /f >nul
echo [��] ���Ż���������

:: �ر���ϲ��Է���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "DPS" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "DPS" >nul 2>&1
echo [��] �ѹر���ϲ��Է���

:: �رճ������������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "PcaSvc" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "PcaSvc" >nul 2>&1
echo [��] �ѹرճ������������

:: �ر�΢��ͻ�����Ľ��ƻ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�΢��ͻ�����Ľ��ƻ�

:: ���ý����Ż�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ý����Ż�

:: ���ø߾����¼���ʱ��(HPET)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hpet" /v "Start" /t REG_DWORD /d 4 /f >nul
echo [��] �ѽ��ø߾����¼���ʱ��

:: ����Game Bar
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Game Bar

:: Edge�Ż�����
:: ����"�״�����"��ӭҳ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HideFirstRunExperience" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���"�״�����"��ӭҳ��

:: �ر�Adobe Flash���㼴��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "RunAllFlashInAllowMode" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�Adobe Flash���㼴��

:: �رպ��ֹ�������к�̨Ӧ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�ֹEdge�رպ�������к�̨Ӧ��

:: ��ֹ��Ӧ��������е����й��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AdsSettingForIntrusiveAdsSites" /t REG_DWORD /d 2 /f >nul
echo [��] ����ֹ��Ӧ��������е����й��

:: ������ѡ�ҳ���ϵ�΢����Ѷ
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageContentEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�����ѡ�ҳ���ϵ�΢����Ѷ����

:: �����±�ǩҳ�е�Ĭ��������վ
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageHideDefaultTopSites" /t REG_DWORD /d 1 /f >nul
echo [��] �������±�ǩҳ�е�Ĭ��������վ

:: ����Edge���������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ShowSidebar" /t REG_DWORD /d 0 /f >nul
echo [��] ������Edge���������

:: ����Smartscreenɸѡ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenEnabled" /t REG_DWORD /d 0 /f >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenForTrustedDownloadsEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Smartscreenɸѡ��

:: ��ֹ�����κ��������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DiagnosticData" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�ֹ�����κ��������

:: ���ñ�ǩҳ���ܼ����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PerformanceDetectorEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ñ�ǩҳ���ܼ����

:: �ر�ֹ֧ͣ�־�ϵͳ��֪ͨ
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SuppressUnsupportedOSWarning" /t REG_DWORD /d 1 /f >nul
echo [��] �ѹر�ֹ֧ͣ�־�ϵͳ��֪ͨ

:: �ر�Edge������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�Edge������

:: ����Ч��ģʽ
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyMode" /t REG_DWORD /d 1 /f >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyModeOnPowerEnabled" /t REG_DWORD /d 2 /f >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyModeEnabled" /t REG_DWORD /d 1 /f >nul
echo [��] ������Ч��ģʽ

:: �ر�"�������֯����"��ʾ
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HideManagedBrowserWarning" /t REG_DWORD /d 1 /f >nul
echo [��] �ѹر�"�������֯����"��ʾ

:: ��˽����
:: ����ҳ��Ԥ�⹦��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AllowPagePrediction" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���ҳ��Ԥ�⹦��

:: ���ÿ�ʼ��Ļ����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ÿ�ʼ��Ļ����

:: ���û�ռ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��û�ռ�

:: ����Ӧ����������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Ӧ����������

:: ���ù���ʶ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ù���ʶ��

:: ����Ӧ�÷����ļ�ϵͳ
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷����ļ�ϵͳ

:: ����Ӧ�÷����ĵ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷����ĵ�

:: ����Ӧ�÷�������
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷�������

:: ����Ӧ�÷�����ϵ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷�����ϵ��

:: ����Ӧ�÷�����Ƶ
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷�����Ƶ

:: ������վ���Ը���
reg add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ�����վ���Ը���

:: ����Windows��ӭ����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableFirstRunAnimate" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���Windows��ӭ����

:: ���÷���Ƶ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��÷���Ƶ��

:: ������������ռ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�����������ռ�

:: ����д��ϰ�߸���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "Inking&TypingPersonalization" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���д��ϰ�߸���

:: ��������Ӧ�ý���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�������Ӧ�ý���

:: ����Bing�������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Bing�������

:: ����ͨѶ¼�ռ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���ͨѶ¼�ռ�

:: ���ü����ı��ռ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "Inking&TypingPersonalization" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ü����ı��ռ�

:: ����������ʷ
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���������ʷ

:: ����������Ӧ�ð�װ
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���������Ӧ�ð�װ

:: �����Զ������ȵ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ����Զ������ȵ�

:: �����������ݸ��Ի�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Personalization\Settings" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ����������ݸ��Ի�

:: ���ü������
reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "EnableTypingInsights" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ü������

:: ����Ԥ��װӦ��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "DisablePreInstalledApps" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���Ԥ��װӦ��

:: ����.NETң��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DisableNetFrameworkTelemetry" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���.NETң��

:: ����PowerShellң��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell" /v "EnablePowerShellTelemetry" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���PowerShellң��

:: ����ң�����
sc config "DiagTrack" start= disabled >nul
sc stop "DiagTrack" >nul
echo [��] �ѽ���ң�����

:: ���ô��󱨸�(WER)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ô��󱨸�

:: ������������(Cortana)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsActivateWithVoice" /t REG_DWORD /d 2 /f >nul
echo [��] �ѽ�����������

:: ����λ�÷���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���λ�÷���

:: �������������ռ�
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ������������ռ�

:: ���ö�����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ö�����

:: ����Wi-Fi��֪
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���Wi-Fi��֪

:: ���ò����¼��
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\ProblemReports" /v "DisableProblemReports" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ò����¼��

:: ����д�������Ϣ
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Debug Print Filter" /v "DEFAULT" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���д�������Ϣ

:: ����Ӧ�÷����˻���Ϣ
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷����˻���Ϣ

:: ����Ӧ�÷����˶�����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷����˶�����

:: ����Ӧ�÷��ʵ绰
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷��ʵ绰

:: ����Ӧ�÷��������豸
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷��������豸

:: ����Ӧ�÷���ͬ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\sync" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷���ͬ��

:: ����Ӧ�÷��������Ϣ
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷��������Ϣ

:: ����Ӧ�÷���ͨ����¼
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷���ͨ����¼

:: ����Ӧ�÷��ʵ����ʼ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷��ʵ����ʼ�

:: ����Ӧ�÷�������
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷�������

:: ����Ӧ�÷�����Ϣ
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chatMessage" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷�����Ϣ

:: ���������ջ��־
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-CBS/Debug" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��������ջ��־

:: ���ø��½�ѹģ����־
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\Logging" /v "EnableLog" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ø��½�ѹģ����־

:: ���ô��󱨸���־
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ô��󱨸���־

:: ���ý��¼�д��ϵͳ��־
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Windows" /v "NoEventLog" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ý��¼�д��ϵͳ��־

:: ���ñ���ʱд�������Ϣ
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "CrashDumpEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ñ���ʱд�������Ϣ

:: �����˻���¼��־����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableLogonCacheDisplay" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ����˻���¼��־����

:: ����WfpDiag.ETL��־
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BFE\Diagnostics" /v "EnableLog" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���WfpDiag.ETL��־

:: ��������
:: ��ֹWin10/11���д�汾����
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableOSUpgrade" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ�ֹWin10/11���д�汾����

:: Windows���²������������ɾ������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d 1 /f >nul
echo [��] Windows�����Ѳ������������ɾ������

:: ����Windows���� ֹͣ���µ�2999��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesExpiryTime" /t REG_SZ /d "2999-12-01T09:59:52Z" /f >nul
echo [��] ��ֹͣ���µ�2999��

:: �����Զ������̵�Ӧ��
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore" /v "AutoDownload" /t REG_DWORD /d 2 /f >nul
echo [��] �ѽ����Զ������̵�Ӧ��

:: �����Զ����µ�ͼ
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ����Զ����µ�ͼ

:: �������Ż�
:: SecurityHealthService (��ȫ��������)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SecurityHealthService" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "SecurityHealthService" >nul 2>&1
echo [��] �ѽ���: SecurityHealthService ��ȫ��������

:: SysMain (SuperFetch����)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SysMain" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "SysMain" >nul 2>&1
echo [��] �ѽ���: SysMain SuperFetch����

:: WSearch (Windows��������)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WSearch" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WSearch" >nul 2>&1
echo [��] �ѽ���: WSearch Windows��������

:: UsoSvc (Windows���·���)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "UsoSvc" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "UsoSvc" >nul 2>&1
echo [��] �ѽ���: UsoSvc Windows���·���

:: TrkWks (�ֲ�ʽ���Ӹ��ٷ���)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "TrkWks" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "TrkWks" >nul 2>&1
echo [��] �ѽ���: TrkWks �ֲ�ʽ���Ӹ��ٷ���

:: WinDefend (Windows Defender����)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WinDefend" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WinDefend" >nul 2>&1
echo [��] �ѽ���: WinDefend Windows Defender����

:: diagsvc (��Ϸ���)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "diagsvc" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "diagsvc" >nul 2>&1
echo [��] �ѽ���: diagsvc ��Ϸ���

:: DPS (��ϲ��Է���)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "DPS" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "DPS" >nul 2>&1
echo [��] �ѽ���: DPS ��ϲ��Է���

:: WdiServiceHost (��Ϸ�������)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WdiServiceHost" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WdiServiceHost" >nul 2>&1
echo [��] �ѽ���: WdiServiceHost ��Ϸ�������

:: WdiSystemHost (���ϵͳ����)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WdiSystemHost" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WdiSystemHost" >nul 2>&1
echo [��] �ѽ���: WdiSystemHost ���ϵͳ����

:: MapsBroker (��ͼ����)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "MapsBroker" start= demand >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "MapsBroker" >nul 2>&1
echo [��] �������ֶ�: MapsBroker ��ͼ����

:: iphlpsvc (IP���ַ���)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "iphlpsvc" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "iphlpsvc" >nul 2>&1
echo [��] �ѽ���: iphlpsvc IP���ַ���

:: diagnosticshub.standardcollector.service (��������ռ���)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "diagnosticshub.standardcollector.service" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "diagnosticshub.standardcollector.service" >nul 2>&1
echo [��] �ѽ���: diagnosticshub.standardcollector.service ��������ռ���

:: SmsRouter (SMS·��������)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SmsRouter" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "SmsRouter" >nul 2>&1
echo [��] �ѽ���: SmsRouter SMS·��������

:: PcaSvc (�������������)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "PcaSvc" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "PcaSvc" >nul 2>&1
echo [��] �ѽ���: PcaSvc �������������

:: ShellHWDetection (ShellӲ�����)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "ShellHWDetection" start= demand >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "ShellHWDetection" >nul 2>&1
echo [��] �������ֶ�: ShellHWDetection Shell Ӳ�����

:: SgrmBroker (ϵͳ��������)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SgrmBroker" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "SgrmBroker" >nul 2>&1
echo [��] �ѽ���: SgrmBroker ϵͳ��������

:: Schedule (����ƻ�����)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "Schedule" start= demand >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "Schedule" >nul 2>&1
echo [��] �������ֶ�: Schedule ����ƻ�����

:: Wecsvc (Windows�¼��ռ�����)
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "Wecsvc" start= disabled >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "Wecsvc" >nul 2>&1
echo [��] �ѽ���: Wecsvc

echo.  ========================================
echo �����Ż������! 
echo �������������ʹ���и�����Ч
pause
goto MainMenu

::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: ZyperWin++ - �Զ����Ż�
::-------------------------------------------------------------------------------------------
:custom_optimize

cls
echo.===============================================================================
echo.                           ZyperWin++ - �Զ����Ż�
echo.===============================================================================
echo.
echo.  [1]   ���/��Դ������
echo.
echo.  [2]   �����Ż�����
echo.
echo.  [3]   Edge�Ż�����
echo.
echo.  [4]   ��ȫ����
echo.
echo.  [5]   ��˽����
echo.
echo.  [6]   ��������
echo.
echo.  [7]   �������Ż�
echo.
echo.
echo.
echo.  [X]   ����
echo.
echo.===============================================================================
choice /C:1234567X /N /M "���������ѡ�� ��"
if errorlevel 8 goto :MainMenu
if errorlevel 7 goto :fuwuxiang
if errorlevel 6 goto :update
if errorlevel 5 goto :yinsi
if errorlevel 4 goto :anquan
if errorlevel 3 goto :Edge
if errorlevel 2 goto :xingneng
if errorlevel 1 goto :waiguan
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ���/��Դ������
::-------------------------------------------------------------------------------------------
:waiguan
setlocal enabledelayedexpansion

:: ��ʼ��״̬����
for /l %%i in (1,1,37) do set "opt%%i_status=0"

:: ��������Ż���״̬
call :Check_OPT_Status

cls
echo.===============================================================================
echo.                    ZyperWin++ - ���/��Դ�������Ż�����
echo.===============================================================================
echo. ״̬���: [+]���Ż�  [-]δ�Ż�
echo.
echo   [ 1] %opt1_mark% ����������Cortana
echo   [ 2] %opt2_mark% ���������ںϲ�
echo   [ 3] %opt3_mark% ��Դ����������ʾ"�˵���"
echo   [ 4] %opt4_mark% ���Ǵ��ڴ�ж������DLL
echo   [ 5] %opt5_mark% ��ֹ�����𻵵Ŀ�ݷ�ʽ
echo   [ 6] %opt6_mark% �Ż��ļ��б�ˢ�²���
echo   [ 7] %opt7_mark% ������ݷ�ʽ�����"��ݷ�ʽ"����
echo   [ 8] %opt8_mark% ��ֹ�Զ�����
echo   [ 9] %opt9_mark% �ڵ��������д��ļ���
echo   [10] %opt10_mark% ���ٷ��ʲ���ʾ�����ļ���
echo   [11] %opt11_mark% ���ٷ��ʲ���ʾ���ʹ���ļ�
echo   [12] %opt12_mark% ���������ص�������
echo   [13] %opt13_mark% ����������������ť
echo   [14] %opt14_mark% ��Դ�����������Զ�����
echo   [15] %opt15_mark% ��ʾ�ļ���չ��
echo   [16] %opt16_mark% ������ʾ"�˵���"
echo   [17] %opt17_mark% ������ʾ"����վ"
echo   [18] %opt18_mark% ���ü��������ѽ���Ҽ��˵�
echo   [19] %opt19_mark% ����Windows Defenderɨ���Ҽ��˵�
echo   [20] %opt20_mark% ����Bitlocker�Ҽ��˵�
echo   [21] %opt21_mark% ����"��Ϊ��Я�豸��"�Ҽ��˵�
echo   [22] %opt22_mark% �����½���ϵ���Ҽ��˵�
echo   [23] %opt23_mark% ����"��ԭ��ǰ�汾"�Ҽ��˵�
echo   [24] %opt24_mark% ����"��¼������"�Ҽ��˵�
echo   [25] %opt25_mark% ����"�������Ȩ��"�Ҽ��˵�
echo   [26] %opt26_mark% ����"ʼ���ѻ�����"�Ҽ��˵�
echo   [27] %opt27_mark% ����"�̶������ٷ���"�Ҽ��˵�
echo   [28] %opt28_mark% ���ù����ļ����Ҽ��˵�
echo   [29] %opt29_mark% ���û�ͼ3D�Ҽ��˵�
echo   [30] %opt30_mark% ����"����������"�Ҽ��˵�
echo   [31] %opt31_mark% ���ÿ�ʼ�˵�����Ӧ��
echo   [32] %opt32_mark% ���ÿ�ʼ�˵�������Ӧ��
echo   [33] %opt33_mark% ���±������Զ�����
echo   [34] %opt34_mark% ���±���ʾ״̬��
echo   [35] %opt35_mark% �˳�ʱ���������ĵ�
echo   [36] %opt36_mark% Win11�ָ������Ҽ�
echo   [37] %opt37_mark% Win11�ָ�������Դ������
echo.
echo   [A] Ӧ������δ�Ż�����
echo   [R] ������Դ������
echo   [X] ����
echo.
set /p "choices=������ѡ����: 1 3 5 �� A��: "

if "%choices%"=="" goto waiguan
if /i "%choices%"=="X" goto custom_optimize
if /i "%choices%"=="R" goto RESTART_EXPLORER

:: ����ȫѡ��ֻѡδ�Ż����
if /i "%choices%"=="A" (
    set "choices="
    for /l %%i in (1,1,37) do (
        if !opt%%i_status! equ 0 set "choices=!choices! %%i"
    )
    if "!choices!"=="" (
        echo �����Ż�����Ӧ�ã����������
        pause
        goto custom_optimize
    )
)

:: �������ѡ��
for %%c in (%choices%) do (
    call :Toggle_OPT %%c
)

:: ����״̬
for /l %%i in (1,1,37) do set "opt%%i_status=0"
call :Check_OPT_Status

echo.
echo ע�⣺����������Ҫ������Դ������������Ч
echo.
pause
goto waiguan

:: ��������Ż���״̬�ĺ���
:Check_OPT_Status
:: 1.����������Cortana
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt1_status=1" & set "opt1_mark=[+]") else (set "opt1_mark=[-]")

:: 2.���������ںϲ�
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt2_status=1" & set "opt2_mark=[+]") else (set "opt2_mark=[-]")

:: 3.��Դ����������ʾ"�˵���"
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt3_status=1" & set "opt3_mark=[+]") else (set "opt3_mark=[-]")

:: 4.���Ǵ��ڴ�ж������DLL
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "AlwaysUnloadDLL" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt4_status=1" & set "opt4_mark=[+]") else (set "opt4_mark=[-]")

:: 5.��ֹ�����𻵵Ŀ�ݷ�ʽ
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt5_status=1" & set "opt5_mark=[+]") else (set "opt5_mark=[-]")

:: 6.�Ż��ļ��б�ˢ�²���
reg query "HKEY_CURRENT_USER\Control Panel\Desktop" /v "ForegroundLockTimeout" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt6_status=1" & set "opt6_mark=[+]") else (set "opt6_mark=[-]")

:: 7.������ݷ�ʽ�����"��ݷ�ʽ"����
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" 2>nul | findstr /i "00000000" >nul
if %errorlevel% equ 0 (set "opt7_status=1" & set "opt7_mark=[+]") else (set "opt7_mark=[-]")

:: 8.��ֹ�Զ�����
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" 2>nul | findstr /i "0xff" >nul
if %errorlevel% equ 0 (set "opt8_status=1" & set "opt8_mark=[+]") else (set "opt8_mark=[-]")

:: 9.�ڵ��������д��ļ���
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt9_status=1" & set "opt9_mark=[+]") else (set "opt9_mark=[-]")

:: 10.���ٷ��ʲ���ʾ�����ļ���
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt10_status=1" & set "opt10_mark=[+]") else (set "opt10_mark=[-]")

:: 11.���ٷ��ʲ���ʾ���ʹ���ļ�
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt11_status=1" & set "opt11_mark=[+]") else (set "opt11_mark=[-]")

:: 12.���������ص�������
reg query "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ShowStatus" 2>nul | findstr /i "0x3" >nul
if %errorlevel% equ 0 (set "opt12_status=1" & set "opt12_mark=[+]") else (set "opt12_mark=[-]")

:: 13.����������������ť
reg query "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt13_status=1" & set "opt13_mark=[+]") else (set "opt13_mark=[-]")

:: 14.��Դ�����������Զ�����
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt14_status=1" & set "opt14_mark=[+]") else (set "opt14_mark=[-]")

:: 15.��ʾ�ļ���չ��
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt15_status=1" & set "opt15_mark=[+]") else (set "opt15_mark=[-]")

:: 16.������ʾ"�˵���"
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt16_status=1" & set "opt16_mark=[+]") else (set "opt16_mark=[-]")

:: 17.������ʾ"����վ"
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt17_status=1" & set "opt17_mark=[+]") else (set "opt17_mark=[-]")

:: 18.���ü��������ѽ���Ҽ��˵�
reg query "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\Compatibility" 2>nul
if %errorlevel% neq 0 (set "opt18_status=1" & set "opt18_mark=[+]") else (set "opt18_mark=[-]")

:: 19.����Windows Defenderɨ���Ҽ��˵�
reg query "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" 2>nul
if %errorlevel% neq 0 (set "opt19_status=1" & set "opt19_mark=[+]") else (set "opt19_mark=[-]")

:: 20.����Bitlocker�Ҽ��˵�
reg query "HKEY_CLASSES_ROOT\Drive\shell\BitLocker" 2>nul
if %errorlevel% neq 0 (set "opt20_status=1" & set "opt20_mark=[+]") else (set "opt20_mark=[-]")

:: 21.����"��Ϊ��Я�豸��"�Ҽ��˵�
reg query "HKEY_CLASSES_ROOT\Drive\shell\PortableDeviceMenu" 2>nul
if %errorlevel% neq 0 (set "opt21_status=1" & set "opt21_mark=[+]") else (set "opt21_mark=[-]")

:: 22.�����½���ϵ���Ҽ��˵�
reg query "HKEY_CLASSES_ROOT\.contact\ShellNew" 2>nul
if %errorlevel% neq 0 (set "opt22_status=1" & set "opt22_mark=[+]") else (set "opt22_mark=[-]")

:: 23.����"��ԭ��ǰ�汾"�Ҽ��˵�
reg query "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" 2>nul
if %errorlevel% neq 0 (set "opt23_status=1" & set "opt23_mark=[+]") else (set "opt23_mark=[-]")

:: 24.����"��¼������"�Ҽ��˵�
reg query "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{B327765E-D724-4347-8B16-78AE18552FC3}" 2>nul
if %errorlevel% neq 0 (set "opt24_status=1" & set "opt24_mark=[+]") else (set "opt24_mark=[-]")

:: 25.����"�������Ȩ��"�Ҽ��˵�
reg query "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Sharing" 2>nul
if %errorlevel% neq 0 (set "opt25_status=1" & set "opt25_mark=[+]") else (set "opt25_mark=[-]")

:: 26.����"ʼ���ѻ�����"�Ҽ��˵�
reg query "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Offline Files" 2>nul
if %errorlevel% neq 0 (set "opt26_status=1" & set "opt26_mark=[+]") else (set "opt26_mark=[-]")

:: 27.����"�̶������ٷ���"�Ҽ��˵�
reg query "HKEY_CLASSES_ROOT\Folder\shell\pintohome" 2>nul
if %errorlevel% neq 0 (set "opt27_status=1" & set "opt27_mark=[+]") else (set "opt27_mark=[-]")

:: 28.���ù����ļ����Ҽ��˵�
reg query "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\WorkFolders" 2>nul
if %errorlevel% neq 0 (set "opt28_status=1" & set "opt28_mark=[+]") else (set "opt28_mark=[-]")

:: 29.���û�ͼ3D�Ҽ��˵�
reg query "HKEY_CLASSES_ROOT\SystemFileAssociations\.3mf\Shell\3D Edit" 2>nul
if %errorlevel% neq 0 (set "opt29_status=1" & set "opt29_mark=[+]") else (set "opt29_mark=[-]")

:: 30.����"����������"�Ҽ��˵�
reg query "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Library Location" 2>nul
if %errorlevel% neq 0 (set "opt30_status=1" & set "opt30_mark=[+]") else (set "opt30_mark=[-]")

:: 31.���ÿ�ʼ�˵�����Ӧ��
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt31_status=1" & set "opt31_mark=[+]") else (set "opt31_mark=[-]")

:: 32.���ÿ�ʼ�˵�������Ӧ��
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt32_status=1" & set "opt32_mark=[+]") else (set "opt32_mark=[-]")

:: 33.���±������Զ�����
reg query "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "fWrap" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt33_status=1" & set "opt33_mark=[+]") else (set "opt33_mark=[-]")

:: 34.���±���ʾ״̬��
reg query "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "StatusBar" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt34_status=1" & set "opt34_mark=[+]") else (set "opt34_mark=[-]")

:: 35.�˳�ʱ���������ĵ�
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ClearRecentDocsOnExit" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt35_status=1" & set "opt35_mark=[+]") else (set "opt35_mark=[-]")

:: 36. Win11�ָ������Ҽ�
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" >nul 2>&1
if %errorlevel% equ 0 (set "opt36_status=1" & set "opt36_mark=[+]") else (set "opt36_mark=[-]")

:: 37. Win11�ָ�������Դ������
reg query "HKEY_CURRENT_USER\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}" >nul 2>&1
if %errorlevel% equ 0 (set "opt37_status=1" & set "opt37_mark=[+]") else (set "opt37_mark=[-]")
goto :eof

:: �л��Ż�״̬�ĺ���
:Toggle_OPT
setlocal
set option=%1

:: 1.����������Cortana
if %option% equ 1 (
    if %opt1_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f >nul
        echo [��] ������������Cortana
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 1 /f >nul
        echo [��] ����ʾ������Cortana
    )
    goto :EOF
)

:: 2.���������ںϲ�
if %option% equ 2 (
    if %opt2_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d 1 /f >nul
        echo [��] ���������������ںϲ�
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ������������ںϲ�
    )
    goto :EOF
)

:: 3.��Դ����������ʾ"�˵���"
if %option% equ 3 (
    if %opt3_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f >nul
        echo [��] ��Դ��������ʱ��ʾ"�˵���"
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 2 /f >nul
        echo [��] ��Դ��������ʱ��ʾ"���ٷ���"
    )
    goto :EOF
)

:: 4.���Ǵ��ڴ�ж������DLL
if %option% equ 4 (
    if %opt4_status% equ 0 (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "AlwaysUnloadDLL" /t REG_DWORD /d 1 /f >nul
        echo [��] �����ô��ڴ�ж������DLL
    ) else (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "AlwaysUnloadDLL" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ô��ڴ�ж������DLL
    )
    goto :EOF
)

:: 5.��ֹ�����𻵵Ŀ�ݷ�ʽ
if %option% equ 5 (
    if %opt5_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ��ø����𻵵Ŀ�ݷ�ʽ
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d 0 /f >nul
        echo [��] �����ø����𻵵Ŀ�ݷ�ʽ
    )
    goto :EOF
)

:: 6.�Ż��ļ��б�ˢ�²���
if %option% equ 6 (
    if %opt6_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_DWORD /d 0 /f >nul
        echo [��] ���Ż�Windows�ļ��б�ˢ�²���
    ) else (
        reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_DWORD /d 200000 /f >nul
        echo [��] �ѻָ�Ĭ���ļ��б�ˢ�²���
    )
    goto :EOF
)

:: 7.������ݷ�ʽ�����"��ݷ�ʽ"����
if %option% equ 7 (
    if %opt7_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /t REG_BINARY /d 00000000 /f >nul
        echo [��] ������ݷ�ʽʱ�����"��ݷ�ʽ"����
    ) else (
        reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /f >nul
        echo [��] �ѻָ���ݷ�ʽĬ����������
    )
    goto :EOF
)

:: 8.��ֹ�Զ�����
if %option% equ 8 (
    if %opt8_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d 255 /f >nul
        echo [��] �ѽ����Զ�����
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d 145 /f >nul
        echo [��] �������Զ�����
    )
    goto :EOF
)

:: 9.�ڵ��������д��ļ���
if %option% equ 9 (
    if %opt9_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d 1 /f >nul
        echo [��] ���ڵ��������д��ļ��д���
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��õ������̴��ļ��д���
    )
    goto :EOF
)

:: 10.���ٷ��ʲ���ʾ�����ļ���
if %option% equ 10 (
    if %opt10_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 0 /f >nul
        echo [��] ���ٷ��ʲ�����ʾ�����ļ���
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 1 /f >nul
        echo [��] ���ٷ�������ʾ�����ļ���
    )
    goto :EOF
)

:: 11.���ٷ��ʲ���ʾ���ʹ���ļ�
if %option% equ 11 (
    if %opt11_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 0 /f >nul
        echo [��] ���ٷ��ʲ�����ʾ���ʹ���ļ�
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 1 /f >nul
        echo [��] ���ٷ�������ʾ���ʹ���ļ�
    )
    goto :EOF
)

:: 12.���������ص�������
if %option% equ 12 (
    if %opt12_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /t REG_DWORD /d 3 /f >nul
        echo [��] �����������ص�������
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /t REG_DWORD /d 0 /f >nul
        echo [��] �������ѻָ�Ĭ����ʾ
    )
    goto :EOF
)

:: 13.����������������ť
if %option% equ 13 (
    if %opt13_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" /t REG_DWORD /d 0 /f >nul
        echo [��] �������������ϵİ�����ť
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" /t REG_DWORD /d 1 /f >nul
        echo [��] ����ʾ�������ϵİ�����ť
    )
    goto :EOF
)

:: 14.��Դ�����������Զ�����
if %option% equ 14 (
    if %opt14_status% equ 0 (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /t REG_DWORD /d 1 /f >nul
        echo [��] ��Դ����������ʱ���Զ�����
    ) else (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ�����Դ�����������Զ�����
    )
    goto :EOF
)

:: 15.��ʾ�ļ���չ��
if %option% equ 15 (
    if %opt15_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f >nul
        echo [��] ����ʾ��֪�ļ����͵���չ��
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 1 /f >nul
        echo [��] ��������֪�ļ����͵���չ��
    )
    goto :EOF
)

:: 16.������ʾ"�˵���"
if %option% equ 16 (
    if %opt16_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f >nul
        echo [��] ��������ʾ"�˵���"
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 1 /f >nul
        echo [��] ����������"�˵���"
    )
    goto :EOF
)

:: 17.������ʾ"����վ"
if %option% equ 17 (
    if %opt17_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0 /f >nul
        echo [��] ��������ʾ"����վ"
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 1 /f >nul
        echo [��] ����������"����վ"
    )
    goto :EOF
)

:: 18.���ü��������ѽ���Ҽ��˵�
if %option% equ 18 (
    if %opt18_status% equ 0 (
        reg delete "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
        echo [��] �ѽ��ÿ�ִ���ļ���"���������ѽ��"�Ҽ��˵�
    ) else (
        reg add "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\Compatibility" /ve /t REG_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f >nul
        echo [��] �ѻָ���ִ���ļ���"���������ѽ��"�Ҽ��˵�
    )
    goto :EOF
)

:: 19.����Windows Defenderɨ���Ҽ��˵�
if %option% equ 19 (
    if %opt19_status% equ 0 (
        reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" /f >nul 2>&1
        echo [��] �ѽ����ļ�/�ļ��е�"ʹ��Windows Defenderɨ��"�Ҽ��˵�
    ) else (
        reg add "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" /ve /t REG_SZ /d "{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f >nul
        echo [��] �ѻָ��ļ�/�ļ��е�"ʹ��Windows Defenderɨ��"�Ҽ��˵�
    )
    goto :EOF
)

:: 20.����Bitlocker�Ҽ��˵�
if %option% equ 20 (
    if %opt20_status% equ 0 (
        reg delete "HKEY_CLASSES_ROOT\Drive\shell\BitLocker" /f >nul 2>&1
        echo [��] �ѽ��ô��̵�"����Bitlocker"�Ҽ��˵�
    ) else (
        reg add "HKEY_CLASSES_ROOT\Drive\shell\BitLocker" /ve /t REG_SZ /d "BitLocker" /f >nul
        echo [��] �ѻָ����̵�"����Bitlocker"�Ҽ��˵�
    )
    goto :EOF
)

:: 21.����"��Ϊ��Я�豸��"�Ҽ��˵�
if %option% equ 21 (
    if %opt21_status% equ 0 (
        reg delete "HKEY_CLASSES_ROOT\Drive\shell\PortableDeviceMenu" /f >nul 2>&1
        echo [��] �ѽ��ô��̵�"��Ϊ��Я�豸��"�Ҽ��˵�
    ) else (
        reg add "HKEY_CLASSES_ROOT\Drive\shell\PortableDeviceMenu" /ve /t REG_SZ /d "PortableDeviceMenu" /f >nul
        echo [��] �ѻָ����̵�"��Ϊ��Я�豸��"�Ҽ��˵�
    )
    goto :EOF
)

:: 22.�����½���ϵ���Ҽ��˵�
if %option% equ 22 (
    if %opt22_status% equ 0 (
        reg delete "HKEY_CLASSES_ROOT\.contact\ShellNew" /f >nul 2>&1
        echo [��] �ѽ����½���"��ϵ��"�Ҽ��˵�
    ) else (
        reg add "HKEY_CLASSES_ROOT\.contact\ShellNew" /v "NullFile" /t REG_SZ /d "" /f >nul
        echo [��] �ѻָ��½���"��ϵ��"�Ҽ��˵�
    )
    goto :EOF
)


:: 23.����"��ԭ��ǰ�汾"�Ҽ��˵�
if %option% equ 23 (
    if %opt23_status% equ 0 (
        reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
        echo [��] �ѽ����ļ�/���̵�"��ԭ��ǰ�汾"�Ҽ��˵�
    ) else (
        reg add "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /ve /t REG_SZ /d "" /f >nul
        echo [��] �ѻָ��ļ�/���̵�"��ԭ��ǰ�汾"�Ҽ��˵�
    )
    goto :EOF
)

:: 24.����"��¼������"�Ҽ��˵�
if %option% equ 24 (
    if %opt24_status% equ 0 (
        reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{B327765E-D724-4347-8B16-78AE18552FC3}" /f >nul 2>&1
        echo [��] �ѽ��ô��̵�"��¼������"�Ҽ��˵�
    ) else (
        reg add "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{B327765E-D724-4347-8B16-78AE18552FC3}" /ve /t REG_SZ /d "" /f >nul
        echo [��] �ѻָ����̵�"��¼������"�Ҽ��˵�
    )
    goto :EOF
)

:: 25.����"�������Ȩ��"�Ҽ��˵�
if %option% equ 25 (
    if %opt25_status% equ 0 (
        reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Sharing" /f >nul 2>&1
        echo [��] �ѽ���"�������Ȩ��"�Ҽ��˵�
    ) else (
        reg add "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Sharing" /ve /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f >nul
        echo [��] �ѻָ�"�������Ȩ��"�Ҽ��˵�
    )
    goto :EOF
)

:: 26.����"ʼ���ѻ�����"�Ҽ��˵�
if %option% equ 26 (
    if %opt26_status% equ 0 (
        reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Offline Files" /f >nul 2>&1
        echo [��] �ѽ����ļ�/�ļ��е�"ʼ���ѻ�����"�Ҽ��˵�
    ) else (
        reg add "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Offline Files" /ve /t REG_SZ /d "{474C98EE-CF3D-41f5-80E3-4AAB0AB04301}" /f >nul
        echo [��] �ѻָ��ļ�/�ļ��е�"ʼ���ѻ�����"�Ҽ��˵�
    )
    goto :EOF
)

:: 27.����"�̶������ٷ���"�Ҽ��˵�
if %option% equ 27 (
    if %opt27_status% equ 0 (
        reg delete "HKEY_CLASSES_ROOT\Folder\shell\pintohome" /f >nul 2>&1
        echo [��] �ѽ����ļ��е�"�̶������ٷ���"�Ҽ��˵�
    ) else (
        reg add "HKEY_CLASSES_ROOT\Folder\shell\pintohome" /ve /t REG_SZ /d "�̶������ٷ���" /f >nul
        echo [��] �ѻָ��ļ��е�"�̶������ٷ���"�Ҽ��˵�
    )
    goto :EOF
)

:: 28.���ù����ļ����Ҽ��˵�
if %option% equ 28 (
    if %opt28_status% equ 0 (
        reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\WorkFolders" /f >nul 2>&1
        echo [��] �ѽ���"�����ļ���"�Ҽ��˵�
    ) else (
        reg add "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\WorkFolders" /ve /t REG_SZ /d "{E50FF753-70F3-4C12-95FB-6586AFEBA48B}" /f >nul
        echo [��] �ѻָ�"�����ļ���"�Ҽ��˵�
    )
    goto :EOF
)

:: 29.���û�ͼ3D�Ҽ��˵�
if %option% equ 29 (
    if %opt29_status% equ 0 (
        reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.3mf\Shell\3D Edit" /f >nul 2>&1
        echo [��] �ѽ����ļ���"��ͼ3D"�Ҽ��˵�
    ) else (
        reg add "HKEY_CLASSES_ROOT\SystemFileAssociations\.3mf\Shell\3D Edit" /ve /t REG_SZ /d "��ͼ3D" /f >nul
        echo [��] �ѻָ��ļ���"��ͼ3D"�Ҽ��˵�
    )
    goto :EOF
)

:: 30.����"����������"�Ҽ��˵�
if %option% equ 30 (
    if %opt30_status% equ 0 (
        reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Library Location" /f >nul 2>&1
        echo [��] �ѽ����ļ��е�"����������"�Ҽ��˵�
    ) else (
        reg add "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Library Location" /ve /t REG_SZ /d "{018B4BE5-2F3F-45E6-9B3D-4D4BEE19812D}" /f >nul
        echo [��] �ѻָ��ļ��е�"����������"�Ҽ��˵�
    )
    goto :EOF
)

:: 31.���ÿ�ʼ�˵�����Ӧ��
if %option% equ 31 (
    if %opt31_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ÿ�ʼ�˵�App�б�-��õ�Ӧ��
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 1 /f >nul
        echo [��] �����ÿ�ʼ�˵�App�б�-��õ�Ӧ��
    )
    goto :EOF
)

:: 32.���ÿ�ʼ�˵�������Ӧ��
if %option% equ 32 (
    if %opt32_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ÿ�ʼ�˵�App�б�-�����ӵ�Ӧ��
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 1 /f >nul
        echo [��] �����ÿ�ʼ�˵�App�б�-�����ӵ�Ӧ��
    )
    goto :EOF
)

:: 33.���±������Զ�����
if %option% equ 33 (
    if %opt33_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "fWrap" /t REG_DWORD /d 1 /f >nul
        echo [��] ���±��������Զ�����
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "fWrap" /t REG_DWORD /d 0 /f >nul
        echo [��] ���±��ѽ����Զ�����
    )
    goto :EOF
)

:: 34.���±���ʾ״̬��
if %option% equ 34 (
    if %opt34_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "StatusBar" /t REG_DWORD /d 1 /f >nul
        echo [��] ���±�������״̬����ʾ
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "StatusBar" /t REG_DWORD /d 0 /f >nul
        echo [��] ���±��ѽ���״̬����ʾ
    )
    goto :EOF
)

:: 35.�˳�ʱ���������ĵ�
if %option% equ 35 (
    if %opt35_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ClearRecentDocsOnExit" /t REG_DWORD /d 1 /f >nul
        echo [��] �������˳�ϵͳʱ�������򿪵��ĵ�
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ClearRecentDocsOnExit" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ����˳�ϵͳʱ�������򿪵��ĵ�
    )
    goto :EOF
)
goto :EOF

:OPT36
if %opt36_status% equ 0 (
    reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve >nul
    echo [��] �ѻָ�Win11�����Ҽ��˵�
) else (
    reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f >nul
    echo [��] �ѻ�ԭWin11Ĭ���Ҽ��˵�
)
goto :eof

:OPT37
if %opt37_status% equ 0 (
    reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}" /ve /t REG_SZ /d "CLSID_ItemsViewAdapter" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}\InProcServer32" /ve /t REG_SZ /d "C:\\Windows\\System32\\Windows.UI.FileExplorer.dll_" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}\InProcServer32" /v ThreadingModel /t REG_SZ /d Apartment /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{6480100b-5a83-4d1e-9f69-8ae5a88e9a33}" /ve /t REG_SZ /d "File Explorer Xaml Island View Adapter" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{6480100b-5a83-4d1e-9f69-8ae5a88e9a33}\InProcServer32" /ve /t REG_SZ /d "C:\\Windows\\System32\\Windows.UI.FileExplorer.dll_" /f >nul
reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{6480100b-5a83-4d1e-9f69-8ae5a88e9a33}\InProcServer32" /v ThreadingModel /t REG_SZ /d Apartment /f >nul
    echo [��] �ѻָ�Win11������Դ������
) else (
    reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}" /f >nul
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{6480100b-5a83-4d1e-9f69-8ae5a88e9a33}" /f >nul
    echo [��] �ѻ�ԭWin11Ĭ����Դ������
)
endlocal
goto :EOF

:RESTART_EXPLORER
echo.
echo ����������Դ������...
taskkill /f /im explorer.exe >nul
start explorer.exe >nul
echo ��Դ������������
echo.
pause
goto waiguan

::-------------------------------------------------------------------------------------------
:: ZyperWin++ - �����Ż�����
::-------------------------------------------------------------------------------------------
:xingneng
setlocal enabledelayedexpansion

:: ��ʼ��״̬����
for /l %%i in (1,1,54) do set "opt%%i_status=0"

:: ��������Ż���״̬
call :Check_OPT_Status

:xingneng
cls
echo.===============================================================================
echo.                    ZyperWin++ - �����Ż�����
echo.===============================================================================
echo. ״̬���: [+]���Ż�  [-]δ�Ż�
echo.
echo   [ 1] %opt1_mark% �������ڿ�ʼ�˵���ʾ����
echo   [ 2] %opt2_mark% ��Ҫ��Ӧ���̵��в��ҹ���Ӧ��
echo   [ 3] %opt3_mark% �ر��̵�Ӧ���ƹ�
echo   [ 4] %opt4_mark% �ر�����ʱ��Windows�۽��ƹ�
echo   [ 5] %opt5_mark% �ر�"ʹ��Windowsʱ��ȡ���ɺͽ���"
echo   [ 6] %opt6_mark% ��ֹ�Զ���װ�Ƽ���Ӧ�ó���
echo   [ 7] %opt7_mark% �ر���Ϸ¼�ƹ���
echo   [ 8] %opt8_mark% �رն����С��
echo   [ 9] %opt9_mark% �ӿ�ػ��ٶ�
echo   [10] %opt10_mark% ���̹رշ���ȴ�ʱ��
echo   [11] %opt11_mark% ���ó������������
echo   [12] %opt12_mark% ����Զ���޸�ע���
echo   [13] %opt13_mark% ������Ϸ���
echo   [14] %opt14_mark% ����SysMain
echo   [15] %opt15_mark% ����Windows Search
echo   [16] %opt16_mark% ���ô��󱨸�
echo   [17] %opt17_mark% ���ÿͻ�������Ƽƻ�
echo   [18] %opt18_mark% ����NTFS���Ӹ��ٷ���
echo   [19] %opt19_mark% ��ֹ�Զ�ά���ƻ�
echo   [20] %opt20_mark% ���ô�ϵͳ�������������
echo   [21] %opt21_mark% ��ֹϵͳ�ں������������ҳ��Ӳ��
echo   [22] %opt22_mark% ���ļ�����ϵͳ����������256MB
echo   [23] %opt23_mark% ��WindowsԤ������Ϊ�ر�Ԥ��
echo   [24] %opt24_mark% ���ô�������������۶ϲ���
echo   [25] %opt25_mark% VHD����ʱ��ʡ���̿ռ�
echo   [26] %opt26_mark% �ر�ϵͳ�Զ����Թ���
echo   [27] %opt27_mark% �����̴�����ȴ�ʱ�����̵�����
echo   [28] %opt28_mark% �豸��װ��ֹ����ϵͳ��ԭ��
echo   [29] %opt29_mark% ����USB���̺󳹵׶Ͽ���Դ
echo   [30] %opt30_mark% �رտ�������
echo   [31] %opt31_mark% �ر�����
echo   [32] %opt32_mark% ��������������������
echo   [33] %opt33_mark% ΢��ƴ�����뷨�ر��Ƽ���
echo   [34] %opt34_mark% �������ݴ����Ż�����
echo   [35] %opt35_mark% ���ù��ܸ��°�ȫ��ʩ
echo   [36] %opt36_mark% �����������Զ�����
echo   [37] %opt37_mark% ����Installer detection
echo   [38] %opt38_mark% ���������Ĳ˵���ʾ�ӳ�
echo   [39] %opt39_mark% ���ñ����ռ�
echo   [40] %opt40_mark% ����Ӳ������GPU�ƻ�
echo   [41] %opt41_mark% �Ż����������ܺ��ڴ�����
echo   [42] %opt42_mark% ����Cortana���ܼ���CPUռ��
echo   [43] %opt43_mark% �ر�Exploit Protection
echo   [44] %opt44_mark% �رչ��ID
echo   [45] %opt45_mark% �ر�Ӧ����������
echo   [46] %opt46_mark% ȥ������ҳ����Ϣ��������
echo   [47] %opt47_mark% �ر�TSX©������
echo   [48] %opt48_mark% �Ż���������
echo   [49] %opt49_mark% �ر���ϲ��Է���
echo   [50] %opt50_mark% �رճ������������
echo   [51] %opt51_mark% �ر�΢��ͻ�����Ľ��ƻ�
echo   [52] %opt52_mark% ���ý����Ż�
echo   [53] %opt53_mark% ���ø߾����¼���ʱ��(HPET)
echo   [54] %opt54_mark% ����Game Bar
echo.
echo   [A] Ӧ������δ�Ż�����
echo   [X] ����
echo.
set /p "choices=������ѡ����: 1 3 5 �� A��: "

if "%choices%"=="" goto xingneng
if /i "%choices%"=="X" goto custom_optimize

:: ����ȫѡ��ֻѡδ�Ż����
if /i "%choices%"=="A" (
    set "choices="
    for /l %%i in (1,1,54) do (
        if !opt%%i_status! equ 0 set "choices=!choices! %%i"
    )
    if "!choices!"=="" (
        echo �����Ż�����Ӧ�ã����������
        pause
        goto custom_optimize
    )
)

:: �������ѡ��
for %%c in (%choices%) do (
    call :Toggle_OPT %%c
)

:: ����״̬
for /l %%i in (1,1,54) do set "opt%%i_status=0"
call :Check_OPT_Status

echo.
echo ע�⣺����������Ҫ����ϵͳ������ȫ��Ч
echo.
pause
goto xingneng

:: ��������Ż���״̬�ĺ���
:Check_OPT_Status
:: 1.�������ڿ�ʼ�˵���ʾ����
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt1_status=1" & set "opt1_mark=[+]") else (set "opt1_mark=[-]")

:: 2.��Ҫ��Ӧ���̵��в��ҹ���Ӧ��
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt2_status=1" & set "opt2_mark=[+]") else (set "opt2_mark=[-]")

:: 3.�ر��̵�Ӧ���ƹ�
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt3_status=1" & set "opt3_mark=[+]") else (set "opt3_mark=[-]")

:: 4.�ر�����ʱ��Windows�۽��ƹ�
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt4_status=1" & set "opt4_mark=[+]") else (set "opt4_mark=[-]")

:: 5.�ر�"ʹ��Windowsʱ��ȡ���ɺͽ���"
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt5_status=1" & set "opt5_mark=[+]") else (set "opt5_mark=[-]")

:: 6.��ֹ�Զ���װ�Ƽ���Ӧ�ó���
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" 2>nul | findstr /i "0x2" >nul
if %errorlevel% equ 0 (set "opt6_status=1" & set "opt6_mark=[+]") else (set "opt6_mark=[-]")

:: 7.�ر���Ϸ¼�ƹ���
reg query "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt7_status=1" & set "opt7_mark=[+]") else (set "opt7_mark=[-]")

:: 8.�رն����С��
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt8_status=1" & set "opt8_mark=[+]") else (set "opt8_mark=[-]")

:: 9.�ӿ�ػ��ٶ�
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" 2>nul | findstr /i "1000" >nul
if %errorlevel% equ 0 (set "opt9_status=1" & set "opt9_mark=[+]") else (set "opt9_mark=[-]")

:: 10.���̹رշ���ȴ�ʱ��
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "ServicesPipeTimeout" 2>nul | findstr /i "0x7d0" >nul
if %errorlevel% equ 0 (set "opt10_status=1" & set "opt10_mark=[+]") else (set "opt10_mark=[-]")

:: 11.���ó������������
sc query "PcaSvc" 2>nul | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt11_status=1" & set "opt11_mark=[+]") else (set "opt11_mark=[-]")

:: 12.����Զ���޸�ע���
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" /v "RemoteRegAccess" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt12_status=1" & set "opt12_mark=[+]") else (set "opt12_mark=[-]")

:: 13.������Ϸ���
sc query "DPS" 2>nul | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt13_status=1" & set "opt13_mark=[+]") else (set "opt13_mark=[-]")

:: 14.����SysMain
sc query "SysMain" 2>nul | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt14_status=1" & set "opt14_mark=[+]") else (set "opt14_mark=[-]")

:: 15.����Windows Search
sc query "WSearch" 2>nul | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt15_status=1" & set "opt15_mark=[+]") else (set "opt15_mark=[-]")

:: 16.���ô��󱨸�
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt16_status=1" & set "opt16_mark=[+]") else (set "opt16_mark=[-]")

:: 17.���ÿͻ�������Ƽƻ�
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt17_status=1" & set "opt17_mark=[+]") else (set "opt17_mark=[-]")

:: 18.����NTFS���Ӹ��ٷ���
sc query "TrkWks" 2>nul | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt18_status=1" & set "opt18_mark=[+]") else (set "opt18_mark=[-]")

:: 19.��ֹ�Զ�ά���ƻ�
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt19_status=1" & set "opt19_mark=[+]") else (set "opt19_mark=[-]")

:: 20.���ô�ϵͳ�������������
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt20_status=1" & set "opt20_mark=[+]") else (set "opt20_mark=[-]")

:: 21.��ֹϵͳ�ں������������ҳ��Ӳ��
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt21_status=1" & set "opt21_mark=[+]") else (set "opt21_mark=[-]")

:: 22.���ļ�����ϵͳ����������256MB
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" 2>nul | findstr /i "0x400000" >nul
if %errorlevel% equ 0 (set "opt22_status=1" & set "opt22_mark=[+]") else (set "opt22_mark=[-]")

:: 23.��WindowsԤ������Ϊ�ر�Ԥ��
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt23_status=1" & set "opt23_mark=[+]") else (set "opt23_mark=[-]")

:: 24.���ô�������������۶ϲ���
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" 2>nul | findstr /i "0x3" >nul
if %errorlevel% equ 0 (set "opt24_status=1" & set "opt24_mark=[+]") else (set "opt24_mark=[-]")

:: 25.VHD����ʱ��ʡ���̿ռ�
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FsDepends\Parameters" /v "VirtualDiskExpandOnMount" 2>nul | findstr /i "0x4" >nul
if %errorlevel% equ 0 (set "opt25_status=1" & set "opt25_mark=[+]") else (set "opt25_mark=[-]")

:: 26.�ر�ϵͳ�Զ����Թ���
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt26_status=1" & set "opt26_mark=[+]") else (set "opt26_mark=[-]")

:: 27.�����̴�����ȴ�ʱ�����̵�����
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "AutoChkTimeOut" 2>nul | findstr /i "0x5" >nul
if %errorlevel% equ 0 (set "opt27_status=1" & set "opt27_mark=[+]") else (set "opt27_mark=[-]")

:: 28.�豸��װ��ֹ����ϵͳ��ԭ��
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "DisableSystemRestore" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt28_status=1" & set "opt28_mark=[+]") else (set "opt28_mark=[-]")

:: 29.����USB���̺󳹵׶Ͽ���Դ
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v "DisableOnSoftRemove" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt29_status=1" & set "opt29_mark=[+]") else (set "opt29_mark=[-]")

:: 30.�رտ�������
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt30_status=1" & set "opt30_mark=[+]") else (set "opt30_mark=[-]")

:: 31.�ر�����
powercfg /a 2>&1 | findstr /i "��δ�������ߡ�" >nul
if %errorlevel% equ 0 (set "opt31_status=1" & set "opt31_mark=[+]") else (set "opt31_mark=[-]")

:: 32.��������������������
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions" /v "MitigationOptions_FontBocking" 2>nul | findstr /i "10000000000000000000000000000000" >nul
if %errorlevel% equ 0 (set "opt32_status=1" & set "opt32_mark=[+]") else (set "opt32_mark=[-]")

:: 33.΢��ƴ�����뷨�ر��Ƽ���
reg query "HKEY_CURRENT_USER\Software\Microsoft\InputMethod\Settings\CHS" /v "CloudCandidate" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt33_status=1" & set "opt33_mark=[+]") else (set "opt33_mark=[-]")

:: 34.�������ݴ����Ż�����
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt34_status=1" & set "opt34_mark=[+]") else (set "opt34_mark=[-]")

:: 35.���ù��ܸ��°�ȫ��ʩ
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX" /v "IsConvergedUpdateStackEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt35_status=1" & set "opt35_mark=[+]") else (set "opt35_mark=[-]")

:: 36.�����������Զ�����
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt36_status=1" & set "opt36_mark=[+]") else (set "opt36_mark=[-]")

:: 37.����Installer detection
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt37_status=1" & set "opt37_mark=[+]") else (set "opt37_mark=[-]")

:: 38.���������Ĳ˵���ʾ�ӳ�
reg query "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" 2>nul | findstr /i "0" >nul
if %errorlevel% equ 0 (set "opt38_status=1" & set "opt38_mark=[+]") else (set "opt38_mark=[-]")

:: 39.���ñ����ռ�
dism /online /get-reservedstoragestate 2>&1 | findstr /i "�ѽ���" >nul
if %errorlevel% equ 0 (set "opt39_status=1" & set "opt39_mark=[+]") else (set "opt39_mark=[-]")

:: 40.����Ӳ������GPU�ƻ�
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" 2>nul | findstr /i "0x2" >nul
if %errorlevel% equ 0 (set "opt40_status=1" & set "opt40_mark=[+]") else (set "opt40_mark=[-]")

:: 41.�Ż����������ܺ��ڴ�����
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" 2>nul | findstr /i "0x26" >nul
if %errorlevel% equ 0 (set "opt41_status=1" & set "opt41_mark=[+]") else (set "opt41_mark=[-]")

:: 42.����Cortana���ܼ���CPUռ��
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt42_status=1" & set "opt42_mark=[+]") else (set "opt42_mark=[-]")

:: 43.�ر�Exploit Protection
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "MitigationOptions" 2>nul | findstr /i "22222200000200000002000000000000" >nul
if %errorlevel% equ 0 (set "opt43_status=1" & set "opt43_mark=[+]") else (set "opt43_mark=[-]")

:: 44.�رչ��ID
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt44_status=1" & set "opt44_mark=[+]") else (set "opt44_mark=[-]")

:: 45.�ر�Ӧ����������
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt45_status=1" & set "opt45_mark=[+]") else (set "opt45_mark=[-]")

:: 46.ȥ������ҳ����Ϣ��������
reg query "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt46_status=1" & set "opt46_mark=[+]") else (set "opt46_mark=[-]")

:: 47.�ر�TSX©������
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "DisableTsx" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt47_status=1" & set "opt47_mark=[+]") else (set "opt47_mark=[-]")

:: 48.�Ż���������
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" 2>nul | findstr /i "ffffffff" >nul
if %errorlevel% equ 0 (set "opt48_status=1" & set "opt48_mark=[+]") else (set "opt48_mark=[-]")

:: 49.�ر���ϲ��Է���
sc query "DPS" 2>nul | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt49_status=1" & set "opt49_mark=[+]") else (set "opt49_mark=[-]")

:: 50.�رճ������������
sc query "PcaSvc" 2>nul | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt50_status=1" & set "opt50_mark=[+]") else (set "opt50_mark=[-]")

:: 51.�ر�΢��ͻ�����Ľ��ƻ�
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt51_status=1" & set "opt51_mark=[+]") else (set "opt51_mark=[-]")

:: 52.���ý����Ż�
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt52_status=1" & set "opt52_mark=[+]") else (set "opt52_mark=[-]")

:: 53.���ø߾����¼���ʱ��(HPET)
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hpet" /v "Start" 2>nul | findstr /i "0x4" >nul
if %errorlevel% equ 0 (set "opt53_status=1" & set "opt53_mark=[+]") else (set "opt53_mark=[-]")

:: 54.����Game Bar
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt54_status=1" & set "opt54_mark=[+]") else (set "opt54_mark=[-]")
goto :eof

:: �л��Ż�״̬�ĺ���
:Toggle_OPT
setlocal
set option=%1

:: 1.�������ڿ�ʼ�˵���ʾ����
if %option% equ 1 (
    if %opt1_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ�ֹ�ڿ�ʼ�˵���ʾ����
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /f >nul
        echo [��] �������ڿ�ʼ�˵���ʾ����
    )
    goto :EOF
)

:: 2.��Ҫ��Ӧ���̵��в��ҹ���Ӧ��
if %option% equ 2 (
    if %opt2_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ�ֹ��Ӧ���̵��в��ҹ���Ӧ��
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /f >nul
        echo [��] ��������Ӧ���̵��в��ҹ���Ӧ��
    )
    goto :EOF
)

:: 3.�ر��̵�Ӧ���ƹ�
if %option% equ 3 (
    if %opt3_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѹر��̵�Ӧ���ƹ�
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /f >nul
        echo [��] �������̵�Ӧ���ƹ�
    )
    goto :EOF
)

:: 4.�ر�����ʱ��Windows�۽��ƹ�
if %option% equ 4 (
    if %opt4_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѹر�����ʱ��Windows�۽��ƹ�
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /f >nul
        echo [��] ����������ʱ��Windows�۽��ƹ�
    )
    goto :EOF
)

:: 5.�ر�"ʹ��Windowsʱ��ȡ���ɺͽ���"
if %option% equ 5 (
    if %opt5_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѹر�"ʹ��Windowsʱ��ȡ���ɺͽ���"
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /f >nul
        echo [��] ������"ʹ��Windowsʱ��ȡ���ɺͽ���"
    )
    goto :EOF
)

:: 6.��ֹ�Զ���װ�Ƽ���Ӧ�ó���
if %option% equ 6 (
    if %opt6_status% equ 0 (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d 2 /f >nul
        echo [��] �ѽ�ֹ�Զ���װ�Ƽ���Ӧ�ó���
    ) else (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /f >nul
        echo [��] �������Զ���װ�Ƽ���Ӧ�ó���
    )
    goto :EOF
)

:: 7.�ر���Ϸ¼�ƹ���
if %option% equ 7 (
    if %opt7_status% equ 0 (
        reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѹر���Ϸ¼�ƹ���
    ) else (
        reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /f >nul
        echo [��] ��������Ϸ¼�ƹ���
    )
    goto :EOF
)

:: 8.�رն����С��
if %option% equ 8 (
    if %opt8_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѹرն����С��
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /f >nul
        echo [��] �����ö����С��
    )
    goto :EOF
)

:: 9.�ӿ�ػ��ٶ�
if %option% equ 9 (
    if %opt9_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "1000" /f >nul
        echo [��] �Ѽӿ�ػ��ٶ�
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /f >nul
        echo [��] �ѻָ�Ĭ�Ϲػ��ٶ�
    )
    goto :EOF
)

:: 10.���̹رշ���ȴ�ʱ��
if %option% equ 10 (
    if %opt10_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "ServicesPipeTimeout" /t REG_DWORD /d 2000 /f >nul
        echo [��] �����̹رշ���ȴ�ʱ��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "ServicesPipeTimeout" /f >nul
        echo [��] �ѻָ�Ĭ�Ϸ���رյȴ�ʱ��
    )
    goto :EOF
)

:: 11.���ó������������
if %option% equ 11 (
    if %opt11_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "PcaSvc" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "PcaSvc" >nul 2>&1
        echo [��] �ѽ��ó������������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "PcaSvc" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "PcaSvc" >nul 2>&1
        echo [��] �����ó������������
    )
    goto :EOF
)

:: 12.����Զ���޸�ע���
if %option% equ 12 (
    if %opt12_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" /v "RemoteRegAccess" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���Զ���޸�ע���
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" /v "RemoteRegAccess" /f >nul
        echo [��] ������Զ���޸�ע���
    )
    goto :EOF
)

:: 13.������Ϸ���
if %option% equ 13 (
    if %opt13_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "DPS" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "DPS" >nul 2>&1
        echo [��] �ѽ�����Ϸ���
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "DPS" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "DPS" >nul 2>&1
        echo [��] ��������Ϸ���
    )
    goto :EOF
)

:: 14.����SysMain
if %option% equ 14 (
    if %opt14_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SysMain" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "SysMain" >nul 2>&1
        echo [��] �ѽ���SysMain
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SysMain" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "SysMain" >nul 2>&1
        echo [��] ������SysMain
    )
    goto :EOF
)

:: 15.����Windows Search
if %option% equ 15 (
    if %opt15_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WSearch" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WSearch" >nul 2>&1
        echo [��] �ѽ���Windows Search
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WSearch" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "WSearch" >nul 2>&1
        echo [��] ������Windows Search
    )
    goto :EOF
)

:: 16.���ô��󱨸�
if %option% equ 16 (
    if %opt16_status% equ 0 (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ��ô��󱨸�
    ) else (
        reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /f >nul
        echo [��] �����ô��󱨸�
    )
    goto :EOF
)

:: 17.���ÿͻ�������Ƽƻ�
if %option% equ 17 (
    if %opt17_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ÿͻ�������Ƽƻ�
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /f >nul
        echo [��] �����ÿͻ�������Ƽƻ�
    )
    goto :EOF
)

:: 18.����NTFS���Ӹ��ٷ���
if %option% equ 18 (
    if %opt18_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "TrkWks" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "TrkWks" >nul 2>&1
        echo [��] �ѽ���NTFS���Ӹ��ٷ���
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "TrkWks" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "TrkWks" >nul 2>&1
        echo [��] ������NTFS���Ӹ��ٷ���
    )
    goto :EOF
)

:: 19.��ֹ�Զ�ά���ƻ�
if %option% equ 19 (
    if %opt19_status% equ 0 (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ�ֹ�Զ�ά���ƻ�
    ) else (
        reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /f >nul
        echo [��] �������Զ�ά���ƻ�
    )
    goto :EOF
)

:: 20.���ô�ϵͳ�������������
if %option% equ 20 (
    if %opt20_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f >nul
        echo [��] �����ô�ϵͳ�������������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ô�ϵͳ����
    )
    goto :EOF
)

:: 21.��ֹϵͳ�ں������������ҳ��Ӳ��
if %option% equ 21 (
    if %opt21_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ�ֹϵͳ�ں������������ҳ��Ӳ��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 0 /f >nul
        echo [��] ������ϵͳ�ں������������ҳ��Ӳ��
    )
    goto :EOF
)

:: 22.���ļ�����ϵͳ����������256MB
if %option% equ 22 (
    if %opt22_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d 4194304 /f >nul
        echo [��] �ѽ��ļ�����ϵͳ����������256MB
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /f >nul
        echo [��] �ѻָ�Ĭ���ļ�����ϵͳ�����С
    )
    goto :EOF
)

:: 23.��WindowsԤ������Ϊ�ر�Ԥ��
if %option% equ 23 (
    if %opt23_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѹر�WindowsԤ������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 3 /f >nul
        echo [��] ������WindowsԤ������
    )
    goto :EOF
)

:: 24.���ô�������������۶ϲ���
if %option% equ 24 (
    if %opt24_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 3 /f >nul
        echo [��] �ѽ��ô�������������۶ϲ������������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /f >nul
        echo [��] �����ô�������������۶ϲ���
    )
    goto :EOF
)

:: 25.VHD����ʱ��ʡ���̿ռ�
if %option% equ 25 (
    if %opt25_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FsDepends\Parameters" /v "VirtualDiskExpandOnMount" /t REG_DWORD /d 4 /f >nul
        echo [��] VHD����ʱ�ѽ�ʡ���̿ռ�
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FsDepends\Parameters" /v "VirtualDiskExpandOnMount" /f >nul
        echo [��] �ѻָ�VHD����Ĭ������
    )
    goto :EOF
)

:: 26.�ر�ϵͳ�Զ����Թ���
if %option% equ 26 (
    if %opt26_status% equ 0 (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѹر�ϵͳ�Զ����Թ���
    ) else (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t REG_DWORD /d 1 /f >nul
        echo [��] ������ϵͳ�Զ����Թ���
    )
    goto :EOF
)

:: 27.�����̴�����ȴ�ʱ�����̵�����
if %option% equ 27 (
    if %opt27_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "AutoChkTimeOut" /t REG_DWORD /d 5 /f >nul
        echo [��] �ѽ����̴�����ȴ�ʱ�����̵�����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "AutoChkTimeOut" /f >nul
        echo [��] �ѻָ�Ĭ�ϴ��̴�����ȴ�ʱ��
    )
    goto :EOF
)

:: 28.�豸��װ��ֹ����ϵͳ��ԭ��
if %option% equ 28 (
    if %opt28_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "DisableSystemRestore" /t REG_DWORD /d 1 /f >nul
        echo [��] �豸��װ�ѽ�ֹ����ϵͳ��ԭ��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "DisableSystemRestore" /f >nul
        echo [��] �豸��װ��������ϵͳ��ԭ��
    )
    goto :EOF
)

:: 29.����USB���̺󳹵׶Ͽ���Դ
if %option% equ 29 (
    if %opt29_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v "DisableOnSoftRemove" /t REG_DWORD /d 0 /f >nul
        echo [��] ����USB���̺��ѳ��׶Ͽ���Դ
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v "DisableOnSoftRemove" /f >nul
        echo [��] �ѻָ�USB����Ĭ�ϵ�Դ����
    )
    goto :EOF
)

:: 30.�رտ�������
if %option% equ 30 (
    if %opt30_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѹرտ�������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /f >nul
        echo [��] �����ÿ�������
    )
    goto :EOF
)

:: 31.�ر�����
if %option% equ 31 (
    if %opt31_status% equ 0 (
        powercfg /h off >nul
        echo [��] �ѹر�����
    ) else (
        powercfg /h on >nul
        echo [��] ����������
    )
    goto :EOF
)

:: 32.��������������������
if %option% equ 32 (
    if %opt32_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions" /v "MitigationOptions_FontBocking" /t REG_SZ /d "10000000000000000000000000000000" /f >nul
        echo [��] �Ѹ�������������������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions" /v "MitigationOptions_FontBocking" /f >nul
        echo [��] ����ʾ��������
    )
    goto :EOF
)

:: 33.΢��ƴ�����뷨�ر��Ƽ���
if %option% equ 33 (
    if %opt33_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\InputMethod\Settings\CHS" /v "CloudCandidate" /t REG_DWORD /d 0 /f >nul
        echo [��] ΢��ƴ�����뷨�ѹر��Ƽ���
    ) else (
        reg delete "HKEY_CURRENT_USER\Software\Microsoft\InputMethod\Settings\CHS" /v "CloudCandidate" /f >nul
        echo [��] ΢��ƴ�����뷨�������Ƽ���
    )
    goto :EOF
)

:: 34.�������ݴ����Ż�����
if %option% equ 34 (
    if %opt34_status% equ 0 (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ������ݴ����Ż�����
    ) else (
        reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /f >nul
        echo [��] ���������ݴ����Ż�����
    )
    goto :EOF
)

:: 35.���ù��ܸ��°�ȫ��ʩ
if %option% equ 35 (
    if %opt35_status% equ 0 (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX" /v "IsConvergedUpdateStackEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ù��ܸ��°�ȫ��ʩ
    ) else (
        reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX" /v "IsConvergedUpdateStackEnabled" /f >nul
        echo [��] �����ù��ܸ��°�ȫ��ʩ
    )
    goto :EOF
)

:: 36.�����������Զ�����
if %option% equ 36 (
    if %opt36_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ����������Զ�����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot" /f >nul
        echo [��] �������������Զ�����
    )
    goto :EOF
)

:: 37.����Installer detection
if %option% equ 37 (
    if %opt37_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���Installer detection
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /f >nul
        echo [��] ������Installer detection
    )
    goto :EOF
)

:: 38���������Ĳ˵���ʾ�ӳ�
if %option% equ 38 (
    if %opt38_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >nul
        echo [��] �ѽ��������Ĳ˵���ʾ�ӳ�
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "400" /f >nul
        echo [��] �����������Ĳ˵���ʾ�ӳ�
    )
    goto :EOF
)

:: 39.���ñ����ռ�
if %option% equ 39 (
    if %opt39_status% equ 0 (
        DISM.exe /Online /Set-ReservedStorageState /State:Disabled >nul 2>&1
        echo [��] �ѽ��ñ����ռ�
    ) else (
        DISM.exe /Online /Set-ReservedStorageState /State:Enabled >nul 2>&1
        echo [��] �����ñ����ռ�
    )
    goto :EOF
)

:: 40.����Ӳ������GPU�ƻ�
if %option% equ 40 (
    if %opt40_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f >nul
        echo [��] ������Ӳ������GPU�ƻ�
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /f >nul
        echo [��] �ѽ���Ӳ������GPU�ƻ�
    )
    goto :EOF
)

:: 41.�Ż����������ܺ��ڴ�����
if %option% equ 41 (
    if %opt41_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d 1 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ16Priority" /t REG_DWORD /d 2 /f >nul
        echo [��] ���Ż����������ܺ��ڴ�����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ16Priority" /f >nul
        echo [��] �ѻָ�Ĭ�ϴ��������ܺ��ڴ�����
    )
    goto :EOF
)

:: 42.����Cortana���ܼ���CPUռ��
if %option% equ 42 (
    if %opt42_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���Cortana���ܣ�����CPUռ��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /f >nul
        echo [��] �ѻָ�CortanaĬ������
    )
    goto :EOF
)

:: 43.�ر�Exploit Protection
if %option% equ 43 (
    if %opt43_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "MitigationOptions" /t REG_BINARY /d 22222200000200000002000000000000 /f >nul
        echo [��] �ѹر�Exploit Protection
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "MitigationOptions" /f >nul
        echo [��] ������Exploit Protection
    )
    goto :EOF
)

:: 44.�رչ��ID
if %option% equ 44 (
    if %opt44_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѹرչ��ID
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /f >nul
        echo [��] �����ù��ID
    )
    goto :EOF
)

:: 45.�ر�Ӧ����������
if %option% equ 45 (
    if %opt45_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѹر�Ӧ����������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /f >nul
        echo [��] ������Ӧ����������
    )
    goto :EOF
)

:: 46.ȥ������ҳ����Ϣ��������
if %option% equ 46 (
    if %opt46_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1 /f >nul
        echo [��] ��ȥ������ҳ����Ϣ��������
    ) else (
        reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /f >nul
        echo [��] �ѻָ�����ҳ����Ϣ��������
    )
    goto :EOF
)

:: 47.�ر�TSX©������
if %option% equ 47 (
    if %opt47_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "DisableTsx" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѹر�TSX©������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "DisableTsx" /f >nul
        echo [��] ������TSX©������
    )
    goto :EOF
)

:: 48.�Ż���������
if %option% equ 48 (
    if %opt48_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_SZ /d "ffffffff" /f >nul
        echo [��] ���Ż���������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /f >nul
        echo [��] �ѻָ�Ĭ�Ͻ�����������
    )
    goto :EOF
)

:: 49.�ر���ϲ��Է���
if %option% equ 49 (
    if %opt49_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "DPS" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "DPS" >nul 2>&1
        echo [��] �ѹر���ϲ��Է���
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "DPS" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "DPS" >nul 2>&1
        echo [��] ��������ϲ��Է���
    )
    goto :EOF
)

:: 50.�رճ������������
if %option% equ 50 (
    if %opt50_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "PcaSvc" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "PcaSvc" >nul 2>&1
        echo [��] �ѹرճ������������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "PcaSvc" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "PcaSvc" >nul 2>&1
        echo [��] �����ó������������
    )
    goto :EOF
)

:: 51.�ر�΢��ͻ�����Ľ��ƻ�
if %option% equ 51 (
    if %opt51_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѹر�΢��ͻ�����Ľ��ƻ�
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /f >nul
        echo [��] ������΢��ͻ�����Ľ��ƻ�
    )
    goto :EOF
)

:: 52.���ý����Ż�
if %option% equ 52 (
    if %opt52_status% equ 0 (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ý����Ż�
    ) else (
        reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /f >nul
        echo [��] �����ý����Ż�
    )
    goto :EOF
)

:: 53.���ø߾����¼���ʱ��(HPET)
if %option% equ 53 (
    if %opt53_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hpet" /v "Start" /t REG_DWORD /d 4 /f >nul
        echo [��] �ѽ��ø߾����¼���ʱ��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hpet" /v "Start" /f >nul
        echo [��] �����ø߾����¼���ʱ��
    )
    goto :EOF
)

:: 54.����Game Bar
if %option% equ 54 (
    if %opt54_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���Game Bar
    ) else (
        reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /f >nul
        echo [��] ������Game Bar
    )
    goto :EOF
)
endlocal
goto :EOF


::-------------------------------------------------------------------------------------------
:: ZyperWin++ - Edge�Ż�����
::-------------------------------------------------------------------------------------------
:Edge
setlocal enabledelayedexpansion

:: ��ʼ��״̬����
for /l %%i in (1,1,14) do set "opt%%i_status=0"

:: ��������Ż���״̬
call :Check_OPT_Status

cls
echo.===============================================================================
echo.                    ZyperWin++ - Edge������Ż�����
echo.===============================================================================
echo. ״̬���: [+]���Ż�  [-]δ�Ż�
echo.
echo   [ 1] %opt1_mark% ����"�״�����"��ӭҳ��
echo   [ 2] %opt2_mark% �ر�Adobe Flash���㼴��
echo   [ 3] %opt3_mark% �رպ��ֹ�������к�̨Ӧ��
echo   [ 4] %opt4_mark% ��ֹ��Ӧ��������е����й��
echo   [ 5] %opt5_mark% ������ѡ�ҳ���ϵ�΢����Ѷ
echo   [ 6] %opt6_mark% �����±�ǩҳ�е�Ĭ��������վ
echo   [ 7] %opt7_mark% ����Edge���������
echo   [ 8] %opt8_mark% ����Smartscreenɸѡ��
echo   [ 9] %opt9_mark% ��ֹ�����κ��������
echo   [10] %opt10_mark% ���ñ�ǩҳ���ܼ����
echo   [11] %opt11_mark% �ر�ֹ֧ͣ�־�ϵͳ��֪ͨ
echo   [12] %opt12_mark% �ر�Edge������
echo   [13] %opt13_mark% ����Ч��ģʽ
echo   [14] %opt14_mark% �ر�"�������֯����"��ʾ
echo.
echo   [A] Ӧ������δ�Ż�����
echo   [X] ����
echo.
set /p "choices=������ѡ����: 1 3 5 �� A��: "

if "%choices%"=="" goto Edge
if /i "%choices%"=="X" goto custom_optimize

:: ����ȫѡ��ֻѡδ�Ż����
if /i "%choices%"=="A" (
    set "choices="
    for /l %%i in (1,1,14) do (
        if !opt%%i_status! equ 0 set "choices=!choices! %%i"
    )
    if "!choices!"=="" (
        echo �����Ż�����Ӧ�ã����������
        pause
        goto custom_optimize
    )
)

:: �������ѡ��
for %%c in (%choices%) do (
    call :Toggle_OPT %%c
)

:: ����״̬
for /l %%i in (1,1,14) do set "opt%%i_status=0"
call :Check_OPT_Status

echo.
echo ע�⣺����������Ҫ����Edge�����������Ч
echo.
pause
goto custom_optimize

:: ��������Ż���״̬�ĺ���
:Check_OPT_Status
:: 1.����"�״�����"��ӭҳ��
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HideFirstRunExperience" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt1_status=1" & set "opt1_mark=[+]") else (set "opt1_mark=[-]")

:: 2.�ر�Adobe Flash���㼴��
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "RunAllFlashInAllowMode" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt2_status=1" & set "opt2_mark=[+]") else (set "opt2_mark=[-]")

:: 3.�رպ��ֹ�������к�̨Ӧ��
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt3_status=1" & set "opt3_mark=[+]") else (set "opt3_mark=[-]")

:: 4.��ֹ��Ӧ��������е����й��
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AdsSettingForIntrusiveAdsSites" 2>nul | findstr /i "0x2" >nul
if %errorlevel% equ 0 (set "opt4_status=1" & set "opt4_mark=[+]") else (set "opt4_mark=[-]")

:: 5.������ѡ�ҳ���ϵ�΢����Ѷ
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageContentEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt5_status=1" & set "opt5_mark=[+]") else (set "opt5_mark=[-]")

:: 6.�����±�ǩҳ�е�Ĭ��������վ
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageHideDefaultTopSites" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt6_status=1" & set "opt6_mark=[+]") else (set "opt6_mark=[-]")

:: 7.����Edge���������
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ShowSidebar" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt7_status=1" & set "opt7_mark=[+]") else (set "opt7_mark=[-]")

:: 8.����Smartscreenɸѡ��
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (
    reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenForTrustedDownloadsEnabled" 2>nul | findstr /i "0x0" >nul
    if %errorlevel% equ 0 (set "opt8_status=1" & set "opt8_mark=[+]") else (set "opt8_mark=[-]")
) else (set "opt8_mark=[-]")

:: 9.��ֹ�����κ��������
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DiagnosticData" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt9_status=1" & set "opt9_mark=[+]") else (set "opt9_mark=[-]")

:: 10.���ñ�ǩҳ���ܼ����
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PerformanceDetectorEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt10_status=1" & set "opt10_mark=[+]") else (set "opt10_mark=[-]")

:: 11.�ر�ֹ֧ͣ�־�ϵͳ��֪ͨ
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SuppressUnsupportedOSWarning" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt11_status=1" & set "opt11_mark=[+]") else (set "opt11_mark=[-]")

:: 12.�ر�Edge������
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt12_status=1" & set "opt12_mark=[+]") else (set "opt12_mark=[-]")

:: 13.����Ч��ģʽ
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyMode" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (
    reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyModeOnPowerEnabled" 2>nul | findstr /i "0x2" >nul
    if %errorlevel% equ 0 (
        reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyModeEnabled" 2>nul | findstr /i "0x1" >nul
        if %errorlevel% equ 0 (set "opt13_status=1" & set "opt13_mark=[+]") else (set "opt13_mark=[-]")
    ) else (set "opt13_mark=[-]")
) else (set "opt13_mark=[-]")

:: 14.�ر�"�������֯����"��ʾ
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HideManagedBrowserWarning" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt14_status=1" & set "opt14_mark=[+]") else (set "opt14_mark=[-]")
goto :eof

:: �л��Ż�״̬�ĺ���
:Toggle_OPT
setlocal
set option=%1

:: 1.����"�״�����"��ӭҳ��
if %option% equ 1 (
    if %opt1_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HideFirstRunExperience" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ���"�״�����"��ӭҳ��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HideFirstRunExperience" /t REG_DWORD /d 0 /f >nul
        echo [��] ������"�״�����"��ӭҳ��
    )
    goto :EOF
)

:: 2.�ر�Adobe Flash���㼴��
if %option% equ 2 (
    if %opt2_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "RunAllFlashInAllowMode" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѹر�Adobe Flash���㼴��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "RunAllFlashInAllowMode" /t REG_DWORD /d 1 /f >nul
        echo [��] ������Adobe Flash���㼴��
    )
    goto :EOF
)

:: 3.�رպ��ֹ�������к�̨Ӧ��
if %option% equ 3 (
    if %opt3_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ�ֹEdge�رպ�������к�̨Ӧ��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /t REG_DWORD /d 1 /f >nul
        echo [��] ������Edge�رպ�������к�̨Ӧ��
    )
    goto :EOF
)

:: 4.��ֹ��Ӧ��������е����й��
if %option% equ 4 (
    if %opt4_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AdsSettingForIntrusiveAdsSites" /t REG_DWORD /d 2 /f >nul
        echo [��] ����ֹ��Ӧ��������е����й��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AdsSettingForIntrusiveAdsSites" /t REG_DWORD /d 1 /f >nul
        echo [��] �������Ӧ�����������ʾ���
    )
    goto :EOF
)

:: 5.������ѡ�ҳ���ϵ�΢����Ѷ
if %option% equ 5 (
    if %opt5_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageContentEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ�����ѡ�ҳ���ϵ�΢����Ѷ����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageContentEnabled" /t REG_DWORD /d 1 /f >nul
        echo [��] ��������ѡ�ҳ���ϵ�΢����Ѷ����
    )
    goto :EOF
)

:: 6.�����±�ǩҳ�е�Ĭ��������վ
if %option% equ 6 (
    if %opt6_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageHideDefaultTopSites" /t REG_DWORD /d 1 /f >nul
        echo [��] �������±�ǩҳ�е�Ĭ��������վ
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageHideDefaultTopSites" /t REG_DWORD /d 0 /f >nul
        echo [��] ����ʾ�±�ǩҳ�е�Ĭ��������վ
    )
    goto :EOF
)

:: 7.����Edge���������
if %option% equ 7 (
    if %opt7_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ShowSidebar" /t REG_DWORD /d 0 /f >nul
        echo [��] ������Edge���������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ShowSidebar" /t REG_DWORD /d 1 /f >nul
        echo [��] ����ʾEdge���������
    )
    goto :EOF
)

:: 8.����Smartscreenɸѡ��
if %option% equ 8 (
    if %opt8_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenEnabled" /t REG_DWORD /d 0 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenForTrustedDownloadsEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���Smartscreenɸѡ��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenEnabled" /t REG_DWORD /d 1 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenForTrustedDownloadsEnabled" /t REG_DWORD /d 1 /f >nul
        echo [��] ������Smartscreenɸѡ��
    )
    goto :EOF
)

:: 9.��ֹ�����κ��������
if %option% equ 9 (
    if %opt9_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DiagnosticData" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ�ֹ�����κ��������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DiagnosticData" /t REG_DWORD /d 1 /f >nul
        echo [��] ���������������
    )
    goto :EOF
)

:: 10.���ñ�ǩҳ���ܼ����
if %option% equ 10 (
    if %opt10_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PerformanceDetectorEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ñ�ǩҳ���ܼ����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PerformanceDetectorEnabled" /t REG_DWORD /d 1 /f >nul
        echo [��] �����ñ�ǩҳ���ܼ����
    )
    goto :EOF
)

:: 11.�ر�ֹ֧ͣ�־�ϵͳ��֪ͨ
if %option% equ 11 (
    if %opt11_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SuppressUnsupportedOSWarning" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѹر�ֹ֧ͣ�־�ϵͳ��֪ͨ
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SuppressUnsupportedOSWarning" /t REG_DWORD /d 0 /f >nul
        echo [��] ������ֹ֧ͣ�־�ϵͳ��֪ͨ
    )
    goto :EOF
)

:: 12.�ر�Edge������
if %option% equ 12 (
    if %opt12_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѹر�Edge������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" /t REG_DWORD /d 1 /f >nul
        echo [��] ������Edge������
    )
    goto :EOF
)

:: 13.����Ч��ģʽ
if %option% equ 13 (
    if %opt13_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyMode" /t REG_DWORD /d 1 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyModeOnPowerEnabled" /t REG_DWORD /d 2 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyModeEnabled" /t REG_DWORD /d 1 /f >nul
        echo [��] ������Ч��ģʽ
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyMode" /t REG_DWORD /d 0 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyModeOnPowerEnabled" /t REG_DWORD /d 0 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyModeEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���Ч��ģʽ
    )
    goto :EOF
)

:: 14.�ر�"�������֯����"��ʾ
if %option% equ 14 (
    if %opt14_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HideManagedBrowserWarning" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѹر�"�������֯����"��ʾ
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HideManagedBrowserWarning" /t REG_DWORD /d 0 /f >nul
        echo [��] ����ʾ"�������֯����"��ʾ
    )
    goto :EOF
)
endlocal
goto :EOF

::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ��ȫ����
::-------------------------------------------------------------------------------------------
:anquan
setlocal enabledelayedexpansion

:: ��ʼ��״̬����
for /l %%i in (1,1,20) do set "opt%%i_status=0"

:: ��������Ż���״̬
call :Check_Status

cls
echo.===============================================================================
echo.                ZyperWin++ - �ۺϰ�ȫ����
echo.===============================================================================
echo. ״̬���: [+]�ѽ���/�Ż�  [-]������/δ�Ż�
echo.
echo   [ 1] %opt1_mark% ����Defender�ܽ���
echo   [ 2] %opt2_mark% ����LSA����(RunAsPPL)
echo   [ 3] %opt3_mark% ����SmartScreenɸѡ��
echo   [ 4] %opt4_mark% ����Windows��ȫ���ı���
echo   [ 5] %opt5_mark% ��������������ֹ�б�
echo   [ 6] %opt6_mark% ����Edge�����SmartScreen
echo   [ 7] %opt7_mark% �����ļ���Դ������SmartScreen
echo   [ 8] %opt8_mark% ����Microsoft StoreӦ��SmartScreen
echo   [ 9] %opt9_mark% ���ù�������ٹ���(ASR)
echo   [10] %opt10_mark% ����UAC(�û��˻�����)
echo   [11] %opt11_mark% �������⻯��ȫ(VBS)
echo   [12] %opt12_mark% ����ƾ֤����(Credential Guard)
echo   [13] %opt13_mark% �����ܿ��ļ��з���
echo   [14] %opt14_mark% �������籣��
echo   [15] %opt15_mark% ����AMSI
echo   [16] %opt16_mark% ���ô���������
echo   [17] %opt17_mark% �رշ���ǽ
echo   [18] %opt18_mark% �ر�Ĭ�Ϲ���
echo   [19] %opt19_mark% �ر�Զ��Э��
echo   [20] %opt20_mark% ���ò���ȫ��������¼
echo.
echo   [A] Ӧ������δ���õ���
echo   [X] �������˵�
echo.
set /p "choices=������ѡ����: 1 3 5 �� A��: "

if "%choices%"=="" goto anquan
if /i "%choices%"=="X" goto custom_optimize

:: ����ȫѡ��ֻѡδ���õ��
if /i "%choices%"=="A" (
    set "choices="
    for /l %%i in (1,1,20) do (
        if !opt%%i_status! equ 0 set "choices=!choices! %%i"
    )
    if "!choices!"=="" (
        echo ���а�ȫ����ѽ��ã����������
        pause
        goto custom_optimize
    )
)

:: �������ѡ��
for %%c in (%choices%) do (
    call :Toggle_Option %%c
)

:: ����״̬
for /l %%i in (1,1,20) do set "opt%%i_status=0"
call :Check_Status

echo.
echo ע�⣺����������Ҫ���������������ȫ��Ч
echo.
pause
goto anquan

:: ��������Ż���״̬�ĺ���
:Check_Status
:: 1.����Defender�ܽ���
sc query "wscsvc" | findstr /i "RUNNING" >nul
if %errorlevel% equ 0 (
    reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" 2>nul | findstr /i "0x4" >nul
    if %errorlevel% equ 0 (set "opt1_status=1" & set "opt1_mark=[+]") else (set "opt1_mark=[-]")
) else (
    set "opt1_status=1" & set "opt1_mark=[+]"
)

:: 2.����LSA����(RunAsPPL)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "RunAsPPL" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt2_status=1" & set "opt2_mark=[+]") else (set "opt2_mark=[-]")

:: 3.����SmartScreenɸѡ��
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt3_status=1" & set "opt3_mark=[+]") else (set "opt3_mark=[-]")

:: 4.����Windows��ȫ���ı���
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Security Health\Platform" /v "Registered" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt4_status=1" & set "opt4_mark=[+]") else (set "opt4_mark=[-]")

:: 5.��������������ֹ�б�
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt5_status=1" & set "opt5_mark=[+]") else (set "opt5_mark=[-]")

:: 6.����Edge�����SmartScreen
reg query "HKEY_CURRENT_USER\Software\Microsoft\Edge" /v "SmartScreenEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt6_status=1" & set "opt6_mark=[+]") else (set "opt6_mark=[-]")

:: 7.�����ļ���Դ������SmartScreen
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" 2>nul | findstr /i "off" >nul
if %errorlevel% equ 0 (set "opt7_status=1" & set "opt7_mark=[+]") else (set "opt7_mark=[-]")

:: 8.����Microsoft StoreӦ��SmartScreen
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt8_status=1" & set "opt8_mark=[+]") else (set "opt8_mark=[-]")

:: 9.���ù�������ٹ���(ASR)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR" /v "ExploitGuard_ASR_Rules" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt9_status=1" & set "opt9_mark=[+]") else (set "opt9_mark=[-]")

:: 10.����UAC(�û��˻�����)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt10_status=1" & set "opt10_mark=[+]") else (set "opt10_mark=[-]")

:: 11.�������⻯��ȫ(VBS)
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (
    bcdedit /enum | findstr /i "hypervisorlaunchtype" | findstr /i "off" >nul
    if %errorlevel% equ 0 (set "opt11_status=1" & set "opt11_mark=[+]") else (set "opt11_mark=[-]")
) else (set "opt11_mark=[-]")

:: 12.����ƾ֤����(Credential Guard)
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\CredentialGuard" /v "Enabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt12_status=1" & set "opt12_mark=[+]") else (set "opt12_mark=[-]")

:: 13.�����ܿ��ļ��з���
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access" /v "EnableControlledFolderAccess" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt13_status=1" & set "opt13_mark=[+]") else (set "opt13_mark=[-]")

:: 14.�������籣��
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" /v "EnableNetworkProtection" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt14_status=1" & set "opt14_mark=[+]") else (set "opt14_mark=[-]")

:: 15.����AMSI
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableAmsi" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt15_status=1" & set "opt15_mark=[+]") else (set "opt15_mark=[-]")

:: 16.���ô���������
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI" /v "Enabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt16_status=1" & set "opt16_mark=[+]") else (set "opt16_mark=[-]")

:: 17.�رշ���ǽ
netsh advfirewall show allprofiles state 2>nul | findstr /i "�ر�" >nul
if %errorlevel% equ 0 (set "opt17_status=1" & set "opt17_mark=[+]") else (set "opt17_mark=[-]")

:: 18.�ر�Ĭ�Ϲ���
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (
    reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" 2>nul | findstr /i "0x0" >nul
    if %errorlevel% equ 0 (set "opt18_status=1" & set "opt18_mark=[+]") else (set "opt18_mark=[-]")
) else (set "opt18_mark=[-]")

:: 19.�ر�Զ��Э��
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt19_status=1" & set "opt19_mark=[+]") else (set "opt19_mark=[-]")

:: 20.���ò���ȫ��������¼
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "AllowInsecureGuestAuth" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt20_status=1" & set "opt20_mark=[+]") else (set "opt20_mark=[-]")
goto :eof

:: �л��Ż�״̬�ĺ���
:Toggle_Option
setlocal
set option=%1

:: 1.����Defender�ܽ���
if %option% equ 1 (
    if %opt1_status% equ 0 (
        echo ���ֶ��ر�Defender��Disable��
        "%~dp0Defender_Control.exe"
        pause
    ) else (
        echo ���ֶ���Defender��Enable��
        "%~dp0Defender_Control.exe"
        pause
    )
    goto :EOF
)

:: 2.����LSA����(RunAsPPL)
if %option% equ 2 (
    if %opt2_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "RunAsPPL" /t REG_DWORD /d 0 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RunAsPPL" /t REG_DWORD /d 0 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RunAsPPLBoot" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���LSA����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "RunAsPPL" /f >nul 2>&1
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RunAsPPL" /t REG_DWORD /d 1 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RunAsPPLBoot" /t REG_DWORD /d 1 /f >nul
        echo [��] ������LSA����
    )
    goto :EOF
)

:: 3.����SmartScreenɸѡ��
if %option% equ 3 (
    if %opt3_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���SmartScreenɸѡ��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /f >nul 2>&1
        echo [��] ������SmartScreenɸѡ��
    )
    goto :EOF
)

:: 4.����Windows��ȫ���ı���
if %option% equ 4 (
    if %opt4_status% equ 0 (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Security Health\Platform" /v "Registered" /t REG_DWORD /d 0 /f >nul
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows Security Health\State" /v "Disabled" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ���Windows��ȫ���ı���
    ) else (
        reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Security Health\Platform" /v "Registered" /f >nul 2>&1
        reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows Security Health\State" /v "Disabled" /f >nul 2>&1
        echo [��] ������Windows��ȫ���ı���
    )
    goto :EOF
)

:: 5.��������������ֹ�б�
if %option% equ 5 (
    if %opt5_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ�������������ֹ�б�
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /t REG_DWORD /d 1 /f >nul
        echo [��] ����������������ֹ�б�
    )
    goto :EOF
)

:: 6.����Edge�����SmartScreen
if %option% equ 6 (
    if %opt6_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Edge" /v "SmartScreenEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���Edge�����SmartScreen
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Edge" /v "SmartScreenEnabled" /t REG_DWORD /d 1 /f >nul
        echo [��] ������Edge�����SmartScreen
    )
    goto :EOF
)

:: 7.�����ļ���Դ������SmartScreen
if %option% equ 7 (
    if %opt7_status% equ 0 (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "off" /f >nul
        echo [��] �ѽ����ļ���Դ������SmartScreen
    ) else (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "on" /f >nul
        echo [��] �������ļ���Դ������SmartScreen
    )
    goto :EOF
)

:: 8.����Microsoft StoreӦ��SmartScreen
if %option% equ 8 (
    if %opt8_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���Microsoft StoreӦ��SmartScreen
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d 1 /f >nul
        echo [��] ������Microsoft StoreӦ��SmartScreen
    )
    goto :EOF
)

:: 9.���ù�������ٹ���(ASR)
if %option% equ 9 (
    if %opt9_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR" /v "ExploitGuard_ASR_Rules" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ù�������ٹ���
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR" /v "ExploitGuard_ASR_Rules" /t REG_DWORD /d 1 /f >nul
        echo [��] �����ù�������ٹ���
    )
    goto :EOF
)

:: 10.����UAC(�û��˻�����)
if %option% equ 10 (
    if %opt10_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���UAC
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 5 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d 1 /f >nul
        echo [��] ������UAC
    )
    goto :EOF
)

:: 11.�������⻯��ȫ(VBS)
if %option% equ 11 (
    if %opt11_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 0 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "HypervisorEnforcedCodeIntegrity" /t REG_DWORD /d 0 /f >nul
        bcdedit /set hypervisorlaunchtype off >nul 2>&1
        echo [��] �ѽ������⻯��ȫ
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 1 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "HypervisorEnforcedCodeIntegrity" /t REG_DWORD /d 1 /f >nul
        bcdedit /set hypervisorlaunchtype auto >nul 2>&1
        echo [��] ���������⻯��ȫ
    )
    goto :EOF
)

:: 12.����ƾ֤����(Credential Guard)
if %option% equ 12 (
    if %opt12_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\CredentialGuard" /v "Enabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���ƾ֤����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\CredentialGuard" /v "Enabled" /t REG_DWORD /d 1 /f >nul
        echo [��] ������ƾ֤����
    )
    goto :EOF
)

:: 13.�����ܿ��ļ��з���
if %option% equ 13 (
    if %opt13_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access" /v "EnableControlledFolderAccess" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ����ܿ��ļ��з���
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access" /v "EnableControlledFolderAccess" /t REG_DWORD /d 1 /f >nul
        echo [��] �������ܿ��ļ��з���
    )
    goto :EOF
)

:: 14.�������籣��
if %option% equ 14 (
    if %opt14_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" /v "EnableNetworkProtection" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ������籣��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" /v "EnableNetworkProtection" /t REG_DWORD /d 1 /f >nul
        echo [��] ���������籣��
    )
    goto :EOF
)

:: 15.����AMSI
if %option% equ 15 (
    if %opt15_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableAmsi" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���AMSI
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableAmsi" /t REG_DWORD /d 1 /f >nul
        echo [��] ������AMSI
    )
    goto :EOF
)

:: 16.���ô���������
if %option% equ 16 (
    if %opt16_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI" /v "Enabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ô���������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI" /v "Enabled" /t REG_DWORD /d 1 /f >nul
        echo [��] �����ô���������
    )
    goto :EOF
)

:: 17.�رշ���ǽ
if %option% equ 17 (
    if %opt17_status% equ 0 (
        netsh advfirewall set allprofiles state off >nul
        echo [��] �ѹرշ���ǽ
    ) else (
        netsh advfirewall set allprofiles state on >nul
        echo [��] �����÷���ǽ
    )
    goto :EOF
)

:: 18.�ر�Ĭ�Ϲ���
if %option% equ 18 (
    if %opt18_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d 0 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѹر�Ĭ�Ϲ���
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d 1 /f >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /t REG_DWORD /d 1 /f >nul
        echo [��] ������Ĭ�Ϲ���
    )
    goto :EOF
)

:: 19.�ر�Զ��Э��
if %option% equ 19 (
    if %opt19_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѹر�Զ��Э��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 1 /f >nul
        echo [��] ������Զ��Э��
    )
    goto :EOF
)

:: 20.���ò���ȫ��������¼
if %option% equ 20 (
    if %opt20_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "AllowInsecureGuestAuth" /t REG_DWORD /d 1 /f >nul
        echo [��] �����ò���ȫ��������¼
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "AllowInsecureGuestAuth" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ò���ȫ��������¼
    )
    goto :EOF
)
endlocal
goto :EOF


::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ��˽����
::-------------------------------------------------------------------------------------------
:yinsi
setlocal enabledelayedexpansion

:: ��ʼ��״̬����
for /l %%i in (1,1,53) do set "opt%%i_status=0"

:: ��������Ż���״̬
call :Check_OPT_Status

:yinsi_menu
cls
echo.===============================================================================
echo.                    ZyperWin++ - ��˽�����Ż�
echo.===============================================================================
echo. ״̬���: [+]���Ż�  [-]δ�Ż�
echo.
echo   [ 1] %opt1_mark% ����ҳ��Ԥ�⹦��
echo   [ 2] %opt2_mark% ���ÿ�ʼ��Ļ����
echo   [ 3] %opt3_mark% ���û�ռ�
echo   [ 4] %opt4_mark% ����Ӧ����������
echo   [ 5] %opt5_mark% ���ù���ʶ��
echo   [ 6] %opt6_mark% ����Ӧ�÷����ļ�ϵͳ
echo   [ 7] %opt7_mark% ����Ӧ�÷����ĵ�
echo   [ 8] %opt8_mark% ����Ӧ�÷�������
echo   [ 9] %opt9_mark% ����Ӧ�÷�����ϵ��
echo   [10] %opt10_mark% ����Ӧ�÷�����Ƶ
echo   [11] %opt11_mark% ������վ���Ը���
echo   [12] %opt12_mark% ����Windows��ӭ����
echo   [13] %opt13_mark% ���÷���Ƶ��
echo   [14] %opt14_mark% ������������ռ�
echo   [15] %opt15_mark% ����д��ϰ�߸���
echo   [16] %opt16_mark% ��������Ӧ�ý���
echo   [17] %opt17_mark% ����Bing�������
echo   [18] %opt18_mark% ����ͨѶ¼�ռ�
echo   [19] %opt19_mark% ���ü����ı��ռ�
echo   [20] %opt20_mark% ����������ʷ
echo   [21] %opt21_mark% ����������Ӧ�ð�װ
echo   [22] %opt22_mark% �����Զ������ȵ�
echo   [23] %opt23_mark% �����������ݸ��Ի�
echo   [24] %opt24_mark% ���ü������
echo   [25] %opt25_mark% ����Ԥ��װӦ��
echo   [26] %opt26_mark% ����.NETң��
echo   [27] %opt27_mark% ����PowerShellң��
echo   [28] %opt28_mark% ����ң�����
echo   [29] %opt29_mark% ���ô��󱨸�(WER)
echo   [30] %opt30_mark% ������������(Cortana)
echo   [31] %opt31_mark% ����λ�÷���
echo   [32] %opt32_mark% �������������ռ�
echo   [33] %opt33_mark% ���ö�����
echo   [34] %opt34_mark% ����Wi-Fi��֪
echo   [35] %opt35_mark% ���ò����¼��
echo   [36] %opt36_mark% ����д�������Ϣ
echo   [37] %opt37_mark% ����Ӧ�÷����˻���Ϣ
echo   [38] %opt38_mark% ����Ӧ�÷����˶�����
echo   [39] %opt39_mark% ����Ӧ�÷��ʵ绰
echo   [40] %opt40_mark% ����Ӧ�÷��������豸
echo   [41] %opt41_mark% ����Ӧ�÷���ͬ��
echo   [42] %opt42_mark% ����Ӧ�÷��������Ϣ
echo   [43] %opt43_mark% ����Ӧ�÷���ͨ����¼
echo   [44] %opt44_mark% ����Ӧ�÷��ʵ����ʼ�
echo   [45] %opt45_mark% ����Ӧ�÷�������
echo   [46] %opt46_mark% ����Ӧ�÷�����Ϣ
echo   [47] %opt47_mark% ���������ջ��־
echo   [48] %opt48_mark% ���ø��½�ѹģ����־
echo   [49] %opt49_mark% ���ô��󱨸���־
echo   [50] %opt50_mark% ���ý��¼�д��ϵͳ��־
echo   [51] %opt51_mark% ���ñ���ʱд�������Ϣ
echo   [52] %opt52_mark% �����˻���¼��־����
echo   [53] %opt53_mark% ����WfpDiag.ETL��־
echo.
echo   [A] Ӧ������δ�Ż�����
echo   [X] ����
echo.
set /p "choices=������ѡ����: 1 3 5 �� A��: "

if "%choices%"=="" goto yinsi
if /i "%choices%"=="X" goto custom_optimize

:: ����ȫѡ��ֻѡδ�Ż����
if /i "%choices%"=="A" (
    set "choices="
    for /l %%i in (1,1,53) do (
        if !opt%%i_status! equ 0 set "choices=!choices! %%i"
    )
    if "!choices!"=="" (
        echo �����Ż�����Ӧ�ã����������
        pause
        goto custom_optimize
    )
)

:: �������ѡ��
for %%c in (%choices%) do (
    call :Toggle_OPT %%c
)

:: ����״̬
for /l %%i in (1,1,53) do set "opt%%i_status=0"
call :Check_OPT_Status

echo.
echo ע�⣺����������Ҫ������Դ������������������ȫ��Ч
echo.
pause
goto yinsi_menu

:: ��������Ż���״̬�ĺ���
:Check_OPT_Status
:: 1.����ҳ��Ԥ�⹦��
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AllowPagePrediction" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt1_status=1" & set "opt1_mark=[+]") else (set "opt1_mark=[-]")

:: 2.���ÿ�ʼ��Ļ����
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt2_status=1" & set "opt2_mark=[+]") else (set "opt2_mark=[-]")

:: 3.���û�ռ�
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt3_status=1" & set "opt3_mark=[+]") else (set "opt3_mark=[-]")

:: 4.����Ӧ����������
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt4_status=1" & set "opt4_mark=[+]") else (set "opt4_mark=[-]")

:: 5.���ù���ʶ��
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt5_status=1" & set "opt5_mark=[+]") else (set "opt5_mark=[-]")

:: 6.����Ӧ�÷����ļ�ϵͳ
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" 2>nul | findstr /i "Deny" >nul
if %errorlevel% equ 0 (set "opt6_status=1" & set "opt6_mark=[+]") else (set "opt6_mark=[-]")

:: 7.����Ӧ�÷����ĵ�
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" 2>nul | findstr /i "Deny" >nul
if %errorlevel% equ 0 (set "opt7_status=1" & set "opt7_mark=[+]") else (set "opt7_mark=[-]")

:: 8.����Ӧ�÷�������
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" 2>nul | findstr /i "Deny" >nul
if %errorlevel% equ 0 (set "opt8_status=1" & set "opt8_mark=[+]") else (set "opt8_mark=[-]")

:: 9.����Ӧ�÷�����ϵ��
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" 2>nul | findstr /i "Deny" >nul
if %errorlevel% equ 0 (set "opt9_status=1" & set "opt9_mark=[+]") else (set "opt9_mark=[-]")

:: 10.����Ӧ�÷�����Ƶ
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" 2>nul | findstr /i "Deny" >nul
if %errorlevel% equ 0 (set "opt10_status=1" & set "opt10_mark=[+]") else (set "opt10_mark=[-]")

:: 11.������վ���Ը���
reg query "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt11_status=1" & set "opt11_mark=[+]") else (set "opt11_mark=[-]")

:: 12.����Windows��ӭ����
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableFirstRunAnimate" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt12_status=1" & set "opt12_mark=[+]") else (set "opt12_mark=[-]")

:: 13.���÷���Ƶ��
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt13_status=1" & set "opt13_mark=[+]") else (set "opt13_mark=[-]")

:: 14.������������ռ�
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt14_status=1" & set "opt14_mark=[+]") else (set "opt14_mark=[-]")

:: 15.����д��ϰ�߸���
reg query "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "Inking&TypingPersonalization" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt15_status=1" & set "opt15_mark=[+]") else (set "opt15_mark=[-]")

:: 16.��������Ӧ�ý���
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt16_status=1" & set "opt16_mark=[+]") else (set "opt16_mark=[-]")

:: 17.����Bing�������
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt17_status=1" & set "opt17_mark=[+]") else (set "opt17_mark=[-]")

:: 18.����ͨѶ¼�ռ�
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" 2>nul | findstr /i "Deny" >nul
if %errorlevel% equ 0 (set "opt18_status=1" & set "opt18_mark=[+]") else (set "opt18_mark=[-]")

:: 19.���ü����ı��ռ�
reg query "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "Inking&TypingPersonalization" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt19_status=1" & set "opt19_mark=[+]") else (set "opt19_mark=[-]")

:: 20.����������ʷ
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt20_status=1" & set "opt20_mark=[+]") else (set "opt20_mark=[-]")

:: 21.����������Ӧ�ð�װ
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt21_status=1" & set "opt21_mark=[+]") else (set "opt21_mark=[-]")

:: 22.�����Զ������ȵ�
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt22_status=1" & set "opt22_mark=[+]") else (set "opt22_mark=[-]")

:: 23.�����������ݸ��Ի�
reg query "HKEY_CURRENT_USER\Software\Microsoft\Personalization\Settings" /v "RestrictImplicitTextCollection" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt23_status=1" & set "opt23_mark=[+]") else (set "opt23_mark=[-]")

:: 24.���ü������
reg query "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "EnableTypingInsights" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt24_status=1" & set "opt24_mark=[+]") else (set "opt24_mark=[-]")

:: 25.����Ԥ��װӦ��
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "DisablePreInstalledApps" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt25_status=1" & set "opt25_mark=[+]") else (set "opt25_mark=[-]")

:: 26.����.NETң��
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DisableNetFrameworkTelemetry" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt26_status=1" & set "opt26_mark=[+]") else (set "opt26_mark=[-]")

:: 27.����PowerShellң��
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell" /v "EnablePowerShellTelemetry" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt27_status=1" & set "opt27_mark=[+]") else (set "opt27_mark=[-]")

:: 28.����ң�����
sc query "DiagTrack" 2>nul | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt28_status=1" & set "opt28_mark=[+]") else (set "opt28_mark=[-]")

:: 29.���ô��󱨸�(WER)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt29_status=1" & set "opt29_mark=[+]") else (set "opt29_mark=[-]")

:: 30.������������(Cortana)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsActivateWithVoice" 2>nul | findstr /i "0x2" >nul
if %errorlevel% equ 0 (set "opt30_status=1" & set "opt30_mark=[+]") else (set "opt30_mark=[-]")

:: 31.����λ�÷���
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt31_status=1" & set "opt31_mark=[+]") else (set "opt31_mark=[-]")

:: 32.�������������ռ�
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt32_status=1" & set "opt32_mark=[+]") else (set "opt32_mark=[-]")

:: 33.���ö�����
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt33_status=1" & set "opt33_mark=[+]") else (set "opt33_mark=[-]")

:: 34.����Wi-Fi��֪
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt34_status=1" & set "opt34_mark=[+]") else (set "opt34_mark=[-]")

:: 35.���ò����¼��
reg query "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\ProblemReports" /v "DisableProblemReports" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt35_status=1" & set "opt35_mark=[+]") else (set "opt35_mark=[-]")

:: 36.����д�������Ϣ
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Debug Print Filter" /v "DEFAULT" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt36_status=1" & set "opt36_mark=[+]") else (set "opt36_mark=[-]")

:: 37.����Ӧ�÷����˻���Ϣ
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" 2>nul | findstr /i "Deny" >nul
if %errorlevel% equ 0 (set "opt37_status=1" & set "opt37_mark=[+]") else (set "opt37_mark=[-]")

:: 38.����Ӧ�÷����˶�����
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" /v "Value" 2>nul | findstr /i "Deny" >nul
if %errorlevel% equ 0 (set "opt38_status=1" & set "opt38_mark=[+]") else (set "opt38_mark=[-]")

:: 39.����Ӧ�÷��ʵ绰
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" 2>nul | findstr /i "Deny" >nul
if %errorlevel% equ 0 (set "opt39_status=1" & set "opt39_mark=[+]") else (set "opt39_mark=[-]")

:: 40.����Ӧ�÷��������豸
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" 2>nul | findstr /i "Deny" >nul
if %errorlevel% equ 0 (set "opt40_status=1" & set "opt40_mark=[+]") else (set "opt40_mark=[-]")

:: 41.����Ӧ�÷���ͬ��
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\sync" /v "Value" 2>nul | findstr /i "Deny" >nul
if %errorlevel% equ 0 (set "opt41_status=1" & set "opt41_mark=[+]") else (set "opt41_mark=[-]")

:: 42.����Ӧ�÷��������Ϣ
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" 2>nul | findstr /i "Deny" >nul
if %errorlevel% equ 0 (set "opt42_status=1" & set "opt42_mark=[+]") else (set "opt42_mark=[-]")

:: 43.����Ӧ�÷���ͨ����¼
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" 2>nul | findstr /i "Deny" >nul
if %errorlevel% equ 0 (set "opt43_status=1" & set "opt43_mark=[+]") else (set "opt43_mark=[-]")

:: 44.����Ӧ�÷��ʵ����ʼ�
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" 2>nul | findstr /i "Deny" >nul
if %errorlevel% equ 0 (set "opt44_status=1" & set "opt44_mark=[+]") else (set "opt44_mark=[-]")

:: 45.����Ӧ�÷�������
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" 2>nul | findstr /i "Deny" >nul
if %errorlevel% equ 0 (set "opt45_status=1" & set "opt45_mark=[+]") else (set "opt45_mark=[-]")

:: 46.����Ӧ�÷�����Ϣ
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chatMessage" /v "Value" 2>nul | findstr /i "Deny" >nul
if %errorlevel% equ 0 (set "opt46_status=1" & set "opt46_mark=[+]") else (set "opt46_mark=[-]")

:: 47.���������ջ��־
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-CBS/Debug" /v "Enabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt47_status=1" & set "opt47_mark=[+]") else (set "opt47_mark=[-]")

:: 48.���ø��½�ѹģ����־
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\Logging" /v "EnableLog" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt48_status=1" & set "opt48_mark=[+]") else (set "opt48_mark=[-]")

:: 49.���ô��󱨸���־
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt49_status=1" & set "opt49_mark=[+]") else (set "opt49_mark=[-]")

:: 50.���ý��¼�д��ϵͳ��־
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Windows" /v "NoEventLog" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt50_status=1" & set "opt50_mark=[+]") else (set "opt50_mark=[-]")

:: 51.���ñ���ʱд�������Ϣ
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "CrashDumpEnabled" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt51_status=1" & set "opt51_mark=[+]") else (set "opt51_mark=[-]")

:: 52.�����˻���¼��־����
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableLogonCacheDisplay" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt52_status=1" & set "opt52_mark=[+]") else (set "opt52_mark=[-]")

:: 53.����WfpDiag.ETL��־
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BFE\Diagnostics" /v "EnableLog" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt53_status=1" & set "opt53_mark=[+]") else (set "opt53_mark=[-]")
goto :eof


:: �л��Ż�״̬�ĺ���
:Toggle_OPT
setlocal
set option=%1

:: 1.����ҳ��Ԥ�⹦��
if %option% equ 1 (
    if %opt1_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AllowPagePrediction" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���ҳ��Ԥ�⹦��
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AllowPagePrediction" /t REG_DWORD /d 1 /f >nul
        echo [��] ������ҳ��Ԥ�⹦��
    )
    goto :EOF
)

:: 2.���ÿ�ʼ��Ļ����
if %option% equ 2 (
    if %opt2_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ÿ�ʼ��Ļ����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 1 /f >nul
        echo [��] �����ÿ�ʼ��Ļ����
    )
    goto :EOF
)

:: 3.���û�ռ�
if %option% equ 3 (
    if %opt3_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��û�ռ�
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 1 /f >nul
        echo [��] �����û�ռ�
    )
    goto :EOF
)

:: 4.����Ӧ����������
if %option% equ 4 (
    if %opt4_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���Ӧ����������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 1 /f >nul
        echo [��] ������Ӧ����������
    )
    goto :EOF
)

:: 5.���ù���ʶ��
if %option% equ 5 (
    if %opt5_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ù���ʶ��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 1 /f >nul
        echo [��] �����ù���ʶ��
    )
    goto :EOF
)

:: 6.����Ӧ�÷����ļ�ϵͳ
if %option% equ 6 (
    if %opt6_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /t REG_SZ /d "Deny" /f >nul
        echo [��] �ѽ���Ӧ�÷����ļ�ϵͳ
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /t REG_SZ /d "Allow" /f >nul
        echo [��] ������Ӧ�÷����ļ�ϵͳ
    )
    goto :EOF
)

:: 7.����Ӧ�÷����ĵ�
if %option% equ 7 (
    if %opt7_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /t REG_SZ /d "Deny" /f >nul
        echo [��] �ѽ���Ӧ�÷����ĵ�
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /t REG_SZ /d "Allow" /f >nul
        echo [��] ������Ӧ�÷����ĵ�
    )
    goto :EOF
)

:: 8.����Ӧ�÷�������
if %option% equ 8 (
    if %opt8_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f >nul
        echo [��] �ѽ���Ӧ�÷�������
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Allow" /f >nul
        echo [��] ������Ӧ�÷�������
    )
    goto :EOF
)

:: 9.����Ӧ�÷�����ϵ��
if %option% equ 9 (
    if %opt9_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f >nul
        echo [��] �ѽ���Ӧ�÷�����ϵ��
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Allow" /f >nul
        echo [��] ������Ӧ�÷�����ϵ��
    )
    goto :EOF
)

:: 10.����Ӧ�÷�����Ƶ
if %option% equ 10 (
    if %opt10_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /t REG_SZ /d "Deny" /f >nul
        echo [��] �ѽ���Ӧ�÷�����Ƶ
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /t REG_SZ /d "Allow" /f >nul
        echo [��] ������Ӧ�÷�����Ƶ
    )
    goto :EOF
)

:: 11.������վ���Ը���
if %option% equ 11 (
    if %opt11_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ�����վ���Ը���
    ) else (
        reg add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 0 /f >nul
        echo [��] ��������վ���Ը���
    )
    goto :EOF
)

:: 12.����Windows��ӭ����
if %option% equ 12 (
    if %opt12_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableFirstRunAnimate" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ���Windows��ӭ����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableFirstRunAnimate" /t REG_DWORD /d 0 /f >nul
        echo [��] ������Windows��ӭ����
    )
    goto :EOF
)

:: 13.���÷���Ƶ��
if %option% equ 13 (
    if %opt13_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ��÷���Ƶ��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 0 /f >nul
        echo [��] �����÷���Ƶ��
    )
    goto :EOF
)

:: 14.������������ռ�
if %option% equ 14 (
    if %opt14_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ�����������ռ�
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 3 /f >nul
        echo [��] ��������������ռ�
    )
    goto :EOF
)

:: 15.����д��ϰ�߸���
if %option% equ 15 (
    if %opt15_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "Inking&TypingPersonalization" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���д��ϰ�߸���
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "Inking&TypingPersonalization" /t REG_DWORD /d 1 /f >nul
        echo [��] ������д��ϰ�߸���
    )
    goto :EOF
)

:: 16.��������Ӧ�ý���
if %option% equ 16 (
    if %opt16_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ�������Ӧ�ý���
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 1 /f >nul
        echo [��] ����������Ӧ�ý���
    )
    goto :EOF
)

:: 17.����Bing�������
if %option% equ 17 (
    if %opt17_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���Bing�������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 1 /f >nul
        echo [��] ������Bing�������
    )
    goto :EOF
)

:: 18.����ͨѶ¼�ռ�
if %option% equ 18 (
    if %opt18_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f >nul
        echo [��] �ѽ���ͨѶ¼�ռ�
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Allow" /f >nul
        echo [��] ������ͨѶ¼�ռ�
    )
    goto :EOF
)

:: 19.���ü����ı��ռ�
if %option% equ 19 (
    if %opt19_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "Inking&TypingPersonalization" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ü����ı��ռ�
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "Inking&TypingPersonalization" /t REG_DWORD /d 1 /f >nul
        echo [��] �����ü����ı��ռ�
    )
    goto :EOF
)

:: 20.����������ʷ
if %option% equ 20 (
    if %opt20_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���������ʷ
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d 1 /f >nul
        echo [��] ������������ʷ
    )
    goto :EOF
)

:: 21.����������Ӧ�ð�װ
if %option% equ 21 (
    if %opt21_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ���������Ӧ�ð�װ
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t REG_DWORD /d 0 /f >nul
        echo [��] ������������Ӧ�ð�װ
    )
    goto :EOF
)

:: 22.�����Զ������ȵ�
if %option% equ 22 (
    if %opt22_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ����Զ������ȵ�
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" /t REG_DWORD /d 0 /f >nul
        echo [��] �������Զ������ȵ�
    )
    goto :EOF
)

:: 23.�����������ݸ��Ի�
if %option% equ 23 (
    if %opt23_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Personalization\Settings" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ����������ݸ��Ի�
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Personalization\Settings" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 0 /f >nul
        echo [��] �������������ݸ��Ի�
    )
    goto :EOF
)

:: 24.���ü������
if %option% equ 24 (
    if %opt24_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "EnableTypingInsights" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ü������
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "EnableTypingInsights" /t REG_DWORD /d 1 /f >nul
        echo [��] �����ü������
    )
    goto :EOF
)

:: 25.����Ԥ��װӦ��
if %option% equ 25 (
    if %opt25_status% equ 0 (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "DisablePreInstalledApps" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ���Ԥ��װӦ��
    ) else (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "DisablePreInstalledApps" /t REG_DWORD /d 0 /f >nul
        echo [��] ������Ԥ��װӦ��
    )
    goto :EOF
)

:: 26.����.NETң��
if %option% equ 26 (
    if %opt26_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DisableNetFrameworkTelemetry" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ���.NETң��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DisableNetFrameworkTelemetry" /t REG_DWORD /d 0 /f >nul
        echo [��] ������.NETң��
    )
    goto :EOF
)

:: 27.����PowerShellң��
if %option% equ 27 (
    if %opt27_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell" /v "EnablePowerShellTelemetry" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���PowerShellң��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell" /v "EnablePowerShellTelemetry" /t REG_DWORD /d 1 /f >nul
        echo [��] ������PowerShellң��
    )
    goto :EOF
)

:: 28.����ң�����
if %option% equ 28 (
    if %opt28_status% equ 0 (
        sc config "DiagTrack" start= disabled >nul
        sc stop "DiagTrack" >nul
        echo [��] �ѽ���ң�����
    ) else (
        sc config "DiagTrack" start= delayed-auto >nul
        sc start "DiagTrack" >nul
        echo [��] ������ң�����
    )
    goto :EOF
)

:: 29.���ô��󱨸�(WER)
if %option% equ 29 (
    if %opt29_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ��ô��󱨸�
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �����ô��󱨸�
    )
    goto :EOF
)

:: 30.������������(Cortana)
if %option% equ 30 (
    if %opt30_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsActivateWithVoice" /t REG_DWORD /d 2 /f >nul
        echo [��] �ѽ�����������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsActivateWithVoice" /t REG_DWORD /d 0 /f >nul
        echo [��] ��������������
    )
    goto :EOF
)

:: 31.����λ�÷���
if %option% equ 31 (
    if %opt31_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ���λ�÷���
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 0 /f >nul
        echo [��] ������λ�÷���
    )
    goto :EOF
)

:: 32.�������������ռ�
if %option% equ 32 (
    if %opt32_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ������������ռ�
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 1 /f >nul
        echo [��] ���������������ռ�
    )
    goto :EOF
)

:: 33.���ö�����
if %option% equ 33 (
    if %opt33_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ö�����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 1 /f >nul
        echo [��] �����ö�����
    )
    goto :EOF
)

:: 34.����Wi-Fi��֪
if %option% equ 34 (
    if %opt34_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ���Wi-Fi��֪
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" /t REG_DWORD /d 0 /f >nul
        echo [��] ������Wi-Fi��֪
    )
    goto :EOF
)

:: 35.���ò����¼��
if %option% equ 35 (
    if %opt35_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\ProblemReports" /v "DisableProblemReports" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ��ò����¼��
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\ProblemReports" /v "DisableProblemReports" /t REG_DWORD /d 0 /f >nul
        echo [��] �����ò����¼��
    )
    goto :EOF
)

:: 36.����д�������Ϣ
if %option% equ 36 (
    if %opt36_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Debug Print Filter" /v "DEFAULT" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���д�������Ϣ
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Debug Print Filter" /v "DEFAULT" /t REG_DWORD /d 0xf /f >nul
        echo [��] ������д�������Ϣ
    )
    goto :EOF
)

:: 37.����Ӧ�÷����˻���Ϣ
if %option% equ 37 (
    if %opt37_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f >nul
        echo [��] �ѽ���Ӧ�÷����˻���Ϣ
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Allow" /f >nul
        echo [��] ������Ӧ�÷����˻���Ϣ
    )
    goto :EOF
)

:: 38.����Ӧ�÷����˶�����
if %option% equ 38 (
    if %opt38_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" /v "Value" /t REG_SZ /d "Deny" /f >nul
        echo [��] �ѽ���Ӧ�÷����˶�����
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" /v "Value" /t REG_SZ /d "Allow" /f >nul
        echo [��] ������Ӧ�÷����˶�����
    )
    goto :EOF
)

:: 39.����Ӧ�÷��ʵ绰
if %option% equ 39 (
    if %opt39_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f >nul
        echo [��] �ѽ���Ӧ�÷��ʵ绰
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Allow" /f >nul
        echo [��] ������Ӧ�÷��ʵ绰
    )
    goto :EOF
)

:: 40.����Ӧ�÷��������豸
if %option% equ 40 (
    if %opt40_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Deny" /f >nul
        echo [��] �ѽ���Ӧ�÷��������豸
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Allow" /f >nul
        echo [��] ������Ӧ�÷��������豸
    )
    goto :EOF
)

:: 41.����Ӧ�÷���ͬ��
if %option% equ 41 (
    if %opt41_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\sync" /v "Value" /t REG_SZ /d "Deny" /f >nul
        echo [��] �ѽ���Ӧ�÷���ͬ��
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\sync" /v "Value" /t REG_SZ /d "Allow" /f >nul
        echo [��] ������Ӧ�÷���ͬ��
    )
    goto :EOF
)

:: 42.����Ӧ�÷��������Ϣ
if %option% equ 42 (
    if %opt42_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f >nul
        echo [��] �ѽ���Ӧ�÷��������Ϣ
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Allow" /f >nul
        echo [��] ������Ӧ�÷��������Ϣ
    )
    goto :EOF
)

:: 43.����Ӧ�÷���ͨ����¼
if %option% equ 43 (
    if %opt43_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f >nul
        echo [��] �ѽ���Ӧ�÷���ͨ����¼
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Allow" /f >nul
        echo [��] ������Ӧ�÷���ͨ����¼
    )
    goto :EOF
)

:: 44.����Ӧ�÷��ʵ����ʼ�
if %option% equ 44 (
    if %opt44_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f >nul
        echo [��] �ѽ���Ӧ�÷��ʵ����ʼ�
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Allow" /f >nul
        echo [��] ������Ӧ�÷��ʵ����ʼ�
    )
    goto :EOF
)

:: 45.����Ӧ�÷�������
if %option% equ 45 (
    if %opt45_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f >nul
        echo [��] �ѽ���Ӧ�÷�������
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Allow" /f >nul
        echo [��] ������Ӧ�÷�������
    )
    goto :EOF
)

:: 46.����Ӧ�÷�����Ϣ
if %option% equ 46 (
    if %opt46_status% equ 0 (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chatMessage" /v "Value" /t REG_SZ /d "Deny" /f >nul
        echo [��] �ѽ���Ӧ�÷�����Ϣ
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chatMessage" /v "Value" /t REG_SZ /d "Allow" /f >nul
        echo [��] ������Ӧ�÷�����Ϣ
    )
    goto :EOF
)

:: 47.���������ջ��־
if %option% equ 47 (
    if %opt47_status% equ 0 (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-CBS/Debug" /v "Enabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��������ջ��־
    ) else (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-CBS/Debug" /v "Enabled" /t REG_DWORD /d 1 /f >nul
        echo [��] �����������ջ��־
    )
    goto :EOF
)

:: 48.���ø��½�ѹģ����־
if %option% equ 48 (
    if %opt48_status% equ 0 (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\Logging" /v "EnableLog" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ø��½�ѹģ����־
    ) else (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\Logging" /v "EnableLog" /t REG_DWORD /d 1 /f >nul
        echo [��] �����ø��½�ѹģ����־
    )
    goto :EOF
)

:: 49.���ô��󱨸���־
if %option% equ 49 (
    if %opt49_status% equ 0 (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ��ô��󱨸���־
    ) else (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �����ô��󱨸���־
    )
    goto :EOF
)

:: 50.���ý��¼�д��ϵͳ��־
if %option% equ 50 (
    if %opt50_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Windows" /v "NoEventLog" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ��ý��¼�д��ϵͳ��־
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Windows" /v "NoEventLog" /t REG_DWORD /d 0 /f >nul
        echo [��] �����ý��¼�д��ϵͳ��־
    )
    goto :EOF
)

:: 51.���ñ���ʱд�������Ϣ
if %option% equ 51 (
    if %opt51_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "CrashDumpEnabled" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ��ñ���ʱд�������Ϣ
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "CrashDumpEnabled" /t REG_DWORD /d 1 /f >nul
        echo [��] �����ñ���ʱд�������Ϣ
    )
    goto :EOF
)

:: 52.�����˻���¼��־����
if %option% equ 52 (
    if %opt52_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableLogonCacheDisplay" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ����˻���¼��־����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableLogonCacheDisplay" /t REG_DWORD /d 0 /f >nul
        echo [��] �������˻���¼��־����
    )
    goto :EOF
)

:: 53.����WfpDiag.ETL��־
if %option% equ 53 (
    if %opt53_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BFE\Diagnostics" /v "EnableLog" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ���WfpDiag.ETL��־
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BFE\Diagnostics" /v "EnableLog" /t REG_DWORD /d 1 /f >nul
        echo [��] ������WfpDiag.ETL��־
    )
    goto :EOF
)

endlocal
goto :EOF



::-------------------------------------------------------------------------------------------
:: ZyperWin++ - �������Ż�
::-------------------------------------------------------------------------------------------
:fuwuxiang
setlocal enabledelayedexpansion

:: ��ʼ��״̬����
for /l %%i in (1,1,19) do set "opt%%i_status=0"

:: ������з���״̬
call :Check_Service_Status

cls
echo.===============================================================================
echo.                    ZyperWin++ - �������Ż�
echo.===============================================================================
echo. ״̬���: [+]�ѽ���  [=]�ֶ�  [-]������
echo.
echo   [ 1] %opt1_mark% SecurityHealthService (��ȫ��������)
echo   [ 2] %opt2_mark% SysMain (SuperFetch����)
echo   [ 3] %opt3_mark% WSearch (Windows��������)
echo   [ 4] %opt4_mark% UsoSvc (Windows���·���)
echo   [ 5] %opt5_mark% TrkWks (�ֲ�ʽ���Ӹ��ٷ���)
echo   [ 6] %opt6_mark% WinDefend (Windows Defender����)
echo   [ 7] %opt7_mark% diagsvc (��Ϸ���)
echo   [ 8] %opt8_mark% DPS (��ϲ��Է���)
echo   [ 9] %opt9_mark% WdiServiceHost (��Ϸ�������)
echo   [10] %opt10_mark% WdiSystemHost (���ϵͳ����)
echo   [11] %opt11_mark% MapsBroker (��ͼ����)
echo   [12] %opt12_mark% iphlpsvc (IP���ַ���)
echo   [13] %opt13_mark% diagnosticshub.standardcollector.service (��������ռ���)
echo   [14] %opt14_mark% SmsRouter (SMS·��������)
echo   [15] %opt15_mark% PcaSvc (�������������)
echo   [16] %opt16_mark% ShellHWDetection (ShellӲ�����)
echo   [17] %opt17_mark% SgrmBroker (ϵͳ��������)
echo   [18] %opt18_mark% Schedule (����ƻ�����)
echo   [19] %opt19_mark% Wecsvc (Windows�¼��ռ�����)
echo.
echo   [A] �������зǱ�Ҫ����
echo   [R] �ָ����з���Ĭ������
echo   [X] ����
echo.
set /p "choices=������ѡ����: 1 3 5 �� A��: "

if "%choices%"=="" goto fuwuxiang
if /i "%choices%"=="X" goto custom_optimize
if /i "%choices%"=="R" goto RESTORE_DEFAULT

:: ����ȫѡ���������зǱ�Ҫ����
if /i "%choices%"=="A" (
    set "choices=1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19"
)

:: �������ѡ��
for %%c in (%choices%) do (
    call :Toggle_Service %%c
)

:: ����״̬
for /l %%i in (1,1,19) do set "opt%%i_status=0"
call :Check_Service_Status

echo.
echo �������Ż������!
echo ע�⣺����������Ҫ����ϵͳ������ȫ��Ч
echo.
pause
goto fuwuxiang

:: ������з���״̬�ĺ���
:Check_Service_Status
:: 1.SecurityHealthService (��ȫ��������)
sc query "SecurityHealthService" | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt20_status=1" & set "opt20_mark=[+]") else (set "opt20_mark=[-]")
goto :eof

:: 2.SysMain (SuperFetch����)
sc query "SysMain" | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt2_status=1" & set "opt2_mark=[+]") else (set "opt2_mark=[-]")

:: 3.WSearch (Windows��������)
sc query "WSearch" | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt3_status=1" & set "opt3_mark=[+]") else (set "opt3_mark=[-]")

:: 4.UsoSvc (Windows���·���)
sc query "UsoSvc" | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt4_status=1" & set "opt4_mark=[+]") else (set "opt4_mark=[-]")

:: 5.TrkWks (�ֲ�ʽ���Ӹ��ٷ���)
sc query "TrkWks" | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt5_status=1" & set "opt5_mark=[+]") else (set "opt5_mark=[-]")

:: 6.WinDefend (Windows Defender����)
sc query "WinDefend" | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt6_status=1" & set "opt6_mark=[+]") else (set "opt6_mark=[-]")

:: 7.diagsvc (��Ϸ���)
sc query "diagsvc" | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt7_status=1" & set "opt7_mark=[+]") else (set "opt7_mark=[-]")

:: 8.DPS (��ϲ��Է���)
sc query "DPS" | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt8_status=1" & set "opt8_mark=[+]") else (set "opt8_mark=[-]")

:: 9.WdiServiceHost (��Ϸ�������)
sc query "WdiServiceHost" | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt9_status=1" & set "opt9_mark=[+]") else (set "opt9_mark=[-]")

:: 10.WdiSystemHost (���ϵͳ����)
sc query "WdiSystemHost" | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt10_status=1" & set "opt10_mark=[+]") else (set "opt10_mark=[-]")

:: 11.MapsBroker (��ͼ����)
sc query "MapsBroker" | findstr /i "DEMAND_START" >nul
if %errorlevel% equ 0 (set "opt11_status=2" & set "opt11_mark=[=]") else (
    sc query "MapsBroker" | findstr /i "STOPPED" >nul
    if %errorlevel% equ 0 (set "opt11_status=1" & set "opt11_mark=[+]") else (set "opt11_mark=[-]")
)

:: 12.iphlpsvc (IP���ַ���)
sc query "iphlpsvc" | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt12_status=1" & set "opt12_mark=[+]") else (set "opt12_mark=[-]")

:: 13.diagnosticshub.standardcollector.service (��������ռ���)
sc query "diagnosticshub.standardcollector.service" | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt13_status=1" & set "opt13_mark=[+]") else (set "opt13_mark=[-]")

:: 14.SmsRouter (SMS·��������)
sc query "SmsRouter" | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt14_status=1" & set "opt14_mark=[+]") else (set "opt14_mark=[-]")

:: 15.PcaSvc (�������������)
sc query "PcaSvc" | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt15_status=1" & set "opt15_mark=[+]") else (set "opt15_mark=[-]")

:: 16.ShellHWDetection (ShellӲ�����)
sc query "ShellHWDetection" | findstr /i "DEMAND_START" >nul
if %errorlevel% equ 0 (set "opt16_status=2" & set "opt16_mark=[=]") else (
    sc query "ShellHWDetection" | findstr /i "STOPPED" >nul
    if %errorlevel% equ 0 (set "opt16_status=1" & set "opt16_mark=[+]") else (set "opt16_mark=[-]")
)

:: 17.SgrmBroker (ϵͳ��������)
sc query "SgrmBroker" | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt17_status=1" & set "opt17_mark=[+]") else (set "opt17_mark=[-]")

:: 18.Schedule (����ƻ�����)
sc query "Schedule" | findstr /i "DEMAND_START" >nul
if %errorlevel% equ 0 (set "opt18_status=2" & set "opt18_mark=[=]") else (
    sc query "Schedule" | findstr /i "STOPPED" >nul
    if %errorlevel% equ 0 (set "opt18_status=1" & set "opt18_mark=[+]") else (set "opt18_mark=[-]")
)

:: 19.Wecsvc (Windows�¼��ռ�����)
sc query "Wecsvc" | findstr /i "STOPPED" >nul
if %errorlevel% equ 0 (set "opt19_status=1" & set "opt19_mark=[+]") else (set "opt19_mark=[-]")

:: �л�����״̬�ĺ���
:Toggle_Service
setlocal
set option=%1

:: 1.SecurityHealthService (��ȫ��������)
if %option% equ 1 (
    if %opt1_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SecurityHealthService" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "SecurityHealthService" >nul 2>&1
        echo [��] �ѽ���: SecurityHealthService ��ȫ��������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SecurityHealthService" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "SecurityHealthService" >nul 2>&1
        echo [��] ������: SecurityHealthService ��ȫ��������
    )
    goto :EOF
)

:: 2.SysMain (SuperFetch����)
if %option% equ 2 (
    if %opt2_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SysMain" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "SysMain" >nul 2>&1
        echo [��] �ѽ���: SysMain SuperFetch����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SysMain" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "SysMain" >nul 2>&1
        echo [��] ������: SysMain SuperFetch����
    )
    goto :EOF
)

:: 3.WSearch (Windows��������)
if %option% equ 3 (
    if %opt3_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WSearch" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WSearch" >nul 2>&1
        echo [��] �ѽ���: WSearch Windows��������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WSearch" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "WSearch" >nul 2>&1
        echo [��] ������: WSearch Windows��������
    )
    goto :EOF
)

:: 4.UsoSvc (Windows���·���)
if %option% equ 4 (
    if %opt4_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "UsoSvc" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "UsoSvc" >nul 2>&1
        echo [��] �ѽ���: UsoSvc Windows���·���
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "UsoSvc" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "UsoSvc" >nul 2>&1
        echo [��] ������: UsoSvc Windows���·���
    )
    goto :EOF
)

:: 5.TrkWks (�ֲ�ʽ���Ӹ��ٷ���)
if %option% equ 5 (
    if %opt5_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "TrkWks" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "TrkWks" >nul 2>&1
        echo [��] �ѽ���: TrkWks �ֲ�ʽ���Ӹ��ٷ���
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "TrkWks" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "TrkWks" >nul 2>&1
        echo [��] ������: TrkWks �ֲ�ʽ���Ӹ��ٷ���
    )
    goto :EOF
)

:: 6.WinDefend (Windows Defender����)
if %option% equ 6 (
    if %opt6_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WinDefend" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WinDefend" >nul 2>&1
        echo [��] �ѽ���: WinDefend Windows Defender����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WinDefend" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "WinDefend" >nul 2>&1
        echo [��] ������: WinDefend Windows Defender����
    )
    goto :EOF
)

:: 7.diagsvc (��Ϸ���)
if %option% equ 7 (
    if %opt7_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "diagsvc" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "diagsvc" >nul 2>&1
        echo [��] �ѽ���: diagsvc ��Ϸ���
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "diagsvc" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "diagsvc" >nul 2>&1
        echo [��] ������: diagsvc ��Ϸ���
    )
    goto :EOF
)

:: 8.DPS (��ϲ��Է���)
if %option% equ 8 (
    if %opt8_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "DPS" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "DPS" >nul 2>&1
        echo [��] �ѽ���: DPS ��ϲ��Է���
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "DPS" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "DPS" >nul 2>&1
        echo [��] ������: DPS ��ϲ��Է���
    )
    goto :EOF
)

:: 9.WdiServiceHost (��Ϸ�������)
if %option% equ 9 (
    if %opt9_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WdiServiceHost" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WdiServiceHost" >nul 2>&1
        echo [��] �ѽ���: WdiServiceHost ��Ϸ�������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WdiServiceHost" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "WdiServiceHost" >nul 2>&1
        echo [��] ������: WdiServiceHost ��Ϸ�������
    )
    goto :EOF
)

:: 10.WdiSystemHost (���ϵͳ����)
if %option% equ 10 (
    if %opt10_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WdiSystemHost" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "WdiSystemHost" >nul 2>&1
        echo [��] �ѽ���: WdiSystemHost ���ϵͳ����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WdiSystemHost" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "WdiSystemHost" >nul 2>&1
        echo [��] ������: WdiSystemHost ���ϵͳ����
    )
    goto :EOF
)

:: 11.MapsBroker (��ͼ����)
if %option% equ 11 (
    if %opt11_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "MapsBroker" start= demand >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "MapsBroker" >nul 2>&1
        echo [��] �������ֶ�: MapsBroker ��ͼ����
    ) else if %opt11_status% equ 1 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "MapsBroker" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "MapsBroker" >nul 2>&1
        echo [��] �������Զ�: MapsBroker ��ͼ����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "MapsBroker" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "MapsBroker" >nul 2>&1
        echo [��] �ѽ���: MapsBroker ��ͼ����
    )
    goto :EOF
)

:: 12.iphlpsvc (IP���ַ���)
if %option% equ 12 (
    if %opt12_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "iphlpsvc" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "iphlpsvc" >nul 2>&1
        echo [��] �ѽ���: iphlpsvc IP���ַ���
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "iphlpsvc" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "iphlpsvc" >nul 2>&1
        echo [��] ������: iphlpsvc IP���ַ���
    )
    goto :EOF
)

:: 13.diagnosticshub.standardcollector.service (��������ռ���)
if %option% equ 13 (
    if %opt13_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "diagnosticshub.standardcollector.service" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "diagnosticshub.standardcollector.service" >nul 2>&1
        echo [��] �ѽ���: diagnosticshub.standardcollector.service ��������ռ���
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "diagnosticshub.standardcollector.service" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "diagnosticshub.standardcollector.service" >nul 2>&1
        echo [��] ������: diagnosticshub.standardcollector.service ��������ռ���
    )
    goto :EOF
)

:: 14.SmsRouter (SMS·��������)
if %option% equ 14 (
    if %opt14_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SmsRouter" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "SmsRouter" >nul 2>&1
        echo [��] �ѽ���: SmsRouter SMS·��������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SmsRouter" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "SmsRouter" >nul 2>&1
        echo [��] ������: SmsRouter SMS·��������
    )
    goto :EOF
)

:: 15.PcaSvc (�������������)
if %option% equ 15 (
    if %opt15_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "PcaSvc" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "PcaSvc" >nul 2>&1
        echo [��] �ѽ���: PcaSvc �������������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "PcaSvc" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "PcaSvc" >nul 2>&1
        echo [��] ������: PcaSvc �������������
    )
    goto :EOF
)

:: 16.ShellHWDetection (ShellӲ�����)
if %option% equ 16 (
    if %opt16_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "ShellHWDetection" start= demand >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "ShellHWDetection" >nul 2>&1
        echo [��] �������ֶ�: ShellHWDetection ShellӲ�����
    ) else if %opt16_status% equ 1 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "ShellHWDetection" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "ShellHWDetection" >nul 2>&1
        echo [��] �������Զ�: ShellHWDetection ShellӲ�����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "ShellHWDetection" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "ShellHWDetection" >nul 2>&1
        echo [��] �ѽ���: ShellHWDetection ShellӲ�����
    )
    goto :EOF
)

:: 17.SgrmBroker (ϵͳ��������)
if %option% equ 17 (
    if %opt17_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SgrmBroker" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "SgrmBroker" >nul 2>&1
        echo [��] �ѽ���: SgrmBroker ϵͳ��������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SgrmBroker" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "SgrmBroker" >nul 2>&1
        echo [��] ������: SgrmBroker ϵͳ��������
    )
    goto :EOF
)

:: 18.Schedule (����ƻ�����)
if %option% equ 18 (
    if %opt18_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "Schedule" start= demand >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "Schedule" >nul 2>&1
        echo [��] �������ֶ�: Schedule ����ƻ�����
    ) else if %opt18_status% equ 1 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "Schedule" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "Schedule" >nul 2>&1
        echo [��] �������Զ�: Schedule ����ƻ�����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "Schedule" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "Schedule" >nul 2>&1
        echo [��] �ѽ���: Schedule ����ƻ�����
    )
    goto :EOF
)

:: 19.Wecsvc (Windows�¼��ռ�����)
if %option% equ 19 (
    if %opt19_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "Wecsvc" start= disabled >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "Wecsvc" >nul 2>&1
        echo [��] �ѽ���: Wecsvc Windows�¼��ռ�����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "Wecsvc" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "Wecsvc" >nul 2>&1
        echo [��] ������: Wecsvc Windows�¼��ռ�����
    )
    goto :EOF
)
endlocal
goto :EOF

:: �ָ����з���Ĭ�����õĺ���
:RESTORE_DEFAULT
echo.
echo ���ڻָ����з���Ĭ������...
echo.

:: �ָ�Ĭ�����ò���������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SysMain" start= auto >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WSearch" start= delayed-auto >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "UsoSvc" start= manual >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "TrkWks" start= auto >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WinDefend" start= auto >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "diagsvc" start= manual >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "DPS" start= auto >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WdiServiceHost" start= manual >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WdiSystemHost" start= manual >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "MapsBroker" start= auto >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "iphlpsvc" start= manual >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "diagnosticshub.standardcollector.service" start= manual >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SmsRouter" start= manual >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "PcaSvc" start= auto >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "ShellHWDetection" start= auto >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SgrmBroker" start= manual >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "Schedule" start= auto >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "Wecsvc" start= manual >nul
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SecurityHealthService" start= auto >nul

:: ����Ӧ���Զ������ķ���
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "SysMain" >nul 2>&1
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "TrkWks" >nul 2>&1
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "WinDefend" >nul 2>&1
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "DPS" >nul 2>&1
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "PcaSvc" >nul 2>&1
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "ShellHWDetection" >nul 2>&1
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "Schedule" >nul 2>&1
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "SecurityHealthService" >nul 2>&1

echo ���з����ѻָ�Ĭ������!
echo.
pause
goto fuwuxiang_menu

::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ��������
::-------------------------------------------------------------------------------------------
:update
setlocal enabledelayedexpansion

:: ��ʼ��״̬����
for /l %%i in (1,1,5) do set "opt%%i_status=0"

:: ��������Ż���״̬
call :Check_OPT_Status

cls
echo.===============================================================================
echo.                    ZyperWin++ - ��������
echo.===============================================================================
echo. ״̬���: [+]���Ż�  [-]δ�Ż�
echo.
echo   [ 1] %opt1_mark% ��ֹWin10/11���д�汾����
echo   [ 2] %opt2_mark% Windows���²������������ɾ������
echo   [ 3] %opt3_mark% ����Windows���� ֹͣ���µ�2999��
echo   [ 4] %opt4_mark% �����Զ������̵�Ӧ��
echo   [ 5] %opt5_mark% �����Զ����µ�ͼ
echo.
echo   [A] Ӧ������δ�Ż�����
echo   [R] ����Windows���·���
echo   [X] ����
echo.
set /p "choices=������ѡ����: 1 3 5 �� A��: "

if "%choices%"=="" goto update
if /i "%choices%"=="X" goto custom_optimize
if /i "%choices%"=="R" goto RESTART_WU_SERVICE

:: ����ȫѡ��ֻѡδ�Ż����
if /i "%choices%"=="A" (
    set "choices="
    for /l %%i in (1,1,5) do (
        if !opt%%i_status! equ 0 set "choices=!choices! %%i"
    )
    if "!choices!"=="" (
        echo �����Ż�����Ӧ�ã����������
        pause
        goto custom_optimize
    )
)

:: �������ѡ��
for %%c in (%choices%) do (
    call :Toggle_OPT %%c
)

:: ����״̬
for /l %%i in (1,1,5) do set "opt%%i_status=0"
call :Check_OPT_Status

echo.
echo ע�⣺����������Ҫ����ϵͳ������ȫ��Ч
echo.
pause
goto update

:: ��������Ż���״̬�ĺ���
:Check_OPT_Status
:: 1.��ֹWin10/11���д�汾����
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableOSUpgrade" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt1_status=1" & set "opt1_mark=[+]") else (set "opt1_mark=[-]")

:: 2.Windows���²������������ɾ������
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" 2>nul | findstr /i "0x1" >nul
if %errorlevel% equ 0 (set "opt2_status=1" & set "opt2_mark=[+]") else (set "opt2_mark=[-]")

:: 3.����Windows���� ֹͣ���µ�2999��
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesExpiryTime" 2>nul | findstr /i "2999" >nul
if %errorlevel% equ 0 (set "opt3_status=1" & set "opt3_mark=[+]") else (set "opt3_mark=[-]")

:: 4.�����Զ������̵�Ӧ��
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore" /v "AutoDownload" 2>nul | findstr /i "0x2" >nul
if %errorlevel% equ 0 (set "opt4_status=1" & set "opt4_mark=[+]") else (set "opt4_mark=[-]")

:: 5.�����Զ����µ�ͼ
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" 2>nul | findstr /i "0x0" >nul
if %errorlevel% equ 0 (set "opt5_status=1" & set "opt5_mark=[+]") else (set "opt5_mark=[-]")
goto :eof

:: �л��Ż�״̬�ĺ���
:Toggle_OPT
setlocal
set option=%1

:: 1.��ֹWin10/11���д�汾����
if %option% equ 1 (
    if %opt1_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableOSUpgrade" /t REG_DWORD /d 1 /f >nul
        echo [��] �ѽ�ֹWin10/11���д�汾����
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableOSUpgrade" /f >nul
        echo [��] ������Win10/11���д�汾����
    )
    goto :EOF
)

:: 2.Windows���²������������ɾ������
if %option% equ 2 (
    if %opt2_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d 1 /f >nul
        echo [��] Windows�����Ѳ������������ɾ������
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /f >nul
        echo [��] Windows�����Ѱ����������ɾ������
    )
    goto :EOF
)

:: 3.����Windows���� ֹͣ���µ�2999��
if %option% equ 3 (
    if %opt3_status% equ 0 (
        :: ��ͣ���£�����ɾ���ؼ�ע����
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesExpiryTime" /t REG_SZ /d "2999-12-01T09:59:52Z" /f >nul
        echo [��] ����ͣ Windows ������ 2999 ��
    ) else (
        :: �ָ����£������ùؼ�ֵ��������ɾ����������
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesExpiryTime" /t REG_SZ /d "" /f >nul
        echo [��] �ѻָ� Windows ����
    )
    goto :EOF
)

:: 4.�����Զ������̵�Ӧ��
if %option% equ 4 (
    if %opt4_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore" /v "AutoDownload" /t REG_DWORD /d 2 /f >nul
        echo [��] �ѽ����Զ������̵�Ӧ��
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore" /v "AutoDownload" /f >nul
        echo [��] �������Զ������̵�Ӧ��
    )
    goto :EOF
)

:: 5.�����Զ����µ�ͼ
if %option% equ 5 (
    if %opt6_status% equ 0 (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d 0 /f >nul
        echo [��] �ѽ����Զ����µ�ͼ
    ) else (
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /f >nul
        echo [��] �������Զ����µ�ͼ
    )
    goto :EOF
)
endlocal
goto :EOF

:RESTART_WU_SERVICE
echo.
echo �������� Windows Update ��ط���...
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "wuauserv" >nul 2>&1
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "CryptSvc" >nul 2>&1
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc stop "BITS" >nul 2>&1
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "BITS" >nul 2>&1
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "CryptSvc" >nul 2>&1
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "wuauserv" >nul 2>&1
echo Windows Update ����������������
echo.
pause
goto update

::-------------------------------------------------------------------------------------------
:: ZyperWin++ - �Ż���ԭ
::-------------------------------------------------------------------------------------------
:recover_optimize

cls
echo.===============================================================================
echo.                          ZyperWin++ - �� �� �� ԭ
echo.===============================================================================
echo.
echo.
echo.  [1]   �����Ż���ԭ
echo.
echo.  [2]   ����Ż���ԭ
echo.
echo.  [3]   �����Ż���ԭ
echo.
echo.  [4]   ϵͳ���»�ԭ
echo.
echo.  [5]   Defender ��ԭ
echo.                           
echo.                           
echo.                             
echo.                           
echo.                             
echo.
echo.  [X]   ��      ��
echo.
echo.===============================================================================
choice /C:12345X /N /M "���������ѡ�� ��"
if errorlevel 6 goto :MainMenu
if errorlevel 5 goto :recover_defender
if errorlevel 4 goto :recover_update
if errorlevel 3 goto :recover_all_optimize
if errorlevel 2 goto :recover_deep_optimize
if errorlevel 1 goto :recover_basic_optimize
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: ZyperWin++ - �����Ż���ԭ
::-------------------------------------------------------------------------------------------
:recover_basic_optimize

cls
echo.===============================================================================
echo.                          ZyperWin++ - �����Ż���ԭ
echo.===============================================================================
echo.
echo.  ���ڻ�ԭ�����Ż�����...
echo.
echo.  ע�⣺�˹��̿�����Ҫ������ʱ�䣬����رմ���
echo.
echo.  ==============================================================================

:: ��ԭDefender����
sc config "wscsvc" start= auto >nul
echo [��] �ѻָ�Defender����Ĭ������

:: ��ԭ������Cortana
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /f >nul 2>&1
echo [��] �ѻָ�������Cortana��ʾ

:: ��ԭ���������ںϲ�
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /f >nul 2>&1
echo [��] �ѻָ����������ںϲ�Ĭ������

:: ��ԭ��Դ��������λ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /f >nul 2>&1
echo [��] �ѻָ���Դ��������λ��Ĭ������

:: ��ԭDLLж������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "AlwaysUnloadDLL" /f >nul 2>&1
echo [��] �ѻָ�DLLж��Ĭ������

:: ��ԭ��ݷ�ʽ����
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /f >nul 2>&1
echo [��] �ѻָ���ݷ�ʽ����Ĭ������

:: ��ԭ�ļ��б�ˢ�²���
reg delete "HKEY_CURRENT_USER\Control Panel\Desktop" /v "ForegroundLockTimeout" /f >nul 2>&1
echo [��] �ѻָ��ļ��б�ˢ��Ĭ�ϲ���

:: ��ԭ��ݷ�ʽ��������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /f >nul 2>&1
echo [��] �ѻָ���ݷ�ʽ����Ĭ������

:: ��ԭ�Զ���������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /f >nul 2>&1
echo [��] �ѻָ��Զ�����Ĭ������

:: ��ԭ�ļ��н�������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /f >nul 2>&1
echo [��] �ѻָ��ļ��н���Ĭ������

:: ��ԭ���ٷ��ʳ����ļ���
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /f >nul 2>&1
echo [��] �ѻָ����ٷ��ʳ����ļ�����ʾ

:: ��ԭ���ٷ�������ļ�
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /f >nul 2>&1
echo [��] �ѻָ����ٷ�������ļ���ʾ

:: ��ԭ����������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /f >nul 2>&1
echo [��] �ѻָ�������Ĭ������

:: ��ԭ������������ť
reg delete "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" /f >nul 2>&1
echo [��] �ѻָ�������������ť��ʾ

:: ��ԭ��Դ��������������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /f >nul 2>&1
echo [��] �ѻָ���Դ������������������

:: ��ԭ�ļ���չ����ʾ
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /f >nul 2>&1
echo [��] �ѻָ��ļ���չ��Ĭ����ʾ����

:: ��ԭ����"�˵���"ͼ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /f >nul 2>&1
echo [��] �ѻָ�����"�˵���"ͼ��Ĭ������

:: ��ԭ����"����վ"ͼ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /f >nul 2>&1
echo [��] �ѻָ�����"����վ"ͼ��Ĭ������

:: ��ԭ�Ҽ��˵���
reg add "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\Compatibility" /ve /t REG_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f >nul
reg add "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" /ve /t REG_SZ /d "{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f >nul
reg add "HKEY_CLASSES_ROOT\Drive\shell\BitLocker" /ve /t REG_SZ /d "����BitLocker..." /f >nul
reg add "HKEY_CLASSES_ROOT\Drive\shell\PortableDeviceMenu" /ve /t REG_SZ /d "��Ϊ��Я�豸��" /f >nul
reg add "HKEY_CLASSES_ROOT\.contact\ShellNew" /ve /t REG_SZ /d "��ϵ��" /f >nul
reg add "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /ve /t REG_SZ /d "" /f >nul
reg add "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{B327765E-D724-4347-8B16-78AE18552FC3}" /ve /t REG_SZ /d "" /f >nul
reg add "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Sharing" /ve /t REG_SZ /d "" /f >nul
reg add "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Offline Files" /ve /t REG_SZ /d "" /f >nul
reg add "HKEY_CLASSES_ROOT\Folder\shell\pintohome" /ve /t REG_SZ /d "�̶������ٷ���" /f >nul
reg add "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\WorkFolders" /ve /t REG_SZ /d "" /f >nul
reg add "HKEY_CLASSES_ROOT\SystemFileAssociations\.3mf\Shell\3D Edit" /ve /t REG_SZ /d "�ڻ�ͼ3D�б༭" /f >nul
reg add "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Library Location" /ve /t REG_SZ /d "" /f >nul
echo [��] �ѻָ������Ҽ��˵���

:: ��ԭ��ʼ�˵�����Ӧ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /f >nul 2>&1
echo [��] �ѻָ���ʼ�˵�����Ӧ����ʾ

:: ��ԭ��ʼ�˵�������Ӧ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /f >nul 2>&1
echo [��] �ѻָ���ʼ�˵�������Ӧ����ʾ

:: ��ԭ���±��Զ�����
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "fWrap" /f >nul 2>&1
echo [��] �ѻָ����±��Զ�����Ĭ������

:: ��ԭ���±�״̬��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "StatusBar" /f >nul 2>&1
echo [��] �ѻָ����±�״̬��Ĭ������

:: ��ԭ����ĵ����
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ClearRecentDocsOnExit" /f >nul 2>&1
echo [��] �ѻָ�����ĵ��������

:: ��ԭWin11�Ҽ��˵�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f >nul 2>&1
echo [��] �ѻָ�Win11Ĭ���Ҽ��˵�

:: ��ԭWin11��Դ������
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}" /f >nul
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{6480100b-5a83-4d1e-9f69-8ae5a88e9a33}" /f >nul
echo [��] �ѻָ�Win11Ĭ����Դ������

echo ����������Դ������...
taskkill /f /im explorer.exe >nul
start explorer.exe >nul
echo ��Դ������������

:: ��ԭ��ʼ�˵�����
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /f >nul 2>&1
echo [��] �ѻָ���ʼ�˵�������ʾ

:: ��ԭӦ���̵����Ӧ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /f >nul 2>&1
echo [��] �ѻָ�Ӧ���̵����Ӧ�ò���

:: ��ԭ�̵�Ӧ���ƹ�
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /f >nul 2>&1
echo [��] �ѻָ��̵�Ӧ���ƹ�

:: ��ԭ�����۽��ƹ�
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /f >nul 2>&1
echo [��] �ѻָ������۽��ƹ�

:: ��ԭ���ɺͽ���
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /f >nul 2>&1
echo [��] �ѻָ�"ʹ��Windowsʱ��ȡ���ɺͽ���"

:: ��ԭ��Ϸ¼�ƹ���
reg delete "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /f >nul 2>&1
echo [��] �ѻָ���Ϸ¼�ƹ���

:: ��ԭС������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /f >nul 2>&1
echo [��] �ѻָ�С��Ĭ������

:: ��ԭ�ػ��ٶ�
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /f >nul 2>&1
echo [��] �ѻָ�Ĭ�Ϲػ��ٶ�

:: ��ԭ����رյȴ�ʱ��
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "ServicesPipeTimeout" /f >nul 2>&1
echo [��] �ѻָ�Ĭ�Ϸ���رյȴ�ʱ��

:: ��ԭ�������������
sc config "PcaSvc" start= auto >nul
sc start "PcaSvc" >nul 2>&1
echo [��] �ѻָ��������������

:: ��ԭ��Ϸ���
sc config "DPS" start= auto >nul
sc start "DPS" >nul 2>&1
echo [��] �ѻָ���Ϸ���

:: ��ԭSysMain
sc config "SysMain" start= auto >nul
sc start "SysMain" >nul 2>&1
echo [��] �ѻָ�SysMain

:: ��ԭWindows Search
sc config "WSearch" start= auto >nul
sc start "WSearch" >nul 2>&1
echo [��] �ѻָ�Windows Search

:: ��ԭ���󱨸�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /f >nul 2>&1
echo [��] �ѻָ����󱨸�

:: ��ԭ�ͻ�������Ƽƻ�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /f >nul 2>&1
echo [��] �ѻָ��ͻ�������Ƽƻ�

:: ��ԭNTFS���Ӹ��ٷ���
sc config "TrkWks" start= auto >nul
sc start "TrkWks" >nul 2>&1
echo [��] �ѻָ�NTFS���Ӹ��ٷ���

:: ��ԭ�Զ�ά���ƻ�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /f >nul 2>&1
echo [��] �ѻָ��Զ�ά���ƻ�

:: ��ԭ��ϵͳ����
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /f >nul 2>&1
echo [��] �ѻָ�ϵͳ����Ĭ������

:: ��ԭϵͳ�ں˷�ҳ
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /f >nul 2>&1
echo [��] �ѻָ�ϵͳ�ں˷�ҳĬ������

:: ��ԭ�ļ�����ϵͳ����
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /f >nul 2>&1
echo [��] �ѻָ��ļ�����ϵͳ����Ĭ������

:: ��ԭWindowsԤ��
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /f >nul 2>&1
echo [��] �ѻָ�WindowsԤ������

:: ��ԭVHD��������
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FsDepends\Parameters" /v "VirtualDiskExpandOnMount" /f >nul 2>&1
echo [��] �ѻָ�VHD����Ĭ������

:: ��ԭϵͳ�Զ�����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /f >nul 2>&1
echo [��] �ѻָ�ϵͳ�Զ����Թ���

:: ��ԭ���̴�����ȴ�ʱ��
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "AutoChkTimeOut" /f >nul 2>&1
echo [��] �ѻָ����̴�����Ĭ�ϵȴ�ʱ��

:: ��ԭ�豸��װϵͳ��ԭ��
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "DisableSystemRestore" /f >nul 2>&1
echo [��] �ѻָ��豸��װϵͳ��ԭ�㴴��

:: ��ԭUSB���̵�Դ����
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v "DisableOnSoftRemove" /f >nul 2>&1
echo [��] �ѻָ�USB���̵�ԴĬ������

:: ��ԭ��������
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /f >nul 2>&1
echo [��] �ѻָ���������Ĭ������

:: ��ԭ����
powercfg /h on >nul
echo [��] �ѻָ����߹���

:: ��ԭ��������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions" /v "MitigationOptions_FontBocking" /f >nul 2>&1
echo [��] �ѻָ�����Ĭ������

:: ��ԭ΢��ƴ���Ƽ���
reg delete "HKEY_CURRENT_USER\Software\Microsoft\InputMethod\Settings\CHS" /v "CloudCandidate" /f >nul 2>&1
echo [��] �ѻָ�΢��ƴ���Ƽ��㹦��

:: ��ԭ���ݴ����Ż�����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /f >nul 2>&1
echo [��] �ѻָ����ݴ����Ż�����

echo.  ========================================
echo �����Ż��ѻ�ԭ! 
echo �������������ʹ���и�����Ч
pause
goto MainMenu


::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ����Ż���ԭ
::-------------------------------------------------------------------------------------------
:recover_deep_optimize

cls
echo.===============================================================================
echo.                          ZyperWin++ - ����Ż���ԭ
echo.===============================================================================
echo.
echo.  ���ڻ�ԭ����Ż�����...
echo.
echo.  ע�⣺�˹��̿�����Ҫ������ʱ�䣬����رմ���
echo.
echo.  ==============================================================================
:: ��ԭDefender����
sc config "wscsvc" start= auto >nul
echo [��] �ѻָ�Defender����Ĭ������

:: ��ԭ������Cortana
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /f >nul 2>&1
echo [��] �ѻָ�������Cortana��ʾ

:: ��ԭ���������ںϲ�
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /f >nul 2>&1
echo [��] �ѻָ����������ںϲ�Ĭ������

:: ��ԭ��Դ��������λ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /f >nul 2>&1
echo [��] �ѻָ���Դ��������λ��Ĭ������

:: ��ԭDLLж������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "AlwaysUnloadDLL" /f >nul 2>&1
echo [��] �ѻָ�DLLж��Ĭ������

:: ��ԭ��ݷ�ʽ����
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /f >nul 2>&1
echo [��] �ѻָ���ݷ�ʽ����Ĭ������

:: ��ԭ�ļ��б�ˢ�²���
reg delete "HKEY_CURRENT_USER\Control Panel\Desktop" /v "ForegroundLockTimeout" /f >nul 2>&1
echo [��] �ѻָ��ļ��б�ˢ��Ĭ�ϲ���

:: ��ԭ��ݷ�ʽ��������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /f >nul 2>&1
echo [��] �ѻָ���ݷ�ʽ����Ĭ������

:: ��ԭ�Զ���������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /f >nul 2>&1
echo [��] �ѻָ��Զ�����Ĭ������

:: ��ԭ�ļ��н�������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /f >nul 2>&1
echo [��] �ѻָ��ļ��н���Ĭ������

:: ��ԭ���ٷ��ʳ����ļ���
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /f >nul 2>&1
echo [��] �ѻָ����ٷ��ʳ����ļ�����ʾ

:: ��ԭ���ٷ�������ļ�
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /f >nul 2>&1
echo [��] �ѻָ����ٷ�������ļ���ʾ

:: ��ԭ����������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /f >nul 2>&1
echo [��] �ѻָ�������Ĭ������

:: ��ԭ������������ť
reg delete "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" /f >nul 2>&1
echo [��] �ѻָ�������������ť��ʾ

:: ��ԭ��Դ��������������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /f >nul 2>&1
echo [��] �ѻָ���Դ������������������

:: ��ԭ�ļ���չ����ʾ
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /f >nul 2>&1
echo [��] �ѻָ��ļ���չ��Ĭ����ʾ����

:: ��ԭ����"�˵���"ͼ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /f >nul 2>&1
echo [��] �ѻָ�����"�˵���"ͼ��Ĭ������

:: ��ԭ����"����վ"ͼ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /f >nul 2>&1
echo [��] �ѻָ�����"����վ"ͼ��Ĭ������

:: ��ԭ�Ҽ��˵���
reg add "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\Compatibility" /ve /t REG_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f >nul
reg add "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" /ve /t REG_SZ /d "{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f >nul
reg add "HKEY_CLASSES_ROOT\Drive\shell\BitLocker" /ve /t REG_SZ /d "����BitLocker..." /f >nul
reg add "HKEY_CLASSES_ROOT\Drive\shell\PortableDeviceMenu" /ve /t REG_SZ /d "��Ϊ��Я�豸��" /f >nul
reg add "HKEY_CLASSES_ROOT\.contact\ShellNew" /ve /t REG_SZ /d "��ϵ��" /f >nul
reg add "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /ve /t REG_SZ /d "" /f >nul
reg add "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{B327765E-D724-4347-8B16-78AE18552FC3}" /ve /t REG_SZ /d "" /f >nul
reg add "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Sharing" /ve /t REG_SZ /d "" /f >nul
reg add "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Offline Files" /ve /t REG_SZ /d "" /f >nul
reg add "HKEY_CLASSES_ROOT\Folder\shell\pintohome" /ve /t REG_SZ /d "�̶������ٷ���" /f >nul
reg add "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\WorkFolders" /ve /t REG_SZ /d "" /f >nul
reg add "HKEY_CLASSES_ROOT\SystemFileAssociations\.3mf\Shell\3D Edit" /ve /t REG_SZ /d "�ڻ�ͼ3D�б༭" /f >nul
reg add "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Library Location" /ve /t REG_SZ /d "" /f >nul
echo [��] �ѻָ������Ҽ��˵���

:: ��ԭ��ʼ�˵�����Ӧ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /f >nul 2>&1
echo [��] �ѻָ���ʼ�˵�����Ӧ����ʾ

:: ��ԭ��ʼ�˵�������Ӧ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /f >nul 2>&1
echo [��] �ѻָ���ʼ�˵�������Ӧ����ʾ

:: ��ԭ���±��Զ�����
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "fWrap" /f >nul 2>&1
echo [��] �ѻָ����±��Զ�����Ĭ������

:: ��ԭ���±�״̬��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "StatusBar" /f >nul 2>&1
echo [��] �ѻָ����±�״̬��Ĭ������

:: ��ԭ����ĵ����
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ClearRecentDocsOnExit" /f >nul 2>&1
echo [��] �ѻָ�����ĵ��������

:: ��ԭWin11�Ҽ��˵�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f >nul 2>&1
echo [��] �ѻָ�Win11Ĭ���Ҽ��˵�

:: ��ԭWin11��Դ������
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}" /f >nul
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{6480100b-5a83-4d1e-9f69-8ae5a88e9a33}" /f >nul
echo [��] �ѻָ�Win11Ĭ����Դ������

echo ����������Դ������...
taskkill /f /im explorer.exe >nul
start explorer.exe >nul
echo ��Դ������������

:: ��ԭ��ʼ�˵�����
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /f >nul 2>&1
echo [��] �ѻָ���ʼ�˵�������ʾ

:: ��ԭӦ���̵����Ӧ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /f >nul 2>&1
echo [��] �ѻָ�Ӧ���̵����Ӧ�ò���

:: ��ԭ�̵�Ӧ���ƹ�
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /f >nul 2>&1
echo [��] �ѻָ��̵�Ӧ���ƹ�

:: ��ԭ�����۽��ƹ�
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /f >nul 2>&1
echo [��] �ѻָ������۽��ƹ�

:: ��ԭ���ɺͽ���
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /f >nul 2>&1
echo [��] �ѻָ�"ʹ��Windowsʱ��ȡ���ɺͽ���"

:: ��ԭ��Ϸ¼�ƹ���
reg delete "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /f >nul 2>&1
echo [��] �ѻָ���Ϸ¼�ƹ���

:: ��ԭС������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /f >nul 2>&1
echo [��] �ѻָ�С��Ĭ������

:: ��ԭ�ػ��ٶ�
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /f >nul 2>&1
echo [��] �ѻָ�Ĭ�Ϲػ��ٶ�

:: ��ԭ����رյȴ�ʱ��
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "ServicesPipeTimeout" /f >nul 2>&1
echo [��] �ѻָ�Ĭ�Ϸ���رյȴ�ʱ��

:: ��ԭ�������������
sc config "PcaSvc" start= auto >nul
sc start "PcaSvc" >nul 2>&1
echo [��] �ѻָ��������������

:: ��ԭ��Ϸ���
sc config "DPS" start= auto >nul
sc start "DPS" >nul 2>&1
echo [��] �ѻָ���Ϸ���

:: ��ԭSysMain
sc config "SysMain" start= auto >nul
sc start "SysMain" >nul 2>&1
echo [��] �ѻָ�SysMain

:: ��ԭWindows Search
sc config "WSearch" start= auto >nul
sc start "WSearch" >nul 2>&1
echo [��] �ѻָ�Windows Search

:: ��ԭ���󱨸�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /f >nul 2>&1
echo [��] �ѻָ����󱨸�

:: ��ԭ�ͻ�������Ƽƻ�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /f >nul 2>&1
echo [��] �ѻָ��ͻ�������Ƽƻ�

:: ��ԭNTFS���Ӹ��ٷ���
sc config "TrkWks" start= auto >nul
sc start "TrkWks" >nul 2>&1
echo [��] �ѻָ�NTFS���Ӹ��ٷ���

:: ��ԭ�Զ�ά���ƻ�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /f >nul 2>&1
echo [��] �ѻָ��Զ�ά���ƻ�

:: ��ԭ��ϵͳ����
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /f >nul 2>&1
echo [��] �ѻָ�ϵͳ����Ĭ������

:: ��ԭϵͳ�ں˷�ҳ
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /f >nul 2>&1
echo [��] �ѻָ�ϵͳ�ں˷�ҳĬ������

:: ��ԭ�ļ�����ϵͳ����
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /f >nul 2>&1
echo [��] �ѻָ��ļ�����ϵͳ����Ĭ������

:: ��ԭWindowsԤ��
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /f >nul 2>&1
echo [��] �ѻָ�WindowsԤ������

:: ��ԭVHD��������
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FsDepends\Parameters" /v "VirtualDiskExpandOnMount" /f >nul 2>&1
echo [��] �ѻָ�VHD����Ĭ������

:: ��ԭϵͳ�Զ�����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /f >nul 2>&1
echo [��] �ѻָ�ϵͳ�Զ����Թ���

:: ��ԭ���̴�����ȴ�ʱ��
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "AutoChkTimeOut" /f >nul 2>&1
echo [��] �ѻָ����̴�����Ĭ�ϵȴ�ʱ��

:: ��ԭ�豸��װϵͳ��ԭ��
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "DisableSystemRestore" /f >nul 2>&1
echo [��] �ѻָ��豸��װϵͳ��ԭ�㴴��

:: ��ԭUSB���̵�Դ����
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v "DisableOnSoftRemove" /f >nul 2>&1
echo [��] �ѻָ�USB���̵�ԴĬ������

:: ��ԭ��������
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /f >nul 2>&1
echo [��] �ѻָ���������Ĭ������

:: ��ԭ����
powercfg /h on >nul
echo [��] �ѻָ����߹���

:: ��ԭ��������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions" /v "MitigationOptions_FontBocking" /f >nul 2>&1
echo [��] �ѻָ�����Ĭ������

:: ��ԭ΢��ƴ���Ƽ���
reg delete "HKEY_CURRENT_USER\Software\Microsoft\InputMethod\Settings\CHS" /v "CloudCandidate" /f >nul 2>&1
echo [��] �ѻָ�΢��ƴ���Ƽ��㹦��

:: ��ԭ���ݴ����Ż�����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /f >nul 2>&1
echo [��] �ѻָ����ݴ����Ż�����

:: ��ԭSmartScreenɸѡ��
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /f >nul 2>&1
echo [��] �ѻָ�SmartScreenɸѡ��

:: ��ԭ��ȫ���ı���
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Security Health\Platform" /v "Registered" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows Security Health\State" /v "Disabled" /f >nul 2>&1
echo [��] �ѻָ�Windows��ȫ���ı���

:: ��ԭEdge�����SmartScreen
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Edge" /v "SmartScreenEnabled" /f >nul 2>&1
echo [��] �ѻָ�Edge�����SmartScreen

:: ��ԭ�ļ���Դ������SmartScreen
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /f >nul 2>&1
echo [��] �ѻָ��ļ���Դ������SmartScreen

:: ��ԭStoreӦ��SmartScreen
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /f >nul 2>&1
echo [��] �ѻָ�Microsoft StoreӦ��SmartScreen

:: ��ԭUAC����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /f >nul 2>&1
echo [��] �ѻָ�UACĬ������

:: ��ԭ����ǽ
netsh advfirewall set allprofiles state on >nul
echo [��] �ѻָ�����ǽ

:: ��ԭĬ�Ϲ���
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /f >nul 2>&1
echo [��] �ѻָ�Ĭ�Ϲ���

:: ��ԭԶ��Э��
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /f >nul 2>&1
echo [��] �ѻָ�Զ��Э��

:: ��ԭӲ������GPU�ƻ�
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /f >nul 2>&1
echo [��] �ѻָ�Ӳ������GPU�ƻ�Ĭ������

:: ��ԭ���������ܺ��ڴ�����
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ16Priority" /f >nul 2>&1
echo [��] �ѻָ����������ܺ��ڴ�Ĭ������

:: ��ԭCortana����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /f >nul 2>&1
echo [��] �ѻָ�CortanaĬ������

:: ��ԭ���ID
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /f >nul 2>&1
echo [��] �ѻָ����ID

:: ��ԭӦ����������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /f >nul 2>&1
echo [��] �ѻָ�Ӧ����������

:: ��ԭ����ҳ����Ϣ��
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /f >nul 2>&1
echo [��] �ѻָ�����ҳ����Ϣ��������

:: ��ԭ�߾����¼���ʱ��
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hpet" /v "Start" /f >nul 2>&1
echo [��] �ѻָ��߾����¼���ʱ��

:: ��ԭGame Bar
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /f >nul 2>&1
echo [��] �ѻָ�Game Bar

:: ��ԭԶ��ע����޸�
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" /v "RemoteRegAccess" /f >nul 2>&1
echo [��] �ѻָ�Զ��ע����޸�Ȩ��

:: ��ԭ�����ռ�
DISM.exe /Online /Set-ReservedStorageState /State:Enabled >nul 2>&1
echo [��] �ѻָ������ռ�

:: ��ԭ�����Ĳ˵��ӳ�
reg delete "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" /f >nul 2>&1
echo [��] �ѻָ������Ĳ˵���ʾ�ӳ�

:: ��ԭ�����Զ�����
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot" /f >nul 2>&1
echo [��] �ѻָ��������Զ�����

:: ��ԭInstaller detection
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /f >nul 2>&1
echo [��] �ѻָ�Installer detection

:: ��ԭ���ܸ��°�ȫ��ʩ
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX" /v "IsConvergedUpdateStackEnabled" /f >nul 2>&1
echo [��] �ѻָ����ܸ��°�ȫ��ʩ

:: ��ԭ�����Ż�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /f >nul 2>&1
echo [��] �ѻָ������Ż�

:: ��ԭ�ͻ�����Ľ��ƻ�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /f >nul 2>&1
echo [��] �ѻָ�΢��ͻ�����Ľ��ƻ�

:: ��ԭң�����
sc config "DiagTrack" start= auto >nul
sc start "DiagTrack" >nul 2>&1
echo [��] �ѻָ�ң�����

:: ��ԭ���󱨸�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /f >nul 2>&1
echo [��] �ѻָ����󱨸�

:: ��ԭ��������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsActivateWithVoice" /f >nul 2>&1
echo [��] �ѻָ���������

:: ��ԭλ�÷���
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /f >nul 2>&1
echo [��] �ѻָ�λ�÷���

:: ��ԭ���������ռ�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /f >nul 2>&1
echo [��] �ѻָ����������ռ�

:: ��ԭ������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /f >nul 2>&1
echo [��] �ѻָ�������

:: ��ԭWi-Fi��֪
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" /f >nul 2>&1
echo [��] �ѻָ�Wi-Fi��֪

:: ��ԭ�����¼��
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\ProblemReports" /v "DisableProblemReports" /f >nul 2>&1
echo [��] �ѻָ������¼��

:: ��ԭд�������Ϣ
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Debug Print Filter" /v "DEFAULT" /f >nul 2>&1
echo [��] �ѻָ�д�������Ϣ

:: ��ԭWindows��ӭ����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableFirstRunAnimate" /f >nul 2>&1
echo [��] �ѻָ�Windows��ӭ����

:: ��ԭ����Ƶ��
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /f >nul 2>&1
echo [��] �ѻָ�����Ƶ��

:: ��ԭ��������ռ�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /f >nul 2>&1
echo [��] �ѻָ���������ռ�

:: ��ԭд��ϰ�߸���
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "Inking&TypingPersonalization" /f >nul 2>&1
echo [��] �ѻָ�д��ϰ�߸���

:: ��ԭ����Ӧ�ý���
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /f >nul 2>&1
echo [��] �ѻָ�����Ӧ�ý���

:: ��ԭBing�������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /f >nul 2>&1
echo [��] �ѻָ�Bing�������

:: ��ԭ������ʷ
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /f >nul 2>&1
echo [��] �ѻָ�������ʷ

:: ��ԭ������Ӧ�ð�װ
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /f >nul 2>&1
echo [��] �ѻָ�������Ӧ�ð�װ

:: ��ԭ�Զ������ȵ�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" /f >nul 2>&1
echo [��] �ѻָ��Զ������ȵ�

:: ��ԭ�������ݸ��Ի�
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Personalization\Settings" /v "RestrictImplicitTextCollection" /f >nul 2>&1
echo [��] �ѻָ��������ݸ��Ի�

:: ��ԭ�������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "EnableTypingInsights" /f >nul 2>&1
echo [��] �ѻָ��������

:: ��ԭԤ��װӦ��
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "DisablePreInstalledApps" /f >nul 2>&1
echo [��] �ѻָ�Ԥ��װӦ��

:: ��ԭ.NETң��
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DisableNetFrameworkTelemetry" /f >nul 2>&1
echo [��] �ѻָ�.NETң��

:: ��ԭPowerShellң��
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell" /v "EnablePowerShellTelemetry" /f >nul 2>&1
echo [��] �ѻָ�PowerShellң��

:: ��ԭ�Զ���װ�Ƽ���Ӧ�ó���
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /f >nul 2>&1
echo [��] �ѻָ��Զ���װ�Ƽ���Ӧ�ó���

:: ��ԭ��汾����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableOSUpgrade" /f >nul 2>&1
echo [��] �ѻָ�Windows��汾����

:: ��ԭ�������ɾ������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /f >nul 2>&1
echo [��] Windows�����ѻָ������������ɾ������

:: ��ԭ�̵�Ӧ���Զ�����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore" /v "AutoDownload" /f >nul 2>&1
echo [��] �ѻָ��Զ������̵�Ӧ��

:: ��ԭ��ͼ�Զ�����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /f >nul 2>&1
echo [��] �ѻָ��Զ����µ�ͼ

:: ��ԭIP���ַ���
sc config "iphlpsvc" start= auto >nul
sc start "iphlpsvc" >nul 2>&1
echo [��] �ѻָ�IP���ַ���

:: ��ԭSMS·��������
sc config "SmsRouter" start= auto >nul
sc start "SmsRouter" >nul 2>&1
echo [��] �ѻָ�SMS·��������

:: ��ԭShellӲ�����
sc config "ShellHWDetection" start= auto >nul
sc start "ShellHWDetection" >nul 2>&1
echo [��] �ѻָ�ShellӲ�����

:: ��ԭ����ƻ�����
sc config "Schedule" start= auto >nul
sc start "Schedule" >nul 2>&1
echo [��] �ѻָ�����ƻ�����

:: ��ԭWindows�¼��ռ�����
sc config "Wecsvc" start= auto >nul
sc start "Wecsvc" >nul 2>&1
echo [��] �ѻָ�Windows�¼��ռ�����

:: ��ԭ��������ռ���
sc config "diagnosticshub.standardcollector.service" start= auto >nul
sc start "diagnosticshub.standardcollector.service" >nul 2>&1
echo [��] �ѻָ���������ռ���

echo.  ========================================
echo ����Ż��ѻ�ԭ! 
echo �������������ʹ���и�����Ч
pause
goto MainMenu


::-------------------------------------------------------------------------------------------
:: ZyperWin++ - �����Ż���ԭ
::-------------------------------------------------------------------------------------------
:recover_all_optimize

cls
echo.===============================================================================
echo.                          ZyperWin++ - �����Ż���ԭ
echo.===============================================================================
echo.
echo.  ���ڻ�ԭ�����Ż�����...
echo.
echo.  ע�⣺�˹��̿�����Ҫ������ʱ�䣬����رմ���
echo.
echo.  ==============================================================================
:: ��ԭDefender����
sc config "wscsvc" start= auto >nul
echo [��] �ѻָ�Defender����Ĭ������

:: ��ԭ������Cortana
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /f >nul 2>&1
echo [��] �ѻָ�������Cortana��ʾ

:: ��ԭ���������ںϲ�
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /f >nul 2>&1
echo [��] �ѻָ����������ںϲ�Ĭ������

:: ��ԭ��Դ��������λ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /f >nul 2>&1
echo [��] �ѻָ���Դ��������λ��Ĭ������

:: ��ԭDLLж������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "AlwaysUnloadDLL" /f >nul 2>&1
echo [��] �ѻָ�DLLж��Ĭ������

:: ��ԭ��ݷ�ʽ����
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /f >nul 2>&1
echo [��] �ѻָ���ݷ�ʽ����Ĭ������

:: ��ԭ�ļ��б�ˢ�²���
reg delete "HKEY_CURRENT_USER\Control Panel\Desktop" /v "ForegroundLockTimeout" /f >nul 2>&1
echo [��] �ѻָ��ļ��б�ˢ��Ĭ�ϲ���

:: ��ԭ��ݷ�ʽ��������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /f >nul 2>&1
echo [��] �ѻָ���ݷ�ʽ����Ĭ������

:: ��ԭ�Զ���������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /f >nul 2>&1
echo [��] �ѻָ��Զ�����Ĭ������

:: ��ԭ�ļ��н�������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /f >nul 2>&1
echo [��] �ѻָ��ļ��н���Ĭ������

:: ��ԭ���ٷ��ʳ����ļ���
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /f >nul 2>&1
echo [��] �ѻָ����ٷ��ʳ����ļ�����ʾ

:: ��ԭ���ٷ�������ļ�
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /f >nul 2>&1
echo [��] �ѻָ����ٷ�������ļ���ʾ

:: ��ԭ����������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /f >nul 2>&1
echo [��] �ѻָ�������Ĭ������

:: ��ԭ������������ť
reg delete "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" /f >nul 2>&1
echo [��] �ѻָ�������������ť��ʾ

:: ��ԭ��Դ��������������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /f >nul 2>&1
echo [��] �ѻָ���Դ������������������

:: ��ԭ�ļ���չ����ʾ
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /f >nul 2>&1
echo [��] �ѻָ��ļ���չ��Ĭ����ʾ����

:: ��ԭ����"�˵���"ͼ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /f >nul 2>&1
echo [��] �ѻָ�����"�˵���"ͼ��Ĭ������

:: ��ԭ����"����վ"ͼ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /f >nul 2>&1
echo [��] �ѻָ�����"����վ"ͼ��Ĭ������

:: ��ԭ�Ҽ��˵���
reg add "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\Compatibility" /ve /t REG_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f >nul
reg add "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" /ve /t REG_SZ /d "{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f >nul
reg add "HKEY_CLASSES_ROOT\Drive\shell\BitLocker" /ve /t REG_SZ /d "����BitLocker..." /f >nul
reg add "HKEY_CLASSES_ROOT\Drive\shell\PortableDeviceMenu" /ve /t REG_SZ /d "��Ϊ��Я�豸��" /f >nul
reg add "HKEY_CLASSES_ROOT\.contact\ShellNew" /ve /t REG_SZ /d "��ϵ��" /f >nul
reg add "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /ve /t REG_SZ /d "" /f >nul
reg add "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{B327765E-D724-4347-8B16-78AE18552FC3}" /ve /t REG_SZ /d "" /f >nul
reg add "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Sharing" /ve /t REG_SZ /d "" /f >nul
reg add "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Offline Files" /ve /t REG_SZ /d "" /f >nul
reg add "HKEY_CLASSES_ROOT\Folder\shell\pintohome" /ve /t REG_SZ /d "�̶������ٷ���" /f >nul
reg add "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\WorkFolders" /ve /t REG_SZ /d "" /f >nul
reg add "HKEY_CLASSES_ROOT\SystemFileAssociations\.3mf\Shell\3D Edit" /ve /t REG_SZ /d "�ڻ�ͼ3D�б༭" /f >nul
reg add "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Library Location" /ve /t REG_SZ /d "" /f >nul
echo [��] �ѻָ������Ҽ��˵���

:: ��ԭ��ʼ�˵�����Ӧ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /f >nul 2>&1
echo [��] �ѻָ���ʼ�˵�����Ӧ����ʾ

:: ��ԭ��ʼ�˵�������Ӧ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /f >nul 2>&1
echo [��] �ѻָ���ʼ�˵�������Ӧ����ʾ

:: ��ԭ���±��Զ�����
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "fWrap" /f >nul 2>&1
echo [��] �ѻָ����±��Զ�����Ĭ������

:: ��ԭ���±�״̬��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "StatusBar" /f >nul 2>&1
echo [��] �ѻָ����±�״̬��Ĭ������

:: ��ԭ����ĵ����
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ClearRecentDocsOnExit" /f >nul 2>&1
echo [��] �ѻָ�����ĵ��������

:: ��ԭWin11�Ҽ��˵�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f >nul 2>&1
echo [��] �ѻָ�Win11Ĭ���Ҽ��˵�

:: ��ԭWin11��Դ������
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{2aa9162e-c906-4dd9-ad0b-3d24a8eef5a0}" /f >nul
reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{6480100b-5a83-4d1e-9f69-8ae5a88e9a33}" /f >nul
echo [��] �ѻָ�Win11Ĭ����Դ������

echo ����������Դ������...
taskkill /f /im explorer.exe >nul
start explorer.exe >nul
echo ��Դ������������

:: ��ԭ��ʼ�˵�����
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /f >nul 2>&1
echo [��] �ѻָ���ʼ�˵�������ʾ

:: ��ԭӦ���̵����Ӧ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /f >nul 2>&1
echo [��] �ѻָ�Ӧ���̵����Ӧ�ò���

:: ��ԭ�̵�Ӧ���ƹ�
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /f >nul 2>&1
echo [��] �ѻָ��̵�Ӧ���ƹ�

:: ��ԭ�����۽��ƹ�
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /f >nul 2>&1
echo [��] �ѻָ������۽��ƹ�

:: ��ԭ���ɺͽ���
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /f >nul 2>&1
echo [��] �ѻָ�"ʹ��Windowsʱ��ȡ���ɺͽ���"

:: ��ԭ��Ϸ¼�ƹ���
reg delete "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /f >nul 2>&1
echo [��] �ѻָ���Ϸ¼�ƹ���

:: ��ԭС������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /f >nul 2>&1
echo [��] �ѻָ�С��Ĭ������

:: ��ԭ�ػ��ٶ�
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /f >nul 2>&1
echo [��] �ѻָ�Ĭ�Ϲػ��ٶ�

:: ��ԭ����رյȴ�ʱ��
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "ServicesPipeTimeout" /f >nul 2>&1
echo [��] �ѻָ�Ĭ�Ϸ���رյȴ�ʱ��

:: ��ԭ�������������
sc config "PcaSvc" start= auto >nul
sc start "PcaSvc" >nul 2>&1
echo [��] �ѻָ��������������

:: ��ԭ��Ϸ���
sc config "DPS" start= auto >nul
sc start "DPS" >nul 2>&1
echo [��] �ѻָ���Ϸ���

:: ��ԭSysMain
sc config "SysMain" start= auto >nul
sc start "SysMain" >nul 2>&1
echo [��] �ѻָ�SysMain

:: ��ԭWindows Search
sc config "WSearch" start= auto >nul
sc start "WSearch" >nul 2>&1
echo [��] �ѻָ�Windows Search

:: ��ԭ���󱨸�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /f >nul 2>&1
echo [��] �ѻָ����󱨸�

:: ��ԭ�ͻ�������Ƽƻ�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /f >nul 2>&1
echo [��] �ѻָ��ͻ�������Ƽƻ�

:: ��ԭNTFS���Ӹ��ٷ���
sc config "TrkWks" start= auto >nul
sc start "TrkWks" >nul 2>&1
echo [��] �ѻָ�NTFS���Ӹ��ٷ���

:: ��ԭ�Զ�ά���ƻ�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /f >nul 2>&1
echo [��] �ѻָ��Զ�ά���ƻ�

:: ��ԭ��ϵͳ����
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /f >nul 2>&1
echo [��] �ѻָ�ϵͳ����Ĭ������

:: ��ԭϵͳ�ں˷�ҳ
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /f >nul 2>&1
echo [��] �ѻָ�ϵͳ�ں˷�ҳĬ������

:: ��ԭ�ļ�����ϵͳ����
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /f >nul 2>&1
echo [��] �ѻָ��ļ�����ϵͳ����Ĭ������

:: ��ԭWindowsԤ��
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /f >nul 2>&1
echo [��] �ѻָ�WindowsԤ������

:: ��ԭVHD��������
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FsDepends\Parameters" /v "VirtualDiskExpandOnMount" /f >nul 2>&1
echo [��] �ѻָ�VHD����Ĭ������

:: ��ԭϵͳ�Զ�����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /f >nul 2>&1
echo [��] �ѻָ�ϵͳ�Զ����Թ���

:: ��ԭ���̴�����ȴ�ʱ��
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "AutoChkTimeOut" /f >nul 2>&1
echo [��] �ѻָ����̴�����Ĭ�ϵȴ�ʱ��

:: ��ԭ�豸��װϵͳ��ԭ��
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "DisableSystemRestore" /f >nul 2>&1
echo [��] �ѻָ��豸��װϵͳ��ԭ�㴴��

:: ��ԭUSB���̵�Դ����
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v "DisableOnSoftRemove" /f >nul 2>&1
echo [��] �ѻָ�USB���̵�ԴĬ������

:: ��ԭ��������
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /f >nul 2>&1
echo [��] �ѻָ���������Ĭ������

:: ��ԭ����
powercfg /h on >nul
echo [��] �ѻָ����߹���

:: ��ԭ��������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions" /v "MitigationOptions_FontBocking" /f >nul 2>&1
echo [��] �ѻָ�����Ĭ������

:: ��ԭ΢��ƴ���Ƽ���
reg delete "HKEY_CURRENT_USER\Software\Microsoft\InputMethod\Settings\CHS" /v "CloudCandidate" /f >nul 2>&1
echo [��] �ѻָ�΢��ƴ���Ƽ��㹦��

:: ��ԭ���ݴ����Ż�����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /f >nul 2>&1
echo [��] �ѻָ����ݴ����Ż�����

:: ��ԭSmartScreenɸѡ��
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /f >nul 2>&1
echo [��] �ѻָ�SmartScreenɸѡ��

:: ��ԭ��ȫ���ı���
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Security Health\Platform" /v "Registered" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows Security Health\State" /v "Disabled" /f >nul 2>&1
echo [��] �ѻָ�Windows��ȫ���ı���

:: ��ԭEdge�����SmartScreen
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Edge" /v "SmartScreenEnabled" /f >nul 2>&1
echo [��] �ѻָ�Edge�����SmartScreen

:: ��ԭ�ļ���Դ������SmartScreen
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /f >nul 2>&1
echo [��] �ѻָ��ļ���Դ������SmartScreen

:: ��ԭStoreӦ��SmartScreen
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /f >nul 2>&1
echo [��] �ѻָ�Microsoft StoreӦ��SmartScreen

:: ��ԭUAC����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /f >nul 2>&1
echo [��] �ѻָ�UACĬ������

:: ��ԭ����ǽ
netsh advfirewall set allprofiles state on >nul
echo [��] �ѻָ�����ǽ

:: ��ԭĬ�Ϲ���
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /f >nul 2>&1
echo [��] �ѻָ�Ĭ�Ϲ���

:: ��ԭԶ��Э��
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /f >nul 2>&1
echo [��] �ѻָ�Զ��Э��

:: ��ԭӲ������GPU�ƻ�
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /f >nul 2>&1
echo [��] �ѻָ�Ӳ������GPU�ƻ�Ĭ������

:: ��ԭ���������ܺ��ڴ�����
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ16Priority" /f >nul 2>&1
echo [��] �ѻָ����������ܺ��ڴ�Ĭ������

:: ��ԭCortana����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /f >nul 2>&1
echo [��] �ѻָ�CortanaĬ������

:: ��ԭ���ID
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /f >nul 2>&1
echo [��] �ѻָ����ID

:: ��ԭӦ����������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /f >nul 2>&1
echo [��] �ѻָ�Ӧ����������

:: ��ԭ����ҳ����Ϣ��
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /f >nul 2>&1
echo [��] �ѻָ�����ҳ����Ϣ��������

:: ��ԭ�߾����¼���ʱ��
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hpet" /v "Start" /f >nul 2>&1
echo [��] �ѻָ��߾����¼���ʱ��

:: ��ԭGame Bar
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /f >nul 2>&1
echo [��] �ѻָ�Game Bar

:: ��ԭԶ��ע����޸�
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" /v "RemoteRegAccess" /f >nul 2>&1
echo [��] �ѻָ�Զ��ע����޸�Ȩ��

:: ��ԭ�����ռ�
DISM.exe /Online /Set-ReservedStorageState /State:Enabled >nul 2>&1
echo [��] �ѻָ������ռ�

:: ��ԭ�����Ĳ˵��ӳ�
reg delete "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" /f >nul 2>&1
echo [��] �ѻָ������Ĳ˵���ʾ�ӳ�

:: ��ԭ�����Զ�����
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot" /f >nul 2>&1
echo [��] �ѻָ��������Զ�����

:: ��ԭInstaller detection
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /f >nul 2>&1
echo [��] �ѻָ�Installer detection

:: ��ԭ���ܸ��°�ȫ��ʩ
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX" /v "IsConvergedUpdateStackEnabled" /f >nul 2>&1
echo [��] �ѻָ����ܸ��°�ȫ��ʩ

:: ��ԭ�����Ż�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /f >nul 2>&1
echo [��] �ѻָ������Ż�

:: ��ԭ�ͻ�����Ľ��ƻ�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /f >nul 2>&1
echo [��] �ѻָ�΢��ͻ�����Ľ��ƻ�

:: ��ԭң�����
sc config "DiagTrack" start= auto >nul
sc start "DiagTrack" >nul 2>&1
echo [��] �ѻָ�ң�����

:: ��ԭ���󱨸�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /f >nul 2>&1
echo [��] �ѻָ����󱨸�

:: ��ԭ��������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsActivateWithVoice" /f >nul 2>&1
echo [��] �ѻָ���������

:: ��ԭλ�÷���
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /f >nul 2>&1
echo [��] �ѻָ�λ�÷���

:: ��ԭ���������ռ�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /f >nul 2>&1
echo [��] �ѻָ����������ռ�

:: ��ԭ������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /f >nul 2>&1
echo [��] �ѻָ�������

:: ��ԭWi-Fi��֪
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" /f >nul 2>&1
echo [��] �ѻָ�Wi-Fi��֪

:: ��ԭ�����¼��
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\ProblemReports" /v "DisableProblemReports" /f >nul 2>&1
echo [��] �ѻָ������¼��

:: ��ԭд�������Ϣ
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Debug Print Filter" /v "DEFAULT" /f >nul 2>&1
echo [��] �ѻָ�д�������Ϣ

:: ��ԭWindows��ӭ����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableFirstRunAnimate" /f >nul 2>&1
echo [��] �ѻָ�Windows��ӭ����

:: ��ԭ����Ƶ��
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /f >nul 2>&1
echo [��] �ѻָ�����Ƶ��

:: ��ԭ��������ռ�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /f >nul 2>&1
echo [��] �ѻָ���������ռ�

:: ��ԭд��ϰ�߸���
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "Inking&TypingPersonalization" /f >nul 2>&1
echo [��] �ѻָ�д��ϰ�߸���

:: ��ԭ����Ӧ�ý���
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /f >nul 2>&1
echo [��] �ѻָ�����Ӧ�ý���

:: ��ԭBing�������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /f >nul 2>&1
echo [��] �ѻָ�Bing�������

:: ��ԭ������ʷ
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /f >nul 2>&1
echo [��] �ѻָ�������ʷ

:: ��ԭ������Ӧ�ð�װ
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /f >nul 2>&1
echo [��] �ѻָ�������Ӧ�ð�װ

:: ��ԭ�Զ������ȵ�
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" /f >nul 2>&1
echo [��] �ѻָ��Զ������ȵ�

:: ��ԭ�������ݸ��Ի�
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Personalization\Settings" /v "RestrictImplicitTextCollection" /f >nul 2>&1
echo [��] �ѻָ��������ݸ��Ի�

:: ��ԭ�������
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "EnableTypingInsights" /f >nul 2>&1
echo [��] �ѻָ��������

:: ��ԭԤ��װӦ��
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "DisablePreInstalledApps" /f >nul 2>&1
echo [��] �ѻָ�Ԥ��װӦ��

:: ��ԭ.NETң��
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DisableNetFrameworkTelemetry" /f >nul 2>&1
echo [��] �ѻָ�.NETң��

:: ��ԭPowerShellң��
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell" /v "EnablePowerShellTelemetry" /f >nul 2>&1
echo [��] �ѻָ�PowerShellң��

:: ��ԭ�Զ���װ�Ƽ���Ӧ�ó���
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /f >nul 2>&1
echo [��] �ѻָ��Զ���װ�Ƽ���Ӧ�ó���

:: ��ԭ��汾����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableOSUpgrade" /f >nul 2>&1
echo [��] �ѻָ�Windows��汾����

:: ��ԭ�������ɾ������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /f >nul 2>&1
echo [��] Windows�����ѻָ������������ɾ������

:: ��ԭ�̵�Ӧ���Զ�����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore" /v "AutoDownload" /f >nul 2>&1
echo [��] �ѻָ��Զ������̵�Ӧ��

:: ��ԭ��ͼ�Զ�����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /f >nul 2>&1
echo [��] �ѻָ��Զ����µ�ͼ

:: ��ԭIP���ַ���
sc config "iphlpsvc" start= auto >nul
sc start "iphlpsvc" >nul 2>&1
echo [��] �ѻָ�IP���ַ���

:: ��ԭSMS·��������
sc config "SmsRouter" start= auto >nul
sc start "SmsRouter" >nul 2>&1
echo [��] �ѻָ�SMS·��������

:: ��ԭShellӲ�����
sc config "ShellHWDetection" start= auto >nul
sc start "ShellHWDetection" >nul 2>&1
echo [��] �ѻָ�ShellӲ�����

:: ��ԭ����ƻ�����
sc config "Schedule" start= auto >nul
sc start "Schedule" >nul 2>&1
echo [��] �ѻָ�����ƻ�����

:: ��ԭWindows�¼��ռ�����
sc config "Wecsvc" start= auto >nul
sc start "Wecsvc" >nul 2>&1
echo [��] �ѻָ�Windows�¼��ռ�����

:: ��ԭ��������ռ���
sc config "diagnosticshub.standardcollector.service" start= auto >nul
sc start "diagnosticshub.standardcollector.service" >nul 2>&1
echo [��] �ѻָ���������ռ���

:: ��ԭLSA����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "RunAsPPL" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RunAsPPL" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RunAsPPLBoot" /f >nul 2>&1
bcdedit /deletevalue hypervisorlaunchtype >nul 2>&1
echo [��] �ѻָ�LSA����

:: ��ԭ����������ֹ�б�
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /f >nul 2>&1
echo [��] �ѻָ�����������ֹ�б�

:: ��ԭ��������ٹ���
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\ASR" /v "ExploitGuard_ASR_Rules" /f >nul 2>&1
echo [��] �ѻָ���������ٹ���

:: ��ԭ���⻯��ȫ
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "HypervisorEnforcedCodeIntegrity" /f >nul 2>&1
bcdedit /set hypervisorlaunchtype auto >nul 2>&1
echo [��] �ѻָ����⻯��ȫ

:: ��ԭƾ֤����
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\CredentialGuard" /v "Enabled" /f >nul 2>&1
echo [��] �ѻָ�ƾ֤����

:: ��ԭ�ܿ��ļ��з���
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access" /v "EnableControlledFolderAccess" /f >nul 2>&1
echo [��] �ѻָ��ܿ��ļ��з���

:: ��ԭ���籣��
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Network Protection" /v "EnableNetworkProtection" /f >nul 2>&1
echo [��] �ѻָ����籣��

:: ��ԭAMSI
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableAmsi" /f >nul 2>&1
echo [��] �ѻָ�AMSI

:: ��ԭ����������
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI" /v "Enabled" /f >nul 2>&1
echo [��] �ѻָ�����������

:: ��ԭ������¼
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "AllowInsecureGuestAuth" /f >nul 2>&1
echo [��] �ѻָ���ȫ������¼

:: ��ԭ������������۶ϲ���
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /f >nul 2>&1
echo [��] �ѻָ�������������۶ϲ���

:: ��ԭExploit Protection
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "MitigationOptions" /f >nul 2>&1
echo [��] �ѻָ�Exploit Protection

:: ��ԭTSX©������
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "DisableTsx" /f >nul 2>&1
echo [��] �ѻָ�TSX©������

:: ��ԭ��������
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /f >nul 2>&1
echo [��] �ѻָ���������Ĭ������

:: ��ԭ��ϲ��Է���
sc config "DPS" start= auto >nul
sc start "DPS" >nul 2>&1
echo [��] �ѻָ���ϲ��Է���

:: ��ԭ�������������
sc config "PcaSvc" start= auto >nul
sc start "PcaSvc" >nul 2>&1
echo [��] �ѻָ��������������

:: ��ԭEdge���������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /f >nul 2>&1
echo [��] �ѻָ�Edge���������Ĭ������

:: ��ԭҳ��Ԥ�⹦��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AllowPagePrediction" /f >nul 2>&1
echo [��] �ѻָ�ҳ��Ԥ�⹦��

:: ��ԭ��ռ�
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /f >nul 2>&1
echo [��] �ѻָ���ռ�

:: ��ԭӦ�÷���Ȩ��
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\sync" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chatMessage" /f >nul 2>&1
echo [��] �ѻָ�����Ӧ�÷���Ȩ��Ĭ������

:: ��ԭ��վ���Ը���
reg delete "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /f >nul 2>&1
echo [��] �ѻָ���վ���Ը���

:: ��ԭͨѶ¼�ռ�
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /f >nul 2>&1
echo [��] �ѻָ�ͨѶ¼�ռ�

:: ��ԭ�����ı��ռ�
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "Inking&TypingPersonalization" /f >nul 2>&1
echo [��] �ѻָ������ı��ռ�

:: ��ԭ��־����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-CBS/Debug" /v "Enabled" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\Logging" /v "EnableLog" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Windows" /v "NoEventLog" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "CrashDumpEnabled" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableLogonCacheDisplay" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BFE\Diagnostics" /v "EnableLog" /f >nul 2>&1
echo [��] �ѻָ�������־Ĭ������

:: ��ԭWindows��������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesExpiryTime" /f >nul 2>&1
echo [��] �ѻָ�Windows����Ĭ������

:: ��ԭ��ȫ��������
sc config "SecurityHealthService" start= auto >nul
sc start "SecurityHealthService" >nul 2>&1
echo [��] �ѻָ���ȫ��������

:: ��ԭWindows���·���
sc config "UsoSvc" start= auto >nul
sc start "UsoSvc" >nul 2>&1
echo [��] �ѻָ�Windows���·���

:: ��ԭWindows Defender����
sc config "WinDefend" start= auto >nul
sc start "WinDefend" >nul 2>&1
echo [��] �ѻָ�Windows Defender����

:: ��ԭ��Ϸ���
sc config "diagsvc" start= auto >nul
sc start "diagsvc" >nul 2>&1
echo [��] �ѻָ���Ϸ���

:: ��ԭϵͳ��������
sc config "SgrmBroker" start= auto >nul
sc start "SgrmBroker" >nul 2>&1
echo [��] �ѻָ�ϵͳ��������

echo.  ========================================
echo �����Ż��ѻ�ԭ! 
echo �������������ʹ���и�����Ч
pause
goto MainMenu

::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ϵͳ���»�ԭ
::-------------------------------------------------------------------------------------------
:recover_update

cls
echo.===============================================================================
echo.                          Windows ���¹�����ȫ�ָ�����
echo.===============================================================================
echo.
echo.  ���ڻָ�Windows���¹���...
echo.
echo.  ע�⣺�˹��̿�����Ҫ������ʱ�䣬����رմ���
echo.
echo.  ==============================================================================

:: 1. �ָ�Windows���·�������
sc config "wuauserv" start= auto >nul
sc config "UsoSvc" start= auto >nul
sc config "BITS" start= auto >nul
sc config "CryptSvc" start= auto >nul
sc config "DcomLaunch" start= auto >nul
sc config "TrustedInstaller" start= auto >nul
net start wuauserv >nul 2>&1
net start UsoSvc >nul 2>&1
net start BITS >nul 2>&1
net start CryptSvc >nul 2>&1
net start TrustedInstaller >nul 2>&1

echo [��] Windows������ط����ѻָ�������

:: 2. �ָ�Windows�������ע�������
:: ɾ��������ͣ����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesExpiryTime" /f >nul 2>&1

:: �ָ��Զ���������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /f >nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v "AUOptions" /t REG_DWORD /d 3 /f >nul

:: �ָ����·���������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "WUServer" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "WUStatusServer" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "UpdateServiceUrlAlternate" /f >nul 2>&1

:: �ָ�����֪ͨ����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "SetDisableUXWUAccess" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWindowsUpdate" /f >nul 2>&1

:: �ָ����������������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /f >nul 2>&1

:: �ָ����ܸ�������
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableOSUpgrade" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX" /v "IsConvergedUpdateStackEnabled" /f >nul 2>&1

:: �ָ������Ż�����
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /f >nul 2>&1

echo [��] Windows����ע��������ѻָ�

:: �����ʾ
echo.
echo.  ==============================================================================
echo   Windows���¹�������ȫ�ָ�!
echo.
echo   �������:
echo   1. ���������ʹ���и�����Ч
echo   2. ��Windows���¼�����״̬
echo   3. �������������Windows�������ѽ��
echo.  ==============================================================================

:: ��Windows��������
echo ���ڴ�Windows��������...
start ms-settings:windowsupdate >nul

pause
goto MainMenu


::-------------------------------------------------------------------------------------------
:: ZyperWin++ - Defender ��ԭ
::-------------------------------------------------------------------------------------------
:recover_defender

cls
echo.===============================================================================
echo.                          ZyperWin++ - Defender ��ԭ
echo.===============================================================================
echo.
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "SecurityHealthService" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "SecurityHealthService" >nul 2>&1
        echo [��] ������: SecurityHealthService ��ȫ��������
"%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc config "WinDefend" start= auto >nul
        "%~dp0NSudoLG.exe" -U:T -P:E -ShowWindowMode:Hide sc start "WinDefend" >nul 2>&1
"%~dp0Defender_Control.exe"
        echo [��] ������: Windows Defender����
        echo [i]���ֶ�����Windows Defender��Enable��

echo.  ========================================
echo Defender ��ԭ�����! 
echo �������������ʹ���и�����Ч
pause
goto MainMenu


::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ��������
::-------------------------------------------------------------------------------------------
:others

cls
echo.===============================================================================
echo.                          ZyperWin++ - �� �� �� ��
echo.===============================================================================
echo.
echo.
echo.  [1]   ��������
echo.
echo.  [2]   Office��װ����������
echo.
echo.  [3]   ϵͳ���������������
echo.
echo.  [4]   Appx��������ʵ���ԣ�
echo.
echo.
echo.                           
echo.                           
echo.                             
echo.                           
echo.                             
echo.
echo.  [X]   ��      ��
echo.
echo.===============================================================================
choice /C:1234X /N /M "���������ѡ�� ��"
if errorlevel 5 goto :MainMenu
if errorlevel 4 goto :AppX_Manager
if errorlevel 3 goto :System_activation
if errorlevel 2 goto :Office_install
if errorlevel 1 goto :Clean
::-------------------------------------------------------------------------------------------


::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ��������
::-------------------------------------------------------------------------------------------
:Clean

cls
echo.===============================================================================
echo.                ZyperWin++ - ��������
echo.===============================================================================
echo.
echo ȷ��Ҫ��������������������������ϵͳ��ԭ��
echo.
choice /C:YN /N /M " [Y]ȷ��  [N]ȡ��  ������ѡ�"
echo.

if errorlevel 2 goto :MainMenu
if errorlevel 1 goto :cleaning

:cleaning
:: ��ʱ�ļ�
del /f /s /q "%SystemDrive%\Windows\Temp\*" >nul 2>&1
del /f /s /q "%SystemRoot%\Temp\*" >nul 2>&1
del /f /s /q "%TEMP%\*" >nul 2>&1
echo [��] ����: ��ʱ�ļ�

:: ����ͼ����
del /f /s /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
echo [��] ����: ����ͼ����

:: Windows Defender�ļ�
del /f /s /q "%ProgramData%\Microsoft\Windows Defender\Scans\*" >nul 2>&1
echo [��] ����: Windows Defender��ʱ�ļ�

:: DirectX��ɫ������
del /f /s /q "%LocalAppData%\Local\D3DSCache\*" >nul 2>&1
echo [��] ����: DirectX��ɫ������

:: �����Ż��ļ�
del /f /s /q "%SystemRoot%\SoftwareDistribution\DeliveryOptimization\*" >nul 2>&1
echo [��] ����: �����Ż��ļ�

:: �������
del /f /s /q "%ProgramData%\Microsoft\Diagnosis\*" >nul 2>&1
echo [��] ����: ������ݲ鿴�����ݿ��ļ�

:: ϵͳ�����ļ�
del /f /s /q "%SystemRoot%\Minidump\*.dmp" >nul 2>&1
del /f /q "%SystemRoot%\memory.dmp" >nul 2>&1
echo [��] ����: ϵͳ�����ļ�

:: Windows����
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\ReportQueue\*" >nul 2>&1
echo [��] ����: Windows�����ļ�

:: Windows���ػ���
del /f /s /q "%SystemRoot%\SoftwareDistribution\Download\*" >nul 2>&1
echo [��] ����: Windows���»���

:: Terminal Server����
del /f /s /q "%LocalAppData%\Microsoft\Terminal Server Client\Cache\*" >nul 2>&1
echo [��] ����: Terminal Server Client����

:: WindowsԤ��ȡ�ļ�
del /f /s /q "%SystemRoot%\Prefetch\*" >nul 2>&1
echo [��] ����: WindowsԤ��ȡ�ļ�

:: WinINet����
del /f /s /q "%LocalAppData%\Microsoft\Windows\INetCache\*" >nul 2>&1
echo [��] ����: WinINet��ҳ����

:: WinINet Cookies
del /f /s /q "%LocalAppData%\Microsoft\Windows\INetCookies\*" >nul 2>&1
echo [��] ����: WinINet Cookies

:: Winsxs��ʱ�ļ�
del /f /s /q "%SystemRoot%\WinSxS\Temp\*" >nul 2>&1
echo [��] ����: Winsxs��ʱ�ļ�

:: Windows��־
del /f /s /q "%SystemRoot%\Logs\*" >nul 2>&1
echo [��] ����: Windows��־�ļ�

:: �ճ���ʱ�ļ�
del /f /s /q "%SystemRoot%\Temp\*" >nul 2>&1
echo [��] ����: Windows�ճ���ʱ�ļ�

:: ����dmp�ļ�
del /f /s /q "%SystemDrive%\*.dmp" >nul 2>&1
echo [��] ����: ϵͳ����dmp�ļ�

:: ����վ
rd /s /q "%SystemDrive%\$Recycle.bin" >nul 2>&1
echo [��] ����: ����վ

:: ʹ��DISM����WinSxS
echo [��] ����: ��ȡ����WinSxS��� (ʹ��DISM)
dism /Online /Cleanup-Image /StartComponentCleanup /ResetBase >nul 2>&1

:: �����𻵵�Appx
echo [��] ����: �𻵵�AppxӦ��
powershell -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Status -eq 'Error'} | Remove-AppxPackage -ErrorAction SilentlyContinue" >nul

:: ����.NET���򼯻���
echo [��] ����: .NET���򼯻���
rd /s /q "%WinDir%\assembly\NativeImages_v4.0.30319_32" >nul 2>&1
rd /s /q "%WinDir%\assembly\NativeImages_v4.0.30319_64" >nul 2>&1

echo.
echo ������������ɣ������������
echo.
pause
goto MainMenu

::-------------------------------------------------------------------------------------------
:: ZyperWin++ - APPX ����
::-------------------------------------------------------------------------------------------
@echo off
setlocal enabledelayedexpansion

:AppX_Manager
cls
echo ===============================================================================
echo                 APPX ��������ʵ���ԣ�
echo ===============================================================================
echo ��ʾ�����г�����ʱѡ������Ҫж�صĳ�����
echo ���磺��Microsoft.Windows.Photos_�汾��_�ܹ�__8wekyb3d8bbwe�����������ճ����س�����ж����
echo ���ڼ���ж�ص�APPX��...
echo.

:: ������ʱ�ļ��洢���б�
set "tempFile=%temp%\appx_list_%random%.tmp"

:: ��ȡ��ж�ص�APPX���б����浽��ʱ�ļ�
powershell -Command "Get-AppxPackage | Where-Object {!$_.IsFramework -and !$_.NonRemovable} | Select-Object PackageFullName | ConvertTo-Csv -NoTypeInformation | Select-Object -Skip 1 | ForEach-Object { $_ -replace '\""', '' }" > "%tempFile%"

:: ��ȡ��ʱ�ļ�����ʾ����ŵİ��б�
set "count=0"
for /f "usebackq tokens=*" %%a in ("%tempFile%") do (
    set /a count+=1
    call echo [%%count%%] %%a
)

if %count% equ 0 (
    echo δ�ҵ���ж�ص�APPX��
    echo.
    del "%tempFile%" 2>nul
    pause
    exit /b
)

echo.
echo ��ֱ������Ҫж�ص���������
echo   [L]�����г�����
echo   [X]�˳�
echo.
set /p "package=���������: "

:: ��������
if "%package%"=="" goto AppX_Manager
if /i "%package%"=="x" (
    del "%tempFile%" 2>nul
    goto MainMenu
)
if /i "%package%"=="l" (
    del "%tempFile%" 2>nul
    goto AppX_Manager
)

:: ��֤�����Ƿ����
findstr /c:"%package%" "%tempFile%" >nul
if errorlevel 1 (
    echo ����δ�ҵ�ƥ��İ�����
    pause
    goto AppX_Manager
)

:: ��ʾȷ����Ϣ
echo.
echo ׼��ж��: %package%
choice /c YN /n /m "ȷ��Ҫж����? (Y/N): "
if %errorlevel% equ 1 (
    echo ����ж��...
    
    powershell -Command "Remove-AppxPackage -Package '%package%'"
    
    if errorlevel 1 (
        echo ж��ʧ�ܣ�������Ҫ����ԱȨ�ޡ�
    ) else (
        echo �ɹ�ж��: %package%
    )
) else (
    echo ȡ��ж�ء�
)

echo.
pause
del "%tempFile%" 2>nul
goto AppX_Manager

::-------------------------------------------------------------------------------------------
:: ZyperWin++ - Office ��װ
::-------------------------------------------------------------------------------------------
:Office_install

cls
echo.===============================================================================
echo.                ZyperWin++ - Office ��װ
echo.===============================================================================
echo.
setlocal enabledelayedexpansion

:: �����û�ѡ�� Office �汾
:choose_version
echo 1. ����Ҫ��װ�ĸ��汾��
echo    1. Office365
echo    2. Office2024
echo    3. Office2021
echo    4. Office2019
echo    X. �������˵�
set /p versionChoice=����������ѡ�� (1/2/3/4/X):

if /i "%versionChoice%"=="X" goto MainMenu
if "%versionChoice%"=="1" set productCode=O365ProPlusRetail& goto choose_arch
if "%versionChoice%"=="2" set productCode=ProPlus2024Retail& goto choose_arch
if "%versionChoice%"=="3" set productCode=ProPlus2021Retail& goto choose_arch
if "%versionChoice%"=="4" set productCode=ProPlus2019Retail& goto choose_arch
echo ��Ч��ѡ�����������롣
goto choose_version

:: �����û�ѡ����ϵ�ṹ
:choose_arch
echo.
echo 2. ����Ҫ��װ�ĸ���ϵ�ṹ��
echo    1. 64λ
echo    2. 32λ
echo    X. �������˵�
set /p archChoice=����������ѡ�� (1/2/X):

if /i "%archChoice%"=="X" goto MainMenu
if "%archChoice%"=="1" set architecture=64 & goto choose_type
if "%archChoice%"=="2" set architecture=32 & goto choose_type
echo ��Ч��ѡ�����������롣
goto choose_arch

:: �����û�ѡ��װ����
:choose_type
echo.
echo 3. ����Ҫ��װ�����滹�ǳ��������ף�
echo    1. ������
echo    2. ����������
echo    X. �������˵�
set /p typeChoice=����������ѡ�� (1/2/X):

if /i "%typeChoice%"=="X" goto MainMenu
if "%typeChoice%"=="1" (
    set excludeApps=
) else if "%typeChoice%"=="2" (
    set "excludeApps=&exclude_apps=%productCode%:Access,Bing,Groove,Lync,Outlook,OneNote,Publisher,Teams"
) else (
    echo ��Ч��ѡ�����������롣
    goto choose_type
)

:: �������յ�ģ��
:build_template
set "template=https://www.coolhub.top/get/?prod_to_add=%productCode%_zh-cn%excludeApps%^&arch=%architecture%"

:: ȷ�ϰ�װ
echo.
set /p confirmInstall=��ȷ��Ҫ������װ��(Y/N/X - X�������˵�):
if /i "%confirmInstall%"=="X" goto MainMenu
if /i not "%confirmInstall%"=="Y" (
    echo ��װ��ȡ����
    pause
    goto MainMenu
)

:: ִ�а�װ����
:execute_install
start powershell.exe -Command "irm '%template%' | iex"
echo ��װ�Ѿ���ʼ�������´�����ִ�С�
pause
goto MainMenu

::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ϵͳ����
::-------------------------------------------------------------------------------------------
:System_activation

cls
echo.===============================================================================
echo.                ZyperWin++ - ϵͳ����
echo.===============================================================================
echo.
echo ���ڵ���MAS����Ե�Ƭ��...
echo.
start %~dp0MAS_AIO_CN.cmd
echo �´����ѵ��ã����ݽ�����ʾ����ϵͳ
echo �����������
echo.
pause
goto MainMenu


::-------------------------------------------------------------------------------------------
:: ZyperWin++ - �������
::-------------------------------------------------------------------------------------------
:about

cls
echo.===============================================================================
echo.                          ZyperWin++ - �������
echo.===============================================================================
echo.
echo.
echo.                             ZyperWin++ v2.2
echo.
echo.              �����ߣ�ZyperWave
echo. 
echo.              ����Bվ��https://space.bilibili.com/1645147838
echo.
echo.              �����Դ��https://github.com/ZyperWave/ZyperWinOptimize
echo.
echo.              �ر��л��ѡ��ZyperWin++����Ż������
echo.
echo.              �����������뼰ʱ��������������Ⱥ��312820776
echo.                             
echo.
echo.                             
echo.
echo.              [X]   ����
echo.
echo.===============================================================================
choice /C:X /N /M "���������ѡ�� ��"
if errorlevel 1 goto :MainMenu
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: �˳� ZyperWin++
::-------------------------------------------------------------------------------------------
:Quit

cls
echo.===============================================================================
echo. 	                      ZyperWin++ - �˳�
echo.===============================================================================
echo.
echo.	��л����ʹ�ã��ټ���
echo.
echo.	�����˳� ZyperWin++ ...
echo.
echo.===============================================================================
echo.
pause>nul|set /p=�밴���������ִ��...

:: �ָ� DOS ���ڴ�С
reg delete "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /f >nul

reg add "HKU\.DEFAULT\Console" /v "FaceName" /t REG_SZ /d "Consolas" /f
reg add "HKU\.DEFAULT\Console" /v "FontFamily" /t REG_DWORD /d "0x36" /f
reg add "HKU\.DEFAULT\Console" /v "FontSize" /t REG_DWORD /d "0x100000" /f
reg add "HKU\.DEFAULT\Console" /v "FontWeight" /t REG_DWORD /d "0x190" /f
reg add "HKU\.DEFAULT\Console" /v "ScreenBufferSize" /t REG_DWORD /d "0x12c0050" /f

color 00
endlocal

exit