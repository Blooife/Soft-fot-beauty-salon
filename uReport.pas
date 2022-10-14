unit uReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uMainPage;

type
  TFrmReport = class(TForm)
    MReport: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReport: TFrmReport;

implementation

{$R *.dfm}



procedure TFrmReport.FormShow(Sender: TObject);
var temp: uMainPage.PlistOfRecords;
begin
    temp := uMainPage.Head.next;
    MReport.Lines.Clear;
    MReport.Lines.Add( '|----------------------------------------------------------------------------------------------------------------------------------------|');
    MReport.Lines.Add( '|      Время|         Услуга  |        Мастер     |            Клиент      |');
    MReport.Lines.Add( '|--------------------------------------------------------------------------|');
end;

end.
