@echo off

title ZyperWin++ v1.0

:: ����Ĭ�Ͽ���̨������ǰ��ɫ
color 1f
set ConsoleBackColor=Blue
set ConsoleForeColor=White

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
	reg delete "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /f >nul

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
echo.                           [3]   Office ��װ��64λ��
echo.
echo.
echo.                           [4]   ϵ ͳ �� ��
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
if errorlevel 4 goto :System_activation
if errorlevel 3 goto :Office_install
if errorlevel 2 goto :custom_optimize
if errorlevel 1 goto :quick_optimize
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: ZyperWin++ - �����Ż�
::-------------------------------------------------------------------------------------------
:quick_optimize

cls
echo.===============================================================================
echo.                          ZyperWin++ - �����Ż�
echo.===============================================================================
echo.
echo.  ����ִ��ȫ��ϵͳ�Ż�...
echo.
echo.  ע�⣺�˹��̿��ܴ˹��̿�����Ҫ������ʱ�䣬����رմ���
echo.
echo.  ==============================================================================
echo.
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f >nul
echo [��] ������������Cortana
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d 1 /f >nul
echo [��] ���������������ںϲ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f >nul
echo [��] ��Դ��������ʱ��ʾ"�˵���"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "AlwaysUnloadDLL" /t REG_DWORD /d 1 /f >nul
echo [��] �����ô��ڴ�ж������DLL
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ø����𻵵Ŀ�ݷ�ʽ
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_DWORD /d 0 /f >nul
echo [��] ���Ż�Windows�ļ��б�ˢ�²���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /t REG_BINARY /d 00000000 /f >nul
echo [��] ������ݷ�ʽʱ�����"��ݷ�ʽ"����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d 255 /f >nul
echo [��] �ѽ����Զ�����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d 1 /f >nul
echo [��] ���ڵ��������д��ļ��д���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 0 /f >nul
echo [��] ���ٷ��ʲ�����ʾ�����ļ���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 0 /f >nul
echo [��] ���ٷ��ʲ�����ʾ���ʹ���ļ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /t REG_DWORD /d 3 /f >nul
echo [��] �����������ص�������
reg add "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" /t REG_DWORD /d 0 /f >nul
echo [��] �������������ϵİ�����ť
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /t REG_DWORD /d 1 /f >nul
echo [��] ��Դ����������ʱ���Զ�����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f >nul
echo [��] ����ʾ��֪�ļ����͵���չ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f >nul
echo [��] ��������ʾ"�˵���"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0 /f >nul
echo [��] ��������ʾ"����վ"
reg delete "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
echo [��] �ѽ��ÿ�ִ���ļ���"���������ѽ��"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" /f >nul 2>&1
echo [��] �ѽ����ļ�/�ļ��е�"ʹ��Windows Defenderɨ��"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Drive\shell\BitLocker" /f >nul 2>&1
echo [��] �ѽ��ô��̵�"����Bitlocker"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Drive\shell\PortableDeviceMenu" /f >nul 2>&1
echo [��] �ѽ��ô��̵�"��Ϊ��Я�豸��"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\.contact\ShellNew" /f >nul 2>&1
echo [��] �ѽ����½���"��ϵ��"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
echo [��] �ѽ����ļ�/���̵�"��ԭ��ǰ�汾"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{B327765E-D724-4347-8B16-78AE18552FC3}" /f >nul 2>&1
echo [��] �ѽ��ô��̵�"��¼������"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Sharing" /f >nul 2>&1
echo [��] �ѽ���"�������Ȩ��"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Offline Files" /f >nul 2>&1
echo [��] �ѽ����ļ�/�ļ��е�"ʼ���ѻ�����"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shell\pintohome" /f >nul 2>&1
echo [��] �ѽ����ļ��е�"�̶������ٷ���"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\WorkFolders" /f >nul 2>&1
echo [��] �ѽ���"�����ļ���"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.3mf\Shell\3D Edit" /f >nul 2>&1
echo [��] �ѽ����ļ���"��ͼ3D"�Ҽ��˵�
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Library Location" /f >nul 2>&1
echo [��] �ѽ����ļ��е�"����������"�Ҽ��˵�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ÿ�ʼ�˵�App�б�-��õ�Ӧ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ÿ�ʼ�˵�App�б�-�����ӵ�Ӧ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "fWrap" /t REG_DWORD /d 1 /f >nul
echo [��] ���±��������Զ�����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "StatusBar" /t REG_DWORD /d 1 /f >nul
echo [��] ���±�������״̬����ʾ
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ClearRecentDocsOnExit" /t REG_DWORD /d 1 /f >nul
echo [��] �������˳�ϵͳʱ�������򿪵��ĵ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �������ڿ�ʼ�˵���ʾ����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] ��Ҫ��Ӧ���̵��в��ҹ���Ӧ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ر��̵�Ӧ���ƹ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ر�����ʱ��Windows�۽��ƹ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ر�"ʹ��Windowsʱ��ȡ���ɺͽ���"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d 2 /f >nul
echo [��] ��ֹ�Զ���װ�Ƽ���Ӧ�ó���
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ر���Ϸ¼�ƹ���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �رն����С��
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "1000" /f >nul
echo [��] �ӿ�ػ��ٶ�
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "ServicesPipeTimeout" /t REG_DWORD /d 2000 /f >nul
echo [��] ���̹رշ���ȴ�ʱ��
sc config "PcaSvc" start= disabled >nul
sc stop "PcaSvc" >nul
echo [��] ���ó������������
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" /v "RemoteRegAccess" /t REG_DWORD /d 0 /f >nul
echo [��] ����Զ���޸�ע���
sc config "DPS" start= disabled >nul
sc stop "DPS" >nul
echo [��] ������Ϸ���
sc config "SysMain" start= disabled >nul
sc stop "SysMain" >nul
echo [��] ����SysMain
sc config "WSearch" start= disabled >nul
sc stop "WSearch" >nul
echo [��] ����Windows Search
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f >nul
echo [��] ���ô��󱨸�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f >nul
echo [��] ���ÿͻ�������Ƽƻ�
sc config "TrkWks" start= disabled >nul
sc stop "TrkWks" >nul
echo [��] ����NTFS���Ӹ��ٷ���
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d 1 /f >nul
echo [��] ��ֹ�Զ�ά���ƻ�
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v "RefsDisableUpgrade" /t REG_DWORD /d 1 /f >nul
echo [��] ��Ҫ�Զ�����ReFS�ļ�ϵͳ�汾
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d 1 /f >nul
echo [��] ͻ��260���ַ���·����������
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d 1 /f >nul
echo [��] ��ֹNTFS�����ļ�����ʱ��
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsAllowExtendedCharacterIn8dot3Name" /t REG_DWORD /d 1 /f >nul
echo [��] ����NTFS�ڶ��ļ�����ʹ����չ�ַ���
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsMftZoneReservation" /t REG_DWORD /d 4 /f >nul
echo [��] ��NTFS���ļ���ı����ռ�����Ϊ200MB
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot" /t REG_DWORD /d 0 /f >nul
echo [��] NTFS������ʱ�������ɴ�����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "NoVolumeTrack" /t REG_DWORD /d 1 /f >nul
echo [��] ����NTFS�������ʾ
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f >nul
echo [��] ���ô�ϵͳ�������������
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul
echo [��] ��ֹϵͳ�ں������������ҳ��Ӳ��
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d 4194304 /f >nul
echo [��] ���ļ�����ϵͳ����������256MB
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 0 /f >nul
echo [��] �ر�WindowsԤ������
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 3 /f >nul
echo [��] ���ô�������������۶ϲ������������
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FsDepends\Parameters" /v "VirtualDiskExpandOnMount" /t REG_DWORD /d 4 /f >nul
echo [��] VHD����ʱ��ʡ���̿ռ�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t REG_DWORD /d 0 /f >nul
echo [��] �ر�ϵͳ�Զ����Թ���
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "AutoChkTimeOut" /t REG_DWORD /d 5 /f >nul
echo [��] �����̴�����ȴ�ʱ�����̵�����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "DisableSystemRestore" /t REG_DWORD /d 1 /f >nul
echo [��] �豸��װ��ֹ����ϵͳ��ԭ��
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v "DisableOnSoftRemove" /t REG_DWORD /d 0 /f >nul
echo [��] ����USB���̺󳹵׶Ͽ���Դ
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �رտ�������
powercfg /hibernate off
echo [��] �ر�����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions" /v "MitigationOptions_FontBocking" /t REG_SZ /d "10000000000000000000000000000000" /f >nul
echo [��] ��������������������
reg add "HKEY_CURRENT_USER\Software\Microsoft\InputMethod\Settings\CHS" /v "CloudCandidate" /t REG_DWORD /d 0 /f >nul
echo [��] ΢��ƴ�����뷨�ر��Ƽ���
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableOSUpgrade" /t REG_DWORD /d 1 /f >nul
echo [��] ��ֹWin10/11���д�汾����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d 1 /f >nul
echo [��] Windows���²������������ɾ������
sc config "wuauserv" start= disabled >nul
sc stop "wuauserv" >nul
echo [��] ����Windows����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d 0 /f >nul
echo [��] �������ݴ����Ż�����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX" /v "IsConvergedUpdateStackEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] ���ù��ܸ��°�ȫ��ʩ
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot" /t REG_DWORD /d 0 /f >nul
echo [��] �����������Զ�����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /t REG_DWORD /d 0 /f >nul
echo [��] ����Installer detection
sc config "ATMFD" start= disabled >nul
sc stop "ATMFD" >nul
echo [��] ����Adobe Type Manager��������
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ReserveManager" /v "ShippedWithReserves" /t REG_DWORD /d 0 /f >nul
echo [��] ���ñ����ռ�
DISM.exe /Online /Set-ReservedStorageState /State:Disabled >nul 2>&1
echo [��] ����Ӳ������GPU�ƻ�
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ16Priority" /t REG_DWORD /d 2 /f >nul
echo [��] �Ż����������ܺ��ڴ�����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul
echo [��] ����Cortana���ܣ�����CPUռ��
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "MitigationOptions" /t REG_BINARY /d 22222200000200000002000000000000 /f >nul
echo [��] �ر�Exploit Protection
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d 1 /f >nul
echo [��] �رչ��ID
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f >nul
echo [��] �ر�Ӧ����������
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1 /f >nul
echo [��] ȥ������ҳ����Ϣ��������
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "FlightSettingsMaxPauseDays" /t REG_SZ /d "7152" /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseFeatureUpdatesStartTime" /t REG_SZ /d "2024-01-01T10:00:52Z" /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseFeatureUpdatesEndTime" /t REG_SZ /d "2999-12-01T09:59:52Z" /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseQualityUpdatesStartTime" /t REG_SZ /d "2024-01-01T10:00:52Z" /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseQualityUpdatesEndTime" /t REG_SZ /d "2999-12-01T09:59:52Z" /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesStartTime" /t REG_SZ /d "2024-01-01T09:59:52Z" /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesExpiryTime" /t REG_SZ /d "2999-12-01T09:59:52Z" /f >nul
echo [��] ֹͣ���µ�2999��
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "DisableTsx" /t REG_DWORD /d 1 /f >nul
echo [��] �ر�TSX©������
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_SZ /d "ffffffff" /f >nul
echo [��] �Ż���������
sc config "DPS" start= disabled >nul
sc stop "DPS" >nul
echo [��] �ر���ϲ��Է���
sc config "PcaSvc" start= disabled >nul
sc stop "PcaSvc" >nul
echo [��] �رճ������������
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f >nul
echo [��] �ر�΢��ͻ�����Ľ��ƻ�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d 0 /f >nul
echo [��] ���ý����Ż�
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hpet" /v "Start" /t REG_DWORD /d 4 /f >nul
echo [��] ���ø߾����¼���ʱ��(HPET)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] ����Game Bar
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore" /v "AutoDownload" /t REG_DWORD /d 2 /f >nul
echo [��] �����Զ������̵�Ӧ��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d 0 /f >nul
echo [��] �����Զ����µ�ͼ
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 1 /f >nul
echo [��] ����Windows����
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >nul
echo [��] ���������Ĳ˵���ʾ�ӳ�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HideFirstRunExperience" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���"�״�����"��ӭҳ��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "RunAllFlashInAllowMode" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�Adobe Flash���㼴��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�ֹEdge�رպ�������к�̨Ӧ��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AdsSettingForIntrusiveAdsSites" /t REG_DWORD /d 2 /f >nul
echo [��] ����ֹ��Ӧ��������е����й��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageContentEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�����ѡ�ҳ���ϵ�΢����Ѷ����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageHideDefaultTopSites" /t REG_DWORD /d 1 /f >nul
echo [��] �������±�ǩҳ�е�Ĭ��������վ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ShowSidebar" /t REG_DWORD /d 0 /f >nul
echo [��] ������Edge���������
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenEnabled" /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenForTrustedDownloadsEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Smartscreenɸѡ��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DiagnosticData" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�ֹ�����κ��������
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PerformanceDetectorEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ñ�ǩҳ���ܼ����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SuppressUnsupportedOSWarning" /t REG_DWORD /d 1 /f >nul
echo [��] �ѹر�ֹ֧ͣ�־�ϵͳ��֪ͨ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�Edge������
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyMode" /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyModeOnPowerEnabled" /t REG_DWORD /d 2 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyModeEnabled" /t REG_DWORD /d 1 /f >nul
echo [��] ������Ч��ģʽ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HideManagedBrowserWarning" /t REG_DWORD /d 1 /f >nul
echo [��] �ѹر�"�������֯����"��ʾ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�UAC����Ϊ�Ӳ�֪ͨ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t REG_DWORD /d 0 /f >nul
echo [��] ���������ù���Ա�˻��Ĺ�������ģʽ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableSecureUIAPaths" /t REG_DWORD /d 1 /f >nul
echo [��] ��������ȫ·���µ�UIAccess����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f >nul
echo [��] ����UIAccess�ڷǰ�ȫ����������
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�SmartScreenӦ��ɸѡ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "LowRiskFileTypes" /t REG_SZ /d ".exe;.bat;.cmd" /f >nul
echo [��] �ѹرմ򿪳���İ�ȫ����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f >nul
sc config WinDefend start= disabled >nul
sc stop WinDefend >nul
echo [��] �ѽ���Windows Defender
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�Ĭ�Ϲ���
netsh advfirewall set allprofiles state off >nul
echo [��] �ѹرշ���ǽ
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictAnonymous" /t REG_DWORD /d 1 /f >nul
echo [��] ������SAM�˻�������ö��
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "AllowInsecureGuestAuth" /t REG_DWORD /d 1 /f >nul
echo [��] �����ò���ȫ��������¼
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�Զ��Э��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center" /v "Notifications_Disable" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ð�ȫ��������֪ͨ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Features" /v "TamperProtection" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Defender�۸ı���
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d 0 /f >nul
echo [��] UAC����Ա����ʾֱ������
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ð�ȫ������ʾ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f >nul
echo [��] �ѽ���SmartScreen���߷���
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 0 /f >nul
bcdedit /set hypervisorlaunchtype off >nul 2>&1
echo [��] �ѽ��û������⻯�İ�ȫ��(VBS)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Policy" /v "VerifiedAndReputablePolicyState" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�WDӦ�ó������(WDAC)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��÷��˵İ�ȫ֪ͨ
sc config wscsvc start= disabled >nul
sc stop wscsvc >nul
echo [��] �ѽ��ð�ȫ���ķ���
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ����ڴ�������(VBS)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnablePlatformSecurity" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Windowsƽ̨�����Ʊ�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableAmsi" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���AMSI
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ô���������
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f >nul
echo [��] ����ȫ����UAC
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AllowPagePrediction" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���ҳ��Ԥ�⹦��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ÿ�ʼ��Ļ����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��û�ռ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Ӧ����������
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ù���ʶ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷����ļ�ϵͳ
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷����ĵ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷�������
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷�����ϵ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷�����Ƶ
reg add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ�����վ���Ը���
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableFirstRunAnimate" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���Windows��ӭ����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��÷���Ƶ��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�����������ռ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "Inking&TypingPersonalization" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���д��ϰ�߸���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�������Ӧ�ý���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Bing�������
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���ͨѶ¼�ռ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "Inking&TypingPersonalization" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ü����ı��ռ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���������ʷ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���������Ӧ�ð�װ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ����Զ������ȵ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Personalization\Settings" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ����������ݸ��Ի�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "EnableTypingInsights" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ü������
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "DisablePreInstalledApps" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���Ԥ��װӦ��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DisableNetFrameworkTelemetry" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���.NETң��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell" /v "EnablePowerShellTelemetry" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���PowerShellң��
sc config "DiagTrack" start= disabled >nul
sc stop "DiagTrack" >nul
echo [��] �ѽ���ң�����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ô��󱨸�(WER)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsActivateWithVoice" /t REG_DWORD /d 2 /f >nul
echo [��] �ѽ�����������(Cortana)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���λ�÷���
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ������������ռ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ö�����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���Wi-Fi��֪
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\ProblemReports" /v "DisableProblemReports" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ò����¼��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d 2 /f >nul
echo [��] �ѽ��û����Դ
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷����˻���Ϣ
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷����˶�����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷��ʵ绰
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷��������豸
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\sync" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷���ͬ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷��������Ϣ
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷���ͨ����¼
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷��ʵ����ʼ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷�������
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chatMessage" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷�����Ϣ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-CBS/Debug" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��������ջ��־
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\Logging" /v "EnableLog" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ø��½�ѹģ����־
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ô��󱨸���־
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "BackupRegistry" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��������ջ�ļ�����
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "CrashDumpEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ñ���ʱд�������Ϣ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableLogonCacheDisplay" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ����˻���¼��־����
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BFE\Diagnostics" /v "EnableLog" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���WfpDiag.ETL��־
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Debug Print Filter" /v "DEFAULT" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���д�������Ϣ
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Windows" /v "NoEventLog" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ý��¼�д��ϵͳ��־
:: �����Ż� - ���ò���Ҫ�ķ���
echo.
echo ���ڽ��ò�ֹͣ�Ǳ�Ҫ����...
echo.
:: ��ϸ��ٷ���
sc config DiagTrack start= disabled >nul
sc stop DiagTrack >nul 2>&1
echo [��] �ѽ���: DiagTrack (��ϸ��ٷ���)
:: SuperFetch����
sc config SysMain start= disabled >nul
sc stop SysMain >nul 2>&1
echo [��] �ѽ���: SysMain (SuperFetch����)
:: Windows��������
sc config WSearch start= disabled >nul
sc stop WSearch >nul 2>&1
echo [��] �ѽ���: WSearch (Windows��������)
:: Windows���·���
sc config UsoSvc start= disabled >nul
sc stop UsoSvc >nul 2>&1
echo [��] �ѽ���: UsoSvc (Windows���·���)
:: �ֲ�ʽ���Ӹ��ٷ���
sc config TrkWks start= disabled >nul
sc stop TrkWks >nul 2>&1
echo [��] �ѽ���: TrkWks (�ֲ�ʽ���Ӹ��ٷ���)
:: Windows Defender����
sc config WinDefend start= disabled >nul
sc stop WinDefend >nul 2>&1
echo [��] �ѽ���: WinDefend (Windows Defender����)
:: ��Ϸ���
sc config diagsvc start= disabled >nul
sc stop diagsvc >nul 2>&1
echo [��] �ѽ���: diagsvc (��Ϸ���)
:: ��ϲ��Է���
sc config DPS start= disabled >nul
sc stop DPS >nul 2>&1
echo [��] �ѽ���: DPS (��ϲ��Է���)
:: ��Ϸ�������
sc config WdiServiceHost start= disabled >nul
sc stop WdiServiceHost >nul 2>&1
echo [��] �ѽ���: WdiServiceHost (��Ϸ�������)
:: ���ϵͳ����
sc config WdiSystemHost start= disabled >nul
sc stop WdiSystemHost >nul 2>&1
echo [��] �ѽ���: WdiSystemHost (���ϵͳ����)
:: ��ͼ����
sc config MapsBroker start= demand >nul
echo [��] �������ֶ�: MapsBroker (��ͼ����)
:: IP���ַ���
sc config iphlpsvc start= disabled >nul
sc stop iphlpsvc >nul 2>&1
echo [��] �ѽ���: iphlpsvc (IP���ַ���)
:: ��������ռ�������
sc config diagnosticshub.standardcollector.service start= disabled >nul
sc stop diagnosticshub.standardcollector.service >nul 2>&1
echo [��] �ѽ���: diagnosticshub.standardcollector.service (��������ռ���)
:: SMS·��������
sc config SmsRouter start= disabled >nul
sc stop SmsRouter >nul 2>&1
echo [��] �ѽ���: SmsRouter (SMS·��������)
:: ������������ַ���
sc config PcaSvc start= disabled >nul
sc stop PcaSvc >nul 2>&1
echo [��] �ѽ���: PcaSvc (�������������)
:: ShellӲ��������
sc config ShellHWDetection start= demand >nul
echo [��] �������ֶ�: ShellHWDetection (ShellӲ�����)
:: ϵͳ��������
sc config SgrmBroker start= disabled >nul
sc stop SgrmBroker >nul 2>&1
echo [��] �ѽ���: SgrmBroker (ϵͳ��������)
:: ����ƻ�����
sc config Schedule start= demand >nul
echo [��] �������ֶ�: Schedule (����ƻ�����)
:: Windows�¼��ռ�����
sc config Wecsvc start= disabled >nul
sc stop Wecsvc >nul 2>&1
echo [��] �ѽ���: Wecsvc (Windows�¼��ռ�����)
:: ��ȫ��������
sc config SecurityHealthService start= disabled >nul
sc stop SecurityHealthService >nul 2>&1
echo [��] �ѽ���: SecurityHealthService (��ȫ��������)
echo.
echo �������Ż������!
echo.
:: ϵͳ���� - ɾ����ʱ�ļ��ͻ���
echo ����������ʱ�ļ��ͻ���...
echo.
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
:: �����𻵵�Appx
echo [��] ����: �𻵵�AppxӦ��
powershell -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Status -eq 'Error'} | Remove-AppxPackage -ErrorAction SilentlyContinue" >nul
:: ����.NET���򼯻���
echo [��] ����: .NET���򼯻���
rd /s /q "%WinDir%\assembly\NativeImages_v4.0.30319_32" >nul 2>&1
rd /s /q "%WinDir%\assembly\NativeImages_v4.0.30319_64" >nul 2>&1

echo.
echo ========================================
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
echo.  [1]   ���/��Դ������������Ա���С�ZyperWin++���Ż���Ч�����С�Start����Ч��
echo.
echo.  [2]   �����Ż�����
echo.
echo.  [3]   Edge�Ż�����
echo.
echo.  [4]   ��ȫ����
echo.
echo.  [5]   ��˽����
echo.
echo.  [6]   ��־����
echo.
echo.  [7]   �������Ż�
echo.
echo.  [8]   ����������Ҫ��ϵͳ��ԭ�㴴��ǰ�����޴�����ɺ��ԣ�
echo.
echo.  [X]   ����
echo.
echo.===============================================================================
echo.
choice /C:12345678X /N /M "���������ѡ�� ��"
if errorlevel 9 goto :MainMenu
if errorlevel 8 goto :laji
if errorlevel 7 goto :fuwuxiang
if errorlevel 6 goto :rizhi
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

cls
echo.===============================================================================
echo.                    ZyperWin++ - ���/��Դ������
echo.===============================================================================
echo ��ѡ��ҪӦ�õ��Ż���ɶ�ѡ���ÿո�ָ�����
echo.
echo   [ 1] ����������Cortana
echo   [ 2] ���������ںϲ�
echo   [ 3] ��Դ����������ʾ"�˵���"
echo   [ 4] ���Ǵ��ڴ�ж������DLL
echo   [ 5] ��ֹ�����𻵵Ŀ�ݷ�ʽ
echo   [ 6] �Ż��ļ��б�ˢ�²���
echo   [ 7] ������ݷ�ʽ�����"��ݷ�ʽ"����
echo   [ 8] ��ֹ�Զ�����
echo   [ 9] �ڵ��������д��ļ���
echo   [10] ���ٷ��ʲ���ʾ�����ļ���
echo   [11] ���ٷ��ʲ���ʾ���ʹ���ļ�
echo   [12] ���������ص�������
echo   [13] ����������������ť
echo   [14] ��Դ�����������Զ�����
echo   [15] ��ʾ�ļ���չ��
echo   [16] ������ʾ"�˵���"
echo   [17] ������ʾ"����վ"
echo   [18] ���ü��������ѽ���Ҽ��˵�
echo   [19] ����Windows Defenderɨ���Ҽ��˵�
echo   [20] ����Bitlocker�Ҽ��˵�
echo   [21] ����"��Ϊ��Я�豸��"�Ҽ��˵�
echo   [22] �����½���ϵ���Ҽ��˵�
echo   [23] ����"��ԭ��ǰ�汾"�Ҽ��˵�
echo   [24] ����"��¼������"�Ҽ��˵�
echo   [25] ����"�������Ȩ��"�Ҽ��˵�
echo   [26] ����"ʼ���ѻ�����"�Ҽ��˵�
echo   [27] ����"�̶������ٷ���"�Ҽ��˵�
echo   [28] ���ù����ļ����Ҽ��˵�
echo   [29] ���û�ͼ3D�Ҽ��˵�
echo   [30] ����"����������"�Ҽ��˵�
echo   [31] ���ÿ�ʼ�˵�����Ӧ��
echo   [32] ���ÿ�ʼ�˵�������Ӧ��
echo   [33] ���±������Զ�����
echo   [34] ���±���ʾ״̬��
echo   [35] �˳�ʱ���������ĵ�
echo.
echo   [A] Ӧ�������Ż�
echo   [R] ������Դ��������������ZyperWin++��Ч������Start�޷��ص����棩
echo   [X] ����
echo.
set /p "choices=������ѡ����: 1 3 5 �� A��: "

if "%choices%"=="" goto custom_optimize
if /i "%choices%"=="X" goto custom_optimize
if /i "%choices%"=="R" goto RESTART_EXPLORER

:: ����ȫѡ
if /i "%choices%"=="A" (
    set "choices=1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35"
)

:: �������ѡ��
for %%c in (%choices%) do (
    if %%c EQU 1 call :HIDE_CORTANA
    if %%c EQU 2 call :TASKBAR_COMBINE
    if %%c EQU 3 call :EXPLORER_THISPC
    if %%c EQU 4 call :UNLOAD_DLLS
    if %%c EQU 5 call :DISABLE_BROKEN_SHORTCUTS
    if %%c EQU 6 call :OPTIMIZE_REFRESH
    if %%c EQU 7 call :NO_SHORTCUT_SUFFIX
    if %%c EQU 8 call :DISABLE_AUTOPLAY
    if %%c EQU 9 call :SEPARATE_PROCESS
    if %%c EQU 10 call :HIDE_FREQUENT_FOLDERS
    if %%c EQU 11 call :HIDE_RECENT_FILES
    if %%c EQU 12 call :HIDE_LANGBAR
    if %%c EQU 13 call :HIDE_LANGBAR_HELP
    if %%c EQU 14 call :EXPLORER_AUTO_RESTART
    if %%c EQU 15 call :SHOW_FILE_EXTENSIONS
    if %%c EQU 16 call :DESKTOP_THISPC
    if %%c EQU 17 call :DESKTOP_RECYCLE
    if %%c EQU 18 call :DISABLE_COMPAT_MENU
    if %%c EQU 19 call :DISABLE_DEFENDER_SCAN
    if %%c EQU 20 call :DISABLE_BITLOCKER
    if %%c EQU 21 call :DISABLE_PORTABLE_OPEN
    if %%c EQU 22 call :DISABLE_NEW_CONTACT
    if %%c EQU 23 call :DISABLE_PREVIOUS_VERSIONS
    if %%c EQU 24 call :DISABLE_BURN_DISC
    if %%c EQU 25 call :DISABLE_SHARE_MENU
    if %%c EQU 26 call :DISABLE_OFFLINE_ACCESS
    if %%c EQU 27 call :DISABLE_PIN_TO_QUICK
    if %%c EQU 28 call :DISABLE_WORK_FOLDERS
    if %%c EQU 29 call :DISABLE_PAINT3D_MENU
    if %%c EQU 30 call :DISABLE_INCLUDE_LIBRARY
    if %%c EQU 31 call :DISABLE_START_APPS
    if %%c EQU 32 call :DISABLE_RECENT_APPS
    if %%c EQU 33 call :NOTEPAD_WORDWRAP
    if %%c EQU 34 call :NOTEPAD_STATUSBAR
    if %%c EQU 35 call :CLEAR_RECENT_DOCS
)

echo.
pause
goto custom_optimize

:RESTART_EXPLORER
echo.
echo ����������Դ������...
taskkill /f /im explorer.exe >nul
start explorer.exe >nul
echo ��Դ������������
echo.
pause
goto custom_optimize

:: �����Ǹ����Ż�������ʵ��
:HIDE_CORTANA
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f >nul
echo [��] ������������Cortana
goto :EOF

:TASKBAR_COMBINE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d 1 /f >nul
echo [��] ���������������ںϲ�
goto :EOF

:EXPLORER_THISPC
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f >nul
echo [��] ��Դ��������ʱ��ʾ"�˵���"
goto :EOF

:UNLOAD_DLLS
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "AlwaysUnloadDLL" /t REG_DWORD /d 1 /f >nul
echo [��] �����ô��ڴ�ж������DLL
goto :EOF

:DISABLE_BROKEN_SHORTCUTS
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoResolveTrack" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ø����𻵵Ŀ�ݷ�ʽ
goto :EOF

:OPTIMIZE_REFRESH
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_DWORD /d 0 /f >nul
echo [��] ���Ż�Windows�ļ��б�ˢ�²���
goto :EOF

:NO_SHORTCUT_SUFFIX
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /t REG_BINARY /d 00000000 /f >nul
echo [��] ������ݷ�ʽʱ�����"��ݷ�ʽ"����
goto :EOF

:DISABLE_AUTOPLAY
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d 255 /f >nul
echo [��] �ѽ����Զ�����
goto :EOF

:SEPARATE_PROCESS
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d 1 /f >nul
echo [��] ���ڵ��������д��ļ��д���
goto :EOF

:HIDE_FREQUENT_FOLDERS
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 0 /f >nul
echo [��] ���ٷ��ʲ�����ʾ�����ļ���
goto :EOF

:HIDE_RECENT_FILES
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 0 /f >nul
echo [��] ���ٷ��ʲ�����ʾ���ʹ���ļ�
goto :EOF

:HIDE_LANGBAR
reg add "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /t REG_DWORD /d 3 /f >nul
echo [��] �����������ص�������
goto :EOF

:HIDE_LANGBAR_HELP
reg add "HKEY_CURRENT_USER\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" /t REG_DWORD /d 0 /f >nul
echo [��] �������������ϵİ�����ť
goto :EOF

:EXPLORER_AUTO_RESTART
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoRestartShell" /t REG_DWORD /d 1 /f >nul
echo [��] ��Դ����������ʱ���Զ�����
goto :EOF

:SHOW_FILE_EXTENSIONS
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f >nul
echo [��] ����ʾ��֪�ļ����͵���չ��
goto :EOF

:DESKTOP_THISPC
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f >nul
echo [��] ��������ʾ"�˵���"
goto :EOF

:DESKTOP_RECYCLE
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0 /f >nul
echo [��] ��������ʾ"����վ"
goto :EOF

:: ����Ϊ�Ҽ��˵����ú���
:DISABLE_COMPAT_MENU
reg delete "HKEY_CLASSES_ROOT\exefile\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
echo [��] �ѽ��ÿ�ִ���ļ���"���������ѽ��"�Ҽ��˵�
goto :EOF

:DISABLE_DEFENDER_SCAN
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" /f >nul 2>&1
echo [��] �ѽ����ļ�/�ļ��е�"ʹ��Windows Defenderɨ��"�Ҽ��˵�
goto :EOF

:DISABLE_BITLOCKER
reg delete "HKEY_CLASSES_ROOT\Drive\shell\BitLocker" /f >nul 2>&1
echo [��] �ѽ��ô��̵�"����Bitlocker"�Ҽ��˵�
goto :EOF

:DISABLE_PORTABLE_OPEN
reg delete "HKEY_CLASSES_ROOT\Drive\shell\PortableDeviceMenu" /f >nul 2>&1
echo [��] �ѽ��ô��̵�"��Ϊ��Я�豸��"�Ҽ��˵�
goto :EOF

:DISABLE_NEW_CONTACT
reg delete "HKEY_CLASSES_ROOT\.contact\ShellNew" /f >nul 2>&1
echo [��] �ѽ����½���"��ϵ��"�Ҽ��˵�
goto :EOF

:DISABLE_PREVIOUS_VERSIONS
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
echo [��] �ѽ����ļ�/���̵�"��ԭ��ǰ�汾"�Ҽ��˵�
goto :EOF

:DISABLE_BURN_DISC
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\{B327765E-D724-4347-8B16-78AE18552FC3}" /f >nul 2>&1
echo [��] �ѽ��ô��̵�"��¼������"�Ҽ��˵�
goto :EOF

:DISABLE_SHARE_MENU
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Sharing" /f >nul 2>&1
echo [��] �ѽ���"�������Ȩ��"�Ҽ��˵�
goto :EOF

:DISABLE_OFFLINE_ACCESS
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Offline Files" /f >nul 2>&1
echo [��] �ѽ����ļ�/�ļ��е�"ʼ���ѻ�����"�Ҽ��˵�
goto :EOF

:DISABLE_PIN_TO_QUICK
reg delete "HKEY_CLASSES_ROOT\Folder\shell\pintohome" /f >nul 2>&1
echo [��] �ѽ����ļ��е�"�̶������ٷ���"�Ҽ��˵�
goto :EOF

:DISABLE_WORK_FOLDERS
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\WorkFolders" /f >nul 2>&1
echo [��] �ѽ���"�����ļ���"�Ҽ��˵�
goto :EOF

:DISABLE_PAINT3D_MENU
reg delete "HKEY_CLASSES_ROOT\SystemFileAssociations\.3mf\Shell\3D Edit" /f >nul 2>&1
echo [��] �ѽ����ļ���"��ͼ3D"�Ҽ��˵�
goto :EOF

:DISABLE_INCLUDE_LIBRARY
reg delete "HKEY_CLASSES_ROOT\Folder\shellex\ContextMenuHandlers\Library Location" /f >nul 2>&1
echo [��] �ѽ����ļ��е�"����������"�Ҽ��˵�
goto :EOF

:: ��ʼ�˵��Ż�
:DISABLE_START_APPS
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ÿ�ʼ�˵�App�б�-��õ�Ӧ��
goto :EOF

:DISABLE_RECENT_APPS
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ÿ�ʼ�˵�App�б�-�����ӵ�Ӧ��
goto :EOF

:: ���±�����
:NOTEPAD_WORDWRAP
reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "fWrap" /t REG_DWORD /d 1 /f >nul
echo [��] ���±��������Զ�����
goto :EOF

:NOTEPAD_STATUSBAR
reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "StatusBar" /t REG_DWORD /d 1 /f >nul
echo [��] ���±�������״̬����ʾ
goto :EOF

:CLEAR_RECENT_DOCS
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ClearRecentDocsOnExit" /t REG_DWORD /d 1 /f >nul
echo [��] �������˳�ϵͳʱ�������򿪵��ĵ�
goto :EOF


::-------------------------------------------------------------------------------------------
:: ZyperWin++ - �����Ż�����
::-------------------------------------------------------------------------------------------
:xingneng

cls
echo.===============================================================================
echo.                    ZyperWin++ - �����Ż�����
echo.===============================================================================
echo.
echo ��ѡ��ҪӦ�õ��Ż���ɶ�ѡ���ÿո�ָ�����
echo.
echo   [ 1] �������ڿ�ʼ�˵���ʾ����
echo   [ 2] ��Ҫ��Ӧ���̵��в��ҹ���Ӧ��
echo   [ 3] �ر��̵�Ӧ���ƹ�
echo   [ 4] �ر�����ʱ��Windows�۽��ƹ�
echo   [ 5] �ر�"ʹ��Windowsʱ��ȡ���ɺͽ���"
echo   [ 6] ��ֹ�Զ���װ�Ƽ���Ӧ�ó���
echo   [ 7] �ر���Ϸ¼�ƹ���
echo   [ 8] �رն����С��
echo   [ 9] �ӿ�ػ��ٶ�
echo   [10] ���̹رշ���ȴ�ʱ��
echo   [11] ���ó������������
echo   [12] ����Զ���޸�ע���
echo   [13] ������Ϸ���
echo   [14] ����SysMain
echo   [15] ����Windows Search
echo   [16] ���ô��󱨸�
echo   [17] ���ÿͻ�������Ƽƻ�
echo   [18] ����NTFS���Ӹ��ٷ���
echo   [19] ��ֹ�Զ�ά���ƻ�
echo   [20] ��Ҫ�Զ�����ReFS�ļ�ϵͳ�汾
echo   [21] ͻ��260���ַ���·����������
echo   [22] ��ֹNTFS�����ļ�����ʱ��
echo   [23] ����NTFS�ڶ��ļ�����ʹ����չ�ַ���
echo   [24] ��NTFS���ļ���ı����ռ�����Ϊ200MB
echo   [25] NTFS������ʱ�������ɴ�����
echo   [26] ����NTFS�������ʾ
echo   [27] ���ô�ϵͳ�������������
echo   [28] ��ֹϵͳ�ں������������ҳ��Ӳ��
echo   [29] ���ļ�����ϵͳ����������256MB
echo   [30] ��WindowsԤ������Ϊ�ر�Ԥ��
echo   [31] ���ô�������������۶ϲ���
echo   [32] VHD����ʱ��ʡ���̿ռ�
echo   [33] �ر�ϵͳ�Զ����Թ���
echo   [34] �����̴�����ȴ�ʱ�����̵�����
echo   [35] �豸��װ��ֹ����ϵͳ��ԭ��
echo   [36] ����USB���̺󳹵׶Ͽ���Դ
echo   [37] �رտ�������
echo   [38] �ر�����
echo   [39] ��������������������
echo   [40] ΢��ƴ�����뷨�ر��Ƽ���
echo   [41] ��ֹWin10/11���д�汾����
echo   [42] Windows���²������������ɾ������
echo   [43] ����Windows����
echo   [44] �������ݴ����Ż�����
echo   [45] ���ù��ܸ��°�ȫ��ʩ
echo   [46] �����������Զ�����
echo   [47] ����Installer detection
echo   [48] ����Adobe Type Manager��������
echo   [49] ���ñ����ռ�
echo   [50] ����Ӳ������GPU�ƻ�
echo   [51] �Ż����������ܺ��ڴ�����
echo   [52] ����Cortana���ܼ���CPUռ��
echo   [53] �ر�Exploit Protection
echo   [54] �رչ��ID
echo   [55] �ر�Ӧ����������
echo   [56] ȥ������ҳ����Ϣ��������
echo   [57] ֹͣ���µ�2999��
echo   [58] �ر�TSX©������
echo   [59] �Ż���������
echo   [60] �ر���ϲ��Է���
echo   [61] �رճ������������
echo   [62] �ر�΢��ͻ�����Ľ��ƻ�
echo   [63] ���ý����Ż�
echo   [64] ���ø߾����¼���ʱ��(HPET)
echo   [65] ����Game Bar
echo   [66] �����Զ������̵�Ӧ��
echo   [67] �����Զ����µ�ͼ
echo   [68] ����Windows����
echo   [69] ���������Ĳ˵���ʾ�ӳ�
echo.
echo   [A] Ӧ�������Ż�
echo   [X] ����
echo.
set /p "choices=������ѡ����: 1 3 5 �� A��: "

if "%choices%"=="" goto custom_optimize
if /i "%choices%"=="X" goto custom_optimize

:: ����ȫѡ
if /i "%choices%"=="A" (
    set "choices=1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69"
)

:: �������ѡ��
for %%c in (%choices%) do (
    if %%c EQU 1 call :OPT1
    if %%c EQU 2 call :OPT2
    if %%c EQU 3 call :OPT3
    if %%c EQU 4 call :OPT4
    if %%c EQU 5 call :OPT5
    if %%c EQU 6 call :OPT6
    if %%c EQU 7 call :OPT7
    if %%c EQU 8 call :OPT8
    if %%c EQU 9 call :OPT9
    if %%c EQU 10 call :OPT10
    if %%c EQU 11 call :OPT11
    if %%c EQU 12 call :OPT12
    if %%c EQU 13 call :OPT13
    if %%c EQU 14 call :OPT14
    if %%c EQU 15 call :OPT15
    if %%c EQU 16 call :OPT16
    if %%c EQU 17 call :OPT17
    if %%c EQU 18 call :OPT18
    if %%c EQU 19 call :OPT19
    if %%c EQU 20 call :OPT20
    if %%c EQU 21 call :OPT21
    if %%c EQU 22 call :OPT22
    if %%c EQU 23 call :OPT23
    if %%c EQU 24 call :OPT24
    if %%c EQU 25 call :OPT25
    if %%c EQU 26 call :OPT26
    if %%c EQU 27 call :OPT27
    if %%c EQU 28 call :OPT28
    if %%c EQU 29 call :OPT29
    if %%c EQU 30 call :OPT30
    if %%c EQU 31 call :OPT31
    if %%c EQU 32 call :OPT32
    if %%c EQU 33 call :OPT33
    if %%c EQU 34 call :OPT34
    if %%c EQU 35 call :OPT35
    if %%c EQU 36 call :OPT36
    if %%c EQU 37 call :OPT37
    if %%c EQU 38 call :OPT38
    if %%c EQU 39 call :OPT39
    if %%c EQU 40 call :OPT40
    if %%c EQU 41 call :OPT41
    if %%c EQU 42 call :OPT42
    if %%c EQU 43 call :OPT43
    if %%c EQU 44 call :OPT44
    if %%c EQU 45 call :OPT45
    if %%c EQU 46 call :OPT46
    if %%c EQU 47 call :OPT47
    if %%c EQU 48 call :OPT48
    if %%c EQU 49 call :OPT49
    if %%c EQU 50 call :OPT50
    if %%c EQU 51 call :OPT51
    if %%c EQU 52 call :OPT52
    if %%c EQU 53 call :OPT53
    if %%c EQU 54 call :OPT54
    if %%c EQU 55 call :OPT55
    if %%c EQU 56 call :OPT56
    if %%c EQU 57 call :OPT57
    if %%c EQU 58 call :OPT58
    if %%c EQU 59 call :OPT59
    if %%c EQU 60 call :OPT60
    if %%c EQU 61 call :OPT61
    if %%c EQU 62 call :OPT62
    if %%c EQU 63 call :OPT63
    if %%c EQU 64 call :OPT64
    if %%c EQU 65 call :OPT65
    if %%c EQU 66 call :OPT66
    if %%c EQU 67 call :OPT67
    if %%c EQU 68 call :OPT68
    if %%c EQU 69 call :OPT69
)

echo.
echo ע�⣺�����Ż���Ҫ����ϵͳ������ȫ��Ч
echo.
pause
goto custom_optimize

:: �����Ǹ����Ż�������ʵ��
:OPT1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �������ڿ�ʼ�˵���ʾ����
goto :EOF

:OPT2
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] ��Ҫ��Ӧ���̵��в��ҹ���Ӧ��
goto :EOF

:OPT3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ر��̵�Ӧ���ƹ�
goto :EOF

:OPT4
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ر�����ʱ��Windows�۽��ƹ�
goto :EOF

:OPT5
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ر�"ʹ��Windowsʱ��ȡ���ɺͽ���"
goto :EOF

:OPT6
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d 2 /f >nul
echo [��] ��ֹ�Զ���װ�Ƽ���Ӧ�ó���
goto :EOF

:OPT7
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ر���Ϸ¼�ƹ���
goto :EOF

:OPT8
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �رն����С��
goto :EOF

:OPT9
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "1000" /f >nul
echo [��] �ӿ�ػ��ٶ�
goto :EOF

:OPT10
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "ServicesPipeTimeout" /t REG_DWORD /d 2000 /f >nul
echo [��] ���̹رշ���ȴ�ʱ��
goto :EOF

:OPT11
sc config "PcaSvc" start= disabled >nul
sc stop "PcaSvc" >nul
echo [��] ���ó������������
goto :EOF

:OPT12
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" /v "RemoteRegAccess" /t REG_DWORD /d 0 /f >nul
echo [��] ����Զ���޸�ע���
goto :EOF

:OPT13
sc config "DPS" start= disabled >nul
sc stop "DPS" >nul
echo [��] ������Ϸ���
goto :EOF

:OPT14
sc config "SysMain" start= disabled >nul
sc stop "SysMain" >nul
echo [��] ����SysMain
goto :EOF

:OPT15
sc config "WSearch" start= disabled >nul
sc stop "WSearch" >nul
echo [��] ����Windows Search
goto :EOF

:OPT16
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f >nul
echo [��] ���ô��󱨸�
goto :EOF

:OPT17
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f >nul
echo [��] ���ÿͻ�������Ƽƻ�
goto :EOF

:OPT18
sc config "TrkWks" start= disabled >nul
sc stop "TrkWks" >nul
echo [��] ����NTFS���Ӹ��ٷ���
goto :EOF

:OPT19
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d 1 /f >nul
echo [��] ��ֹ�Զ�ά���ƻ�
goto :EOF

:OPT20
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v "RefsDisableUpgrade" /t REG_DWORD /d 1 /f >nul
echo [��] ��Ҫ�Զ�����ReFS�ļ�ϵͳ�汾
goto :EOF

:OPT21
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d 1 /f >nul
echo [��] ͻ��260���ַ���·����������
goto :EOF

:OPT22
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d 1 /f >nul
echo [��] ��ֹNTFS�����ļ�����ʱ��
goto :EOF

:OPT23
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsAllowExtendedCharacterIn8dot3Name" /t REG_DWORD /d 1 /f >nul
echo [��] ����NTFS�ڶ��ļ�����ʹ����չ�ַ���
goto :EOF

:OPT24
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsMftZoneReservation" /t REG_DWORD /d 4 /f >nul
echo [��] ��NTFS���ļ���ı����ռ�����Ϊ200MB
goto :EOF

:OPT25
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot" /t REG_DWORD /d 0 /f >nul
echo [��] NTFS������ʱ�������ɴ�����
goto :EOF

:OPT26
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "NoVolumeTrack" /t REG_DWORD /d 1 /f >nul
echo [��] ����NTFS�������ʾ
goto :EOF

:OPT27
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f >nul
echo [��] ���ô�ϵͳ�������������
goto :EOF

:OPT28
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f >nul
echo [��] ��ֹϵͳ�ں������������ҳ��Ӳ��
goto :EOF

:OPT29
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d 4194304 /f >nul
echo [��] ���ļ�����ϵͳ����������256MB
goto :EOF

:OPT30
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 0 /f >nul
echo [��] �ر�WindowsԤ������
goto :EOF

:OPT31
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 3 /f >nul
echo [��] ���ô�������������۶ϲ������������
goto :EOF

:OPT32
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FsDepends\Parameters" /v "VirtualDiskExpandOnMount" /t REG_DWORD /d 4 /f >nul
echo [��] VHD����ʱ��ʡ���̿ռ�
goto :EOF

:OPT33
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t REG_DWORD /d 0 /f >nul
echo [��] �ر�ϵͳ�Զ����Թ���
goto :EOF

:OPT34
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "AutoChkTimeOut" /t REG_DWORD /d 5 /f >nul
echo [��] �����̴�����ȴ�ʱ�����̵�����
goto :EOF

:OPT35
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Settings" /v "DisableSystemRestore" /t REG_DWORD /d 1 /f >nul
echo [��] �豸��װ��ֹ����ϵͳ��ԭ��
goto :EOF

:OPT36
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v "DisableOnSoftRemove" /t REG_DWORD /d 0 /f >nul
echo [��] ����USB���̺󳹵׶Ͽ���Դ
goto :EOF

:OPT37
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �رտ�������
goto :EOF

:OPT38
powercfg /hibernate off
echo [��] �ر�����
goto :EOF

:OPT39
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions" /v "MitigationOptions_FontBocking" /t REG_SZ /d "10000000000000000000000000000000" /f >nul
echo [��] ��������������������
goto :EOF

:OPT40
reg add "HKEY_CURRENT_USER\Software\Microsoft\InputMethod\Settings\CHS" /v "CloudCandidate" /t REG_DWORD /d 0 /f >nul
echo [��] ΢��ƴ�����뷨�ر��Ƽ���
goto :EOF

:OPT41
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableOSUpgrade" /t REG_DWORD /d 1 /f >nul
echo [��] ��ֹWin10/11���д�汾����
goto :EOF

:OPT42
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d 1 /f >nul
echo [��] Windows���²������������ɾ������
goto :EOF

:OPT43
sc config "wuauserv" start= disabled >nul
sc stop "wuauserv" >nul
echo [��] ����Windows����
goto :EOF

:OPT44
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d 0 /f >nul
echo [��] �������ݴ����Ż�����
goto :EOF

:OPT45
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX" /v "IsConvergedUpdateStackEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] ���ù��ܸ��°�ȫ��ʩ
goto :EOF

:OPT46
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot" /t REG_DWORD /d 0 /f >nul
echo [��] �����������Զ�����
goto :EOF

:OPT47
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /t REG_DWORD /d 0 /f >nul
echo [��] ����Installer detection
goto :EOF

:OPT48
sc config "ATMFD" start= disabled >nul
sc stop "ATMFD" >nul
echo [��] ����Adobe Type Manager��������
goto :EOF

:OPT49
DISM.exe /Online /Set-ReservedStorageState /State:Disabled >nul 2>&1
echo [��] ���ñ����ռ�
goto :EOF

:OPT50
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f >nul
echo [��] ����Ӳ������GPU�ƻ�
goto :EOF

:OPT51
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ16Priority" /t REG_DWORD /d 2 /f >nul
echo [��] �Ż����������ܺ��ڴ�����
goto :EOF

:OPT52
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul
echo [��] ����Cortana���ܣ�����CPUռ��
goto :EOF

:OPT53
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "MitigationOptions" /t REG_BINARY /d 22222200000200000002000000000000 /f >nul
echo [��] �ر�Exploit Protection
goto :EOF

:OPT54
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d 1 /f >nul
echo [��] �رչ��ID
goto :EOF

:OPT55
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f >nul
echo [��] �ر�Ӧ����������
goto :EOF

:OPT56
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1 /f >nul
echo [��] ȥ������ҳ����Ϣ��������
goto :EOF

:OPT57
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "FlightSettingsMaxPauseDays" /t REG_SZ /d "7152" /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseFeatureUpdatesStartTime" /t REG_SZ /d "2024-01-01T10:00:52Z" /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseFeatureUpdatesEndTime" /t REG_SZ /d "2999-12-01T09:59:52Z" /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseQualityUpdatesStartTime" /t REG_SZ /d "2024-01-01T10:00:52Z" /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseQualityUpdatesEndTime" /t REG_SZ /d "2999-12-01T09:59:52Z" /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesStartTime" /t REG_SZ /d "2024-01-01T09:59:52Z" /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesExpiryTime" /t REG_SZ /d "2999-12-01T09:59:52Z" /f >nul
echo [��] ֹͣ���µ�2999��
goto :EOF

:OPT58
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v "DisableTsx" /t REG_DWORD /d 1 /f >nul
echo [��] �ر�TSX©������
goto :EOF

:OPT59
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_SZ /d "ffffffff" /f >nul
echo [��] �Ż���������
goto :EOF

:OPT60
sc config "DPS" start= disabled >nul
sc stop "DPS" >nul
echo [��] �ر���ϲ��Է���
goto :EOF

:OPT61
sc config "PcaSvc" start= disabled >nul
sc stop "PcaSvc" >nul
echo [��] �رճ������������
goto :EOF

:OPT62
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f >nul
echo [��] �ر�΢��ͻ�����Ľ��ƻ�
goto :EOF

:OPT63
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d 0 /f >nul
echo [��] ���ý����Ż�
goto :EOF

:OPT64
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hpet" /v "Start" /t REG_DWORD /d 4 /f >nul
echo [��] ���ø߾����¼���ʱ��(HPET)
goto :EOF

:OPT65
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] ����Game Bar
goto :EOF

:OPT66
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore" /v "AutoDownload" /t REG_DWORD /d 2 /f >nul
echo [��] �����Զ������̵�Ӧ��
goto :EOF

:OPT67
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d 0 /f >nul
echo [��] �����Զ����µ�ͼ
goto :EOF

:OPT68
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 1 /f >nul
echo [��] ����Windows����
goto :EOF

:OPT69
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >nul
echo [��] ���������Ĳ˵���ʾ�ӳ�
goto :EOF

::-------------------------------------------------------------------------------------------
:: ZyperWin++ - Edge�Ż�����
::-------------------------------------------------------------------------------------------
:Edge

cls
echo.===============================================================================
echo.                    ZyperWin++ - Edge�Ż�����
echo.===============================================================================
echo.
echo ��ѡ��ҪӦ�õ��Ż���ɶ�ѡ���ÿո�ָ�����
echo.
echo   [ 1] ��Ҫ��ʾ"�״�����"��ӭҳ��
echo   [ 2] �ر�Adobe Flash���㼴��
echo   [ 3] �رպ��ֹ�������к�̨Ӧ��
echo   [ 4] ��ֹ��Ӧ��������е����й��
echo   [ 5] ������ѡ�ҳ���ϵ�΢����Ѷ
echo   [ 6] �����±�ǩҳ�е�Ĭ��������վ
echo   [ 7] ����Edge���������
echo   [ 8] ����Smartscreenɸѡ��
echo   [ 9] ��Ҫ�����κ��������
echo   [10] ���ñ�ǩҳ���ܼ����
echo   [11] �ر�ֹ֧ͣ�־�ϵͳ��֪ͨ
echo   [12] �ر�Edge������
echo   [13] ����Ч��ģʽ
echo   [14] �ر�"�������֯����"��ʾ
echo.
echo   [A] Ӧ�������Ż�
echo   [X] ����
echo.
set /p "choices=������ѡ����: 1 3 5 �� A��: "

if "%choices%"=="" goto custom_optimize
if /i "%choices%"=="X" goto custom_optimize

:: ����ȫѡ
if /i "%choices%"=="A" (
    set "choices=1 2 3 4 5 6 7 8 9 10 11 12 13 14"
)

:: �������ѡ��
for %%c in (%choices%) do (
    if %%c EQU 1 call :OPT1
    if %%c EQU 2 call :OPT2
    if %%c EQU 3 call :OPT3
    if %%c EQU 4 call :OPT4
    if %%c EQU 5 call :OPT5
    if %%c EQU 6 call :OPT6
    if %%c EQU 7 call :OPT7
    if %%c EQU 8 call :OPT8
    if %%c EQU 9 call :OPT9
    if %%c EQU 10 call :OPT10
    if %%c EQU 11 call :OPT11
    if %%c EQU 12 call :OPT12
    if %%c EQU 13 call :OPT13
    if %%c EQU 14 call :OPT14
)

echo.
echo ע�⣺�����Ż���Ҫ����Edge�����������Ч
echo.
pause
goto custom_optimize


:: �����Ǹ����Ż�������ʵ��
:OPT1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HideFirstRunExperience" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���"�״�����"��ӭҳ��
goto :EOF

:OPT2
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "RunAllFlashInAllowMode" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�Adobe Flash���㼴��
goto :EOF

:OPT3
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�ֹEdge�رպ�������к�̨Ӧ��
goto :EOF

:OPT4
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AdsSettingForIntrusiveAdsSites" /t REG_DWORD /d 2 /f >nul
echo [��] ����ֹ��Ӧ��������е����й��
goto :EOF

:OPT5
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageContentEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�����ѡ�ҳ���ϵ�΢����Ѷ����
goto :EOF

:OPT6
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageHideDefaultTopSites" /t REG_DWORD /d 1 /f >nul
echo [��] �������±�ǩҳ�е�Ĭ��������վ
goto :EOF

:OPT7
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ShowSidebar" /t REG_DWORD /d 0 /f >nul
echo [��] ������Edge���������
goto :EOF

:OPT8
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenEnabled" /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenForTrustedDownloadsEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Smartscreenɸѡ��
goto :EOF

:OPT9
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DiagnosticData" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�ֹ�����κ��������
goto :EOF

:OPT10
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PerformanceDetectorEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ñ�ǩҳ���ܼ����
goto :EOF

:OPT11
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SuppressUnsupportedOSWarning" /t REG_DWORD /d 1 /f >nul
echo [��] �ѹر�ֹ֧ͣ�־�ϵͳ��֪ͨ
goto :EOF

:OPT12
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�Edge������
goto :EOF

:OPT13
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyMode" /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyModeOnPowerEnabled" /t REG_DWORD /d 2 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyModeEnabled" /t REG_DWORD /d 1 /f >nul
echo [��] ������Ч��ģʽ
goto :EOF

:OPT14
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HideManagedBrowserWarning" /t REG_DWORD /d 1 /f >nul
echo [��] �ѹر�"�������֯����"��ʾ
goto :EOF

::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ��ȫ����
::-------------------------------------------------------------------------------------------
:anquan

cls
echo.===============================================================================
echo.                    ZyperWin++ - ��ȫ����
echo.===============================================================================
echo.
echo ��ѡ��ҪӦ�õ��Ż���ɶ�ѡ���ÿո�ָ�����
echo.
echo   [ 1] ��UAC����Ϊ�Ӳ�֪ͨ
echo   [ 2] �������ù���Ա�˻��Ĺ�������ģʽ
echo   [ 3] ��������ȫ·���µ�UIAccess����
echo   [ 4] ����UIAccess�ڷǰ�ȫ����������
echo   [ 5] �ر�SmartScreenӦ��ɸѡ��
echo   [ 6] �رմ򿪳���İ�ȫ����
echo   [ 7] ����Windows Defender
echo   [ 8] �ر�Ĭ�Ϲ���
echo   [ 9] �رշ���ǽ
echo   [10] ������SAM�˻�������ö��
echo   [11] ���ò���ȫ��������¼
echo   [12] �ر�Զ��Э��
echo   [13] ���ð�ȫ��������֪ͨ
echo   [14] ����Defender�۸ı���
echo   [15] UAC����Ա����ʾֱ������
echo   [16] ���ð�ȫ������ʾ
echo   [17] ����SmartScreen���߷���
echo   [18] ���û������⻯�İ�ȫ��(VBS)
echo   [19] �ر�WDӦ�ó������(WDAC)
echo   [20] ���÷��˵İ�ȫ֪ͨ
echo   [21] ���ð�ȫ���ķ���
echo   [22] �����ڴ�������(VBS)
echo   [23] ����Windowsƽ̨�����Ʊ�
echo   [24] ����AMSI
echo   [25] ���ô���������
echo   [26] ����UAC
echo.
echo   [A] Ӧ�������Ż�
echo   [X] ����
echo.
set /p "choices=������ѡ����: 1 3 5 �� A��: "

if "%choices%"=="" goto custom_optimize
if /i "%choices%"=="X" goto custom_optimize

:: ����ȫѡ
if /i "%choices%"=="A" (
    set "choices=1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26"
)

:: �������ѡ��
for %%c in (%choices%) do (
    if %%c EQU 1 call :OPT1
    if %%c EQU 2 call :OPT2
    if %%c EQU 3 call :OPT3
    if %%c EQU 4 call :OPT4
    if %%c EQU 5 call :OPT5
    if %%c EQU 6 call :OPT6
    if %%c EQU 7 call :OPT7
    if %%c EQU 8 call :OPT8
    if %%c EQU 9 call :OPT9
    if %%c EQU 10 call :OPT10
    if %%c EQU 11 call :OPT11
    if %%c EQU 12 call :OPT12
    if %%c EQU 13 call :OPT13
    if %%c EQU 14 call :OPT14
    if %%c EQU 15 call :OPT15
    if %%c EQU 16 call :OPT16
    if %%c EQU 17 call :OPT17
    if %%c EQU 18 call :OPT18
    if %%c EQU 19 call :OPT19
    if %%c EQU 20 call :OPT20
    if %%c EQU 21 call :OPT21
    if %%c EQU 22 call :OPT22
    if %%c EQU 23 call :OPT23
    if %%c EQU 24 call :OPT24
    if %%c EQU 25 call :OPT25
    if %%c EQU 26 call :OPT26
)

echo.
echo ע�⣺�����Ż���Ҫ����ϵͳ������ȫ��Ч
echo.
pause
goto custom_optimize

:: �����Ǹ����Ż�������ʵ��
:OPT1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�UAC����Ϊ�Ӳ�֪ͨ
goto :EOF

:OPT2
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t REG_DWORD /d 0 /f >nul
echo [��] ���������ù���Ա�˻��Ĺ�������ģʽ
goto :EOF

:OPT3
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableSecureUIAPaths" /t REG_DWORD /d 1 /f >nul
echo [��] ��������ȫ·���µ�UIAccess����
goto :EOF

:OPT4
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f >nul
echo [��] ����UIAccess�ڷǰ�ȫ����������
goto :EOF

:OPT5
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�SmartScreenӦ��ɸѡ��
goto :EOF

:OPT6
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "LowRiskFileTypes" /t REG_SZ /d ".exe;.bat;.cmd" /f >nul
echo [��] �ѹرմ򿪳���İ�ȫ����
goto :EOF

:OPT7
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f >nul
sc config WinDefend start= disabled >nul
sc stop WinDefend >nul
echo [��] �ѽ���Windows Defender
goto :EOF

:OPT8
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�Ĭ�Ϲ���
goto :EOF

:OPT9
netsh advfirewall set allprofiles state off >nul
echo [��] �ѹرշ���ǽ
goto :EOF

:OPT10
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictAnonymous" /t REG_DWORD /d 1 /f >nul
echo [��] ������SAM�˻�������ö��
goto :EOF

:OPT11
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "AllowInsecureGuestAuth" /t REG_DWORD /d 1 /f >nul
echo [��] �����ò���ȫ��������¼
goto :EOF

:OPT12
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�Զ��Э��
goto :EOF

:OPT13
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center" /v "Notifications_Disable" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ð�ȫ��������֪ͨ
goto :EOF

:OPT14
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Features" /v "TamperProtection" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Defender�۸ı���
goto :EOF

:OPT15
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d 0 /f >nul
echo [��] UAC����Ա����ʾֱ������
goto :EOF

:OPT16
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ð�ȫ������ʾ
goto :EOF

:OPT17
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f >nul
echo [��] �ѽ���SmartScreen���߷���
goto :EOF

:OPT18
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 0 /f >nul
bcdedit /set hypervisorlaunchtype off >nul 2>&1
echo [��] �ѽ��û������⻯�İ�ȫ��(VBS)
goto :EOF

:OPT19
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Policy" /v "VerifiedAndReputablePolicyState" /t REG_DWORD /d 0 /f >nul
echo [��] �ѹر�WDӦ�ó������(WDAC)
goto :EOF

:OPT20
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��÷��˵İ�ȫ֪ͨ
goto :EOF

:OPT21
sc config wscsvc start= disabled >nul
sc stop wscsvc >nul
echo [��] �ѽ��ð�ȫ���ķ���
goto :EOF

:OPT22
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ����ڴ�������(VBS)
goto :EOF

:OPT23
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnablePlatformSecurity" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Windowsƽ̨�����Ʊ�
goto :EOF

:OPT24
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableAmsi" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���AMSI
goto :EOF

:OPT25
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ô���������
goto :EOF

:OPT26
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f >nul
echo [��] ����ȫ����UAC
goto :EOF


::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ��˽����
::-------------------------------------------------------------------------------------------
:yinsi

cls
echo.===============================================================================
echo.                    ZyperWin++ - ��˽����
echo.===============================================================================
echo.
echo ��ѡ��ҪӦ�õ���˽���ã��ɶ�ѡ���ÿո�ָ�����
echo.
echo   [ 1] ����ҳ��Ԥ�⹦��
echo   [ 2] ���ÿ�ʼ��Ļ����
echo   [ 3] ���û�ռ�
echo   [ 4] ����Ӧ����������
echo   [ 5] ���ù���ʶ��
echo   [ 6] ����Ӧ�÷����ļ�ϵͳ
echo   [ 7] ����Ӧ�÷����ĵ�
echo   [ 8] ����Ӧ�÷�������
echo   [ 9] ����Ӧ�÷�����ϵ��
echo   [10] ����Ӧ�÷�����Ƶ
echo   [11] ������վ���Ը���
echo   [12] ����Windows��ӭ����
echo   [13] ���÷���Ƶ��
echo   [14] ������������ռ�
echo   [15] ����д��ϰ�߸���
echo   [16] ��������Ӧ�ý���
echo   [17] ����Bing�������
echo   [18] ����ͨѶ¼�ռ�
echo   [19] ���ü����ı��ռ�
echo   [20] ����������ʷ
echo   [21] ����������Ӧ�ð�װ
echo   [22] �����Զ������ȵ�
echo   [23] �����������ݸ��Ի�
echo   [24] ���ü������
echo   [25] ����Ԥ��װӦ��
echo   [26] ����.NETң��
echo   [27] ����PowerShellң��
echo   [28] ����ң�����
echo   [29] ���ô��󱨸�(WER)
echo   [30] ������������(Cortana)
echo   [31] ����λ�÷���
echo   [32] �������������ռ�
echo   [33] ���ö�����
echo   [34] ����Wi-Fi��֪
echo   [35] ���ò����¼��
echo   [36] ���û����Դ
echo   [37] ����Ӧ�÷����˻���Ϣ
echo   [38] ����Ӧ�÷����˶�����
echo   [39] ����Ӧ�÷��ʵ绰
echo   [40] ����Ӧ�÷��������豸
echo   [41] ����Ӧ�÷���ͬ��
echo   [42] ����Ӧ�÷��������Ϣ
echo   [43] ����Ӧ�÷���ͨ����¼
echo   [44] ����Ӧ�÷��ʵ����ʼ�
echo   [45] ����Ӧ�÷�������
echo   [46] ����Ӧ�÷�����Ϣ
echo.
echo   [A] Ӧ�������Ż�
echo   [X] ����
echo.
set /p "choices=������ѡ����: 1 3 5 �� A��: "

if "%choices%"=="" goto custom_optimize
if /i "%choices%"=="X" goto custom_optimize

:: ����ȫѡ
if /i "%choices%"=="A" (
    set "choices=1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46"
)

:: �������ѡ��
for %%c in (%choices%) do (
    if %%c EQU 1 call :OPT1
    if %%c EQU 2 call :OPT2
    if %%c EQU 3 call :OPT3
    if %%c EQU 4 call :OPT4
    if %%c EQU 5 call :OPT5
    if %%c EQU 6 call :OPT6
    if %%c EQU 7 call :OPT7
    if %%c EQU 8 call :OPT8
    if %%c EQU 9 call :OPT9
    if %%c EQU 10 call :OPT10
    if %%c EQU 11 call :OPT11
    if %%c EQU 12 call :OPT12
    if %%c EQU 13 call :OPT13
    if %%c EQU 14 call :OPT14
    if %%c EQU 15 call :OPT15
    if %%c EQU 16 call :OPT16
    if %%c EQU 17 call :OPT17
    if %%c EQU 18 call :OPT18
    if %%c EQU 19 call :OPT19
    if %%c EQU 20 call :OPT20
    if %%c EQU 21 call :OPT21
    if %%c EQU 22 call :OPT22
    if %%c EQU 23 call :OPT23
    if %%c EQU 24 call :OPT24
    if %%c EQU 25 call :OPT25
    if %%c EQU 26 call :OPT26
    if %%c EQU 27 call :OPT27
    if %%c EQU 28 call :OPT28
    if %%c EQU 29 call :OPT29
    if %%c EQU 30 call :OPT30
    if %%c EQU 31 call :OPT31
    if %%c EQU 32 call :OPT32
    if %%c EQU 33 call :OPT33
    if %%c EQU 34 call :OPT34
    if %%c EQU 35 call :OPT35
    if %%c EQU 36 call :OPT36
    if %%c EQU 37 call :OPT37
    if %%c EQU 38 call :OPT38
    if %%c EQU 39 call :OPT39
    if %%c EQU 40 call :OPT40
    if %%c EQU 41 call :OPT41
    if %%c EQU 42 call :OPT42
    if %%c EQU 43 call :OPT43
    if %%c EQU 44 call :OPT44
    if %%c EQU 45 call :OPT45
    if %%c EQU 46 call :OPT46
)

echo.
pause
goto custom_optimize


:: �����Ǹ������ú�����ʵ��

:OPT1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AllowPagePrediction" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���ҳ��Ԥ�⹦��
goto :EOF

:OPT2
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ÿ�ʼ��Ļ����
goto :EOF

:OPT3
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��û�ռ�
goto :EOF

:OPT4
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Ӧ����������
goto :EOF

:OPT5
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ù���ʶ��
goto :EOF

:OPT6
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷����ļ�ϵͳ
goto :EOF

:OPT7
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷����ĵ�
goto :EOF

:OPT8
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷�������
goto :EOF

:OPT9
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷�����ϵ��
goto :EOF

:OPT10
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷�����Ƶ
goto :EOF

:OPT11
reg add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ�����վ���Ը���
goto :EOF

:OPT12
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableFirstRunAnimate" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���Windows��ӭ����
goto :EOF

:OPT13
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��÷���Ƶ��
goto :EOF

:OPT14
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�����������ռ�
goto :EOF

:OPT15
reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "Inking&TypingPersonalization" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���д��ϰ�߸���
goto :EOF

:OPT16
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ�������Ӧ�ý���
goto :EOF

:OPT17
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���Bing�������
goto :EOF

:OPT18
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���ͨѶ¼�ռ�
goto :EOF

:OPT19
reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "Inking&TypingPersonalization" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ü����ı��ռ�
goto :EOF

:OPT20
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���������ʷ
goto :EOF

:OPT21
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���������Ӧ�ð�װ
goto :EOF

:OPT22
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ����Զ������ȵ�
goto :EOF

:OPT23
reg add "HKEY_CURRENT_USER\Software\Microsoft\Personalization\Settings" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ����������ݸ��Ի�
goto :EOF

:OPT24
reg add "HKEY_CURRENT_USER\Software\Microsoft\Input\Settings" /v "EnableTypingInsights" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ü������
goto :EOF

:OPT25
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "DisablePreInstalledApps" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���Ԥ��װӦ��
goto :EOF

:OPT26
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DisableNetFrameworkTelemetry" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���.NETң��
goto :EOF

:OPT27
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell" /v "EnablePowerShellTelemetry" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���PowerShellң��
goto :EOF

:OPT28
sc config "DiagTrack" start= disabled >nul
sc stop "DiagTrack" >nul
echo [��] �ѽ���ң�����
goto :EOF

:OPT29
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ô��󱨸�(WER)
goto :EOF

:OPT30
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsActivateWithVoice" /t REG_DWORD /d 2 /f >nul
echo [��] �ѽ�����������(Cortana)
goto :EOF

:OPT31
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���λ�÷���
goto :EOF

:OPT32
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ������������ռ�
goto :EOF

:OPT33
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ö�����
goto :EOF

:OPT34
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\Local" /v "fBlockNonDomain" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ���Wi-Fi��֪
goto :EOF

:OPT35
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\ProblemReports" /v "DisableProblemReports" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ò����¼��
goto :EOF

:OPT36
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d 2 /f >nul
echo [��] �ѽ��û����Դ
goto :EOF

:OPT37
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷����˻���Ϣ
goto :EOF

:OPT38
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷����˶�����
goto :EOF

:OPT39
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷��ʵ绰
goto :EOF

:OPT40
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷��������豸
goto :EOF

:OPT41
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\sync" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷���ͬ��
goto :EOF

:OPT42
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷��������Ϣ
goto :EOF

:OPT43
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷���ͨ����¼
goto :EOF

:OPT44
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷��ʵ����ʼ�
goto :EOF

:OPT45
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷�������
goto :EOF

:OPT46
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chatMessage" /v "Value" /t REG_SZ /d "Deny" /f >nul
echo [��] �ѽ���Ӧ�÷�����Ϣ
goto :EOF


::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ���/��Դ������
::-------------------------------------------------------------------------------------------
:rizhi

cls
echo.===============================================================================
echo.                    ZyperWin++ - ��־����
echo.===============================================================================
echo.
echo ��ѡ��Ҫ���õ���־���ã��ɶ�ѡ���ÿո�ָ�����
echo.
echo   [ 1] ���������ջ��־
echo   [ 2] ���ø��½�ѹģ����־
echo   [ 3] ���ô��󱨸���־
echo   [ 4] ���������ջ�ļ�����
echo   [ 5] ���ñ���ʱд�������Ϣ
echo   [ 6] �����˻���¼��־����
echo   [ 7] ����WfpDiag.ETL��־
echo   [ 8] ����д�������Ϣ
echo   [ 9] ���ý��¼�д��ϵͳ��־
echo.
echo   [A] Ӧ�������Ż�
echo   [X] ����
echo.
set /p "choices=������ѡ����: 1 3 5 �� A��: "

if "%choices%"=="" goto custom_optimize
if /i "%choices%"=="X" goto custom_optimize

:: ����ȫѡ
if /i "%choices%"=="A" (
    set "choices=1 2 3 4 5 6 7 8 9"
)

:: �������ѡ��
for %%c in (%choices%) do (
    if %%c EQU 1 call :OPT1
    if %%c EQU 2 call :OPT2
    if %%c EQU 3 call :OPT3
    if %%c EQU 4 call :OPT4
    if %%c EQU 5 call :OPT5
    if %%c EQU 6 call :OPT6
    if %%c EQU 7 call :OPT7
    if %%c EQU 8 call :OPT8
    if %%c EQU 9 call :OPT9
)

echo.
echo ע�⣺����������Ҫ����ϵͳ������ȫ��Ч
echo.
pause
goto custom_optimize

:: �����Ǹ������ú�����ʵ��
:OPT1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-CBS/Debug" /v "Enabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��������ջ��־
goto :EOF

:OPT2
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\Logging" /v "EnableLog" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ø��½�ѹģ����־
goto :EOF

:OPT3
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ô��󱨸���־
goto :EOF

:OPT4
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "BackupRegistry" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��������ջ�ļ�����
goto :EOF

:OPT5
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "CrashDumpEnabled" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ��ñ���ʱд�������Ϣ
goto :EOF

:OPT6
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableLogonCacheDisplay" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ����˻���¼��־����
goto :EOF

:OPT7
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BFE\Diagnostics" /v "EnableLog" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���WfpDiag.ETL��־
goto :EOF

:OPT8
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Debug Print Filter" /v "DEFAULT" /t REG_DWORD /d 0 /f >nul
echo [��] �ѽ���д�������Ϣ
goto :EOF

:OPT9
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Windows" /v "NoEventLog" /t REG_DWORD /d 1 /f >nul
echo [��] �ѽ��ý��¼�д��ϵͳ��־
goto :EOF


::-------------------------------------------------------------------------------------------
:: ZyperWin++ - �������Ż�
::-------------------------------------------------------------------------------------------
:fuwuxiang

cls
echo.===============================================================================
echo.                    ZyperWin++ - �������Ż�
echo.===============================================================================
echo.
echo ע�⣺�˹��̿��ܴ˹��̿�����Ҫ������ʱ��ʱ�䣬�����ĵȴ�...
echo.

:: �����Ż� - ���ò���Ҫ�ķ���
echo ���ڽ��ò�ֹͣ�Ǳ�Ҫ����...
echo.

:: ��ϸ��ٷ���
sc config DiagTrack start= disabled >nul
sc stop DiagTrack >nul 2>&1
echo [��] �ѽ���: DiagTrack (��ϸ��ٷ���)

:: SuperFetch����
sc config SysMain start= disabled >nul
sc stop SysMain >nul 2>&1
echo [��] �ѽ���: SysMain (SuperFetch����)

:: Windows��������
sc config WSearch start= disabled >nul
sc stop WSearch >nul 2>&1
echo [��] �ѽ���: WSearch (Windows��������)

:: Windows���·���
sc config UsoSvc start= disabled >nul
sc stop UsoSvc >nul 2>&1
echo [��] �ѽ���: UsoSvc (Windows���·���)

:: �ֲ�ʽ���Ӹ��ٷ���
sc config TrkWks start= disabled >nul
sc stop TrkWks >nul 2>&1
echo [��] �ѽ���: TrkWks (�ֲ�ʽ���Ӹ��ٷ���)

:: Windows Defender����
sc config WinDefend start= disabled >nul
sc stop WinDefend >nul 2>&1
echo [��] �ѽ���: WinDefend (Windows Defender����)

:: ��Ϸ���
sc config diagsvc start= disabled >nul
sc stop diagsvc >nul 2>&1
echo [��] �ѽ���: diagsvc (��Ϸ���)

:: ��ϲ��Է���
sc config DPS start= disabled >nul
sc stop DPS >nul 2>&1
echo [��] �ѽ���: DPS (��ϲ��Է���)

:: ��Ϸ�������
sc config WdiServiceHost start= disabled >nul
sc stop WdiServiceHost >nul 2>&1
echo [��] �ѽ���: WdiServiceHost (��Ϸ�������)

:: ���ϵͳ����
sc config WdiSystemHost start= disabled >nul
sc stop WdiSystemHost >nul 2>&1
echo [��] �ѽ���: WdiSystemHost (���ϵͳ����)

:: ��ͼ����
sc config MapsBroker start= demand >nul
echo [��] �������ֶ�: MapsBroker (��ͼ����)

:: IP���ַ���
sc config iphlpsvc start= disabled >nul
sc stop iphlpsvc >nul 2>&1
echo [��] �ѽ���: iphlpsvc (IP���ַ���)

:: ��������ռ�������
sc config diagnosticshub.standardcollector.service start= disabled >nul
sc stop diagnosticshub.standardcollector.service >nul 2>&1
echo [��] �ѽ���: diagnosticshub.standardcollector.service (��������ռ���)

:: SMS·��������
sc config SmsRouter start= disabled >nul
sc stop SmsRouter >nul 2>&1
echo [��] �ѽ���: SmsRouter (SMS·��������)

:: ������������ַ���
sc config PcaSvc start= disabled >nul
sc stop PcaSvc >nul 2>&1
echo [��] �ѽ���: PcaSvc (�������������)

:: ShellӲ��������
sc config ShellHWDetection start= demand >nul
echo [��] �������ֶ�: ShellHWDetection (ShellӲ�����)

:: ϵͳ��������
sc config SgrmBroker start= disabled >nul
sc stop SgrmBroker >nul 2>&1
echo [��] �ѽ���: SgrmBroker (ϵͳ��������)

:: ����ƻ�����
sc config Schedule start= demand >nul
echo [��] �������ֶ�: Schedule (����ƻ�����)

:: Windows�¼��ռ�����
sc config Wecsvc start= disabled >nul
sc stop Wecsvc >nul 2>&1
echo [��] �ѽ���: Wecsvc (Windows�¼��ռ�����)

:: ��ȫ��������
sc config SecurityHealthService start= disabled >nul
sc stop SecurityHealthService >nul 2>&1
echo [��] �ѽ���: SecurityHealthService (��ȫ��������)

echo.
echo �������Ż������! �����������
echo.
echo ע�⣺����������Ҫ����ϵͳ������ȫ��Ч
echo.
pause
goto custom_optimize


::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ��������
::-------------------------------------------------------------------------------------------
:laji

cls
echo.===============================================================================
echo.                    ZyperWin++ - ��������
echo.===============================================================================
echo ����������ʱ�ļ��ͻ���...
echo.

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
goto custom_optimize


::-------------------------------------------------------------------------------------------
:: ZyperWin++ - Office ��װ��64λ��
::-------------------------------------------------------------------------------------------
:Office_install

cls
echo.===============================================================================
echo.                ZyperWin++ - Office ��װ��64λ��
echo.===============================================================================
echo.
echo.
echo.            [1]   ��װ Office 365 ������
echo.
echo.            [2]   ��װ Office 365 ȫ��
echo. 
echo.            [3]   ��װ Office LTSC 2024 ������
echo.
echo.            [4]   ��װ Office LTSC 2024 ȫ��
echo.
echo.            [5]   ��װ Office LTSC 2021 ������
echo.
echo.            [6]   ��װ Office LTSC 2021 ȫ��
echo.                             
echo.
echo.                             
echo.
echo.            [X]   ����
echo.
echo.===============================================================================
choice /C:123456X /N /M "���������ѡ�� ��"
if errorlevel 7 goto :MainMenu
if errorlevel 6 goto :21A
if errorlevel 5 goto :213
if errorlevel 4 goto :24A
if errorlevel 3 goto :243
if errorlevel 2 goto :365A
if errorlevel 1 goto :3653
::-------------------------------------------------------------------------------------------

::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ��װ Office 365 ������
::-------------------------------------------------------------------------------------------
:3653

cls
echo.===============================================================================
echo.                ZyperWin++ - ��װ Office 365 ������
echo.===============================================================================
echo.
echo ��������Office��װ�ļ����˹��̿�����Ҫ������ʱ�䣬����ʱ��ȡ������������...
echo.
@%~dp0bin\setup.exe /download 3653.xml
echo ���ڲ���Office���˹��̿�����Ҫ������ʱ�䣬����ʱ��ȡ������������...
echo.
@%~dp0bin\setup.exe /configure 3653.xml
echo.
echo Office�Ѱ�װ��ϣ������������
@rmdir /s /q "%~dp0bin\Office"
echo.
pause
goto MainMenu



::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ��װ Office 365 ȫ��
::-------------------------------------------------------------------------------------------
:365A

cls
echo.===============================================================================
echo.                ZyperWin++ - ��װ Office 365 ȫ��
echo.===============================================================================
echo.
echo ��������Office��װ�ļ����˹��̿�����Ҫ������ʱ�䣬����ʱ��ȡ������������...
echo.
@%~dp0bin\setup.exe /download 365A.xml
echo ���ڲ���Office���˹��̿�����Ҫ������ʱ�䣬����ʱ��ȡ������������...
echo.
@%~dp0bin\setup.exe /configure 365A.xml
echo.
echo Office�Ѱ�װ��ϣ������������
@rmdir /s /q "%~dp0bin\Office"
echo.
pause
goto MainMenu



::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ��װ LTSC 2024 ������
::-------------------------------------------------------------------------------------------
:243

cls
echo.===============================================================================
echo.                ZyperWin++ - ��װ Office LTSC 2024 ������
echo.===============================================================================
echo.
echo ��������Office��װ�ļ����˹��̿�����Ҫ������ʱ�䣬����ʱ��ȡ������������...
echo.
@%~dp0bin\setup.exe /download 243.xml
echo ���ڲ���Office���˹��̿�����Ҫ������ʱ�䣬����ʱ��ȡ������������...
echo.
@%~dp0bin\setup.exe /configure 243.xml
echo.
echo Office�Ѱ�װ��ϣ������������
@rmdir /s /q "%~dp0bin\Office"
echo.
pause
goto MainMenu



::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ��װ Office LTSC 2024 ȫ��
::-------------------------------------------------------------------------------------------
:24A

cls
echo.===============================================================================
echo.                ZyperWin++ - ��װ Office LTSC 2024 ȫ��
echo.===============================================================================
echo.
echo ��������Office��װ�ļ����˹��̿�����Ҫ������ʱ�䣬����ʱ��ȡ������������...
echo.
@%~dp0bin\setup.exe /download 24A.xml
echo ���ڲ���Office���˹��̿�����Ҫ������ʱ�䣬����ʱ��ȡ������������...
echo.
@%~dp0bin\setup.exe /configure 24A.xml
echo.
echo Office�Ѱ�װ��ϣ������������
@rmdir /s /q "%~dp0bin\Office"
echo.
pause
goto MainMenu



::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ��װ Office LTSC 2021 ������
::-------------------------------------------------------------------------------------------
:213

cls
echo.===============================================================================
echo.                ZyperWin++ - ��װ Office LTSC 2021 ������
echo.===============================================================================
echo.
echo ��������Office��װ�ļ����˹��̿��ܴ˹��̿�����Ҫ������ʱ��ʱ�䣬����ʱ��ȡ������������...
echo.
@%~dp0bin\setup.exe /download 213.xml
echo ���ڲ���Office���˹��̿��ܴ˹��̿�����Ҫ������ʱ��ʱ�䣬����ʱ��ȡ������������...
echo.
@%~dp0bin\setup.exe /configure 213.xml
echo.
echo Office�Ѱ�װ��ϣ������������
@rmdir /s /q "%~dp0bin\Office"
echo.
pause
goto MainMenu



::-------------------------------------------------------------------------------------------
:: ZyperWin++ - ��װ Office LTSC 2021 ȫ��
::-------------------------------------------------------------------------------------------
:21A

cls
echo.===============================================================================
echo.                ZyperWin++ - ��װ Office LTSC 2021 ȫ��
echo.===============================================================================
echo.
echo ��������Office��װ�ļ����˹��̿�����Ҫ������ʱ�䣬����ʱ��ȡ������������...
echo.
@%~dp0bin\setup.exe /download 21A.xml
echo ���ڲ���Office���˹��̿�����Ҫ������ʱ�䣬����ʱ��ȡ������������...
echo.
@%~dp0bin\setup.exe /configure 21A.xml
echo.
echo Office�Ѱ�װ��ϣ������������
@rmdir /s /q "%~dp0bin\Office"
echo.
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
echo �������ܼ���ϵͳ/Office���Ե�Ƭ��...
echo.
@%~dp0bin\HEU_KMS_Activator.exe /smart
echo.
echo ϵͳ/Office�Ѱ�װ������ϣ������������
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
echo.                             ZyperWin++ v1.0
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