object FrmEdMasters: TFrmEdMasters
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 327
  ClientWidth = 324
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
    Left = 32
    Top = 19
    Width = 44
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103
  end
  object Label2: TLabel
    Left = 32
    Top = 56
    Width = 19
    Height = 13
    Caption = #1048#1084#1103
  end
  object Label3: TLabel
    Left = 32
    Top = 91
    Width = 49
    Height = 13
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086
  end
  object Label4: TLabel
    Left = 32
    Top = 128
    Width = 19
    Height = 13
    Caption = #1055#1086#1083
  end
  object Label5: TLabel
    Left = 32
    Top = 163
    Width = 78
    Height = 13
    Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
  end
  object Label6: TLabel
    Left = 32
    Top = 205
    Width = 48
    Height = 13
    Caption = #1047#1072#1088#1087#1083#1072#1090#1072
  end
  object Label7: TLabel
    Left = 32
    Top = 243
    Width = 84
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
  end
  object EdtSurName: TEdit
    Left = 152
    Top = 16
    Width = 145
    Height = 21
    MaxLength = 25
    TabOrder = 0
    TextHint = #1060#1072#1084#1080#1083#1080#1103
    OnKeyPress = EdtSurNameKeyPress
  end
  object EdtName: TEdit
    Left = 152
    Top = 53
    Width = 145
    Height = 21
    MaxLength = 15
    TabOrder = 1
    TextHint = #1048#1084#1103
    OnKeyPress = EdtNameKeyPress
  end
  object EdtSecName: TEdit
    Left = 152
    Top = 88
    Width = 145
    Height = 21
    MaxLength = 20
    TabOrder = 2
    TextHint = #1054#1090#1095#1077#1089#1090#1074#1086
    OnKeyPress = EdtSecNameKeyPress
  end
  object cbSpec: TComboBox
    Left = 152
    Top = 160
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 4
    TextHint = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
    OnChange = cbSpecChange
    OnClick = cbSpecClick
  end
  object sEdtSalary: TSpinEdit
    Left = 152
    Top = 202
    Width = 145
    Height = 22
    MaxValue = 0
    MinValue = 0
    ReadOnly = True
    TabOrder = 5
    Value = 0
  end
  object EdtNumber: TEdit
    Left = 152
    Top = 236
    Width = 145
    Height = 21
    MaxLength = 13
    TabOrder = 6
    TextHint = '+375291111111'
    OnKeyPress = EdtNumberKeyPress
  end
  object BtnSave: TButton
    Left = 72
    Top = 280
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 7
    OnClick = BtnSaveClick
  end
  object BtnCancel: TButton
    Left = 169
    Top = 280
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 8
    OnClick = BtnCancelClick
  end
  object cbGender: TComboBox
    Left = 152
    Top = 125
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 3
    TextHint = #1055#1086#1083
    Items.Strings = (
      #1084#1091#1078#1089#1082#1086#1081
      #1078#1077#1085#1089#1082#1080#1081)
  end
end
