program BeutySalon;

uses
  Vcl.Forms,
  uClients in 'uClients.pas' {FrmClients},
  uAdd in 'uAdd.pas' {FrmAdd},
  uMainPage in 'uMainPage.pas' {MainForm},
  uMasters in 'uMasters.pas' {FrmMasters},
  uServ in 'uServ.pas' {FrmServ},
  uEdServ in 'uEdServ.pas' {FrmEdServ},
  uEdMasters in 'uEdMasters.pas' {FrmEdMasters},
  Vcl.Themes,
  Vcl.Styles,
  uEdRecord in 'uEdRecord.pas' {FrmEdRec},
  uEdSpec in 'uEdSpec.pas' {FrmEdSpec};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFrmClients, FrmClients);
  Application.CreateForm(TFrmAdd, FrmAdd);
  Application.CreateForm(TFrmMasters, FrmMasters);
  Application.CreateForm(TFrmServ, FrmServ);
  Application.CreateForm(TFrmEdServ, FrmEdServ);
  Application.CreateForm(TFrmEdMasters, FrmEdMasters);
  Application.CreateForm(TFrmEdRec, FrmEdRec);
  Application.CreateForm(TFrmEdSpec, FrmEdSpec);
  Application.Run;
end.
