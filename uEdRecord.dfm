object FrmEdRec: TFrmEdRec
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 234
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMode = pmAuto
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 22
    Top = 35
    Width = 69
    Height = 13
    Caption = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072
  end
  object Label2: TLabel
    Left = 22
    Top = 57
    Width = 85
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1089#1083#1091#1075#1080
  end
  object Label3: TLabel
    Left = 22
    Top = 141
    Width = 37
    Height = 13
    Caption = #1052#1072#1089#1090#1077#1088
  end
  object Label4: TLabel
    Left = 23
    Top = 114
    Width = 37
    Height = 13
    Caption = #1050#1083#1080#1077#1085#1090
  end
  object Label5: TLabel
    Left = 23
    Top = 84
    Width = 87
    Height = 13
    Caption = #1042#1088#1077#1084#1103' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
  end
  object TimePicker: TDateTimePicker
    Left = 116
    Top = 27
    Width = 186
    Height = 21
    Date = 44697.000000000000000000
    Format = 'HH:mm'
    Time = 44697.000000000000000000
    Kind = dtkTime
    TabOrder = 0
    OnChange = TimePickerChange
  end
  object BitBtnPServ: TBitBtn
    Left = 308
    Top = 54
    Width = 31
    Height = 21
    Cursor = crHandPoint
    Glyph.Data = {
      06030000424D060300000000000036000000280000000F0000000F0000000100
      180000000000D0020000120B0000120B00000000000000000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000DADADADBDBDBDADADAD9D9D9D9D9D9D9D9D9DADADADC
      DCDCDADADAD9D9D9D9D9D9D9D9D9DBDBDBDBDBDBD9D9D9000000C2C2C2888888
      BBBBBBDADADAD9D9D9DADADABDBDBD898989C5C5C5DADADAD9D9D9D7D7D7A6A6
      A6A1A1A1D3D3D3000000505050090909575757D4D4D4DADADAD9D9D96D6D6D07
      0707898989DCDCDCDADADAC7C7C7333333202020B5B5B5000000B0B0B06B6B6B
      949494D7D7D7D9D9D9D9D9D9A7A7A76B6B6BBDBDBDDADADAD9D9D9D5D5D58A8A
      8A7A7A7ACDCDCD000000DADADADADADADADADAD9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9DADADAD9D9D9D9D9D9D9D9D9D9D9D9DADADADADADA000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000}
    TabOrder = 1
    OnClick = BitBtnPServClick
  end
  object EditServ: TEdit
    Left = 117
    Top = 54
    Width = 185
    Height = 21
    ReadOnly = True
    TabOrder = 8
  end
  object EditMaster: TEdit
    Left = 116
    Top = 138
    Width = 186
    Height = 21
    ReadOnly = True
    TabOrder = 9
  end
  object EditClient: TEdit
    Left = 117
    Top = 111
    Width = 185
    Height = 21
    ReadOnly = True
    TabOrder = 7
    OnChange = EditClientChange
  end
  object BitBtnPMaster: TBitBtn
    Left = 308
    Top = 138
    Width = 31
    Height = 21
    Cursor = crHandPoint
    Action = actMaster
    Glyph.Data = {
      06030000424D060300000000000036000000280000000F0000000F0000000100
      180000000000D0020000120B0000120B00000000000000000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000DADADADBDBDBDADADAD9D9D9D9D9D9D9D9D9DADADADC
      DCDCDADADAD9D9D9D9D9D9D9D9D9DBDBDBDBDBDBD9D9D9000000C2C2C2888888
      BBBBBBDADADAD9D9D9DADADABDBDBD898989C5C5C5DADADAD9D9D9D7D7D7A6A6
      A6A1A1A1D3D3D3000000505050090909575757D4D4D4DADADAD9D9D96D6D6D07
      0707898989DCDCDCDADADAC7C7C7333333202020B5B5B5000000B0B0B06B6B6B
      949494D7D7D7D9D9D9D9D9D9A7A7A76B6B6BBDBDBDDADADAD9D9D9D5D5D58A8A
      8A7A7A7ACDCDCD000000DADADADADADADADADAD9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9DADADAD9D9D9D9D9D9D9D9D9D9D9D9DADADADADADA000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000}
    TabOrder = 3
  end
  object BitBtnpClient: TBitBtn
    Left = 308
    Top = 108
    Width = 31
    Height = 21
    Cursor = crHandPoint
    Action = actClient
    Glyph.Data = {
      06030000424D060300000000000036000000280000000F0000000F0000000100
      180000000000D0020000120B0000120B00000000000000000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000DADADADBDBDBDADADAD9D9D9D9D9D9D9D9D9DADADADC
      DCDCDADADAD9D9D9D9D9D9D9D9D9DBDBDBDBDBDBD9D9D9000000C2C2C2888888
      BBBBBBDADADAD9D9D9DADADABDBDBD898989C5C5C5DADADAD9D9D9D7D7D7A6A6
      A6A1A1A1D3D3D3000000505050090909575757D4D4D4DADADAD9D9D96D6D6D07
      0707898989DCDCDCDADADAC7C7C7333333202020B5B5B5000000B0B0B06B6B6B
      949494D7D7D7D9D9D9D9D9D9A7A7A76B6B6BBDBDBDDADADAD9D9D9D5D5D58A8A
      8A7A7A7ACDCDCD000000DADADADADADADADADAD9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9DADADAD9D9D9D9D9D9D9D9D9D9D9D9DADADADADADA000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9000000D9D9D9D9D9D9
      D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
      D9D9D9D9D9D9D9000000}
    TabOrder = 2
  end
  object BtnSave: TButton
    Left = 77
    Top = 176
    Width = 83
    Height = 33
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    OnClick = BtnSaveClick
  end
  object BtnCancel: TButton
    Left = 181
    Top = 176
    Width = 83
    Height = 33
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = BtnCancelClick
  end
  object tto: TDateTimePicker
    Left = 116
    Top = 81
    Width = 186
    Height = 21
    Date = 44697.000000000000000000
    Format = 'HH:mm'
    Time = 44697.000000000000000000
    Kind = dtkTime
    TabOrder = 6
    OnKeyPress = ttoKeyPress
  end
  object actAddRec: TActionList
    OnUpdate = actAddRecUpdate
    Left = 328
    Top = 23
    object actMaster: TAction
      OnExecute = actMasterExecute
    end
    object actClient: TAction
      OnExecute = actClientExecute
    end
  end
end
