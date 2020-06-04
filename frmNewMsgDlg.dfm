object frmNewMessageDlg: TfrmNewMessageDlg
  Left = 228
  Top = 238
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 185
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object imgDlgIcon: TImage
    Left = 8
    Top = 8
    Width = 57
    Height = 57
    Center = True
  end
  object lblGrab: TLabel
    Left = 96
    Top = 24
    Width = 134
    Height = 20
    Caption = 'what goes here?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object lblMessage: TLabel
    Left = 96
    Top = 50
    Width = 33
    Height = 13
    Caption = 'subtitle'
  end
  object btnOK: TBitBtn
    Left = 96
    Top = 96
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
  end
  object btnCancel: TBitBtn
    Left = 185
    Top = 96
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
end
