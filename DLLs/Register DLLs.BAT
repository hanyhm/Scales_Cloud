@echo **************************************************
@echo **************************************************
Regsvr32 /s C:\Scales_Cloud\DIGI2005DLL.dll
Regsvr32 /s C:\Scales_Cloud\FuncDLL.dll
Regsvr32 /s C:\Scales_Cloud\IranCharacterConvert.dll
Regsvr32 /s C:\Scales_Cloud\Microsoft.Office.Interop.Excel.dll
Regsvr32 /s C:\Scales_Cloud\Interop.IranCharacterConvert.dll


cd \Windows\SysWOW64 regsvr32  C:\Scales_Cloud\DIGI2005DLL.dll
cd \Windows\SysWOW64 regsvr32  C:\Scales_Cloud\FuncDLL.dll 
cd \Windows\SysWOW64 regsvr32  C:\Scales_Cloud\IranCharacterConvert.dll 
cd \Windows\SysWOW64 regsvr32  C:\Scales_Cloud\Interop.IranCharacterConvert.dll
exit





