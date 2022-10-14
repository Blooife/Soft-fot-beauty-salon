object FrmEdServ: TFrmEdServ
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 215
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMode = pmAuto
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 27
    Width = 85
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1089#1083#1091#1075#1080
  end
  object Label2: TLabel
    Left = 8
    Top = 67
    Width = 107
    Height = 13
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100'('#1074' '#1088#1091#1073#1083#1103#1093')'
  end
  object Label3: TLabel
    Left = 8
    Top = 112
    Width = 95
    Height = 13
    Caption = #1042#1088#1077#1084#1103' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
  end
  object EditName: TEdit
    Left = 125
    Top = 24
    Width = 144
    Height = 21
    MaxLength = 25
    TabOrder = 0
    TextHint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1089#1083#1091#1075#1080
    OnKeyPress = EditNameKeyPress
  end
  object EditTime: TDateTimePicker
    Left = 125
    Top = 104
    Width = 144
    Height = 21
    Date = 44683.000000000000000000
    Format = 'HH:mm'
    Time = 44683.000000000000000000
    Kind = dtkTime
    TabOrder = 2
  end
  object BtnSave: TButton
    Left = 48
    Top = 160
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Default = True
    TabOrder = 3
    OnClick = BtnSaveClick
  end
  object BtnCancel: TButton
    Left = 144
    Top = 160
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = BtnCancelClick
  end
  object sEditPrice: TSpinEdit
    Left = 125
    Top = 64
    Width = 144
    Height = 22
    MaxValue = 25
    MinValue = 0
    TabOrder = 1
    Value = 0
    OnKeyPress = sEditPriceKeyPress
  end
end
