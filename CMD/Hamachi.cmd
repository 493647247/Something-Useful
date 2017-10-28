@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
echo 正在检查管理员权限...
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo 正在获取管理员权限...
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
echo 已有管理员权限

:start
echo LogMeIn Hamachi 管理脚本 by chenjunyu19
echo 0: 启动 Hamachi2Svc
echo 1: 停止 Hamachi2Svc 和 LMIGuardianSvc 并禁用 Hamachi 网络适配器
echo 2: 重启：执行 1 后执行 0
echo 3: 更改 Hamachi2Svc 和 LMIGuardianSvc 的启动类型为 自动
echo 4: 更改 Hamachi2Svc 和 LMIGuardianSvc 的启动类型为 手动
set /p numis=请输入数字：
if /i "%numis%"=="0" goto 0
if /i "%numis%"=="1" goto 1
if /i "%numis%"=="2" goto 1
if /i "%numis%"=="3" goto 3
if /i "%numis%"=="4" (goto 4) else (echo 输入有误！&&goto start)

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