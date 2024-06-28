@echo off

chcp 1252

color 0A

cls

title Exercitando Programação em BAT

:main

call:soma 10 5

:soma n1 n2

set /a res=%~1 * %~2

echo %res%

:end

pause>nul