unit UDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, Db, ExtCtrls, Grids, DBGrids,
  ComCtrls, DBPanel;

type
  TFDI = class(TForm)
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    BitBtn1: TBitBtn;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    MENumAdic: TMaskEdit;
    MECodFabricante: TMaskEdit;
    MEDesconto: TMaskEdit;
    btnAdd: TBitBtn;
    btnRem: TBitBtn;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    MENumero: TMaskEdit;
    MEData: TMaskEdit;
    MEDataDesembaraco: TMaskEdit;
    MMLocalDesemb: TMemo;
    MMCodigoExp: TMemo;
    dblcUF: TDBLookupComboBox;
    MEBcDi: TMaskEdit;
    Label13: TLabel;
    btnLimpar: TBitBtn;
    CBViaTransp: TComboBox;
    Label7: TLabel;
    MEValorAFRMM: TMaskEdit;
    Label14: TLabel;
    CBTipoIntermediacao: TComboBox;
    Label15: TLabel;
    Label16: TLabel;
    MECNPJEncomendante: TMaskEdit;
    Label17: TLabel;
    MEUFEncomendante: TMaskEdit;
    MeNumDrawback: TMaskEdit;
    Label18: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CBViaTranspChange(Sender: TObject);
    procedure CBTipoIntermediacaoChange(Sender: TObject);
  private
    { Private declarations }
    procedure ExcluiAdicoes(pSeq :Integer = 0);
    procedure PopulaCDS;
  public
    { Public declarations }
  end;

var
  FDI: TFDI;

implementation

uses UNotaEntrada_cl, UEstado_cl, UOracle_cl, UNotaEntradaCad;

{$R *.dfm}

procedure TFDI.PopulaCDS;
begin
  with DMNotaEntrada do
  begin
    QNfeimportAdiCons.Close;
    QNfeimportAdiCons.SetVariable('COD_NOTA_ITEM', QItemNFCOD_NOTA_ITEM.Value);
    QNfeimportAdiCons.Open;
    if QNfeimportAdiCons.RecordCount > 0 then
    begin
      while not QNfeimportAdiCons.Eof do
      begin
        cdsNfeImportAdi.EmptyDataSet;
        cdsNfeImportAdi.Insert;
        cdsNfeImportAdiNUM_ADICAO.Value := QNfeImportAdiConsNUM_ADICAO.Value;
        cdsNfeImportAdiNUM_SEQ_ADIC.Value := QNfeImportAdiConsNUM_SEQ_ADIC.Value;
        cdsNfeImportAdiCOD_FABRICANTE.Value := QNfeImportAdiConsCOD_FABRICANTE.Value;
        cdsNfeImportAdiVAL_DESCONTO.Value := QNfeImportAdiConsVAL_DESCONTO.Value;
        cdsNfeImportAdiDESC_NUM_DRAW.Value := QNfeimportAdiConsDESC_NUM_DRAW.Value;
        cdsNfeImportAdi.Post;
        QNfeimportAdiCons.Next;
      end;
    end;
  end;
end;

procedure TFDI.FormActivate(Sender: TObject);
begin
  DMEstado.DSEstadoRel.DataSet.Open;
  MENumero.SetFocus;
  with DMNotaEntrada do
  begin
    if QItemNFNUM_DI.Value <> '' then
      MENumero.Text := QItemNFNUM_DI.Value;
    if QItemNFDT_DI.Text <> '' then
      MEData.Text :=  QItemNFDT_DI.Text;
    if QItemNFDT_DESEMB_DI.Text <> '' then
      MEDataDesembaraco.Text := QItemNFDT_DESEMB_DI.Text;
    if QItemNFCOD_UF_DESEMB_DI.Value <> '' then
      dblcUF.KeyValue := QItemNFCOD_UF_DESEMB_DI.Value;
    if QItemNFDESC_LOCAL_DESEMB_DI.Value <> '' then
      MMLocalDesemb.Text := QItemNFDESC_LOCAL_DESEMB_DI.Value;
    if QItemNFCOD_EXPORTADOR.Value <> '' then
      MMCodigoExp.Text := QItemNFCOD_EXPORTADOR.Text;
    if QItemNFVAL_BC_DI.Text <> '' then
      MEBcDi.Text := QItemNFVAL_BC_DI.Text;    
    if QItemNFIND_TIPO_VIA_TRANSP_DI.Value > 0 then
      CBViaTransp.ItemIndex := QItemNFIND_TIPO_VIA_TRANSP_DI.Value - 1;
    if QItemNFIND_TIPO_INTERMEDIO_DI.Value > 0 then
      CBTipoIntermediacao.ItemIndex := QItemNFIND_TIPO_INTERMEDIO_DI.Value - 1;
    if QItemNFVAL_AFRMM_DI.Text <> '' then
      MEValorAFRMM.Text := QItemNFVAL_AFRMM_DI.Text;
    if QItemNFDESC_CNPJ_ENCOMENDANTE_DI.Text <> '' then
      MECNPJEncomendante.Text := QItemNFDESC_CNPJ_ENCOMENDANTE_DI.Text;
    if QItemNFDESC_UF_ENCOMENDANTE_DI.Text <> '' then
      MEUFEncomendante.Text := QItemNFDESC_UF_ENCOMENDANTE_DI.Text;
  end;
  PopulaCDS;
end;

procedure TFDI.btnOkClick(Sender: TObject);
var
  fPost :Boolean;
begin
  fPost := false;
  with DMNotaEntrada do
  begin
    //DI
    if QItemNF.State = DSBrowse then
    begin
      QItemNF.Edit;
      fPost := true;
    end;
    QItemNFNUM_DI.Value := MENumero.Text;
    QItemNFDT_DI.Value := StrToDate(MEData.Text);
    QItemNFDT_DESEMB_DI.Value := StrToDate(MEDataDesembaraco.Text);
    QItemNFCOD_UF_DESEMB_DI.Value := dblcUF.KeyValue;
    QItemNFDESC_LOCAL_DESEMB_DI.Value := MMLocalDesemb.Text;
    QItemNFCOD_EXPORTADOR.Value := MMCodigoExp.Text;
    QItemnfVAL_BC_DI.Text := Trim(MEBcDi.Text);
    QItemNFIND_TIPO_VIA_TRANSP_DI.Value := CBViaTransp.ItemIndex+1;
    QItemNFVAL_AFRMM_DI.Text := trim(MEValorAFRMM.Text);
    QItemNFIND_TIPO_INTERMEDIO_DI.Value := CBTipoIntermediacao.ItemIndex+1;
    QItemNFDESC_CNPJ_ENCOMENDANTE_DI.Text := trim(MECNPJEncomendante.Text);
    QItemNFDESC_UF_ENCOMENDANTE_DI.Text := trim(MEUFEncomendante.Text);
    if fPost then
      QItemNF.Post;

    //Adicoes
    if cdsNfeImportAdi.RecordCount = 0 then
    begin
      MessageDlg('Nenhuma adição informada', mtError, [mbOk], 0);
      Abort;
    end;
    cdsNfeImportAdi.First;
    QNfeImportAdi.Open;
    while not cdsNfeImportAdi.Eof do
    begin
      QNfeImportAdi.Insert;
      QNfeImportAdiCOD_NOTA_ITEM.Value :=
        QItemNFCOD_NOTA_ITEM.Value;
      QNfeImportAdiNUM_ADICAO.Value :=
        cdsNfeImportAdiNUM_ADICAO.Value;
      QNfeImportAdiNUM_SEQ_ADIC.Value :=
        cdsNfeImportAdiNUM_SEQ_ADIC.Value;
      QNfeImportAdiCOD_FABRICANTE.Value :=
        cdsNfeImportAdiCOD_FABRICANTE.Value;
      QNfeImportAdiVAL_DESCONTO.Value :=
        cdsNfeImportAdiVAL_DESCONTO.Value;
      QNfeImportAdiDESC_NUM_DRAW.Value :=
        cdsNfeImportAdiDESC_NUM_DRAW.Value;
      QNfeImportAdi.Post;
      cdsNfeImportAdi.Next;
    end;
  end;
  Close;
end;

procedure TFDI.btnLimparClick(Sender: TObject);
var
  fPost :Boolean;
begin
  fPost := false;
  with DMNotaEntrada do
  begin
    if QItemNF.State = DSBrowse then
    begin
      QItemNF.Edit;
      fPost := true;
    end;
    ExcluiAdicoes(0);
    QItemNFNUM_DI.Clear;
    MENumero.Clear;
    QItemNFDT_DI.Clear;
    MEData.Clear;
    QItemNFDT_DESEMB_DI.Clear;
    MEDataDesembaraco.Clear;
    QItemNFCOD_UF_DESEMB_DI.Clear;
    dblcUF.ListSource.DataSet.First;
    QItemNFDESC_LOCAL_DESEMB_DI.Clear;
    MMLocalDesemb.Clear;
    QItemNFCOD_EXPORTADOR.Clear;
    MMCodigoExp.Clear;
    QItemNFVAL_BC_DI.Clear;
    MEBcDi.Clear;
    QItemNFIND_TIPO_VIA_TRANSP_DI.Clear;
    CBViaTransp.ItemIndex := -1;
    QItemNFVAL_AFRMM_DI.Clear;
    MEValorAFRMM.Clear;
    QItemNFIND_TIPO_INTERMEDIO_DI.Clear;
    CBTipoIntermediacao.ItemIndex := -1;
    QItemNFDESC_CNPJ_ENCOMENDANTE_DI.Clear;
    MECNPJEncomendante.Clear;
    QItemNFDESC_UF_ENCOMENDANTE_DI.Clear;
    MEUFEncomendante.Clear;

    if fPost then
      QItemNF.Post;
  end;
end;

procedure TFDI.btnAddClick(Sender: TObject);
var
  i :Integer;
begin
  i := 1;
  if (trim(MENumAdic.Text) = '') or
    (trim(MECodFabricante.Text) = '') or
    (trim(MEDesconto.Text) = '') then
  begin
    MessageDlg('Por favor informe todos os dados', mtError, [mbOk], 0);
    Abort;
  end;
  with DMNotaEntrada do
  begin
    cdsNfeImportAdi.Insert;

    cdsNfeImportAdiNUM_ADICAO.Text :=
      Trim(MENumAdic.Text);
    cdsNfeImportAdiCOD_FABRICANTE.Text :=
      MECodFabricante.Text;
    cdsNfeImportAdiVAL_DESCONTO.Text :=
      MEDesconto.Text;
    cdsNfeImportAdiDESC_NUM_DRAW.Text :=
      MeNumDrawback.Text;
    cdsNfeImportAdi.Post;
    cdsNfeImportAdi.First;
    while not cdsNfeImportAdi.Eof do
    begin
      cdsNfeImportAdi.Edit;
      cdsNfeImportAdiNUM_SEQ_ADIC.Value := i;
      Inc(i);
      cdsNfeImportAdi.Post;
      cdsNfeImportAdi.Next;
    end;
  end;
  MENumAdic.Clear;
  MECodFabricante.Clear;
  MEDesconto.Clear;
  MeNumDrawback.Clear;
end;

procedure TFDI.ExcluiAdicoes(pSeq :Integer = 0);
var
  wSql :String;
begin
  wSql := '';
  with DMOracle do
  begin
    with DMNotaEntrada do
    begin
      if cdsNfeImportAdi.RecordCount = 0 then
        Abort;
      wSql := 'DELETE FROM TB_NFE_IMPORT_ADI WHERE COD_NOTA_ITEM = ' + QItemNFCOD_NOTA_ITEM.Text;
      if pSeq > 0 then
        wSql := wSql + ' AND NUM_SEQ_ADIC = ' + IntToStr(pSeq);
      QExecSQL.SQL.Clear;
      QExecSQL.SQL.Add(wSql);
      try
        DBCemapa.StartTransaction;
        QExecSQL.Close;
        QExecSQL.ExecSQL;
        DBCemapa.Commit;
      except
        MessageDlg('Não foi possível remover esta adição, por favor exclua a DI por completa no botão Excluir DI',
          mtError, [mbOk],0);
        Abort;
      end;

    end;
  end;

end;

procedure TFDI.btnRemClick(Sender: TObject);
begin
  with DMNotaEntrada do
  begin
    ExcluiAdicoes(cdsNfeImportAdiNUM_SEQ_ADIC.Value);
    cdsNfeImportAdi.Delete;
  end;
end;

procedure TFDI.BitBtn1Click(Sender: TObject);
begin
  with DMNotaEntrada do
  begin
    QItemNFVAL_BC_II.Clear;
    QItemNFVAL_DESPADU_II.Clear;
    QItemNFVAL_II.Clear;
    QItemNFVAL_IOF_II.Clear;
  end;
end;

procedure TFDI.CBViaTranspChange(Sender: TObject);
begin
  MEValorAFRMM.Enabled := CBViaTransp.ItemIndex = 0;
end;

procedure TFDI.CBTipoIntermediacaoChange(Sender: TObject);
begin
  MECNPJEncomendante.Enabled := not CBTipoIntermediacao.ItemIndex = 0;
  MEUFEncomendante.Enabled := MECNPJEncomendante.Enabled;
end;

end.
