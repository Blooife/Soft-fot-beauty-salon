
unit UnitClients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    PanelBtn: TPanel;
    ListClients: TListBox;
    BtnAdd: TButton;
    BtnChange: TButton;
    BtnDelete: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClients: TForm1;

implementation

{$R *.dfm}

end.
