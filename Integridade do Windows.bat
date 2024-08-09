@echo off
set APP=Integridade do Windows
set AUTHOR=POMBO
set AVATAR=\Õ/
set MADE_BY=MADE BY:
set SPACE= 
set KEY=EWEP
echo %APP%%SPACE%%MADE_BY%%SPACE%%SPACE%%AUTHOR%%SPACE%%SPACE%%AVATAR%%SPACE%%KEY%
echo SCRIPT PARA RESTAURAR O WINDOWS!

powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Este script vai verificar a integridade dos arquivos do Windows e restaurar os arquivos que estiverem corrompidos! Clique em OK para iniciar!', 'Integridade do Windows', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}"


echo ******************** REPARARANDO O WINDOWS ********************
echo Verificando a integridade da imagem do Windows

DISM /Online /Cleanup-image /Restorehealth

echo Verificando a integridade dos arquivos do Windows

sfc /scannow

echo Verificando a integridade do HD/SSD

powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('A etapa seguinte verifica a integridade do HD / SSD e pode ser que o sistema precise reiniciar, salve seus documentos agora e clique em OK quando estiver pronto para prosseguir!', 'Integridade do Windows', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}"

chkdsk /r

pause

shutdown -r -t 10 -c "Reiniciando para concluir a operação!"

exit