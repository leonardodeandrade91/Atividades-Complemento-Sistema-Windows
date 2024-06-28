@echo off

chcp 1252

title Backup em Pendrive

color 1E

cls

set /p opc=Deseja fazer o backup dos dados do pendrive na unidade F? [S/N] 

if /i %opc%==S (
cls
) else (
exit
)

if exist F: (
xcopy /s /y "C:\Aplicações\BAT Scripts" "F:\Aplicações\BAT Scripts"

xcopy /s /y "C:\Backgrounds" "F:\Backgrounds"

:: verificar quais pastas irão para backup
xcopy /s /y "C:\Projetos" "F:\Projetos"

rmdir /s /q "F:\Projetos\ASP Net"

rmdir /s /q "F:\Projetos\ASP Net"

rmdir /s /q "F:\Projetos\ASP Net"

rmdir /s /q "F:\Projetos\C"

rmdir /s /q "F:\Projetos\C#"

rmdir /s /q "F:\Projetos\C++"

rmdir /s /q "F:\Projetos\Git e Github"

rmdir /s /q "F:\Projetos\Java"

rmdir /s /q "F:\Projetos\Mobile Android"

rmdir /s /q "F:\Projetos\Objective-C"

rmdir /s /q "F:\Projetos\Packet Tracer"

rmdir /s /q "F:\Projetos\Perl"

rmdir /s /q "F:\Projetos\Powershell"

rmdir /s /q "F:\Projetos\Python"

rmdir /s /q "F:\Projetos\QT com C++"

rmdir /s /q "F:\Projetos\Ruby"

rmdir /s /q "F:\Projetos\Windows"

xcopy /s /y "C:\Users\eu\Documents" "F:\Documentos"

:: Ver problema com tamanho
rmdir /s /q "F:\Documentos\Filmes Não-Convertidos"

xcopy /s /y "C:\Users\eu\Pictures" "F:\Imagens"

xcopy /s /y "C:\Users\eu\Music" "F:\Músicas"

xcopy /s /y "C:\Users\eu\Videos" "F:\Vídeos"

:: Ver problema com tamanho
rmdir /s /q "F:\Documentos\Filmes"

cls

echo Operação Concluída com Êxito!
) else (
echo A Unidade F não existe! Insira o pendrive para backup e tente novamente!
)

pause>nul