unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFormClients = class(TForm)
    ListClients: TListBox;
    ButAdd: TButton;
    ButChng: TButton;
    ButDlt: TButton;
    MainPanel: TPanel;
    procedure ButAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormClients: TFormClients;

implementation

{$R *.dfm}



procedure TFormClients.ButAddClick(Sender: TObject);
begin
    ButAdd.Caption := 'ghbdtn';
end;

end.
