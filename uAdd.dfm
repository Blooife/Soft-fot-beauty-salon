object FrmAdd: TFrmAdd
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 273
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMode = pmAuto
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LblName: TLabel
    Left = 26
    Top = 54
    Width = 27
    Height = 15
    Caption = #1048#1084#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LblSurName: TLabel
    Left = 26
    Top = 27
    Width = 56
    Height = 15
    Caption = #1060#1072#1084#1080#1083#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LblSecName: TLabel
    Left = 24
    Top = 81
    Width = 58
    Height = 15
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LblNumber: TLabel
    Left = 23
    Top = 136
    Width = 57
    Height = 15
    Caption = #1058#1077#1083#1077#1092#1086#1085':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LblDate: TLabel
    Left = 24
    Top = 165
    Width = 93
    Height = 15
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LblGender: TLabel
    Left = 24
    Top = 108
    Width = 26
    Height = 15
    Caption = #1055#1086#1083':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BtnSave: TButton
    Left = 65
    Top = 210
    Width = 89
    Height = 33
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Default = True
    TabOrder = 5
    OnClick = BtnSaveClick
  end
  object BtnCancel: TButton
    Left = 177
    Top = 210
    Width = 97
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    Default = True
    TabOrder = 6
    OnClick = BtnCancelClick
  end
  object EditName: TEdit
    Left = 145
    Top = 52
    Width = 161
    Height = 21
    MaxLength = 15
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    TextHint = #1048#1084#1103
    OnKeyPress = EditNameKeyPress
  end
  object EditSecName: TEdit
    Left = 145
    Top = 79
    Width = 161
    Height = 21
    MaxLength = 12
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    TextHint = #1054#1090#1095#1077#1089#1090#1074#1086
    OnKeyPress = EditSecNameKeyPress
  end
  object EditSurName: TEdit
    Left = 145
    Top = 25
    Width = 161
    Height = 21
    MaxLength = 15
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    TextHint = #1060#1072#1084#1080#1083#1080#1103
    OnKeyPress = EditSurNameKeyPress
  end
  object DateReg: TDateTimePicker
    Left = 145
    Top = 165
    Width = 161
    Height = 21
    Date = 36526.000000000000000000
    Time = 36526.000000000000000000
    MaxDate = 42370.999988425920000000
    MinDate = 2.000000000000000000
    TabOrder = 4
  end
  object GenderBox: TComboBox
    Left = 145
    Top = 106
    Width = 161
    Height = 21
    AutoComplete = False
    Style = csDropDownList
    DropDownCount = 2
    TabOrder = 3
    TextHint = #1055#1086#1083
    Items.Strings = (
      #1078#1077#1085#1089#1082#1080#1081
      #1084#1091#1078#1089#1082#1086#1081)
  end
  object EditNumber: TEdit
    Left = 145
    Top = 138
    Width = 161
    Height = 21
    TabOrder = 7
    TextHint = '+375291111111'
  end
end
