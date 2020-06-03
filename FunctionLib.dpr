library FunctionLib;

// start the library some place other than default
// in hopes it won't have to be moved
{$IMAGEBASE $41000000}

uses
  SysUtils,
  Classes;

{$R *.RES}

function FreeBytes(Drive: Char): Int64; stdcall;
begin
  // convert given drive letter to 1..26 based number to pass to DiskFree()
  Result := DiskFree(Ord(Upcase(Drive)) - (Ord('A') - 1));
end;

procedure FreeMBytes(Drive: Char; var MBytesFree: Double); stdcall;
begin
  // convert bytes to megabytes
  MBytesFree := FreeBytes(Drive) / 1024.0 / 1024.0;
end;

function IntToCommaStr(Num: Int64; Dest: PChar; MaxLen: Integer): PChar; stdcall;
// return given number in string (PChar) format with commas
const
  MaxInsPoints = 7;
  InsPoints: array[1..MaxInsPoints] of Byte = (3, 7, 11, 15, 19, 24, 28);
var
  i: Byte;
  s: string;
begin
  s := IntToStr(Num);
  for i := 1 to MaxInsPoints do
    if Length(s) > InsPoints[i] then
      Insert(',', s, Length(s) - InsPoints[i] + 1)
    else
      Break;

  if Length(s) < MaxLen then
    Result := StrPCopy(Dest, s)
  else
    Result := nil;
end;

exports
  // "index" order is reverse of listed order starting with 1
  INTTOCOMMASTR,
  FREEMBYTES,
  FREEBYTES;

begin
end.
