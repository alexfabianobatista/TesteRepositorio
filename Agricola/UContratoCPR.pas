unit UContratoCPR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, ComObj, DBDirceu, OracleNavigator, Grids, DBGrids, variants,
  ActnList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TFContrato_CPR = class(TFTCadSimples)
    EmissocontratoCPR1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    DBEdit24: TDBEdit;
    Label20: TLabel;
    BtFilialCons: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    BtCadastroCons: TSpeedButton;
    BtAvalistaCons: TSpeedButton;
    BtProdutoCons: TSpeedButton;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    Label18: TLabel;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    Label19: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label11: TLabel;
    DBEdit3: TDBEdit;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DeclaraoBaixaCPR1: TMenuItem;
    TabSheet4: TTabSheet;
    Label14: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit18: TDBEdit;
    RelaodeContratos1: TMenuItem;
    TabSheet5: TTabSheet;
    Label25: TLabel;
    SBGarantidor: TSpeedButton;
    DBEdit19: TDBEdit;
    DBDirceu5: TDBDirceu;
    DBMemo4: TDBMemo;
    TabSheet6: TTabSheet;
    DBEdit20: TDBEdit;
    Label24: TLabel;
    SBSolidario1: TSpeedButton;
    DBDirceu6: TDBDirceu;
    DBEdit27: TDBEdit;
    Label31: TLabel;
    DBEdit21: TDBEdit;
    Label26: TLabel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label27: TLabel;
    Opes1: TMenuItem;
    GerarContasaPagar1: TMenuItem;
    VoltaGeraoContasaPagar1: TMenuItem;
    TabSheet7: TTabSheet;
    DBGrid5: TDBGrid;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox4: TGroupBox;
    Label93: TLabel;
    SpeedButton10: TSpeedButton;
    Label94: TLabel;
    Label95: TLabel;
    MeArquivo: TMaskEdit;
    BitBtn5: TBitBtn;
    DBEdit57: TDBEdit;
    DBEdit58: TDBEdit;
    DsContratoCpr_Doc: TDataSource;
    OpenDialog: TOpenDialog;
    RelaodeNotasporContrato1: TMenuItem;
    procedure BtProdutoConsClick(Sender: TObject);
    procedure BtCadastroConsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtFilialConsClick(Sender: TObject);
    procedure BtAvalistaConsClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure EmissocontratoCPR1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DeclaraoBaixaCPR1Click(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure RelaodeContratos1Click(Sender: TObject);
    procedure SBSolidario1Click(Sender: TObject);
    procedure SBGarantidorClick(Sender: TObject);
    procedure GerarContasaPagar1Click(Sender: TObject);
    procedure VoltaGeraoContasaPagar1Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RelaodeNotasporContrato1Click(Sender: TObject);
    procedure DBEdit24Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContrato_CPR: TFContrato_CPR;
  WinWord, Docs, Doc: Variant;

implementation

uses UContratoCPR_cl, UProdutoCons, UCadastroCons, Ucontrato_cl,
  UProduto_cl, UCadastro_cl, UFilialCons, UFilial_cl, UContratoCPRCons,
  UOracle_cl, UBiblioteca, UProdutoAgricola_cl, UUsuario_cl,
  UParamSistema_cl, UNotaSaida_cl, UBaixaCPR, UTela_cl, UContrato_Param,
  URContratoCPR, URContrato, UContrato_CP, UPDFViewer, UFmFilial,
  URNotasCPR_Relacao;

{$R *.DFM}

procedure TFContrato_CPR.BtProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
     DMContrato_CPR.QContrato_CPRCOD_PRODUTO.Value:=DMProduto.QProdutoConsCod_Produto.Value;
end;

procedure TFContrato_CPR.BtCadastroConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     DMContrato_CPR.QContrato_CPRCOD_CADASTRO.Value:=DMCadastro.QCadastroConsCod_cadastro.Value;

end;

procedure TFContrato_CPR.FormActivate(Sender: TObject);
begin
  inherited;
  with DMContrato_CPR do
  begin
    QContrato_CPR.Open;
    QGarantidorSolidario.open;
    QContratoCpr_Doc.Open;
  end;
end;

procedure TFContrato_CPR.BtFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
     DMContrato_CPR.QContrato_CPRCOD_FILIAL.Value:=DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFContrato_CPR.BtAvalistaConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     DMContrato_CPR.QContrato_CPRCOD_AVALISTA.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFContrato_CPR.DSPrimarioStateChange(Sender: TObject);
begin
  inherited; 
  if DsPrimario.State in [dsInsert,dsEdit] then
  begin
    BtCadastroCons.Enabled := True;
    BtAvalistaCons.Enabled := True;
    BtProdutoCons.Enabled  := True;
    BtFilialCons.Enabled   := True;
    SBGarantidor.Enabled   := True;
    SBSolidario1.Enabled    := True;
  end
  else
  begin
    BtCadastroCons.Enabled := False;
    BtAvalistaCons.Enabled := False;
    BtProdutoCons.Enabled  := False;
    BtFilialCons.Enabled   := False;
    SBGarantidor.Enabled   := False;
    SBSolidario1.Enabled   := False; 
  end;
end;

procedure TFContrato_CPR.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FContratoCPRCons = nil then
     FContratoCPRCons := TFContratoCPRCons.Create(Application);
  if FContratoCPRCons.ShowModal = mrOk then
  begin
    with DMContrato_CPR do
    begin
      QContrato_CPR.Close;
      QContrato_CPR.SetVariable('PK',QContrato_CPRConsCOD_CONTRATO_CPR.Value);
      QContrato_CPR.Open;
      QGarantidorSolidario.Close;
      QGarantidorSolidario.SetVariable('CPR',QContrato_CPRConsCOD_CONTRATO_CPR.Value);
      QGarantidorSolidario.Open;
    end;
  end;
end;

procedure TFContrato_CPR.EmissocontratoCPR1Click(Sender: TObject);
var
   Path,campo : String;
   wSacas : Real;
   wCont : integer;
   x, y: array of string;

begin
  wCont := 0;
  if DMContrato_CPR.QContrato_CPRCOD_CONTRATO_CPR.value <> 0 then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(DMContrato_CPR.QContrato_CprCOD_FILIAL.Text),'AGRICOLA');
      Path:=ExtractFilePath(ParamStr(0))+'Contratos\';
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK',DMContrato_CPR.QContrato_CPRCOD_FILIAL.Value);
      DMFilial.QFilial.Open;
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK',DMContrato_CPR.QContrato_CPRCOD_CADASTRO.Value);
      DMCadastro.QCadastro.Open;
      DMProduto.QProduto.Close;
      DMProduto.QProduto.SetVariable('PK',DMContrato_CPR.QContrato_CPRCOD_PRODUTO.Value);
      DMProduto.QProduto.Open;
      DMProdutoAgricola.QProdutoAgricola.Close;
      DMProdutoAgricola.QProdutoAgricola.SetVariable('PK',DMContrato_CPR.QContrato_CPRCOD_PRODUTO.Value);
      DMProdutoAgricola.QProdutoAgricola.Open;

      // Cria objeto principal de controle
      WinWord := CreateOleObject('Word.Application');
      // Mostra o Word
      WinWord.Visible := true;
      // Pega uma interface para o objeto que manipula documentos
      Docs := WinWord.Documents;
      // Abre um Documento
      Doc := Docs.Open(Path+'ContratoCPR.Doc');
      wSacas := DMContrato_CPR.QContrato_CPRQT_QUANTIDADE.value / DMProduto.QProdutoNUM_EMBALAGEM.Value;
      campo:=FormatFloat('#,##0.00',DMContrato_CPR.QContrato_CPRVAL_PRECO.value);
      Doc.Content.Find.Execute(FindText := '%valor_total',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMContrato_CPR.QContrato_CPRPRECOTOTAL.value);
      Doc.Content.Find.Execute(FindText := '%preco_total',ReplaceWith := campo,Replace:=2);
      campo:=DMFilial.QFilialDESC_FILIAL.Value;
      Doc.Content.Find.Execute(FindText := '%desc_filial',ReplaceWith := campo,Replace:=2);
      campo:=DMFilial.QFilialNum_CGC.Value;
      Doc.Content.Find.Execute(FindText := '%cgc_filial',ReplaceWith := campo,Replace:=2);
      campo:=DMFilial.QFilialDESC_ENDERECO.Value;
      Doc.Content.Find.Execute(FindText := '%endereco_filial',ReplaceWith := campo,Replace:=2);
      campo:=DMFilial.QFilialDESC_CIDADE.Value;
      Doc.Content.Find.Execute(FindText := '%cidade_filial',ReplaceWith := campo,Replace:=2);
      campo:=DMFilial.QFilialCod_estado.Value;
      Doc.Content.Find.Execute(FindText := '%estado_filial',ReplaceWith := campo,Replace:=2);
      campo:=DMProduto.QProdutoDESC_PRODUTO.Value;
      Doc.Content.Find.Execute(FindText := '%desc_produto',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0',DMProduto.QProdutoNUM_EMBALAGEM.Value);
      Doc.Content.Find.Execute(FindText := '%embalagem',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNOME_CONJUGE.Value;
      Doc.Content.Find.Execute(FindText := '%nome_conjuge',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDESC_CPF_CONJUGE.Value;
      Doc.Content.Find.Execute(FindText := '%cpf_conjuge',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDESC_IDENTIDADE_CONJUGE.Value;
      Doc.Content.Find.Execute(FindText := '%rg_conjuge',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNOME.Value;
      Doc.Content.Find.Execute(FindText := '%nome_cadastro',ReplaceWith := campo,Replace:=2);
      campo:=DMOracle.FastSelect('DESC_ESTADO_CIVIL', 'TB_ESTADO_CIVIL',
          'COD_ESTADO_CIVIL = 0' + DMCadastro.QCadastroCOD_ESTADO_CIVIL.Text);
      Doc.Content.Find.Execute(FindText := '%estado_civil',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNUM_INSCRICAO.Value;
      Doc.Content.Find.Execute(FindText := '%rg_cadastro',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDESC_ORGAO_EMISSOR.Value;
      Doc.Content.Find.Execute(FindText := '%desc_orgao_emissor',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNUM_CGC_CPF.Value;
      Doc.Content.Find.Execute(FindText := '%cgc_cpf_cadastro',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDESC_ENDERECO.Value;
      Doc.Content.Find.Execute(FindText := '%endereco_cadastro',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDESC_CIDADE.Value;
      Doc.Content.Find.Execute(FindText := '%cidade_cadastro',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroCOD_ESTADO.value;
      Doc.Content.Find.Execute(FindText := '%uf_cadastro',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0',DMContrato_CPR.QContrato_CPRQT_QUANTIDADE.Value);
      Doc.Content.Find.Execute(FindText := '%quantidade',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0',DMContrato_CPR.QContrato_CPRQTDETOTAL.Value);
      Doc.Content.Find.Execute(FindText := '%qtde_total',ReplaceWith := campo,Replace:=2);
      campo:=Bib.extenso(DMContrato_CPR.QContrato_CPRQT_QUANTIDADE.Value,'KG');
      Doc.Content.Find.Execute(FindText := '%quant_extenso',ReplaceWith := campo,Replace:=2);
      campo:=Bib.extenso(Trunc(DMContrato_CPR.QContrato_CPRQT_QUANTIDADE.Value*1.6),'KG');
      Doc.Content.Find.Execute(FindText := '%quant_ext_total',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0',DMContrato_CPR.QContrato_CPRNUM_CONTRATO_CPR.Value);
      Doc.Content.Find.Execute(FindText := '%nr_contrato',ReplaceWith := campo,Replace:=2);
      //campo:=Bib.extenso(DMContrato_CPR.QContrato_CPRVAL_PRECO.value*1.6,'REAL');
      campo:=Bib.extenso(DMContrato_CPR.QContrato_CPRPRECOTOTAL.value,'REAL');
      Doc.Content.Find.Execute(FindText := '%extenso',ReplaceWith := campo,Replace:=2);
      campo:=DMFilial.QFilialDESC_INSCRICAO.Value;
      Doc.Content.Find.Execute(FindText := '%inscricao_filial',ReplaceWith := campo,Replace:=2);
      campo:=DateToStr(DMContrato_CPR.QContrato_CPRDT_VENCIMENTO.Value);
      Doc.Content.Find.Execute(FindText := '%dt_vencimento',ReplaceWith := campo,Replace:=2);
      campo:=FormatDateTime(' dd "de" MMMM "de" yyyy',DMContrato_CPR.QContrato_CPRDT_VENCIMENTO.Value);
      Doc.Content.Find.Execute(FindText := '%dt_vencto_extenso',ReplaceWith := campo,Replace:=2);
      campo:=(DMContrato_CPR.QContrato_CPRCOD_CADASTRO.Text);
      Doc.Content.Find.Execute(FindText := '%cod_cadastro',ReplaceWith := campo,Replace:=2);
      campo:=DateToStr(DMContrato_CPR.QContrato_CPRDT_EMISSAO.Value);
      Doc.Content.Find.Execute(FindText := '%dt_emissao',ReplaceWith := campo,Replace:=2);
      campo:=FormatDateTime(', dd "de" MMMM "de" yyyy',DMContrato_CPR.QContrato_CPRDT_EMISSAO.Value);
      Doc.Content.Find.Execute(FindText := '%dt_emis_extenso',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0',DMContrato_CPR.QContrato_CPRQT_AREA.Value);
      Doc.Content.Find.Execute(FindText := '%qt_area',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,#0',DMContrato_CPR.QContrato_CPRVAL_PRODUCAO.Value);
      Doc.Content.Find.Execute(FindText := '%val_producao',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato_CPR.QContrato_CPRNUM_MATRICULA.Value;
      Doc.Content.Find.Execute(FindText := '%matricula',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato_CPR.QContrato_CPRDESC_COMARCA.Value;
      Doc.Content.Find.Execute(FindText := '%comarca',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato_CPR.QContrato_CPRNUM_CADASTRO_INCRA.Value;
      Doc.Content.Find.Execute(FindText := '%num_incra',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato_CPR.QContrato_CPRDT_ANO_SAFRA.Value;
      Doc.Content.Find.Execute(FindText := '%ano_safra',ReplaceWith := campo,Replace:=2);
      campo:=FloatToStr(wSacas);
      Doc.Content.Find.Execute(FindText := '%qt_sacas',ReplaceWith := campo,Replace:=2);
      campo:=Bib.extenso(wSacas,'SACA');
      Doc.Content.Find.Execute(FindText := '%sacas_extenso',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_UMIDADE_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%max_umidade',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_IMPUREZA_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%max_impureza',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_AVARIADO_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%max_avariado',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_QUEBRADOS_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%max_quebra',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_ARDIDOS_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%max_ardido',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_PH_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%ph_minimo',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_VERDES_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%max_verdes',ReplaceWith := campo,Replace:=2);
      setLength(x, 10); //10 sql diferentes
      setLength(y, 10);
      if DMContrato_CPR.QContrato_CPRCOD_AVALISTA.Text <> '' Then
      begin
        x[0] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_AVALISTA.Value);
        x[1] := 'SELECT DESC_ENDERECO FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_AVALISTA.Value);
        x[2] := 'SELECT DESC_CIDADE FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_AVALISTA.Value);
        x[3] := 'SELECT COD_ESTADO FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_AVALISTA.Value);
        x[4] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_AVALISTA.Value);
        x[5] := 'SELECT NUM_INSCRICAO FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_AVALISTA.Value);
        x[6] := 'SELECT NOME_CONJUGE FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_AVALISTA.Value);
        x[7] := 'SELECT DESC_CPF_CONJUGE FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_AVALISTA.Value);
        x[8] := 'SELECT DESC_IDENTIDADE_CONJUGE FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_AVALISTA.Value);
        x[9] := 'SELECT DESC_ORGAO_EMISSOR FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_AVALISTA.Value);
        DMOracle.BuscaNomes(x, y);
      end;
      Doc.Content.Find.Execute(FindText := '%nome_avalista',ReplaceWith := Y[0],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%cpf_avalista',ReplaceWith := Y[4],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%endereco_avalista',ReplaceWith := Y[1],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%cidade_avalista',ReplaceWith := Y[2],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%uf_avalista',ReplaceWith := Y[3],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%avalista_rg',ReplaceWith := Y[5],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%conjuge_avalista',ReplaceWith := Y[6],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%conjuge_CPF_Avalista',ReplaceWith := Y[7],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%conjuge_rg_Avalista',ReplaceWith := Y[8],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%orgao_emissor_aval',ReplaceWith := Y[9],Replace:=2);
      //nota promissória
      campo:=DateToStr(DMContrato_CPR.QContrato_CPRDT_VENCIMENTO.Value);
      Doc.Content.Find.Execute(FindText := '%vencto_promis',ReplaceWith := campo,Replace:=2);
      campo:=copy(DMContrato_CPR.QContrato_CPRDESC_AREA.Value,1,200);
      Doc.Content.Find.Execute(FindText := '%desc_area',ReplaceWith := campo,Replace:=2);
      campo:=copy(DMContrato_CPR.QContrato_CPRDESC_AREA.Value,201,200);
      Doc.Content.Find.Execute(FindText := '%1desc_area',ReplaceWith := campo,Replace:=2);
      campo:=copy(DMContrato_CPR.QContrato_CPRDESC_AREA.Value,401,200);
      Doc.Content.Find.Execute(FindText := '%2desc_area',ReplaceWith := campo,Replace:=2);
      campo:=copy(DMContrato_CPR.QContrato_CPRDESC_AREA.Value,601,200);
      Doc.Content.Find.Execute(FindText := '%3desc_area',ReplaceWith := campo,Replace:=2);
      campo:=copy(DMContrato_CPR.QContrato_CPRDESC_AREA.Value,801,200);
      Doc.Content.Find.Execute(FindText := '%4desc_area',ReplaceWith := campo,Replace:=2);
      campo:=copy(DMContrato_CPR.QContrato_CPRDESC_AREA.Value,1001,200);
      Doc.Content.Find.Execute(FindText := '%5desc_area',ReplaceWith := campo,Replace:=2);
      campo:=copy(DMContrato_CPR.QContrato_CPRDESC_GARANTIA_PENHOR.Value,1,200);
      Doc.Content.Find.Execute(FindText := '%garantia_penhor',ReplaceWith := campo,Replace:=2);
      campo:=copy(DMContrato_CPR.QContrato_CPRDESC_GARANTIA_PENHOR.Value,201,200);
      Doc.Content.Find.Execute(FindText := '%1garantia_penhor',ReplaceWith := campo,Replace:=2);
      campo:=copy(DMContrato_CPR.QContrato_CPRDESC_GARANTIA_PENHOR.Value,401,200);
      Doc.Content.Find.Execute(FindText := '%2garantia_penhor',ReplaceWith := campo,Replace:=2);
      campo:=copy(DMContrato_CPR.QContrato_CPRDESC_GARANTIA_HIPOTECA.Value,1,200);
      Doc.Content.Find.Execute(FindText := '%garantia_hipoteca',ReplaceWith := campo,Replace:=2);
      campo:=copy(DMContrato_CPR.QContrato_CPRDESC_GARANTIA_HIPOTECA.Value,201,200);
      Doc.Content.Find.Execute(FindText := '%1garantia_hipoteca',ReplaceWith := campo,Replace:=2);
      campo:=copy(DMContrato_CPR.QContrato_CPRDESC_GARANTIA_HIPOTECA.Value,401,200);
      Doc.Content.Find.Execute(FindText := '%2garantia_hipoteca',ReplaceWith := campo,Replace:=2);

      //Interveniente Garantidor
      campo:=copy(DMContrato_CPR.QContrato_CPRDESC_INTERVENIENTE_GARANTIDOR.Value,1,200);
      Doc.Content.Find.Execute(FindText := '%interveniente_garantidor',ReplaceWith := campo,Replace:=2);
      campo:=copy(DMContrato_CPR.QContrato_CPRDESC_INTERVENIENTE_GARANTIDOR.Value,201,200);
      Doc.Content.Find.Execute(FindText := '%1interveniente_garantidor',ReplaceWith := campo,Replace:=2);
      campo:=copy(DMContrato_CPR.QContrato_CPRDESC_INTERVENIENTE_GARANTIDOR.Value,401,200);
      Doc.Content.Find.Execute(FindText := '%2interveniente_garantidor',ReplaceWith := campo,Replace:=2);
      setLength(x, 10); //10 sql diferentes
      setLength(y, 10);
      if DMContrato_CPR.QContrato_CPRCOD_INTERVENIENTE_GARANTIDOR.Text <> '' Then
      begin
        x[0] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_INTERVENIENTE_GARANTIDOR.Value);
        x[1] := 'SELECT DESC_ENDERECO FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_INTERVENIENTE_GARANTIDOR.Value);
        x[2] := 'SELECT DESC_CIDADE FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_INTERVENIENTE_GARANTIDOR.Value);
        x[3] := 'SELECT COD_ESTADO FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_INTERVENIENTE_GARANTIDOR.Value);
        x[4] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_INTERVENIENTE_GARANTIDOR.Value);
        x[5] := 'SELECT NUM_INSCRICAO FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_INTERVENIENTE_GARANTIDOR.Value);
        x[6] := 'SELECT NOME_CONJUGE FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_INTERVENIENTE_GARANTIDOR.Value);
        x[7] := 'SELECT DESC_CPF_CONJUGE FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_INTERVENIENTE_GARANTIDOR.Value);
        x[8] := 'SELECT DESC_IDENTIDADE_CONJUGE FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_INTERVENIENTE_GARANTIDOR.Value);
        x[9] := 'SELECT DESC_ORGAO_EMISSOR FROM TB_CADASTRO WHERE COD_CADASTRO = ' + FloatToStr(DMContrato_CPR.QContrato_CPRCOD_AVALISTA.Value);
        DMOracle.BuscaNomes(x, y);
      End;
      Doc.Content.Find.Execute(FindText := '%nome_garantidor',ReplaceWith := y[0],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%cpf_garantidor',ReplaceWith := y[4],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%endereco_garantidor',ReplaceWith := y[1],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%cidade_garantidor',ReplaceWith := y[2],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%uf_garantidor',ReplaceWith := y[3],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%rg_garantidor',ReplaceWith := y[5],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%conjuge_garantidor',ReplaceWith := y[6],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%cpf_conjuge_garantidor',ReplaceWith := y[7],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%rg_conjuge_garantidor',ReplaceWith := y[8],Replace:=2);
      Doc.Content.Find.Execute(FindText := '%orgao_emissor_garantidor',ReplaceWith := y[9],Replace:=2);

      DMContrato_CPR.QGarantidorSolidario.Close;
      DMContrato_CPR.QGarantidorSolidario.SetVariable('CPR',DMContrato_CPR.QContrato_CPRCOD_CONTRATO_CPR.Value);
      DMContrato_CPR.QGarantidorSolidario.SetVariable('PK',NULL);
      DMContrato_CPR.QGarantidorSolidario.Open;
      DMContrato_CPR.QGarantidorSolidario.First;
      While not DMContrato_CPR.QGarantidorSolidario.EOF do
      Begin
        inc(wCont);
        if wCont = 1 then
        Begin
          campo:=DMContrato_CPR.QGarantidorSolidariodesc_garantidor.Value;
          Doc.Content.Find.Execute(FindText := '%1solidario',ReplaceWith := campo,Replace:=2);
          campo:= DMOracle.BuscaNome('SELECT NOME_CONJUGE FROM TB_CADASTRO','COD_CADASTRO = ' + DMContrato_CPR.QGarantidorSolidarioCOD_CADASTRO.Text);
          Doc.Content.Find.Execute(FindText := '%1conjuge_solidario',ReplaceWith := campo,Replace:=2);
        end;
        if wCont = 2 then
        Begin
          campo:=DMContrato_CPR.QGarantidorSolidariodesc_garantidor.Value;
          Doc.Content.Find.Execute(FindText := '%2solidario',ReplaceWith := campo,Replace:=2);
          campo:= DMOracle.BuscaNome('SELECT NOME_CONJUGE FROM TB_CADASTRO','COD_CADASTRO = ' + DMContrato_CPR.QGarantidorSolidarioCOD_CADASTRO.Text);
          Doc.Content.Find.Execute(FindText := '%2conjuge_solidario',ReplaceWith := campo,Replace:=2);
        end;
        if wCont = 3 then
        Begin
          campo:=DMContrato_CPR.QGarantidorSolidariodesc_garantidor.Value;
          Doc.Content.Find.Execute(FindText := '%3solidario',ReplaceWith := campo,Replace:=2);
          campo:= DMOracle.BuscaNome('SELECT NOME_CONJUGE FROM TB_CADASTRO','COD_CADASTRO = ' + DMContrato_CPR.QGarantidorSolidarioCOD_CADASTRO.Text);
          Doc.Content.Find.Execute(FindText := '%3conjuge_solidario',ReplaceWith := campo,Replace:=2);
        end;
        if wCont = 4 then
        Begin
          campo:=DMContrato_CPR.QGarantidorSolidariodesc_garantidor.Value;
          Doc.Content.Find.Execute(FindText := '%4solidario',ReplaceWith := campo,Replace:=2);
          campo:= DMOracle.BuscaNome('SELECT NOME_CONJUGE FROM TB_CADASTRO','COD_CADASTRO = ' + DMContrato_CPR.QGarantidorSolidarioCOD_CADASTRO.Text);
          Doc.Content.Find.Execute(FindText := '%4conjuge_solidario',ReplaceWith := campo,Replace:=2);
        end;
        if wCont = 5 then
        Begin
          campo:=DMContrato_CPR.QGarantidorSolidariodesc_garantidor.Value;
          Doc.Content.Find.Execute(FindText := '%5solidario',ReplaceWith := campo,Replace:=2);
          campo:= DMOracle.BuscaNome('SELECT NOME_CONJUGE FROM TB_CADASTRO','COD_CADASTRO = ' + DMContrato_CPR.QGarantidorSolidarioCOD_CADASTRO.Text);
          Doc.Content.Find.Execute(FindText := '%5conjuge_solidario',ReplaceWith := campo,Replace:=2);
        end;
        if wCont = 6 then
        Begin
          campo:=DMContrato_CPR.QGarantidorSolidariodesc_garantidor.Value;
          Doc.Content.Find.Execute(FindText := '%6solidario',ReplaceWith := campo,Replace:=2);
          campo:= DMOracle.BuscaNome('SELECT NOME_CONJUGE FROM TB_CADASTRO','COD_CADASTRO = ' + DMContrato_CPR.QGarantidorSolidarioCOD_CADASTRO.Text);
          Doc.Content.Find.Execute(FindText := '%6conjuge_solidario',ReplaceWith := campo,Replace:=2);
        end;
      DMContrato_CPR.QGarantidorSolidario.Next;
      end;

      //DMContrato_CPR.QExibeGarantidor.Close;

      // Grava documento
      Doc.SaveAs(Path+'ContratoCPR1.Doc');
      // Imprime
      //Doc.PrintOut(false);
      // Fecha o Word
//      WinWord.Quit;
    end
   else
      MessageDlg('Primeiro selecione um CONTRATO para IMPRESSÃO',mtInformation,[mbOk],0);
end;

procedure TFContrato_CPR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMContrato_CPR do
  Begin
    QContrato_CPR.Close;
    QGarantidorSolidario.Close;
    QContratoCpr_Doc.Close;
  End;  
  Action := CaFree;
  FContrato_CPR := Nil;
end;

procedure TFContrato_CPR.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMContrato_CPR.QContrato_CprCOD_FILIAL.Text),'AGRICOLA');
  inherited;
  if DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.Commit;
end;

procedure TFContrato_CPR.DeclaraoBaixaCPR1Click(Sender: TObject);
var
Path,campo : String;
begin
  inherited;
   if FBaixa_CPR = nil then
      FBaixa_CPR := TFBaixa_CPR.Create(Application);
   if FBaixa_CPR.ShowModal = mrOK then
   begin
     if DMContrato_CPR.QContrato_CPRCOD_CONTRATO_CPR.value = 0 then
       Raise exception.Create('Primeiro selecione um CONTRATO para IMPRESSÃO');
     DmUsuario.Checar_Filial_Usuario( Trim(DMContrato_CPR.QContrato_CprCOD_FILIAL.Text),'AGRICOLA');
     Path:=ExtractFilePath(ParamStr(0))+'Contratos\';
     DMFilial.QFilial.Close;
     DMFilial.QFilial.SetVariable('PK',DMContrato_CPR.QContrato_CPRCOD_FILIAL.Value);
     DMFilial.QFilial.Open;
     DMCadastro.QCadastro.Close;
     DMCadastro.QCadastro.SetVariable('PK',DMContrato_CPR.QContrato_CPRCOD_CADASTRO.Value);
     DMCadastro.QCadastro.Open;
   // Cria objeto principal de controle
     WinWord := CreateOleObject('Word.Application');
   // Mostra o Word
     WinWord.Visible := true;
   // Pega uma interface para o objeto que manipula documentos
     Docs := WinWord.Documents;
   // Abre um Documento
     Doc := Docs.Open(Path+'DECLARACAO-BAIXA-CPR.Doc');
     campo:=DMFilial.QFilialDESC_FILIAL.Value;
     Doc.Content.Find.Execute(FindText := '%desc_filial',ReplaceWith := campo,Replace:=2);
     campo:=DMFilial.QFilialDESC_CIDADE.Value;
     Doc.Content.Find.Execute(FindText := '%cidade_filial',ReplaceWith := campo,Replace:=2);
     campo:=FormatDateTime(', dd "de" MMMM "de" yyyy',DMContrato_CPR.QContrato_CPRDT_EMISSAO.Value);
     Doc.Content.Find.Execute(FindText := '%dt_emis_extenso',ReplaceWith := campo,Replace:=2);
     campo:=DMContrato_CPR.QContrato_CPRDESC_COMARCA.Value;
     Doc.Content.Find.Execute(FindText := '%comarca',ReplaceWith := campo,Replace:=2);
     campo:=DMCadastro.QCadastroNOME.Value;
     Doc.Content.Find.Execute(FindText := '%nome_cadastro',ReplaceWith := campo,Replace:=2);
     campo:=DMCadastro.QCadastroNUM_CGC_CPF.Value;
     Doc.Content.Find.Execute(FindText := '%cgc_cpf_cadastro',ReplaceWith := campo,Replace:=2);
     campo:=DMCadastro.QCadastroCOD_ESTADO.value;
     Doc.Content.Find.Execute(FindText := '%uf_cadastro',ReplaceWith := campo,Replace:=2);
     campo:=DateToStr(DMContrato_CPR.QContrato_CPRDT_EMISSAO.Value);
     Doc.Content.Find.Execute(FindText := '%dt_emissao',ReplaceWith := campo,Replace:=2);
     campo:=FormatFloat('#,##0',DMContrato_CPR.QContrato_CPRNUM_CONTRATO_CPR.Value);
     Doc.Content.Find.Execute(FindText := '%nr_contrato',ReplaceWith := campo,Replace:=2);
     campo:=DMContrato_CPR.QContrato_CPRNUM_REGISTRO_IMOVEL.Value;
     Doc.Content.Find.Execute(FindText := '%nr_registro',ReplaceWith := campo,Replace:=2);
     campo:=DMContrato_CPR.QContrato_CPRNUM_LIVRO_REGISTRO.Value;
     Doc.Content.Find.Execute(FindText := '%nr_livro',ReplaceWith := campo,Replace:=2);
     campo:=DateToStr(DMContrato_CPR.QContrato_CPRDT_REGISTRO.Value);
     Doc.Content.Find.Execute(FindText := '%dt_registro',ReplaceWith := campo,Replace:=2);
     Doc.SaveAs(Path+'DECLARACAO-BAIXA-CPR1.Doc');
     DMCOntrato_CPR.QContrato_CPR.Close;
   end;
end;

procedure TFContrato_CPR.SBAlterarClick(Sender: TObject);
begin
  If DMContrato_CPR.QContrato_CPRIND_SITUACAO.Value = 'FECHADO' Then
    Raise Exception.Create('Este Contrato não pode ser alterado ele já foi Fechado');
  inherited;

end;

procedure TFContrato_CPR.RelaodeContratos1Click(Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil then
    FContratoParam:= TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[18].TabVisible:=True;
  if FContratoParam.ShowModal =  mrOk then
    begin
      with DMContrato_CPR do
        begin
          QRContratoCPR.Close;
          if Trim(FContratoParam.ME18Filial.text) <>'' then
            QRContratoCPR.SetVariable('FILIAL',FContratoParam.ME18Filial.text)
          else
            QRContratoCPR.SetVariable('FILIAL',Null);

          if Trim(FContratoParam.ME18Produto.text) <>'' then
            QRContratoCPR.SetVariable('PRODUTO',FContratoParam.ME18Produto.text)
          else
            QRContratoCPR.SetVariable('PRODUTO',Null);

          if Trim(FContratoParam.ME18Cadastro.text) <>'' then
            QRContratoCPR.SetVariable('CADASTRO',FContratoParam.ME18Cadastro.text)
          else
            QRContratoCPR.SetVariable('CADASTRO',Null);

          if Trim(FContratoParam.ME18DtInicial.text) <>'' then
            QRContratoCPR.SetVariable('DT_INICIAL',StrToDate(FContratoParam.ME18DtInicial.text))
          else
            QRContratoCPR.SetVariable('DT_INICIAL',Null);

          if Trim(FContratoParam.ME18DtFinal.text) <>'' then
            QRContratoCPR.SetVariable('DT_FINAL',StrToDate(FContratoParam.ME18DtFinal.text))
          else
            QRContratoCPR.SetVariable('DT_FINAL',Null);

           if Trim(FContratoParam.ME18DtInicialE.text) <>'' then
            QRContratoCPR.SetVariable('DT_INICIAL_E',StrToDate(FContratoParam.ME18DtInicialE.text))
          else
            QRContratoCPR.SetVariable('DT_INICIAL_E',Null);

          if Trim(FContratoParam.ME18DtFinalE.text) <>'' then
            QRContratoCPR.SetVariable('DT_FINAL_E',StrToDate(FContratoParam.ME18DtFinalE.text))
          else
            QRContratoCPR.SetVariable('DT_FINAL_E',Null);

          case FContratoParam.RG18Situacao.ItemIndex of
            0:QRContratoCPR.SetVariable('SITUACAO','ABERTO');
            1:QRContratoCPR.SetVariable('SITUACAO','FECHADO');
            2:QRContratoCPR.SetVariable('SITUACAO',NULL);
          end;

          QRContratoCPR.Open;
          If FRContratoCPR = Nil then
            FRContratoCPR := TFRContratoCPR.Create(Application);
          FRContratoCPR.QrlFilial.Caption := 'Filial: '+FContratoParam.ME18Filial.Text+' '+FcontratoParam.Ed18Filial.Text;
          FRContratoCPR.QrlProduto.Caption := 'Produto: '+FContratoParam.ME18Produto.Text+' '+FcontratoParam.Ed18Produto.Text;
          FRContratoCPR.QrlCadastro.Caption := 'Cadastro: '+FContratoParam.ME18Cadastro.Text+' '+FcontratoParam.Ed18Cadastro.Text;
          FRContratoCPR.QrlPeriodo.Caption := 'Vencimento: '+FContratoParam.ME18DtInicial.Text+' até '+FcontratoParam.ME18DtFinal.Text
                                              +'Emissão: '+FContratoParam.ME18DtInicialE.Text+' até '+FcontratoParam.ME18DtFinalE.Text
                                              +' Situação: ' +FContratoParam.RG18Situacao.items[FContratoParam.RG18Situacao.itemindex];
          If FContratoParam.RGPreview.ItemIndex = 0 then
            FRContratoCPR.QRPrimario.Preview
          else
            FRContratoCPR.QRPrimario.Print;
          QRContratoCPR.Close;
        end;
    end; 
end;

procedure TFContrato_CPR.SBSolidario1Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     DMContrato_CPR.QGarantidorSolidarioCOD_CADASTRO.Value:=DMCadastro.QCadastroConsCod_cadastro.Value;
end;

procedure TFContrato_CPR.SBGarantidorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     DMContrato_CPR.QContrato_CPRCOD_INTERVENIENTE_GARANTIDOR.Value:=DMCadastro.QCadastroConsCod_cadastro.Value;
end;

procedure TFContrato_CPR.GerarContasaPagar1Click(Sender: TObject);
begin
  inherited;
  if DMContrato_CPR.QContrato_CPRCOD_CONTRATO_CPR.Value <> 0 then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(DMContrato_CPR.QContrato_CPRCOD_FILIAL.Text),'AGRICOLA');
      If DMContrato_CPR.QContrato_CPRInd_CP.Value=0 then
        begin
          If not(DMOracle.DBcemapa.InTransaction) then
            DMOracle.DBCemapa.StartTransaction;
          if FContrato_CP = Nil then
            FContrato_CP := TFContrato_CP.Create(Application);
          If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
           Begin
             FContrato_Cp.MeCodFinalidade.Text := '39';
             FContrato_Cp.MeCodDepartamento.Text := '5';
           End;
          FContrato_CP.pTipo:='CPR';
          FContrato_CP.ShowModal;
          If DMOracle.DBcemapa.InTransaction then
            begin
              DMOracle.DBcemapa.Rollback;
              ShowMessage('Atenção! Este Contrato não gerou um Contas a Pagar.');
            end;
        end
      else
        ShowMessage('Erro! Este Contrato já gerou um Contas a Pagar.');
    end
  else
    ShowMessage('Erro! Contrato em branco, Selecione um contrato.');

end;

procedure TFContrato_CPR.VoltaGeraoContasaPagar1Click(Sender: TObject);
begin
  inherited;
  if DMContrato_CPR.QContrato_CPRInd_CP.Value<>0 then
    begin
        DmUsuario.Checar_Filial_Usuario( Trim(DMContrato_CPR.QContrato_CPRCOD_FILIAL.Text),'AGRICOLA');
        DMOracle.DBCemapa.StartTransaction;
        Try
          with DMContrato_CPR do
            begin
              QContasPagar.Close;
              QContasPagar.Open;
              QContasPagarMov.Close;
              QContasPagarMov.Open;
              QContrato_CPR.Edit;
              QContrato_CPRInd_CP.Value:=0;
              QCOntrato_CPR.Post;
              While not QContasPagar.Eof do
                Begin
                  If QContasPagarMovInd_Tipo_Movimento.Value <> '' Then
                    Begin
                      If (QContasPagarMovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
                        Raise Exception.Create('Conta a Pagar com baixas!')
                      Else
                        QContasPagarMov.Delete;
                    End;
                  QContasPagar.Delete;
                End;
              DMOracle.DBCemapa.Commit;
           end;
        Except
          DMOracle.DBCemapa.Rollback;
          ShowMessage('Não foi possivel voltar Contas a Pagar!');
          Raise;
        End;
    end;

end;

procedure TFContrato_CPR.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  If OpenDialog.Execute Then
     MeArquivo.Text := OpenDialog.FileName;

end;

procedure TFContrato_CPR.BitBtn5Click(Sender: TObject);
var
  Stream : TStream;
  FileStream : TFileStream;
  wNomeArquivo : String;
  wPosicaoBarra : Integer;
begin
  inherited;
  DMContrato_CPR.QContratoCpr_Doc.Insert;
  Stream := DMContrato_CPR.QContratoCpr_Doc.CreateBlobStream(DMContrato_CPR.QContratoCpr_DocARQUIVO, bmWrite);
  try
    Stream.Seek(0, soFromBeginning);
    FileStream := TFileStream.Create(MeArquivo.Text, fmOpenRead or fmShareDenyWrite);
    try
      Stream.CopyFrom(FileStream, FileStream.Size);
    finally
      FileStream.Free;
    end;
    wNomeArquivo := MeArquivo.Text;
    wPosicaoBarra := Pos('\', wNomeArquivo);
    while (wPosicaoBarra > 0) do begin
      wNomeArquivo := Copy(wNomeArquivo, (wPosicaoBarra+1), Length(wNomeArquivo));
      wPosicaoBarra := Pos('\', wNomeArquivo);
    end;
    DMContrato_CPR.QContratoCpr_DocNOME_ARQUIVO.AsString := wNomeArquivo;
    DMContrato_CPR.QContratoCpr_DocDESCRICAO.AsString := MeArquivo.Text;
    DMContrato_CPR.QContratoCpr_DocDT_INCLUSAO.AsDateTime := Now;
    DMContrato_CPR.QContratoCpr_DocCOD_contrato_Cpr.Value := DMContrato_CPR.QContrato_CprCOD_contrato_Cpr.Value;

    DMContrato_CPR.QContratoCpr_Doc.Post;
    MessageDlg('Arquivo inserido com sucesso' ,
      MtError, [mbOK], 0);
  finally
    Stream.Free;
  end;


end;

procedure TFContrato_CPR.BitBtn3Click(Sender: TObject);
var
  Stream : TStream;
  FileStream : TFileStream;
  PastaTemp : String;
  NomeArquivo : String;
begin
  inherited;
  PastaTemp := GetEnvironmentVariable('TEMP');
  if (PastaTemp = '') then begin
    MessageDlg('É preciso definir a variável TEMP, para armazenamento de arquivos temporários.' ,
      mtError, [mbOK], 0);
    Abort;
  end;
  FileStream.Free;
  Stream.Free;
  NomeArquivo := PastaTemp + '\' + DsContratoCpr_Doc.DataSet.FieldByName('NOME_ARQUIVO').AsString;
  Stream := DsContratoCpr_Doc.DataSet.CreateBlobStream(DsContratoCpr_Doc.DataSet.FieldByName('ARQUIVO'), bmRead);
  try
    Stream.Seek(0, soFromBeginning);
    FileStream := TFileStream.Create(NomeArquivo, fmCreate);
    try
      FileStream.CopyFrom(Stream, Stream.Size);
    finally
      FileStream.Free;
    end;
    If FPDFViewer = Nil Then
       FPDFViewer := TFPDFViewer.Create(Self);
    FPDFViewer.Caption := 'Visualizando arquivo ' + NomeArquivo;
    FPDFViewer.Pdf1.src := NomeArquivo;
    FPDFViewer.ShowModal;
//    FPDFViewer := Nil;
  finally
    Stream.Free;
  end;

end;

procedure TFContrato_CPR.BitBtn4Click(Sender: TObject);
begin
  inherited;
  DMContrato_CPR.QContratoCpr_Doc.Delete;

end;

procedure TFContrato_CPR.RelaodeNotasporContrato1Click(Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil then
    FContratoParam:= TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[24].TabVisible:=True;

  if FContratoParam.ShowModal =  mrOk then
  begin
    with FContratoParam, DMContrato_CPR do
    begin
       QNotasContrato.Close;
       if (trim(FMFilial25.MeFilial.Text) = '') then
         raise Exception.Create('Obrigatório informar a Filial')
       else
         QNotasContrato.SetVariable('FILIAL', trim(FMFilial25.MeFilial.Text));

       if (trim(MeCodContratoCpr25.Text) = '') then
         QNotasContrato.SetVariable('COD_CONTRATO_CPR', Null)
       else
          QNotasContrato.SetVariable('COD_CONTRATO_CPR', trim(MeCodContratoCpr25.Text));

       case RgSituacaoContratoCpr25.ItemIndex of
          0 : QNotasContrato.SetVariable('SITUACAO', 'ABERTO');
          1 : QNotasContrato.SetVariable('SITUACAO', 'FECHADO');
          2 : QNotasContrato.SetVariable('SITUACAO', 'NÃO CUMPRIDO');
          3 : QNotasContrato.SetVariable('SITUACAO', Null);
       end;

       QNotasContrato.SetVariable('MOSTRA_FRETE', Cb25SomaFreteCpr.Checked);

       if (trim(Me25DataIniEmi.Text) <> '') then
         QNotasContrato.SetVariable('DT_EMI_I', StrToDate(trim(Me25DataIniEmi.Text)))
       else
         QNotasContrato.SetVariable('DT_EMI_I', Null);

       if (trim(Me25DataFinEmi.Text) <> '') then
         QNotasContrato.SetVariable('DT_EMI_F', StrToDate(trim(Me25DataFinEmi.Text)))
       else
         QNotasContrato.SetVariable('DT_EMI_F', Null);

       if (trim(Me25DataIniRec.Text) <> '') then
         QNotasContrato.SetVariable('DT_REC_I', StrToDate(trim(Me25DataIniRec.Text)))
       else
         QNotasContrato.SetVariable('DT_REC_I', Null);

       if (trim(Me25DataFinRec.Text) <> '') then
         QNotasContrato.SetVariable('DT_REC_F', StrToDate(trim(Me25DataFinRec.Text)))
       else
         QNotasContrato.SetVariable('DT_REC_F', Null);

       QNotasContrato.Open;
       QNotasContratoItens.Open;

       If FRNotasCPR_Relacao = Nil then
         FRNotasCPR_Relacao := TFRNotasCPR_Relacao.Create(Application);

       FRNotasCPR_Relacao.QrlFilial.Caption := 'Filial: ' + FContratoParam.FmFilial25.MeFilial.Text + ' '
                                                          + FContratoParam.FmFilial25.EdFilial.Text;
       FRNotasCPR_Relacao.QrlPeriodo.Caption := 'Emissão: ' + Me25DataIniEmi.Text + ' até ' + Me25DataFinEmi.Text
                                              +'Recebimento: ' + FContratoParam.Me25DataIniRec.Text + ' até ' + FcontratoParam.Me25DataFinRec.Text;

       FRNotasCPR_Relacao.QRSubDetail1.Enabled := FContratoParam.Cb25ItensNota.Checked;

       If FContratoParam.RGPreview.ItemIndex = 0 then
         FRNotasCPR_Relacao.QRPrimario.Preview
       else
         FRNotasCPR_Relacao.QRPrimario.Print;

       QNotasContrato.Close;

    end;                         

  end;

end;

procedure TFContrato_CPR.DBEdit24Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit24.Text);
end;

end.
