object FrmServ: TFrmServ
  Left = 2
  Top = 2
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1059#1089#1083#1091#1075#1080
  ClientHeight = 359
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 569
    Height = 359
    Align = alLeft
    TabOrder = 0
    object ListOfServ: TListView
      Left = 0
      Top = 0
      Width = 530
      Height = 357
      Columns = <
        item
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1089#1083#1091#1075#1080
          MaxWidth = 150
          MinWidth = 150
          Width = 150
        end
        item
          Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
          MaxWidth = 150
          MinWidth = 150
          Width = 150
        end
        item
          Caption = #1042#1088#1077#1084#1103' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
          Width = -2
          WidthType = (
            -2)
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object PnlRight: TPanel
    Left = 532
    Top = 0
    Width = 161
    Height = 359
    Align = alRight
    TabOrder = 1
    object Label5: TLabel
      Left = 37
      Top = 256
      Width = 94
      Height = 13
      Caption = #1054#1090#1089#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086
    end
    object BtnAdd: TButton
      Left = 43
      Top = 129
      Width = 75
      Height = 25
      Action = actAddServ
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
    end
    object BtnEdit: TButton
      Left = 43
      Top = 176
      Width = 75
      Height = 25
      Action = actEditServ
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
    end
    object BtnDelete: TButton
      Left = 43
      Top = 220
      Width = 75
      Height = 25
      Action = actDeleteServ
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
    end
    object BtnFilters: TButton
      Left = 43
      Top = 302
      Width = 75
      Height = 25
      Action = actFilters
      TabOrder = 3
    end
    object cbSort: TComboBox
      Left = 4
      Top = 275
      Width = 154
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      OnClick = cbSortClick
      Items.Strings = (
        #1040#1083#1092#1072#1074#1080#1090#1091
        #1057#1090#1086#1080#1084#1086#1089#1090#1100'(min)'
        #1057#1090#1086#1080#1084#1086#1089#1090#1100'(max)'
        #1042#1088#1077#1084#1103' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103'(min)'
        #1042#1088#1077#1084#1103' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103'(max)')
    end
    object BtnChoose: TButton
      Left = 43
      Top = 41
      Width = 75
      Height = 25
      Action = actChoose
      Default = True
      TabOrder = 5
    end
    object BtnCancel: TButton
      Left = 43
      Top = 72
      Width = 75
      Height = 25
      Action = actCancel
      Cancel = True
      TabOrder = 6
    end
  end
  object PnlFilters: TPanel
    Left = -3
    Top = 240
    Width = 696
    Height = 119
    TabOrder = 2
    Visible = False
    object LblPrice: TLabel
      Left = 248
      Top = 5
      Width = 54
      Height = 13
      Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
    end
    object LblTime: TLabel
      Left = 491
      Top = 2
      Width = 95
      Height = 13
      Caption = #1042#1088#1077#1084#1103' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
    end
    object Label1: TLabel
      Left = 264
      Top = 24
      Width = 14
      Height = 13
      Caption = #1054#1090
    end
    object Label2: TLabel
      Left = 264
      Top = 71
      Width = 14
      Height = 13
      Caption = #1044#1086
    end
    object Label3: TLabel
      Left = 441
      Top = 26
      Width = 14
      Height = 13
      Caption = #1054#1090
    end
    object Label4: TLabel
      Left = 608
      Top = 26
      Width = 14
      Height = 13
      Caption = #1044#1086
    end
    object Label6: TLabel
      Left = 56
      Top = 8
      Width = 85
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1089#1083#1091#1075#1080
    end
    object chbPriceFrom: TCheckBox
      Left = 192
      Top = 45
      Width = 17
      Height = 17
      TabOrder = 0
      OnClick = chbPriceFromClick
    end
    object chbPriceTo: TCheckBox
      Left = 192
      Top = 87
      Width = 17
      Height = 17
      TabOrder = 1
      OnClick = chbPriceToClick
    end
    object chbTimeFrom: TCheckBox
      Left = 363
      Top = 48
      Width = 17
      Height = 17
      TabOrder = 2
      OnClick = chbTimeFromClick
    end
    object chbTimeTo: TCheckBox
      Left = 536
      Top = 47
      Width = 17
      Height = 17
      TabOrder = 3
      OnClick = chbTimeToClick
    end
    object sEdtPriceFrom: TSpinEdit
      Left = 215
      Top = 43
      Width = 121
      Height = 22
      Enabled = False
      MaxValue = 0
      MinValue = 0
      TabOrder = 4
      Value = 0
      OnKeyPress = sEdtPriceFromKeyPress
    end
    object sEdtPriceTo: TSpinEdit
      Left = 215
      Top = 90
      Width = 121
      Height = 22
      Enabled = False
      MaxValue = 0
      MinValue = 0
      TabOrder = 5
      Value = 0
      OnKeyPress = sEdtPriceToKeyPress
    end
    object TimeFrom: TDateTimePicker
      Left = 386
      Top = 45
      Width = 130
      Height = 21
      Date = 44688.000000000000000000
      Format = 'HH:mm'
      Time = 44688.000000000000000000
      Enabled = False
      Kind = dtkTime
      TabOrder = 6
    end
    object TimeTo: TDateTimePicker
      Left = 559
      Top = 45
      Width = 130
      Height = 21
      Date = 44688.000000000000000000
      Format = 'HH:mm'
      Time = 44688.000000000000000000
      Enabled = False
      Kind = dtkTime
      TabOrder = 7
    end
    object BtnOk: TButton
      Left = 417
      Top = 88
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 8
      OnClick = BtnOkClick
    end
    object BtnBack: TButton
      Left = 511
      Top = 88
      Width = 75
      Height = 25
      Caption = #1053#1072#1079#1072#1076
      TabOrder = 9
      OnClick = BtnBackClick
    end
    object BtnClean: TButton
      Left = 608
      Top = 88
      Width = 75
      Height = 25
      Action = actCleanFilters
      TabOrder = 10
    end
    object EdtName: TEdit
      Left = 33
      Top = 45
      Width = 136
      Height = 21
      Enabled = False
      TabOrder = 11
      TextHint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1089#1083#1091#1075#1080
    end
    object chbName: TCheckBox
      Left = 10
      Top = 48
      Width = 17
      Height = 17
      TabOrder = 12
      OnClick = chbNameClick
    end
  end
  object actServ: TActionList
    OnUpdate = actServUpdate
    Left = 656
    Top = 16
    object actAddServ: TAction
      Caption = 'actAddServ'
      OnExecute = actAddServExecute
    end
    object actEditServ: TAction
      Caption = 'actEditServ'
      OnExecute = actEditServExecute
    end
    object actDeleteServ: TAction
      Caption = 'actDeleteServ'
      OnExecute = actDeleteServExecute
    end
    object actFilters: TAction
      Caption = #1060#1080#1083#1100#1090#1088#1099
      OnExecute = actFiltersExecute
    end
    object actCleanFilters: TAction
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnExecute = actCleanFiltersExecute
    end
    object actChoose: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Enabled = False
      OnExecute = actChooseExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Enabled = False
      OnExecute = actCancelExecute
    end
  end
end
