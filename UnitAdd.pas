unit UnitAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    LName: TLabel;
    EdtName: TEdit;
    BtnSave: TButton;
    BtnCancel: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAdd: TForm1;

implementation



{$R *.dfm}

end.
