unit UContasReceberBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, ComCtrls, Db,
  DBTables, UBiblioteca, DBDirceu, ActnList, OracleData, ImgList,Variants,
  maskUtils, Types, StrUtils, UFmDepartamento, UFmContaCorrente, Printers, OraTeste;


type
  TFContasReceberBaixa = class(TForm)
    PCBaixa: TPageControl;
    TS0Localiza: TTabSheet;
    GroupBox1: TGroupBox;
    SBProcura: TSpeedButton;
    Fornecedor: TLabel;
    DBGrid1: TDBGrid;
    METexto: TMaskEdit;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    MEDataVencInicial: TMaskEdit;
    MEDataVencFinal: TMaskEdit;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    MEDataEmissaoInicial: TMaskEdit;
    MEDataEmissaoFinal: TMaskEdit;
    CBMostraBaixaTotal: TCheckBox;
    TS1Baixa: TTabSheet;
    DBText1: TDBText;
    DBText2: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    DBText3: TDBText;
    Label9: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    Label10: TLabel;
    Label11: TLabel;
    GroupBox2: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    SBBaixa: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    SBConsContaCorrente: TSpeedButton;
    MEDataBaixa: TMaskEdit;
    MEValorBaixa: TMaskEdit;
    MEValorDesconto: TMaskEdit;
    MEValorJuro: TMaskEdit;
    MEObservacao: TMaskEdit;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    RGFormaPagto: TRadioGroup;
    MECodContaCorrente: TMaskEdit;
    MENumCheque: TMaskEdit;
    MEBanco: TMaskEdit;
    SpeedButton1: TSpeedButton;
    DBText6: TDBText;
    Label12: TLabel;
    Label13: TLabel;
    DBText7: TDBText;
    MECodCliente: TMaskEdit;
    Label14: TLabel;
    Label15: TLabel;
    MeVariacaoPos: TMaskEdit;
    Label16: TLabel;
    MeVariacaoNeg: TMaskEdit;
    MECodFilial: TMaskEdit;
    Label17: TLabel;
    SpeedButton8: TSpeedButton;
    Label18: TLabel;
    MeNumTitulo: TMaskEdit;
    Label19: TLabel;
    MeCodNota: TMaskEdit;
    SBNotaEntradaCons: TSpeedButton;
    Label20: TLabel;
    MeNossoNumero: TMaskEdit;
    Label21: TLabel;
    MeValor: TMaskEdit;
    ChDevolucao: TCheckBox;
    Label22: TLabel;
    MeDevolucao: TMaskEdit;
    Label160: TLabel;
    Sb1Finalidade: TSpeedButton;
    MeFinalidade: TMaskEdit;
    MeHistoricoDesconto: TMaskEdit;
    LblHistoricoDesconto: TLabel;
    SbHistoricoDesconto: TSpeedButton;
    MeContrato: TMaskEdit;
    Label23: TLabel;
    DBText9: TDBText;
    Label27: TLabel;
    Label28: TLabel;
    MeTotal: TMaskEdit;
    DBDirceu1: TDBDirceu;
    Label29: TLabel;
    MeDtBaixa: TMaskEdit;
    MeAtualizado: TMaskEdit;
    TsBaixaLote: TTabSheet;
    SB2Baixa: TBitBtn;
    RG2FormaPagto: TRadioGroup;
    ME2Banco: TMaskEdit;
    ME2CodContaCorrente: TMaskEdit;
    ME2NumCheque: TMaskEdit;
    SB2ConsContaCorrente: TSpeedButton;
    ME2DataBaixa: TMaskEdit;
    Label30: TLabel;
    Label31: TLabel;
    MeBanco_Baixa: TMaskEdit;
    SbBancoCons: TSpeedButton;
    CbOrdem: TComboBox;
    Label32: TLabel;
    Label33: TLabel;
    AcConsultaCadastro: TActionList;
    AcCadastro: TAction;
    AcVoltaBaixa: TAction;
    AcPosicionCadastro: TAction;
    SbProcuraNota: TBitBtn;
    Label34: TLabel;
    SbAlteraObs: TBitBtn;
    ChTroca: TCheckBox;
    MECodContaReceber: TMaskEdit;
    Label35: TLabel;
    Label36: TLabel;
    MeBaixaJuro: TMaskEdit;
    CbCalculoJuros: TCheckBox;
    MECodAdiantamento: TMaskEdit;
    SBAdiantamento: TSpeedButton;
    MEAdiantamento: TMaskEdit;
    Label38: TLabel;
    DSContasReceberBaixa: TDataSource;
    DBGrid3: TDBGrid;
    ImageList1: TImageList;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    MeSemJuros: TMaskEdit;
    MeComJuros: TMaskEdit;
    DsVariacao: TDataSource;
    Label37: TLabel;
    DBEdit1: TDBEdit;
    Label39: TLabel;
    DBEdit2: TDBEdit;
    Label40: TLabel;
    DBEdit3: TDBEdit;
    Label41: TLabel;
    MEValorCheque: TMaskEdit;
    SBHistoricoCheque: TSpeedButton;
    MEHistoricoCheque: TMaskEdit;
    EdHistoricoCheque: TEdit;
    Label42: TLabel;
    FmDepartamento1: TFmDepartamento;
    Label43: TLabel;
    MeValorOutros: TMaskEdit;
    Label44: TLabel;
    MePercDesconto: TMaskEdit;
    TsReparcelamento: TTabSheet;
    DBGrid4: TDBGrid;
    Label45: TLabel;
    MeSemJurosReparcelamento: TMaskEdit;
    Label46: TLabel;
    MeComJurosReparcelamento: TMaskEdit;
    MeFinalidadeReparcelamento: TMaskEdit;
    Label47: TLabel;
    SpeedButton5: TSpeedButton;
    Label48: TLabel;
    MeNrParcelas: TMaskEdit;
    Label49: TLabel;
    MeVenctoReparcelamento: TMaskEdit;
    BtReparcelar: TBitBtn;
    BtNotaPromissoria: TBitBtn;
    Label51: TLabel;
    MeValPrimeiraParcela: TMaskEdit;
    MEINCC: TMaskEdit;
    ActionList1: TActionList;
    Action1: TAction;
    MeTotal2: TMaskEdit;
    MeAtualizado2: TMaskEdit;
    LbTotal2: TLabel;
    FmContaCorrente3: TFmContaCorrente;
    RGPrazoVencimento: TRadioGroup;
    FmDepartamento2: TFmDepartamento;
    FmDepartamento3: TFmDepartamento;
    Label50: TLabel;
    MeDescTipoDoc: TMaskEdit;
    RgBandeira: TRadioGroup;
    RgBandeira1: TRadioGroup;
    procedure SBProcuraClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PCBaixaChange(Sender: TObject);
    procedure PCBaixaChanging(Sender: TObject; var AllowChange: Boolean);
    procedure CBMostraBaixaTotalClick(Sender: TObject);
    procedure RGFormaPagtoClick(Sender: TObject);
    procedure SBConsContaCorrenteClick(Sender: TObject);
    procedure SBBaixaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SBNotaEntradaConsClick(Sender: TObject);
    procedure MECodClienteExit(Sender: TObject);
    procedure MeValorKeyPress(Sender: TObject; var Key: Char);
    procedure Sb1FinalidadeClick(Sender: TObject);
    procedure SbHistoricoDescontoClick(Sender: TObject);
    procedure MECodClienteChange(Sender: TObject);
    procedure RG2FormaPagtoClick(Sender: TObject);
    procedure SB2ConsContaCorrenteClick(Sender: TObject);
    procedure SB2BaixaClick(Sender: TObject);
    procedure TsBaixaLoteEnter(Sender: TObject);
    procedure SbBancoConsClick(Sender: TObject);
    procedure MEDataVencFinalExit(Sender: TObject);
    procedure AcCadastroExecute(Sender: TObject);
    procedure AcPosicionCadastroExecute(Sender: TObject);
    procedure SbProcuraNotaClick(Sender: TObject);
    procedure SbAlteraObsClick(Sender: TObject);
    procedure SBAdiantamentoClick(Sender: TObject);
    procedure MECodAdiantamentoExit(Sender: TObject);
    procedure MeDtBaixaExit(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SBHistoricoChequeClick(Sender: TObject);
    procedure MEHistoricoChequeExit(Sender: TObject);
    procedure CbCalculoJurosClick(Sender: TObject);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BtReparcelarClick(Sender: TObject);
    procedure BtNotaPromissoriaClick(Sender: TObject);
    procedure MEINCCExit(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FmDepartamento1BtDepartamentoClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FmDepartamento2BtDepartamentoClick(Sender: TObject);
    procedure FmDepartamento3BtDepartamentoClick(Sender: TObject);
    procedure DBGrid3ColExit(Sender: TObject);
    procedure DBGrid3ColEnter(Sender: TObject);
    procedure MeFinalidadeReparcelamentoExit(Sender: TObject);

  private
    { Private declarations }
    wCodNotaCab: integer; // Utilizado pela UDevolucaoTroca
    iWTitulo: Integer; //para gerar o boleto via api
    FValDescAdiantamento: Real;
    FCampoAnterior: String;
    procedure EmiteReciboLote(logo:String; wCodFilial : Integer);
    procedure EmiteReciboLoteTermica(wCodFilial : Integer);
    procedure AddDadosReciboLote(nomeCliente: String;
                                 numDuplicata, numParcela: integer;
                                 valPrincipal, valJuros, valPrincipalRecebido, valJurosRecebido, valDesconto, valRecebido, valPendente: double;
                                 dt_vencimento : TDateTime;
                                 cod_filial,cod_cadastro : integer);
    Procedure Atualiza_Baixa_Lote(wMarcado_SN : String);
    procedure Buscar;
    Procedure EmiteRecibo_Termica(pBaixaLote : Boolean);
    Procedure GeraBoletoApi;
    procedure CalculaDescontoPorDia;
  public
    { Public declarations }
    property pCodNotaCab: integer read wCodNotaCab write wCodNotaCab;
  end;

function Bematech_FI_AbreRecebimentoNaoFiscalMFD( cCPF: String; cNomeCliente : String;
      cEnderecoCliente : String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaRecebimentoNaoFiscalMFD( cIndice: String; cValor: String):
 Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_IniciaFechamentoRecebimentoNaoFiscalMFD( cAcresDesc: String;
  cTipoAcresDesc: String; cValorAcres: String;cValorDesc: String):
 Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaRecebimentoNaoFiscalMFD( cMsgPromocional: String ):
  Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NomeiaTotalizadorNaoSujeitoIcms( Indice: Integer; Totalizador: String ): Integer; StdCall; External 'BEMAFI32.DLL';


var
  FContasReceberBaixa: TFContasReceberBaixa;
  wSomaSelecionados,wSomaJuros : real;  //utilizado para colocar o total na tela
  wSelecionaTodos : boolean;
  wTb_Conta_Receber_Cab : array of Integer;
  pVal_Desconto,pVal_Juros,pVal_Pago : Real; // estes campos são utilizados para emissao de recibo na impressora térmica - Cesar (coloquei para não passar parametros na procedure)
implementation

uses UOracle_cl, UBancoAgencia_cl, UCaixa_cl,
  UContaCorrenteCons, UUsuario_cl, UPlanilha_cl, UContasReceberJuro,
  UFilial_cl, UEmiteRecibo, UCadastroCons, UCadastro_cl, UParamSistema_cl,
  UFilialCons, UNotaEntradaConsulta, UFinalidadeCons, UFinalidade_cl,
  UHistoricoCons, UHistorico_cl,URecibo_Dos, UBancosCons, UNotaSaida_cl,
  UNotaItensCons, UContasReceberVoltaBaixa, URReciboLote,
  UContasReceber_Rel_cl, USequencia_cl, UAdiantamentoCons,
  UAdiantamento_cl, UContasReceber_cl, UCarneImpressao, UPromissoria,
  UCaixaLanc_Cont, UImpressoraFiscal, UFRContasReceber_Duplicata_Retifoz, UBibContasReceber,
  URReciboLoteTermica,
  // API DE BOLETOS HÍBRIDOS
  BoletoAPI.BoletoFactory,
  BoletoApi.Interfaces, DateUtils, Math;

{$R *.DFM}

procedure TFContasReceberBaixa.SBProcuraClick(Sender: TObject);
begin
  Buscar;
end;

procedure TFContasReceberBaixa.Buscar;
var wdata_teste:TDate;
    wValor_Total,wValor_Atualizado : Real;
    li : TListItem;
    i : integer;
    sqlBaixa: TStringList;
begin
    DmUsuario.Checar_Filial_Usuario( Trim(MECodFilial.Text),'CONTAS A RECEBER');
    With DMContasReceber do
      Begin
        QContasReceberBaixa.Close;
        QContasReceberBaixa.SQL.Clear;
        QContasReceberBaixaLote.SQL.Clear;
        sqlBaixa := TStringList.Create;
        sqlBaixa.Clear;
        sqlBaixa.Add('SELECT TB_CADASTRO."NOME" ,TB_CONTA_RECEBER_CAB."COD_CONTA_RECEBER_CAB" , TB_CONTA_RECEBER_CAB."COD_ORDEM_COMPRA_CAB" ,TB_CONTA_RECEBER_CAB."COD_FINALIDADE" ,');
        sqlBaixa.Add('TB_CONTA_RECEBER_CAB."COD_BANCO_AGENCIA" ,TB_CONTA_RECEBER_CAB."COD_CADASTRO" , TB_CONTA_RECEBER_CAB."COD_FILIAL" , TB_FILIAL."DESC_FILIAL" ,');
        sqlBaixa.Add('TB_CONTA_RECEBER_CAB."COD_DEPARTAMENTO" ,TB_CONTA_RECEBER_CAB."NUM_TITULO" ,TB_CONTA_RECEBER_CAB."NUM_PARCELA" ,');
        sqlBaixa.Add('TB_CONTA_RECEBER_CAB."DESC_TIPO_DOCUMENTO" ,TB_CONTA_RECEBER_CAB."DT_MOVIMENTO" ,TB_CONTA_RECEBER_CAB."DT_BAIXA" ,');
        sqlBaixa.Add('TB_CONTA_RECEBER_CAB."DT_VENCIMENTO" ,TB_CONTA_RECEBER_CAB."DT_CAPITALIZACAO" ,');
        If DMParamsistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' Then
           sqlBaixa.Add('Trunc(TB_CONTA_RECEBER_CAB.DT_MOVIMENTO) AS DT_EMISSAO,')
        Else
           sqlBaixa.Add('TB_CONTA_RECEBER_CAB."DT_EMISSAO" AS DT_EMISSAO,');
        sqlBaixa.Add('TB_CONTA_RECEBER_CAB."DT_CAPITALIZACAO_MOEDA" ,TB_CONTA_RECEBER_CAB."VAL_TITULO" ,TB_CONTA_RECEBER_CAB."COD_NOTA_CAB" ,');
        sqlBaixa.Add('TB_CONTA_RECEBER_CAB."DESC_OBSERVACAO" ,TB_CONTA_RECEBER_CAB."IND_ACEITE" ,TB_CONTA_RECEBER_CAB."IND_SITUACAO" , TB_CONTA_RECEBER_CAB.IND_ENVIADO_BANCO,');
        sqlBaixa.Add('TB_CONTA_RECEBER_CAB."VAL_ORIGINAL",TB_CONTA_RECEBER_CAB."VAL_JUROS", TB_CLASS_CADASTRO.DESC_CLASSIFICACAO,TB_FINALIDADE.PERC_JURO_MORA,');
        sqlBaixa.Add('(SELECT COUNT(*) FROM TB_CONTA_RECEBER_CAB sub WHERE sub.NUM_TITULO = Tb_conta_receber_cab.NUM_TITULO AND sub.COD_CADASTRO = Tb_conta_receber_cab.COD_CADASTRO) AS QTD_PARCELA, ');
        sqlBaixa.Add('TB_FINALIDADE.NUM_TIPO_JURO,TB_FINALIDADE.PERC_TAXA,TB_FINALIDADE.COD_MOEDA,TB_FINALIDADE.COD_HISTORICO_DESC,TB_FINALIDADE.DESC_FINALIDADE, ');
        sqlBaixa.Add('TB_FINALIDADE.NUM_DIAS_CARENCIA,TB_FINALIDADE.IND_PERMITE_DESCONTO_BAIXA, TB_CADASTRO.DESC_ENDERECO, TB_CADASTRO.DESC_CIDADE, TB_CONTA_RECEBER_CAB.PERC_DESC_ADIANTAMENTO, ');
        sqlBaixa.Add('TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO, TB_BANCO_AGENCIA.DESC_BANCO_AGENCIA');
        QContasReceberBaixa.Sql.AddStrings(sqlBaixa);

        QContasReceberBaixaLote.Sql.AddStrings(sqlBaixa);
        QContasReceberBaixaLote.Sql.Add(', ' + QuotedStr('N') + ' as BAIXAR, 0 as VAL_JURO_ALTERAR, 0 as VAL_DESCONTO_ALTERAR ');
        sqlBaixa.Clear;

        sqlBaixa.Add(' FROM TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_CLASS_CADASTRO,TB_FINALIDADE, TB_FILIAL,TB_BANCO_AGENCIA ');
        sqlBaixa.Add(' WHERE TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO');
        sqlBaixa.Add(' AND TB_CADASTRO.COD_CLASS_CADASTRO = TB_CLASS_CADASTRO.COD_CLASS_CADASTRO(+)');
        sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE = TB_FINALIDADE.COD_FINALIDADE');
        sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL');
        sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA = TB_BANCO_AGENCIA.COD_BANCO_AGENCIA(+)');
        if CBMostraBaixatotal.Checked = True then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.VAL_TITULO  > -1 ')
        else
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.VAL_TITULO  > 0 ');
        If Trim(MECodCliente.Text) <> '' then
           sqlBaixa.Add(' AND TB_CADASTRO.COD_CADASTRO = ' + Trim(MECodCliente.Text));
        If Trim(MECodFilial.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = ' + Trim(MECodFilial.Text));
        If Trim(MeNumTitulo.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.NUM_TITULO = ' + Trim(MeNumTitulo.Text));
        If Trim(MeFinalidade.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE = ' + Trim(MeFinalidade.Text));
        If Trim(MeNossoNumero.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO = ' + Chr(39) + Trim(MeNossoNumero.Text)+ Chr(39));
        If Trim(MeContrato.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.COD_CONTRATO_VEND = ' + chr(39) + Trim(MeContrato.text) + chr(39));
        If Trim(MEDataEmissaoInicial.Text) <> '' then
           sqlBaixa.Add(' AND Trunc(TB_CONTA_RECEBER_CAB.DT_EMISSAO) >= ' + 'To_Date('''+Trim(MEDataEmissaoInicial.Text)+''',''dd/mm/yyyy'')');
        If Trim(MEDataEmissaoFinal.Text) <> '' then
           sqlBaixa.Add(' AND Trunc(TB_CONTA_RECEBER_CAB.DT_EMISSAO) <= ' + 'To_Date('''+Trim(MEDataEmissaoFinal.Text) + ' 23:59:59'+''',''dd/mm/yyyy hh24:mi:ss'')');
        If Trim(MEBanco_Baixa.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA = ' + chr(39) + Trim(MEBanco_Baixa.text) + chr(39));
        If Trim(MEDataVencInicial.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= ' + 'To_Date('''+Trim(MEDataVencInicial.Text)+''',''dd/mm/yyyy'')');
        If Trim(MEDataVencFinal.Text) <> '' then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= ' + 'To_Date('''+Trim(MEDataVencFinal.Text)+''',''dd/mm/yyyy'')');
        if Trim(MeValor.text) <> '' Then
           sqlBaixa.Add(' AND VAL_TITULO =' + Trim(MeValor.Text));
        if Trim(MeCodContaReceber.text) <> '' Then
           sqlBaixa.Add(' AND TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB ='+Trim(MeCodContaReceber.text));
        if Trim(MeDescTipoDoc.text) <> '' Then
           sqlBaixa.Add(' AND UPPER(TB_CONTA_RECEBER_CAB.DESC_TIPO_DOCUMENTO) ='+ QuotedStr(Trim(MeDescTipoDoc.text)) );

        if pCodNotaCab > 0 then
          sqlBaixa.Add('AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB = '
            + intToStr(pCodNotaCab));
        pCodNotaCab := 0;

        Case CbOrdem.ItemIndex of
          0 : sqlBaixa.Add(' ORDER BY TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
          1 : sqlBaixa.Add(' ORDER BY TB_CONTA_RECEBER_CAB.DT_EMISSAO');
          2 : sqlBaixa.Add(' ORDER BY TB_CONTA_RECEBER_CAB.COD_CADASTRO');
          3 : sqlBaixa.Add(' ORDER BY TB_CADASTRO.NOME');
          4 : sqlBaixa.Add(' ORDER BY TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO');
          5 : sqlBaixa.Add(' ORDER BY TB_CONTA_RECEBER_CAB.NUM_TITULO');
          6 : sqlBaixa.Add(' ORDER BY TB_CONTA_RECEBER_CAB.DESC_OBSERVACAO');
        End;

        QContasReceberBaixa.SQL.AddStrings(sqlBaixa);
        QContasReceberBaixaLote.SQL.AddStrings(sqlBaixa);

        PCalculaJuros := CbCalculoJuros.Checked;
        pDataBase := StrToDate(MeDtBaixa.Text);  // este campo esta passando para nao usar o formulario no data modulo
        QContasReceberBaixa.Open;                // passa a data de baixa para calcular os juros no calcfield
        QContasReceberBaixa.First;
        wValor_Total := 0;
        wValor_Atualizado := 0;

        wSomaSelecionados := 0.00; //guarda a soma dos itens selecionados na aba de baixa em lote.
        wSomaJuros := 0;
        while Not QContasReceberBaixa.Eof Do
        begin
          wValor_Total := wValor_Total + QContasReceberBaixaVal_Titulo.Value;
          wValor_Atualizado := wValor_Atualizado + QContasReceberBaixaVal_Juros_Calculado.Value;
          QContasReceberBaixa.next;
        end;
        MeTotal.text  := FormatFloat('#,##0.00',wValor_Total);
        MeAtualizado.Text := FormatFloat('#,##0.00',wValor_Atualizado);
        MeTotal2.Text := FormatFloat('#,##0.00',wValor_Total);
        MeAtualizado2.Text := FormatFloat('#,##0.00',wValor_Atualizado);
      End;

  DMContasReceber.cdContasReceberBaixaLote.Close;
  DMContasReceber.cdContasReceberBaixaLote.Open;
  DMContasReceber.cdContasReceberBaixaLote.First;
  DMContasReceber.QContasReceberBaixa.First;

  DBGrid3.SelectedIndex := 1;
  DBGrid4.SelectedIndex := 1;
  If Self.Tag <> 1 Then
     DBGrid1.SetFocus;
end;

procedure TFContasReceberBaixa.FormActivate(Sender: TObject);
begin
  PCBaixa.ActivePage:=TS0Localiza;
  MeFinalidade.Clear;
  MeBanco_Baixa.Clear;
  MePercDesconto.Clear;
  if (DMParamSistema.CodEmpresa = 'JASOL') or (DMParamSistema.CodEmpresa = 'FERRAGENS') or
     (DMParamSistema.CodEmpresa = 'QUERENCIA') then
  begin
    FmDepartamento1.MeDepartamento.Text := IntToStr(DMUsuario.CodDepartamentoUsuario);
    FmDepartamento2.MeDepartamento.Text := IntToStr(DMUsuario.CodDepartamentoUsuario);
  end;
  if (DMParamSistema.CodEmpresa = 'FURGOESMED') or (DMParamSistema.CodEmpresa = 'FURGMED') then
    CbOrdem.ItemIndex := 6
  else
    CbOrdem.ItemIndex := 0;
  MeDtBaixa.Text := DateToStr(Date);
  pCodNotaCab := 0;
  With DMContasReceber do
    Begin
      QContasReceberBaixaMov.Close;
      QContasReceberBaixaMov.Open;
      QContasReceber_Mov.Close;
      QContasReceber_Mov.Open;
    End;
  With DMCaixa do
    Begin
      QCaixa_mov.Close;
      QCaixa_mov.Open;
    End;
  With DMBancoAgencia do
   Begin
     QBancoMovimento.Close;
     QBancoMovimento.Open;
   End;
  if (DMParamSistema.CodEmpresa = 'JASOL')     or (DmParamSistema.CodEmpresa = 'NIR')       or (DMParamSistema.CodEmpresa = 'SONOBOM') or
     (DmParamSistema.CodEmpresa = 'FERRAGMED') or (DMParamSistema.CodEmpresa = 'DONABENTA') then
//Solicitado pelo João. Junior 29/07/2021 // cemapa não baixa contabil - cesar 24/01/2024 //Solicitado por Ademir da Sonobom. Alex 12/12/2025
  begin
    RGFormaPagto.Controls[2].Enabled := False;
    RG2FormaPagto.Controls[2].Enabled := False;
  end;
  DbGrid1.Columns[13].Visible := True;
  if (DMParamSistema.CodEmpresa = 'RADIO') then  //Solic. Marcos - Junior 06/03/2023 suporte #6763
  begin
    DBGrid1.Columns[13].Title.Caption := 'Tipo Doc.';
    DBGrid1.Columns[13].FieldName := 'DESC_TIPO_DOCUMENTO';
  end;
  If (DmParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO') Then
   Begin
     Label36.Visible := True;
     MeBaixaJuro.Visible := True;
     MeValorJuro.Enabled := False;
     MeValorJuro.Color := clBtnFace;
     MeBaixaJuro.TabOrder := 3;
     Label37.Visible := False;
     Label39.Visible := False;
     Label40.Visible := False;
     DBEdit1.Visible := False;
     DBEdit2.Visible := False;
     DBEdit3.Visible := False;
   End
  Else
   Begin
     Label15.Visible := True;
     Label16.Visible := True;
     MeVariacaoPos.Visible := True;
     MeVariacaoNeg.Visible := True;
   End;
   MeValorCheque.Enabled := False;
   MeHistoricoCHeque.Enabled := False;
   SBHistoricoCheque.Enabled := False;
   EdHistoricoCheque.Enabled:= False;
   Label42.Enabled:= False;
   Label41.Enabled := False;
   If Self.Tag = 1 Then  // chamado a partir do contrato garantia de preco
   Begin
     SbProcura.Enabled := False;
     RGFormaPagto.ItemIndex := 2;
     RGFormaPagto.Enabled := False;
     RG2FormaPagto.Enabled := False;
   End;
   if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RADIO' Then  // PARA RADIOLANDIA PERMITE MUDAR O VALOR DO REPARCELAMENTO - CESAR  (SOLICITAÇÃO MARCOS DA RADIOLANDIA)
      MeComJurosReparcelamento.Enabled := True;
   if (DMParamSistema.CodEmpresa = 'FURGOESMED') or (DMParamSistema.CodEmpresa = 'FURGMED') then
      CbCalculoJuros.Checked := false;
   if (DMParamSistema.CodEmpresa = 'SCALA')then
   begin
     FContasReceberBaixa.WindowState := wsMaximized;
     MECodFilial.Text := '1';
   end;

end;

procedure TFContasReceberBaixa.PCBaixaChange(Sender: TObject);
var wDataCapitalizacao,wTipoJuro,wDiasCarencia:String;
    wTaxa,wMoeda,wVl_Capitalizacao, wDescAdiantamento,
    pPercAdiantamentoDia: Real;
    wQtdDiasAdiantamento: integer;
begin
  If PCBaixa.ActivePage=TsReparcelamento then
   Begin
     If Trim(MeCodFilial.Text) = '' Then
      Begin
        PCBaixa.ActivePage := TS0Localiza;
        Raise Exception.Create('Informar Filial');
      End;
     If Trim(MECodCliente.Text) = '' Then
      Begin
        PCBaixa.ActivePage := TS0Localiza;
        Raise Exception.Create('Informar Código Cliente');
      End;
     DMContasReceber.cdContasReceberBaixaLote.First;
     while not DMContasReceber.cdContasReceberBaixaLote.Eof do
     Begin
       Atualiza_Baixa_Lote('LIMPAR');  // procedure
       DMContasReceber.cdContasReceberBaixaLote.Next;
     End;

     //CODIGO PARA IMPOSSIBILITAR A REALIZAÇÃO DE REPARCELAMENTO PARA BAIXA PARCIAL PARA RETIFOZ
     //SOLICITADO POR MARCOS EM 16/12/2020 - CLEBER
     if (DMParamSistema.CodEmpresa = 'RETIFOZ') or (DMParamSistema.CodEmpresa = 'MEDFRIG') then
     begin
       with dMContasReceber.cdContasReceberBaixaLote do
       begin
         Close;
         Filtered := False;
         Filter := 'NOT UPPER(IND_SITUACAO) LIKE ' + QuotedStr('BAIXA PARCIAL');
         Filtered := True;
         Open;
       end;
     end;
     DMContasReceber.cdContasReceberBaixaLote.First;
     MeComJurosReparcelamento.Text := '0';
     MeSemJurosReparcelamento.Text := '0';
     MeComJuros.Text := '0';
     MeSemJuros.Text := '0';
     FMDepartamento3.MeDepartamento.Text := IntToStr(DMUsuario.CodDepartamentoUsuario);
   End
   else
   begin //REATIVA TODAS OS CR CASO MUDE A ABA
     with dMContasReceber.cdContasReceberBaixaLote do
     begin
       Close;
       Filtered := False;
       Open;
     end;
   end;
  wVl_Capitalizacao := 0;
//  SE MODIFICAR AQUI MODIFICAR TAMBEM CALCFIELDS DA QUERY QContasReceberBaixa //
  If PCBaixa.ActivePage=TS1Baixa then
    Begin       // Coloca os Valores default
       SBBaixa.Enabled := true;
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
       Begin
         DMContasReceber.QContasReceberSomaVariacao.Close;
         DMContasReceber.QContasReceberSomaVariacao.Open;
       End;

      //------------------------------------------------------------------------------------------
      // Por Gian 24/01/2019 à pedido do Marlon, suporte 10121
      // À pedido da Raquel, somente para o usuario Simone da Nutrivet, preencher departamento 1
      // Adicionado Nutripet. 01/06/2023 - Alex
      //------------------------------------------------------------------------------------------
      if (DMParamSistema.CodEmpresa = 'NUTRIVET') or (DMParamSistema.CodEmpresa = 'NUTRIPET') then
      begin
        if (Trim(FmDepartamento1.MeDepartamento.Text) = '') and
            (DMUsuario.CodUsuarioCorrente = 24) then
        begin
          FmDepartamento1.MeDepartamento.Text := '1';
          FmDepartamento1.MeDepartamentoExit(Sender);
        end;
      end;
{      wValor_Capitalizacao:=0;
      wDataCapitalizacao:=DateToStr(DMContasReceber.QContasReceberBaixaDt_Capitalizacao.Value);
      with DMContasReceber do
        begin
          If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO') And (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'AB') Then
          Begin
            wTipoJuro:=QContasReceberBaixaNUM_TIPO_JURO.Text;
            wDiasCarencia:=QContasReceberBaixaNUM_DIAS_CARENCIA.Text;
            If wDiasCarencia = '' Then
               wDiasCarencia := '0';
            wTaxa := 0;
            if QContasReceberBaixaPerc_Taxa.Text <> '' Then
              wTaxa  := QContasReceberBaixaPerc_Taxa.value;
            wMoeda:=QContasReceberBaixaCOD_MOEDA.Value;
            If wTipoJuro<>'SEM JURO' then
              Begin
                wValor_Capitalizacao:=CalculaJuros(QContasReceberBaixaVal_Titulo.Value+QContasReceberBaixaVal_Juros.Value,wTaxa,wMoeda,
                     StrToDate(wDataCapitalizacao),StrToDate(MeDtBaixa.Text),QContasReceberBaixaDt_Capitalizacao_Moeda.Value,wTipoJuro,wDiasCarencia);
                wValor_Capitalizacao:=(Round(wValor_Capitalizacao*100)/100);

                if wValor_Capitalizacao > 0.001 then
                   MEValorJuro.Text:=FloatToStr(wValor_Capitalizacao)
                Else
                   MEValorJuro.Text:='';
              End; //if sem juro
          End;
        End;
}
        If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO')  Then
         Begin
           wVl_Capitalizacao := DMContasReceber.QContasReceberBaixaVal_Juros_Calculado.Value - DMContasReceber.QContasReceberBaixaVal_Titulo.Value;
           MeValorJuro.Text := FormatFloat('##0.00',wVl_Capitalizacao);  // valor dos juros calculado no calcfield + juro acumulado anteriores
           MeBaixaJuro.Text := MeValorJuro.Text;
         End;
        MeDataBaixa.Text:=MeDtBaixa.Text;    //DateToStr(DMOracle.DataServ);
        Me2DataBaixa.Text:=MeDtBaixa.Text;    //DateToStr(DMOracle.DataServ);

      if (wVl_Capitalizacao > 0.001) then
         MeValorBaixa.Text := FloatToStr(DMContasReceber.QContasReceberBaixaVal_Titulo.Value + wVl_Capitalizacao)
      else
         MeValorBaixa.Text := FloatToStr(DMContasReceber.QContasReceberBaixaVal_Titulo.Value);
      MeHistoricoDesconto.Text := DMContasReceber.QContasReceberBaixaCOD_HISTORICO_DESC.Text;
      If MePercDesconto.Text <> '' Then
       Begin
         If DMContasReceber.QContasReceberBaixaIND_PERMITE_DESCONTO_BAIXA.Value = 'NAO' Then
          Begin
            PCBaixa.ActivePage:=TS0Localiza;
            Raise exception.Create('Este título não permite lançar desconto');
          End;
         MEValorDesconto.Text := FloatToStr(Trunc(DMContasReceber.QContasReceberBaixaVal_Titulo.Value * StrToFloat(MePercDesconto.Text)) / 100) ;
       End
      else
      begin
        MEValorDesconto.Clear;

      end;
      If DMContasReceber.QContasReceberBaixaInd_Permite_Desconto_Baixa.Value = 'SIM' Then
         MEValorDesconto.Enabled := True
      Else
         MEValorDesconto.Enabled := False;

    End;

  if not DMContasReceber.QContasReceberBaixaPERC_DESC_ADIANTAMENTO.IsNull then
  begin
    wQtdDiasAdiantamento := DaysBetween(DMContasReceber.QContasReceberBaixaDT_VENCIMENTO.Value, DMContasReceber.QContasReceberBaixaDT_EMISSAO.Value);
    if wQtdDiasAdiantamento > 0 then
    begin
      if  DMContasReceber.QContasReceberBaixaDT_VENCIMENTO.Value > StrToDate(MeDtBaixa.Text) then
      begin
        pPercAdiantamentoDia := DMContasReceber.QContasReceberBaixaPERC_DESC_ADIANTAMENTO.Value / wQtdDiasAdiantamento;
        pPercAdiantamentoDia := pPercAdiantamentoDia * DaysBetween(DMContasReceber.QContasReceberBaixaDT_VENCIMENTO.Value, StrToDate(MeDtBaixa.Text));
        pPercAdiantamentoDia := DMContasReceber.QContasReceberBaixaVAL_ORIGINAL.Value * (pPercAdiantamentoDia / 100);
      end
      else
        pPercAdiantamentoDia := 0;
    end;
    if pPercAdiantamentoDia > 0 then
      MEValorDesconto.Text := FloatToStr(RoundTo(pPercAdiantamentoDia,-2));

  end;
   LblHistoricoDesconto.Visible := False;
   MeHistoricoDesconto.Visible := False;
   SbHistoricoDesconto.Visible := False;
  If DMContasReceber.QContasReceberBaixaInd_Situacao.Value='BAIXA TOTAL' then
    Begin
     MEDataBaixa.Clear;
     MEValorBaixa.Clear;
     MEValorDesconto.Clear;
     MEValorJuro.Clear;
     MEObservacao.Clear;
     MeValorOutros.Clear;
     MeContrato.Clear;
     MEDataBaixa.ReadOnly:=True;
     MEValorBaixa.ReadOnly:=True;
     MEValorDesconto.ReadOnly:=True;
//     MEValorJuro.ReadOnly:=True;
     MEObservacao.ReadOnly:=True;
     SBBaixa.Enabled:=False;
    End
  Else
    Begin
     MEDataBaixa.ReadOnly:=False;
     MEValorBaixa.ReadOnly:=False;
     MEValorDesconto.ReadOnly:=False;
//     MEValorJuro.ReadOnly:=True;
     MEObservacao.ReadOnly:=False;
     SBBaixa.Enabled:=True;
    End;
  //Atualiza a data da baixa da aba baixa em lotes
  if PCBaixa.ActivePage = TsBaixaLote then
   Begin
     if MeDtBaixa.Text <> '' then
        ME2DataBaixa.Text := MeDtBaixa.Text;
     DMContasReceber.cdContasReceberBaixaLote.First;
     while not DMContasReceber.cdContasReceberBaixaLote.Eof do
     Begin
       Atualiza_Baixa_Lote('LIMPAR');  // procedure
       DMContasReceber.cdContasReceberBaixaLote.Next;
     End;
     DMContasReceber.cdContasReceberBaixaLote.First;
     MeComJuros.Text := '0';
     MeComJurosReparcelamento.Text := '0';
     MeSemJuros.Text := '0';
     MeSemJurosReparcelamento.Text := '0';
   End;
  If Self.Tag = 0 Then  // estará 1 quando foi baixa contabil do contrato de venda
     RGFormaPagto.ItemIndex:=0;
  MeCodNota.Text := '';
end;

procedure TFContasReceberBaixa.PCBaixaChanging(Sender: TObject;
  var AllowChange: Boolean);
Var wCancelado : String;
begin
  If DMOracle.BuscaNome('SELECT IND_ACEITE_CR FROM TB_PARAM_SISTEMA','IND_ACEITE_CR IS NOT NULL')='S' Then
    Begin
     If (DMContasReceber.QContasReceberBaixaInd_Aceite.value='NAO') or (DMContasReceber.QContasReceberBaixaCod_Conta_Receber_Cab.Value=0) Then
       Begin
         ShowMessage('Não é Possível dar baixa neste título sem que seja dado o Aceite.');
         AllowChange:=False;
       End;
    End
  Else
    Begin
      If (DMContasReceber.QContasReceberBaixaCod_Conta_Receber_Cab.Value=0) Then
        Begin
          ShowMessage('Não é Possível dar baixa neste título.');
          AllowChange:=False;
        End;
    End;

end;

procedure TFContasReceberBaixa.CBMostraBaixaTotalClick(Sender: TObject);
begin
  If CbMostraBaixaTotal.Checked Then
   Begin
//     DbGrid1.Columns[9].Visible := False;
     DbGrid1.Columns[12].Visible := False;
     DbGrid1.Columns[11].Visible := False;
   End;
  SBProcura.Click;
end;

procedure TFContasReceberBaixa.RGFormaPagtoClick(Sender: TObject);
Var wHistoricoCheque : String;
begin
  If (RGFormaPagto.ItemIndex=0) Or    // Pgto. em Dinheiro
     (RGFormaPagto.ItemIndex=2) Or
     (RGFormaPagto.ItemIndex=3) Or
     (RGFormaPagto.ItemIndex=4) Or
     (RGFormaPagto.ItemIndex=5) then  // Pgto. outros so contabil
    Begin
      SBConsContaCorrente.Enabled:=False;
      MEBanco.Clear;
      MECodContaCorrente.Clear;
      MENumCheque.Clear;
      SBBaixa.Enabled:=True;
    End
  Else                              // Pagto. em Cheque
    Begin
      wHistoricoCheque:=DMOracle.BuscaNome('SELECT COD_HISTORICO_CHEQUE FROM TB_FINALIDADE','COD_FINALIDADE = '+FloatToStr(DMContasReceber.QContasReceberBaixaCod_Finalidade.Value));
      If (wHistoricoCheque = '') and (RGFormaPagto.ItemIndex = 1) then
        Begin                        // caso cod_historico_cheque estiver vazio não será
          RGFormaPagto.ItemIndex:=0; // permitido efetuar o pgto. com cheque
          raise Exception.create('Erro! Cod. do Histórico do Cheque deste Título em Branco !');
        End
      Else
        Begin
          if DMParamSistema.CodEmpresa = 'DINGLIS' then //Puxar automático Banco,CC. Junior 07/11/2023. Suporte{8242}
          begin
            MEBanco.Text := 'PIX';
            MECodContaCorrente.Text := '1';
            MENumCheque.Text:=DMContasReceber.QContasReceberBaixaNUM_TITULO.Text
          end;
          If MEBanco.Text='' then
            SBBaixa.Enabled:=False
          Else
            SBBaixa.Enabled:=True;
          SBConsContaCorrente.Enabled:=True;
        End;
    End;
{Bloco criado para informar a bandeira do cartão quando estiver habilitado o controle de cartão na filial. Alex 28/11/2023}
    If ( (RGFormaPagto.ItemIndex = 3) or (RGFormaPagto.ItemIndex = 4) ) and (DMParamSistema.QParamSistemaIND_CONTROLE_CARTAO.Value = 'S') then
    begin
      RgBandeira.Enabled := True;
      RgBandeira.Visible := True;
    end
    else
    begin
      RgBandeira.Enabled := False;
      RgBandeira.Visible := False;
    end;
end;

procedure TFContasReceberBaixa.SBConsContaCorrenteClick(Sender: TObject);
begin
  If FContaCorrenteCons=Nil Then
    FContaCorrenteCons:=TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.ShowModal=MrOk then
   Begin
     MEBanco.Text:=DMBancoAgencia.QContaCorrenteConsDesc_Banco_Agencia.Value;
     MECodContaCorrente.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value);
//     MENumCheque.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value);  // substitui pela linha abaixo para aparecer no
     MENumCheque.Text:=DMContasReceber.QContasReceberBaixaNUM_TITULO.Text;                      // bancos o numero do titulo César novembro - 2014
     SBBaixa.Enabled:=True;
   End;
End;

procedure TFContasReceberBaixa.SBBaixaClick(Sender: TObject);
Var
  wValor_Juro,wValor_Desconto,wValor_Baixa,wPagto_Juro,wValor_Teste,wVlrLancto,wVlrDevolucao,wValorCheque,wValor_Outros:Currency;
  wCodigo,wFilial_Contabil,wFilial,wCodDoc,wCodCompl,wCodHistorico: Integer;
  wNumDoc,wRecibo,wHistoricoContabil,wHistoricoBaixa,wHistoricoDev,wHistoricoDesc,
  wHistoricoJuro,wHistoricoCheque,wContaCred,wContaDeb,wHistoricoVar_Pos,
  wHistoricoVar_Neg,wHistoricoCredito,wCarne,wHistoricoOutros, wHistoricoCartaoCredito,
  wHistoricoCartaoDebito, wHistoricoCaixaCheque, wHistoricoJurosCredito, wHistoricoJurosDebito, wHistoricoJurosCheque,
  wHistoricoPIX, wHistoricoJurosPIX, wBancoAgencia, wBandeiraCartao :String;
  wDtLancto:TDateTime;
  wBaixaEmLote : boolean;
  wGuardaJuro, wNrParcelas : String; // varivel wguardaJuro é para aristides guardar valor juro calculado
  wDepartamento, wCodLanctoCartao :Integer; //variável usada para fazer baixa de título usando departamento diferente do informado no cadastro da C.R.
  cCPF,cNomeCliente,cEnderecoCliente,cIndice,cValor,Indice,Descricao,cMsgPromocional: String;
  cAcresDesc,cTipoAcresDesc ,cValorAcres,cValorDesc,cTipoPagamento: String;
  wTaxa: double;
begin
  if (Sender.ClassType = TSpeedButton) then
    (Sender as TSpeedButton).Enabled := false;
  if (DMContasReceber.QContasReceberBaixaDESC_TIPO_DOCUMENTO.Value =
    'CUP') and (DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S') then
    if not FImpressoraFiscal.VerificaPAFECFLiberado then
      Abort;

  //----veririfica se foi chamado pelo botão de baixa em lote-------
  wBaixaEmLote := false;
  if TComponent(Sender).Name = 'SB2Baixa' then
    wBaixaEmLote := true;
  //------fim verificacao baixa em lote--------

  If DMParamSistema.QParamSistemaDt_Fechamento_Financeiro.Value >= StrToDate(MEDataBaixa.Text) Then
     Raise Exception.Create('Não é Permitido Baixar Este Título - Fechamento Contabil');
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MOINHO' Then
   Begin        // isso para aristides fica acumulando o juro calculado menos a diferenca do juro cobrado - vai fazer isso na rotina mais abaixo
     wGuardaJuro := MeValorJuro.Text;
     MeValorJuro.Text := MeBaixaJuro.Text;
   End;

  wValor_Juro:=0;
  DMCaixa.pCalcFields_Caixa := False;  // serve para nao calcular os campos do calcfields na query QCaixaMov - somente na baixa de titulos
  wValor_Desconto:=0;
  wValor_Baixa:=0;
  wPagto_Juro:=0;
  wVlrDevolucao:=0;
  wValor_Outros:=0;
  DMCaixa.QCaixa_Mov.AutoCalcFields:=False;
  DMBancoAgencia.QBancoMovimento.AutoCalcFields:=False;
  DMContasReceber.QContasReceberBaixaMov.DisableControls;
  if (RGFormaPagto.ItemIndex=1) or (RGFormaPagto.ItemIndex=6) then  // Para acessar banco para buscar código contas contábeis
  begin                            // quando ocorre uma baixa por bancos
     DMBancoAGencia.QBancoAgencia.Close;
     if DMParamSistema.CodEmpresa = 'DINGLIS' then
       DMBancoAgencia.QBancoAgencia.SetVariable('PK',2) //Puxar automático o cód. Banco PIX.
     else
       DMBancoAgencia.QBancoAgencia.SetVariable('PK',DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value);
     DMBancoAGencia.QBancoAgencia.Open;
     If DMBancoAGencia.QBancoAgencia.Eof Then
        Raise exception.Create('Banco não cadastrado');
  end;
  with DMContasReceber do
    begin          // Begin With
    if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'KREUZ') and
        (DMContasReceber.QContasReceber_CabIND_ENVIADO_BANCO.Text = 'SIM') and
        (DMContasReceber.QContasReceber_CabCOD_CONTA_CORRENTE.Text <> '')) and
        (RGFormaPagto.ItemIndex <> 1) then
          raise Exception.Create('Título com boleto bancário, baixar somente via Banco.');

      If (StrToDateTime(MeDataBaixa.Text + ' 23:59:59') <  QContasReceberBaixaDt_Emissao.Value) then
         Raise Exception.Create('Data da baixa não deve ser menor que data da emissão do título');

      DMFinalidade.QFinalidade.Close;
      DMFinalidade.QFinalidade.SetVariable('Pk',QContasReceberBaixaCod_Finalidade.Value);
      DMFinalidade.QFinalidade.Open;
      If DMFinalidade.QFinalidade.Eof Then
         Raise Exception.Create('Finalidade do titulo inexistente');

      wHistoricoBaixa := DMFinalidade.QFinalidadeCOD_HISTORICO_BAIXA.Text;

      wHistoricoDesc := Trim(MeHistoricoDesconto.Text);

      // DMOracle.BuscaNome('SELECT COD_HISTORICO_DESC FROM TB_FINALIDADE','COD_FINALIDADE = '+FloatToStr(QContasReceberBaixaCod_Finalidade.Value));

      wHistoricoJuro := DMFinalidade.QFinalidadeCOD_HISTORICO_JURO.Text;

      wHistoricoCheque := DMFinalidade.QFinalidadeCOD_HISTORICO_CHEQUE.Text;

      wHistoricoContabil := DMFinalidade.QFinalidadeCOD_HISTORICO_CONTABIL.Text;

      wHistoricoOutros := DMFinalidade.QFinalidadeCOD_HISTORICO_OUTROS.Text;

      wHistoricoCartaoCredito := DMFinalidade.QFinalidadeCOD_HISTORICO_CARTAO_CREDITO.Text;

      wHistoricoCartaoDebito := DMFinalidade.QFinalidadeCOD_HISTORICO_CARTAO_DEBITO.Text;

      wHistoricoCaixaCheque :=  DMFinalidade.QFinalidadeCOD_HISTORICO_CAIXA_CHEQUE.Text;

      wHistoricoJurosCredito := DMFinalidade.QFinalidadeCOD_HISTORICO_JUROS_CREDITO.Text;

      wHistoricoJurosDebito := DMFinalidade.QFinalidadeCOD_HISTORICO_JUROS_DEBITO.Text;

      wHistoricoJurosCheque := DMFinalidade.QFinalidadeCOD_HISTORICO_JUROS_CHEQUE.Text;

      wHistoricoPIX      := DMFinalidade.QFinalidadeCOD_HISTORICO_PIX.Text;
      wHistoricoJurosPIX := DMFinalidade.QFinalidadeCOD_HISTORICO_JUROS_PIX.Text;


      wRecibo := DMFinalidade.QFinalidadeIND_RECIBO.Value;

      wCarne := DMFinalidade.QFinalidadeIND_CARNE.Value;

      if (DMParamSistema.QParamSistemaIND_CONTROLE_CARTAO.Value = 'S') then
        wBancoAgencia := DMOracle.FastSelect('COD_BANCO_AGENCIA','TB_BANCO_AGENCIA','IND_BANCO_PADRAO = ''SIM''');

      If (Trim(MEValorJuro.Text) <> '') and (Trim(MEValorJuro.Text) <> '0') then
       Begin
         wValor_Juro:=StrToFloat(MEValorJuro.Text);
         wPagto_Juro:=StrToFloat(MEValorJuro.Text);
         If (DmParamSistema.QParamSistemaCOD_EMPRESA.value='MOINHO') Then
            MeValorBaixa.Text := FloatToStr(StrToFloat(MeValorBaixa.Text) + StrToFloat(MeValorJuro.Text));
       End;
      if (Trim(MEValorBaixa.Text)<>'') and (Trim(MEValorBaixa.Text)<>'0') then
        wValor_Baixa:=StrToFloat(MEValorBaixa.Text);
      if (Trim(MEValorDesconto.Text)<>'') and (Trim(MEValorDesconto.Text)<>'0') then
        wValor_Desconto:=StrToFloat(MEValorDesconto.Text);
      if (Trim(MEDevolucao.Text)<>'') and (Trim(MEDevolucao.Text)<>'0') then
        wVlrDevolucao:=StrToFloat(MEDevolucao.Text);
      if Trim(MeValorCheque.Text)<> '' then
        wValorCheque := StrToFloat(MEValorCheque.Text);
      if Trim(MeValorOutros.Text)<> '' then
        wValor_Outros := StrToFloat(MeValorOutros.Text);
      if (wCarne = 'S') and (MessageDlg('Emitir carnê?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        try
          if CarneImp = nil then
            CarneImp := TCarneImp.Create;
          if DMParamSistema.CodEmpresa = 'RADIO' then
            CarneImp.CarneRadio(QContasReceberBaixaCOD_FILIAL.Text,
              QContasReceberBaixaCOD_CADASTRO.Text,
              QContasReceberBaixaNUM_TITULO.Text,
              QContasReceberBaixaNUM_PARCELA.Text,
              False, wValor_Juro, wValor_Desconto)
          else if DMParamSistema.CodEmpresa = 'ENCOPEL' then
            CarneImp.CarneEncopel(QContasReceberBaixaCOD_FILIAL.Text,
              QContasReceberBaixaCOD_CADASTRO.Text,
              QContasReceberBaixaNUM_TITULO.Text,
              QContasReceberBaixaNUM_PARCELA.Text,
              False)
          else
            MessageDlg('Carnê não configurado para sua empresa.'+#13+#10+
              'Entre em contato com a Cemapa se deseja emitir carnê.', mtError, [mbOK], 0);
        except on e: Exception do
          MessageDlg('Erro na emissão de carnê:'+#13+#10+e.Message, mtError, [mbOK], 0);
        end;
      end;

      wValor_Teste := Trunc((QContasReceberBaixaVal_Titulo.Value+wValor_Juro-wValor_Baixa+wVlrDevolucao)*100)/100;
//era isso      wValor_Teste := Trunc((QContasReceberBaixaVal_Titulo.Value+QContasReceberBaixaVal_Juros.Value+wValor_Juro-wValor_Baixa+wVlrDevolucao)*100)/100;
      if (wValor_Teste >= 0) and ((wValor_Baixa<>0) or (wValor_Juro<>0) or (wVlrDevolucao<>0) or (wValor_Outros<>0)) then
        begin   // Se o Lançamento não vai gerar um valor negativo.
          try
            if not wBaixaEmLote then
              DMOracle.DBCemapa.StartTransaction; // Inicia a transação
            // Cálculo do Juros
            if (wValor_Juro >= wValor_Baixa) Then
             Begin
               wPagto_Juro:=wValor_Baixa;
               wValor_Baixa:=0;
               wValor_Desconto:=0;
             End
            else
             Begin
               wPagto_Juro:=wValor_Juro;
                 wValor_Baixa := wValor_Baixa - wPagto_Juro;
             End;

            // Inclusão de Movimentos

            //Inclui no Movimento o Juro no movimento contas a receber
            If wValor_Juro>0 then
              Begin
                QContasReceberBaixaMov.Insert;
                QContasReceberBaixaMovVal_Movimento.Value:=wValor_Juro;
                QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(MEDataBaixa.Text);
                QContasReceberBaixaMovInd_Tipo_Movimento.Value:='JUROS';
                If ChDevolucao.Checked then
                   QContasReceberBaixaMovInd_Devolucao.Value:='SIM';
                If ChTroca.Checked then
                   QContasReceberBaixaMovInd_Troca.Value:='SIM';
                QContasReceberBaixaMov.Post;
              End;
             // Inclui no Movimento o Pagamento do Juro
             If wPagto_Juro>0 then
               begin
                 QContasReceberBaixaMov.Insert;
                 QContasReceberBaixaMovVal_Movimento.Value:=wPagto_Juro;
                 QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(MEDataBaixa.Text);
                 QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
                 QContasReceberBaixaMovInd_Tipo_Movimento.Value:='RECEBTO. JUROS';
                 QContasReceberBaixaMovInd_Forma_Pagamento.Value:=RGFormaPagto.Items[RGFormaPagto.ItemIndex];
                 if trim(MECodAdiantamento.text) <> '' then  // solicitado pelo Odirlei - acrescentar juros nos adiantamentos
                   QContasReceberBaixaMovCOD_ADIANTAMENTO.Value    := strtoint(trim(MECodAdiantamento.text))
                 else
                   QContasReceberBaixaMovCOD_ADIANTAMENTO.text    := '';
                 If ChDevolucao.Checked then
                    QContasReceberBaixaMovInd_Devolucao.Value:='SIM';
                 If ChTroca.Checked then
                    QContasReceberBaixaMovInd_Troca.Value:='SIM';
                 wDepartamento := 0;
                 if trim(FmDepartamento1.MeDepartamento.Text) <> '' then
                   wDepartamento := StrToInt(Trim(FmDepartamento1.MeDepartamento.Text))
                 else
                   wDepartamento := QContasReceberBaixaCod_Departamento.Value;
                 if RGFormaPagto.ItemIndex = 0 then  // Caixa
                   Begin
                    If wHistoricoJuro <> '' then
                    Begin
                      DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,wDepartamento,//QContasReceberBaixaCod_Departamento.Value,
                                          StrToInt(wHistoricoJuro),wPagto_Juro,QContasReceberBaixaNum_Titulo.Value,
                                          QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaNome.Value,
                                          StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'','');
                       QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                    End;
                   End
                 else
                   if (RGFormaPagto.ItemIndex = 1)  then  // Banco
                   Begin
                     If wHistoricoJuro <> '' then
                     Begin
                       DMBancoAgencia.IncluiBanco(StrToInt(wHistoricoJuro),StrToInt(MECodContaCorrente.Text),StrToInt(MENumCheque.Text),
                            QContasReceberBaixaCod_Cadastro.Value,wDepartamento{QContasReceberBaixaCod_Departamento.Value},StrToDate(MEDataBaixa.Text),
                            wPagto_Juro,QContasReceberBaixaNome.Value,'Título :'+FloatToStr(QContasReceberBaixaNum_Titulo.Value)+' Parcela: '+FloatToStr(QContasReceberBaixaNum_Parcela.Value),
                            '',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'N','');
                       QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
                     end;
                   End
                 else
                    if RGFormaPagto.ItemIndex = 3 then  // Cartão de Crédito
                     Begin
                      If wHistoricoJurosCredito <> '' then
                      Begin
                        DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,wDepartamento,//QContasReceberBaixaCod_Departamento.Value,
                                            StrToInt(wHistoricoJurosCredito),wPagto_Juro,QContasReceberBaixaNum_Titulo.Value,
                                            QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaNome.Value,
                                            StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'','');
                        QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                      End;
                     End
                 else
                    if RGFormaPagto.ItemIndex = 4 then  // Cartão de Débito
                     Begin
                      If wHistoricoJurosDebito <> '' then
                      Begin
                        DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,wDepartamento,//QContasReceberBaixaCod_Departamento.Value,
                                            StrToInt(wHistoricoJurosDebito),wPagto_Juro,QContasReceberBaixaNum_Titulo.Value,
                                            QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaNome.Value,
                                            StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'','');
                        QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                      End;
                     End
                 else
                   if RGFormaPagto.ItemIndex = 5 then  // Caixa
                   Begin
                    If wHistoricoJurosCheque <> '' then
                    Begin
                      DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,wDepartamento,//QContasReceberBaixaCod_Departamento.Value,
                                          StrToInt(wHistoricoJurosCheque),wPagto_Juro,QContasReceberBaixaNum_Titulo.Value,
                                          QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaNome.Value,
                                          StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'','');
                       QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                    End;
                   End
                 else
                 if RGFormaPagto.ItemIndex = 6 then  // BANCO - PIX
                   Begin
                    If wHistoricoJurosPIX <> '' then
                    Begin
                      {if (trim(FmDepartamento1.MeDepartamento.Text) <> '') or (trim(FmDepartamento2.MeDepartamento.Text) <> '') then
                        wDepartamento := StrToInt(Trim(FmDepartamento1.MeDepartamento.Text))//Mov. do Banco conforme o Departamento da baixa(Separa o caixa por Departamento). LOJAS KALCE. Junior 29/07/2021.
                      else
                        wDepartamento := QContasReceberBaixaCod_Departamento.Value;}
                      DMBancoAgencia.IncluiBanco(StrToInt(wHistoricoJurosPIX),StrToInt(MECodContaCorrente.Text),StrToInt(MENumCheque.Text),
                            QContasReceberBaixaCod_Cadastro.Value,wDepartamento{QContasReceberBaixaCod_Departamento.Value},StrToDate(MEDataBaixa.Text),
                            wPagto_Juro,QContasReceberBaixaNome.Value,'Título :'+FloatToStr(QContasReceberBaixaNum_Titulo.Value)+' Parcela: '+FloatToStr(QContasReceberBaixaNum_Parcela.Value),
                            '',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'N','');
                       QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
                    End;
                   End;
                 If DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' Then
                   Begin
                     wCodDoc:=QContasReceberBaixaCod_Conta_Receber_Cab.Value;
                     wNumDoc:=FloatToStr(QContasReceberBaixaNum_Titulo.Value)+'-'+Trim(QContasReceberBaixaNome.Value);
                     wFilial:=QContasReceberBaixaCod_Filial.Value;
                     wFilial_Contabil:=QContasReceberBaixaCod_Filial.Value;
                     wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_JURO_CRED.Value;
                     If RGFormaPagto.ItemIndex=0 then  // Caixa
                        wContaDeb:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_JURO_DEB.Value
                     Else
                      Begin
                        If (RGFormaPagto.ItemIndex = 2) or (RGFormaPagto.ItemIndex = 3) then  //contabil
                         Begin
                           if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And
                              (QContasReceberBaixaCod_Filial.Value <> 9) Then
                              wFilial_Contabil := 1;
                           wContaDeb:=DMFinalidade.QFinalidadeCOD_CONTABIL_JURO_CONT_DEB.Value;
                         End
                        Else
                         Begin       // bancos
                           wFilial_Contabil  := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value; // acessado no botao da tela
                           wContaDeb:=DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Juro_Bco_Deb.Value;
                         End;
                      End;
                     wCodCompl:=QContasReceberBaixaCod_Cadastro.Value;
                     wVlrLancto:=wPagto_Juro;
                     wDtLancto:=StrToDate(MEDataBaixa.Text);
                     If (wContaCred <> '') And
                        (wContaDeb  <> '') Then
                     Begin
                       wCodHistorico:=StrToInt(wHistoricoContabil);
                       DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
                       QContasReceberBaixaMovCOD_LANCTO_CONTABIL_CRED.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                       DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
                       QContasReceberBaixaMovCOD_LANCTO_CONTABIL_DEB.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                     End;
                   End;
                  QContasReceberBaixaMov.Post;
               end;  // FINAL BEGIN JUROS

            //Inclui no Movimento a Baixa
            If wValor_Baixa > 0 then
              Begin
                QContasReceberBaixaMov.Insert;
                QContasReceberBaixaMovVal_Movimento.Value:=wValor_Baixa - wValor_Desconto;
                QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(MEDataBaixa.Text);
                QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
                QContasReceberBaixaMovInd_Tipo_Movimento.Value:='RECEBTO. PRINCIPAL';
                QContasReceberBaixaMovInd_Forma_Pagamento.Value:=RGFormaPagto.Items[RGFormaPagto.ItemIndex];
                if trim(MECodAdiantamento.text) <> '' then  // solicitado pelo Odirlei - acrescentar juros nos adiantamentos
                  QContasReceberBaixaMovCOD_ADIANTAMENTO.Value    := strtoint(trim(MECodAdiantamento.text))
                else
                  QContasReceberBaixaMovCOD_ADIANTAMENTO.text    := '';
                If ChDevolucao.Checked then
                   QContasReceberBaixaMovInd_Devolucao.Value:='SIM';
                If ChTroca.Checked then
                   QContasReceberBaixaMovInd_Troca.Value:='SIM';
                If Trim(MeCodNota.Text) <> '' Then
                   QContasReceberBaixaMovCod_Nota_Cab.Value:=StrToInt(Trim(MeCodNota.Text));
                // Inclusão do Movimento de Caixa
                if RGFormaPagto.ItemIndex=0 then
                 Begin
                  If wHistoricoBaixa <> '' then
                    Begin
                      If DmParamSistema.QParamSistemaInd_Tipo_Integracao.Value='C' Then  // INTEGRAÇÃO CONTABIL VIA CAIXA
                         wVlrLancto:=wValor_Baixa
                      Else
                         wVlrLancto:=wValor_Baixa - wValor_Desconto;
                      wDepartamento := 0;
                      if trim(FmDepartamento1.MeDepartamento.Text) <> '' then
                        wDepartamento := StrToInt(Trim(FmDepartamento1.MeDepartamento.Text))
                      else
                        wDepartamento := QContasReceberBaixaCod_Departamento.Value;
                      DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,wDepartamento,
                                          StrToInt(wHistoricoBaixa),wVlrLancto,QContasReceberBaixaNum_Titulo.Value,
                                          QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaNome.Value,
                                          StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'','');
                      QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                    end;
                 end
                else
                  if RGFormaPagto.ItemIndex = 1 then  // PAGTO POR BANCOS
                   Begin
                    If wHistoricocheque <> '' then
                      If DmParamSistema.QParamSistemaInd_Tipo_Integracao.Value='C' Then  // INTEGRAÇÃO CONTABIL VIA CAIXA
                         wVlrLancto:=wValor_Baixa
                      Else
                         wVlrLancto:=wValor_Baixa - wValor_Desconto;
                      begin
                        DMBancoAgencia.IncluiBanco(StrToInt(wHistoricoCheque),StrToInt(MECodContaCorrente.Text),StrToInt(MENumCheque.Text),
                            QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaCod_Departamento.Value,StrToDate(MEDataBaixa.Text),
                            wVlrLancto,QContasReceberBaixaNome.Value,'Título :'+FloatToStr(QContasReceberBaixaNum_Titulo.Value)+' Parcela: '+FloatToStr(QContasReceberBaixaNum_Parcela.Value) + ' ' +MEObservacao.Text,//Obs da baixa. Junior 04/03/2020 - MetalTruck.
                            '',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'N','');
                        QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;

                        DMFinalidade.QFinalidade.Close;
                        DMFinalidade.QFinalidade.SetVariable('PK', QContasReceberBaixaCOD_FINALIDADE.Value);
                        DMFinalidade.QFinalidade.Open;

                        DMHistorico.QHistorico.Close;
                        DMHistorico.QHistorico.SetVariable('PK', DMFinalidade.QFinalidadeCOD_HISTORICO_BAIXA.Value);
                        DMHistorico.QHistorico.open;
// foi colocado em uma trigger
//                        if(DMHistorico.QHistoricoCOD_HISTORICO_CAIXA.Value > 0) and (DMHistorico.QHistoricoCOD_DEPARTAMENTO.Value > 0) then
                          //CHAMA PROCEDURE NO BANCO QUE GERA UM LANÇAMENTO NO CAIXA
//                          DMContasReceber.OPBanco.CallProcedure('PROC_ATUALIZA_MOV_CAIXA',[DMUsuario.CodUsuarioCorrente,0,DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value,'',0]);

                      end;
                   End
                else
                  if RGFormaPagto.ItemIndex = 3 then
                   Begin
                    If wHistoricoCartaoCredito <> '' then
                      Begin
                        If DmParamSistema.QParamSistemaInd_Tipo_Integracao.Value='C' Then  // INTEGRAÇÃO CONTABIL VIA CAIXA
                           wVlrLancto:= wValor_Baixa + wValor_Juro
                        Else
                           wVlrLancto:= (wValor_Baixa + wValor_Juro) - wValor_Desconto;
                        wDepartamento := 0;
                        if trim(FmDepartamento1.MeDepartamento.Text) <> '' then
                          wDepartamento := StrToInt(Trim(FmDepartamento1.MeDepartamento.Text))
                        else
                          wDepartamento := QContasReceberBaixaCod_Departamento.Value;
                        DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,wDepartamento,
                                            StrToInt(wHistoricoCartaoCredito),wVlrLancto,QContasReceberBaixaNum_Titulo.Value,
                                            QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaNome.Value,
                                            StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'','');
                        QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                        if (DMParamSistema.QParamSistemaIND_CONTROLE_CARTAO.Value = 'S') then
                        begin
                          wCodLanctoCartao := strtoint( DMOracle.BuscaNome('SELECT SQLANCAMENTO_CARTAO.NEXTVAL FROM DUAL', '1=1') );
                          case RgBandeira.ItemIndex of
                            0: wBandeiraCartao := 'MASTERCARD';
                            1: wBandeiraCartao := 'VISA';
                            2: wBandeiraCartao := 'ELO';
                            3: wBandeiraCartao := 'NUBANK';
                            4: wBandeiraCartao := 'BPF';
                            5: wBandeiraCartao := 'OUTROS';
                          end;
                          if (RGFormaPagto.ItemIndex = 3) then
                            wTaxa := StrToFloat(DMOracle.BuscaNome('SELECT PERC_TAXA FROM TB_TAXA_CARTAO',' COD_BANCO_AGENCIA = ' +  wBancoAgencia +
                                      ' AND NUM_PARCELAS = 1'));
                          DMContasReceber.LancaCartao(wCodLanctoCartao,strtoint(wBancoAgencia),QContasReceberBaixaCOD_CONTA_RECEBER_CAB.Value,1,
                                                      QContasReceberBaixaNUM_PARCELA.Value, StrToDate(MEDataBaixa.Text), StrToDate(MEDataBaixa.Text) + 30 ,
                                                      wBandeiraCartao, wVlrLancto,{ QContasReceberBaixaVAL_ORIGINAL.Value,} wTaxa);
                        end;
                     end;
                   end
                else
                  if RGFormaPagto.ItemIndex = 4 then
                   Begin
                    If wHistoricoCartaoDebito <> '' then
                      Begin
                        If DmParamSistema.QParamSistemaInd_Tipo_Integracao.Value='C' Then  // INTEGRAÇÃO CONTABIL VIA CAIXA
                           wVlrLancto := wValor_Baixa
                        Else
                           wVlrLancto := (wValor_Baixa + wValor_Juro) - wValor_Desconto;
                        wDepartamento := 0;
                        if trim(FmDepartamento1.MeDepartamento.Text) <> '' then
                          wDepartamento := StrToInt(Trim(FmDepartamento1.MeDepartamento.Text))
                        else
                          wDepartamento := QContasReceberBaixaCod_Departamento.Value;
                        DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,wDepartamento,
                                            StrToInt(wHistoricoCartaoDebito),wVlrLancto,QContasReceberBaixaNum_Titulo.Value,
                                            QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaNome.Value,
                                            StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'','');
                        QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                        if (DMParamSistema.QParamSistemaIND_CONTROLE_CARTAO.Value = 'S') then
                        begin
                          wCodLanctoCartao := strtoint( DMOracle.BuscaNome('SELECT SQLANCAMENTO_CARTAO.NEXTVAL FROM DUAL', '1=1') );
                          case RgBandeira.ItemIndex of
                            0: wBandeiraCartao := 'MASTERCARD';
                            1: wBandeiraCartao := 'VISA';
                            2: wBandeiraCartao := 'ELO';
                            3: wBandeiraCartao := 'NUBANK';
                            4: wBandeiraCartao := 'BPF';
                            5: wBandeiraCartao := 'OUTROS';
                          end;
                          if (RGFormaPagto.ItemIndex = 4) then
                            wTaxa := StrToFloat(DMOracle.BuscaNome('SELECT PERC_TAXA FROM TB_TAXA_CARTAO',' COD_BANCO_AGENCIA = ' +  wBancoAgencia +
                                      ' AND NUM_PARCELAS = 0'));
                          DMContasReceber.LancaCartao(wCodLanctoCartao,strtoint(wBancoAgencia),QContasReceberBaixaCOD_CONTA_RECEBER_CAB.Value,0,
                                                      QContasReceberBaixaNUM_PARCELA.Value, StrToDate(MEDataBaixa.Text), StrToDate(MEDataBaixa.Text) + 1 ,
                                                      wBandeiraCartao, wVlrLancto, { QContasReceberBaixaVAL_ORIGINAL.Value,} wTaxa);
                        end;
                      end;
                   end
                else
                  if RGFormaPagto.ItemIndex = 5 then
                   Begin
                    If wHistoricoCaixaCheque <> '' then
                      Begin
                        If DmParamSistema.QParamSistemaInd_Tipo_Integracao.Value='C' Then  // INTEGRAÇÃO CONTABIL VIA CAIXA
                           wVlrLancto:=wValor_Baixa
                        Else
                           wVlrLancto:=wValor_Baixa - wValor_Desconto;
                        wDepartamento := 0;
                        if trim(FmDepartamento1.MeDepartamento.Text) <> '' then
                          wDepartamento := StrToInt(Trim(FmDepartamento1.MeDepartamento.Text))
                        else
                          wDepartamento := QContasReceberBaixaCod_Departamento.Value;
                        DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,wDepartamento,
                                            StrToInt(wHistoricoCaixaCheque),wVlrLancto,QContasReceberBaixaNum_Titulo.Value,
                                            QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaNome.Value,
                                            StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'','');
                        QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                      end;
                   end
                 else
                 if RGFormaPagto.ItemIndex = 6 then  // PAGTO POR PIX - BANCO
                   Begin
                    If wHistoricoPIX <> '' then
                      If DmParamSistema.QParamSistemaInd_Tipo_Integracao.Value='C' Then  // INTEGRAÇÃO CONTABIL VIA CAIXA
                         wVlrLancto:=wValor_Baixa
                      Else
                         wVlrLancto:=wValor_Baixa - wValor_Desconto;
                      begin
                        if (trim(FmDepartamento1.MeDepartamento.Text) <> '') or (trim(FmDepartamento2.MeDepartamento.Text) <> '') then
                          wDepartamento := StrToInt(Trim(FmDepartamento1.MeDepartamento.Text)) //Mov. do Banco conforme o Departamento da baixa(Separa o caixa por Departamento). LOJAS KALCE. Junior 29/07/2021.
                        else
                          wDepartamento := QContasReceberBaixaCod_Departamento.Value;

                        DMBancoAgencia.IncluiBanco(StrToInt(wHistoricoPIX),StrToInt(MECodContaCorrente.Text),StrToInt(MENumCheque.Text),
                            QContasReceberBaixaCod_Cadastro.Value,wDepartamento{QContasReceberBaixaCod_Departamento.Value},StrToDate(MEDataBaixa.Text),
                            wVlrLancto,QContasReceberBaixaNome.Value,'Título :'+FloatToStr(QContasReceberBaixaNum_Titulo.Value)+' Parcela: '+FloatToStr(QContasReceberBaixaNum_Parcela.Value) + ' ' +MEObservacao.Text,//Obs da baixa. Junior 04/03/2020 - MetalTruck.
                            '',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'N','');
                        QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;

                        DMFinalidade.QFinalidade.Close;
                        DMFinalidade.QFinalidade.SetVariable('PK', QContasReceberBaixaCOD_FINALIDADE.Value);
                        DMFinalidade.QFinalidade.Open;

                        DMHistorico.QHistorico.Close;
                        DMHistorico.QHistorico.SetVariable('PK', DMFinalidade.QFinalidadeCOD_HISTORICO_BAIXA.Value);
                        DMHistorico.QHistorico.open;
// foi colocado em uma trigger
//                        if(DMHistorico.QHistoricoCOD_HISTORICO_CAIXA.Value > 0) and (DMHistorico.QHistoricoCOD_DEPARTAMENTO.Value > 0) then
                          //CHAMA PROCEDURE NO BANCO QUE GERA UM LANÇAMENTO NO CAIXA
//                          DMContasReceber.OPBanco.CallProcedure('PROC_ATUALIZA_MOV_CAIXA',[DMUsuario.CodUsuarioCorrente,0,DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value,'',0]);

                      end;
                   end;
                // Inclusão do Lançamento Contábil
                If DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' Then
                  Begin
                    wCodDoc:=QContasReceberBaixaCod_Conta_Receber_Cab.Value;
                    wNumDoc:=FloatToStr(QContasReceberBaixaNum_Titulo.Value)+'-'+Trim(QContasReceberBaixaNome.Value);
                    wFilial:=              QContasReceberBaixaCod_Filial.Value;
                    wFilial_Contabil:=     QContasReceberBaixaCod_Filial.Value;
                    wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_BAIXA_CRED.Value;
                    If RGFormaPagto.ItemIndex = 0 then
                       wContaDeb:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_BAIXA_DEB.Value
                    Else
                     Begin
                       If (RGFormaPagto.ItemIndex = 2) or (RGFormaPagto.ItemIndex = 3) then
                        Begin
                          wContaDeb :=DMFinalidade.QFinalidadeCOD_CONTABIL_BAIXA_CONT_DEB.Value;
                          wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_BAIXA_CONT_CRED.Value;
                        End
                       Else
                        Begin
                          wFilial_Contabil  := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value; // acessado no botao da tela
                          wContaDeb:=DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Prin_Bco_Deb.Value;
                        End;
                     End;
                    wCodCompl:=QContasReceberBaixaCod_Cadastro.Value;
                    wVlrLancto:=wValor_Baixa;
                    wDtLancto:=StrToDate(MEDataBaixa.Text);
                    If (wContaCred <> '') And (wContaDeb  <> '') Then
                    Begin
                      wCodHistorico:=StrToInt(wHistoricoContabil);
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
                      QContasReceberBaixaMovCod_lancto_contabil_Cred.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
                      QContasReceberBaixaMovCod_lancto_contabil_Deb.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                    End;
                  End;
                //------alterado César: 24/01/2008.
                if trim(MECodAdiantamento.text) <> '' then
                  QContasReceberBaixaMovCOD_ADIANTAMENTO.Value    := strtoint(trim(MECodAdiantamento.text))
                else
                  QContasReceberBaixaMovCOD_ADIANTAMENTO.text    := '';

                //--------------------------
                QContasReceberBaixaMov.Post;
              End; // Termino da Inclusão dos Movimentos de Baixa

            {DMHistorico.QHistorico.Close;
            DMHistorico.QHistorico.SetVariable('PK',DMFinalidade.QFinalidadeCOD_HISTORICO_DESC.Value);
            DMHistorico.QHistorico.Open;}

            //incluído historico do caixa para validar se deve ou não gravar no caixa - Cleber 12/11/2019
            If (wValor_Desconto>0)then
              Begin     //Inclui no Movimento o Desconto
                QContasReceberBaixaMov.Insert;
                QContasReceberBaixaMovVal_Movimento.Value:=wValor_Desconto;
                QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(MEDataBaixa.Text);
                QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
                QContasReceberBaixaMovInd_Tipo_Movimento.Value:='DESC. CONCEDIDO';
                QContasReceberBaixaMovInd_Forma_Pagamento.Value:=RGFormaPagto.Items[RGFormaPagto.ItemIndex];
                if trim(MECodAdiantamento.text) <> '' then  // odirlei brasperon pediu para acrescentar os descontos no adiantamento
                  QContasReceberBaixaMovCOD_ADIANTAMENTO.Value    := strtoint(trim(MECodAdiantamento.text))
                else
                  QContasReceberBaixaMovCOD_ADIANTAMENTO.text    := '';
                If ChDevolucao.Checked then
                   QContasReceberBaixaMovInd_Devolucao.Value:='SIM';
                If ChTroca.Checked then
                   QContasReceberBaixaMovInd_Troca.Value:='SIM';
                If RGFormaPagto.ItemIndex=1 then // Pagto em Cheque
                   QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
                If RGFormaPagto.ItemIndex=0 then // Pagto em dinheiro
                  If wHistoricoDesc <> '' then
                    Begin
                      DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,QContasReceberBaixaCod_Departamento.Value,
                                          StrToInt(wHistoricoDesc),wValor_Desconto,QContasReceberBaixaNum_Titulo.Value,
                                          QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaNome.Value,
                                          StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'','');
                      QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                    End;
                If (DmParamSistema.QParamSistemaInd_Tipo_Integracao.Value='C') And
                   (RGFormaPagto.ItemIndex=1)                                  Then  // INTEGRAÇÃO CONTABIL VIA CAIXA
                    If wHistoricoDesc <> '' then
                     Begin
                       DMBancoAgencia.IncluiBanco(StrToInt(wHistoricoDesc),StrToInt(MECodContaCorrente.Text),StrToInt(MENumCheque.Text),
                            QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaCod_Departamento.Value,StrToDate(MEDataBaixa.Text),
                            wValor_Desconto,QContasReceberBaixaNome.Value,'Título :'+FloatToStr(QContasReceberBaixaNum_Titulo.Value)+' Parcela: '+FloatToStr(QContasReceberBaixaNum_Parcela.Value),
                            '',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'N','');
                        QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
                     End;
                If DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' Then
                  Begin
                    wCodDoc:=QContasReceberBaixaCod_Conta_Receber_Cab.Value;
                    wNumDoc:=FloatToStr(QContasReceberBaixaNum_Titulo.Value)+'-'+Trim(QContasReceberBaixaNome.Value);
                    wFilial:=QContasReceberBaixaCod_Filial.Value;
                    wFilial_Contabil:=QContasReceberBaixaCod_Filial.Value;
                    If RGFormaPagto.ItemIndex=0 then // Pagto em dinheiro
                       wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_DESC_CRED.Value
                    Else
                     Begin
                       If (RGFormaPagto.ItemIndex = 2) or (RGFormaPagto.ItemIndex = 3) then
                        Begin
                          wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_DESC_CONT_CRED.Value;
                        End
                       Else
                        Begin
                          wContaCred:=DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Desc_Bco_Cred.Value;
                          wFilial_Contabil  := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value; // acessado no botao da tela
                        End;
                     End;
                    wContaDeb:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_DESC_DEB.Value;
                    wCodCompl:=QContasReceberBaixaCod_Cadastro.Value;
                    wVlrLancto:=wValor_Desconto;;
                    wDtLancto:=StrToDate(MEDataBaixa.Text);
                    If (wContaCred <> '') And
                       (wContaDeb  <> '') Then
                    Begin
                      wCodHistorico:=StrToInt(wHistoricoContabil);
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
                      QContasReceberBaixaMovCod_lancto_contabil_Cred.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
                      QContasReceberBaixaMovCod_lancto_contabil_Deb.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                    End;
                  End;
                QContasReceberBaixaMov.Post;
              End; // Término da Inclusao do Movimento de Desconto

            If Trim(MeVariacaoPos.Text) <> '' then
              Begin     //Inclui no Movimento Variação Cambial Positiva
                QContasReceberBaixaMov.Insert;
                QContasReceberBaixaMovVal_Movimento.Value:=StrToFloat(Trim(MeVariacaoPos.Text));
                QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(MEDataBaixa.Text);
                QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
                QContasReceberBaixaMovInd_Tipo_Movimento.Value:='VARIACAO POS';
                QContasReceberBaixaMovInd_Forma_Pagamento.Value:=RGFormaPagto.Items[RGFormaPagto.ItemIndex];
                If ChDevolucao.Checked then
                   QContasReceberBaixaMovInd_Devolucao.Value:='SIM';
                If ChTroca.Checked then
                   QContasReceberBaixaMovInd_Troca.Value:='SIM';
                wHistoricoVar_Pos:=DMFinalidade.QFinalidadeCOD_HISTORICO_VARIACAO_POS.Text;
                If RGFormaPagto.ItemIndex=0 then // Pagto em dinheiro
                 Begin
                   If wHistoricoVar_Pos <> '' then
                    Begin
                      DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,QContasReceberBaixaCod_Departamento.Value,
                                          StrToInt(wHistoricoVar_Pos),StrToFloat(Trim(MeVariacaoPos.Text)),QContasReceberBaixaNum_Titulo.Value,
                                          QContasReceberBaixaCod_Cadastro.Value,'Variacao Cambial +',
                                          StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'','');
                      QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                    End;
                 end
                else
                 If wHistoricoVar_Pos <> '' then
                  begin
                    DMBancoAgencia.IncluiBanco(StrToInt(wHistoricoVar_Pos),StrToInt(MECodContaCorrente.Text),StrToInt(MENumCheque.Text),
                        QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaCod_Departamento.Value,StrToDate(MEDataBaixa.Text),
                        StrToFloat(Trim(MeVariacaoPos.Text)),QContasReceberBaixaNome.Value,'Título :'+FloatToStr(QContasReceberBaixaNum_Titulo.Value)+' Parcela: '+FloatToStr(QContasReceberBaixaNum_Parcela.Value),
                        '',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'N','');
                    QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
                  end;
                If DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' Then
                  Begin
                    wCodDoc:=QContasReceberBaixaCod_Conta_Receber_Cab.Value;
                    wNumDoc:=FloatToStr(QContasReceberBaixaNum_Titulo.Value)+'-'+Trim(QContasReceberBaixaNome.Value);
                    wFilial:=QContasReceberBaixaCod_Filial.Value;
                    wFilial_Contabil:=QContasReceberBaixaCod_Filial.Value;
                    wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_VARIACAO_POS_CRED.Value;
                    wContaDeb:=DMFinalidade.QFinalidadeCOD_CONTABIL_VARIACAO_POS_DEB.Value;
                    wCodCompl:=QContasReceberBaixaCod_Cadastro.Value;
                    wVlrLancto:=StrToFloat(Trim(MeVariacaoPos.Text));
                    wDtLancto:=StrToDate(MEDataBaixa.Text);
                    If (wContaCred <> '') And
                       (wContaDeb  <> '') Then
                    Begin
                      wCodHistorico:=StrToInt(wHistoricoContabil);
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
                      QContasReceberBaixaMovCod_lancto_contabil_Cred.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
                      QContasReceberBaixaMovCod_lancto_contabil_Deb.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                    End;
                  End;
                QContasReceberBaixaMov.Post;
              End; // Término da Inclusao do Movimento de Variação Cambial Positiva

            If Trim(MeVariacaoNeg.Text) <> '' then
             Begin     //Inclui no Movimento Variação Cambial Negativa
               QContasReceberBaixaMov.Insert;
               QContasReceberBaixaMovVal_Movimento.Value:=StrToFloat(Trim(MeVariacaoNeg.Text));
               QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(MEDataBaixa.Text);
               QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
               QContasReceberBaixaMovInd_Tipo_Movimento.Value:='VARIACAO NEG';
               QContasReceberBaixaMovInd_Forma_Pagamento.Value:=RGFormaPagto.Items[RGFormaPagto.ItemIndex];
               If ChDevolucao.Checked then
                  QContasReceberBaixaMovInd_Devolucao.Value:='SIM';
                If ChTroca.Checked then
                   QContasReceberBaixaMovInd_Troca.Value:='SIM';
               wHistoricoVar_Neg:=DMFinalidade.QFinalidadeCOD_HISTORICO_VARIACAO_NEG.Text;
               If RGFormaPagto.ItemIndex=0 then // Pagto em dinheiro
                Begin
                  If wHistoricoVar_Neg <> '' then
                   Begin
                      DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,QContasReceberBaixaCod_Departamento.Value,
                                          StrToInt(wHistoricoVar_Neg),StrToFloat(Trim(MeVariacaoNeg.Text)),QContasReceberBaixaNum_Titulo.Value,
                                          QContasReceberBaixaCod_Cadastro.Value,'Variacao Cambial -',
                                          StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'','');
                     QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                   End;
                 end
                else
                 If wHistoricoVar_Neg <> '' then
                  begin
                    DMBancoAgencia.IncluiBanco(StrToInt(wHistoricoVar_Neg),StrToInt(MECodContaCorrente.Text),StrToInt(MENumCheque.Text),
                        QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaCod_Departamento.Value,StrToDate(MEDataBaixa.Text),
                        StrToFloat(Trim(MeVariacaoNeg.Text)),QContasReceberBaixaNome.Value,'Título :'+FloatToStr(QContasReceberBaixaNum_Titulo.Value)+' Parcela: '+FloatToStr(QContasReceberBaixaNum_Parcela.Value),
                        '',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'N','');
                    QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
                  end;
                If DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' Then
                  Begin
                    wCodDoc:=QContasReceberBaixaCod_Conta_Receber_Cab.Value;
                    wNumDoc:=FloatToStr(QContasReceberBaixaNum_Titulo.Value)+'-'+Trim(QContasReceberBaixaNome.Value);
                    wFilial:=QContasReceberBaixaCod_Filial.Value;
                    wFilial_Contabil:=QContasReceberBaixaCod_Filial.Value;
                    wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_VARIACAO_NEG_CRED.Value;
                    wContaDeb:=DMFinalidade.QFinalidadeCOD_CONTABIL_VARIACAO_NEG_DEB.Value;
                    wCodCompl:=QContasReceberBaixaCod_Cadastro.Value;
                    wVlrLancto:=StrToFloat(Trim(MeVariacaoNeg.Text));
                    wDtLancto:=StrToDate(MEDataBaixa.Text);
                    If (wContaCred <> '') And
                       (wContaDeb  <> '') Then
                    Begin
                      wCodHistorico:=StrToInt(wHistoricoContabil);
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
                      QContasReceberBaixaMovCod_lancto_contabil_Cred.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                      DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
                      QContasReceberBaixaMovCod_lancto_contabil_Deb.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                    End;
                  End;
                QContasReceberBaixaMov.Post;
              End; // Término da Inclusao do Movimento de Variação Cambial Negativa
            If wVlrDevolucao>0 then
              Begin     //Inclui no Movimento o devolucao
                wHistoricoDev:=DMFinalidade.QFinalidadeCOD_HISTORICO_CAIXA_DEVOLUCAO.Text;
                QContasReceberBaixaMov.Insert;
                QContasReceberBaixaMovVal_Movimento.Value:=wVlrDevolucao;
                QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(MEDataBaixa.Text);
                QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
                QContasReceberBaixaMovInd_Tipo_Movimento.Value:='DEVOLUCAO';
                QContasReceberBaixaMovInd_Forma_Pagamento.Value:=RGFormaPagto.Items[RGFormaPagto.ItemIndex];
                If ChDevolucao.Checked then
                   QContasReceberBaixaMovInd_Devolucao.Value:='SIM';
                If ChTroca.Checked then
                   QContasReceberBaixaMovInd_Troca.Value:='SIM';
                If RGFormaPagto.ItemIndex = 1 then // Pagto em Cheque
                   QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
                If RGFormaPagto.ItemIndex = 0 then // Pagto em dinheiro
                  If wHistoricoDev <> '' then
                    Begin
                      DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,QContasReceberBaixaCod_Departamento.Value,
                                          StrToInt(wHistoricoDev),wVlrDevolucao,QContasReceberBaixaNum_Titulo.Value,
                                          QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaNome.Value,
                                          StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'','');
                      QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                    End;
                QContasReceberBaixaMov.Post;
              End; // Término da Inclusao do Movimento de Desconto


             If wValor_Outros > 0 then
               begin
                 QContasReceberBaixaMov.Insert;
                 QContasReceberBaixaMovVal_Movimento.Value:=wValor_Outros;
                 QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(MEDataBaixa.Text);
                 QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
                 QContasReceberBaixaMovInd_Tipo_Movimento.Value:='RECEBTO. OUTROS';
                 QContasReceberBaixaMovInd_Forma_Pagamento.Value:=RGFormaPagto.Items[RGFormaPagto.ItemIndex];
                 if trim(MECodAdiantamento.text) <> '' then  // solicitado pelo Odirlei - acrescentar juros nos adiantamentos
                   QContasReceberBaixaMovCOD_ADIANTAMENTO.Value    := strtoint(trim(MECodAdiantamento.text))
                 else
                   QContasReceberBaixaMovCOD_ADIANTAMENTO.text    := '';
                 If ChDevolucao.Checked then
                    QContasReceberBaixaMovInd_Devolucao.Value:='SIM';
                 If ChTroca.Checked then
                    QContasReceberBaixaMovInd_Troca.Value:='SIM';
                 if RGFormaPagto.ItemIndex = 0 then  // Caixa
                   Begin
                    If wHistoricoOutros <> '' then
                    Begin
                      DMCaixa.IncluiCaixa(QContasReceberBaixaCod_Filial.Value,QContasReceberBaixaCod_Departamento.Value,
                                          StrToInt(wHistoricoOutros),wValor_Outros,QContasReceberBaixaNum_Titulo.Value,
                                          QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaNome.Value,
                                          StrToDate(MEDataBaixa.Text),'',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'','');
                       QContasReceberBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
                    End;
                   End
                 else
                   if RGFormaPagto.ItemIndex = 1 then  // Banco
                    Begin
                     If wHistoricoOutros <> '' then
                      Begin
                        DMBancoAgencia.IncluiBanco(StrToInt(wHistoricoOutros),StrToInt(MECodContaCorrente.Text),StrToInt(MENumCheque.Text),
                            QContasReceberBaixaCod_Cadastro.Value,QContasReceberBaixaCod_Departamento.Value,StrToDate(MEDataBaixa.Text),
                            wValor_Outros,QContasReceberBaixaNome.Value,'Título :'+FloatToStr(QContasReceberBaixaNum_Titulo.Value)+' Parcela: '+FloatToStr(QContasReceberBaixaNum_Parcela.Value),
                            '',QContasReceberBaixaCod_Conta_Receber_Cab.Text,'N','');
                        QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
                      end;
                    End;
                 If DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' Then
                   Begin
                     wCodDoc:=QContasReceberBaixaCod_Conta_Receber_Cab.Value;
                     wNumDoc:=FloatToStr(QContasReceberBaixaNum_Titulo.Value)+'-'+Trim(QContasReceberBaixaNome.Value);
                     wFilial:=QContasReceberBaixaCod_Filial.Value;
                     wFilial_Contabil:=QContasReceberBaixaCod_Filial.Value;
                     wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_OUTROS_CRED.Value;
                     If RGFormaPagto.ItemIndex=0 then  // Caixa
                        wContaDeb:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_OUTROS_DEB.Value
                     Else
                      Begin
                        If (RGFormaPagto.ItemIndex = 2) or (RGFormaPagto.ItemIndex = 3) then  //contabil
                         Begin
                           wContaDeb:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_OUTROS_DEB.Value;
                         End
                        Else
                         Begin       // bancos
                           wFilial_Contabil  := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value; // acessado no botao da tela
                           wContaDeb:=DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Juro_Bco_Deb.Value;
                         End;
                      End;
                     wCodCompl:=QContasReceberBaixaCod_Cadastro.Value;
                     wVlrLancto:=wValor_Outros;
                     wDtLancto:=StrToDate(MEDataBaixa.Text);
                     If (wContaCred <> '') And
                        (wContaDeb  <> '') Then
                     Begin
                       wCodHistorico:=StrToInt(wHistoricoContabil);
                       DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDtLancto,wContaDeb);
                       QContasReceberBaixaMovCOD_LANCTO_CONTABIL_CRED.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                       DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDtLancto,wContaCred);
                       QContasReceberBaixaMovCOD_LANCTO_CONTABIL_DEB.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                     End;
                   End;
                  QContasReceberBaixaMov.Post;
               end;  // FINAL BEGIN OUTROS



            // Término da Inclusão de Movimentos
            QContasReceber_Cab.AutoCalcFields:=False;
            QContasReceber_Cab.Close;
            QContasReceber_Cab.SetVariable('PK',QContasReceberBaixaCod_Conta_Receber_Cab.Value);
            QContasReceber_Cab.Open;
            QContasReceber_Cab.Edit;
            If wVlrDevolucao > 0 Then
               QContasReceber_CabVal_Titulo.Value:=QContasReceber_CabVal_Titulo.Value - wVlrDevolucao;
{            If (wValor_Baixa+wPagto_Juro > QContasReceber_CabVal_Juros.Value + wValor_Juro) then
               begin
                 QContasReceber_CabVal_Juros.Value:=0;
                 QContasReceber_CabVal_Titulo.Value:=QContasReceber_CabVal_Titulo.Value+(QContasReceber_CabVal_Juros.Value-(Trunc(wValor_Baixa*100)/100));
               end
            Else
               QContasReceber_CabVal_Juros.Value:=QContasReceber_CabVal_Juros.Value+Trunc(wValor_Juro*100)/100-(Trunc(wValor_Baixa*100)/100+Trunc(wPagto_Juro*100)/100);
}
            If Trim(MeHistoricoCheque.Text) <> '' Then
              QContasReceber_CabVAL_TITULO.Value := QContasReceber_CabVAL_TITULO.Value-(Trunc(wValor_Baixa*100)/100)-StrToFloat(Trim(MevalorCheque.Text))
            else
              QContasReceber_CabVal_Titulo.Value:=QContasReceber_CabVal_Titulo.Value-(Trunc(wValor_Baixa*100)/100);
            If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO' Then
             Begin
               If (StrToFloat(wGuardaJuro) > 0) Then
                  QContasReceber_CabVAL_JUROS.Value := StrToFloat(wGuardaJuro) - wPagto_Juro;
             End;
            // Muda a Situção do Título
            QContasReceber_CabVal_Titulo.Value := Trunc(QContasReceber_CabVal_Titulo.Value * 1000);
            QContasReceber_CabVal_Titulo.Value := QContasReceber_CabVal_Titulo.Value / 1000;
            If QContasReceber_CabVal_Titulo.Value = 0 then
             Begin
               If StrToDate(MEDataBaixa.Text) > QContasReceber_CabDT_Baixa.Value Then
                  QContasReceber_CabDT_Baixa.Value:=StrToDate(MEDataBaixa.Text);
               QContasReceber_CabInd_Situacao.Value:='BAIXA TOTAL';
               QContasReceber_CabVal_Juros.Value := 0;  // para não ficar residuos de juros no sistema
               QContasReceber_CabDT_Capitalizacao_Moeda.Value:=StrToDate(MEDataBaixa.Text);
               If DmParamSistema.QParamSistemaCOD_EMPRESA.value <> 'MOINHO' Then
               begin
                If StrToDate(MEDataBaixa.Text) > QContasReceber_CabDT_Capitalizacao.Value Then
                  QContasReceber_CabDT_Capitalizacao.Value:=StrToDate(MEDataBaixa.Text);
               end;
             End
            Else
              Begin
                If (wValor_Juro > 0) And (DmParamSistema.QParamSistemaCOD_EMPRESA.value <> 'MOINHO') Then
                  If StrToDate(MEDataBaixa.Text) > QContasReceber_CabDT_Capitalizacao.Value Then
                   Begin
                     QContasReceber_CabDT_Capitalizacao.Value := StrToDate(MEDataBaixa.Text);
                     QContasReceber_CabDT_Capitalizacao_Moeda.Value := StrToDate(MEDataBaixa.Text);
                   End;
                QContasReceber_CabInd_Situacao.Value:='BAIXA PARCIAL';
                If StrToDate(MEDataBaixa.Text) > QContasReceber_CabDT_Baixa.Value Then
                   QContasReceber_CabDT_Baixa.Value := StrToDate(MEDataBaixa.Text);
              End;
            QContasReceber_Cab.Post;
            QContasReceber_Cab.AutoCalcFields:=True;
            if not wBaixaEmLote then //quando for baixa em lote o commit é dado apenas ao fim de todas as baixas
              DMOracle.DBCemapa.Commit; // Fim da transação
          except
            If QContasReceberBaixaMov.State in [DsInsert,DsEdit] Then
               QContasReceberBaixaMov.Cancel;

            if not wBaixaEmLote then
              DMOracle.DBCemapa.RollBack;

            DMCaixa.QCaixa_Mov.AutoCalcFields:=True;
            DMBancoAgencia.QBancoMovimento.AutoCalcFields:=True;
            DMContasReceber.QContasReceberBaixaMov.EnableControls;
            QContasReceberBaixaMov.Close;
            QContasReceberBaixaMov.Open;
            raise;
          End;
          If  (
               (not wBaixaEmLote) or //se for baixa em lote nao emite o recibo,
               (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES') //apenas a aristides emite o recibo quando for baixa em lote
              )and
              (wRecibo='S') and
              (wValor_Baixa+wPagto_Juro>0) then
            Begin
              If DMParamSistema.QParamSistemaDESC_IMPRESSORA_RECIBO_CR.Value = 'TERMICA' Then
               Begin
                 pVal_Desconto := wValor_Desconto;
                 pVal_Juros := wPagto_Juro;
                 pVal_Pago := wValor_Baixa;
                 if (DMParamSistema.CodEmpresa = 'FRIGOPIES') then
                 begin
                   if (MessageDlg('Deseja imprimir o recibo?', mtConfirmation, [mbyes, mbNo], 0 ) = mryes) then
                      EmiteRecibo_Termica(wBaixaEmLote);  //CLEVERSON SOLICITOU MENSAGEM PARA IMPRESSÃO DO RECIBO(TERMICA) Junior 02/09/2019 suporte(12747)
                 end
                 else
                 if (DMParamSistema.CodEmpresa = 'DINGLIS') or (DMParamSistema.CodEmpresa = 'RADIO') then
//Caso de pgto não ser dinheiro precisa de 2 vias do recibo. Junior 27/03/2023 suporte(6981)-Adicionado Radiolandia 29/10/2026 Alex.
                 begin
                   if (MessageDlg('Deseja emitir 2 vias do recibo?', mtConfirmation, [mbyes, mbNo], 0 ) = mryes) then
                   begin
                     EmiteRecibo_Termica(wBaixaEmLote);
                     EmiteRecibo_Termica(wBaixaEmLote);
                   end
                   else
                     EmiteRecibo_Termica(wBaixaEmLote);
                 end
                 else
                   EmiteRecibo_Termica(wBaixaEmLote);

{                 if (DMParamSistema.CodEmpresa = 'FRIGOPIES') and (MessageDlg('Deseja imprimir o recibo?', mtConfirmation, [mbyes, mbNo], 0 ) = mryes) then
                     EmiteRecibo_Termica(wBaixaEmLote)  //CLEVERSON SOLICITOU MENSAGEM PARA IMPRESSÃO DO RECIBO(TERMICA) Junior 02/09/2019 suporte(12747)
                 else// if (DMParamSistema.CodEmpresa <> 'FRIGOPIES') then
                   EmiteRecibo_Termica(wBaixaEmLote);}
               End
              Else
                If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'RADIO') Then
                //---------------------------Emite Recibo--------------------------------
                 Begin
                  try
                   wNrParcelas := DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_CONTA_RECEBER_CAB',
                      'COD_FILIAL =' + QContasReceberBaixaCOD_FILIAL.Text + ' And COD_CADASTRO='+
                      QContasReceberBaixaCOD_CADASTRO.Text + ' And NUM_TITULO = '+QContasReceberBaixaNUM_TITULO.Text,True );
                   FRecibo_Dos.EmiteRecibo_Dos(Trim(DMContasReceber.QContasReceberBaixaCod_Cadastro.Text) + ' - ' + Trim(DMContasReceber.QContasReceberBaixaNome.Value),
                            DMContasReceber.QContasReceberBaixaNum_Titulo.Text + '-' +
                            DMContasReceber.QContasReceberBaixaNum_Parcela.Text + '/' + wNrParcelas ,
                            DMContasReceber.QContasReceberBaixaDt_Vencimento.Value,StrToDate(FContasReceberBaixa.MEDataBaixa.Text),
                            wValor_Baixa,wPagto_Juro,wValor_Desconto, DMContasReceber.QContasReceberBaixaCOD_FILIAL.Value,
                            DMContasReceber.QContasReceberBaixaDESC_FILIAL.Value, DMContasReceber.QContasReceberBaixaDESC_OBSERVACAO.Value,
                            DMContasReceber.QContasReceberBaixaDESC_ENDERECO.Text, DMContasReceber.QContasReceberBaixaDESC_CIDADE.Text);
                  except
                    on E: Exception do
                    begin
                      MessageDlg('Erro: ' + E.Message, mtError, [mbOK], 0);
                    end;
                  end;
                 End
                Else
                 //Para PAF deve imprimir na impressora fiscal
                 if (DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S') and
                    (DMContasReceber.QContasReceber_CabDESC_TIPO_DOCUMENTO.Value = 'CUP')then
                 begin
                  Indice := '04';
                  Descricao := 'Recebimento';
                  Bematech_FI_NomeiaTotalizadorNaoSujeitoIcms(04, pChar(Descricao));
                  //Abre cupom
                  cCPF             := copy(DMOracle.FastSelect('NUM_CGC_CPF','TB_CADASTRO',
                    'COD_CADASTRO = ' + QContasReceber_CabCOD_CADASTRO.Text),1,29);
                  cNomeCliente     := copy(DMOracle.FastSelect('NOME','TB_CADASTRO',
                    'COD_CADASTRO = ' + QContasReceber_CabCOD_CADASTRO.Text),1,30);
                  cEnderecoCliente := copy(DMOracle.FastSelect('DESC_ENDERECO','TB_CADASTRO',
                    'COD_CADASTRO = ' + QContasReceber_CabCOD_CADASTRO.Text),1,80);
                  iRetorno := Bematech_FI_AbreRecebimentoNaoFiscalMFD( pchar( cCPF ), pchar( cNomeCliente ), pchar( cEnderecoCliente ) );

                  //Efetua Recebimento
                  cValor := bib.LimpaString( MEValorBaixa.Text,'.');
                  cValor := FormatFloat('#0.00',StrToFloat(cValor));
                  iRetorno := Bematech_FI_EfetuaRecebimentoNaoFiscalMFD( pchar( Indice ), pchar( cValor ) );

                  //Inicia Fechamento
                  cAcresDesc     := 'D';
                  cTipoAcresDesc := '%';
                  cValorAcres    := '0000';
                  cValorDesc     := '0000';
                  iRetorno := Bematech_FI_IniciaFechamentoRecebimentoNaoFiscalMFD( pchar( cAcresDesc ),
                  pchar( cTipoAcresDesc ), pchar( cValorAcres ), pchar( cValorDesc ) );

                  cTipoPagamento := 'DINHEIRO';
//                //Efetua forma pagamento
                  iRetorno := Bematech_FI_EfetuaFormaPagamento(pchar(cTipoPagamento), pchar(cValor));

                  //Fechamento
                  cMsgPromocional := '';
                  iRetorno := Bematech_FI_FechaRecebimentoNaoFiscalMFD( pchar( cMsgPromocional ) );

                  //Insere nos demais documentos ECF
                  FImpressoraFiscal.InsereDemaisDocumentos('CN',
                       DMContasReceber.QContasReceberBaixaCOD_NOTA_CAB.Value,
                       StrToFloat(cValor));
                 end
                else
                 begin
                   If FEmiteRecibo=Nil then
                     FEmiteRecibo:=TFEmiteRecibo.Create(Application);
                   FEmiteRecibo.LCadastro.Caption:='Cliente';
                   FEmiteRecibo.MECodConta.Text:=FloatToStr(DMContasReceber.QContasReceberBaixaCod_Conta_Receber_Cab.Value);
                   FEmiteRecibo.MENrTitulo.Text:=FloatToStr(DMContasReceber.QContasReceberBaixaNum_Titulo.Value);
                   FEmiteRecibo.MEParcela.Text:=FloatToStr(DMContasReceber.QContasReceberBaixaNum_Parcela.Value);
                   FEmiteRecibo.MEFornecedor.Text:=DMContasReceber.QContasReceberBaixaNome.Value;
                   FEmiteRecibo.MEValor.Text:=FloatTostr(wValor_Baixa - wValor_Desconto);
                   FEmiteRecibo.MEJuros.Text:=FloatTostr(wPagto_Juro);
                   FEmiteRecibo.MEDesconto.Text:=FloatTostr(wValor_Desconto);
                   FEmiteRecibo.MEData.Text:=FContasReceberBaixa.MEDataBaixa.Text;
                   FEmiteRecibo.MECodFilial.Text:=FloatToStr(DMContasReceber.QContasReceberBaixaCod_Filial.Value);
                   FEmiteRecibo.MeSaldoTitulo.Text:=DMContasReceber.QContasReceber_CabVal_Titulo.Text;
                   FEmiteRecibo.MeDescricao.Text := DMContasReceber.QContasReceber_CabInd_Situacao.Value + ' - '+Trim(MeObservacao.Text);
                   FEmiteRecibo.MeFormaPagamento.Text := RGFormaPagto.Items[RGFormaPagto.ItemIndex] + ' ' + MEBanco.Text + ' ' + MECodContaCorrente.Text;
                   DMFilial.QFilial.Close;
                   DMFilial.QFilial.SetVariable('PK',DMContasReceber.QContasReceberBaixaCod_Filial.Value);
                   DMFilial.QFilial.Open;
                   if TForm(Sender).Name = 'FDevolucaoTroca' then
                     FEmiteRecibo.BitBtn1Click(Self) //Imprime o recibo sem mostrar a tela
                   else
                     FEmiteRecibo.ShowModal;
                 end;
            End;
          If DmParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ENCOPEL' Then
            If (not wBaixaEmLote) and //quando é baixa em lote nao emite autenticacao.
               (MessageDlg('Fazer Autenticação em Documento?',
                           mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
             Begin
               if Imp = Nil Then
                  Imp := TImp.Create;
               Imp.AbreImpressora;
               Imp.WriteXY(0,1,DateToStr(Date) + ' - ' + Bib.NumToTexto(wValor_Baixa - wValor_Desconto,2,7) + ' - '+IntToStr(DmUsuario.CodUsuarioCorrente));
               Imp.FechaImpressora;
             End;

            // dar um refresh na tabela de ContasReceberBaixa
          wCodigo:=QContasReceberBaixaCod_Conta_Receber_Cab.Value;
          QContasReceberBaixa.DisableControls;
          QContasReceberBaixa.Close;
          QContasReceberBaixa.Open;
          QContasReceberBaixa.Locate('COD_CONTA_RECEBER_Cab',wCodigo,[]);
          QContasReceberBaixa.EnableControls;
          // Limpa os Campos Mask Edit
          QContasReceberBaixaMov.Close;
          QContasReceberBaixaMov.Open;
          MEValorBaixa.Clear;
          MEValorDesconto.Clear;
          MEValorJuro.Clear;
          MeValorOutros.Clear;
          MeBaixaJuro.Clear;
          MEObservacao.Clear;
          MEBanco.Clear;
          MECodContaCorrente.Clear;
          MENumCheque.Clear;
          MEVariacaoPos.Clear;
          MEVariacaoNeg.Clear;
          MeDevolucao.Clear;
          MECodAdiantamento.Clear;
          MEAdiantamento.Clear;
          ChDevolucao.Checked := False;
          ChTroca.Checked := False;
          MeValorCheque.Text := '';
          MeHistoricoCheque.Text :='';

          If not wBaixaEmLote then
          Begin
            PCBaixa.ActivePage:=TS0Localiza;
            if Self.Visible then
              MeDtBaixa.SetFocus;
          End;
        End //  End If
      Else
         ShowMessage('Erro! Valores incorretos na Baixa. Valores Negativos não podem ser gerados, favor verificar.');
    End; // End With
    DMOracle.Audit( TOracleDataset1 (DMContasReceber.QContasReceber_Cab), 'Baixa Titulo');
    DMCaixa.QCaixa_Mov.AutoCalcFields:=True;
    DMBancoAgencia.QBancoMovimento.AutoCalcFields:=True;
    DMContasReceber.QContasReceberBaixaMov.EnableControls;
    If StrToDate(MeDtBaixa.Text) <> Date Then
    Begin
      MeDtBaixa.Text := DateToStr(Date);
      If not wBaixaEmLote then
        MeDtBaixaExit(Self);
    End;
end;

procedure TFContasReceberBaixa.SpeedButton1Click(Sender: TObject);
begin
  if FCadastrocons = Nil then
    FCadastrocons:=TFCadastrocons.Create(Application);
  If FCadastrocons.ShowModal=MrOk then
     MECodCliente.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
  MECodClienteExit(Self);
end;

procedure TFContasReceberBaixa.FormCreate(Sender: TObject);
var i : integer;
begin
{  if (DMParamSistema.CodEmpresa = 'JASOL') then
  begin
    TsReparcelamento.Enabled := False;
    TsReparcelamento.TabVisible := False;
  end;} //João solicitou a liberação da baixa em lote 21/07/2022.


{  PCBaixa.ActivePage:=TS0Localiza;
  With DMContasReceber do
    Begin}
//  MEDataVencInicial.Text:=DateToStr(DMOracle.DataServ-10);
//  MEDataVencFinal.Text:=DateToStr(DMOracle.DataServ+4);
 {     QContasReceberBaixa.Close;
      QContasReceberBaixa.ParamByName('DT_VENC_INI').AsDate:=DMOracle.DataServ-10;
      QContasReceberBaixa.ParamByName('DT_VENC_FINAL').AsDate:=DMOracle.DataServ+4;
      QContasReceberBaixa.ParamByName('VAL_TITULO').AsFloat:=0;
      QContasReceberBaixa.Open;
      QContasReceberBaixaMov.Close;
      QContasReceberBaixaMov.Open;
    End;
  With DMCaixa do
    Begin
      QCaixa_mov.Close;
      QCaixa_mov.Open;
    End;
  With DMBancoAgencia do
    Begin
      QBancoMovimento.Close;
      QBancoMovimento.Open;
    End;}

end;

procedure TFContasReceberBaixa.SpeedButton8Click(Sender: TObject);
begin
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    MECodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFContasReceberBaixa.SBNotaEntradaConsClick(Sender: TObject);
begin
  If FNotaEntradaConsulta = Nil Then
    FNotaEntradaConsulta:=TFNotaEntradaConsulta.Create(Application);
  With DMContasReceber Do
  Begin
    FNotaEntradaConsulta.MeTexto.Text := QContasReceberBaixaCod_Cadastro.Text;
    FNotaEntradaConsulta.EdOrdemCompra.Text := QContasReceberBaixaCod_Ordem_Compra_Cab.Text;
    QNotaEntradaCons.Close;
    QNotaEntradaCons.SetVariable('COD_ORDEM_COMPRA_CAB',QContasReceberBaixaCod_Ordem_Compra_Cab.Value);
    QNotaEntradaCons.Open;
  End;
  If FNotaEntradaConsulta.ShowModal=MrOk then
     MECodNota.Text:=IntToStr(DMContasReceber.QNotaEntradaConsCod_Nota_Cab.Value);
  DMContasReceber.QNotaEntradaCons.Close;
end;

procedure TFContasReceberBaixa.MECodClienteExit(Sender: TObject);
Var wValor : String;
begin
  If Trim(MECodCliente.Text) <> '' then
   Begin
     if DMParamSistema.CodEmpresa <> 'RETIFOZ' Then  // colocado César 18/01/2020
      Begin
        MeDataVencInicial.Clear;
        MeDataVencFinal.Clear;
      End;
     Metexto.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodCliente.text);
     wValor:=DMOracle.BuscaNome('SELECT SUM(VAL_TITULO) FROM TB_CONTA_PAGAR_CAB','IND_SITUACAO <> ' + CHR(39) + 'BAIXA TOTAL' + CHR(39) + ' AND COD_CADASTRO = '+MECodCliente.text);
     If wValor <> '' then
        showMessage ('Cliente Possui Titulos a Pagar em Aberto  R$ ' + wValor);

   End
  Else
    MEtexto.Clear;
  If Trim(MECodCliente.Text) <> '' Then
     SBProcuraClick(Self);

  if (DMParamSistema.CodEmpresa = 'RACOESIGUA') or (DMParamSistema.CodEmpresa = 'FURGOESMED') or
     (DMParamSistema.CodEmpresa = 'FURGMED') Then   //Vanessa 20/06/2017
    CbCalculoJuros.Checked := false;

end;

procedure TFContasReceberBaixa.MeValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = ',' Then
     Key := '.';
end;

procedure TFContasReceberBaixa.Sb1FinalidadeClick(Sender: TObject);
begin
  If FFinalidadeCons=Nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal=mrOk then
    MeFinalidade.Text:=FloatToStr(DMFinalidade.QFinalidadeConsCod_Finalidade.Value);

end;

procedure TFContasReceberBaixa.SbHistoricoDescontoClick(Sender: TObject);
begin
  If FHistoricoCons = Nil Then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=MrOk then
     MeHistoricoDesconto.Text:=DMHistorico.QHistoricoConsCod_Historico.Text;
end;

procedure TFContasReceberBaixa.MECodClienteChange(Sender: TObject);
begin
  If Trim(MECodCliente.Text) <> '' then
    MEDtBaixa.Text := DateToStr(DMOracle.DataServ);
  CbCalculoJuros.Checked := True;
end;

procedure TFContasReceberBaixa.RG2FormaPagtoClick(Sender: TObject);
begin
  If (RG2FormaPagto.ItemIndex = 0) Or    // Pgto. em Dinheiro
     (RG2FormaPagto.ItemIndex = 2) Or    // Pgto. outros so contabil
     (RG2FormaPagto.ItemIndex = 3) Or    // Pgto. Crédito
     (RG2FormaPagto.ItemIndex = 4) then  // Pgto. Débito
  Begin
    SB2ConsContaCorrente.Enabled := False;
    ME2Banco.Clear;
    ME2CodContaCorrente.Clear;
    ME2NumCheque.Clear;
    SB2Baixa.Enabled := True;
  End
  Else                              // Pagto. em Cheque
  Begin
    if DMParamSistema.CodEmpresa = 'DINGLIS' then //Puxar automático Banco,CC. Junior 07/11/2023. Suporte{8242}
    begin
      ME2Banco.Text := 'PIX';
      ME2CodContaCorrente.Text := '1';
      ME2NumCheque.Text:=DMContasReceber.QContasReceberBaixaNUM_TITULO.Text
    end;
    If ME2Banco.Text = '' then
      SB2Baixa.Enabled := False
    Else
      SB2Baixa.Enabled := True;
    SB2ConsContaCorrente.Enabled := True;
  End;
{Bloco criado para informar a bandeira do cartão quando estiver habilitado o controle de cartão na filial. Alex 28/11/2023}
    If ( (RG2FormaPagto.ItemIndex = 3) or (RG2FormaPagto.ItemIndex = 4) ) and (DMParamSistema.QParamSistemaIND_CONTROLE_CARTAO.Value = 'S') then
    begin
      RgBandeira1.Enabled := True;
      RgBandeira1.Visible := True;
    end
    else
    begin
      RgBandeira1.Enabled := False;
      RgBandeira1.Visible := False;
    end;
end;

procedure TFContasReceberBaixa.SB2ConsContaCorrenteClick(Sender: TObject);
begin
  If FContaCorrenteCons = Nil Then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.ShowModal = MrOk then
  Begin
    ME2Banco.Text := DMBancoAgencia.QContaCorrenteConsDesc_Banco_Agencia.Value;
    ME2CodContaCorrente.Text := FloatToStr(DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value);
    ME2NumCheque.Text := FloatToStr(DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value);
    SB2Baixa.Enabled := True;
  End;
end;

procedure TFContasReceberBaixa.SB2BaixaClick(Sender: TObject);
var
  i, cont, wCodFilial : integer;
  wRecibo, wDescFilial : String;
begin
  if MessageDlg('Deseja realmente baixar todos os itens selecionados', mtConfirmation, [mbyes, mbNo], 0 ) = mryes then
  begin
    cont := 0;
    DMContasReceber_Rel.cdsRContasReceberBaixaLote.Open; //Abre a Query em Memória para inserção de Dados.
    try
      DMOracle.DBCemapa.StartTransaction;

      DMContasReceber.cdContasReceberBaixaLote.First;
      while not DMContasReceber.cdContasReceberBaixaLote.Eof do
      begin
        if DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value = 'S' then
        begin
        if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'KREUZ')         and
          (DMContasReceber.QContasReceber_CabIND_ENVIADO_BANCO.Text = 'SIM') and
          (DMContasReceber.QContasReceber_CabCOD_CONTA_CORRENTE.Text <> '')  and
          (RG2FormaPagto.ItemIndex <> 1)) then
          begin
            raise Exception.Create('Título com boleto bancário, baixar somente via Banco.');
            break;
          end;

          cont := cont + 1;

          if DMContasReceber.QContasReceberBaixa.Locate('COD_CONTA_RECEBER_CAB',DMContasReceber.cdContasReceberBaixaLoteCOD_CONTA_RECEBER_CAB.Value,[]) then
          begin
            if trim(ME2DataBaixa.Text) = '' then
              ME2DataBaixa.Text := dateToStr(DMOracle.DataServ);

            if DMContasReceber.QContasReceberBaixaDT_EMISSAO.Value > StrToDateTime(Me2DataBaixa.Text + ' 23:59:59') then
              Raise Exception.Create('A data da baixa é menor que a data da emissão do titulo ' +
                                     DMContasReceber.QContasReceberBaixaCOD_CONTA_RECEBER_CAB.Text);

            RGFormaPagto.ItemIndex  := RG2FormaPagto.ItemIndex;
            MEBanco.Text            := ME2Banco.Text;
            MECodContaCorrente.Text := ME2CodContaCorrente.Text;
            MENumCheque.Text        := ME2NumCheque.Text;
            RgBandeira.ItemIndex    := RgBandeira1.ItemIndex;
            FmDepartamento1.MeDepartamento.Text := FmDepartamento2.MeDepartamento.Text;
            DMContasReceber.QContasReceberBaixaMov.Close;
            DMContasReceber.QContasReceberBaixaMov.SetVariable('COD_CONTA_RECEBER_CAB', DMContasReceber.cdContasReceberBaixaLoteCOD_CONTA_RECEBER_CAB.Value);
            DMContasReceber.QContasReceberBaixaMov.Open;

            MEDataBaixa.Text := ME2DataBaixa.Text;
            MeValorJuro.Text := '0';
            MEValorBaixa.Text := FloatToStr(DMContasReceber.QContasReceberBaixaVal_Titulo.Value);
            MeValorDesconto.Text := DMContasReceber.cdContasReceberBaixaLoteVAL_DESCONTO_ALTERAR.Text;

            MeValorBaixa.Text := FloatToStr(dmcontasReceber.QContasReceberBaixaVal_Titulo.Value + DMContasReceber.cdContasReceberBaixaLoteVAL_JURO_ALTERAR.Value);

            If DMContasReceber.cdContasReceberBaixaLoteVAL_JURO_ALTERAR.Value > 0 Then
            Begin
              MeValorJuro.Text := FloatToStr(DMContasReceber.cdContasReceberBaixaLoteVAL_JURO_ALTERAR.Value);
              MeBaixaJuro.Text := MeValorJuro.Text;
            End;

            if DMContasReceber.cdContasReceberBaixaLoteVAL_DESCONTO_ALTERAR.Value > 0 then
            begin
              MEValorDesconto.Text := FloatToStr(DMContasReceber.cdContasReceberBaixaLoteVAL_DESCONTO_ALTERAR.Value);
            end;

            if DMOracle.BuscaNome('SELECT IND_RECIBO FROM TB_FINALIDADE','COD_FINALIDADE = '+FloatToStr(DMContasReceber.QContasReceberBaixaCOD_FINALIDADE.Value)) = 'S' then
            begin
              wRecibo := 'S';

              //Eliminar o Juro do Recibo de Baixa em Lote - 12/03/2008 - Camila.
              If MEValorDesconto.Text = '' Then
                 MEValorDesconto.Text := '0';

              If MeBaixaJuro.Text = '' Then
              begin
                MeBaixaJuro.Text     := '0';
                MEValorJuro.Text     := '0';
              end;

              wCodFilial := DMContasReceber.QContasReceberBaixaCOD_FILIAL.Value;  //guarda a filial para imprimir no recibo
              wDescFilial := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ DMContasReceber.QContasReceberBaixaCOD_FILIAL.Text);
              //Adiciona na Query em Memória a Conta a Receber para Gerar o Recibo em Lote - 14/01/2008 - Camila.
              AddDadosReciboLote(DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ DMContasReceber.QContasReceberBaixaCOD_CADASTRO.Text), //nomeCliente
                                 DMContasReceber.QContasReceberBaixaNUM_TITULO.AsInteger,  //numDuplicata
                                 DMContasReceber.QContasReceberBaixaNUM_PARCELA.Value, //numParcela
                                 DMContasReceber.QContasReceberBaixaVAL_TITULO.Value,  //valPrincipal
                                 StrToFloat(MEValorJuro.Text),                         //valJuros
                                 StrToFloat(MEValorBaixa.Text) - StrToFloat(MeBaixaJuro.Text) - StrToFloat(MEValorDesconto.Text),   //valPrincipalRecebido
                                 StrToFloat(MeBaixaJuro.Text),                         //valJurosRecebido
                                 StrToFloat(MEValorDesconto.Text),                     //valDesconto
                                 StrToFloat(MEValorBaixa.Text) - StrToFloat(MEValorDesconto.Text), //valRecebido = valPrincipalRecebido + valJurosRecebido - valDesconto
                                 ((DMContasReceber.QContasReceberBaixaVAL_TITULO.Value + StrToFloat(MEValorJuro.Text)) - (StrToFloat(MEValorBaixa.Text) )), //valPendente  = (valPrincipal + valJuros) - (valPrincipalRecebido + valJurosRecebido - valDesconto)
                                 DMContasReceber.QContasReceberBaixaDT_VENCIMENTO.Value,
                                 DMContasReceber.QContasReceberBaixaCOD_FILIAL.Value,
                                 DMContasReceber.QContasReceberBaixaCOD_CADASTRO.Value);
            End;
            MeHistoricoDesconto.Text := DMContasReceber.QContasReceberBaixaCOD_HISTORICO_DESC.Text;
            SBBaixaClick(Sender); //executa o codigo responsavel pela baixa de cada item
          end;
        end;
        DMContasReceber.cdContasReceberBaixaLote.Next;
      end;

      //--Commit na baixa antes da impressao do recibo para o usuário ter certeza que baixou. Vanessa 30/12/2013
      try
        DMOracle.DBCemapa.Commit;
        except
          DMOracle.DBCemapa.Rollback;
          MessageDlg('Baixa Não Foi Realizada Com Sucesso', mtInformation, [mbok], 0 );
        raise;
      end;
      //--

      If wRecibo = 'S' then
      begin
        //colocar aqui a chamada dos recibos.
        If DMParamSistema.QParamSistemaDESC_IMPRESSORA_RECIBO_CR.Value = 'TERMICA' Then
        //   EmiteRecibo_Termica(True)
        begin
          if (DMParamSistema.CodEmpresa = 'DINGLIS') or (DMParamSistema.CodEmpresa = 'DONABENTA') or (DMParamSistema.CodEmpresa = 'RADIO') then
//Caso de pgto não ser dinheiro precisa de 2 vias do recibo. Junior 27/03/2023 suporte(6981) -  Adicionado Radiolandia - Alex 29/10/2026
          begin
            if (MessageDlg('Deseja emitir 2 vias do recibo?', mtConfirmation, [mbyes, mbNo], 0 ) = mryes) then
            begin
              EmiteReciboLoteTermica(1);
              EmiteReciboLoteTermica(1);
            end
            else
              EmiteReciboLoteTermica(1);
          end
          else
            EmiteReciboLoteTermica(1) // Recibo em lote imprime apenas 30cm. Criei relatório para resolver o problema. 07/12/2022 - Junior.
        end
        Else
          if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL' then
            EmiteReciboLote('Cerealista Grasel',1)
          Else
            if DMParamSistema.QParamSistemaCod_Empresa.Value = 'INSIDE' then
              EmiteReciboLote('Inside',1)
            Else
              if DMParamSistema.QParamSistemaCod_Empresa.Value = 'DISPART' then
                EmiteReciboLote('Dispart',1)
              Else
                if DMParamSistema.QParamSistemaCod_Empresa.Value = 'NIR' then
                  EmiteReciboLote('Cemapa Informatica',1)
                Else
                  //EmiteReciboLote(DMParamSistema.QParamSistemaDesc_Empresa.Value, wCodFilial);
                  EmiteReciboLote(wDescFilial, wCodFilial);
      end;

      DMContasReceber_Rel.cdsRContasReceberBaixaLote.EmptyDataSet; //Limpa os Dados da Baixa Anterior.
      DMContasReceber_Rel.cdsRContasReceberBaixaLote.Close; //Fecha a Query em Memória.
      //DMOracle.DBCemapa.Commit;  //Comentado para dar commit antes de gerar o recibo. Vanessa 30/12/2013

      if (cont > 0 ) then
        MessageDlg('Baixa feita com sucesso', mtInformation, [mbok], 0 )
      else
        MessageDlg('Selecione um ou mais títulos', mtInformation, [mbok], 0 );

      RG2FormaPagto.ItemIndex := 0;
      ME2Banco.Clear;
      ME2CodContaCorrente.Clear;
      ME2NumCheque.Clear;

      PCBaixa.ActivePage := TS0Localiza;
      SbProcura.Click;
    except
      DMOracle.DBCemapa.Rollback;
      MessageDlg('Impressão Não Foi Realizada Com Sucesso', mtInformation, [mbok], 0 );
      //copiado aqui para caso algum erro ocorra, aconteça o fechamento do dataset
      DMContasReceber_Rel.cdsRContasReceberBaixaLote.EmptyDataSet; //Limpa os Dados da Baixa Anterior.
      DMContasReceber_Rel.cdsRContasReceberBaixaLote.Close; //Fecha a Query em Memória.
      raise;
    end;
  end;
end;
//------------------------------------------------------------
procedure TFContasReceberBaixa.AddDadosReciboLote(nomeCliente:String;
                                                  numDuplicata, numParcela:integer;
                                                  valPrincipal, valJuros, valPrincipalRecebido, valJurosRecebido, valDesconto, valRecebido, valPendente:double;
                                                  dt_vencimento : TDateTime;
                                                  cod_filial, cod_cadastro : integer);
begin
  with DMContasReceber_Rel do
  begin
    cdsRContasReceberBaixaLote.Insert;
    cdsRContasReceberBaixaLotenome_cliente.Value           := nomeCliente;
    cdsRContasReceberBaixaLotenum_duplicata.Value          := numDuplicata;
    cdsRContasReceberBaixaLotenum_parcela.Value            := numParcela;
    cdsRContasReceberBaixaLoteval_principal.Value          := valPrincipal;
    cdsRContasReceberBaixaLoteval_juros.Value              := valJuros;
    cdsRContasReceberBaixaLoteval_principal_recebido.Value := valPrincipalRecebido;
    cdsRContasReceberBaixaLoteval_juros_recebidos.Value    := valJurosRecebido;
    cdsRContasReceberBaixaLoteval_desconto.Value           := valDesconto;
    cdsRContasReceberBaixaLoteval_recebido.Value           := valRecebido;
    cdsRContasReceberBaixaLoteval_pendente.Value           := valPendente;
    cdsRContasReceberBaixaLoteDt_Vencimento.Value          := dt_vencimento;
    cdsRContasReceberBaixaLoteCod_Filial.Value             := cod_filial;
    cdsRContasReceberBaixaLoteCod_Cadastro.Value           := cod_cadastro;
    cdsRContasReceberBaixaLote.Post;
  end;
end;
//------------------------------------------------------------
procedure TFContasReceberBaixa.EmiteReciboLote(logo:String; wCodFilial : integer);
begin
  if FRReciboLote = Nil then
   FRReciboLote := TFRReciboLote.Create(Application);
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' Then
     FRReciboLote.QRPrimario.Height := 1056;

  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK', wCodFilial);
  DMFilial.QFilial.Open;

  //Dados Recibo
  //-----------------------------------
  FRReciboLote.QRLLogo.Caption                  := logo;
  FRReciboLote.QRLRazaoSocial.Caption           := DMFilial.QFilialDESC_FILIAL.Text;
//  FRReciboLote.QRLRazaoSocialAssinatura.Caption := DMFilial.QFilialDESC_FILIAL.Text;
  FRReciboLote.QRLEndereco.Caption              := DMFilial.QFilialDESC_ENDERECO.Text;
  FRReciboLote.QRLFoneFax.Caption               := 'FONE: ' + DMFilial.QFilialDESC_TELEFONE.Text + ' FAX: ' + DMFilial.QFilialDESC_FAX.Text;
  FRReciboLote.QRLCepCidadeEstado.Caption       := DMFilial.QFilialDESC_CEP.Text + ' ' + DMFilial.QFilialDESC_CIDADE.Text + ' - ' + DMFilial.QFilialCOD_ESTADO.Text;
  FRReciboLote.QRLCnpjIe.Caption                := 'CNPJ: ' + DMFilial.QFilialNUM_CGC.Text + ' IE: ' + DMFilial.QFilialDESC_INSCRICAO.Text;
  FRReciboLote.QRLDataCidade.Caption            := FormatDateTime('dd "de" mmmm "de" yyyy', StrToDateTime(MEDataBaixa.Text)) + ' , ' + DMFilial.QFilialDESC_CIDADE.Text;
  //-----------------------------------
  //Mostra o Relatório
  //-----------------------------------
  FRReciboLote.QRPrimario.Preview;
  //-----------------------------------
end;

procedure TFContasReceberBaixa.EmiteReciboLoteTermica(wCodFilial : integer);
var wIndexImpressoraPadrao: Integer;
    wNrParc: String;
begin
  if FRReciboLoteTermica = Nil then
   FRReciboLoteTermica := TFRReciboLoteTermica.Create(Application);

  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK', wCodFilial);
  DMFilial.QFilial.Open;

  //Dados Recibo
  //-----------------------------------
  FRReciboLoteTermica.QRLRazaoSocial.Caption           := DMFilial.QFilialDESC_FILIAL.Text;
  FRReciboLoteTermica.QRLEndereco.Caption              := 'End.: ' + DMFilial.QFilialDESC_ENDERECO.Text;
  FRReciboLoteTermica.QRLFoneFax.Caption               := 'FONE: ' + DMFilial.QFilialDESC_TELEFONE.Text;
  FRReciboLoteTermica.QRLDataCidade.Caption            := 'Data Pagamento: ' +FormatDateTime('dd/mm/yyyy', StrToDateTime(MEDataBaixa.Text));
  //-----------------------------------
  wIndexImpressoraPadrao := Printer.PrinterIndex;
  if DMUsuario.ImpressoraPadraoNFCe <> '' then
  begin
  if pos('\\', DMUsuario.ImpressoraPadraoNFCe) > 0 then
    Printer.PrinterIndex :=
    Printer.Printers.IndexOf(Bib.PegaImpressoraPorNomeRede(DMUsuario.ImpressoraPadraoNFCe))
  else
    Printer.PrinterIndex := Printer.Printers.IndexOf(DMUsuario.ImpressoraPadraoNFCe);
  end;
  FRReciboLoteTermica.QRPrimario.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
  FRReciboLoteTermica.QRPrimario.Print;

  //Mostra o Relatório
  //-----------------------------------
//FRReciboLoteTermica.QRPrimario.Preview;
  //-----------------------------------
end;

//------------------------------------------------------------
procedure TFContasReceberBaixa.TsBaixaLoteEnter(Sender: TObject);
begin
//  if trim(ME2DataBaixa.Text) = '' then
//    ME2DataBaixa.Text := datetostr(DMOracle.DataServ);
end;

procedure TFContasReceberBaixa.SbBancoConsClick(Sender: TObject);
begin
  If FBancosCons=Nil then
    FBancosCons:=TFBancosCons.Create(Application);
  If FBancosCons.ShowModal=mrOk then
    MEBanco_Baixa.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value);

end;

procedure TFContasReceberBaixa.MEDataVencFinalExit(Sender: TObject);
begin
  If Trim(MECodCliente.Text) <> '' Then
    SBProcuraClick(Self);
end;

procedure TFContasReceberBaixa.AcCadastroExecute(Sender: TObject);
begin
  SpeedButton1.Click;
end;

procedure TFContasReceberBaixa.AcPosicionCadastroExecute(Sender: TObject);
begin
  MeCodCliente.SetFocus;
end;

procedure TFContasReceberBaixa.SbProcuraNotaClick(Sender: TObject);
var
 x, y: array of string;
begin

  If DMContasReceber.QContasReceberBaixaCod_Nota_Cab.Text <> '' Then
   Begin
     setLength(x, 3); //4 sql diferentes
     setLength(y, 3);

     x[0] := 'SELECT COD_VENDEDOR FROM TB_NOTA_CAB WHERE COD_NOTA_CAB =  '+DMContasReceber.QContasReceberBaixaCod_Nota_Cab.Text;
     x[1] := 'SELECT DT_EMISSAO FROM TB_NOTA_CAB WHERE COD_NOTA_CAB =  '+DMContasReceber.QContasReceberBaixaCod_Nota_Cab.Text;
     x[2] := 'SELECT COD_PRAZO_VENCIMENTO FROM TB_NOTA_CAB WHERE COD_NOTA_CAB =  '+DMContasReceber.QContasReceberBaixaCod_Nota_Cab.Text;

     DMOracle.BuscaNomes(x, y);
     DMNotaSaida.QItemNfCons.Close;
     DMNotaSaida.QItemNfCons.SetVariable('Cod_Nota_Cab',DMContasReceber.QContasReceberBaixaCod_Nota_Cab.Value);
     DMNotaSaida.QItemNfCons.Open;
     If FNotaItensCons = Nil Then
        FNotaItensCons := TFNotaItensCons.Create(application);
     FNotaItensCons.MeTexto.Text := Y[1];
     FNotaItensCons.MeVendedor.Text := Y[0];
     FNotaItensCons.MePagto.Text := Y[2];

     FNotaItensCons.ShowModal;
   End;
end;

procedure TFContasReceberBaixa.SbAlteraObsClick(Sender: TObject);
var wObs,wComando : string;
    wClickedOK: Boolean;
begin
  wobs := DMContasReceber.QContasReceberBaixaDesc_Observacao.Value;
  wClickedOK := InputQuery('Entre C/Msg', 'Prompt', wObs);
  if wClickedOK then
   Begin
     With DMOracle do
     Begin
       QExecSQL.Close;
       QExecSQL.SQL.Clear;
       wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET DESC_OBSERVACAO=' + Chr(39) + wObs + Chr(39);
       wComando := wComando + ' WHERE COD_CONTA_RECEBER_CAB = '+FloatToStr(DMContasReceber.QContasReceberBaixaCOD_CONTA_RECEBER_CAB.Value);
       QExecSQL.SQL.Add(wComando);
       QExecSQL.ExecSQL;
     End;
     DMOracle.DBCemapa.Commit;
   End;
end;


procedure TFContasReceberBaixa.SBAdiantamentoClick(Sender: TObject);
begin
  if FAdiantamentoCons = nil then
    FAdiantamentoCons := TFAdiantamentoCons.create(application);

  FAdiantamentoCons.MECadastro.Text := DMContasReceber.QContasReceberBaixaCOD_CADASTRO.Text;
  FAdiantamentoCons.MECadastroExit(Sender);
  FAdiantamentoCons.MeDtInicial.Text := DateToStr(Date - 300);
  FAdiantamentoCons.MeDtFinal.Text := DateToStr(Date);
  FAdiantamentoCons.RgTipoAdiantamento.ItemIndex := 0;
  FAdiantamentoCons.BtProcurar.Click;

  if FAdiantamentoCons.showmodal = mrok then
  begin
    MECodAdiantamento.text := DMAdiantamento.QAdiantamentoConsCOD_ADIANTAMENTO.Text;
    MECodAdiantamentoExit(Sender);
  end;

end;

procedure TFContasReceberBaixa.MECodAdiantamentoExit(Sender: TObject);
begin

  //somente um dos busca_nome vai retornar alguma coisa, o outro sempre trará ''
  if Trim(MECodAdiantamento.Text) <> '' then
    MEAdiantamento.Text := DMOracle.BuscaNome('SELECT NUM_DOCUMENTO FROM TB_CAIXA_MOV T1, TB_ADIANTAMENTO T2',
                                              'T1.COD_CAIXA_MOV = T2.COD_CAIXA_MOV AND '+
                                              'T2.COD_ADIANTAMENTO = ' + trim(MECodAdiantamento.Text))+
                           DMOracle.BuscaNome('SELECT NUM_CHEQUE FROM TB_BCO_MOVIMENTO T1, TB_ADIANTAMENTO T2',
                                              'T1.COD_BCO_MOVIMENTO = T2.COD_BCO_MOVIMENTO AND '+
                                              'T2.COD_ADIANTAMENTO = ' + trim(MECodAdiantamento.Text))
  else
    MEAdiantamento.Text := '';

end;

procedure TFContasReceberBaixa.MeDtBaixaExit(Sender: TObject);
begin
  If (Trim(MeCodCliente.Text) <> '') Or
     ((Trim(MEDataVencInicial.Text) <> '/  /') And (Trim(MEDataVencInicial.Text) <> '')) Then
     SBProcuraClick(Self);

end;

procedure TFContasReceberBaixa.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Column.Title.Caption = 'X') then
  begin DBGrid3.Canvas.FillRect(Rect);
    if DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value = 'S' then
      ImageList1.Draw(DBGrid3.Canvas, Rect.Left + 5, Rect.Top + 1, 1)
     else
      ImageList1.Draw(DBGrid3.Canvas, Rect.Left + 5, Rect.Top + 1, 0);
    end;
end;

procedure TFContasReceberBaixa.DBGrid3CellClick(Column: TColumn);
begin
  if Column.Title.Caption = 'X' then
  Begin
    Atualiza_Baixa_Lote(DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value);  // procedure
    DBGrid3.SelectedIndex := DBGrid3.SelectedIndex + 1;
  End;
end;

procedure TFContasReceberBaixa.DBGrid3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_space then
  Begin
    CalculaDescontoPorDia;
    Atualiza_Baixa_Lote(DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value);  // procedure
    Abort;
  End;
end;

procedure TFContasReceberBaixa.SpeedButton2Click(Sender: TObject);
begin
  MeComJuros.Text := '0';
  MeComJurosReparcelamento.Text := '0';
  MeSemJuros.Text := '0';
  MeSemJurosReparcelamento.Text := '0';
  DMContasReceber.cdContasReceberBaixaLote.First;
  while not DMContasReceber.cdContasReceberBaixaLote.Eof do
  Begin
    Atualiza_Baixa_Lote('N');  // procedure
    DMContasReceber.cdContasReceberBaixaLote.Next;
  End;

  DMContasReceber.cdContasReceberBaixaLote.First;
end;

procedure TFContasReceberBaixa.SpeedButton3Click(Sender: TObject);
begin
  DMContasReceber.cdContasReceberBaixaLote.First;
  while not DMContasReceber.cdContasReceberBaixaLote.Eof do
  Begin
    Atualiza_Baixa_Lote('S');  // procedure
    DMContasReceber.cdContasReceberBaixaLote.Next;
  End;

  DMContasReceber.cdContasReceberBaixaLote.First;
  MeComJuros.Text := '0';
  MeComJurosReparcelamento.Text := '0';
  MeSemJuros.Text := '0';
  MeSemJurosReparcelamento.Text := '0';
end;

procedure TFContasReceberBaixa.SpeedButton4Click(Sender: TObject);
begin
  DMContasReceber.cdContasReceberBaixaLote.First;
  while not DMContasReceber.cdContasReceberBaixaLote.Eof do
  Begin
    Atualiza_Baixa_Lote(DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value);  // procedure
    DMContasReceber.cdContasReceberBaixaLote.Next;
  End;

  DMContasReceber.cdContasReceberBaixaLote.First;
end;

Procedure TFContasReceberBaixa.Atualiza_Baixa_Lote(wMarcado_SN : String);
Begin
  If wMarcado_SN = 'N' then
    If dmcontasReceber.QContasReceberBaixaInd_Permite_Desconto_Baixa.Value = 'NAO' Then
       If (DMContasReceber.cdContasReceberBaixaLoteVal_Desconto_Alterar.Value > 0) Then
          Raise Exception.Create('Não permite desconto neste titulo');

  DMContasReceber.cdContasReceberBaixaLote.Edit;
  If wMarcado_SN = 'S' then
  Begin
    With DMContasReceber do
    begin
     // Alteracoes na baixa em Lote, Juros não estava somando corretamente no valor
     // total da baixa - Djeison A. Selzlein - 14/08/2013
     cdContasReceberBaixaLoteBAIXAR.Value := 'N';
     MeComJuros.Text := FormatFloat('##0.00',StrToFloat(MeComJuros.Text) -
        (cdContasReceberBaixaLoteVAL_TITULO.Value +
         cdContasReceberBaixaLoteVAL_JURO_ALTERAR.Value) +
        cdContasReceberBaixaLoteVAL_DESCONTO_ALTERAR.Value);
     MeSemJuros.Text := FormatFloat('##0.00',StrToFloat(MeSemJuros.Text) -
        cdContasReceberBaixaLoteVAL_TITULO.Value +
        cdContasReceberBaixaLoteVAL_DESCONTO_ALTERAR.Value);
     MeComJurosReparcelamento.Text := MeComJuros.Text;
     MeSemJurosReparcelamento.Text := MeSemJuros.Text;
     cdContasReceberBaixaLoteVAL_DESCONTO_ALTERAR.Value := 0;
     cdContasReceberBaixaLoteVAL_JURO_ALTERAR.Value :=
        cdContasReceberBaixaLoteval_juros_calculado.Value -
        cdContasReceberBaixaLoteVAL_TITULO.Value;
    end;
  end
  else
    if wMarcado_SN = 'N' then
    Begin
      With DMContasReceber do
      begin
        cdContasReceberBaixaLoteBAIXAR.Value := 'S';
        cdContasReceberBaixaLoteVal_Desconto_Alterar.Value := 0;
        If MePercDesconto.Text <> '' Then
        begin
          If DMContasReceber.cdContasReceberBaixaLoteInd_Permite_Desconto_Baixa.Value = 'SIM' Then
          begin
            cdContasReceberBaixaLoteVal_Desconto_Alterar.Value :=
              Trunc(cdContasReceberBaixaLoteVal_Titulo.Value * StrToFloat(MePercDesconto.Text)) / 100;
          end;
        end
        else
          cdContasReceberBaixaLoteVal_Desconto_Alterar.Value := 0;

        Self.CalculaDescontoPorDia;
        
        if FValDescAdiantamento > 0 then
          cdContasReceberBaixaLoteVal_Desconto_Alterar.Value := cdContasReceberBaixaLoteVal_Desconto_Alterar.Value + FValDescAdiantamento;

        MeComJuros.Text := FormatFloat('##0.00',StrToFloat(MeComJuros.Text) +
          cdContasReceberBaixaLoteVAL_TITULO.Value +
          cdContasReceberBaixaLoteVAL_JURO_ALTERAR.Value -
          cdContasReceberBaixaLoteVAL_DESCONTO_ALTERAR.Value);
        MeSemJuros.Text := FormatFloat('##0.00',StrToFloat(MeSemJuros.Text) +
          cdContasReceberBaixaLoteVAL_TITULO.Value -
          cdContasReceberBaixaLoteVAL_DESCONTO_ALTERAR.Value);
        MeComJurosReparcelamento.Text := MeComJuros.Text;
        MeSemJurosReparcelamento.Text := MeSemJuros.Text;
      end;
    End
    Else  // ESTA LIMPEZA SERVE PARA QUANDO MARCA E MUDA AS ABAS QUANDO VOLTA TEM QUE ESTA TUDO DESMARCADO
     DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value := 'N';
     
  DMContasReceber.cdContasReceberBaixaLote.Post;

End;

procedure TFContasReceberBaixa.SBHistoricoChequeClick(Sender: TObject);
Var
wVlrCheque : Real;
begin
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
    MEHistoricoCheque.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
    MEHistoricoChequeExit(Self);
end;

procedure TFContasReceberBaixa.MEHistoricoChequeExit(Sender: TObject);
begin
  if Trim(MEHistoricoCheque.Text) <> '' Then
  Begin
    EdHistoricoCheque.Text := DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO='+Trim(MeHistoricoCheque.Text));
    //wvlrCheque := DMContasReceber.QContasReceberBaixaVAL_TITULO.Value - StrToFloat(MeValorBaixa.Text) ;
    //MEValorCheque.Text := FloatToStr(wVlrCheque);
    if ((Trim(MeValorBaixa.Text) = '') or (Trim(MEValorBaixa.Text) = '0') and (Trim(MeBaixaJuro.Text)<>'0,00')) then
      MEValorCheque.Text := FloatToStr(DMContasReceber.QContasReceberBaixaVAL_TITULO.Value - StrToFloat(MeValorBaixa.Text))

    else
      MEValorCheque.Text := FloatToStr(DMContasReceber.QContasReceberBaixaVAL_TITULO.Value - (StrToFloat(MeValorBaixa.Text)-StrToFloat(MeBaixaJuro.Text)))
  end;
end;

procedure TFContasReceberBaixa.CbCalculoJurosClick(Sender: TObject);
begin
  if not DMContasReceber.QContasReceberBaixa.IsEmpty then
    Buscar;
end;

procedure TFContasReceberBaixa.DBGrid4CellClick(Column: TColumn);
begin
  if Column.Title.Caption = 'X' then
  Begin
//    DMContasReceber.cdContasReceberBaixaLote.Refresh;
    Atualiza_Baixa_Lote(DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value);  // procedure
    DBGrid4.SelectedIndex := DBGrid4.SelectedIndex + 1;
  End;

end;

procedure TFContasReceberBaixa.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Column.Title.Caption = 'X') then
  begin DBGrid4.Canvas.FillRect(Rect);
    if DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value = 'S' then
      ImageList1.Draw(DBGrid4.Canvas, Rect.Left + 5, Rect.Top + 1, 1)
     else
      ImageList1.Draw(DBGrid4.Canvas, Rect.Left + 5, Rect.Top + 1, 0);
    end;

end;

procedure TFContasReceberBaixa.DBGrid4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_space then
  Begin
    Atualiza_Baixa_Lote(DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value);  // procedure
    Abort;
  End;

end;

procedure TFContasReceberBaixa.SpeedButton5Click(Sender: TObject);
begin
  If FFinalidadeCons=Nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal = MrOk then
  begin
    if DMFinalidade.QFinalidadeConsIND_FINALIDADE.Value = 'R' then
      MeFinalidadeReparcelamento.Text:=FloatToStr(DMFinalidade.QFinalidadeConsCod_Finalidade.Value)
    else
    begin
     MeFinalidadeReparcelamento.Clear;
     raise Exception.Create('A Finalidade não é de Contas a Receber.');
    end;
  end;
end;

procedure TFContasReceberBaixa.BtReparcelarClick(Sender: TObject);
Var wVal_Titulo, wVal_Parcelas, wDiferenca : Real;
    wCont, wNum_Titulo, wContaCorrente, i : Integer;
    wVencto : TDateTime;
    wTitulosRep, wNotasRepRetifoz, wComando : String;
    wNotasSeparadas, wNotasReparceladas: TStrings;
    wEncontraNota: boolean;
begin
  wNotasSeparadas := TStringList.Create;
  wNotasRepRetifoz := '';
  wTitulosRep := '';
  Self.Tag := 1;
  SetLength(wTb_Conta_Receber_Cab,0); //iniciar o vetor
  If Trim(MeFinalidadeReparcelamento.Text) = '' Then
     Raise exception.Create('Informar finalidade');
  If Trim(MeVenctoReparcelamento.Text) = '' Then
     Raise exception.Create('Informar Data de Vencimento');
  If Trim(MeNrParcelas.Text) = '' Then
     Raise exception.Create('Informar Número de Parcelas');
  If Not(StrToFloat(Trim(MeComJurosReparcelamento.Text)) > 0) Then
     Raise exception.Create('Selecionar ao menos um titulo para reparcelar');

  //PARA VALIDAR SE A FINALIDADE É IGUAL E EVITAR REPARCELAMENTOS DE TIPOS DIFERENTES DE TITULOS - CLEBER - 12/02/2021
  DMContasReceber.cdContasReceberBaixaLote.First;
  while not DMContasReceber.cdContasReceberBaixaLote.Eof do
  begin
    if ((DMParamSistema.CodEmpresa <> 'KREUZ') and (DMParamSistema.CodEmpresa <> 'CONKRETA')) and
          ((StrToInt(trim(MeFinalidadeReparcelamento.Text)) <> DMContasReceber.cdContasReceberBaixaLoteCOD_FINALIDADE.Value) and (DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value = 'S')) THEN
      Raise Exception.Create('Não é possível reparcelar títulos com FINALIDADES DIFERENTES! Verifique.');
     DMContasReceber.cdContasReceberBaixaLote.Next;
  end;
  DMContasReceber.cdContasReceberBaixaLote.First;


  wCont := StrToInt(Trim(MeNrParcelas.Text));
  If StrToFloat(Trim(MeValPrimeiraParcela.Text)) > 0 Then  // serve para dividir as parcelas - quando informa o valor da primeira parcelas tem que diminuir 1 das parcelas informadas
     wCont := wCont - 1;
  wVal_Parcelas := Trunc((StrToFloat(Trim(MeComJurosReparcelamento.Text))- StrToFloat(Trim(MeValPrimeiraParcela.Text))) / wCont * 100);
  wVal_Parcelas := wVal_Parcelas / 100;
  wVal_Titulo := wVal_Parcelas * wCont + StrToFloat(Trim(MeValPrimeiraParcela.Text));
  If wVal_Titulo <> StrToFloat(Trim(MeComJurosReparcelamento.Text)) Then
     If wVal_Titulo > StrToFloat(Trim(MeComJurosReparcelamento.Text)) Then
        wDiferenca := (wVal_Titulo - StrToFloat(Trim(MeComJurosReparcelamento.Text))) * -1
     Else
        wDiferenca := StrToFloat(Trim(MeComJurosReparcelamento.Text)) - wVal_Titulo;
  wCont := 1;
  wVencto := StrToDate(MeVenctoReparcelamento.Text);
  //joguei o codigo acima para jogar na obs o número da nota e dt_emissao dos titulos reparcelados. Junior - 11/02/2019
  DMContasReceber_Rel.cdsRContasReceberBaixaLote.Open; //Abre a Query em Memória para inserção de Dados.
  DMContasReceber.cdContasReceberBaixaLote.First;

  if (DMParamSistema.CodEmpresa = 'RETIFOZ') or (DMParamSistema.CodEmpresa = 'MEDFRIG') then
    DMContasReceber.QReparcelamentoCR.Open;

  while not DMContasReceber.cdContasReceberBaixaLote.Eof do
  begin
     wNotasSeparadas.Clear; //para atualizar a lista de notas e não gerer duplicidade
    //REPARCELAMENTO PARA RETIFOZ
    if (DMParamSistema.CodEmpresa = 'RETIFOZ') or (DMParamSistema.CodEmpresa = 'MEDFRIG') then
    begin
      ExtractStrings([':'], [], PChar(wNotasRepRetifoz), wNotasSeparadas);
      if DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value = 'S' then
      begin
        DMOracle.ExecutaSql('UPDATE TB_CONTA_RECEBER_CAB SET IND_SITUACAO = '+ QuotedStr('REPARCELAR') +
               ',VAL_TITULO = 0, DT_BAIXA = ' + QuotedStr(DateToStr(Date)) + ' WHERE COD_CONTA_RECEBER_CAB = ' +
                DMContasReceber.cdContasReceberBaixaLoteCod_Conta_Receber_cab.Text, False);

        //SE FOR REPARCELAR NOTA JÁ REPARCELADA, VAI BUSCAR AS NOTAS
        if DMContasReceber.cdContasReceberBaixaLoteDESC_TIPO_DOCUMENTO.Text = 'Rep' then
        begin
          DMContasReceber.QReparcelamentoCrCons.Close;
          DMContasReceber.QReparcelamentoCrCons.SetVariable('NUM_TITULO_REP', DMContasReceber.cdContasReceberBaixaLoteNUM_TITULO.VALUE);
          DMContasReceber.QReparcelamentoCrCons.Open;

          while not DMContasReceber.QReparcelamentoCrCons.Eof do
          begin
            wNotasRepRetifoz := wNotasRepRetifoz + ':' + DMContasReceber.QReparcelamentoCRConsCOD_NOTA_CAB.Text;
            DMContasReceber.QReparcelamentoCrCons.Next;
          end;

          DMContasReceber.QReparcelamentoCrCons.Close;
        end
        else
        begin
          //PARA VERIFICAR SE A NOTA JÁ FOI INCLUÍDA PARA INSERÇÃO NA TABELA NOTA X TÍTULO
          if (wNotasSeparadas.Count > 0) then
          begin
            wEncontraNota := false;
            for i := 0 to wNotasSeparadas.Count - 1 do
            begin     // CASO NÃO CONTENHA A NOTA, INCLUI NA LISTA
              if (wNotasSeparadas[i] = DMContasReceber.cdContasReceberBaixaLoteCOD_NOTA_CAB.Text) then
                wEncontraNota := true;
            end;
            if not wEncontraNota then
              wNotasRepRetifoz := wNotasRepRetifoz + ':' + DMContasReceber.cdContasReceberBaixaLoteCOD_NOTA_CAB.Text;
          end
          else
            wNotasRepRetifoz := wNotasRepRetifoz + ':' + DMContasReceber.cdContasReceberBaixaLoteCOD_NOTA_CAB.Text;
        end;
      end;
    end
    else   //MANTÉM PARA OS OUTROS CLIENTES
    begin
      if DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value = 'S' then
      begin
        //PARAM_SISTEMA. Para em caso de reparcelamento e NÃO quizer excluir os TÍTULOS do C.R. Solicitacao Marcos(Cemapa). Junior 23/03/2015
        if DMParamSistema.QParamSistemaIND_EXCLUI_TITULO_REP.Value = 'S' then
        begin
          DMOracle.ExecutaSql('DELETE FROM TB_CONTA_RECEBER_MOV WHERE COD_CONTA_RECEBER_CAB = ' + DMContasReceber.cdContasReceberBaixaLoteCod_Conta_Receber_cab.Text, False);
          DMOracle.ExecutaSql('UPDATE TB_CAIXA_MOV SET COD_CONTA_RECEBER_CAB=' + QuotedStr('') + ' WHERE COD_CONTA_RECEBER_CAB = ' + DMContasReceber.cdContasReceberBaixaLoteCod_Conta_Receber_cab.Text, False);
          DMOracle.ExecutaSql('DELETE FROM TB_CONTA_RECEBER_CAB WHERE COD_CONTA_RECEBER_CAB = ' + DMContasReceber.cdContasReceberBaixaLoteCod_Conta_Receber_cab.Text, False);
          wTitulosRep := wTitulosRep + DMContasReceber.cdContasReceberBaixaLoteNUM_TITULO.Text + '/' + DMContasReceber.cdContasReceberBaixaLoteNUM_PARCELA.Text + ' - ' + DMContasReceber.cdContasReceberBaixaLoteDT_EMISSAO.Text + chr(13)+chr(10);
        end
        else
        begin   // Muda Status do TÍT., set o VLR_TITULO PARA ZERO E O TIPO DOC. MUDA PARA REP. Solicitacao Marcos(Cemapa). Junior 23/03/215
          DMOracle.ExecutaSql('UPDATE TB_CONTA_RECEBER_CAB SET IND_SITUACAO = '+ QuotedStr('BAIXA TOTAL') +
            ',DESC_TIPO_DOCUMENTO = ' + QuotedStr('Rep') + ',VAL_TITULO = 0, DT_BAIXA = ' + QuotedStr(DateToStr(Date)) + ' WHERE COD_CONTA_RECEBER_CAB = ' +
              DMContasReceber.cdContasReceberBaixaLoteCod_Conta_Receber_cab.Text, False);
          wTitulosRep := wTitulosRep + DMContasReceber.cdContasReceberBaixaLoteNUM_TITULO.Text + '/' + DMContasReceber.cdContasReceberBaixaLoteNUM_PARCELA.Text + ' - ' + DMContasReceber.cdContasReceberBaixaLoteDT_EMISSAO.Text + chr(13)+chr(10);
        end;
      end;
    end;
    DMContasReceber.cdContasReceberBaixaLote.Next;
  end;
//  DMOracle.DBCemapa.Commit;
  DMContasReceber_Rel.cdsRContasReceberBaixaLote.EmptyDataSet; //Limpa os Dados da Baixa Anterior.
  DMContasReceber_Rel.cdsRContasReceberBaixaLote.Close; //Fecha a Query em Memória.

  if (DMParamSistema.CodEmpresa = 'RETIFOZ') or (DMParamSistema.CodEmpresa = 'MEDFRIG') then
    wNum_titulo := DMSequencia.Sequencia(StrToInt(Trim(MECodFilial.Text)),'Num_Titulo_Rep')
  else
    wNum_titulo := DMSequencia.Sequencia(StrToInt(Trim(MECodFilial.Text)),'Num_Titulo_CR');
  //No reparcelamento o num_titulo deve ser o mesmo e mudando apenas o NUM_Parcelas.  Sol. Marcos. Junior 31/03/2015


    //INSERE NA TABELA OS TITULOS ANTIGOS PARA SEREM LOCALIZADOS ATRAVÉS DA NOTA
  if (DMParamSistema.CodEmpresa = 'RETIFOZ') or (DMParamSistema.CodEmpresa = 'MEDFRIG') then
  begin
   for i := 0 to wNotasSeparadas.Count -1  do
    begin
      DMContasReceber.QReparcelamentoCR.Append;
      DMContasReceber.QReparcelamentoCRNUM_TITULO.Value := wNum_Titulo;
      DMContasReceber.QReparcelamentoCRCOD_NOTA_CAB.Text := wNotasSeparadas[i];
      DMContasReceber.QReparcelamentoCR.Post;
      DMContasReceber.cdContasReceberBaixaLote.Next;
    end;
  end;

  if Trim(FMContaCorrente3.MeContaCorrente.Text) <> '' then
    wContaCorrente := StrToInt(Trim(FmContaCorrente3.MeContaCorrente.Text))
  else
    wContaCorrente := 0;

  While wCont <= StrToInt(Trim(MeNrParcelas.Text)) Do
  Begin
    If wCont = 1 Then
       If StrToFloat(Trim(MeValPrimeiraParcela.Text)) <> 0 Then
          wVal_Titulo := StrToFloat(Trim(MeValPrimeiraParcela.Text)) + wDiferenca
       Else
          wVal_Titulo := wVal_Parcelas + wDiferenca
    Else
       wVal_Titulo := wVal_Parcelas;
    DMContasReceber.pReparcelamento := True; //Jogar nas observações Numero do Titulo/emissão dos reparcelados.
    DMContasReceber.IncluiCR(0,wNum_titulo,wCont,StrToInt(Trim(MeFinalidadeReparcelamento.Text)),
             StrToInt(Trim(FMDepartamento3.MeDepartamento.Text)),wContaCorrente,StrToInt(Trim(MECodCliente.Text)),
             StrToInt(Trim(MeCodFilial.Text)), wVal_Titulo, 'Rep', wVencto, Date, 0 , wTitulosRep);
    {   //Retirado para possibilitar reparcelamento em 7/15/20/30 para todos os clientes. - CLEBER 05/04/2021
    if (DMParamSistema.CodEmpresa <> 'RETIFOZ') and (DMParamSistema.CodEmpresa <> 'MEDFRIG') then
      wVencto := wVencto + 30
    else}
      wVencto := wVencto + StrToInt(RGPrazoVencimento.Items[RGPrazoVencimento.ItemIndex]);
    SetLength(wTb_Conta_Receber_Cab,wCont);
    wTb_Conta_Receber_Cab[wCont - 1] := DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Value;
    Inc(wCont);
  End;

{ codigo colocado pra cima, para jogar na observação o número das notas e dt_emissao dos titulos reparcelados. junior 11/02/2019.
  DMContasReceber_Rel.cdsRContasReceberBaixaLote.Open; //Abre a Query em Memória para inserção de Dados.
  DMContasReceber.cdContasReceberBaixaLote.First;
  while not DMContasReceber.cdContasReceberBaixaLote.Eof do
  begin
    if DMContasReceber.cdContasReceberBaixaLoteBAIXAR.Value = 'S' then
    begin
      //PARAM_SISTEMA. Para em caso de reparcelamento e NÃO quizer excluir os TÍTULOS do C.R. Solicitacao Marcos(Cemapa). Junior 23/03/2015
      if DMParamSistema.QParamSistemaIND_EXCLUI_TITULO_REP.Value = 'S' then
      begin
        DMOracle.ExecutaSql('DELETE FROM TB_CONTA_RECEBER_MOV WHERE COD_CONTA_RECEBER_CAB = ' + DMContasReceber.cdContasReceberBaixaLoteCod_Conta_Receber_cab.Text, False);
        DMOracle.ExecutaSql('UPDATE TB_CAIXA_MOV SET COD_CONTA_RECEBER_CAB=' + QuotedStr('') + ' WHERE COD_CONTA_RECEBER_CAB = ' + DMContasReceber.cdContasReceberBaixaLoteCod_Conta_Receber_cab.Text, False);
        DMOracle.ExecutaSql('DELETE FROM TB_CONTA_RECEBER_CAB WHERE COD_CONTA_RECEBER_CAB = ' + DMContasReceber.cdContasReceberBaixaLoteCod_Conta_Receber_cab.Text, False);
        wTitulosRep := DMContasReceber.cdContasReceberBaixaLoteNUM_TITULO.Text + '-' + DMContasReceber.cdContasReceberBaixaLoteDT_EMISSAO.Text;
      end
      else
      begin   // Muda Status do TÍT., set o VLR_TITULO PARA ZERO E O TIPO DOC. MUDA PARA REP. Solicitacao Marcos(Cemapa). Junior 23/03/215
        DMOracle.ExecutaSql('UPDATE TB_CONTA_RECEBER_CAB SET IND_SITUACAO = '+ QuotedStr('BAIXA TOTAL') +
          ',DESC_TIPO_DOCUMENTO = ' + QuotedStr('Rep') + ',VAL_TITULO = 0, DT_BAIXA = ' + QuotedStr(DateToStr(Date)) + ' WHERE COD_CONTA_RECEBER_CAB = ' +
            DMContasReceber.cdContasReceberBaixaLoteCod_Conta_Receber_cab.Text, False);
        wTitulosRep := DMContasReceber.cdContasReceberBaixaLoteNUM_TITULO.Text + '-' + DMContasReceber.cdContasReceberBaixaLoteDT_EMISSAO.Text;
      end;
    end;
    DMContasReceber.cdContasReceberBaixaLote.Next;
  end;
  DMOracle.DBCemapa.Commit;
  DMContasReceber_Rel.cdsRContasReceberBaixaLote.EmptyDataSet; //Limpa os Dados da Baixa Anterior.
  DMContasReceber_Rel.cdsRContasReceberBaixaLote.Close; //Fecha a Query em Memória.}
  
  DMOracle.DBCemapa.Commit;
//  PCBaixa.ActivePage := TS0Localiza;
  SbProcura.Click;
  Self.Tag := 0;
  MeComJurosReparcelamento.Text := '0';
  MeSemJurosReparcelamento.Text := '0';
  MeComJuros.Text := '0';
  MeSemJuros.Text := '0';
  MeVenctoReparcelamento.Clear;
  MeNrParcelas.Clear;
  MeValPrimeiraParcela.Text := '0';

  //IMPRESSÃO PARA FORMULARIO
  if DMParamSistema.CodEmpresa = 'RETIFOZ' then
  begin
    BibContasReceber.ImprimeDuplicataRetifoz(wNum_titulo);
  end;

  with DMContasReceber do
  begin
    if Trim(FmContaCorrente3.MeContaCorrente.Text) <> '' then
    begin
      QBoletoAPICR.Close;
      QBoletoAPICR.SetVariable('COD_CONTA_CORRENTE', StrToInt(Trim(FmContaCorrente3.MeContaCorrente.Text)));
      QBoletoAPICR.Open;
      if (QBoletoAPICRIND_API_BOLETO.Text <> 'SIM') then  // Se não usar api, segue fluxo antigo
      begin
        if (MessageDlg('Deseja imprimir o(s) boleto(s)?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
          QRBloqueto.Close;
          QRBloqueto.SetVariable('COD_NOTA_CAB_INICIAL', null);
          QRBloqueto.SetVariable('COD_NOTA_CAB_FINAL', null);
          QRBloqueto.SetVariable('COD_CONTA_CORRENTE', StrToInt(Trim(FmContaCorrente3.MeContaCorrente.Text)));
          QRBloqueto.SetVariable('NUMERO_TITULOS', 'NUM_TITULO = ' + IntToStr(wNum_Titulo));
          Chama_Emissao_Bloqueto(0); //pDefineEmissaoBoleto: pImprime = 0, pEnviaEmail = 1, pImprimeEnviaEmail = 2
        end;
      end
      else   // Se usar API segue o fluxo novo. A validação do envio por e-mail está em BoletoAPI
      begin
        QRBloqueto.Close;
        QRBloqueto.SetVariable('COD_NOTA_CAB_INICIAL', null);
        QRBloqueto.SetVariable('COD_NOTA_CAB_FINAL', null);
        QRBloqueto.SetVariable('COD_CONTA_CORRENTE', StrToInt(Trim(FmContaCorrente3.MeContaCorrente.Text)));
        QRBloqueto.SetVariable('NUMERO_TITULOS', 'NUM_TITULO = ' + IntToStr(wNum_Titulo));
        Chama_Emissao_Bloqueto_API;
        with DMOracle do
        begin
          DMOracle.QExecSQL.Close;
          DMOracle.QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET IND_WEB_API = ' + QuotedStr('S');
          wComando := wComando + ' WHERE NUM_TITULO = ' + IntToStr(wNum_Titulo);
          wComando := wComando + ' AND COD_CONTA_CORRENTE = ' + Trim(FmContaCorrente3.MeContaCorrente.Text);
          DMOracle.QExecSQL.SQL.Add(wComando);
          DMOracle.QExecSQL.ExecSQL;
          if DMOracle.DBCemapa.InTransaction then
            DMOracle.DBCemapa.Commit;
        end;
        iWTitulo := wNum_Titulo;
        GeraBoletoApi;
      end;
    end;
  end;
end;

procedure TFContasReceberBaixa.BtNotaPromissoriaClick(Sender: TObject);
Var wCont : Integer;
begin
  wCont := 0;
  While wCont <= High(wTb_Conta_Receber_Cab) do
  Begin
    with DMContasReceber do
    begin
      QRContasReceber_Duplicatas.Close;
      QRContasReceber_Duplicatas.SetVariable('COD_NOTA_CAB', Null);
      QRContasReceber_Duplicatas.SetVariable('COD_FILIAL', Null);
      QRContasReceber_Duplicatas.SetVariable('COD_DEPARTAMENTO', Null);
      QRContasReceber_Duplicatas.SetVariable('COD_CONTA_RECEBER_CAB', wTb_Conta_Receber_Cab[wCont]);
      QRContasReceber_Duplicatas.Open;
    end;
    FPromissoria.Promissoria_Dos;
    Inc(wCont);
  End;
end;

procedure TFContasReceberBaixa.MEINCCExit(Sender: TObject);
begin
  if Trim(MEINCC.Text) <> '' then
  Begin
    MEValorJuro.Text := FloatToStr(((StrToFLoat(MEValorBaixa.Text) * StrToFloat(MEINCC.Text)) / 100));
    MeBaixaJuro.Text := FloatToStr(((StrToFLoat(MEValorBaixa.Text) * StrToFloat(MEINCC.Text)) / 100));
    MEValorBaixa.Text := FloatToStr(((StrToFLoat(MEValorBaixa.Text) * StrToFloat(MEINCC.Text)) / 100) + StrToFloat(MEValorBaixa.Text));
  end;
end;

procedure TFContasReceberBaixa.Action1Execute(Sender: TObject);
begin
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFContasReceberBaixa.FmDepartamento1BtDepartamentoClick(
  Sender: TObject);
begin
  FmDepartamento1.BtDepartamentoClick(Sender);

end;

procedure TFContasReceberBaixa.DBGrid1DblClick(Sender: TObject);
var teste: Boolean;
begin
  teste := true;
  PCBaixa.ActivePageIndex := 1;
  PCBaixaChanging(Sender,teste);
  PCBaixaChange(Sender);

end;

procedure TFContasReceberBaixa.EmiteRecibo_Termica(pBaixaLote : Boolean);
var
  wImpressao, wLinha, wNrParc: String;
  wTotal : Real;
begin
  wTotal := 0;
  wImpressao := '';
  DMFilial.QFilial.Close;
  If not pBaixaLote Then
     DMFilial.QFilial.SetVariable('PK',DMContasReceber.QContasReceberBaixaCod_Filial.Value)
  Else
     DMFilial.QFilial.SetVariable('PK',DMContasReceber_Rel.cdsRContasReceberBaixaLoteCod_Filial.Value);
  DMFilial.QFilial.Open;
  wImpressao := wImpressao + DMFilial.QFilialDESC_FILIAL.Value+chr(13)+chr(10);
  wImpressao := wImpressao + 'Endereco: ' + DMFilial.QFilialDesc_Endereco.Value+chr(13)+chr(10);
  wImpressao := wImpressao + 'Fone: ' + DMFilial.QFilialDesc_Telefone.Value+chr(13)+chr(10);
  wImpressao := wImpressao +  '______________________________________________'+chr(13)+chr(10);

  If not pBaixaLote Then
     wImpressao := wImpressao +  Trim(DMContasReceber.QContasReceberBaixaCod_Cadastro.Text) + ' ' + Trim(DMContasReceber.QContasReceberBaixaNome.Value)+chr(13)+chr(10)
  Else
     wImpressao := wImpressao +  Trim(DMContasReceber_Rel.cdsRContasReceberBaixaLoteCod_Cadastro.Text) + ' ' + Trim(DMContasReceber_Rel.cdsRContasReceberBaixaLoteNome_Cliente.Value)+chr(13)+chr(10);
  wImpressao := wImpressao +  'Dt. Pagamento: ' + MEDataBaixa.Text + chr(13)+chr(10);
  wImpressao := wImpressao + chr(13)+chr(10) + '           RECIBO DE PAGAMENTO ' + chr(13)+chr(10);
//    wImpressao := wImpressao + Bib.FormataTextoEsq('PEDIDO NUM.: ' + QNFE_EmiteNUM_NOTA.Text, 65)+chr(13)+chr(10);
//     // ****** Contas a receber ********

  If not pBaixaLote Then
   Begin
     wImpressao := wImpressao +  '______________________________________________'+chr(13)+chr(10);
     wNrParc:=DMOracle.BuscaNome('SELECT MAX(NUM_PARCELA) FROM TB_CONTA_RECEBER_CAB','COD_FILIAL = '+DMContasReceber.QContasReceberBaixaCod_Filial.Text +
              ' AND COD_CADASTRO = ' + DMContasReceber.QContasReceberBaixaCod_Cadastro.Text + ' AND NUM_TITULO='+DMContasReceber.QContasReceberBaixaNum_Titulo.Text);

     wImpressao := wImpressao +  'Nr. Titulo: ' + DMContasReceber.QContasReceberBaixaNum_Titulo.Text + ' / ' + DMContasReceber.QContasReceberBaixaNum_Parcela.Text + ' De:' +wNrParc + '   Dt. Vencto: ' + DMContasReceber.QContasReceberBaixaDt_Vencimento.Text + chr(13)+chr(10);
     wImpressao := wImpressao + chr(13)+chr(10);
     wImpressao := wImpressao +  Bib.FormataTextoEsq('Vlr. Parc.: ' + FormatFloat('#,##0.00', DMContasReceber.QContasReceberBaixaVal_Titulo.Value),45) + chr(13)+chr(10);
     wImpressao := wImpressao +  Bib.FormataTextoEsq('Vlr. Juro.: ' + FormatFloat('#,##0.00', pVal_Juros),45)  + chr(13)+chr(10);
     wImpressao := wImpressao +  Bib.FormataTextoEsq('Vlr. Desc.: ' + FormatFloat('#,##0.00', pVal_Desconto),45) + chr(13)+chr(10);
     wImpressao := wImpressao +  Bib.FormataTextoEsq('Vlr. Receb: ' + FormatFloat('#,##0.00', pVal_Pago + pVal_Juros - pVal_Desconto),45) + chr(13)+chr(10);
     wTotal := pVal_Pago + pVal_Juros - pVal_Desconto;
   end
  Else
   Begin
     with DMContasReceber_Rel do
     begin
       cdsRContasReceberBaixaLote.First;
       While Not cdsRContasReceberBaixaLote.Eof Do
       Begin
         wImpressao := wImpressao +  '______________________________________________'+chr(13)+chr(10);
         wNrParc:=DMOracle.BuscaNome('SELECT MAX(NUM_PARCELA) FROM TB_CONTA_RECEBER_CAB','COD_FILIAL = '+cdsRContasReceberBaixaLoteCod_Filial.Text +
                 ' AND COD_CADASTRO = ' + cdsRContasReceberBaixaLoteCod_Cadastro.Text + ' AND NUM_TITULO='+cdsRContasReceberBaixaLotenum_duplicata.Text);
         wImpressao := wImpressao +  'Nr. Titulo: ' + cdsRContasReceberBaixaLotenum_duplicata.Text + ' / ' + cdsRContasReceberBaixaLoteNum_parcela.Text + ' De:' +wNrParc + '   Dt. Vencto: ' + cdsRContasReceberBaixaLoteDt_Vencimento.Text + chr(13)+chr(10);
         wImpressao := wImpressao + chr(13)+chr(10);
         wImpressao := wImpressao +  Bib.FormataTextoEsq('Vlr. Parc.: ' + FormatFloat('#,##0.00', cdsRContasReceberBaixaLoteval_principal.Value),45) + chr(13)+chr(10);
         wImpressao := wImpressao +  Bib.FormataTextoEsq('Vlr. Juro.: ' + FormatFloat('#,##0.00', cdsRContasReceberBaixaLoteval_juros_recebidos.Value),45)  + chr(13)+chr(10);
         wImpressao := wImpressao +  Bib.FormataTextoEsq('Vlr. Desc.: ' + FormatFloat('#,##0.00', cdsRContasReceberBaixaLoteval_desconto.Value),45) + chr(13)+chr(10);
         wImpressao := wImpressao +  Bib.FormataTextoEsq('Vlr. Receb: ' + FormatFloat('#,##0.00', cdsRContasReceberBaixaLoteval_recebido.Value),45) + chr(13)+chr(10);
         wTotal := wTotal + cdsRContasReceberBaixaLoteval_recebido.Value;
         cdsRContasReceberBaixaLote.Next;
       End;
     End;
   End;
  wImpressao := wImpressao +  '______________________________________________' + chr(13)+chr(10);;
  wImpressao := wImpressao +  Bib.FormataTextoEsq('Vlr. Total Recebido: ' + FormatFloat('#,##0.00', wTotal),45) +chr(13)+chr(10)+chr(13)+chr(10)+chr(13)+chr(10);

  wImpressao := wImpressao +  '___________________'+chr(13)+chr(10);
  wImpressao := wImpressao +  '      Assinatura' + chr(13) + chr(10);
  bib.ImprimeImpressoraGenerica(DMUsuario.ImpressoraPadraoNFCe,wImpressao,'Arial',10);
  if (DMParamSistema.CodEmpresa = 'NUTRIVET') or (DMParamSistema.CodEmpresa = 'NUTRIPET') or //Pediram 2 vias do recibo
     (DMParamSistema.CodEmpresa = 'DONABENTA') then //Adicionado DonaBenta por Solicitação da Rose do caixa. Alex 19/04/2024.
    bib.ImprimeImpressoraGenerica(DMUsuario.ImpressoraPadraoNFCe,wImpressao,'Arial Narrow',10);
end;

procedure TFContasReceberBaixa.FmDepartamento2BtDepartamentoClick(
  Sender: TObject);
begin
  FmDepartamento2.BtDepartamentoClick(Sender);

end;

procedure TFContasReceberBaixa.FmDepartamento3BtDepartamentoClick(
  Sender: TObject);
begin
  FmDepartamento3.BtDepartamentoClick(Sender);

end;

procedure TFContasReceberBaixa.GeraBoletoApi;
var
  wBoletoApi: IBoletoApi;
begin

  with DMContasReceber do
  begin

    QBoletoAPICR.Close;
    QBoletoAPICR.SetVariable('COD_CONTA_CORRENTE', StrToInt(Trim(FmContaCorrente3.MeContaCorrente.Text)));
    QBoletoAPICR.Open;

    if (QBoletoAPICRIND_API_BOLETO.Value = 'SIM') then
    begin
      QBoletoAPI.Close;
      QBoletoAPI.SetVariable('COD_CONTA_CORRENTE', StrToInt(Trim(FmContaCorrente3.MeContaCorrente.Text)));
      QBoletoAPI.SetVariable('NUM_TITULO_INICIAL', iWTitulo);
      QBoletoAPI.SetVariable('NUM_TITULO_FINAL', iWTitulo);
                    // A FACTORY VAI MONTAR O OBJETO DE ACORDO COM O TIPO PASSADO TTIPOGERABOLETO
      wBoletoApi := TBoletoFactory.RetornaBoletoBanco(StrToInt(Trim(MECodFilial.Text)),  // PRECISA FILIAL
                                           0,  // SE CONTARECEBER, NÃO PRECISA COD NOTA
                                           0,  // SE CONTARECEBER, NÃO PRECISA NUM NOTA
                                           QBoletoAPICRCOD_BANCO.Value,
                                           0,  // SE CONTARECEBER, NÃO PRECISA O CONTRATO
                                           TGBContasReceber,   // ESSE O TIPO NOTA
                                           QBoletoAPICRIND_AMBIENTE_API_BOLETO.Value,
                                           false,
                                           false);  // sWEnviaBoletoEmail e sWEGeraPdf vem do FContasReceberParam.RG19TipoEmissao

      wBoletoApi.EnviarBoletosApi;
      if (MessageDlg('Deseja imprimir o(s) boleto(s)?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
        and not wBoletoApi.GetIndTemRejeicao then
      begin
        wBoletoApi.GerarPDF;
      end
      else if wBoletoApi.GetIndTemRejeicao then
        ShowMessage('Rejeições ao enviar os boletos. Verifique com o suporte!');
    end;
  end;
end;

procedure TFContasReceberBaixa.CalculaDescontoPorDia;
var
  wQtdDiasAdiantamento: integer;
  wPercAdiantamentoDia: real;
begin
  FValDescAdiantamento := 0;
  with DMContasReceber do
  begin
    if not cdContasReceberBaixaLotePERC_DESC_ADIANTAMENTO.IsNull then
    begin
      wQtdDiasAdiantamento := DaysBetween(cdContasReceberBaixaLoteDT_VENCIMENTO.Value, cdContasReceberBaixaLoteDT_EMISSAO.Value);
      if wQtdDiasAdiantamento > 0 then
      begin
        wPercAdiantamentoDia := cdContasReceberBaixaLotePERC_DESC_ADIANTAMENTO.Value / wQtdDiasAdiantamento;
        if cdContasReceberBaixaLoteDT_VENCIMENTO.Value > StrToDate(Me2DataBaixa.Text) then
        begin
          wPercAdiantamentoDia := wPercAdiantamentoDia * DaysBetween(cdContasReceberBaixaLoteDT_VENCIMENTO.Value, StrToDate(Me2DataBaixa.Text));
          wPercAdiantamentoDia := cdContasReceberBaixaLoteVAL_ORIGINAL.Value * (wPercAdiantamentoDia / 100);
          FValDescAdiantamento := RoundTo(wPercAdiantamentoDia,-2);
        end
        else
          FValDescAdiantamento := 0;
      end
      else  // wValDescAdiantamento é variável da classe, não da procedure
        FValDescAdiantamento := 0;
    end;
  end;
end;

procedure TFContasReceberBaixa.DBGrid3ColExit(Sender: TObject);
begin
  if FCampoAnterior = 'VAL_DESCONTO_ALTERAR' then   //Atualizar o campo MeComJuros quando informado valor de desconto Junior 21/05/2026
  begin
    MeComJuros.Text := FormatFloat('##0.00',StrToFloat(MeComJuros.Text) -
                 DMContasReceber.cdContasReceberBaixaLoteVAL_DESCONTO_ALTERAR.Value);
  end;
end;

procedure TFContasReceberBaixa.DBGrid3ColEnter(Sender: TObject);
begin
  if (DBGrid3.DataSource <> nil) and
     (DBGrid3.DataSource.DataSet <> nil) and
     (DBGrid3.DataSource.DataSet.Active) and
     Assigned(DBGrid3.SelectedField) then
  begin
    FCampoAnterior := DBGrid3.SelectedField.FieldName;
  end;
end;

procedure TFContasReceberBaixa.MeFinalidadeReparcelamentoExit(
  Sender: TObject);
begin
  if DMOracle.FastSelect('IND_FINALIDADE','TB_FINALIDADE','COD_FINALIDADE = ' + Trim(MeFinalidadeReparcelamento.Text)) = 'P' then
  begin
    MeFinalidadeReparcelamento.Clear;
    raise Exception.Create('A Finalidade não é de Contas a Receber.');
  end;

end;

end.



