unit uEdServ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin;

  const sOfLet =['A'..'Я','а'..'я','A'..'Z','a'..'z'];

type
  TFrmEdServ = class(TForm)
    EditTime: TDateTimePicker;
    EditName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BtnSave: TButton;
    BtnCancel: TButton;
    sEditPrice: TSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure sEditPriceKeyPress(Sender: TObject; var Key: Char);
    procedure EditNameKeyPress(Sender: TObject; var Key: Char);
  private
    function GetName: String;
    function GetPrice: String;
    function GetTime: TTime;
    { Private declarations }
  public
    { Public declarations }
    function ShowEditServ(const Name, Price: String; const Time: TTime): Integer;
    function ShowNewServ: Integer;
    property Name: String read GetName;
    property Price: String read GetPrice;
    property Time: TTime read GetTime;
  end;

var
  FrmEdServ: TFrmEdServ;

implementation

{$R *.dfm}

uses uAdd;

procedure TFrmEdServ.BtnCancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TFrmEdServ.BtnSaveClick(Sender: TObject);
begin
      if (EditName.Text <> '') and (sEditPrice.Text <> '') and (sEditPrice.Text <> '0') and (EditTime.Time <> 0) then
      ModalResult := mrOk
      else
      Application.MessageBox('Некоторые поля не заполнены', 'Ошибка!', MB_ICONERROR);
end;

procedure TFrmEdServ.EditNameKeyPress(Sender: TObject; var Key: Char);
begin
    key := FrmAdd.CheckText(key);
end;

procedure TFrmEdServ.FormShow(Sender: TObject);
begin
    EditName.SetFocus;
end;

function TFrmEdServ.GetName: String;
begin
    result := editName.Text;
end;

function TFrmEdServ.GetPrice: String;
begin
    result := sEditPrice.Text;
end;

function TFrmEdServ.GetTime: TTime;
begin
    result := EditTime.Time;
end;

procedure TFrmEdServ.sEditPriceKeyPress(Sender: TObject; var Key: Char);
begin
    if key = '-' then
      key := #0;
end;

function TFrmEdServ.ShowEditServ(const Name, Price: String; const Time: TTime): Integer;
begin
    EditName.Text := Name;
    sEditPrice.Text := Price;
    EditTime.Time := Time;
    result := ShowModal;
end;

function TFrmEdServ.ShowNewServ: Integer;
begin
    EditName.Text := '';
    sEditPrice.Text := '0';
    EditTime.Time := 00.00;
    result := ShowModal;
end;

end.
