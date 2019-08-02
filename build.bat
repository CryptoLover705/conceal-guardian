@ECHO OFF
REM Windows build
del .\bin\win\*.* /F /Q
call pkg index.js --targets node10-win-x64 --output .\bin\win\guardian-win64.exe
copy .\tools\cgservice.exe .\bin\win
copy .\commands\win\*.* .\bin\win
copy config.json.sample .\bin\win\config.json
.\tools\7z.exe a .\bin\win\guardian-win64.zip .\bin\win\*.*

REM Linux build
del .\bin\linux\*.* /F /Q
call pkg index.js --targets node10-linux-x64 --output .\bin\linux\guardian-linux64
copy ccx-guardian.service.template .\bin\linux
copy config.json.sample .\bin\linux\config.json
.\tools\7z.exe a -ttar .\bin\linux\guardian-linux64.tar .\bin\linux\guardian-linux64 .\bin\linux\config.json .\bin\linux\sct-guardian.service.template
.\tools\7z.exe a -tgzip .\bin\linux\guardian-linux64.tar.gz .\bin\linux\guardian-linux64.tar

REM OSX build (uncomplete, just the binary)
REM call pkg index.js --targets node10-macos-x64 --output .\bin\macos\guardian-macos64
