unit uClients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uAdd,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, System.Actions, Vcl.ActnList,
  Vcl.CheckLst;

type
    TInfo = record
      id: Integer;
      SurName, Name, SecName, Gender, Number: String[25];
      Date: TDate;
    end;

    PListOfClients = ^elem;
    elem = record
        Info: TInfo;
        Next: PListOfClients;
    end;

  TFrmClients = class(TForm)
    PanelBtn: TPanel;
    BtnAdd: TButton;
    BtnEdit: TButton;
    BtnDelete: TButton;
    BtnSearch: TButton;
    ListClients: TListView;
    DateTo: TDateTimePicker;
    DateFrom: TDateTimePicker;
    LblDateFrom: TLabel;
    LblDateTo: TLabel;
    actClients: TActionList;
    actAddClient: TAction;
    actEditClient: TAction;
    actDeleteClient: TAction;
    Panel1: TPanel;
    PnlFilters: TPanel;
    btnFilters: TButton;
    BtnBack: TButton;
    Label1: TLabel;
    rgGender: TRadioGroup;
    chbDateFrom: TCheckBox;
    chbGender: TCheckBox;
    actFilters: TAction;
    chbDateTo: TCheckBox;
    BtnClearFilters: TButton;
    actCleanFilters: TAction;
    Label2: TLabel;
    cbSort: TComboBox;
    LblFIO: TLabel;
    EdtSurName: TEdit;
    EdtName: TEdit;
    EdtSecName: TEdit;
    chbSurName: TCheckBox;
    chbName: TCheckBox;
    chbSecName: TCheckBox;
    BtnChoose: TButton;
    BtnCancel: TButton;
    actChoose: TAction;
    actCancel: TAction;
    procedure BtnSearchClick(Sender: TObject);
    procedure WriteInFile;
    procedure ReadFromFile(var Head, FClients:PListOfClients);
    function ShowClients: Integer;
    procedure actAddClientExecute(Sender: TObject);
    procedure actEditClientExecute(Sender: TObject);
    procedure actDeleteClientExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure actFiltersExecute(Sender: TObject);
    procedure chbDateFromClick(Sender: TObject);
    procedure chbDateToClick(Sender: TObject);
    procedure chbGenderClick(Sender: TObject);
    procedure SortList(num:Integer);
    procedure actCleanFiltersExecute(Sender: TObject);
    procedure cbSortClick(Sender: TObject);
    procedure chbSurNameClick(Sender: TObject);
    procedure chbNameClick(Sender: TObject);
    procedure chbSecNameClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actChooseExecute(Sender: TObject);
    function Check(const temp: PListOfClients): Boolean;
    procedure actCancelExecute(Sender: TObject);


    function FindClient(num: Integer): PListOfClients;
    function NotusedInRec(const del: PListOfCLients): Boolean;
    procedure DisPoseAll;
    procedure actClientsUpdate(Action: TBasicAction; var Handled: Boolean);

  private
    procedure UpDateList;
    procedure ModelAddItem(const SurName, Name, SecName, Gender, Number: String; Date: TDate);
    procedure ModelEditItem(const SurName, Name, SecName, Gender, Number: String; Date: TDate;var temp: PListOfClients);

  public
    FClients, Head: PListOfClients;
    FileOfClients: File of TInfo;
  end;

var
  FrmClients: TFrmClients;
  MaxClient: Integer;

implementation

{$R *.dfm}

uses uMainPage, uEdRecord;

function TFrmClients.FindClient(num: Integer): PListOfClients;
var temp: PListOfClients;
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

procedure TFrmClients.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    BtnBackClick(Sender);
    FrmClients.actChoose.Enabled := false;
    FrmClients.actCancel.Enabled := false;
end;

procedure TFrmClients.FormCreate(Sender: TObject);
begin
    new(Head);
    new(Head.Next);
    Head.Next := nil;
    ReadFromFile(Head,Fclients);
end;

procedure TFrmClients.FormShow(Sender: TObject);
begin
    UpdateList;
end;

procedure TFrmClients.actAddClientExecute(Sender: TObject);
var res: TModalResult;
begin
   res := FrmAdd.ShowNewUser;
   if res <> mrOk then  exit;
   with FrmAdd do
   ModelAddItem(SurName, Name, SecName, Gender, Number, Date);
   UpDateLIst;
end;


procedure TFrmClients.actCancelExecute(Sender: TObject);
begin
    FrmClients.ModalResult := mrCancel;
end;

procedure TFrmClients.actChooseExecute(Sender: TObject);
var Item: TListItem;
temp: PListOfClients;
Index,i: Integer;
s:String;
begin
    Item := listClients.Selected;
    if item <> nil then
      begin
          Index := ListClients.ItemIndex;
          temp := Head.Next;
          for I := 1 to Index do
           begin
              temp := temp.Next;
           end;
          if Check(temp) then
          begin
            //  FrmEdRec.EditClient.Text := s;
              FrmedRec.BtnSave.Enabled := true;
              FrmEdRec.Client := temp;
              FrmClients.ModalResult := mrOk;
          end
          else
          begin
              FrmedRec.BtnSave.Enabled := false;
              Application.MessageBox('Клиент занят в это время. Попробуйте выбрать другое время!', 'Error!', MB_ICONERROR);
              FrmClients.ModalResult := mrCancel;
          end;
      end
    else Application.MessageBox('Выберите клиента!', 'Error!', MB_ICONERROR);
end;

function TFrmClients.Check(const temp: PListOfClients): Boolean;
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
    while (rec <> nil) and not busy do
    begin
        if MainForm.Calend.Date = rec.info.date then
          if (rec.Client = temp) and (rec <> temped) then
            if ((tf <= rec.info.TimeFrom) and (tto > rec.info.TimeFrom)) or ((tf < rec.info.TimeTo)and (tf >= rec.info.TimeFrom) and (tto > rec.info.TimeFrom)) then
              busy := true;
        rec := rec.next;
    end;
    if not busy then
    begin
        result := true;
    end
    else result := false;
end;
procedure TFrmClients.actCleanFiltersExecute(Sender: TObject);
begin
    DateFrom.Enabled := false;
    DateTo.Enabled := false;
    chbDateFrom.Checked := false;
    chbDateTo.Checked := false;
    chbGender.Checked := false;
    chbSurName.Checked := false;
    chbName.Checked := false;
    chbSecName.Checked := false;
    EdtSurName.Enabled := false;
    EdtName.Enabled := false;
    EdtSecName.Enabled := false;
    EdtSurName.Text := '';
    EdtName.Text := '';
    EdtSecName.Text := '';
    rgGender.ItemIndex := -1;
    UpdateList;
end;

procedure TFrmClients.actClientsUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
    actEditClient.Enabled := (ListClients.ItemIndex <> -1);
    actDeleteClient.Enabled := (ListClients.ItemIndex <> -1);
end;

procedure TFrmClients.actDeleteClientExecute(Sender: TObject);
var Index, i: Integer;
temp, buf: PListOfClients;
begin
    Index := ListClients.ItemIndex;
    if ListClients.Selected <> nil then
 begin
        temp := head;
        for i := 0 to index-1 do
        begin
            Temp := temp.next;
        end;
    if NotusedInRec(temp.next) then
    begin
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
    else Application.MessageBox('Клиент есть в списке записей. Его нельзя удалить!', 'Error!', MB_ICONERROR);
 end else
    Application.MessageBox('Выберите клиента для удаления', 'Error!', MB_ICONERROR);
end;

procedure TFrmClients.actEditClientExecute(Sender: TObject);
var res: TModalResult;
Index, i: Integer;
temp: PLIstOfClients;
begin
    if ListClients.Selected <> nil then
    begin
      Index := ListClients.ItemIndex;
      temp := Head.Next;
      for I := 1 to Index do
      begin
          temp := temp.Next;
      end;
      Res := frmAdd.ShowEditUser(
      Temp.Info.SurName, Temp.Info.Name, Temp.Info.SecName, Temp.Info.Gender, Temp.Info.Number, Temp.Info.Date);
      if res <> mrOk then exit;

      with FrmAdd do
      ModelEditItem(SurName, Name, SecName, Gender, Number, Date, temp);
      UpdateList;
    end else
    Application.MessageBox('Выберите клиента для изменения', 'Error!', MB_ICONERROR);
end;

procedure TFrmClients.actFiltersExecute(Sender: TObject);
begin
    PnlFilters.show;
    actAddClient.Enabled := false;
    actEditClient.Enabled := false;
    actDeleteClient.Enabled := false;
    ListClients.Enabled := false;
end;

procedure TFrmClients.BtnBackClick(Sender: TObject);
begin
    Updatelist;
    PnlFilters.Hide;
    actAddClient.Enabled := true;
    actEditClient.Enabled := true;
    actDeleteClient.Enabled := true;
    ListClients.Enabled := true;
    actCleanFiltersExecute(Sender);
end;

procedure TFrmClients.BtnSearchClick(Sender: TObject);
var cnt, i:Integer;
begin
    UpdateList;
    if chbDateFrom.Checked then
    begin
      cnt := ListClients.Items.Count;
      i := 0;
      while i <= cnt - 1 do
      begin
          if (StrToDate(ListClients.Items[i].SubItems[4]) < DateFrom.Date)  then
          begin
              ListClients.Items[i].Selected := true;
              ListClients.Selected.Free;
              dec(cnt);
          end else inc(i);
      end;
    end;
    if chbDateTo.Checked then
    begin
      cnt := ListClients.Items.Count;
      i := 0;
      while i <= cnt - 1 do
      begin
          if (StrToDate(ListClients.Items[i].SubItems[4]) > DateTo.Date)  then
          begin
              ListClients.Items[i].Selected := true;
              ListClients.Selected.Free;
              dec(cnt);
          end else inc(i);
      end;
    end;
    if chbGender.Checked then
    begin
      if (rgGender.ItemIndex <> -1) and (rgGender.ItemIndex <> 2) then
      begin
        cnt := ListClients.Items.Count;
        i := 0;
        while i <= cnt - 1 do
        begin
            if (ListClients.Items[i].SubItems[2] <> rgGender.Items[rgGender.ItemIndex]) then
            begin
                ListClients.Items[i].Selected := true;
                ListClients.Selected.Free;
                dec(cnt);
            end else inc(i);
        end;
      end;
    end;
    if chbSurName.Checked then
    begin
        if EdtSurName.Text <> '' then
        begin
          cnt := ListClients.Items.Count;
          i := 0;
          while i <= cnt - 1 do
          begin
              if AnsiUpperCase(ListClients.Items[i].Caption) <> AnsiUpperCase(EdtSurName.Text)  then
              begin
                  ListClients.Items[i].Selected := true;
                  ListClients.Selected.Free;
                  dec(cnt);
              end else inc(i);
          end;
        end;
    end;
    if chbName.Checked then
    begin
        if EdtName.Text <> '' then
        begin
          cnt := ListClients.Items.Count;
          i := 0;
          while i <= cnt - 1 do
          begin
              if AnsiUpperCase(ListClients.Items[i].SubItems[0]) <> AnsiUpperCase(EdtName.Text)  then
              begin
                  ListClients.Items[i].Selected := true;
                  ListClients.Selected.Free;
                  dec(cnt);
              end else inc(i);
          end;
        end;
    end;
    if chbSecName.Checked then
    begin
        if EdtSecName.Text <> '' then
        begin
          cnt := ListClients.Items.Count;
          i := 0;
          while i <= cnt - 1 do
          begin
              if AnsiUpperCase(ListClients.Items[i].SubItems[1]) <> AnsiUpperCase(EdtSecName.Text)  then
              begin
                  ListClients.Items[i].Selected := true;
                  ListClients.Selected.Free;
                  dec(cnt);
              end else inc(i);
          end;
        end;
    end;
end;

procedure TFrmClients.cbSortClick(Sender: TObject);
begin
    if cbSort.ItemIndex <> -1 then
      SortList(cbSort.ItemIndex);
    UpdateList;
end;

procedure TFrmClients.chbDateFromClick(Sender: TObject);
begin
    if chbDateFrom.Checked then
        DateFrom.Enabled := true
    else DateFrom.Enabled := false;
end;

procedure TFrmClients.chbDateToClick(Sender: TObject);
begin
    if chbDateTo.Checked then
        DateTo.Enabled := true
    else DateTo.Enabled := false;
end;

procedure TFrmClients.chbGenderClick(Sender: TObject);
begin
    if chbGender.Checked then
        rgGender.Enabled := true
    else rgGender.Enabled := false;
end;

procedure TFrmClients.chbNameClick(Sender: TObject);
begin
    if chbName.Checked then
        EdtName.Enabled := true
    else EdtName.Enabled := false;
end;

procedure TFrmClients.chbSecNameClick(Sender: TObject);
begin
    if chbSecName.Checked then
        EdtSecName.Enabled := true
    else EdtSecName.Enabled := false;
end;

procedure TFrmClients.chbSurNameClick(Sender: TObject);
begin
    if chbSurName.Checked then
        EdtSurName.Enabled := true
    else EdtSurName.Enabled := false;
end;

procedure TFrmClients.DisPoseAll;
begin
    while Head <> nil do
    begin
          dispose(head);
          head := head.next;
    end;
end;

procedure TFrmClients.ModelAddItem(const SurName, Name, SecName, Gender, Number: String;
  Date: TDate);
begin
    if head.next = nil then
   begin
      new(head.next);
      FClients := head.next;
      FClients.Info.Id := 0;
      maxClient := 0;
      FClients.Info.SurName := SurName;
      FClients.Info.Name := Name;
      FClients.Info.SecName := SecName;
      FClients.Info.Gender := Gender;
      FClients.Info.Number := Number;
      FClients.Info.Date := Date;
      FClients.Next := nil;
   end else

   begin
       fclients := head.next;
       while fclients.next <> nil do
       begin
           fclients := fclients.next;
       end;
       new(FClients.Next);
       Fclients.Next.Info.id := MaxClient + 1;
       inc(MaxClient);
       FClients := FClients.Next;
       FClients.Info.SurName := SurName;
       FClients.Info.Name := Name;
       FClients.Info.SecName := SecName;
       FClients.Info.Gender := Gender;
       FClients.Info.Number := Number;
       FClients.Info.Date := Date;
       FClients.Next := nil;
   end;
end;

procedure TFrmClients.ModelEditItem(const SurName, Name, SecName, Gender,
  Number: String; Date: TDate; var temp: PListOfClients);
begin
    Temp.Info.SurName := SurName;
    temp.Info.Name := Name;
    Temp.Info.SecName := SecName;
    Temp.Info.Number := Number;
    Temp.Info.Gender := Gender;
    Temp.Info.Date := Date;
end;

procedure TFrmClients.ReadFromFile(var Head, FClients: PListOfClients);
var isCorrect: Boolean;
begin
    isCorrect := true;
    try
        AssignFile(FileOfClients, 'FileOfClients');
        Reset(FileofClients);
    except
        isCorrect := false;
    end;
    FClients := head;
    if not eof(FileOfClients) and isCorrect then
    begin
      new(Head.next);
      fclients := fclients.next;
      fclients := head.next;
      Read(FileOfClients, fclients^.info);
      MaxClient := fclients.info.id;
    end;
    while not eof(FileOfClients) and isCorrect do
    begin
        new(FClients.next);
        fclients := fclients.next;
        Read(FileOfClients, fclients^.info);
        if fclients.info.id > MaxClient then
           MaxClient := fclients.info.id;
    end;
    fclients.next := nil;
    UpdateList;
end;

function TFrmClients.ShowClients: Integer;
var res: Integer;
begin
    Res := ShowModal;
end;

procedure TFrmClients.SortList(num:Integer);
var temp, right, left: PListOfClients;
isNotLess: Boolean;
begin
  if (head.next <> nil) and (head.next.next <> nil) then
  begin
      right := head.next;    //последний отсортированный
      while right.next <> nil do
      begin
          case num of
              0: IsNotLess := right.next.info.SurName >= right.info.SurName;
              1: IsNotLess := right.next.info.Date >= right.info.Date;
          end;
          if not IsNotLess then
          begin
              left := head;
              isNotLess := true;
              while isNotLess do
              begin
                  case num of
                      0: IsNotLess := right.next.info.SurName >= left.next.info.SurName;
                      1: IsNotLess := right.next.info.Date >= left.next.info.Date;
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

procedure TFrmClients.UpDateList;
var Item: TListItem;
    temp: PListOfClients;
begin
    ListClients.Items.Clear;
    MainForm.cbClient.Items.Clear;
    temp := head.next;
      while temp <> nil do
      begin
            item := ListClients.Items.Add;
            Item.Caption := temp.Info.SurName;
            Item.SubItems.Add(temp.Info.Name);
            Item.SubItems.Add(temp.info.SecName);
            Item.SubItems.Add(temp.info.Gender);
            Item.SubItems.Add(temp.info.Number);
            Item.SubItems.Add(DateToStr(temp.info.Date));

            MainForm.cbClient.Items.Add(temp.info.SurName + ' '   + temp.info.Name);
            temp := temp.next;
      end;
      MainForm.UpdateList;
end;

function TFrmClients.NotusedInRec(const del: PListOfClients): Boolean;
var temp: uMainPage.PlistOfRecords;
can: Boolean;
begin
    temp := uMainPage.Head.next;
    can := true;
    while (temp <> nil) and can do
    begin
            if (temp.Client = del) and (temp.info.date >= date) then
               can := false;
        temp := temp.next;
    end;
    result := can;
end;

procedure TFrmClients.WriteInFile;
var temp: PListOfClients;
begin
    AssignFile(FileOfClients, 'FileOfClients');
    Rewrite(FileofClients);
    temp := Head.next;
    while temp <> nil do
    begin
        write(FileOfClients, temp^.info);
        temp := temp.next;
    end;
    CloseFile(FileOfClients);
end;

end.
