unit uServ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.Samples.Spin;

type

TInfo = record
  id: Integer;
  Name: String[50];
  Price: String[25];
  Time: TTime;
  checked: boolean;
end;

PListOfServ = ^elem;
elem = record
  info: TInfo;
  Next: PLIstOfServ;
end;

  TFrmServ = class(TForm)
    PnlLeft: TPanel;
    PnlRight: TPanel;
    ListOfServ: TListView;
    actServ: TActionList;
    BtnAdd: TButton;
    BtnEdit: TButton;
    BtnDelete: TButton;
    actAddServ: TAction;
    actEditServ: TAction;
    actDeleteServ: TAction;
    EdtName: TEdit;
    PnlFilters: TPanel;
    LblPrice: TLabel;
    LblTime: TLabel;
    chbPriceFrom: TCheckBox;
    chbPriceTo: TCheckBox;
    chbTimeFrom: TCheckBox;
    chbTimeTo: TCheckBox;
    sEdtPriceFrom: TSpinEdit;
    sEdtPriceTo: TSpinEdit;
    TimeFrom: TDateTimePicker;
    TimeTo: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtnFilters: TButton;
    actFilters: TAction;
    BtnOk: TButton;
    BtnBack: TButton;
    BtnClean: TButton;
    Label5: TLabel;
    cbSort: TComboBox;
    chbName: TCheckBox;
    actCleanFilters: TAction;
    Label6: TLabel;
    BtnChoose: TButton;
    BtnCancel: TButton;
    actChoose: TAction;
    actCancel: TAction;
    procedure ReadFromFile;
    procedure WriteInFile;
    procedure ModelAddServ(const Name, Price:String; const Time: TTime);
    procedure ModelEditServ(const Name, Price: String; const Time: Ttime; var temp: PListofServ);
    procedure UPdateList;
    procedure actAddServExecute(Sender: TObject);
    procedure actEditServExecute(Sender: TObject);
    procedure actDeleteServExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actFiltersExecute(Sender: TObject);
    procedure chbPriceFromClick(Sender: TObject);
    procedure chbPriceToClick(Sender: TObject);
    procedure chbTimeFromClick(Sender: TObject);
    procedure chbTimeToClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure sEdtPriceFromKeyPress(Sender: TObject; var Key: Char);
    procedure sEdtPriceToKeyPress(Sender: TObject; var Key: Char);
    procedure BtnBackClick(Sender: TObject);
    procedure chbNameClick(Sender: TObject);
    procedure actCleanFiltersExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SortList(num:Integer);
    procedure cbSortClick(Sender: TObject);
    procedure actChooseExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);

    function FindServ(num: Integer): PListOfserv;
    function NotUsedInRec(const del: PLIstOfServ):Boolean;
    Procedure DisposeAll;
    procedure actServUpdate(Action: TBasicAction; var Handled: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
    LServ, Head: PListOfServ;
    first: Boolean;
    FileOfServ: File of TInfo;
  end;

var
  FrmServ: TFrmServ;
  MaxServ: Integer;

implementation

{$R *.dfm}

uses uEdServ, uMasters, uEdRecord, uMainPage;

procedure TFrmServ.actAddServExecute(Sender: TObject);
var res: TModalResult;
begin
   res := FrmEdServ.ShowNewServ;
   if res <> mrOk then  exit;
   with FrmEdServ do
   ModelAddServ(Name, Price, Time);
   UpDateLIst;
end;

procedure TFrmServ.actCancelExecute(Sender: TObject);
begin
    FrmServ.ModalResult := mrCancel;
end;

procedure TFrmServ.actChooseExecute(Sender: TObject);
var Item: TListItem;
temp: PListOfSErv;
i,Index: Integer;
begin
    Item := ListOfserv.Selected;
    if item <> nil then
      begin
        Index := ListOfServ.ItemIndex;
        temp := Head.Next;
        for I := 1 to Index do
        begin
            temp := temp.Next;
        end;
        FrmEdRec.Serv := temp;
        FrmServ.ModalResult := mrOk;
      end
    else Application.MessageBox('Выберите услугу!', 'Error!', MB_ICONERROR);
end;

procedure TFrmServ.actCleanFiltersExecute(Sender: TObject);
begin
    chbPriceFrom.Checked := false;
    chbPriceTo.Checked := false;
    chbTimeFrom.Checked := false;
    chbTimeTo.Checked := false;
    sEdtPriceFrom.Enabled := false;
    sEdtPriceTo.Enabled := false;
    TimeFrom.Enabled := false;
    TimeTo.Enabled := false;
    chbName.Checked := false;
    EdtName.Enabled := false;
    EdtName.Text := '';
    Updatelist;
end;

procedure TFrmServ.actDeleteServExecute(Sender: TObject);
var Index, i: Integer;
item: TListItem;
temp, buf: PListOfServ;
begin
    Index := ListofServ.ItemIndex;
    if ListOfServ.Selected <> nil then
 begin
        temp := head;
        for i := 0 to index-1 do
        begin
            Temp := temp.next;
        end;
    if notUsedInRec(temp.next) then
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
    end else  Application.MessageBox('Услуга используется в списке записей. Вы не можете удалить её!', 'Error!', MB_ICONERROR);
 end else
    Application.MessageBox('Выберите услугу для удаления', 'Error!', MB_ICONERROR);
end;

procedure TFrmServ.actEditServExecute(Sender: TObject);
var res: TModalResult;
Index, i: Integer;
Item: TListItem;
temp: PLIstOfServ;
begin
    Item := ListOfServ.Selected;
    if ListOfServ.Selected <> nil then
    begin
      Index := ListOfServ.ItemIndex;
      temp := Head.Next;
      for I := 1 to Index do
      begin
          temp := temp.Next;
      end;
      Res := frmEdServ.ShowEditServ(
      Temp.Info.Name, Temp.Info.Price, Temp.Info.Time);
      if res <> mrOk then exit;

      with FrmedServ do
      ModelEditServ(Name, Price, Time, temp);
      UpdateList;
    end else
    Application.MessageBox('Выберите клиента для изменения', 'Error!', MB_ICONERROR);
end;

procedure TFrmServ.actFiltersExecute(Sender: TObject);
begin
    PnlFilters.show;
    actAddServ.Enabled := false;
    actEditServ.Enabled := false;
    actDeleteServ.Enabled := false;
    ListOfServ.Enabled := false;
end;

procedure TFrmServ.actServUpdate(Action: TBasicAction; var Handled: Boolean);
begin
    actEditServ.Enabled := (ListOfServ.ItemIndex <> -1);
    actDeleteServ.Enabled := (ListOfServ.ItemIndex <> -1);
end;

procedure TFrmServ.BtnBackClick(Sender: TObject);
begin
    Updatelist;
    PnlFilters.Hide;
    actAddServ.Enabled := true;
    actEditServ.Enabled := true;
    actDeleteServ.Enabled := true;
    ListOfServ.Enabled := true;
    actCleanFiltersExecute(Sender);
end;

procedure TFrmServ.BtnOkClick(Sender: TObject);
var cnt, i: Integer;
begin
    UpdateList;
    if chbTimeFrom.Checked then
    begin
        cnt := ListOfServ.Items.Count;
      i := 0;
      while i <= cnt - 1 do
      begin
          if (StrToTime(ListOfServ.Items[i].SubItems[1]) < TimeFrom.Time) then
          begin
                ListOfServ.Items[i].Selected := true;
                ListOfServ.Selected.Free;
                dec(cnt);
          end else inc(i);
      end;
    end;
    if chbTimeTo.Checked then
    begin
        cnt := ListOfServ.Items.Count;
      i := 0;
      while i <= cnt - 1 do
      begin
          if (StrToTime(ListOfServ.Items[i].SubItems[1]) > TimeTo.Time) then
          begin
              ListOfServ.Items[i].Selected := true;
              ListOfServ.Selected.Free;
              dec(cnt);
          end else inc(i);
      end;
    end;
    if chbPriceFrom.Checked and (sEdtPriceFrom.Text <> '') then
    begin
      cnt := ListOfServ.Items.Count;
      i := 0;
      while i <= cnt - 1 do
      begin
          if (StrToInt(ListOfServ.Items[i].SubItems[0]) < StrToInt(sEdtPriceFrom.Text)) then
          begin
              ListOfServ.Items[i].Selected := true;
              ListOfServ.Selected.Free;
              dec(cnt);
          end else inc(i);
      end;
    end;
    if chbPriceTo.Checked and (sEdtPriceTo.Text <> '') then
    begin
      cnt := ListOfServ.Items.Count;
      i := 0;
      while i <= cnt - 1 do
      begin
          if (StrToInt(ListOfServ.Items[i].SubItems[0]) > StrToInt(sEdtPriceTo.Text)) then
          begin
              ListOfServ.Items[i].Selected := true;
              ListOfServ.Selected.Free;
              dec(cnt);
          end else inc(i);
      end;
    end;
    if chbName.Checked then
    begin
        if EdtName.Text <> '' then
    begin
      cnt := ListOfServ.Items.Count;
      i := 0;
      while i <= cnt - 1 do
      begin
          if AnsiUpperCase(ListOfServ.Items[i].Caption) <> AnsiUpperCase(EdtName.Text)  then
          begin
              ListOfServ.Items[i].Selected := true;
              ListOfServ.Selected.Free;
              dec(cnt);
          end else inc(i);
      end;
    end;
    end;
end;

procedure TFrmServ.chbNameClick(Sender: TObject);
begin
    if chbName.Checked then
       EdtName.Enabled := true
    else  EdtName.Enabled := false;
end;

procedure TFrmServ.chbPriceFromClick(Sender: TObject);
begin
    if chbPriceFrom.Checked then
       sEdtPriceFrom.Enabled := true
    else  sEdtPriceFrom.Enabled := false;
end;

procedure TFrmServ.chbPriceToClick(Sender: TObject);
begin
    if chbPriceTo.Checked then
       sEdtPriceTo.Enabled := true
    else  sEdtPriceTo.Enabled := false;
end;

procedure TFrmServ.chbTimeFromClick(Sender: TObject);
begin
      if chbTimeFrom.Checked then
         TimeFRom.Enabled := true
      else TimeFrom.Enabled := false;
end;

procedure TFrmServ.chbTimeToClick(Sender: TObject);
begin
    if chbTimeTo.Checked then
         TimeTo.Enabled := true
    else TimeTo.Enabled := false;
end;


procedure TFrmServ.DisposeAll;
begin
    while Head <> nil do
    begin
          dispose(head);
          head := head.next;
    end;
end;

procedure TFrmServ.cbSortClick(Sender: TObject);
begin
    if cbSort.ItemIndex <> -1 then
        SortList(cbSort.ItemIndex);
    UpdateList;
end;

function TFrmServ.FindServ(num: Integer): PListOfserv;
var temp: PListOfServ;
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

procedure TFrmServ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    BtnBackClick(Sender);
    actChoose.Enabled := false;
    actCancel.Enabled := false;
end;

procedure TFrmServ.FormCreate(Sender: TObject);
begin
    new(Head);
    new(Head.Next);
    Head.Next := nil;
    ReadFromFile;
    actChoose.Enabled := false;
    actCancel.Enabled := false;
    MainForm.ReadFromFile;
end;

procedure TFrmServ.FormShow(Sender: TObject);
begin
    UpdateList;
end;

procedure TFrmServ.ModelAddServ(const Name, Price:String; const Time: TTime);
begin
    if head.next = nil then
   begin
      new(head.next);
      LServ := head.next;
      LServ.Info.Id := 0;
      MaxServ := 0;
      LServ.Info.Name := Name;
      LServ.info.checked := false;
      LServ.Info.Price := price;
      LServ.Info.Time := Time;
      LServ.Next := nil;
   end else

   begin
       LServ := head.next;
       while (LServ.next <> nil) do
       begin
         LServ := LServ.next;
       end;
       new(LServ.Next);
       LServ.Next.info.id := maxServ + 1;
       inc(maxServ);
       LServ := LServ.Next;
       LServ.info.checked := false;

       LServ.Info.Name := Name;
       LServ.Info.Price := Price;
       LServ.Info.Time := Time;
       LServ.Next := nil;
   end;
end;

procedure TFrmServ.ModelEditServ(const Name, Price: String; const Time: Ttime;
  var temp: PListofServ);
begin
    temp.Info.Name := Name;
    Temp.Info.Price := Price;
    Temp.Info.Time := Time;
end;

function TFrmServ.NotUsedInRec(const del: PLIstOfServ): Boolean;
var temp: uMainPage.PlistOfRecords;
can: Boolean;
begin
    temp := uMainPage.Head.next;
    can := true;
    while (temp <> nil) and can do
    begin
            if (temp.serv = del) and (temp.info.date >= date) then
               can := false;
        temp := temp.next;
    end;
    result := can;
end;

procedure TFrmServ.ReadFromFile;
var isCorrect: Boolean;
begin
    isCorrect := true;
    try
        AssignFile(FileOfServ, 'FileOfServ');
        Reset(FileofServ);
    except
        isCorrect := false;
    end;
    LServ := head;
    if not eof(FileOfServ) and isCorrect then
    begin
      new(Head.next);
      lserv := lserv.next;
      lserv := head.next;
      Read(FileOfServ, lserv^.info);
      MaxServ := lserv.info.id;
      LServ.info.checked := false;
    end;
    while not eof(FileOfServ) and isCorrect do
    begin
        new(lserv.next);
        lserv := lserv.next;
        Read(FileOfServ, lserv^.info);
        if lserv.info.id > maxServ then
           maxServ := lserv.info.id;
        LServ.info.checked := false;
    end;
    lserv.next := nil;
    UpdateList;
end;

procedure TFrmServ.sEdtPriceFromKeyPress(Sender: TObject; var Key: Char);
begin
    if key = '-' then
      key := #0;
end;

procedure TFrmServ.sEdtPriceToKeyPress(Sender: TObject; var Key: Char);
begin
    if key = '-' then
      key := #0;
end;

procedure TFrmServ.SortList(num: Integer);
var temp, right, left: PListOfServ;
isNotLess: Boolean;
begin
  if (head.next <> nil) and (head.next.next <> nil) then
  begin
    right := head.next;    //последний отсортированный
    while right.next <> nil do
    begin
        case num of
            0: IsNotLess := right.next.info.Name >= right.info.Name;
            1: IsNotLess := StrToInt(right.next.info.Price) >= StrToInt(right.info.Price);
            2: IsNotLess := StrToInt(right.next.info.Price) <= StrToInt(right.info.Price);
            3: IsNotLess := right.next.info.Time >= right.info.Time;
            4: IsNotLess := right.next.info.Time <= right.info.Time;
        end;
        if not IsNotLess then
        begin
            left := head;
            isNotLess := true;
            while isNotLess do
            begin
                case num of
                    0: IsNotLess := right.next.info.Name >= left.next.info.Name;
                    1: IsNotLess := StrToInt(right.next.info.Price) >= StrToInt(left.next.info.Price);
                    2: IsNotLess := StrToInt(right.next.info.Price) <= StrToInt(left.next.info.Price);
                    3: IsNotLess := right.next.info.Time >= left.next.info.Time;
                    4: IsNotLess := right.next.info.Time <= left.next.info.Time;
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

procedure TFrmServ.UPdateList;
var Item: TListItem;
    temp: PListOfServ;
    s: String[9];
begin
    ListOfServ.Items.Clear;
    MainForm.cbServ.Items.Clear;
    temp := head.next;
      while temp <> nil do
      begin
            item := ListOfServ.Items.Add;
            Item.Caption := temp.Info.Name;
            Item.SubItems.Add(temp.Info.Price);
            s := TimeToStr(temp.info.Time);
            Delete(s, length(s) - 3, 3);
            Item.SubItems.Add(s);
            MainForm.cbServ.Items.Add(temp.info.Name);
            temp := temp.next;
      end;
      MainForm.UpdateList;
end;

procedure TFrmServ.WriteInFile;
var temp: PListOfServ;
begin
    AssignFile(FileOfServ, 'FileOfServ');
    Rewrite(FileofServ);
    temp := Head.next;
    while temp <> nil do
    begin
        write(FileOfServ, temp^.info);
        temp := temp.next;
    end;
    CloseFile(FileOfServ);
end;

end.
