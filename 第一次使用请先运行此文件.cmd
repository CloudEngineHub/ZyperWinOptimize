@echo ���ڽ���Ŀ¼���Defender����������
@powershell "try {$null = icim MSFT_MpPreference @{ExclusionPath = @('%~dp0'); Force = $True} Add -Namespace root/Microsoft/Windows/Defender -EA 1} catch {$host.SetShouldExit($_.Exception.HResult)}"
@echo �����ϣ���ر�Defender����4��ѡ��
@%~dp0bin\1.vbs
@pause
@echo ���ֶ���������Defender
@start /b "Defender_Control - TrustedInstaller" "%~dp0Bin\NSudoLG.exe" -U:T -P:E "%~dp0Bin\Defender_Control.exe"
@echo ���������ִ����һ������
@pause
@%~dp0Start.cmd