@ECHO OFF
color 6
Title WebHook Message Sender
SET /P _webhook= Please enter discord webhook:
:another
cls
SET /P _message= Please type message:
Set "STRING=send message: %_message%?"

  For /F %%A In ('"Prompt $H&For %%B In (1) Do Rem"') Do Set "BS=%%A"

  For /F Delims^=^ EOL^= %%A In ('"(CMD/U/CEcho=%STRING%)|Find /V """'
  ) Do Set/P "=a%BS%%%A"<Nul & PathPing 127.0.0.1 -n -q 1 -p 5 1>Nul
  
set /p answer=  (y/n):

if %answer% == y goto :Yes
if %answer% == n goto :no
:no
exit

:Yes
cls
curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"%_message%\"}" %_webhook%
TIMEOUT /T 1 /NOBREAK
cls

Set "STRING=message: %_message% was sent    "

  For /F %%A In ('"Prompt $H&For %%B In (1) Do Rem"') Do Set "BS=%%A"

  For /F Delims^=^ EOL^= %%A In ('"(CMD/U/CEcho=%STRING%)|Find /V """'
  ) Do Set/P "=a%BS%%%A"<Nul & PathPing 127.0.0.1 -n -q 1 -p 15 1>Nul
  
cls

  Set "STRING=Send Another?"

  For /F %%A In ('"Prompt $H&For %%B In (1) Do Rem"') Do Set "BS=%%A"

  For /F Delims^=^ EOL^= %%A In ('"(CMD/U/CEcho=%STRING%)|Find /V """'
  ) Do Set/P "=a%BS%%%A"<Nul & PathPing 127.0.0.1 -n -q 1 -p 25 1>Nul

set /p answer=  (y/n):

if %answer% == y goto :another
if %answer% == n goto :no

