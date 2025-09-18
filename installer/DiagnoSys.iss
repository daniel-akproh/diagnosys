[Setup]
AppName=DiagnoSys
AppVersion=0.1.0
DefaultDirName={commonpf}\DiagnoSys
DefaultGroupName=DiagnoSys
OutputDir=..\dist
OutputBaseFilename=DiagnoSys-Setup-0.1.0
Compression=lzma
SolidCompression=yes

WizardStyle=modern
WizardImageFile=logo\heart.png
WizardImageStretch=no
SetupIconFile=logo\logo.ico

UninstallDisplayIcon={app}\diagnosys.exe
DisableProgramGroupPage=yes
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible

[Files]
Source: "logo\logo.ico"; DestDir: "{app}";
Source: "..\build\bin\diagnosys.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\build\bin\*.dll";        DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\DiagnoSys"; Filename: "{app}\diagnosys.exe"; IconFilename: "{app}\logo.ico"
Name: "{autodesktop}\DiagnoSys";  Filename: "{app}\diagnosys.exe"; IconFilename: "{app}\logo.ico"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "Create a desktop shortcut"; GroupDescription: "Additional icons:"

[Run]
Filename: "{app}\diagnosys.exe"; Description: "Launch DiagnoSys"; Flags: nowait postinstall skipifsilent
