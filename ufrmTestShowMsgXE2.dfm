object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 167
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 40
    Width = 84
    Height = 13
    Caption = 'Enter a message:'
  end
  object edtMyMessage: TEdit
    Left = 154
    Top = 37
    Width = 207
    Height = 24
    TabOrder = 0
  end
  object btnShowMsgDLL: TButton
    Left = 152
    Top = 80
    Width = 153
    Height = 25
    Caption = 'Call ShowMsg DLL'
    TabOrder = 1
    OnClick = btnShowMsgDLLClick
  end
end
