object frmDynDllDemo: TfrmDynDllDemo
  Left = 295
  Top = 182
  Caption = 'Dynamic DLL Demo'
  ClientHeight = 173
  ClientWidth = 182
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object lblFreeBytes: TLabel
    Left = 30
    Top = 39
    Width = 129
    Height = 13
    Alignment = taCenter
    AutoSize = False
  end
  object lblFreeMBytes: TLabel
    Left = 30
    Top = 52
    Width = 129
    Height = 13
    Alignment = taCenter
    AutoSize = False
  end
  object btnBulbs: TSpeedButton
    Left = 80
    Top = 88
    Width = 30
    Height = 33
    NumGlyphs = 2
    OnClick = btnBulbsClick
    OnMouseMove = btnBulbsMouseMove
  end
  object btnExit: TBitBtn
    Left = 42
    Top = 138
    Width = 104
    Height = 31
    Caption = 'E&xit'
    DoubleBuffered = True
    Kind = bkClose
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 0
  end
  object cmbDrives: TDriveComboBox
    Left = 30
    Top = 13
    Width = 129
    Height = 19
    TabOrder = 1
    OnChange = cmbDrivesChange
  end
end
