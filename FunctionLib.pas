unit FunctionLib;

interface

function  IntToCommaStr(Num: Int64; Dest: PChar; MaxLen: Integer): PChar; stdcall;
function  FreeBytes(Drive: Char): Int64; stdcall;
procedure FreeMBytes(Drive: Char; var MBytesFree: Double);stdcall;


implementation

function  FreeBytes(Drive: Char): Int64; stdcall;     external 'FunctionLib.DLL';
procedure FreeMBytes(Drive: Char; var MBytesFree: Double); stdcall; external 'FunctionLib.DLL';
function  IntToCommaStr(Num: Int64; Dest: PChar; MaxLen: Integer): PChar; stdcall; external 'FunctionLib.DLL';

end.
 