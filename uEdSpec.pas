unit uEdSpec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin;

  const sOfLet =['A'..'Я','а'..'я','A'..'Z','a'..'z'];

type
  TFrmEdSpec = class(TForm)
    sePayment: TSpinEdit;
    EdtNameSpec: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtnSave: TButton;
    BtnCancel: TButton;
    procedure sePaymentKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtNameSpecKeyPress(Sender: TObject; var Key: Char);

  private

    function GetSpec: String;
    function GetPayment: String;
    { Private declarations }

  public
    { Public declarations }
    function ShowNewSpec: Integer;
    function ShowEditSpec(const Spec, Payment: String): Integer;
    property Spec: String read GetSpec;
    property Payment: String read GetPayment;
  end;

var
  FrmEdSpec: TFrmEdSpec;

  const s = ['0'..'9'];

implementation

{$R *.dfm}

uses uadd;

procedure TFrmEdSpec.BtnSaveClick(Sender: TObject);
begin
    if (EdtNameSpec.Text <> '') and (sePayment.Text <> '') then
    ModalResult := mrOk
    else
    Application.MessageBox('Некоторые поля не заполнены', 'Ошибка!', MB_ICONERROR);
end;

procedure TFrmEdSpec.sePaymentKeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in s) and (key <> #8) then
      key := #0;
end;

function TFrmEdSpec.ShowEditSpec(const Spec, Payment: String): Integer;
begin
    EdtNameSpec.Text := spec;
    sepayment.Text := payment;
    result := showmodal;
end;

function TFrmEdSpec.ShowNewSpec: Integer;
begin
    EdtNameSpec.Text := '';
    sePayment.Text := '0';
    result := ShowModal;
end;

procedure TFrmEdSpec.EdtNameSpecKeyPress(Sender: TObject; var Key: Char);
begin
    key := FrmAdd.CheckText(key);
end;

procedure TFrmEdSpec.FormShow(Sender: TObject);
begin
    EdtNameSpec.SetFocus;
end;

function TFrmEdSpec.GetPayment: String;
begin
    result := sePayment.Text;
end;

function TFrmEdSpec.GetSpec: String;
begin
    Result := EdtNameSpec.Text;
end;

end.



