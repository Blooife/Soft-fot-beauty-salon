object FrmClients: TFrmClients
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  Caption = #1050#1083#1080#1077#1085#1090#1099
  ClientHeight = 449
  ClientWidth = 795
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
  object PanelBtn: TPanel
    Left = 613
    Top = 0
    Width = 182
    Height = 275
    Align = alRight
    Alignment = taRightJustify
    TabOrder = 0
    ExplicitHeight = 416
    object Label2: TLabel
      Left = 64
      Top = 316
      Width = 94
      Height = 13
      Caption = #1054#1090#1089#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086
    end
    object BtnAdd: TButton
      Left = 72
      Top = 160
      Width = 75
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1083#1080#1077#1085#1090#1072' '#1074' '#1089#1087#1080#1089#1086#1082
      Action = actAddClient
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
    end
    object BtnEdit: TButton
      Left = 72
      Top = 213
      Width = 75
      Height = 25
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1074#1099#1073#1088#1072#1085#1085#1086#1084' '#1082#1083#1080#1077#1085#1090#1077'|'
      Action = actEditClient
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
    end
    object BtnDelete: TButton
      Left = 72
      Top = 269
      Width = 75
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1082#1083#1080#1077#1085#1090#1072' '#1080#1079' '#1089#1087#1080#1089#1082#1072
      Action = actDeleteClient
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
    end
    object btnFilters: TButton
      Left = 72
      Top = 370
      Width = 75
      Height = 25
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1092#1080#1083#1100#1090#1088#1099' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1087#1086' '#1089#1087#1080#1089#1082#1091
      Action = actFilters
      Caption = #1060#1080#1083#1100#1090#1088#1099
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
    end
    object cbSort: TComboBox
      Left = 41
      Top = 343
      Width = 137
      Height = 21
      Hint = #1054#1090#1089#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1088#1072#1079#1083#1080#1095#1085#1099#1084' '#1087#1086#1083#1103#1084
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = False
      TabOrder = 6
      OnClick = cbSortClick
      Items.Strings = (
        #1072#1083#1092#1072#1074#1080#1090#1091
        #1076#1072#1090#1077' '#1088#1086#1078#1076#1077#1085#1080#1103)
    end
    object BtnChoose: TButton
      Left = 72
      Top = 58
      Width = 75
      Height = 25
      Hint = #1044#1086#1089#1090#1091#1087#1085#1086' '#1087#1088#1080' '#1074#1099#1073#1086#1088#1077' '#1082#1083#1080#1077#1085#1090#1072' '#1076#1083#1103' '#1079#1072#1087#1080#1089#1080' '#1074' '#1089#1072#1083#1086#1085
      Action = actChoose
      Default = True
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
    end
    object BtnCancel: TButton
      Left = 72
      Top = 97
      Width = 75
      Height = 25
      Hint = #1044#1086#1089#1090#1091#1087#1085#1086' '#1087#1088#1080' '#1074#1099#1073#1086#1088#1077' '#1082#1083#1080#1077#1085#1090#1072' '#1076#1083#1103' '#1079#1072#1087#1080#1089#1080' '#1074' '#1089#1072#1083#1086#1085
      Action = actCancel
      Cancel = True
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 649
    Height = 444
    Caption = 'Panel1'
    TabOrder = 1
    object ListClients: TListView
      Left = 1
      Top = 1
      Width = 647
      Height = 442
      Align = alClient
      Columns = <
        item
          Caption = #1060#1072#1084#1080#1083#1080#1103
          MaxWidth = 100
          MinWidth = 100
          Width = 100
        end
        item
          Caption = #1048#1084#1103
          MaxWidth = 100
          MinWidth = 100
          Tag = 1
          Width = 100
        end
        item
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          MaxWidth = 100
          MinWidth = 100
          Tag = 2
          Width = 100
        end
        item
          Caption = #1055#1086#1083
          MaxWidth = 100
          MinWidth = 100
          Tag = 3
          Width = 100
        end
        item
          Caption = #1058#1077#1083#1077#1092#1086#1085
          MaxWidth = 100
          MinWidth = 100
          Tag = 4
          Width = 100
        end
        item
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          MaxWidth = -2
          MinWidth = -2
          Tag = 5
          Width = -2
          WidthType = (
            -2)
        end>
      ColumnClick = False
      DoubleBuffered = False
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentDoubleBuffered = False
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object PnlFilters: TPanel
    Left = 0
    Top = 275
    Width = 795
    Height = 174
    Align = alBottom
    TabOrder = 2
    Visible = False
    ExplicitLeft = -8
    ExplicitTop = 267
    object LblDateFrom: TLabel
      Left = 248
      Top = 43
      Width = 7
      Height = 13
      Caption = #1057
    end
    object LblDateTo: TLabel
      Left = 248
      Top = 89
      Width = 13
      Height = 13
      Caption = #1055#1086
    end
    object Label1: TLabel
      Left = 221
      Top = 24
      Width = 80
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
    end
    object LblFIO: TLabel
      Left = 72
      Top = 32
      Width = 23
      Height = 13
      Caption = #1060#1048#1054
    end
    object BtnSearch: TButton
      Left = 503
      Top = 142
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 0
      OnClick = BtnSearchClick
    end
    object DateTo: TDateTimePicker
      Left = 202
      Top = 108
      Width = 107
      Height = 21
      Date = 44682.000000000000000000
      Time = 44682.000000000000000000
      Enabled = False
      TabOrder = 1
    end
    object DateFrom: TDateTimePicker
      Left = 202
      Top = 62
      Width = 107
      Height = 21
      Date = 14611.000000000000000000
      Time = 0.890573993056023000
      Enabled = False
      TabOrder = 2
    end
    object BtnBack: TButton
      Left = 584
      Top = 141
      Width = 75
      Height = 25
      Caption = #1053#1072#1079#1072#1076
      TabOrder = 3
      OnClick = BtnBackClick
    end
    object rgGender: TRadioGroup
      Left = 376
      Top = 31
      Width = 185
      Height = 105
      Caption = #1055#1086#1083
      Enabled = False
      Items.Strings = (
        #1078#1077#1085#1089#1082#1080#1081
        #1084#1091#1078#1089#1082#1086#1081)
      TabOrder = 4
    end
    object chbDateFrom: TCheckBox
      Left = 178
      Top = 64
      Width = 18
      Height = 17
      TabOrder = 5
      OnClick = chbDateFromClick
    end
    object chbGender: TCheckBox
      Left = 354
      Top = 32
      Width = 16
      Height = 17
      TabOrder = 6
      OnClick = chbGenderClick
    end
    object chbDateTo: TCheckBox
      Left = 178
      Top = 104
      Width = 18
      Height = 17
      TabOrder = 7
      OnClick = chbDateToClick
    end
    object BtnClearFilters: TButton
      Left = 708
      Top = 140
      Width = 75
      Height = 25
      Action = actCleanFilters
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      TabOrder = 8
    end
    object EdtSurName: TEdit
      Left = 32
      Top = 56
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 9
      TextHint = #1060#1072#1084#1080#1083#1080#1103
    end
    object EdtName: TEdit
      Left = 32
      Top = 83
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 10
      TextHint = #1048#1084#1103
    end
    object EdtSecName: TEdit
      Left = 32
      Top = 110
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 11
      TextHint = #1054#1090#1095#1077#1089#1090#1074#1086
    end
    object chbSurName: TCheckBox
      Left = 9
      Top = 60
      Width = 17
      Height = 17
      TabOrder = 12
      OnClick = chbSurNameClick
    end
    object chbName: TCheckBox
      Left = 9
      Top = 87
      Width = 17
      Height = 17
      TabOrder = 13
      OnClick = chbNameClick
    end
    object chbSecName: TCheckBox
      Left = 9
      Top = 110
      Width = 17
      Height = 17
      TabOrder = 14
      OnClick = chbSecNameClick
    end
  end
  object actClients: TActionList
    OnUpdate = actClientsUpdate
    Left = 666
    Top = 16
    object actAddClient: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = actAddClientExecute
    end
    object actEditClient: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnExecute = actEditClientExecute
    end
    object actDeleteClient: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeleteClientExecute
    end
    object actFilters: TAction
      Caption = 'actFilters'
      OnExecute = actFiltersExecute
    end
    object actCleanFilters: TAction
      Caption = 'actCleanFilters'
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
