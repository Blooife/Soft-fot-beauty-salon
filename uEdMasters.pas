unit uEdMasters;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Samples.Spin, uMasters;

  const sOfLet =['А'..'Я','а'..'я','A'..'Z','a'..'z'];

type
  TFrmEdMasters = class(TForm)
    EdtSurName: TEdit;
    EdtName: TEdit;
    EdtSecName: TEdit;
    cbSpec: TComboBox;
    sEdtSalary: TSpinEdit;
    EdtNumber: TEdit;
    BtnSave: TButton;
    BtnCancel: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbGender: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure EdtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSaveClick(Sender: TObject);
    procedure cbSpecClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbSpecChange(Sender: TObject);
    procedure EdtSurNameKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNameKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSecNameKeyPress(Sender: TObject; var Key: Char);

  private
    function GetName: String;
    function GetNumber: String;
    function getSecName: String;
    function GetSurName: String;
   // function GetSalary: String;
    function GetSpec: TSpec;
    function GetGender: String;
    { Private declarations }
  public
    { Public declarations }

    function ShowNewMaster:Integer;
    function ShowEditMaster(const SurNAme, Name, SecName, Gender: String; Spec: TSpec; Number: String):Integer;
    property Name:String read GetName;
    property SurName: String read GetSurName;
    property SecName: String read getSecName;
    property Spec: TSpec read GetSpec;
  //  property Salary: String read GetSalary;
    property Number: String read GetNumber;
    property Gender: String read GetGender;
    
  end;

var
  FrmEdMasters: TFrmEdMasters;
  temp: TSpec;

implementation

{$R *.dfm}

{ TForm1 }
uses uAdd;

procedure TFrmEdMasters.BtnCancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TFrmEdMasters.BtnSaveClick(Sender: TObject);
begin
    if (EdtSurName.Text <> '') and (EdtName.Text <> '') and (EdtSecName.Text <> '') and (EdtNumber.Text <> '')
    and (cbGender.ItemIndex <> -1) and (cbSpec.ItemIndex <> -1) then
    begin
        FrmMasters.IncUsedSpec(spec);
        ModalResult := mrOk
    end
    else
    begin
        Application.MessageBox('Некоторые поля не заполнены', 'Ошибка!', MB_ICONERROR);
        Modalresult := mrnone;
    end;
end;

procedure TFrmEdMasters.cbSpecChange(Sender: TObject);
begin
    sEdtSalary.Text := spec.data.payment;
end;

procedure TFrmEdMasters.cbSpecClick(Sender: TObject);
var index, i: Integer;
begin
    temp := FrmMasters.headspec;
    index := cbSpec.ItemIndex;
    for i := 0 to Index-1 do
        temp := temp.next;
    sEdtSalary.Text := temp.data.payment;
end;

procedure TFrmEdMasters.EdtNameKeyPress(Sender: TObject; var Key: Char);
begin
    key := FrmAdd.CheckText(key);
end;

procedure TFrmEdMasters.EdtNumberKeyPress(Sender: TObject; var Key: Char);
const Digit: Set of Char=['0' .. '9', '(', ')', '+'];
begin
    if not (Key in Digit) and not (Key = #08) and not (Key = #46) then
    Key:=#0;
end;

procedure TFrmEdMasters.EdtSecNameKeyPress(Sender: TObject; var Key: Char);
begin
    key := FrmAdd.CheckText(key);
end;

procedure TFrmEdMasters.EdtSurNameKeyPress(Sender: TObject; var Key: Char);
begin
    key := FrmAdd.CheckText(key);
end;

procedure TFrmEdMasters.FormShow(Sender: TObject);
begin
    EdtSurName.SetFocus;
end;

function TFrmEdMasters.GetGender: String;
begin
    if cbGender.Text = 'женский' then
    result := cbGender.Items[1]
    else result := cbGender.Items[0];
end;

function TFrmEdMasters.GetName: String;
begin
    result := EdtName.Text;
end;

function TFrmEdMasters.GetNumber: String;
begin
    result := EdtNumber.Text;
end;

function TFrmEdMasters.getSecName: String;
begin
    result := EdtSecName.Text;
end;

function TFrmEdMasters.GetSpec: TSpec;
var index, i: Integer;
begin
    temp := FrmMasters.headspec.next;
    index := cbSpec.ItemIndex;
    for i := 1 to Index do
        temp := temp.next;
    result := temp;
end;

function TFrmEdMasters.GetSurName: String;
begin
    result := EdtSurName.Text;
end;

function TFrmEdMasters.ShowEditMaster(const SurNAme, Name, SecName, Gender: String; Spec: TSpec; Number: String):Integer;
  var Temp: TSpec;
  found: Boolean;
  i: Integer;
begin
    edtSurName.Text := SurName;
    edtName.Text := Name;
    edtSecName.Text := SecName;
    edtNumber.Text := Number;
    sEdtSalary.Text := spec.data.payment;
    if gender = 'мужской' then
        cbGender.ItemIndex := 0
    else cbGender.ItemIndex := 1;
    temp := FrmMasters.HeadSpec;
    i := 0;
    found := false;
    while not Found do
    begin
      temp := temp.next;
      if spec.data.spec = temp.data.spec then
      begin
          cbSpec.ItemIndex := i;
          Found := true;
      end;
      inc(i);
    end;
    FrmMasters.DecUsedSpec(temp);
    result := ShowModal;
end;

function TFrmEdMasters.ShowNewMaster: Integer;
begin
    edtSurName.Text := '';
    edtName.Text := '';
    edtSecName.Text := '';
    edtNumber.Text := '';
    cbGender.ItemIndex := -1;
    cbSpec.ItemIndex := -1;
    sedtSalary.Text := '0';
    cbSpec.Text := '';
    result := ShowModal;
end;

end.
