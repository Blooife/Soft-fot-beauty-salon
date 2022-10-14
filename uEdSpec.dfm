object FrmEdSpec: TFrmEdSpec
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  ClientHeight = 235
  ClientWidth = 311
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
    Top = 64
    Width = 127
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1080
  end
  object Label2: TLabel
    Left = 97
    Top = 115
    Width = 38
    Height = 13
    Caption = #1054#1087#1083#1072#1090#1072
  end
  object sePayment: TSpinEdit
    Left = 156
    Top = 112
    Width = 137
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 0
    OnKeyPress = sePaymentKeyPress
  end
  object EdtNameSpec: TEdit
    Left = 156
    Top = 61
    Width = 137
    Height = 21
    TabOrder = 0
    TextHint = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
    OnKeyPress = EdtNameSpecKeyPress
  end
  object BtnSave: TButton
    Left = 60
    Top = 176
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Default = True
    TabOrder = 2
    OnClick = BtnSaveClick
  end
  object BtnCancel: TButton
    Left = 156
    Top = 176
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
end
