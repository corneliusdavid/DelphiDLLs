program UseLoadLib;

uses
  Forms,
  UseLoadLibMain in 'UseLoadLibMain.pas' {frmDynDllDemo},
  BitmapRes in 'BitmapRes.pas',
  NewMsgDlg in 'NewMsgDlg.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmDynDllDemo, frmDynDllDemo);
  Application.Run;
end.
