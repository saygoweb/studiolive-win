[_ISTool]
EnableISX=true

#define MyAppName "Studio Live"
#define MyAppVersion "0.0.0"
#define MyAppPublisher "SayGoWeb"
#define MyAppURL "http://studiolive.saygoweb.com"
#define MyAppExeName "mongoose.exe"
#define SuiteName "Studio Live"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{2A4EFA05-E74E-47B6-8791-36EE883E484C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName=C:\CasparCG\{#MyAppName}
DisableDirPage=no
DisableReadyPage=no
DefaultGroupName={#SuiteName}
DisableProgramGroupPage=yes
LicenseFile=license.rtf
OutputBaseFilename=StudioLiveSetup
Compression=lzma
SolidCompression=yes
WizardImageFile=compiler:WIZMODERNIMAGE-IS.BMP 
CreateUninstallRegKey=true

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Dirs]
Name: {app}\data
Name: {app}\data\db
Name: {app}\log
Name: {app}\media
Name: {app}\templates
Name: {app}\web_root

[Files]
Source: ..\installer\isxdl.dll; Flags: dontcopy
Source: ..\mongodb.conf; DestDir: {app}; 
Source: ..\mongoose.conf; DestDir: {app}; 
Source: ..\mongoose.exe; DestDir: {app}; 
Source: ..\ssl_cert.pem; DestDir: {app}; 
Source: ..\php.ini; DestDir: {app}; 
Source: ..\php5ts.dll; DestDir: {app}; 
Source: ..\php-cgi.exe; DestDir: {app}; 
Source: ..\phpmongo.dll; DestDir: {app}; 
Source: ..\mongod.exe; DestDir: {app}; 
Source: ..\web_root\*; DestDir: {app}\web_root; Flags: recursesubdirs; 

[Messages]
WinVersionTooLowError=StudioLive requires Windows 2000 or later.

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, "&", "&&")}}"; Flags: nowait postinstall skipifsilent
FileName: "http://localhost:8080/readme.php"; Description: "View the ReadMe"; Flags: nowait postinstall shellexec runasoriginaluser

[InnoIDE_Settings]
LogFileOverwrite=false
