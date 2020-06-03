program UseLib;

uses
  Forms,
  UseLibMain in 'UseLibMain.pas' {frmStatDllDemo},
  FunctionLib in 'FunctionLib.pas',
  BitmapRes in 'BitmapRes.pas',
  NewMsgDlg in 'NewMsgDlg.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmStatDllDemo, frmStatDllDemo);
  Application.Run;
end.
