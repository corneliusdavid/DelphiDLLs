unit UseLibMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, Buttons, ExtCtrls;

type
  TfrmStatDllDemo = class(TForm)
    btnExit: TBitBtn;
    cmbDrives: TDriveComboBox;
    lblFreeBytes: TLabel;
    lblFreeMBytes: TLabel;
    btnBulbs: TSpeedButton;
    procedure cmbDrivesChange(Sender: TObject);
    procedure btnBulbsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure btnBulbsClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    // internal flag: have we already turned on the bulb?
    OverBtn: Boolean;
  end;

var
  frmStatDllDemo: TfrmStatDllDemo;

implementation

uses
  // automatically load library at execution
  FunctionLib,
  // automatically make resources available at execution
  BitmapRes,
  // automatically load the NewMessageDlg lib function
  NewMsgDlg;

{$R *.DFM}

procedure TfrmStatDllDemo.cmbDrivesChange(Sender: TObject);
var
  // create our "PChar"
  p: array[0..30] of Char;
  x: Double;
begin
  // directly call functions because declared in unit "FunctionLib"
  IntToCommaStr(FreeBytes(cmbDrives.Drive), p, 30);
  lblFreeBytes.Caption := StrPas(p) + ' Bytes free';
  FreeMBytes(cmbDrives.Drive, x);
  lblFreeMBytes.Caption := FloatToStrF(x, ffFixed, 15, 2) + ' MBytes free';
end;

procedure TfrmStatDllDemo.FormActivate(Sender: TObject);
begin
  // initialize the flag and set the bulb off
  OverBtn := False;
  btnBulbs.Glyph.LoadFromResourceName(BulbResource, 'BulbOff');
end;

procedure TfrmStatDllDemo.btnBulbsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  // if we haven't already turned the bulb on, do it now
  if not OverBtn then begin
    btnBulbs.Glyph.LoadFromResourceName(BulbResource, 'BulbOn');
    OverBtn := True;
  end;
end;

procedure TfrmStatDllDemo.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  // if we think we're still over the button, clear the flag and turn the bulb off
  if OverBtn then begin
    OverBtn := False;
    btnBulbs.Glyph.LoadFromResourceName(BulbResource, 'BulbOff');
  end;
end;

procedure TfrmStatDllDemo.btnBulbsClick(Sender: TObject);
begin
  NewMessageDlg(PChar('Cool new message dialog box!'), Ord(mtInformation));
end;

procedure TfrmStatDllDemo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := NewMessageDlg(PChar('Do you REALLY want to leave?'), Ord(mtConfirmation)) = mrOk;
end;

end.
