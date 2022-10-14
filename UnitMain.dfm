object FormClients: TFormClients
  Left = 0
  Top = 0
  Caption = 'FrmClients'
  ClientHeight = 491
  ClientWidth = 856
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ListClients: TListBox
    Left = 24
    Top = 56
    Width = 665
    Height = 409
    ItemHeight = 13
    TabOrder = 0
  end
  object MainPanel: TPanel
    AlignWithMargins = True
    Left = 714
    Top = 3
    Width = 139
    Height = 485
    Align = alRight
    Alignment = taRightJustify
    Ctl3D = True
    Enabled = False
    ParentCtl3D = False
    TabOrder = 1
    object ButAdd: TButton
      Left = 33
      Top = 72
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = ButAddClick
    end
    object ButChng: TButton
      Left = 33
      Top = 135
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
    end
    object ButDlt: TButton
      Left = 33
      Top = 200
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
    end
  end
end
