unit NewMsgDlg;

interface

function NewMessageDlg(TheMessage: PChar; DlgType: Integer): Integer; stdcall;



implementation

function NewMessageDlg(TheMessage: PChar; DlgType: Integer): Integer; stdcall; external 'NewMsgDlg.DLL';


end.
