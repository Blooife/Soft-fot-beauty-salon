object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'FrmClients'
  ClientHeight = 510
  ClientWidth = 874
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBtn: TPanel
    Left = 728
    Top = 0
    Width = 146
    Height = 510
    Align = alRight
    TabOrder = 0
    object BtnAdd: TButton
      Left = 24
      Top = 88
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
    end
    object BtnChange: TButton
      Left = 24
      Top = 144
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
    end
    object BtnDelete: TButton
      Left = 24
      Top = 200
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
    end
  end
  object ListClients: TListBox
    Left = 32
    Top = 48
    Width = 682
    Height = 454
    ItemHeight = 13
    TabOrder = 1
  end
end
