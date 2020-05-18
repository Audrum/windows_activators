# Descripción en español

## windows_activators

Este es un proyecto de código abierto sobre activadores para Windows y Office escrito en batch y PowerShell. **Cada script se debe ejecutar con derechos de administrador**

## Office 2019

El script [O2019.cmd](https://github.com/Audrum/windows_activators/blob/master/O2019.cmd) está escrito en bacth y es para activar Office 2019, fue escrito siguiendo algunos parámetros de [msguides.com](https://msguides.com/) con algunas modificaciones. Solo se debe ejecutar y dejar que trabaje. Puede revisar el código y modificarlo. 

## Office 365

El script [O365.cmd](https://github.com/Audrum/windows_activators/blob/master/O365.cmd) está escrito en bacth y es para activar Office 365, fue escrito siguiendo algunos parámetros de [msguides.com](https://msguides.com/) con algunas modificaciones. Solo se debe ejecutar y dejar que trabaje. Puede revisar el código y modificarlo. 

## Windows 10

El script [W10.cmd](https://github.com/Audrum/windows_activators/blob/master/W10.cmd) es un archivo en batch que puede activar las siguiente versiones de Windows 10:

* Windows 10 Home
* Windows 10 Home Single Language
* Windows 10 Pro

También muestra un listado de seriales para cada versión de Windows 10 e incluso permite usar su propio serial en caso de tener uno. Solo es abrirlo y seguir las instrucciones. Puede revisar el código y modificarlo.


## Windows Multinstall

El script [multinstall.ps1](https://github.com/Audrum/windows_activators/blob/master/multinstall.ps1) está escrito en PowerShell para make un poco mas fácil y rápido el proceso post instalación de Windows 10, ayudando a instalar automáticamente software básico como:

* Google Chrome
* Firefox
* 7-zip
* Optionally Office 365

También tiene integrado el activador de Windows 10. Actualmente se está trabajando en integrar el activador de Office. La instalación del software se realiza instalando e invocando [Chocolatey](https://chocolatey.org/).

Antes de ejecutar el script debe asegurarse de que su pólitica de ejecución en PowerShell permita ejecutar scripts, si no es el caso, debe ejecutar el comando ``Set-ExecutionPolicy Unrestricted`` en PowerShell.

Para ejecutar el script, abra una sesión de PowerShell con **privilegios de administrador**, dentro de la sesión de PoweShell muévase hasta la ruta dónde está guardado el script y ejecutelo con el comando ``.\windows_multinstaler.ps1`` y siga las instrucciones. Puede revisar el código y modificarlo.

---
# English description

## windows_activators

This is a project about open source activators for windows and office written in batch and powershell. **You have to open each one with admin rights**

## Office 2019

The [O2019.cmd](https://github.com/Audrum/windows_activators/blob/master/O2019.cmd) file is a batch script for activate Office 2019, it was written following some instructions from [msguides.com](https://msguides.com/) with a few modifications. Just open it and let it work. You can review the code and feel free to modify it. 

## Office 365

The [O365.cmd](https://github.com/Audrum/windows_activators/blob/master/O365.cmd) file is a batch script for activate Office 365, it was written following some instructions from [msguides.com](https://msguides.com/) with a few modifications. Just open it and let it work. You can review the code and feel free to modify it. 

## Windows 10

The [W10.cmd](https://github.com/Audrum/windows_activators/blob/master/W10.cmd) file is a batch script that can activate the following flavors of Windows 10:

* Windows 10 Home
* Windows 10 Home Single Language
* Windows 10 Pro

Also it can show you a list of serials for each Windows 10 flavor and even use your own serial if you have one. Just open it and follow the on screen instructions. Feel free to review the code and modify it.


## Windows Multinstall

The [multinstall.ps1](https://github.com/Audrum/windows_activators/blob/master/multinstall.ps1) file is a PowerShell script to make a little bit easier and faster the Windows 10 after installation, helping installing automatically some basic tools such as: 

* Google Chrome
* Firefox
* 7-zip
* Optionally Office 365

Also includes the Windows 10 activator ported to PowerShell. Currently working in porting the Office activator. The installing of those programs is made installing and invoking [Chocolatey](https://chocolatey.org/).

Before execute the script be sure that your Execution Policy allows run PowerShell scripts, if not, you can execute the command ``Set-ExecutionPolicy Unrestricted`` on PowerShell.

To execute the script, run a PowerShell terminal with admin rights, move to the path where is downloaded the script and execute the script with the command ``.\windows_multinstaler.ps1`` and follow the instructions. Feel free to review the code and modify it.

