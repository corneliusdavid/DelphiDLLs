unit ufrmTestShowMsgXE2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtMyMessage: TEdit;
    btnShowMsgDLL: TButton;
    procedure btnShowMsgDLLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{$IFDEF UNICODE}
procedure ShowDlgMessage(AMsg: PAnsiChar); stdcall; external 'ShowMsgLib.dll';
procedure ShowLetter(Letter: AnsiChar); stdcall; external 'ShowMsgLib.dll';
{$ELSE}
procedure ShowDlgMessage(AMsg: PChar); stdcall; external 'ShowMsgLib.dll';
procedure ShowLetter(Letter: Char); stdcall; external 'ShowMsgLib.dll';
{$ENDIF}


procedure TForm1.btnShowMsgDLLClick(Sender: TObject);
var
{$IFDEF UNICODE}
  AnsiMsg: AnsiString;
  FirstChar: AnsiChar;
{$ELSE}
  AMessage: string;
  FirstChar: Char;
{$ENDIF}
begin
{$IFDEF UNICODE}
  AnsiMsg := AnsiString(edtMyMessage.Text);

  ShowDlgMessage(PAnsiChar(AnsiMsg));

  FirstChar := AnsiMsg[1];
  ShowLetter(FirstChar);
{$ELSE}
  AMessage := edtMyMessage.Text;

  ShowDlgMessage(PChar(AMessage));

  FirstChar := AMessage[1];
  ShowLetter(FirstChar);
{$ENDIF}
end;

end.
