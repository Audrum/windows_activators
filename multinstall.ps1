﻿if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
 if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
  $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
  Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
  Exit
 }
}

function Banner
{
    $lang = ([CultureInfo]::InstalledUICulture).Name
    if ($lang -like "es*")
    {
        Write-Host "====================" -ForegroundColor Green
        Write-Host "|    Creado por    |" -ForegroundColor Green
        Write-Host "|      A. B.       |" -ForegroundColor Green
        Write-Host "|   t.me/audrum    |" -ForegroundColor Green
        Write-Host "====================" -ForegroundColor Green
        Write-Host ""
        Write-Host "Probado solo en Windows 10" -ForegroundColor Magenta    
    }

    else {

        Write-Host "====================" -ForegroundColor Green
        Write-Host "|    Created by    |" -ForegroundColor Green
        Write-Host "|      A. B.       |" -ForegroundColor Green
        Write-Host "|   t.me/audrum    |" -ForegroundColor Green
        Write-Host "====================" -ForegroundColor Green
        Write-Host ""
        Write-Host "Tested only in Windows 10" -ForegroundColor Magenta
    }  
}

function ChocoEnvironment
{
    $lang = ([CultureInfo]::InstalledUICulture).Name
    
    if ($lang -like "es*")
    {
        Write-Host "Verificando entorno..." -ForegroundColor Yellow
    
        $testchoco = choco -v

        if ($testchoco) 
        {
            Write-Host "Ya tiene instalado chocolatey versión $testchoco" -ForegroundColor Green
            }

         else 
         {
            Write-Host "Preparando entorno..." -ForegroundColor Magenta
            Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
            refreshenv
            Write-Host "Entorno listo. Se instaló chocolatey versión $testchoco" -ForegroundColor Magenta
            Start-Sleep -s 3
            }   
    }

    else {

        Write-Host "Checking environment..." -ForegroundColor Yellow
    
        $testchoco = choco -v

        if ($testchoco) 
        {
            Write-Host "Chocolatey is already installed, version $testchoco" -ForegroundColor Green
            }

         else 
         {
            Write-Host "Getting ready environment..." -ForegroundColor Magenta
            Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
            refreshenv
            Write-Host "Chocolatey version $testchoco has been installed" -ForegroundColor Magenta
            Start-Sleep -s 3
            }
    }

}


function InstallGoogleChrome
{
    $lang = ([CultureInfo]::InstalledUICulture).Name
    
    if ($lang -like "es*")
    {
        if (-not(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe"))
        {
            $title    = "Instalar Google Chrome"
            $question = "Google Chrome no está instalado ¿desea instalarlo?"

            $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Si"))
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

            $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)

            if ($decision -eq 0) 
            {
                Write-Host "Instalando Google Chrome..." -ForegroundColor Yellow
                cinst GoogleChrome -y
                Write-Host "Google Chrome se ha instalado" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            } 
            else 
            {
                Write-Host 'Ha decidido no instalar Google Chrome' -ForegroundColor Yellow
                Write-Host ""
                Start-Sleep -s 3
            }
        }

        else
        {
            Write-Host "Google Chrome ya está instalado, omitiendo instalación" -ForegroundColor Green
            Write-Host ""
            Start-Sleep -s 3
        }
    }

    else{

        if (-not(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe"))
        {
            $title    = "Install Google Chrome"
            $question = "Google Chrome is not installed, install?"

            $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Yes"))
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

            $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)

            if ($decision -eq 0) 
            {
                Write-Host "Installing Google Chrome..." -ForegroundColor Yellow
                cinst GoogleChrome -y
                Write-Host "Google Chrome has been installed" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            } 
            else 
            {
                Write-Host 'You have chosen not to install Google Chrome' -ForegroundColor Yellow
                Write-Host ""
                Start-Sleep -s 3
            }
        }

        else
        {
            Write-Host "Google Chrome is already installed, omiting installation" -ForegroundColor Green
            Write-Host ""
            Start-Sleep -s 3
        }
    }
    
}

function InstallFirefox
{
    $lang = ([CultureInfo]::InstalledUICulture).Name
    
    if ($lang -like "es*")
    {
        if (-not(Test-Path "$env:ProgramFiles\Mozilla Firefox\firefox.exe"))
        {
            $title    = "Instalar Firefox"
            $question = "Firefox no está instalado ¿desea instalarlo?"

            $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Si"))
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

            $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)

            if ($decision -eq 0) 
            {
                Write-Host "Instalando Firefox..." -ForegroundColor Yellow
                cinst Firefox -y
                Write-Host "Firefox se ha instalado" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            } 
            else 
            {
                Write-Host "Ha decidido no instalar Firefox" -ForegroundColor Yellow
                Write-Host ""
                Start-Sleep -s 3
            }
        }   

        else    
        {
            Write-Host "Firefox ya está instalado, omitiendo instalación" -ForegroundColor Green
            Write-Host ""
            Start-Sleep -s 3
        }
    }
    
    else{
        
        if (-not(Test-Path "$env:ProgramFiles\Mozilla Firefox\firefox.exe"))
        {
            $title    = "Install Firefox"
            $question = "Firefox is not installed, install?"

            $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Yes"))
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

            $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)

            if ($decision -eq 0) 
            {
                Write-Host "Installing Firefox..." -ForegroundColor Yellow
                cinst Firefox -y
                Write-Host "Firefox has been installed" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            } 

            else 
            {
                Write-Host "You have chosen not to install Firefox" -ForegroundColor Yellow
                Write-Host ""
                Start-Sleep -s 3
            }
        }

        else
        {
            Write-Host "Firefox is already installed, omiting installation" -ForegroundColor Green
            Write-Host ""
            Start-Sleep -s 3
        }
    }

}

function Install7-zip
{
    $lang = ([CultureInfo]::InstalledUICulture).Name
    
    if ($lang -like "es*")
    {
        if (-not(Test-Path "$env:ProgramFiles\7-Zip\7zFM.exe"))
        {
            $title    = "Instalar 7-zip"
            $question = "7-zip no está instalado ¿desea instalarlo?"

            $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Si"))
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

            $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)

            if ($decision -eq 0) 
            {
                Write-Host "Instalando 7-zip..." -ForegroundColor Yellow
                cinst 7zip -y
                Write-Host "7-zip se ha instalado" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            } 

            else 
            {
                Write-Host "Ha decidido no instalar 7-zip" -ForegroundColor Yellow
                Write-Host ""
                Start-Sleep -s 3
            }
        }

        else
        {
            Write-Host "7-zip ya está instalado, omitiendo instalación" -ForegroundColor Green
            Write-Host ""
            Start-Sleep -s 3
        }
    }

    else{

        if (-not(Test-Path "$env:ProgramFiles\7-Zip\7zFM.exe"))
        {
            $title    = "Install 7-zip"
            $question = "7-zip is not installed, install?"

            $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Yes"))
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

            $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
            if ($decision -eq 0) 
            {
                Write-Host "Installing 7-zip..." -ForegroundColor Yellow
                cinst 7zip -y
                Write-Host "7-zip has been installed" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            } 
            else 
            {
                Write-Host "You have chosen not to install 7-zip" -ForegroundColor Yellow
                Write-Host ""
                Start-Sleep -s 3
            }
        }

        else
        {
            Write-Host "7-zip is already installed, omiting installation" -ForegroundColor Green
            Write-Host ""
            Start-Sleep -s 3
        }
    }
    
}

function InstallWinRAR
{
    $lang = ([CultureInfo]::InstalledUICulture).Name
    
    if ($lang -like "es*")
    {
        if (-not(Test-Path "$env:ProgramFiles\WinRAR\WinRAR.exe"))
        {
            $title    = "Instalar WinRAR"
            $question = "WinRAR no está instalado ¿desea instalarlo?"

            $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Si"))
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

            $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
            if ($decision -eq 0) 
            {
                Write-Host "Instalando WinRAR..." -ForegroundColor Yellow
                cinst winrar -y
                Write-Host "WinRAR se ha instalado" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            } 
            else 
            {
                Write-Host "Ha decidido no instalar WinRAR" -ForegroundColor Yellow
                Write-Host ""
                Start-Sleep -s 3
            }
        }

        else
        {
            Write-Host "WinRAR ya está instalado, omitiendo instalación" -ForegroundColor Green
            Write-Host ""
            Start-Sleep -s 3
        }
    }

    else {

        if (-not(Test-Path "$env:ProgramFiles\WinRAR\WinRAR.exe"))
        {
            $title    = "Install WinRAR"
            $question = "WinRAR is not installed, install?"

            $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Yes"))
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

            $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
            if ($decision -eq 0) 
            {
                Write-Host "Installing WinRAR..." -ForegroundColor Yellow
                cinst winrar -y
                Write-Host "WinRAR has been installed" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            } 
            else 
            {
                Write-Host "You have chosen not to install WinRAR" -ForegroundColor Yellow
                Write-Host ""
                Start-Sleep -s 3
            }
        }

        else
        {
            Write-Host "WinRAR is already installed, omiting installation" -ForegroundColor Green
            Write-Host ""
            Start-Sleep -s 3
        }
    }
    
}

function InstallPDF24
{
    $lang = ([CultureInfo]::InstalledUICulture).Name
    
    if ($lang -like "es*")
    {
        if (-not(Test-Path "$env:ProgramFiles\PDF24\pdf24.exe"))
        {
            $title    = "Instalar PDF24"
            $question = "No tiene un visor PDF instalado ¿desea instalarlo?"

            $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Si"))
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

            $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
            if ($decision -eq 0) 
            {
                Write-Host "Instalando PDF24..." -ForegroundColor Yellow
                cinst pdf24 -y
                Write-Host "PDF24 se ha instalado" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            } 
            else 
            {
                Write-Host "Ha decidido no instalar PDF24" -ForegroundColor Yellow
                Write-Host ""
                Start-Sleep -s 3
            }
        }

        else
        {
            Write-Host "PDF24 ya está instalado, omitiendo instalación" -ForegroundColor Green
            Write-Host ""
            Start-Sleep -s 3
        }
    }

    else {

        if (-not(Test-Path "$env:ProgramFiles\PDF24\pdf24.exe"))
        {
            $title    = "Install PDF24"
            $question = "PDF24 is not installed, install?"

            $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Yes"))
            $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

            $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
            if ($decision -eq 0) 
            {
                Write-Host "Installing PDF24..." -ForegroundColor Yellow
                cinst pdf24 -y
                Write-Host "PDF24 has been installed" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            } 
            else 
            {
                Write-Host "You have chosen not to install PDF24" -ForegroundColor Yellow
                Write-Host ""
                Start-Sleep -s 3
            }
        }

        else
        {
            Write-Host "PDF24 is already installed, omiting installation" -ForegroundColor Green
            Write-Host ""
            Start-Sleep -s 3
        }
    }
    
}

function InstallOffice
{
    $lang = ([CultureInfo]::InstalledUICulture).Name
    
    if ($lang -like "es*")
    {
        $title    = "Instalar Office"
        $question = "¿Descargar e instalar Office?"

        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Si"))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
        if ($decision -eq 0) 
        {
            Write-Host "Iniciando descarga e instalación de Office Pro Plus..." -ForegroundColor Yellow
            cinst office365proplus -y
            Write-Host "Instalación  finalizada" -ForegroundColor Green
            Start-Sleep -s 3
            Write-Host ""
        } 

        else 
        {
            Write-Host "Ha decidido no instalar Office" -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -s 3
        }
    }

    else {

        $title    = "Install Office"
        $question = "Download and install Office?"

        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Yes"))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
        if ($decision -eq 0) 
        {
            Write-Host "Donwloading Office Pro Plus..." -ForegroundColor Yellow
            cinst office365proplus -y
            Write-Host "Installation finished" -ForegroundColor Green
            Start-Sleep -s 3
            Write-Host ""
        } 

        else 
        {
            Write-Host "You have chosen no to install Office" -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -s 3
        }
    }
    
}

function InstallProject
{
    $lang = ([CultureInfo]::InstalledUICulture).Name
    
    if ($lang -like "es*")
    {
        $title    = "Instalar Microsoft Project"
        $question = "¿Descargar e instalar Microsoft Project 2019?"

        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Si"))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
        if ($decision -eq 0) 
        {
            $arch = [System.Environment]::Is64BitOperatingSystem

            if ($arch -like "True")
            {
                Write-Host "Iniciando descarga e instalación de Microsoft Project 2019..." -ForegroundColor Yellow
                cinst microsoft-office-deployment --params="'/64bit /Product:ProjectPro2019Volume'" --force -y
                Write-Host "Instalación  finalizada" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            }

            else {
                Write-Host "Iniciando descarga e instalación de Microsoft Project 2019..." -ForegroundColor Yellow
                cinst microsoft-office-deployment --params="'/Product:ProjectPro2019Volume'" --force -y
                Write-Host "Instalación  finalizada" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            }
        } 

        else 
        {
            Write-Host "Ha decidido no instalar Microsoft Project 2019" -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -s 3
        }
    }

    else {

        $title    = "Install Microsoft Project"
        $question = "Download and install Microsoft Project 2019?"

        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Yes"))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
        if ($decision -eq 0) 
        {
            $arch = [System.Environment]::Is64BitOperatingSystem

            if ($arch -like "True")
            {
                Write-Host "Downloading and installing Microsoft Project 2019..." -ForegroundColor Yellow
                cinst microsoft-office-deployment --params="'/64bit /Product:ProjectPro2019Volume'" --force -y
                Write-Host "Installation completed" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            }

            else {
                Write-Host "Downloading and installing Microsoft Project 2019..." -ForegroundColor Yellow
                cinst microsoft-office-deployment --params="'/Product:ProjectPro2019Volume'" --force -y
                Write-Host "Installation completed" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            }
        } 

        else 
        {
            Write-Host "You have chosen no to install Microsoft Project 2019" -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -s 3
        }
    }
    
}

function InstallVisio
{
    $lang = ([CultureInfo]::InstalledUICulture).Name
    
    if ($lang -like "es*")
    {
        $title    = "Instalar Microsoft Visio"
        $question = "¿Descargar e instalar Microsoft Visio 2019?"

        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Si"))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
        if ($decision -eq 0) 
        {
            $arch = [System.Environment]::Is64BitOperatingSystem

            if ($arch -like "True")
            {
                Write-Host "Iniciando descarga e instalación de Microsoft Visio 2019..." -ForegroundColor Yellow
                cinst microsoft-office-deployment --params="'/64bit /Product:VisioPro2019Volume'" --force -y
                Write-Host "Instalación  finalizada" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            }

            else {
                Write-Host "Iniciando descarga e instalación de Microsoft Visio 2019..." -ForegroundColor Yellow
                cinst microsoft-office-deployment --params="'/Product:VisioPro2019Volume'" --force -y
                Write-Host "Instalación  finalizada" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            }
        } 

        else 
        {
            Write-Host "Ha decidido no instalar Microsoft Visio 2019" -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -s 3
        }
    }

    else {

        $title    = "Install Microsoft Visio"
        $question = "Download and install Microsoft Visio 2019?"

        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Yes"))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
        if ($decision -eq 0) 
        {
            $arch = [System.Environment]::Is64BitOperatingSystem

            if ($arch -like "True")
            {
                Write-Host "Downloading and installing Microsoft Visio 2019..." -ForegroundColor Yellow
                cinst microsoft-office-deployment --params="'/64bit /Product:VisioPro2019Volume'" --force -y
                Write-Host "Installation completed" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            }

            else {
                Write-Host "Downloading and installing Microsoft Visio 2019..." -ForegroundColor Yellow
                cinst microsoft-office-deployment --params="'/Product:VisioPro2019Volume'" --force -y
                Write-Host "Installation completed" -ForegroundColor Green
                Start-Sleep -s 3
                Write-Host ""
            }
        } 

        else 
        {
            Write-Host "You have chosen no to install Microsoft Visio 2019" -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -s 3
        }
    }
    
}

function ActivateWindows10
{
    $lang = ([CultureInfo]::InstalledUICulture).Name
    
    if ($lang -like "es*")
    {
        $title    = "Activar Windows 10"
        $question = "¿Desea ejecutar la activación de Windows 10?"

        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Si"))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
        if ($decision -eq 0) 
        {
            Write-Host "Detectando la versión de Windows..." -ForegroundColor Yellow
            $windows = (Get-WmiObject Win32_OperatingSystem).Caption
            Write-Host "Actualmente tiene" $windows "instalado" -ForegroundColor Green
            Start-Sleep -s 3
            Write-Host "Activando..." -ForegroundColor Yellow
            Start-Sleep -s 2

            switch ($windows)
            {
                'Microsoft Windows 10 Home Single Language'
                {
                    Write-Host "Instalando licencia..." -ForegroundColor Yellow
                    slmgr /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
                    Start-Sleep -s 2
                    Write-Host "Licencia instalada" -ForegroundColor Green
                    Write-Host "Conectando con el servidor de activación..." -ForegroundColor Yellow
                    slmgr /skms kms8.msguides.com
                    Start-Sleep -s 2
                    Write-Host "Conexion realizada" -ForegroundColor Green 
                    Write-Host "Activando" $windows -ForegroundColor Yellow
                    slmgr /ato
                    Start-Sleep -s 2
                    Write-Host "Windows 10 Home Single Language ahora está activado!" -ForegroundColor Green
                    Start-Sleep -s 5
                    break
                }

                'Microsoft Windows 10 Home'
                {
                    Write-Host "Instalando licencia..." -ForegroundColor Yellow
                    slmgr /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
                    Start-Sleep -s 2
                    Write-Host "Licencia instalada" -ForegroundColor Green
                    Write-Host "Conectando con el servidor de activación..." -ForegroundColor Yellow
                    slmgr /skms kms8.msguides.com
                    Start-Sleep -s 2
                    Write-Host "Conexion realizada" -ForegroundColor Green 
                    Write-Host "Activando" $windows -ForegroundColor Yellow
                    slmgr /ato
                    Start-Sleep -s 2
                    Write-Host "Windows 10 Home ahora está activado!" -ForegroundColor Green
                    Start-Sleep -s 5
                    break
                }

                'Microsoft Windows 10 Pro'
                {
                    Write-Host "Instalando licencia..." -ForegroundColor Yellow
                    slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
                    Start-Sleep -s 2
                    Write-Host "Licencia instalada" -ForegroundColor Green
                    Write-Host "Conectando con el servidor de activación..." -ForegroundColor Yellow
                    slmgr /skms kms8.msguides.com
                    Start-Sleep -s 2
                    Write-Host "Conexion realizada" -ForegroundColor Green 
                    Write-Host "Activando" $windows -ForegroundColor Yellow
                    slmgr /ato
                    Start-Sleep -s 2
                    Write-Host "Windows 10 Pro ahora está activado!" -ForegroundColor Green
                    Start-Sleep -s 5
                    break
                }

                'Microsoft Windows 10 Pro N'
                {
                    Write-Host "Instalando licencia..." -ForegroundColor Yellow
                    slmgr /ipk MH37W-N47XK-V7XM9-C7227-GCQG9
                    Start-Sleep -s 2
                    Write-Host "Licencia instalada" -ForegroundColor Green
                    Write-Host "Conectando con el servidor de activación..." -ForegroundColor Yellow
                    slmgr /skms kms8.msguides.com
                    Start-Sleep -s 2
                    Write-Host "Conexion realizada" -ForegroundColor Green 
                    Write-Host "Activando" $windows -ForegroundColor Yellow
                    slmgr /ato
                    Start-Sleep -s 2
                    Write-Host "Windows 10 Pro N ahora está activado!" -ForegroundColor Green
                    Start-Sleep -s 5
                    break
                }

                default
                {
                    Write-Host "Este activador solo funciona en Windows 10"
                    break
                }
            }
        } 

        else 
        {
            Write-Host "Ha decidido no activar Windows 10" -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -s 3
        }
    }
    
    else {

        $title    = "Activate Windows 10"
        $question = "Do you want to activate Windows 10?"

        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Yes"))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
        if ($decision -eq 0) 
        {
            Write-Host "Cheking your Windows version..." -ForegroundColor Yellow
            $windows = (Get-WmiObject Win32_OperatingSystem).Caption
            Write-Host "Detected" $windows "installed" -ForegroundColor Green
            Start-Sleep -s 3
            Write-Host "Activating..." -ForegroundColor Yellow
            Start-Sleep -s 2

            switch ($windows)
            {
                'Microsoft Windows 10 Home Single Language'
                {
                    Write-Host "Installing license key..." -ForegroundColor Yellow
                    slmgr /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
                    Start-Sleep -s 2
                    Write-Host "License key installed" -ForegroundColor Green
                    Write-Host "Conecting with activation server..." -ForegroundColor Yellow
                    slmgr /skms kms8.msguides.com
                    Start-Sleep -s 2
                    Write-Host "Conection successful" -ForegroundColor Green 
                    Write-Host "Activating" $windows -ForegroundColor Yellow
                    slmgr /ato
                    Start-Sleep -s 2
                    Write-Host "Windows 10 Home Single Language is now activated!" -ForegroundColor Green
                    Start-Sleep -s 5
                    break
                }

                'Microsoft Windows 10 Home'
                {
                    Write-Host "Installing licence key..." -ForegroundColor Yellow
                    slmgr /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
                    Start-Sleep -s 2
                    Write-Host "License key installed" -ForegroundColor Green
                    Write-Host "Conecting with activation server..." -ForegroundColor Yellow
                    slmgr /skms kms8.msguides.com
                    Start-Sleep -s 2
                    Write-Host "Conection successful" -ForegroundColor Green 
                    Write-Host "Activating" $windows -ForegroundColor Yellow
                    slmgr /ato
                    Start-Sleep -s 2
                    Write-Host "Windows 10 Home is now activated!" -ForegroundColor Green
                    Start-Sleep -s 5
                    break
                }

                'Microsoft Windows 10 Pro'
                {
                    Write-Host "Installing license key..." -ForegroundColor Yellow
                    slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
                    Start-Sleep -s 2
                    Write-Host "License key installed" -ForegroundColor Green
                    Write-Host "Conecting with activation server..." -ForegroundColor Yellow
                    slmgr /skms kms8.msguides.com
                    Start-Sleep -s 2
                    Write-Host "Conection successful" -ForegroundColor Green 
                    Write-Host "Activating" $windows -ForegroundColor Yellow
                    slmgr /ato
                    Start-Sleep -s 2
                    Write-Host "Windows 10 Pro is now activated!" -ForegroundColor Green
                    Start-Sleep -s 5
                    break
                }

                'Microsoft Windows 10 Pro N'
                {
                    Write-Host "Installing license key..." -ForegroundColor Yellow
                    slmgr /ipk MH37W-N47XK-V7XM9-C7227-GCQG9
                    Start-Sleep -s 2
                    Write-Host "License key installed" -ForegroundColor Green
                    Write-Host "Conecting with activation server..." -ForegroundColor Yellow
                    slmgr /skms kms8.msguides.com
                    Start-Sleep -s 2
                    Write-Host "Conection successful" -ForegroundColor Green 
                    Write-Host "Activating" $windows -ForegroundColor Yellow
                    slmgr /ato
                    Start-Sleep -s 2
                    Write-Host "Windows 10 Pro N is now activated!" -ForegroundColor Green
                    Start-Sleep -s 5
                    break
                }                

                default
                {
                    Write-Host "This acvtivator only works on Windows 10"
                    break
                }
            }
        } 

        else 
        {
            Write-Host "You have chosen no to activate Windows 10" -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -s 3
        }
    }
}

function ActivateOffice
{
    $lang = ([CultureInfo]::InstalledUICulture).Name
    
    if ($lang -like "es*")
    {
        $title    = "Activar Office"
        $question = "¿Desea activar Office?"

        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Si"))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
        if ($decision -eq 0) 
        {
            if(Test-Path "$env:ProgramFiles\Microsoft Office\Office16")
            {
                Set-Location "$env:ProgramFiles\Microsoft Office\Office16"

                Get-ChildItem "$env:ProgramFiles\Microsoft Office\root\Licenses16\" | Foreach-Object {
                if($_.Name.StartsWith('ProPlus2019VL'))
                {
                    cscript ospp.vbs /inslic:"..\root\Licenses16\$_"
                }
                }

                cscript ospp.vbs /setprt:1688
                cscript ospp.vbs /unpkey:6MWKP >nul
                cscript ospp.vbs /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP
                cscript ospp.vbs /sethst:kms8.msguides.com
                cscript ospp.vbs /act

                Write-Host "Office se ha activado satisfactoriamente" -ForegroundColor Green
                Write-Host ""
                Start-Sleep -s 3
            }

            else
            {
                Set-Location "$env:ProgramFiles(x86)\Microsoft Office\Office16"

                Get-ChildItem "$env:ProgramFiles(x86)\Microsoft Office\root\Licenses16" | Foreach-Object {
                if($_.Name.StartsWith('ProPlus2019VL'))
                {
                    cscript ospp.vbs /inslic:"..\root\Licenses16\$_"
                }
                }

                cscript ospp.vbs /setprt:1688
                cscript ospp.vbs /unpkey:6MWKP >nul
                cscript ospp.vbs /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP
                cscript ospp.vbs /sethst:kms8.msguides.com
                cscript ospp.vbs /act

                Write-Host "Office se ha activado satisfactoriamente" -ForegroundColor Green
                Write-Host ""
                Start-Sleep -s 3
              }
        } 

        else 
        {
            Write-Host "Ha decidido no activar Office" -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -s 3
        }
    }

    else {

        $title    = "Activate Office"
        $question = "Do you want to activate Office?"

        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Yes"))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
        if ($decision -eq 0) 
        {
            if(Test-Path "$env:ProgramFiles\Microsoft Office\Office16")
            {
                Set-Location "$env:ProgramFiles\Microsoft Office\Office16"

                Get-ChildItem "$env:ProgramFiles\Microsoft Office\root\Licenses16\" | Foreach-Object {
                if($_.Name.StartsWith('ProPlus2019VL'))
                {
                    cscript ospp.vbs /inslic:"..\root\Licenses16\$_"
                }
                }

                cscript ospp.vbs /setprt:1688
                cscript ospp.vbs /unpkey:6MWKP >nul
                cscript ospp.vbs /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP
                cscript ospp.vbs /sethst:kms8.msguides.com
                cscript ospp.vbs /act

                Write-Host "Office has been activated successfully" -ForegroundColor Green
                Write-Host ""
                Start-Sleep -s 3
            }

            else
            {
                Set-Location "$env:ProgramFiles(x86)\Microsoft Office\Office16"

                Get-ChildItem "$env:ProgramFiles(x86)\Microsoft Office\root\Licenses16" | Foreach-Object {
                if($_.Name.StartsWith('ProPlus2019VL'))
                {
                    cscript ospp.vbs /inslic:"..\root\Licenses16\$_"
                }
                }

                cscript ospp.vbs /setprt:1688
                cscript ospp.vbs /unpkey:6MWKP >nul
                cscript ospp.vbs /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP
                cscript ospp.vbs /sethst:kms8.msguides.com
                cscript ospp.vbs /act

                Write-Host "Office has been activated successfully" -ForegroundColor Green
                Write-Host ""
                Start-Sleep -s 3
              }
        } 

        else 
        {
            Write-Host "You have chosen no to activate Office" -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -s 3
        }
    }   
}

function ActivateProject
{
    $lang = ([CultureInfo]::InstalledUICulture).Name
    
    if ($lang -like "es*")
    {
        $title    = "Activar Microsoft Project"
        $question = "¿Desea activar Microsoft Project 2019?"

        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Si"))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
        if ($decision -eq 0) 
        {
            if(Test-Path "$env:ProgramFiles\Microsoft Office\Office16")
            {
                Set-Location "$env:ProgramFiles\Microsoft Office\Office16"

                Get-ChildItem "$env:ProgramFiles\Microsoft Office\root\Licenses16\" | Foreach-Object {
                if($_.Name.StartsWith('ProjectPro2019VL_KMS'))
                {
                    cscript ospp.vbs /inslic:"..\root\Licenses16\$_"
                }
                }

                cscript ospp.vbs /inpkey:B4NPR-3FKK7-T2MBV-FRQ4W-PKD2B
                cscript ospp.vbs /sethst:kms8.msguides.com
                cscript ospp.vbs /setprt:1688
                cscript ospp.vbs /act

                Write-Host "Microsoft Project 2019 se ha activado satisfactoriamente" -ForegroundColor Green
                Write-Host ""
                Start-Sleep -s 3
            }

            else
            {
                Set-Location "$env:ProgramFiles(x86)\Microsoft Office\Office16"

                Get-ChildItem "$env:ProgramFiles(x86)\Microsoft Office\root\Licenses16" | Foreach-Object {
                if($_.Name.StartsWith('ProjectPro2019VL_KMS'))
                {
                    cscript ospp.vbs /inslic:"..\root\Licenses16\$_"
                }
                }

                cscript ospp.vbs /inpkey:B4NPR-3FKK7-T2MBV-FRQ4W-PKD2B
                cscript ospp.vbs /sethst:kms8.msguides.com
                cscript ospp.vbs /setprt:1688
                cscript ospp.vbs /act

                Write-Host "Microsoft Project 2019 se ha activado satisfactoriamente" -ForegroundColor Green
                Write-Host ""
                Start-Sleep -s 3
              }
        } 

        else 
        {
            Write-Host "Ha decidido no activar Microsoft Project 2019" -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -s 3
        }
    }

    else {

        $title    = "Activate Microsoft Project"
        $question = "Do you want to activate Microsoft Project 2019?"

        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Yes"))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
        if ($decision -eq 0) 
        {
            if(Test-Path "$env:ProgramFiles\Microsoft Office\Office16")
            {
                Set-Location "$env:ProgramFiles\Microsoft Office\Office16"

                Get-ChildItem "$env:ProgramFiles\Microsoft Office\root\Licenses16\" | Foreach-Object {
                if($_.Name.StartsWith('ProjectPro2019VL_KMS'))
                {
                    cscript ospp.vbs /inslic:"..\root\Licenses16\$_"
                }
                }

                cscript ospp.vbs /inpkey:B4NPR-3FKK7-T2MBV-FRQ4W-PKD2B
                cscript ospp.vbs /sethst:kms8.msguides.com
                cscript ospp.vbs /setprt:1688
                cscript ospp.vbs /act

                Write-Host "Microsoft Project 2019 has been activated successfully" -ForegroundColor Green
                Write-Host ""
                Start-Sleep -s 3
            }

            else
            {
                Set-Location "$env:ProgramFiles(x86)\Microsoft Office\Office16"

                Get-ChildItem "$env:ProgramFiles(x86)\Microsoft Office\root\Licenses16" | Foreach-Object {
                if($_.Name.StartsWith('ProjectPro2019VL_KMS'))
                {
                    cscript ospp.vbs /inslic:"..\root\Licenses16\$_"
                }
                }

                cscript ospp.vbs /inpkey:B4NPR-3FKK7-T2MBV-FRQ4W-PKD2B
                cscript ospp.vbs /sethst:kms8.msguides.com
                cscript ospp.vbs /setprt:1688
                cscript ospp.vbs /act

                Write-Host "Microsoft Project 2019 has been activated successfully" -ForegroundColor Green
                Write-Host ""
                Start-Sleep -s 3
              }
        } 

        else 
        {
            Write-Host "You have chosen no to activate Microsoft Project" -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -s 3
        }
    }   
}

function ActivateVisio
{
    $lang = ([CultureInfo]::InstalledUICulture).Name
    
    if ($lang -like "es*")
    {
        $title    = "Activar Microsoft Visio"
        $question = "¿Desea activar Microsoft Visio 2019?"

        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Si"))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
        if ($decision -eq 0) 
        {
            if(Test-Path "$env:ProgramFiles\Microsoft Office\Office16")
            {
                Set-Location "$env:ProgramFiles\Microsoft Office\Office16"

                Get-ChildItem "$env:ProgramFiles\Microsoft Office\root\Licenses16\" | Foreach-Object {
                if($_.Name.StartsWith('VisioPro2019VL_KMS'))
                {
                    cscript ospp.vbs /inslic:"..\root\Licenses16\$_"
                }
                }

                cscript ospp.vbs /inpkey:9BGNQ-K37YR-RQHF2-38RQ3-7VCBB
                cscript ospp.vbs /sethst:kms8.msguides.com
                cscript ospp.vbs /setprt:1688
                cscript ospp.vbs /act

                Write-Host "Microsoft Visio 2019 se ha activado satisfactoriamente" -ForegroundColor Green
                Write-Host ""
                Start-Sleep -s 3
            }

            else
            {
                Set-Location "$env:ProgramFiles(x86)\Microsoft Office\Office16"

                Get-ChildItem "$env:ProgramFiles(x86)\Microsoft Office\root\Licenses16" | Foreach-Object {
                if($_.Name.StartsWith('VisioPro2019VL_KMS'))
                {
                    cscript ospp.vbs /inslic:"..\root\Licenses16\$_"
                }
                }

                cscript ospp.vbs /inpkey:9BGNQ-K37YR-RQHF2-38RQ3-7VCBB
                cscript ospp.vbs /sethst:kms8.msguides.com
                cscript ospp.vbs /setprt:1688
                cscript ospp.vbs /act

                Write-Host "Microsoft Visio 2019 se ha activado satisfactoriamente" -ForegroundColor Green
                Write-Host ""
                Start-Sleep -s 3
              }
        } 

        else 
        {
            Write-Host "Ha decidido no activar Microsoft Visio 2019" -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -s 3
        }
    }

    else {

        $title    = "Activate Microsoft Visio"
        $question = "Do you want to activate Microsoft Visio 2019?"

        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Yes"))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
        if ($decision -eq 0) 
        {
            if(Test-Path "$env:ProgramFiles\Microsoft Office\Office16")
            {
                Set-Location "$env:ProgramFiles\Microsoft Office\Office16"

                Get-ChildItem "$env:ProgramFiles\Microsoft Office\root\Licenses16\" | Foreach-Object {
                if($_.Name.StartsWith('VisioPro2019VL_KMS'))
                {
                    cscript ospp.vbs /inslic:"..\root\Licenses16\$_"
                }
                }

                cscript ospp.vbs /inpkey:9BGNQ-K37YR-RQHF2-38RQ3-7VCBB
                cscript ospp.vbs /sethst:kms8.msguides.com
                cscript ospp.vbs /setprt:1688
                cscript ospp.vbs /act

                Write-Host "Microsoft Visio 2019 has been activated successfully" -ForegroundColor Green
                Write-Host ""
                Start-Sleep -s 3
            }

            else
            {
                Set-Location "$env:ProgramFiles(x86)\Microsoft Office\Office16"

                Get-ChildItem "$env:ProgramFiles(x86)\Microsoft Office\root\Licenses16" | Foreach-Object {
                if($_.Name.StartsWith('VisioPro2019VL_KMS'))
                {
                    cscript ospp.vbs /inslic:"..\root\Licenses16\$_"
                }
                }

                cscript ospp.vbs /inpkey:9BGNQ-K37YR-RQHF2-38RQ3-7VCBB
                cscript ospp.vbs /sethst:kms8.msguides.com
                cscript ospp.vbs /setprt:1688
                cscript ospp.vbs /act

                Write-Host "Microsoft Visio 2019 has been activated successfully" -ForegroundColor Green
                Write-Host ""
                Start-Sleep -s 3
              }
        } 

        else 
        {
            Write-Host "You have chosen no to activate Microsoft Visio" -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -s 3
        }
    }   
}

function menu
{
    $lang = ([CultureInfo]::InstalledUICulture).Name
    
    if ($lang -like "es*")
    {
        cls
        Banner
        Write-Host ""
        Write-Host "1. Instalar Google Chrome" -ForegroundColor Yellow
        Write-Host "2. Instalar Firefox" -ForegroundColor Yellow
        Write-Host "3. Instalar 7-zip" -ForegroundColor Yellow
        Write-Host "4. Instalar WinRAR" -ForegroundColor Yellow
        Write-Host "5. Instalar lector PDF" -ForegroundColor Yellow
        Write-Host "6. Instalar Office" -ForegroundColor Yellow
        Write-Host "7. Instala Microsoft Project 2019" -ForegroundColor Yellow
        Write-Host "8. Instalar Microsoft Visio 2019" -ForegroundColor
        Write-Host "9. Activar Windows 10" -ForegroundColor Yellow
        Write-Host "10. Activar Office" -ForegroundColor Yellow
        Write-Host "11. Activar Microsoft Project 2019" -ForegroundColor Yellow
        Write-Host "12. Activar Microsoft Visio 2019" -ForegroundColor Yellow
        Write-Host "13. Salir" -ForegroundColor Yellow
        Write-Host ""

        [int]$option = Read-Host "Seleccione la opción que desea ejecutar"
    
        switch ($option)
        {
            '1' {
                    InstallGoogleChrome; break
                }

            '2' {
                    InstallFirefox; break
                }

            '3' {
                    Install7-zip; break
                }

            '4' {
                    InstallWinRAR; break
                }
            
            '5' {
                    InstallPDF24; break
                }

            '6' {
                    InstallOffice; break
                }

            '7' {
                    InstallProject; break
                }

            '8' {
                    InstallVisio; break
                }

            '9' {
                    ActivateWindows10; break
                }

            '10' {
                    ActivateOffice; break
                }

            '11' {
                    ActivateProject; break
                }

            '12' {
                    ActivateVisio; break
                }

            '13' {
                    exit
                }

            default
            {
                Write-Host "Option not valid"; menu
            }
        }
    }

    else {

        cls
        Banner
        Write-Host ""
        Write-Host "1. Install Google Chrome" -ForegroundColor Yellow
        Write-Host "2. Install Firefox" -ForegroundColor Yellow
        Write-Host "3. Install 7-zip" -ForegroundColor Yellow
        Write-Host "4. Install WinRAR" -ForegroundColor Yellow
        Write-Host "5. Install PDF Reader" -ForegroundColor Yellow
        Write-Host "6. Install Office" -ForegroundColor Yellow
        Write-Host "7. Install Microsoft Project 2019" -ForegroundColor Yellow
        Write-Host "8. Install Microsoft Visio 2019" -ForegroundColor Yellow
        Write-Host "9. Activate Windows 10" -ForegroundColor Yellow
        Write-Host "10. Activate Office" -ForegroundColor Yellow
        Write-Host "11. Activate Microsoft Project 2019" -ForegroundColor Yellow
        Write-Host "12. Activate Microsoft Visio 2019" -ForegroundColor Yellow
        Write-Host "13. Exit" -ForegroundColor Yellow
        Write-Host ""

        [int]$option = Read-Host "Choose an option"
    
        switch ($option)
        {
            '1' {
                    InstallGoogleChrome; break
                }

            '2' {
                    InstallFirefox; break
                }

            '3' {
                    Install7-zip; break
                }

            '4' {
                    InstallWinRAR; break
                }
            
            '5' {
                    InstallPDF24; break
                }

            '6' {
                    InstallOffice; break
                }

            '7' {
                    InstallProject; break
                }

            '8' {
                    InstallVisio; break
                }

            '9' {
                    ActivateWindows10; break
                }

            '10' {
                    ActivateOffice; break
                }

            '11' {
                    ActivateProject; break
                }

            '12' {
                    ActivateVisio; break
                }

            '13' {
                    exit
                }

            default
            {
                Write-Host "Option not valid"; menu
            }
        }
    }
}

function Option
{
    $lang = ([CultureInfo]::InstalledUICulture).Name
    
    if ($lang -like "es*")
    {
        $title    = "Finalizado"
        $question = "Se ha completado el proceso, ¿quiere repetir alguna parte del proceso?"

        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Si'))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
        if ($decision -eq 0) 
        {
            menu
        } 

        else 
        {
            Write-Host "Saliendo..." -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -s 3
            exit
        }
    }

    else {

        $title    = "Finished"
        $question = "The process has been completed, do you want to repeat any option?"

        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&Yes"))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList "&No"))

        $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
        if ($decision -eq 0) 
        {
            menu
        } 

        else 
        {
            Write-Host "Exiting..." -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -s 3
            exit
        }
    }
    
}

Banner
ChocoEnvironment
InstallGoogleChrome
InstallFirefox
Install7-zip
InstallWinRAR
InstallPDF24
InstallOffice
InstallProject
InstallVisio
ActivateWindows10
ActivateOffice
ActivateProject
ActivateVisio
Option