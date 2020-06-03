unit BitmapRes;

interface

uses
  Windows;

var
  BulbResource: HModule;


implementation

initialization
  BulbResource := LoadLibraryEx(PChar('BitmapLib.DLL'), 0, Load_Library_As_DataFile);
finalization
  if BulbResource <> 0 then
    FreeLibrary(BulbResource);
end.
 