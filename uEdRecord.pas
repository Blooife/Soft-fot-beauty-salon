unit uEdRecord;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, uMasters
  , uClients, uServ, uMainPage, System.Actions, Vcl.ActnList;

type
  TFrmEdRec = class(TForm)
    TimePicker: TDateTimePicker;
    BitBtnPServ: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    EditServ: TEdit;
    EditMaster: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EditClient: TEdit;
    BitBtnPMaster: TBitBtn;
    BitBtnpClient: TBitBtn;
    BtnSave: TButton;
    BtnCancel: TButton;
    actAddRec: TActionList;
    actMaster: TAction;
    tto: TDateTimePicker;
    Label5: TLabel;
    actClient: TAction;

    procedure BtnSaveClick(Sender: TObject);
    procedure actMasterExecute(Sender: TObject);
    procedure actAddRecUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure TimePickToKeyPress(Sender: TObject; var Key: Char);
    procedure ttoKeyPress(Sender: TObject; var Key: Char);
    procedure TimePickerChange(Sender: TObject);
    procedure actClientExecute(Sender: TObject);
    procedure BitBtnPServClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure CheckBusy;
    procedure EditClientChange(Sender: TObject);

  private

    { Private declarations }
    function GetMaster: PListOfMasters;
    function GetClient: PlistOfClients;
    function GetServ: PlistOfServ;
    function GetTimeFrom: TTime;
    function getTimeTo: TTime;
    procedure SetClient(const Value: PlistOfClients);
    procedure SetMaster(const Value: PListOfMasters);
    procedure SetServ(const Value: PlistOfServ);

    var TempCL: PListOfClients;
    TempMast: PListOfMasters;
    TempServ: PListOfServ;

  public
    { Public declarations }

    function ShowNewRec: Integer;
    function ShowEditRec(const TimeFrom, TimeTo: TTime; const Serv: PListOfServ;
    const Master: PListOfMasters; const Client: PListOfClients; const TempEd: PListOfRecords): Integer;
    property TimeFrom: TTime read GetTimeFrom;
    property TimeTo: TTime read getTimeTo;
    property Master: PListOfMasters read GetMaster write SetMaster;
    property Client: PlistOfClients read GetClient write SetClient;
    property Serv: PlistOfServ read GetServ write SetServ;
    var TempEdit: PListOfRecords;

  end;

var
  FrmEdRec: TFrmEdRec;


implementation

{$R *.dfm}

procedure TFrmEdRec.actAddRecUpdate(Action: TBasicAction; var Handled: Boolean);
begin
//    actMaster.Enabled := EditServ.Text <> '';
//    actClient.Enabled := EditServ.Text <> '';
end;

procedure TFrmEdRec.actClientExecute(Sender: TObject);
var res: TModalResult;
begin
    FrmClients.actChoose.Enabled := true;
    FrmCLients.actCancel.Enabled := true;
   // uClients.Choose := false;
    res := FrmClients.ShowModal;
    //  uClients.Choose := true;;
end;

procedure TFrmEdRec.actMasterExecute(Sender: TObject);
var res: TModalResult;
begin
    FrmMasters.actChoose.Enabled := true;
    FrmMasters.actCancel.Enabled := true;
 //   uMasters.Choose := false;
    res := FrmMasters.ShowModal;
 //   Choose := true;
end;


procedure TFrmEdRec.BitBtnPServClick(Sender: TObject);
var res: TModalResult;
begin
    FrmServ.actChoose.Enabled := true;
    FrmServ.actCancel.Enabled := true;
   // uServ.Choose := false;
    res := FrmServ.ShowModal;
    if res = mrOk then
        tto.time := MainForm.AddTime(TimePicker.Time, serv.info.Time);
  //  uServ.Choose := true;
    CheckBusy;
end;

procedure TFrmEdRec.BtnCancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TFrmEdRec.BtnSaveClick(Sender: TObject);
begin
    if (EdiTserv.Text <> '') and (EditMAster.Text <> '') and (EditClient.Text <> '') then
        ModalResult := mrOk
    else Application.MessageBox('Некоторые поля не заполнены', 'Ошибка!', MB_ICONERROR);
end;

procedure TFrmEdRec.CheckBusy;
var Mast, Cl: Boolean;
bool: Byte;
begin
     if (EditMaster.Text <> '') then
    begin
        bool:=FrmMasters.Check(Master);
        if bool=1 then
        begin
            Application.MessageBox('Мастер занят в это время. Попробуйте выбрать другого мастера или время!', 'Error!', MB_ICONERROR);
            Mast := false;
        end
        else if bool = 0 then
        begin
            Application.MessageBox('Мастер не работает в это время!', 'Error!', MB_ICONERROR);
            Mast := false;
        end
        else Mast := true;
    end;
    if EditClient.Text <> '' then
    begin
        if not FrmClients.Check(Client) then
        begin
            Application.MessageBox('Клиент занят в это время. Попробуйте выбрать другое время!', 'Error!', MB_ICONERROR);
            Cl := false;
        end
        else Cl := true;
    end;
    BtnSave.Enabled := Mast and Cl;
end;

procedure TFrmEdRec.EditClientChange(Sender: TObject);
begin
    CheckBusy;
end;

function TFrmEdRec.GetClient: PlistOfClients;
var temp: PListOfClients;
begin
    temp := TempCl;
    result := TempCl;
end;

function TFrmEdRec.GetMaster: PListOfMasters;
var temp: PListOfMasters;
rec: PListOfRecords;
busy: Boolean;
begin
    result := TempMast;
end;

function TFrmEdRec.GetServ: PlistOfServ;
var
temp: PListOfServ;
begin
    result := tempServ;
end;

function TFrmEdRec.GetTimeFrom: TTime;
begin
    result := TimePicker.Time;
end;

function TFrmEdRec.GetTimeTo: TTime;
begin
    result := TTo.Time;
end;

procedure TFrmEdRec.SetClient(const Value: PlistOfClients);
begin
    EditClient.Text := value.Info.SurName+' ' + value.Info.Name;
    TempCl :=  Value;
end;

procedure TFrmEdRec.SetMaster(const Value: PListOfMasters);
begin
    EditMaster.Text := value.Info.SurName +' '+value.Info.Name;
    TempMast := Value;
end;

procedure TFrmEdRec.SetServ(const Value: PlistOfServ);
begin
    EditServ.Text := value.info.Name;
    TempServ := Value;
end;

function TFrmEdRec.ShowEditRec(const TimeFrom, TimeTo: TTime; const Serv: PListOfServ;
  const Master: PListOfMasters; const Client: PListOfClients; const TempEd: PListOfRecords): Integer;
begin
    TimePicker.Time := TimeFrom;
    Tto.time := TimeTo;
    SetClient(Client);
    SetMaster(Master);
    SetServ(Serv);
    TempEdit := tempEd;
    Result := ShowModal;
end;

function TFrmEdRec.ShowNewRec: Integer;
begin
    TimePicker.Time := 00.00;
    tto.Time := 00.00;
    EditServ.Text := '';
    EditMaster.text := '';
    EditClient.text := '';
    Result := ShowModal;
end;

procedure TFrmEdRec.TimePickerChange(Sender: TObject);
begin
    if EditServ.Text <> ''  then
        tto.time := MainForm.AddTime(TimePicker.Time, serv.info.Time);
    CheckBusy;
end;

procedure TFrmEdRec.TimePickToKeyPress(Sender: TObject; var Key: Char);
begin
    key := #0;
end;

procedure TFrmEdRec.ttoKeyPress(Sender: TObject; var Key: Char);
begin
    key := #0;
end;

end.
