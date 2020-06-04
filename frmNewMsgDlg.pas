unit frmNewMsgDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Vcl.Buttons;

type
  TfrmNewMessageDlg = class(TForm)
    imgDlgIcon: TImage;
    lblGrab: TLabel;
    lblMessage: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    procedure rzDlgButtonsClickOk(Sender: TObject);
    procedure rzDlgButtonsClick(Sender: TObject);
  public
    procedure SetIcon(NewIcon: Integer);
    procedure SetMessage(NewMsg: PChar);
  end;

var
  frmNewMessageDlg: TfrmNewMessageDlg;


implementation


{$R *.DFM}

const
  mtWarning = 0;
  mtError = 1;
  mtInformation = 2;
  mtConfirmation = 3;

procedure TfrmNewMessageDlg.rzDlgButtonsClickOk(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmNewMessageDlg.rzDlgButtonsClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmNewMessageDlg.SetIcon(NewIcon: Integer);
begin
  case NewIcon of
    mtWarning:
    begin
      lblGrab.Caption := 'Hey Dude, Watch out!';
      imgDlgIcon.Picture.Bitmap.LoadFromResourceName(HInstance, 'IconWarn');
    end;
    mtError:
    begin
      lblGrab.Caption := 'Whoa! Now THAT''S an error!';
      imgDlgIcon.Picture.Bitmap.LoadFromResourceName(HInstance, 'IconError');
    end;
    mtInformation:
    begin
      lblGrab.Caption := 'Here''s something to chew on.';
      imgDlgIcon.Picture.Bitmap.LoadFromResourceName(HInstance, 'IconInfo');
    end;
    mtConfirmation:
    begin
      lblGrab.Caption := 'Be sure.  Be VERY sure.';
      imgDlgIcon.Picture.Bitmap.LoadFromResourceName(HInstance, 'IconConfirm');
    end;
  end;
end;

procedure TfrmNewMessageDlg.SetMessage(NewMsg: PChar);
begin
  lblMessage.Caption := StrPas(NewMsg);
end;

end.
