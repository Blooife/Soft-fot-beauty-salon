program kursach;

uses
  Vcl.Forms,
  UnitClients in 'UnitClients.pas',

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Run;
end.
