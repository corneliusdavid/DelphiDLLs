object frmNewMessageDlg: TfrmNewMessageDlg
  Left = 228
  Top = 238
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 131
  ClientWidth = 360
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
  object rzBackground: TRzBackground
    Left = 0
    Top = 0
    Width = 360
    Height = 95
    Active = True
    Align = alClient
    GradientColorStart = clBlack
    GradientColorStop = clRed
    GradientDirection = gdVerticalEnd
    ImageStyle = isCenter
    ShowGradient = True
    ShowImage = False
    ShowTexture = False
  end
  object lblGrabber: TRzLabel
    Left = 80
    Top = 8
    Width = 273
    Height = 24
    AutoSize = False
    Caption = 'lblGrabber'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    Transparent = True
    BevelWidth = 0
    FrameSides = []
    ShadowColor = clTeal
    TextStyle = tsShadow
  end
  object imgDlgIcon: TImage
    Left = 8
    Top = 8
    Width = 57
    Height = 57
    Center = True
  end
  object lblMessage: TRzLabel
    Left = 80
    Top = 40
    Width = 273
    Height = 49
    AutoSize = False
    Caption = 'lblMessage'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
    FrameSides = []
    TextStyle = tsNormal
  end
  object rzDlgButtons: TRzDialogButtons
    Left = 0
    Top = 95
    Width = 360
    CaptionOk = 'OK'
    CaptionCancel = 'Cancel'
    CaptionHelp = 'Help'
    EnableOk = True
    EnableCancel = True
    EnableHelp = False
    FrameFlat = True
    OnClickOk = rzDlgButtonsClickOk
    TabOrder = 0
    OnClick = rzDlgButtonsClick
    object rzBtnBarBackground: TRzBackground
      Left = 0
      Top = 0
      Width = 360
      Height = 36
      Active = True
      Align = alClient
      GradientColorStart = clBlack
      GradientColorStop = clRed
      GradientDirection = gdVerticalEnd
      ImageStyle = isCenter
      ShowGradient = True
      ShowImage = False
      ShowTexture = False
    end
  end
end
