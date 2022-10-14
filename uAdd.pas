unit uAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXPickers,
  Vcl.ComCtrls, Vcl.Mask, Vcl.Menus;

  const sOfLet = ['A'..'Z','a'..'z'];

type
  TFrmAdd = class(TForm)
    LblName: TLabel;
    BtnSave: TButton;
    BtnCancel: TButton;
    LblSurName: TLabel;
    LblSecName: TLabel;
    LblNumber: TLabel;
    EditName: TEdit;
    EditSecName: TEdit;
    EditSurName: TEdit;
    LblDate: TLabel;
    DateReg: TDateTimePicker;
    GenderBox: TComboBox;
    LblGender: TLabel;
    EditNumber: TEdit;
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditNumberKeyPress(Sender: TObject; var Key: Char);
    procedure EditSurNameKeyPress(Sender: TObject; var Key: Char);
    procedure EditNameKeyPress(Sender: TObject; var Key: Char);
    procedure EditSecNameKeyPress(Sender: TObject; var Key: Char);

  private
    function GetDate: TDate;
    function GetName: String;
    function GetNumber: String;
    function getSecName: String;
    function GetSurName: String;
    function GetGender: String;
    { Private declarations }
  public
    { Public declarations }
    function ShowNewUser: Integer;
    function ShowEditUser(const SurName, Name, SecName, Gender, Number: String; const Date: TDate): INteger;
    property Name:String read GetName;
    property SurName: String read GetSurName;
    property SecName: String read getSecName;
    property Number: String read GetNumber;
    property Date: TDate read GetDate;
    property Gender: String read GetGender;
    function CheckText(var key: Char): Char;
  end;

var
  FrmAdd: TFrmAdd;
  PopEd: TEdit;

implementation

{$R *.dfm}

uses uClients;

procedure TFrmAdd.BtnCancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TFrmAdd.BtnSaveClick(Sender: TObject);
begin
    if (EditSurName.Text <> '') and (EditName.Text <> '') and (EditSecName.Text <> '') and (EditNumber.Text <> '') and (GenderBox.ItemIndex <> -1) then
    ModalResult := mrOk
    else
    Application.MessageBox('Некоторые поля не заполнены', 'Ошибка!', MB_ICONERROR);
end;

function TFrmAdd.CheckText(var key: Char): Char;
var i: integer;
begin
    i := ord(key);
    if not (key in sOflet) and (key <> #8) and (key <> #32) and (key <> #46) and (ord(key)<1040) and (ord(key)>1103) then
    begin
       key := #0;
    end;
    result := key;
end;

procedure TFrmAdd.EditNameKeyPress(Sender: TObject; var Key: Char);

begin
    key := CheckText(key);
end;

procedure TFrmAdd.EditNumberKeyPress(Sender: TObject; var Key: Char);
const Digit: Set of Char=['0' .. '9', '(', ')', '+'];
begin
    if not (Key in Digit) and not (Key = #08) and not (Key = #46) then
    Key:=#0;
end;

procedure TFrmAdd.EditSecNameKeyPress(Sender: TObject; var Key: Char);
begin
    key := Checktext(key);
end;

procedure TFrmAdd.EditSurNameKeyPress(Sender: TObject; var Key: Char);
begin
    key := CheckText(key);
end;

procedure TFrmAdd.FormShow(Sender: TObject);
begin
    editSurName.SetFocus;
end;

function TFrmAdd.GetDate: TDate;
begin
    result := DateReg.Date;
end;

function TFrmAdd.GetGender: String;
begin
    if GenderBox.Text = 'женский' then
    result := GenderBox.Items[0]
    else result := GenderBox.Items[1];
end;

function TFrmAdd.GetName: String;
begin
    result := EditName.Text;
end;

function TFrmAdd.GetNumber: String;
begin
    result := EditNumber.Text;
end;

function TFrmAdd.getSecName: String;
begin
    result := EditSecName.Text;
end;

function TFrmAdd.GetSurName: String;
begin
    result := EditSurName.Text;
end;

function TFrmAdd.ShowEditUser(const SurName, Name, SecName, Gender, Number: String; const Date: TDate): INteger;
begin
    editSurName.Text := SurName;
    editName.Text := Name;
    editSecName.Text := SecName;
    EditNumber.Text := Number;
    if gender = 'мужской' then
        GenderBox.ItemIndex := 1
    else GenderBox.ItemIndex := 0;
  //  editNumber.Text := Number;
    DateReg.Date := Date;
    Result := ShowModal;
end;

function TFrmAdd.ShowNewUser: Integer;
begin
    editSurName.Text := '';
    editName.Text := '';
    editSecName.Text := '';
    GenderBox.ItemIndex := -1;
    EditNumber.Text := '';
    DateReg.Date := Date;
    result := ShowModal;
end;

end.
