unit ufrmTestShowMsg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

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

{$R *.DFM}

procedure ShowDlgMessage(AMsg: PChar); stdcall; external 'ShowMsgLib.dll';
procedure ShowLetter(Letter: Char); stdcall; external 'ShowMsgLib.dll';


procedure TForm1.btnShowMsgDLLClick(Sender: TObject);
var
  AMessage: string;
  FirstChar: Char;
begin
  AMessage := edtMyMessage.Text;

  ShowDlgMessage(PChar(AMessage));


  FirstChar := AMessage[1];
  ShowLetter(FirstChar);
end;

end.
