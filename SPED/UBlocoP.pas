unit UBlocoP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBPanel, DB, OracleNavigator,
  DBCtrls, Grids, DBGrids, DBClient;

type
  TFBlocoP = class(TForm)
    CBFilial: TComboBox;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    GroupBox2: TGroupBox;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    cbRec: TComboBox;
    Label2: TLabel;
    btLimpar: TButton;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure CBFilialDropDown(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure CBFilialChange(Sender: TObject);
    procedure cbRecChange(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBPanel4DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure btLimparClick(Sender: TObject);

  private
    { Private declarations }
    procedure FilialSelecionada;
    procedure Totaliza(pDataSet: TClientDataSet);
  public
    { Public declarations }
  end;

var
  FBlocoP: TFBlocoP;
  wFilialSelecionada: String;

implementation

uses UOracle_cl, UPisCofins0_cl, Math, DateUtils, UPisCofinsP_cl,
  UAtividadeContribCons;

{$R *.dfm}

procedure TFBlocoP.FormActivate(Sender: TObject);
var
  b: TBuscador;
begin
  with DMOracle do
  begin
    QExecSQL.SQL.Clear;
    QExecSQL.SQL.Add('SELECT COD_FILIAL ||' + quotedStr(' - ') +
    '|| DESC_FILIAL FROM TB_FILIAL WHERE COD_INC_TRIB_PREV '+
    'IS NOT NULL');
    QExecSQL.Open;
    if QExecSQL.RecordCount = 0 then
    begin
      MessageDlg('Nenhuma filial está cadastrada para gerar o Bloco P' + #13#10 +
      'Por favor verifique o cadastro de filiais.', mtError, [mbOk], 0);
      Abort;
    end;
    QExecSQL.First;
    CBFilial.Clear;
    while not QExecSQL.Eof do
    begin
      CBFilial.Items.Add(QExecSQL.Fields[0].Text);
      QExecSQL.Next;
    end;
  end;
  FilialSelecionada
end;

procedure TFBlocoP.FilialSelecionada;
var wFilial: TStringList;
  i: integer;
begin
  if CBFilial.Text <> '' then
  begin
    wFilial := TStringList.Create;
    wFilial.Delimiter := '-';
    wFilial.DelimitedText := CBFilial.Text;
    wFilialSelecionada := wFilial[0];
  end;
end;

procedure TFBlocoP.CBFilialDropDown(Sender: TObject);
begin
  if CBFilial.Items.Count = 0 then
    FormActivate(Self);
  if DmPisCofins0.CDS145.State in [dsInsert, dsEdit] then
    DmPisCofins0.CDS145.Post;
  if DmPisCofinsP.CDS100.State in [dsInsert, dsEdit] then
    DmPisCofinsP.CDS100.Post;
  FilialSelecionada;
  if cbRec.ItemIndex = -1 then
  begin
    cbRec.ItemIndex := 0;
    cbRecChange(self);
  end;
end;

procedure TFBlocoP.BtOkClick(Sender: TObject);
begin
  with DmPisCofins0, DmPisCofinsP do
  begin
    CDS100.Post;
    CDS145.Post;
    if CDS200.State in [DSInsert, DSEdit] then
      CDS200.Post;
    CDS100.OnCalcFields := Nil;
    Totaliza(CDS100);
    CDS100.OnCalcFields := CDS100CalcFields;
  end;
end;

procedure TFBlocoP.Totaliza(pDataSet: TClientDataSet);
var ds: TClientDataSet;
  wTotal: Double;
begin
  wTotal := 0;
  ds := TClientDataSet.Create(Nil);
  ds.SetProvider(pDataSet);
  ds.Open;
  ds.First;
  while not ds.Eof do
  begin
    if ds.Fields.FieldByName('vl_cont_apu').Text <> '' then
      wTotal := wTotal + ds.Fields.FieldByName('vl_cont_apu').Value;
    ds.Next;
  end;
  with DmPisCofinsP do
  begin
    CDS200.Edit;
    CDS200VL_TOT_CONT_APU.Value := wTotal;
    CDS200.Post;
  end;
end;

procedure TFBlocoP.CBFilialChange(Sender: TObject);
var wExit: bool;
begin
  wExit := false;
  FilialSelecionada;

  with DmPisCofins0, DmPisCofinsP do
  begin
    if CDS100.State in [DsInsert, DsEdit] then
      CDS100.Cancel;
    CDS145.First;
    while not CDS145.Eof do
    begin
      if CDS145COD_FILIAL.Text = wFilialSelecionada then
      begin
        CDS145.Edit;
        wExit := true;
        break;
      end;
      CDS145.Next;
    end;
    CDS100.First;
    
    if wExit then
      exit;

    with DmOracle do
    begin
      CDS145.Insert;
      CDS145COD_FILIAL.Text := wFilialSelecionada;
      CDS145COD_INC_TRIB.Text := FastSelect('COD_INC_TRIB_PREV','TB_FILIAL',
        'COD_FILIAL = '+wFilialSelecionada);
    end;
    CDS145.Post;
  end;
end;

procedure TFBlocoP.cbRecChange(Sender: TObject);
var wCodigo: TStringList;
begin
  with DmPisCofinsP do
  begin
    if CDS200.RecordCount = 0 then
      CDS200.Insert
    else
      CDS200.Edit;

    wCodigo := TStringList.Create;
    wCodigo.Delimiter := '-';
    wCodigo.DelimitedText := cbRec.Text;
    CDS200COD_REC.Value := wCodigo[0];
    CDS200.Post;
  end;
end;

procedure TFBlocoP.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  with DmPisCofinsP do
    if CDS100.State in [dsInsert, dsEdit] then
      CDS100.Post;
end;
procedure TFBlocoP.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then
    DBPanel3.SetFocus;
end;

procedure TFBlocoP.DBPanel4DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  Classe := TFAtividadeContribCons;
  FormConsulta := @FAtividadeContribCons;
end;

procedure TFBlocoP.btLimparClick(Sender: TObject);
begin
  with DmPisCofins0, DmPisCofinsP do
  begin
    CDS145.EmptyDataSet;
    CDS100.EmptyDataSet;
    CDS200.EmptyDataSet;
    CBFilial.Clear;
  end;
end;

end.
