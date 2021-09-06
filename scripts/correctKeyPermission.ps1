# Executar manualmente
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

New-Variable -Name Key -Value "D:\Jhanssen\Cursos\Stefanini\Zookeeper_Kafka\scripts\keys\vagrant"

Icacls $Key /c /t /Inheritance:d

Icacls $Key /c /t /grant:r $env:UserName:F
# Icacls $Key /c /t /grant:r $env:UserName:F
# start-process 'icacls.exe' -ArgumentList '$Key /grant:r $env:UserName:F /t'

Icacls $Key  /c /t /Remove Administrator "Authenticated Users" BUILTIN\Administrators BUILTIN Everyone System Users

Icacls $Key

# Remove Variable:
# Remove-Variable -Name Key