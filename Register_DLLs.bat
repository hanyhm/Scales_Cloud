@echo off
echo **************************************************
echo Registering DLLs...
echo **************************************************

:: 64-bit DLL Registration (default regsvr32 path)
regsvr32 /s C:\Scales_Cloud\DIGI2005DLL.dll
regsvr32 /s C:\Scales_Cloud\FuncDLL.dll
regsvr32 /s C:\Scales_Cloud\IranCharacterConvert.dll
regsvr32 /s C:\Scales_Cloud\Microsoft.Office.Interop.Excel.dll
regsvr32 /s C:\Scales_Cloud\Interop.IranCharacterConvert.dll

:: 32-bit DLL Registration (using SysWOW64 regsvr32)
C:\Windows\SysWOW64\regsvr32 /s C:\Scales_Cloud\DIGI2005DLL.dll
C:\Windows\SysWOW64\regsvr32 /s C:\Scales_Cloud\FuncDLL.dll
C:\Windows\SysWOW64\regsvr32 /s C:\Scales_Cloud\IranCharacterConvert.dll
C:\Windows\SysWOW64\regsvr32 /s C:\Scales_Cloud\Interop.IranCharacterConvert.dll

echo **************************************************
echo Registration Complete
echo **************************************************
exit






