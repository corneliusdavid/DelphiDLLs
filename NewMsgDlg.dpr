library NewMsgDlg;

{$IMAGEBASE $43000000}
{$R 'MsgDlgIcons.res' 'MsgDlgIcons.rc'}

uses
  SysUtils,
  Classes,
  Forms,
  frmNewMsgDlg in 'frmNewMsgDlg.pas' {frmNewMessageDlg};

{$R *.RES}

function NewMessageDlg(Msg: PChar; DlgType: Integer): Integer; stdcall;
begin
  frmNewMessageDlg := TfrmNewMessageDlg.Create(Application);
  if Assigned(frmNewMessageDlg) then begin
    frmNewMessageDlg.SetMessage(Msg);
    frmNewMessageDlg.SetIcon(DlgType);
    Result := frmNewMessageDlg.ShowModal;
    frmNewMessageDlg.Free;
  end
  else
    Result := -1;
end;

exports
  NewMessageDlg;

begin

end.
