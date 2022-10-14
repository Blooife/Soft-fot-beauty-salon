unit uMasters ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.CheckLst,
  Vcl.ComCtrls, System.Actions, Vcl.ActnList, uServ, Vcl.Samples.Spin,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TData = record
      id: Integer;
      spec, payment: String[20];
      Used: Integer;
  end;

  TSpec = ^node;
  node = record
      data: TData;
      Next: TSpec;
  end;

  TSched = record
    start, finish: TTime;
  end;

  TInfo = record
    id: Integer;
    SurName, Name, SecName: String[15];
    Gender: String[7];
    Number: String[15];
    sched: TSched;
    idSpec: Integer;
  end;

  PListOfMasters = ^elem;
  elem = record
    info: TInfo;
    Special: TSpec;
    Next: PListOfMasters;
  end;

  TFrmMasters = class(TForm)
    Panel1: TPanel;
    PageMasters: TPageControl;
    TabMasters: TTabSheet;
    lvMasters: TListView;
    TabSched: TTabSheet;
    TabSpec: TTabSheet;
    cbSched: TComboBox;
    ListSched: TListView;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ActMasters: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDelete: TAction;
    BtnEditSched: TButton;
    actEditSched: TAction;
    PnlEditSched: TPanel;
    TimeStart: TDateTimePicker;
    TimeFinish: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BtnOk: TButton;
    BtnBack: TButton;
    lvSpec: TListView;
    BtnAddSpec: TButton;
    BtnDltSpec: TButton;
    BtnEdSpec: TButton;
    actSpec: TActionList;
    actAddSpec: TAction;
    actEditSpec: TAction;
    actDeleteSpec: TAction;
    BtnFilters: TButton;
    actFilters: TAction;
    PnlFiltersM: TPanel;
    EdtFSurName: TEdit;
    EdtFName: TEdit;
    EdtFSecName: TEdit;
    rgFGender: TRadioGroup;
    seSalaryFrom: TSpinEdit;
    seSalaryTo: TSpinEdit;
    BtnOkF: TButton;
    BtnCancelF: TButton;
    BtnClearF: TButton;
    cbSurName: TCheckBox;
    cbName: TCheckBox;
    cbSecName: TCheckBox;
    cbGender: TCheckBox;
    cbSalaryFrom: TCheckBox;
    cbSalaryTo: TCheckBox;
    cbSpec: TCheckBox;
    actCleanFilters: TAction;
    cboxSpec: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    cbSort: TComboBox;
    Label12: TLabel;
    BtnFiltersS: TButton;
    PnlFilters: TPanel;
    BtnSave: TButton;
    BtnCanc: TButton;
    BtnClean: TButton;
    actFiltersS: TAction;
    EdtSpec: TEdit;
    sePayFrom: TSpinEdit;
    sePayTo: TSpinEdit;
    cbPayFrom: TCheckBox;
    cbPayTo: TCheckBox;
    cbNameSpec: TCheckBox;
    actCleanFiltS: TAction;
    cbSortSpec: TComboBox;
    Label13: TLabel;
    BtnChoose: TButton;
    BtnCancel: TButton;
    actChoose: TAction;
    actCancel: TAction;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Image1: TImage;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ReadFromFile(var Head, LMasters: PListOfMasters);
    procedure ReadSpec(var HeadSpec, LSpec: TSpec);
    procedure WriteInFile;
    procedure WriteSpec;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditSchedExecute(Sender: TObject);
    procedure actAddSpecExecute(Sender: TObject);
    procedure actEditSpecExecute(Sender: TObject);
    procedure actDeleteSpecExecute(Sender: TObject);
    procedure cbSchedUpdate;
    procedure cbSchedChange(Sender: TObject);
    procedure ShowSched(const start, finish: TTime);
    procedure ActMastersUpdate(Action: TBasicAction; var Handled: Boolean);

    procedure BtnOkClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnCancelFClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancClick(Sender: TObject);

    procedure sePaymentKeyPress(Sender: TObject; var Key: Char);
    procedure cbSpecUpdate(var combo: TComboBox);
    procedure IncUsedSpec(const spec: TSpec);
    procedure DecUsedSpec(const spec: TSpec);
    procedure actFiltersExecute(Sender: TObject);
    procedure actFiltersSExecute(Sender: TObject);
    procedure actCleanFiltSExecute(Sender: TObject);
    procedure actCleanFiltersExecute(Sender: TObject);
    procedure cbSurNameClick(Sender: TObject);
    procedure cbNameClick(Sender: TObject);
    procedure cbSecNameClick(Sender: TObject);
    procedure cbGenderClick(Sender: TObject);
    procedure cbSalaryFromClick(Sender: TObject);
    procedure cbSalaryToClick(Sender: TObject);
    procedure cbSpecClick(Sender: TObject);
    procedure cbNameSpecClick(Sender: TObject);
    procedure cbPayFromClick(Sender: TObject);
    procedure cbPayToClick(Sender: TObject);
    procedure cbSortClick(Sender: TObject);

    procedure SortList(num: Integer);
    procedure sePayFromKeyPress(Sender: TObject; var Key: Char);
    procedure sePayToKeyPress(Sender: TObject; var Key: Char);
    procedure cbSortSpecClick(Sender: TObject);
    procedure SortSpec(num: Integer);
    procedure actChooseExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure BtnOkFClick(Sender: TObject);

    function FindSpecById(num: Integer): TSpec;
    function FindMaster(num: Integer): PListOfMasters;
    procedure seSalaryFromKeyPress(Sender: TObject; var Key: Char);
    procedure seSalaryToKeyPress(Sender: TObject; var Key: Char);
    procedure DisPoseAll;

    function Check(const temp: PLIstOfMasters): Byte;
    function NotusedInRec(const del: PListOfMasters): Boolean;
    procedure actSpecUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure TimeFinishChange(Sender: TObject);
    procedure TimeStartChange(Sender: TObject);

    private

    { Private declarations }
    procedure UpDateList;
    procedure ModelAddItem(const SurName, Name, SecName, Gender: String; Spec: TSpec; Number: String);
    procedure ModelEditItem(const SurName, Name, SecName, Gender: String; Spec: TSpec; Number: String; var temp: PListOfMasters);
    procedure ModelEditSpec(const Spec, Payment: String; var Temp: TSpec);
    procedure ModelEditSched(const start, finish: TTime; var temp: PListOfMasters);
    procedure ModelAddSpec(const spec, payment: String);
    procedure UpdateSpec;

  public
    { Public declarations }
    LMasters, Head: PListOfMasters;
    HeadSpec, LSpec: TSpec;
    FileOfMasters: File of TInfo;
    FileOfSpec: File of TData;
    tempsp: TSpec;
    MaxSpec, MaxMast: Integer;

 end;


var
  FrmMasters: TFrmMasters;

implementation

{$R *.dfm}

uses uEdRecord, uEdSpec, uEdMasters, uMainPage;

procedure TFrmMasters.actAddExecute(Sender: TObject);
var res: TModalResult;
begin
   res := FrmEdMasters.ShowNewMaster;
   if res <> mrOk then  exit;
   with FrmEdMasters do
   ModelAddItem(SurName, Name, SecName, Gender, Spec, Number);
   UpDateLIst;
end;

function TFrmMasters.FindMaster(num: Integer): PListOfMasters;
var temp: PListOfMasters;
found: Boolean;
begin
    temp := head.next;
    found := false;
    while not found do
    begin
        if temp.info.id = num then
        begin
            found := true;
            result := temp;
        end;
        temp := temp.next;
    end;
end;

function TFrmMasters.FindSpecById(num: Integer): TSpec;
var temp: TSpec;
found: Boolean;
begin
    temp := headspec.next;
    found := false;
    while not found do
    begin
        if temp.data.id = num then
        begin
            found := true;
            result := temp;
        end;
        temp := temp.next;
    end;
end;

procedure TFrmMasters.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ListSched.Items.Clear;
    BtnCancelFClick(Sender);
    BtnCancClick(Sender);
    BtnBackClick(Sender);
end;

procedure TFrmMasters.FormCreate(Sender: TObject);
begin
    new(Head);
    new(Head.Next);
    Head.Next := nil;
    new(HeadSpec);
    New(HeadSpec.next);
    headSpec.next := nil;
    ReadSpec(HeadSpec, LSpec);
    ReadFromFile(Head,LMasters);
end;

procedure TFrmMasters.actAddSpecExecute(Sender: TObject);
var res: TModalResult;
begin
   res := FrmEdSpec.ShowNewSpec;
   if res <> mrOk then  exit;
   with FrmEdSpec do
   ModelAddSpec(Spec, Payment);
   UpDateSpec;
end;

procedure TFrmMasters.actCancelExecute(Sender: TObject);
begin
    FrmMasters.ModalResult := mrCancel;
end;

procedure TFrmMasters.actChooseExecute(Sender: TObject);
var Item: TListItem;
i, Index: INteger;
temp: PListOfMasters;
bool: Byte;
begin
    PageMasters.ActivePageIndex := 0;
    Item := lvMasters.Selected;
    if item <> nil then
      begin
          Index := lvMasters.ItemIndex;
           temp := Head.Next;
          for I := 1 to Index do
          begin
              temp := temp.Next;
          end;
          bool := Check(temp);
          if bool = 2 then
          begin
              FrmedRec.BtnSave.Enabled := true;
              FrmEdRec.Master := temp;
              FrmMasters.ModalResult := mrOk;
          end
          else
          if bool = 1 then
          begin
              FrmedRec.BtnSave.Enabled := false;;
              Application.MessageBox('Мастер занят в это время. Попробуйте выбрать другого мастера или время!', 'Error!', MB_ICONERROR);
              FrmMasters.ModalResult := mrCancel;
          end
          else if bool = 0 then
          begin
              FrmedRec.BtnSave.Enabled := false;
              Application.MessageBox('Мастер не работает в это время!', 'Error!', MB_ICONERROR);
              FrmMasters.ModalResult := mrCancel;
          end;
      end
    else Application.MessageBox('Выберите мастера!', 'Error!', MB_ICONERROR);
end;

function TFrmMasters.NotusedInRec(const del: PListOfMasters): Boolean;
var temp: uMainPage.PlistOfRecords;
can: Boolean;
begin
    temp := uMainPage.Head.next;
    can := true;
    while (temp <> nil) and can do
    begin
            if (temp.Master = del) and (temp.info.date >= date) then
               can := false;
        temp := temp.next;
    end;
    result := can;
end;

function TFrmMasters.Check(const temp: PLIstOfMasters): Byte;
var
rec, tempEd: PListOfRecords;
busy: Boolean;
tf, Tto: TTime;
begin
    rec := uMainPage.Head.next;
    temped := FrmEdRec.TempEdit;
    busy := false;
    tf := FrmEdRec.TimeFrom;
    tto := FrmEdRec.TimeTo;
    if (tf < temp.info.sched.start ) or (tto > temp.info.sched.finish) then
    begin
       result := 0;
       busy := true;
    end
    else
    begin
        while (rec <> nil) and not busy do
        begin
            if MainForm.Calend.Date = rec.info.date then
              if (rec.Master = temp) and (temped <> rec) then
                if ((tf <= rec.info.TimeFrom) and (tto > rec.info.TimeFrom)) or ((tf < rec.info.TimeTo)and (tf >= rec.info.TimeFrom) and (tto > rec.info.TimeFrom)) then
                begin
                  busy := true;
                  result := 1;
                end;
            rec := rec.next;
        end;
    end;
    if not busy then
    begin
        result := 2
    end;
end;

procedure TFrmMasters.actCleanFiltersExecute(Sender: TObject);
begin
    seSalaryFrom.Enabled := false;
    seSalaryTo.Enabled := false;
    cbSpec.Checked := false;
    cbGender.Checked := false;
    cbSurName.Checked := false;
    cbName.Checked := false;
    cbSecName.Checked := false;
    EdtFSurName.Enabled := false;
    EdtFName.Enabled := false;
    EdtFSecName.Enabled := false;
    cBoxSpec.Enabled := false;
    cBoxSpec.ItemIndex := -1;
    EdtFSecName.Text := '';
    EdtFSurName.Text := '';
    EdtFName.Text := '';
    EdtFSecName.Text := '';
    seSalaryFrom.Text := '0';
    seSalaryTo.text := '0';
    rgFGender.ItemIndex := -1;
    UpdateList;
end;

procedure TFrmMasters.actCleanFiltSExecute(Sender: TObject);
begin
    sePayFrom.Enabled := false;
    sePayTo.Enabled := false;
    cbNameSpec.Checked := false;
    cbPayFrom.Checked := false;
    cbPayTo.Checked := false;
    EdtSpec.Enabled := false;
    EdtSpec.Text := '';
    sePayFrom.Text := '0';
    sePayTo.text := '0';
    UpdateSpec;
end;

procedure TFrmMasters.actDeleteExecute(Sender: TObject);
var Index, i: Integer;
temp, buf: PListOfMasters;
begin
    Index := lvMasters.ItemIndex;
    if lvMasters.Selected <> nil then
 begin

        temp := head;
        for i := 0 to index-1 do
        begin
            Temp := temp.next;
        end;
    if NotUsedInRec(temp.next) then
    begin
        DecUSedSpec(temp.next.Special);
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
    else Application.MessageBox('Мастер есть в списке записей. Вы не можете его удалить!', 'Error!', MB_ICONERROR);
 end else
    Application.MessageBox('Выберите мастера для удаления', 'Error!', MB_ICONERROR);
end;


procedure TFrmMasters.actDeleteSpecExecute(Sender: TObject);
var Index, i: Integer;
item: TListItem;
temp, buf: TSpec;
begin
    Index := lvSpec.ItemIndex;
    if lvSpec.Selected <> nil then
 begin
        temp := headspec;
        for i := 0 to index-1 do
        begin
            Temp := temp.next;
        end;

        if temp.next.data.used <> 0 then
        begin
            Application.MessageBox('Вы не можете удалить эту специальность, так как есть мастер с такой специальностью.', 'Error!', MB_ICONERROR);
            exit;
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
        UpdateSpec;

 end else
    Application.MessageBox('Выберите специальность для удаления', 'Error!', MB_ICONERROR);
end;

procedure TFrmMasters.actEditExecute(Sender: TObject);
var res: TModalResult;
Index, i: Integer;
Item: TListItem;
temp: PLIstOfMasters;
begin
    Item := LvMasters.Selected;
    if lvMasters.Selected <> nil then
    begin
      Index := LvMasters.ItemIndex;
      temp := Head.Next;
      for I := 1 to Index do
      begin
          temp := temp.Next;
      end;
      Res := frmEdMasters.ShowEditMaster(
      Temp.Info.SurName, Temp.Info.Name, Temp.Info.SecName, Temp.Info.Gender, Temp.Special, Temp.Info.Number);
      if res <> mrOk then exit;

      with FrmEdMasters do
      ModelEditItem(SurName, Name, SecName, Gender, Spec, Number, temp);
      UpdateList;
    end else
    Application.MessageBox('Выберите мастера для изменения', 'Error!', MB_ICONERROR);
end;


procedure TFrmMasters.actEditSchedExecute(Sender: TObject);
var temp: PListOfMasters;
i: Integer;
begin
    if cbSched.ItemIndex <> -1 then
    begin
        temp := head.next;
        PnlEditSched.Show;
        for i := 1 to cbSched.ItemIndex do
            temp := temp.next;
        ShowSched(temp.info.sched.start, temp.info.sched.finish);
        cbSched.Enabled := false;
    end
    else
    Application.MessageBox('Выберите мастера для изменения графика', 'Error!', MB_ICONERROR);
end;

procedure TFrmMasters.actEditSpecExecute(Sender: TObject);
var Index, i, res: Integer;
Item: TListItem;
temp: TSpec;
begin
  if lvSpec.Selected <> nil then
  begin
      item := lvSpec.Selected;
      Index := lvSpec.ItemIndex;
      temp := HeadSpec.next;
      for i := 1 to Index do
      begin
          temp := temp.next;
      end;
      res := FrmEdSpec.ShowEditSpec(temp.data.spec, temp.data.payment);
      if res <> mrOk then  exit;
      with FrmEdSpec do
      ModelEditSpec(Spec, payment, temp);
      UpdateSpec;
  end
  else Application.MessageBox('Выберите мастера для изменения графика', 'Error!', MB_ICONERROR);
end;


procedure TFrmMasters.actFiltersExecute(Sender: TObject);
begin
    PnlFiltersM.show;
    actAdd.Enabled := false;
    actEdit.Enabled := false;
    actDelete.Enabled := false;
    cbSort.Enabled := false;
    LvMasters.Enabled := false;
end;

procedure TFrmMasters.actFiltersSExecute(Sender: TObject);
begin
    PnlFilters.show;
    actAddSpec.Enabled := false;
    actEditSpec.Enabled := false;
    actDeleteSpec.Enabled := false;
    LvSpec.Enabled := false
end;

procedure TFrmMasters.ActMastersUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
    actEditSched.Enabled := (cbSched.ItemIndex <> -1);
    actEdit.Enabled := (lvMasters.ItemIndex <> -1);
    actDelete.Enabled := (lvMasters.ItemIndex <> -1);
end;

procedure TFrmMasters.actSpecUpdate(Action: TBasicAction; var Handled: Boolean);
begin
    actEditSpec.Enabled := (lvSpec.ItemIndex <>-1);
    actDeleteSpec.Enabled := (lvSpec.ItemIndex <>-1);
end;

procedure TFrmMasters.BtnBackClick(Sender: TObject);
begin
    PnlEditSched.Hide;
    cbSched.Enabled := true;
end;

procedure TFrmMasters.BtnCancClick(Sender: TObject);
begin
    UpdateSpec;
    PnlFilters.Hide;
    actAddSpec.Enabled := true;
    actEditSpec.Enabled := true;
    actDeleteSpec.Enabled := true;
    lvSpec.Enabled := true;
    actCleanFiltersExecute(Sender);
end;

procedure TFrmMasters.BtnCancelFClick(Sender: TObject);
begin
    Updatelist;
    PnlFiltersM.Hide;
    actAdd.Enabled := true;
    actEdit.Enabled := true;
    actDelete.Enabled := true;
    cbSort.Enabled := true;
    lvMasters.Enabled := true;
    actCleanFiltSExecute(Sender);
end;

procedure TFrmMasters.BtnOkClick(Sender: TObject);
var temp: PListOfMasters;
i: Integer;
s: String[9];
begin
    temp := head.next;
    for i := 1 to cbSched.ItemIndex do
            temp := temp.next;
    ModelEditSched(TimeStart.Time, TimeFinish.Time, temp);
    s := TimeToStr(temp.info.sched.start);
    Delete(s, length(s) - 3, 3);
    ListSched.Items[0].SubItems[0] := s;
    s := TimeToStr(temp.info.sched.finish);
    Delete(s, length(s) - 3, 3);
    ListSched.Items[0].SubItems[1] := s;
    PnlEditSched.Hide;
    cbSched.Enabled := true;
end;

procedure TFrmMasters.BtnOkFClick(Sender: TObject);
var cnt, i, index:Integer;
begin
    UpdateList;
    if cbSalaryFrom.Checked then
    begin
      cnt := lvMasters.Items.Count;
      i := 0;
      while i <= cnt - 1 do
      begin
          if (StrToInt(lvMasters.Items[i].SubItems[4]) < StrToInt(seSalaryFrom.Text))  then
          begin
              lvMasters.Items[i].Selected := true;
              lvMasters.Selected.Free;
              dec(cnt);
          end else inc(i);
      end;
    end;
    if cbSalaryTo.Checked then
    begin
      cnt := lvMasters.Items.Count;
      i := 0;
      while i <= cnt - 1 do
      begin
          if (StrToInt(lvMasters.Items[i].SubItems[4]) > StrToInt(seSalaryTo.Text))  then
          begin
              lvMasters.Items[i].Selected := true;
              lvMasters.Selected.Free;
              dec(cnt);
          end else inc(i);
      end;
    end;
    if cbGender.Checked then
    begin
      if (rgFGender.ItemIndex <> -1) and (rgFGender.ItemIndex <> 2) then
      begin
        cnt := lvMasters.Items.Count;
        i := 0;
        while i <= cnt - 1 do
        begin
            if (lvMasters.Items[i].SubItems[2] <> rgFGender.Items[rgFGender.ItemIndex]) then
            begin
                lvMasters.Items[i].Selected := true;
                lvMasters.Selected.Free;
                dec(cnt);
            end else inc(i);
        end;
      end;
    end;
    if cbSurName.Checked then
    begin
        if EdtFSurName.Text <> '' then
        begin
          cnt := lvMasters.Items.Count;
          i := 0;
          while i <= cnt - 1 do
          begin
              if AnsiUpperCase(lvMasters.Items[i].Caption) <> AnsiUpperCase(EdtFSurName.Text)  then
              begin
                  lvMasters.Items[i].Selected := true;
                  lvMasters.Selected.Free;
                  dec(cnt);
              end else inc(i);
          end;
        end;
    end;
    if cbName.Checked then
    begin
        if EdtFName.Text <> '' then
        begin
          cnt := lvMasters.Items.Count;
          i := 0;
          while i <= cnt - 1 do
          begin
              if AnsiUpperCase(lvMasters.Items[i].SubItems[0]) <> AnsiUpperCase(EdtFName.Text)  then
              begin
                  lvMasters.Items[i].Selected := true;
                  lvMasters.Selected.Free;
                  dec(cnt);
              end else inc(i);
          end;
        end;
    end;
    if cbSecName.Checked then
    begin
        if EdtFSecName.Text <> '' then
        begin
          cnt := lvMasters.Items.Count;
          i := 0;
          while i <= cnt - 1 do
          begin
              if AnsiUpperCase(lvMasters.Items[i].SubItems[1]) <> AnsiUpperCase(EdtFSecName.Text)  then
              begin
                  lvMasters.Items[i].Selected := true;
                  lvMasters.Selected.Free;
                  dec(cnt);
              end else inc(i);
          end;
        end;
    end;
    if cbSpec.Checked then
    begin
        if cboxSpec.ItemIndex <> -1 then
        begin
          cnt := lvMasters.Items.Count;
          i := 0;
          while i <= cnt - 1 do
          begin
              temp := headspec.next;
              index := cboxSpec.ItemIndex;
              for i := 1 to Index do
                  temp := temp.next;
              if lvMasters.Items[i].SubItems[3] <> cboxSpec.Items[Index]  then
              begin
                  lvMasters.Items[i].Selected := true;
                  lvMasters.Selected.Free;
                  dec(cnt);
              end else inc(i);
          end;
        end;
    end;
end;

procedure TFrmMasters.BtnSaveClick(Sender: TObject);
var cnt, i, index:Integer;
begin
    UpdateSpec;
    if cbNameSpec.Checked then
    begin
        if EdtSpec.Text <> '' then
        begin
          cnt := lvSpec.Items.Count;
          i := 0;
          while i <= cnt - 1 do
          begin
              if AnsiUpperCase(lvSpec.Items[i].Caption) <> AnsiUpperCase(EdtSpec.Text)  then
              begin
                  lvSpec.Items[i].Selected := true;
                  lvSpec.Selected.Free;
                  dec(cnt);
              end else inc(i);
          end;
        end;
    end;
    if cbPayFrom.Checked then
    begin
      cnt := lvSpec.Items.Count;
      i := 0;
      while i <= cnt - 1 do
      begin
          if (StrToInt(lvSpec.Items[i].SubItems[0]) < StrToInt(sePayFrom.Text))  then
          begin
              lvSpec.Items[i].Selected := true;
              lvSpec.Selected.Free;
              dec(cnt);
          end else inc(i);
      end;
    end;
    if cbPayTo.Checked then
    begin
      cnt := lvSpec.Items.Count;
      i := 0;
      while i <= cnt - 1 do
      begin
          if (StrToInt(lvSpec.Items[i].SubItems[0]) > StrToInt(sePayTo.Text))  then
          begin
              lvSpec.Items[i].Selected := true;
              lvSpec.Selected.Free;
              dec(cnt);
          end else inc(i);
      end;
    end;
end;


procedure TFrmMasters.cbGenderClick(Sender: TObject);
begin
    if cbGender.Checked then
        rgFGender.Enabled := true
    else rgFGender.Enabled := false;
end;

procedure TFrmMasters.cbNameClick(Sender: TObject);
begin
    if cbName.Checked then
        EdtFName.Enabled := true
    else EdtFName.Enabled := false;
end;

procedure TFrmMasters.cbNameSpecClick(Sender: TObject);
begin
    if cbNameSpec.Checked then
        EdtSpec.Enabled := true
    else EdtSpec.Enabled := false;
end;

procedure TFrmMasters.cbPayFromClick(Sender: TObject);
begin
    if cbPayFrom.Checked then
        sePayFrom.Enabled := true
    else sePayFrom.Enabled := false;
end;

procedure TFrmMasters.cbPayToClick(Sender: TObject);
begin
    if cbPayTo.Checked then
        sePayTo.Enabled := true
    else sePayTo.Enabled := false;
end;

procedure TFrmMasters.cbSalaryFromClick(Sender: TObject);
begin
    if cbSalaryFrom.Checked then
        seSalaryFrom.Enabled := true
    else seSalaryFrom.Enabled := false;
end;

procedure TFrmMasters.cbSalaryToClick(Sender: TObject);
begin
    if cbSalaryTo.Checked then
        seSalaryTo.Enabled := true
    else seSalaryTo.Enabled := false;
end;

procedure TFrmMasters.cbSchedChange(Sender: TObject);
var Item: TListItem;
temp: PListOfMasters;
i: Integer;
s: String[9];
begin
    ListSched.Items.Clear;
    item := listSched.Items.Add;
    temp := head.next;
    for I := 1 to cbSched.ItemIndex do
        temp := temp.next;
    Item.Caption := temp.Info.SurName + ' ' + temp.info.Name;
    s := TimeToStr(temp.info.sched.start);
    Delete(s, length(s) - 3, 3);
    Item.SubItems.Add(s);
    s := TimeToStr(temp.info.sched.finish);
    Delete(s, length(s) - 3, 3);
    Item.SubItems.Add(s);
end;

procedure TFrmMasters.cbSchedUpdate;
var temp: PListOfMasters;
begin
    temp := head.next;
    cbSched.Items.Clear;
    while temp <> nil do
    begin
      cbSched.Items.Add(temp.info.SurName + ' '   + temp.info.Name);
      temp := temp.next;
    end;
end;

procedure TFrmMasters.cbSecNameClick(Sender: TObject);
begin
    if cbSecName.Checked then
        EdtFSecName.Enabled := true
    else EdtFSecName.Enabled := false;
end;

procedure TFrmMasters.cbSortClick(Sender: TObject);
begin
    if cbSort.ItemIndex <> -1 then
        SortList(cbSort.ItemIndex);
    UpdateList;
end;

procedure TFrmMasters.cbSortSpecClick(Sender: TObject);
begin
    if cbSortSpec.ItemIndex <> -1 then
       SortSpec(cbSortSpec.ItemIndex);
    UpdateSpec;
end;

procedure TFrmMasters.cbSpecClick(Sender: TObject);
begin
    if cbSpec.Checked then
        cboxSpec.Enabled := true
    else cboxSpec.Enabled := false;
end;

procedure TFrmMasters.cbSpecUpdate(var combo: TComboBox);
var temp: TSpec;
begin
    temp := headspec.next;
    combo.Items.Clear;
    while temp <> nil do
    begin
      combo.Items.Add(temp.data.spec);
      temp := temp.next;
    end;
end;

procedure TFrmMasters.cbSurNameClick(Sender: TObject);
begin
    if cbSurName.Checked then
        EdtFSurName.Enabled := true
    else EdtFSurName.Enabled := false;
end;



procedure TFrmMasters.DecUsedSpec(const spec: TSpec);
var temp: TSpec;
found: Boolean;
begin
    dec(spec.data.Used);
end;

procedure TFrmMasters.DisPoseAll;
begin
    while Head <> nil do
    begin
          dispose(head);
          head := head.next;
    end;
    while HeadSpec <> nil do
    begin
          dispose(headspec);
          headspec := headspec.next;
    end;
end;

procedure TFrmMasters.IncUsedSpec(const spec: TSpec);
begin
    inc(spec.data.Used);
end;

procedure TFrmMasters.FormShow(Sender: TObject);
begin
    UpdateList;
    UpdateSpec;
end;

procedure TFrmMasters.ReadFromFile(var Head, LMasters: PListOfMasters);
var isCorrect: Boolean;
begin
    isCorrect := true;
    try
        AssignFile(FileOfMasters, 'FileOfMasters');
        Reset(FileofMasters);
    except
        isCorrect := false;
    end;
    LMasters := head;
    if not eof(FileOfMasters) and isCorrect then
    begin
      new(Head.next);
      LMasters := LMasters.next;
      LMasters := head.next;
      New(lMasters.Special);
      Read(FileOfMasters, LMasters^.info);
      lmasters.Special := FindSpecById(lmasters.info.idSpec);
      MaxMast := lMasters.info.id;
    end;
    while not eof(FileOfMasters) and isCorrect do
    begin
        new(LMasters.next);
        LMasters := LMasters.next;
        New(lMasters.Special);
        Read(FileOfMasters, LMasters^.info);
        lmasters.Special := FindSpecById(lmasters.info.idSpec);
        if lmasters.info.id > maxmast then
            MaxMast := lMasters.info.id;
    end;
    LMasters.next := nil;
    UpdateList;
end;

procedure TFrmMasters.ReadSpec(var HeadSpec, LSpec: TSpec);
var isCorrect: Boolean;
begin
    isCorrect := true;
    try
        AssignFile(FileOfSpec, 'FileOfSpec');
        Reset(FileOfSpec);
    except
        isCorrect := false;
    end;
    LSpec := Headspec;
    if not eof(FileOfSpec) and isCorrect then
    begin
        new(HeadSpec.next);
        LSpec := headspec.next;
        Read(FileOfSpec, LSpec.data);
        maxspec := lspec.data.id;
        lspec.next := nil;
    end;
    while not eof(Fileofspec) and isCorrect do
    begin
        new(LSpec.next);
        lspec := lspec.next;
        Read(FileOfSpec, lspec.data);
        if lspec.data.id > maxspec then
           maxspec := lspec.data.id;
        lspec.next := nil;
    end;
end;

procedure TFrmMasters.sePayFromKeyPress(Sender: TObject; var Key: Char);
begin
    if key = '-' then
      key := #0;
end;

procedure TFrmMasters.sePaymentKeyPress(Sender: TObject; var Key: Char);
begin
    if key = '-' then
      key := #0;
end;


procedure TFrmMasters.sePayToKeyPress(Sender: TObject; var Key: Char);
begin
    if key = '-' then
      key := #0;
end;

procedure TFrmMasters.seSalaryFromKeyPress(Sender: TObject; var Key: Char);
begin
    if key = '-' then
      key := #0;
end;

procedure TFrmMasters.seSalaryToKeyPress(Sender: TObject; var Key: Char);
begin
    if key = '-' then
      key := #0;
end;

procedure TFrmMasters.ShowSched(const start, finish: TTime);
begin
    TimeStart.Time := start;
    TimeFinish.Time := finish;
end;

procedure TFrmMasters.SortList(num: Integer);
var temp, right, left: PListOfMasters;
isNotLess: Boolean;
begin
    if  (head.next <> nil) and (head.next.next <> nil) then
  begin
      right := head.next;    //последний отсортированный
      while right.next <> nil do
      begin
          case num of
              0: IsNotLess := right.next.info.SurName >= right.info.SurName;
              1: IsNotLess := StrToInt(right.next.special.data.payment) >= StrToInt(right.special.data.payment) ;
              2: IsNotLess := StrToInt(right.next.special.data.payment)  <=StrToInt( right.special.data.payment) ;
          end;
          if not IsNotLess then
          begin
              left := head;
              isNotLess := true;
              while isNotLess do
              begin
                  case num of
                      0: IsNotLess := right.next.info.SurName >= left.next.info.SurName;
                      1: IsNotLess := StrToInt(right.next.special.data.payment)  >= StrToInt(left.next.special.data.payment) ;
                      2: IsNotLess := StrToInt(right.next.special.data.payment)  <= StrToInt(left.next.special.data.payment) ;
                  end;
                  if isNotLess then
                      left := left.next;
              end;
              temp := right.next;
              right.next := temp.next;

              temp.next := left.next;
              left.next := temp;
          end
          else right := right.next;
      end;
  end;
end;

procedure TFrmMasters.SortSpec(num: Integer);
var temp, right, left: TSpec;
isNotLess: Boolean;
n: Integer;
begin
    if (headspec.Next <> nil) and (headspec.next.next <> nil) then
    begin
        right := headspec.next;    //последний отсортированный
        while right.next <> nil do
        begin
            case num of
                0: IsNotLess := right.next.data.Spec >= right.data.Spec;
                1: IsNotLess := StrToInt(right.next.data.Payment) >= StrToInt(right.data.Payment);
                2: IsNotLess := StrToInt(right.next.data.Payment) <= StrToInt(right.data.Payment);
            end;
            if not IsNotLess then
            begin
                left := headspec;
                isNotLess := true;
                while isNotLess do
                begin
                    case num of
                        0: IsNotLess := right.next.data.Spec >= left.next.data.Spec;
                        1: IsNotLess := StrToInt(right.next.data.Payment) >= StrToInt(left.next.data.Payment);
                        2: IsNotLess := StrToInt(right.next.data.Payment) <= StrToInt(left.next.data.Payment);
                    end;
                    if isNotLess then
                        left := left.next;
                end;
                temp := right.next;
                right.next := temp.next;

                temp.next := left.next;
                left.next := temp;
            end
            else right := right.next;
        end;
    end;
end;

procedure TFrmMasters.TimeFinishChange(Sender: TObject);
begin
    if TimeStart.Time >= TimeFinish.Time then
    begin
        BtnOk.Enabled := false;
        Application.MessageBox('Время окончания не может быть меньше времени начала', 'Error!', MB_ICONERROR);
    end
    else BtnOk.Enabled := true;
end;

procedure TFrmMasters.TimeStartChange(Sender: TObject);
begin
    if TimeStart.Time >= TimeFinish.Time then
    begin
        BtnOk.Enabled := false;
        Application.MessageBox('Время окончания не может быть меньше времени начала', 'Error!', MB_ICONERROR);
    end
    else BtnOk.Enabled := true;
end;

procedure TFrmMasters.ModelAddItem(const SurName, Name, SecName, Gender: String; Spec: TSpec; Number: String);
begin
    if head.next = nil then
   begin
      new(head.next);
      LMasters := head.next;
      LMasters .Info.Id := 0;
      LMasters .Info.SurName := SurName;
      LMasters .Info.Name := Name;
      LMasters .Info.SecName := SecName;
      LMasters .Special := Spec;
      LMasters .Info.Gender := Gender;
      LMasters .Info.Number := Number;
      LMasters.Info.idSpec := spec.data.id;
      LMasters.info.Sched.Start := StrToTime('8:00:00');
      LMasters.info.Sched.Finish := StrToTime('17:00:00');
      LMasters .Next := nil;

   end else
   begin
       LMasters := head.next;
       while LMasters.next <> nil do
       begin
          LMasters := LMasters.next;
       end;
       new(LMasters .Next);
       LMasters.next.info.id := maxmast+1;
       inc(maxMast);
       LMasters  := LMasters .Next;
       LMasters.Info.SurName := SurName;
       LMasters.Info.Name := Name;
       LMasters.Info.SecName := SecName;
       LMasters.Info.Gender := Gender;
       LMasters.Special := Spec;
       LMasters.Info.Number := Number;
       LMasters.Info.idSpec := spec.data.id;
       LMasters.info.Sched.Start := StrToTime('8:00:00');
       LMasters.info.Sched.Finish := StrToTime('17:00:00');
       LMasters.Next := nil;
   end;
end;

procedure TFrmMasters.ModelAddSpec(const spec, payment: String);
begin
    if headspec.next = nil then
    begin
        new(headspec.next);
        LSpec := headspec.next;
        LSpec.data.spec := spec;
        LSpec.data.payment := payment;
        Lspec.data.Used := 0;
        LSpec.data.id := 0;
        MaxSpec := 0;
        LSpec.Next := nil;
    end
    else
    begin
        LSpec := HeadSpec.next;
        while lspec.next <> nil do
            lspec := lspec.next;
        new(lspec.next);
        lspec := lspec.next;
        LSpec.data.id := MaxSpec+1;
        inc(MaxSpec);
        LSpec.data.spec := spec;
        LSpec.data.payment := payment;
        Lspec.data.Used := 0;
        LSpec.Next := nil;
    end;
end;

procedure TFrmMasters.ModelEditItem(const SurName, Name, SecName, Gender: String; Spec: TSpec; Number: String; var temp: PListOfMasters);
begin
    Temp.Info.SurName := SurName;
    temp.Info.Name := Name;
    Temp.Info.SecName := SecName;
    Temp.Info.Number := Number;
    Temp.Info.Gender := gender;
    Temp.Special := Spec;
    temp.info.idSpec := spec.data.id;
end;

procedure TFrmMasters.ModelEditSched(const start, finish: TTime;
  var temp: PListOfMasters);
begin
    temp.info.sched.start := start;
    temp.info.sched.finish := finish;
end;

procedure TFrmMasters.ModelEditSpec(const Spec, Payment: String; var Temp: TSpec);
begin
    temp.data.spec := spec;
    temp.data.payment := payment;
end;

procedure TFrmMasters.UpDateList;
var Item: TListItem;
    temp: PListOfMasters;
begin
    lvMasters.Items.Clear;
    MainForm.cbMaster.Items.Clear;
    temp := head.next;
      while temp <> nil do
      begin
            item := lvMasters.Items.Add;
            Item.Caption := temp.Info.SurName;
            Item.SubItems.Add(temp.Info.Name);
            Item.SubItems.Add(temp.info.SecName);
            Item.SubItems.Add(temp.info.Gender);
            Item.SubItems.Add(temp.Special.data.spec);
            Item.SubItems.Add(temp.Special.data.payment);
            Item.SubItems.Add(temp.info.number);
            MainForm.cbMaster.Items.Add(temp.info.SurName + ' '   + temp.info.Name);
            temp := temp.next;
      end;
     cbSchedUpdate;
end;

procedure TFrmMasters.UpdateSpec;
var temp: TSpec;
item: TListItem;
begin
    LvSpec.Items.Clear;
    temp := headspec.next;
    while temp <> nil do
    begin
        item := lvSpec.Items.Add;
        Item.Caption := temp.data.spec;
        item.SubItems.Add(temp.data.payment);
        temp := temp.next;
    end;
    cbSpecUpdate(FrmEdMasters.cbSpec);
    cbSpecUpdate(cboxSpec);
    UpdateList;
    MainForm.UpdateList;
end;

procedure TFrmMasters.WriteInFile;
var temp: PListOfMasters;
begin
    AssignFile(FileOfMasters, 'FileOfMasters');
    Rewrite(FileofMasters);
    temp := Head.next;
    while temp <> nil do
    begin
        write(FileOfMasters, temp^.info);
        temp := temp.next;
    end;
    CloseFile(FileOfMasters);
end;

procedure TFrmMasters.WriteSpec;
var temp: TSpec;
begin
    AssignFile(FileOfSpec, 'FileOfSpec');
    Rewrite(FileOfSpec);
    temp := headSpec.next;
    while temp <> nil do
    begin
        write(FileOfSpec, temp.data);
        temp := temp.next;
    end;
end;

end.
