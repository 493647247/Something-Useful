@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
echo ���ڼ�����ԱȨ��...
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo ���ڻ�ȡ����ԱȨ��...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /b

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
:--------------------------------------  
echo ���й���ԱȨ��

:start
echo LogMeIn Hamachi ����ű� by chenjunyu19
echo 0: ���� Hamachi2Svc
echo 1: ֹͣ Hamachi2Svc �� LMIGuardianSvc ������ Hamachi ����������
echo 2: ������ִ�� 1 ��ִ�� 0
echo 3: ���� Hamachi2Svc �� LMIGuardianSvc ����������Ϊ �Զ�
echo 4: ���� Hamachi2Svc �� LMIGuardianSvc ����������Ϊ �ֶ�
set /p numis=���������֣�
if /i "%numis%"=="0" goto 0
if /i "%numis%"=="1" goto 1
if /i "%numis%"=="2" goto 1
if /i "%numis%"=="3" goto 3
if /i "%numis%"=="4" (goto 4) else (echo ��������&&goto start)

:0
sc start Hamachi2Svc
exit /b

:1
sc stop Hamachi2Svc
sc stop LMIGuardianSvc
netsh interface set interface name="Hamachi" admin=DISABLED
if /i "%numis%"=="2" goto 0
exit /b

:3
sc config Hamachi2Svc start= auto
sc config LMIGuardianSvc start= auto
exit /b

:4
sc config Hamachi2Svc start= demand
sc config LMIGuardianSvc start= demand
exit /b