unit uMainPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, uServ, uMasters, uClients;

type

  TInfo = record
    date: TDate;
    TimeFrom, TimeTo: TTime;
    Id: array[1..3] of Integer;
    Sum: String[20 ];
  end;

  PlistOfRecords = ^elem;
  elem = record
    info: TInfo;
    Serv: PListOfServ;
    Master: PLIstOfMasters;
    Client: PListOfClients;
    Next: PListOfRecords
    end;

  TMainForm = class(TForm)
    Panel: TPanel;
    MainImages: TImageList;
    aMain: TActionList;
    actClients: TAction;
    ToolBar1: TToolBar;
    PanelMainIm: TPanel;
    actMaster: TAction;
    actServ: TAction;
    actReport: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    Calend: TMonthCalendar;
    lvRecords: TListView;
    ButAdd: TButton;
    ButEdit: TButton;
    ButDelete: TButton;
    actRec: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDelete: TAction;
    MainMenu: TMainMenu;
    N1: TMenuItem;
    actSched: TAction;
    actSpec: TAction;
    N2: TMenuItem;
    actMaster1: TMenuItem;
    actSched1: TMenuItem;
    actSpec1: TMenuItem;
    actServ1: TMenuItem;
    N3: TMenuItem;
    BtnFilters: TButton;
    actFilters: TAction;
    PnlFilters: TPanel;
    cbServ: TComboBox;
    cbMaster: TComboBox;
    cbClient: TComboBox;
    BtnOk: TButton;
    BtnBack: TButton;
    BtnClean: TButton;
    actClean: TAction;
    CheckCl: TCheckBox;
    CheckMast: TCheckBox;
    checkServ: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    N4: TMenuItem;
    SaveDial: TSaveDialog;
    LblMainText: TLabel;
    procedure WriteInFile;
    procedure ReadFromFile;
    procedure actClientsExecute(Sender: TObject);
    procedure actMasterExecute(Sender: TObject);
    procedure actServExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAddExecute(Sender: TObject);
    procedure actSchedExecute(Sender: TObject);
    procedure actSpecExecute(Sender: TObject);


    procedure ModelAddItem(const TimeFrom, TimeTo: TTime; Serv: PListOfServ; Master: PListOfMasters;
    Client: PListOfClients);
    procedure FormCreate(Sender: TObject);

    function AddTime(const TimeFrom, TimeAdd:TTime): TTime;
    procedure ModelEditItem(const TimeFrom, TimeTo: TTime; Serv: PListOfServ; Master: PListOfMasters;
    Client: PListOfClients; temp: PListOfRecords);
    procedure UpdateList;
    procedure CalendClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);

    procedure DisposeAll;
    procedure actFiltersExecute(Sender: TObject);
    procedure checkServClick(Sender: TObject);
    procedure CheckMastClick(Sender: TObject);
    procedure CheckClClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure actCleanExecute(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure actRecUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure SaveToFile;
    procedure actReportExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  Head, LRec: PListOfRecords;
  FileOfRecords: File of TInfo;

implementation

{$R *.dfm}

uses uEdRecord, Dateutils;

procedure TMainForm.actAddExecute(Sender: TObject);
var res: TModalresult;
begin
    res := FrmEdRec.ShowNewRec;
    if res <> mrOk  then exit;
    with FrmedRec do
    ModelAddItem(TimeFrom, TimeTo, Serv, Master, Client);
    UpdateList;
end;

procedure TMainForm.actCleanExecute(Sender: TObject);
begin
    cbServ.Enabled := false;
    checkServ.Checked := false;
    cbMaster.Enabled := false;
    checkMast.Checked := false;
    cbClient.Enabled := false;
    checkCl.Checked := false;
    cbServ.ItemIndex := -1;
    cbServ.ItemIndex := -1;
    cbServ.ItemIndex := -1;
end;

procedure TMainForm.actClientsExecute(Sender: TObject);
var Res: TModalResult;
begin
   res := FrmClients.ShowClients;
end;

procedure TMainForm.actDeleteExecute(Sender: TObject);
var index, i: Integer;
temp, buf: PListOfRecords;
begin
    index := lvRecords.ItemIndex;
    i := 0;
    if lvRecords.Selected <> nil then
    begin
        temp := head;
        while temp.next.info.date <> Calend.Date do
              temp := temp.next;
        index := lvRecords.ItemIndex;
        i := 0;
        while i <> index do
        begin
          if temp.next.info.date = Calend.Date then
          begin
              inc(i);
          end;
          temp :=temp.next;
        end;
        if temp.next.next = nil then
        begin
            buf := temp.next;
            temp.next := nil;
            Dispose(buf);
        end else
        begin
            buf := temp.next;
            temp.next := buf.next;
            Dispose(Buf);
        end;
        Updatelist;
    end
    else Application.MessageBox('Выберите запись для удаления', 'Error!', MB_ICONERROR);
end;

procedure TMainForm.actEditExecute(Sender: TObject);
var res: TModalResult;
i, index: Integer;
temp: PListOfRecords;
begin
    if lvRecords.Selected <> nil then
    begin
        temp := head.next;
        while temp.info.date <> Calend.Date do
              temp := temp.next;
        index := lvRecords.ItemIndex;
        i := 0;
        while i <> index do
        begin
          if temp.info.date = Calend.Date then
          begin
              inc(i);
          end;
          temp :=temp.next;
        end;
        res := FrmEdRec.ShowEditRec(temp.info.TimeFrom, temp.info.TimeTo, temp.Serv, temp.Master, temp.Client, temp);
        if res <> mrOk  then exit;
        with FrmEdRec do
            ModelEditItem(timefrom, timeto, serv, master, client, temp);
        UpdateList;
    end
    else Application.MessageBox('Выберите запись для изменения', 'Error!', MB_ICONERROR);
end;

procedure TMainForm.actFiltersExecute(Sender: TObject);
begin
    PnlFilters.Visible := true;
    actAdd.Enabled := false;
    actEdit.Enabled := false;
    actDelete.Enabled := false;
end;

procedure TMainForm.actMasterExecute(Sender: TObject);
begin
    FrmMasters.PageMasters.ActivePage := FrmMasters.TabMasters;
    FrmMasters.ShowModal;
end;

procedure TMainForm.actRecUpdate(Action: TBasicAction; var Handled: Boolean);
begin
    actAdd.Enabled := Calend.Date >= Date;
    actEdit.Enabled := (lvRecords.ItemIndex <> -1);
    actDelete.Enabled := lvRecords.ItemIndex <> -1;
end;

procedure TMainForm.actReportExecute(Sender: TObject);
begin
    if SaveDial.Execute then
       SaveToFile;
end;

procedure TMainForm.actSchedExecute(Sender: TObject);
begin
    FrmMasters.PageMasters.ActivePage := FrmMasters.TabSched;
    FrmMasters.ShowModal;
end;

procedure TMainForm.actServExecute(Sender: TObject);
begin
    FrmServ.ShowModal;
end;

procedure TMainForm.actSpecExecute(Sender: TObject);
begin
    FrmMasters.PageMasters.ActivePage := FrmMasters.TabSpec;
    FrmMasters.ShowModal;
end;

function TMainForm.AddTime(const TimeFrom, TimeAdd: TTime): TTime;
var
Myhour, Myminute, Sec, MSec: Word;
TimeTo: TTime;
begin
    timeto := TimeFRom;
    DecodeTime(TimeAdd, MyHour, MyMinute, Sec, MSec);
    Timeto := inchour(timeto, MyHour);
    TimeTo := incminute(timeto, MyMinute);
    result := timeto;
end;

procedure TMainForm.BtnBackClick(Sender: TObject);
begin
    PnlFilters.Hide;
    UpdateList;
    actCleanExecute(Sender);
    actAdd.Enabled := true;
    actEdit.Enabled := true;
    actDelete.Enabled := true;
end;

procedure TMainForm.BtnOkClick(Sender: TObject);
var Cnt, i: Integer;
begin
    UpdateList;
    if checkServ.Checked then
    begin
      cnt := lvRecords.Items.Count;
      i := 0;
      while i <= cnt - 1 do
      begin
          if lvRecords.Items[i].SubItems[0] <> cbServ.Items[cbServ.ItemIndex]  then
          begin
              lvRecords.Items[i].Selected := true;
              lvRecords.Selected.Free;
              dec(cnt);
          end else inc(i);
      end;
    end;
    if checkMast.Checked then
    begin
      cnt := lvRecords.Items.Count;
      i := 0;
      while i <= cnt - 1 do
      begin
          if lvRecords.Items[i].SubItems[1] <> cbMaster.Items[cbMaster.ItemIndex]  then
          begin
              lvRecords.Items[i].Selected := true;
              lvRecords.Selected.Free;
              dec(cnt);
          end else inc(i);
      end;
    end;
    if checkCl.Checked then
    begin
      cnt := lvRecords.Items.Count;
      i := 0;
      while i <= cnt - 1 do
      begin
          if lvRecords.Items[i].SubItems[2] <> cbClient.Items[cbClient.ItemIndex]  then
          begin
              lvRecords.Items[i].Selected := true;
              lvRecords.Selected.Free;
              dec(cnt);
          end else inc(i);
      end;
    end;
end;

procedure TMainForm.CalendClick(Sender: TObject);
begin
    UpdateList;
    //PnlFilters.Hide;
    actCleanExecute(Sender);
    BtnBackClick(Sender);
end;

procedure TMainForm.CheckClClick(Sender: TObject);
begin
    if checkCl.Checked then
       cbClient.Enabled := true
    else
    begin
        cbClient.Enabled := false;
        cbCLient.ItemIndex := -1;
    end;
end;

procedure TMainForm.CheckMastClick(Sender: TObject);
begin
    if checkMast.Checked then
       cbMaster.Enabled := true
    else
    begin
        cbMaster.Enabled := false;
        cbMaster.ItemIndex := -1;
    end;
end;

procedure TMainForm.checkServClick(Sender: TObject);
begin
    if checkServ.Checked then
       cbServ.Enabled := true
    else
    begin
        cbServ.Enabled := false;
        cbServ.ItemIndex := -1;
    end;
end;

procedure TMainForm.DisposeAll;
begin
    while Head <> nil do
    begin
          dispose(head);
          head := head.next;
    end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FrmClients.WriteInFile;
    FrmServ.WriteInFile;
    FrmMasters.WriteSpec;
    FrmMasters.WriteInFile;
    WriteInFile;
    FrmClients.DisPoseAll;
    FrmMasters.DisPoseAll;
    FrmServ.DisposeAll;
    DisposeAll;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
    WND: HWND;
    lpCaption, lpText: PChar;
    Tip: Integer;
begin
    WND := MainForm.Handle;
    lpCaption := 'Выход';
    lpText := 'Вы уверены, что хотите выйти?';
    Tip := MB_YESNO + MB_ICONINFORMATION + MB_DEFBUTTON2;
    case MessageBox(WND, lpText, lpCaption, Tip) of
        IDYES : CanClose := True;
        IDNO : CanClose := False;
    end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
    new(Head);
    new(Head.Next);
    Head.Next := nil;
    Calend.Date := Today;
end;

procedure TMainForm.ModelAddItem(const TimeFrom, TimeTo: TTime; Serv: PListOfServ;
  Master: PListOfMasters; Client: PListOfClients);
  var temp, lrec, pred: PlistOfRecords;
begin
    if head.next = nil then
    begin
      new(head.next);
      LRec := head.next;
      LRec.Info.Date := Calend.Date;
      LRec.Info.TimeFRom := TimeFrom;
      LRec.Info.TimeTo := TimeTo;
      LRec.Serv := Serv;
      LRec.Master := master;
      LRec.Client := Client;
      LRec.Info.Sum := Serv.info.Price;
      Lrec.info.Id[1] := serv.info.id;
      Lrec.info.Id[2] := master.info.id;
      LRec.info.id[3] := client.info.id;
      LRec.Next := nil;
    end
    else
    begin
      pred := head;
      lRec := head.next;
      while (lrec <> nil) and (TimeFrom > lRec.info.TimeFrom) do
      begin
            lRec := lRec.next;
            pred := pred.next;
      end;
       if lrec = nil then          //вставка в конец
       begin
          new(pred.next);
          lrec := pred.next;
          LRec.Info.Date := Calend.Date;
          LRec.Info.TimeFRom := TimeFrom;
          LRec.Info.TimeTo := TimeTo;
          LRec.Serv := Serv;
          LRec.Master := master;
          LRec.Client := Client;
          LRec.Info.Sum := Serv.info.Price;
          Lrec.info.Id[1] := serv.info.id;
          Lrec.info.Id[2] := master.info.id;
          LRec.info.id[3] := client.info.id;
          LRec.Next := nil;
       end
       else                           // вставка после lrec
       begin
          new(temp);
          temp.next := lrec;
          pred.next := temp;
          temp.Info.Date := Calend.Date;
          temp.Info.TimeFRom := TimeFrom;
          temp.Info.TimeTo := TimeTo;
          temp.Serv := Serv;
          temp.Master := master;
          temp.Client := Client;
          temp.Info.Sum := Serv.info.Price;
          temp.info.Id[1] := serv.info.id;
          temp.info.Id[2] := master.info.id;
          temp.info.id[3] := client.info.id;
       end;
    end;
end;

procedure TMainForm.ModelEditItem(const TimeFrom, TimeTo: TTime; Serv: PListOfServ;
  Master: PListOfMasters; Client: PListOfClients; temp: PListOfRecords);
begin
    temp.info.TimeFrom := TimeFrom;
    temp.Serv := Serv;
    temp.Master := master;
    temp.Client := Client;
    temp.Info.Sum := Serv.info.Price;
    temp.Info.TimeTo := timeto;
    temp.info.Id[1] := serv.info.id;
    temp.info.Id[2] := master.info.id;
    temp.info.id[3] := client.info.id;
end;

procedure TMainForm.ReadFromFile;
var isCorrect: Boolean;
begin
    isCorrect := true;
    try
        AssignFile(FileOfRecords, 'FileOfRecords');
        Reset(FileofRecords);
    except
        isCorrect := false;
    end;
    LRec := head;
    if not eof(FileOfRecords) and IsCorrect then
    begin
        new(Head.next);
        lrec := lrec.next;
        lrec := head.next;
        Read(FileOfRecords, lrec.Info);
        new(lrec.Serv);
        lrec.serv := FrmServ.findServ(lrec.info.Id[1]);
        new(lrec.Master);
        lrec.master := FrmMasters.findMaster(lrec.info.Id[2]);
        new(lrec.Client);
        lrec.client := FrmClients.findClient(lrec.info.Id[3]);
        lrec.next := nil;
    end;
    while not eof(FileOfRecords) and IsCorrect do
    begin
        lrec := head.next;
        while lrec.next <> nil do
        begin
            lrec := lrec.next;
        end;
        new(lrec.next);
        lrec:= lrec.next;
        Read(FileOfRecords, lrec^.info);
        new(lrec.Serv);
        lrec.serv := FrmServ.findServ(lrec.info.Id[1]);
        new(lrec.Master);
        lrec.master := FrmMasters.findMaster(lrec.info.Id[2]);
        new(lrec.Client);
        lrec.client := FrmClients.findClient(lrec.info.Id[3]);
        lrec.next := nil;
    end;
    UpdateList;
end;

procedure TMainForm.SaveToFile;
var MyFile: TextFile;
temp: PListOfRecords;
s,k: String;
i, j, sum: Integer;
begin
    AssignFile(MyFile, SaveDial.FileName);
    Rewrite(MyFile);
    sum := 0;
    temp := head.next;
    write(MyFile, '|');
    for j := 1 to 4 do
    begin
      for i := 1 to 30 do
      begin
         Write(MyFile, '-');
      end;
      Write(MyFile, '|');
    end;
    writeln(MyFile);
    writeln(MyFile, '|', 'Время':15,'|':16, 'Услуга':15,'|':16, 'Мастер':15,'|':16, 'Клиент':15, '|':16);
    write(MyFile, '|');
    for j := 1 to 4 do
    begin
      for i := 1 to 30 do
      begin
         Write(MyFile, '-');
      end;
      Write(MyFile, '|');
    end;
    Writeln(Myfile);
    while (temp <> nil) do
    begin
      if temp.info.date = Calend.Date then
      begin
        s := TimeToStr(temp.Info.TimeFrom);
        k := TimeToStr(temp.info.TimeTo);
        Delete(s, length(s) - 3, 3);
        Delete(k, length(k) - 3, 3);
        if length(s) = 4 then
           s := '0'+s;
        if length(k) = 4 then
           s := '0'+k;
        WriteLn(Myfile, '|', s:14, '-', k:4,'|':11, temp.serv.info.Name:30,'|', temp.master.info.SurName:14, ' ', temp.master.info.Name:15, '|',temp.client.info.SurName:14, ' ', temp.client.info.Name:15, '|');
        sum := sum + StrToInt(temp.Serv.info.Price);
      end;
      temp := temp.next;
    end;
    Write(MyFile, '|');
    for j := 1 to 4 do
    begin
      for i := 1 to 30 do
      begin
         Write(MyFile, '-');
      end;
      Write(MyFile, '|');
    end;
    Writeln(MyFile, '');
    Write(MyFile, ' ':110, 'Итого:', sum);
    CloseFile(MyFile);
end;

procedure TMainForm.UpdateList;
var Item: TListItem;
    temp: PListOfRecords;
    s,k: String[9];
begin
    lvRecords.Items.Clear;
    temp := head.next;
    while temp <> nil do
    begin
        if temp.info.date = Calend.Date then
        begin
            item := lvRecords.Items.Add;
            s := TimeToStr(temp.Info.TimeFrom);
            k := TimeToStr(temp.info.TimeTo);
            Delete(s, length(s) - 3, 3);
            Delete(k, length(k) - 3, 3);
            Item.Caption := s+'-'+ k;
            Item.SubItems.Add(temp.Serv.info.Name);
            Item.SubItems.Add(temp.Master.info.SurName + ' ' + temp.Master.info.Name);
            Item.SubItems.Add(temp.Client.Info.SurName+' '+temp.Client.Info.Name);
            Item.SubItems.Add(temp.Serv.info.Price);
        end;
            temp := temp.next;
    end;
end;

procedure TMainForm.WriteInFile;
var temp: PListOfRecords;
begin
    AssignFile(FileOfRecords, 'FileOfRecords');
    Rewrite(FileofRecords);
    temp := Head.next;
    while temp <> nil do
    begin
        write(FileOfRecords, temp^.info);
        temp := temp.next;
    end;
    CloseFile(FileOfRecords);
end;

end.
