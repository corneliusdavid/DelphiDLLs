 unit UseLoadLibMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, Buttons, ExtCtrls;

type
  TfrmDynDllDemo = class(TForm)
    lblFreeBytes: TLabel;
    lblFreeMBytes: TLabel;
    btnExit: TBitBtn;
    cmbDrives: TDriveComboBox;
    btnBulbs: TSpeedButton;
    procedure cmbDrivesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure btnBulbsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure btnBulbsClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    // internal flag: have we already turned on the bulb?
    OverImage: Boolean;
    // handles to the function and resource libraries
    DllHandle: HModule;
    ResHandle: HModule;
  end;

var
  frmDynDllDemo: TfrmDynDllDemo;


implementation

uses
  NewMsgDlg;

{$R *.DFM}

type
  // declare function types that we'll access
  TIntToCommaStrFunc = function(Num: Int64; Dest: PChar; MaxLen: Integer): PChar; stdcall;
  TFreeBytesFunc   = function(Drive: Char): Int64; stdcall;
  TFreeMBytesProc = procedure(Drive: Char; var MBytesFree: Double); stdcall;
var
  // pointers to the functions we have to assign manually
  IntToCommaStr: TIntToCommaStrFunc;
  FreeBytes: TFreeBytesFunc;
  FreeMBytes: TFreeMBytesProc;

procedure TfrmDynDllDemo.FormCreate(Sender: TObject);
begin
  // initialize the DLL handles
  DllHandle := 0;
  ResHandle := 0;
end;

procedure TfrmDynDllDemo.FormDestroy(Sender: TObject);
begin
  // free the function library
  if DllHandle <> 0 then
    FreeLibrary(DllHandle);
  // free the resource library
  if ResHandle <> 0 then
    FreeLibrary(ResHandle);
end;

procedure TfrmDynDllDemo.FormActivate(Sender: TObject);
const
  BitmapLibName = 'BitmapLib.DLL';
var
  msg: array[0..50] of Char;
begin
  // load the resource library
  ResHandle := LoadLibraryEx(PChar(BitmapLibName), 0, Load_Library_As_DataFile);
  if ResHandle = 0 then
  begin
    StrPCopy(msg, 'Could not load ' + BitmapLibName + ': Error ' + IntToStr(GetLastError));
    NewMessageDlg(msg , Ord(mtError))
  end else
    // if loaded, set the "bulb off" glyph
    btnBulbs.Glyph.LoadFromResourceName(ResHandle, 'BulbOff');

  // initialize the flag
  OverImage := False;
end;

procedure TfrmDynDllDemo.FormDeactivate(Sender: TObject);
begin
  // free the resource handle
  if ResHandle <> 0 then
    FreeLibrary(ResHandle);
end;

procedure TfrmDynDllDemo.cmbDrivesChange(Sender: TObject);
const
  FuncLibName = 'FunctionLib.DLL';
var
  p: array[0..30] of Char;
  msg: array[0..50] of Char;
  x: Double;
begin
  // check to see if the DLL is loaded
  if DllHandle = 0 then begin
    DllHandle := LoadLibrary(PChar(FuncLibName));

    // didn't make it  :-(
    if DllHandle = 0 then begin
      StrPCopy(msg, 'Could not load ' + FuncLibName + ': Error ' + IntToStr(GetLastError));
      NewMessageDlg(msg, Ord(mtError));
      Exit;
    end;

    // DLL loaded, assign the functions
    @IntToCommaStr := GetProcAddress(DllHandle, 'IntToCommaStr');
    @FreeBytes := GetProcAddress(DllHandle, 'FreeBytes');
    @FreeMBytes := GetProcAddress(DllHandle, 'FreeMBytes');
  end;

  // assume it has by here
  IntToCommaStr(FreeBytes(cmbDrives.Drive), p, 30);
  lblFreeBytes.Caption := StrPas(p) + ' Bytes free';
  FreeMBytes(cmbDrives.Drive, x);
  lblFreeMBytes.Caption := FloatToStrF(x, ffFixed, 15, 2) + ' MBytes free';
end;

procedure TfrmDynDllDemo.btnBulbsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  // if the resource is available and we haven't already turned the bulb on, do it now
  if (ResHandle <> 0) and (not OverImage) then begin
    btnBulbs.Glyph.LoadFromResourceName(ResHandle, 'BulbOn');
    OverImage := True;
  end;
end;

procedure TfrmDynDllDemo.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  // if we think we're still over the button, clear the flag and turn the bulb off
  if OverImage then begin
    OverImage := False;
    btnBulbs.Glyph.LoadFromResourceName(ResHandle, 'BulbOff');
  end;
end;

procedure TfrmDynDllDemo.btnBulbsClick(Sender: TObject);
var
  msg: array[0..80] of Char;
begin
  StrPCopy(msg, 'You should think twice before hitting that Cancel button!');
  NewMessageDlg(msg, Ord(mtWarning));
end;

procedure TfrmDynDllDemo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := NewMessageDlg(PChar('Do you REALLY want to leave?'), Ord(mtConfirmation)) = mrOk;
end;

end.
