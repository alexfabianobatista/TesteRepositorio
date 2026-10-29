unit UContasPagarBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Grids, DBGrids, ComCtrls, UBiblioteca,
  Db, DBTables, CheckLst, ImgList;

type
  TFContaPagarBaixa = class(TForm)
    PCBaixa: TPageControl;
    TS0Localiza: TTabSheet;
    GroupBox1: TGroupBox;
    Fornecedor: TLabel;
    DBGrid1: TDBGrid;
    METexto: TMaskEdit;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    MEDataVencInicial: TMaskEdit;
    MEDataVencFinal: TMaskEdit;
    TS1Baixa: TTabSheet;
    GroupBox2: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    SBBaixa: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    MEDataBaixa: TMaskEdit;
    MEValorDesconto: TMaskEdit;
    MEValorJuro: TMaskEdit;
    MEObservacao: TMaskEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    DBText3: TDBText;
    Label9: TLabel;
    MEValorBaixa: TMaskEdit;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    DBText4: TDBText;
    DBText5: TDBText;
    Label10: TLabel;
    Label11: TLabel;
    CBMostraBaixaTotal: TCheckBox;
    RGFormaPagto: TRadioGroup;
    MECodContaCorrente: TMaskEdit;
    SBConsContaCorrente: TSpeedButton;
    MENrCheque: TMaskEdit;
    MEBanco: TMaskEdit;
    MECodBanco: TMaskEdit;
    MECodFornecedor: TMaskEdit;
    BtnCadastroCons: TBitBtn;
    Label12: TLabel;
    DBText6: TDBText;
    SbProcura: TBitBtn;
    Label3: TLabel;
    MeVariacaoPos: TMaskEdit;
    Label4: TLabel;
    MeVariacaoNeg: TMaskEdit;
    Label30: TLabel;
    MECodFilial: TMaskEdit;
    MEFilial: TMaskEdit;
    RgOrdem: TRadioGroup;
    Label13: TLabel;
    MeNumero: TMaskEdit;
    MeJuroFornecedores: TMaskEdit;
    MeDescontoComercial: TMaskEdit;
    Label14: TLabel;
    Label15: TLabel;
    RGPgtoTaxa: TRadioGroup;
    CbDevolucao: TCheckBox;
    Label21: TLabel;
    MeValor: TMaskEdit;
    MECodAdiantamento: TMaskEdit;
    SBAdiantamento: TSpeedButton;
    MEAdiantamento: TMaskEdit;
    Label16: TLabel;
    TsBaixaLote: TTabSheet;
    ListView1: TListView;
    SB2Baixa: TBitBtn;
    RG2FormaPagto: TRadioGroup;
    ME2CodBanco: TMaskEdit;
    ME2Banco: TMaskEdit;
    ME2CodContaCorrente: TMaskEdit;
    ME2NrCheque: TMaskEdit;
    SB2ConsContaCorrente: TSpeedButton;
    LblHistoricoDesconto: TLabel;
    SbHistoricoDesconto: TSpeedButton;
    MeHistoricoDesconto: TMaskEdit;
    ME2DataBaixa: TMaskEdit;
    Label17: TLabel;
    Label18: TLabel;
    Me2Observacao: TMaskEdit;
    Label33: TLabel;
    lblTotal: TLabel;
    Label19: TLabel;
    MeFinalidade: TMaskEdit;
    BtFinalidade: TBitBtn;
    Label20: TLabel;
    MeValorIR: TMaskEdit;
    SbMensagem: TSpeedButton;
    Lbl_Valor_Dolar: TLabel;
    Label22: TLabel;
    MeValorOutros: TMaskEdit;
    MeDtPreDatado: TMaskEdit;
    Label23: TLabel;
    Label27: TLabel;
    Me2DtPreDatado: TMaskEdit;
    TS0Reparcelamento: TTabSheet;
    DsReparcelamento: TDataSource;
    MeFinalidadeReparcelamento: TMaskEdit;
    Label47: TLabel;
    SpeedButton5: TSpeedButton;
    MeVenctoReparcelamento: TMaskEdit;
    Label49: TLabel;
    MeNrParcelas: TMaskEdit;
    Label48: TLabel;
    Label51: TLabel;
    MeValPrimeiraParcela: TMaskEdit;
    BtReparcelar: TBitBtn;
    MeSemJurosReparcelamento: TMaskEdit;
    Label45: TLabel;
    ILChecks: TImageList;
    DBGReparcelamento: TDBGrid;
    BitBtn1: TBitBtn;
    MeDescFinalidade: TMaskEdit;
    RGReparcelamento: TRadioGroup;
    SBFilialCons: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure RGBaixaClick(Sender: TObject);
    procedure PCBaixaChange(Sender: TObject);
    procedure SBBaixaClick(Sender: TObject);
    procedure MEValorBaixaExit(Sender: TObject);
    procedure MEValorDescontoExit(Sender: TObject);
    procedure MEValorJuroExit(Sender: TObject);
    procedure SBConsContaCorrenteClick(Sender: TObject);
    procedure RGFormaPagtoClick(Sender: TObject);
    procedure MEBancoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCadastroConsClick(Sender: TObject);
    procedure MECodFornecedorExit(Sender: TObject);
    procedure SbProcuraClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBFilialConsClick(Sender: TObject);
    procedure MECodFilialExit(Sender: TObject);
    procedure MECodAdiantamentoExit(Sender: TObject);
    procedure SBAdiantamentoClick(Sender: TObject);
    procedure MeValorKeyPress(Sender: TObject; var Key: Char);
    procedure SB2BaixaClick(Sender: TObject);
    procedure RG2FormaPagtoClick(Sender: TObject);
    procedure SB2ConsContaCorrenteClick(Sender: TObject);
    procedure SbHistoricoDescontoClick(Sender: TObject);
    procedure TsBaixaLoteEnter(Sender: TObject);
    procedure ListView1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure BtFinalidadeClick(Sender: TObject);
    procedure SbMensagemClick(Sender: TObject);
    procedure MeValorOutrosExit(Sender: TObject);
    procedure MEDataBaixaExit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BtReparcelarClick(Sender: TObject);
    procedure DBGReparcelamentoCellClick(Column: TColumn);
    procedure DBGReparcelamentoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure PCBaixaChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure MeFinalidadeExit(Sender: TObject);
    procedure BtFinalidadeExit(Sender: TObject);
    procedure MeFinalidadeReparcelamentoExit(Sender: TObject);
  private
    { Private declarations }
{    procedure AddDadosReciboLote(nomeCliente: String;
                                 numDuplicata, numParcela: integer;
                                 valPrincipal, valJuros, valPrincipalRecebido, valJurosRecebido, valDesconto, valRecebido, valPendente: double);
}
    wCodNotaCab, wCodCadastro: integer; // Utilizado pela UDevolucaoTroca
  public
    procedure EmiteReciboLote(logo:String; pDataBaixa : TDateTime; wCodFilial : Integer);
    { Public declarations }
    property pCodNotaCab: integer read wCodNotaCab write wCodNotaCab;
    property pCodCadastro: integer read wCodCadastro write wCodCadastro;
  end;

var
  FContaPagarBaixa: TFContaPagarBaixa;
  wSomaSelecionados : real;
  wSelecionaTodos : boolean; 

implementation

uses UContasPagarCons, UContasPagar_cl, UOracle_cl, UTipoMovimentoCons,
  UTipoMovimento_cl, UCaixa_cl, UUsuario_cl, UContaCorrenteCons,
  UBancoAgencia_cl, UPlanilha_cl, URCheque, UEmiteCheque, UFilial_cl,
  UParamSistema_cl, UEmiteRecibo, UMoeda_cl, UCadastroCons, UCadastro_cl,
  UFilialCons, URRecibo, USequencia_cl,
  UBancoAgenciaRel_cl, UAdiantamentoCons, UAdiantamento_cl, UHistoricoCons,
  UHistorico_cl, UFinalidadeCons, UFinalidade_cl, UContasReceber_cl,
  URelContasPagar_cl, UContasReceber_Rel_cl, URReciboLote, UMensagemCons,
  UMensagem_cl, URBancoMov_CopCheque, Ucontrato_cl, UCaixaLanc_Cont,
  UNotaSaida_cl, UNotaItensCons, UBibContasPagar;

{$R *.DFM}


procedure TFContaPagarBaixa.FormActivate(Sender: TObject);
begin
  PCBaixa.ActivePage:=TS0Localiza;
  With DMContasPagar do
    Begin
      {MEDataVencInicial.Text:=DateToStr(DMOracle.DataServ);
      MEDataVencFinal.Text:=DateToStr(DMOracle.DataServ+3);
      QContasPagarBaixa.ParamByName('DT_VENC_INI').AsDate:=StrToDate(MEDataVencInicial.Text);
      QContasPagarBaixa.ParamByName('DT_VENC_FINAL').AsDate:=StrToDate(MEDataVencInicial.Text);
      QContasPagarBaixa.Close;
      QContasPagarBaixa.Open;
      QContasPagarBaixaMov.Close;
      QContasPagarBaixaMov.Open;}
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
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
   Begin
     Label3.Enabled := True;
     Label4.Enabled := True;
     MeVariacaoPos.Enabled := True;
     MeVariacaoNeg.Enabled := True;
     Label3.Visible := True;
     Label4.Visible := True;
     MeVariacaoPos.Visible := True;
     MeVariacaoNeg.Visible := True;
     Label14.Enabled := True;
     Label15.Enabled := True;
     MeJuroFornecedores.Enabled := True;
     MeDescontoComercial.Enabled := True;
     Label14.Visible := True;
     Label15.Visible := True;
     MeJuroFornecedores.Visible := True;
     MeDescontoComercial.Visible := True;
//     Label15.Top := 80;
//     Label14.Top := 104;
//     MeDescontoComercial.Top := 80;
//     MeJuroFornecedores.Top := 104;
   End;
   If Self.Tag = 1 Then  // chamado a partir do contrato garantia de preco
   Begin
     SbProcura.Enabled := False;
     RGFormaPagto.ItemIndex := 2;
     RGFormaPagto.Enabled := False;
     RG2FormaPagto.Enabled := False;
   End;
  If (DmParamSistema.QParamSistemaCod_Empresa.Value = 'MFARINHA') Then
   Begin
     RGFormaPagto.Items.Clear;
     RGFormaPagto.Items.add('Caixa');
     RGFormaPagto.Items.add('Bancos (Depósito)');
     RGFormaPagto.Items.add('Adiantamento');
   End;
   if (DmParamSistema.CodEmpresa = 'RETIFOZ') then
   begin
     RGFormaPagto.Items.Clear;
     RGFormaPagto.Items.add('Caixa');
     RGFormaPagto.Items.add('Bancos (Depósito)');
     RG2FormaPagto.Items.Clear;
     RG2FormaPagto.Items.add('Caixa');
     RG2FormaPagto.Items.add('Bancos (Depósito)');
   end;
   if (DMParamSistema.CodEmpresa = 'SCALA') then
     MECodFilial.Text := '1';
end;

procedure TFContaPagarBaixa.RGBaixaClick(Sender: TObject);
begin
{  If RGBaixa.ItemIndex=0 then //Baixa total
    Begin
      DBEValMovimento.ReadOnly:=True;
      DBEValMovimento.ParentColor:=True;
    End
  Else
    Begin
      DBEValMovimento.ReadOnly:=False;
      DBEValMovimento.Color:=clWindow;
    End;}
end;

procedure TFContaPagarBaixa.PCBaixaChange(Sender: TObject);
var
   wVariacao:real;
   wDataCapitalizacao,wTipoJuro,wDiasCarencia,wEmbalagem:String;
   wTaxa,wMoeda,wValor_Capitalizacao,wPerc_Juro_Mora: Real;

begin
  MEValorDesconto.Clear;
  MEValorJuro.Clear;
  MEObservacao.Clear;
  MeValorIR.Clear;
  MeSemJurosReparcelamento.Text := '0';
  DMContasPagar.pTotalReparcelamento := 0;
  If DMContasPagar.QContasPagarBaixaInd_Situacao.Value='BAIXA TOTAL' then
   Begin
     MEDataBaixa.Clear;
     MEValorBaixa.Clear;
     MeValorOutros.Clear;
     MENumero.Clear;
     MEDataBaixa.ReadOnly:=True;
     MEValorBaixa.ReadOnly:=True;
     MEValorDesconto.ReadOnly:=True;
     MEValorJuro.ReadOnly:=True;
     MEObservacao.ReadOnly:=True;
     SBBaixa.Enabled:=False;
   End
  Else
    Begin
     {MEDataBaixa.ReadOnly:=False;}
     MEValorBaixa.ReadOnly:=False;
     MEValorDesconto.ReadOnly:=False;
     MEValorJuro.ReadOnly:=False;
     MEObservacao.ReadOnly:=False;
     SBBaixa.Enabled:=True;
    End;
  Lbl_Valor_Dolar.Caption := '';
  If (PCBaixa.ActivePage=TS1Baixa) Or
     (PCBaixa.ActivePage=TsBaixaLote) then
    If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Then // este tratamento é para os contratos de Garantia de Preço
       If (DMContasPagar.QContasPagarBaixaCod_Contrato_Gp.Text <> '') And (FContaPagarBaixa.Tag = 0) Then
       Begin                                                               // tela normal de baixa - tag = 1 é quando baixa contabil do contrato GP
         DMContrato.QContrato_Gp.Close;
         DMContrato.QContrato_Gp.SetVariable('Pk',DMContasPagar.QContasPagarBaixaCod_Contrato_Gp.Value);
         DMContrato.QContrato_Gp.Open;
         If (DMContrato.QContrato_GpInd_Pagamento_Antecipado.Value = 'NAO') And (DMContrato.QContrato_GpInd_Situacao.Value <> 'FECHADO') Then
          Begin
            PCBaixa.ActivePage := TS0Localiza;
            Raise exception.Create('Não permite baixar este titulo - Gerar baixa do Contrato GP');
          End;
         If DMContrato.QContrato_GPDesc_Tipo_Preco.Value = 'DOLAR' Then
          Begin
            wEmbalagem := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+DMContrato.QContrato_GPCod_Produto.Text);
            Lbl_Valor_Dolar.Caption := 'Valor em Dolar='+FloatToStr(Trunc((DMContrato.QContrato_GPQT_QUANTIDADE.Value/StrToFloat(wEmbalagem))*
                                                      DMContrato.QContrato_GPPRECO.Value*((100-DMContrato.QContrato_GPPerc_FunRural.Value)/100)*100)/100);
          End;

       End;
  If PCBaixa.ActivePage=TS1Baixa then
    Begin       // Coloca os Valores default
      if (pCodNotaCab = 0 ) then
        MEDataBaixa.SetFocus;
      DMContasPagar.QContasPagarBaixaMov.Close;
      DMContasPagar.QContasPagarBaixaMov.SetVariable('COD_CONTA_PAGAR_CAB',DMContasPagar.QContasPagarBaixaCod_Conta_Pagar_Cab.Value);
      DMContasPagar.QContasPagarBaixaMov.Open;
      MEDataBaixa.Text:=DateToStr(DMOracle.DataServ);
      MeDtPreDatado.Text:=DateToStr(DMOracle.DataServ);
      if (DMParamSistema.QParamSistemaIND_GERA_PARCELA_DEVOL.Value = 'N') and (pCodNotaCab = 0) then
        wMoeda:=StrToFloat(DMOracle.BuscaNome('SELECT COD_MOEDA FROM TB_FINALIDADE','COD_FINALIDADE ='+FloatToStr(DMContasPagar.QContasPagarBaixaCod_FINALIDADE.Value)));
      if ( (wMoeda = DMParamSistema.QParamSistemaCOD_MOEDA.Value) Or (DMContasPagar.QContasPagarBaixaVal_Indexado.Value = 0) ) then
        MEValorBaixa.Text:=FloatToStr(DMContasPagar.QContasPagarBaixaVal_Titulo.Value)
      else //Variação Cambial
        with DMContasPagar do
          begin
            wVariacao:=Trunc(100*Calcula_Variacao_cambial(QContasPagarBaixaVal_Indexado.Value,
                                                          QContasPagarBaixaVal_Titulo.Value,
                                                          DMOracle.DataServ,
                                                          wMoeda))/100;
            if ABS(wVariacao) > 0.009 then
              if wVariacao > 0 then
                 MEValorJuro.Text:=FloatToStr(wVariacao)
              else
                 MEValorDesconto.Text:=FloatToStr(wVariacao*(-1));
            MEValorBaixa.Text:=FloatToStr(QContasPagarBaixaVal_Titulo.Value+(wVariacao))
          end;
      MeHistoricoDesconto.Text := DMContasPagar.QContasPagarBaixaCOD_HISTORICO_DESC.Text;
      If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ZADIMEL') And
         (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'FAVILLE') Then
       Begin
         LblHistoricoDesconto.Visible := False;
         MeHistoricoDesconto.Visible := False;
         SbHistoricoDesconto.Visible := False;
       End;
       If DMContasPagar.QContasPagarBaixaPerc_Desc_Pontualidade.Value <> 0 then
         If DMContasPagar.QContasPagarBaixaDt_Vencimento.Value >= Date Then
            MeDescontoComercial.Text := FloatToStr(Trunc((DMContasPagar.QContasPagarBaixaVal_Titulo.Value * DMContasPagar.QContasPagarBaixaPerc_Desc_Pontualidade.Value / 100) * 100) / 100);
       If DMContasPagar.QContasPagarBaixaPerc_Desc_Antecipacao.Value <> 0 then
         If DMContasPagar.QContasPagarBaixaDt_Vencimento.Value > Date Then                                                                                                                      // a grasiela falou que é sempre 30 dias
            MEValorDesconto.Text := FloatToStr(Trunc(
                                        DMContasPagar.QContasPagarBaixaVal_Titulo.Value *
                                        ((DMContasPagar.QContasPagarBaixaDt_Vencimento.Value - Date)
                            * DMContasPagar.QContasPagarBaixaPerc_Desc_Antecipacao.Value / 30 / 100) * 100) / 100);


      wValor_Capitalizacao:=0;
      wDataCapitalizacao:=DateToStr(DMContasPagar.QContasPagarBaixaDt_Capitalizacao.Value);
      If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO')  Then
       Begin
        wTipoJuro:=DMContasPagar.QContasPagarBaixaNUM_TIPO_JURO.Text;
        If DMContasPagar.QContasPagarBaixaInd_Situacao.Value = 'ABERTO' Then // Carencia somente na primeira baixa do titulo
           wDiasCarencia:=DMContasPagar.QContasPagarBaixaNUM_DIAS_CARENCIA.Text;
        If wDiasCarencia = '' Then
           wDiasCarencia := '0';
        wTaxa := 0;
        if DMContasPagar.QContasPagarBaixaPerc_Taxa.Text <> '' Then
           wTaxa  := DMContasPagar.QContasPagarBaixaPerc_Taxa.value;
        wPerc_Juro_Mora := 0;
        if (DMContasPagar.QContasPagarBaixaPerc_Juro_Mora.Text <> '') And (DMContasPagar.QContasPagarBaixaInd_Situacao.Value = 'ABERTO' )Then
           wPerc_Juro_Mora  := DMContasPagar.QContasPagarBaixaPerc_Juro_Mora.value;
        wMoeda:=DMContasPagar.QContasPagarBaixaCOD_MOEDA.Value;
        If wTipoJuro <> 'SEM JURO' then
         Begin
           wValor_Capitalizacao:=DMContasReceber.CalculaJuros(DMContasPagar.QContasPagarBaixaVal_Titulo.Value,wTaxa,wPerc_Juro_Mora,wMoeda,
                StrToDate(wDataCapitalizacao),Date,DMContasPagar.QContasPagarBaixaDt_Capitalizacao.Value,wTipoJuro,wDiasCarencia,'CP');
           wValor_Capitalizacao:=(Trunc(wValor_Capitalizacao*100)/100);
           if wValor_Capitalizacao > 0.001 then
              MeValorJuro.Text:=FloatToStr(wValor_Capitalizacao); // + QContasReceberBaixaVal_Titulo.Value;
         End; //if sem juro
       End;
    End;

  if PCBaixa.ActivePage = TS0Reparcelamento then
    begin
      with DMContasPagar do
      begin
        CdsContasPagarReparcelamento.EmptyDataSet;
        if not QContasPagarBaixa.IsEmpty then
        begin
          QContasPagarBaixa.First;
          while not QContasPagarBaixa.EoF do
          begin
            CdsContasPagarReparcelamento.Insert;
            CdsContasPagarReparcelamentoCHECADO.Value := 'NAO';
            CdsContasPagarReparcelamentoNOME.Value := QContasPagarBaixaNOME.Value;
            CdsContasPagarReparcelamentoCOD_DEPARTAMENTO.Value := QContasPagarBaixaCOD_DEPARTAMENTO.Value;
            CdsContasPagarReparcelamentoVAL_TITULO.Value := QContasPagarBaixaVAL_TITULO.Value;
            CdsContasPagarReparcelamentoCOD_CONTA_PAGAR_CAB.Value := QContasPagarBaixaCOD_CONTA_PAGAR_CAB.Value;
            CdsContasPagarReparcelamentoCOD_FINALIDADE.Value := QContasPagarBaixaCOD_FINALIDADE.Value;
            CdsContasPagarReparcelamentoCOD_FILIAL.Value := QContasPagarBaixaCOD_FILIAL.Value;
            CdsContasPagarReparcelamentoNUM_TITULO.Value := QContasPagarBaixaNUM_TITULO.Value;
            CdsContasPagarReparcelamentoNUM_PARCELA.Value := QContasPagarBaixaNUM_PARCELA.Value;
            CdsContasPagarReparcelamentoDT_VENCIMENTO.Value := QContasPagarBaixaDT_VENCIMENTO.Value;
            CdsContasPagarReparcelamentoDT_EMISSAO.Value := QContasPagarBaixaDT_EMISSAO.Value;
            CdsContasPagarReparcelamentoDESC_TIPO_DOCUMENTO.Value := QContasPagarBaixaDESC_TIPO_DOCUMENTO.Value;
            CdsContasPagarReparcelamentoCOD_NOTA_CAB.Value := QContasPagarBaixaCOD_NOTA_CAB.Value;
            CdsContasPagarReparcelamento.Post;
            QContasPagarBaixa.Next;
          end;
        end;
      end;
    end;
end;

procedure TFContaPagarBaixa.SBBaixaClick(Sender: TObject);
Var
  wValor_Juro,wValor_Desconto,wValor_Baixa,wVlrLancto,wVlJuroFornecedores,wVlDesconto_Comercial,wValor,wValor_Taxa,wValor_Outros:Real;
  wCodDoc,wFilial,wFilial_Contabil,wCodCompl,wCodigo, wCodMovBanco :Integer; //wcodmovbanco = guarda para atualizar o nominal do cheque
  wGera_Caixa,wNumDoc,wContaCred,wContaDeb,wHistorico_Baixa,wHistorico_Desc,wHistorico_Juro,wHistorico_Taxa,wComplemento, wHistorico_Pix :String;
  wHistorico_Cheque,wHistorico_Contabil,wRecibo,wMoeda,wHistorico_Variacao,wTeste_Valor, wInd_Pgto_Taxa,wValor_Contrato_Gp,wHistorico_Outros:String;
  wHistorico_Credito, wHistorico_Debito:String;
  wDtLancto:TDateTime;
  wValorPagamento,wValor_Limite_Cheque,wValor_IR:Real;
  wBaixaEmLote : boolean;
begin
  //----veririfica se foi chamado pelo botão de baixa em lote-------
  wBaixaEmLote := false;
  if (DMParamSistema.QParamSistemaIND_GERA_PARCELA_DEVOL.Value = 'N') then
  begin
    if TComponent(Sender).Name = 'SB2Baixa' then
      wBaixaEmLote := true;
  end;
  //------fim verificacao baixa em lote--------

  If DMParamSistema.QParamSistemaDt_Fechamento_Financeiro.Value >= StrToDate(MEDataBaixa.Text) Then
    Raise Exception.Create('Não é Permitido Baixar Este Título - Fechamento Contabil');
  // solicitação efetuada pela GRAZIELA - problema com baixas da fixação
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
   Begin
     If DMContasPagar.QContasPagarBaixaDt_Vencimento.Value <> StrToDate(MeDataBaixa.Text) Then
        If (DMContasPagar.QContasPagarBaixaCod_Finalidade.Value = 20) or
           (DMContasPagar.QContasPagarBaixaCod_Finalidade.Value = 21) or
           (DMContasPagar.QContasPagarBaixaCod_Finalidade.Value = 22) Then
           Raise Exception.Create('Baixa de Fixação Somente na Data do Vencimento');
     If (DMContasPagar.QContasPagarBaixaCod_Contrato_Gp.Text <> '') And (FContaPagarBaixa.Tag = 0) Then  // tag = 1 significa baixa contabil do contrato GP
        If (DMContrato.QContrato_GpInd_Pagamento_Antecipado.Value = 'NAO') Then
         Begin
           wValor_Contrato_Gp:='0'+DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_CONTRATO_GP_MOV','VAL_MOVIMENTO > 0 AND COD_CONTRATO_GP = '+DMContasPagar.QContasPagarBaixaCod_Contrato_Gp.Text );
           If StrToFloat(MEValorBaixa.Text) > StrToFloat(wValor_Contrato_Gp) Then
              Raise Exception.Create('Valor maior que o permitido para baixar - Contrato Garantia Preço');
         End;
   End;
  DMCaixa.pCalcFields_Caixa := False;  // para nao calcular os campos do calcfields da query QCaixaMov
  wValor_Juro           := 0;
  wValor_Desconto       := 0;
  wVlJuroFornecedores   := 0;
  wVlDesconto_Comercial := 0;
  wValor_Baixa          := 0;
  wValor_Taxa           := 0;
  wValor_IR             := 0;
  wValor_Outros         := 0;
  wCodMovBanco          := 0;   // guarda o codigo do movimento do banco para atualizar o nominal
  With DMContasPagar do
  Begin          // Begin With
    If StrToDate(MeDataBaixa.Text) < QContasPagarBaixaDt_Emissao.Value Then
      Raise Exception.Create('Data da Baixa menor que data de emissão do titulo');
    DMFinalidade.QFinalidade.Close;
    DMFinalidade.QFinalidade.SetVariable('Pk',QContasPagarBaixaCod_Finalidade.Value);
    DMFinalidade.QFinalidade.Open;
    If DMFinalidade.QFinalidade.Eof Then
       Raise Exception.Create('Finalidade não cadastrada');
    with DMFinalidade do
    begin
      wHistorico_Baixa := QFinalidadeCOD_HISTORICO_BAIXA.Text;
      wHistorico_Desc  := Trim(MeHistoricoDesconto.Text);
      wHistorico_Juro  := QFinalidadeCOD_HISTORICO_JURO.Text;
      wHistorico_Outros:= QFinalidadeCOD_HISTORICO_OUTROS.Text;
      wHistorico_Pix := QFinalidadeCOD_HISTORICO_PIX.Text;
      wHistorico_Credito := QFinalidadeCOD_HISTORICO_CARTAO_CREDITO.Text;
      wHistorico_Debito := QFinalidadeCOD_HISTORICO_CARTAO_DEBITO.Text;
    end;

    //QContasPagarBaixaCOD_NOTA_CAB.Value := pCodNotaCab;
    //QContasPagarBaixaCOD_CADASTRO.Value := pCodCadastro; 

    If RGFormaPagto.ItemIndex=1 then // Pagto.em cheque
      wHistorico_Cheque:=DMFinalidade.QFinalidadeCOD_HISTORICO_CHEQUE.Text;
    If DMParamSistema.QparamSistemaIND_CONTABILIZA.Value = 'S' Then
      wHistorico_Contabil:=DMFinalidade.QFinalidadeCOD_HISTORICO_CONTABIL.Text;
    wRecibo := DMFinalidade.QFinalidadeIND_RECIBO.Text;
    wMoeda  := DMFinalidade.QFinalidadeCOD_MOEDA.text;

    If Trim(MEValorBaixa.Text) <> '' then
      wValor_Baixa := StrToFloat(MEValorBaixa.Text)
    Else
      Raise Exception.Create('Informar Valor da Baixa');

    If Trim(MEValorJuro.Text) <> '' then
      wValor_Juro := StrToFloat(MEValorJuro.Text);
    If Trim(MEValorDesconto.Text) <> '' then
      wValor_Desconto := StrToFloat(MEValorDesconto.Text);
    If Trim(MEJuroFornecedores.Text) <> '' then
      wVlJuroFornecedores := StrToFloat(MEJuroFornecedores.Text);
    If Trim(MEDescontoComercial.Text) <> '' then
      wVlDesconto_Comercial := StrToFloat(MEDescontoComercial.Text);
    If Trim(MeValorIR.Text) <> '' Then
       wValor_IR := StrToFloat(Trim(MeValorIR.Text));
    If Trim(MeValorOutros.Text) <> '' Then
       wValor_Outros := StrToFloat(Trim(MeValorOutros.Text));
    If (Round((QContasPagarBaixaVal_Titulo.Value-wValor_Baixa)*1000) / 1000 >= 0) and
       ((wValor_Baixa <> 0) or (wValor_Desconto <> 0) or (wValor_Juro <> 0) Or (wValor_Outros <> 0)) then
    Begin   // Se o Lançamento não vai gerar um valor negativo.
      Try
        if not wBaixaEmLote then //quando é baixa em lote, ja é feita a chamada ao starttransaction
           DMOracle.DBCemapa.StartTransaction; // Inicia a transação
        // Inclusão de Movimentos
//        If DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'CAVALCA' Then
//          wValor_Baixa := wValor_Baixa - wValor_Juro;
        If QContasPagarBaixaDesc_Obra.Value <> '' Then
           wComplemento := QContasPagarBaixaDesc_Obra.Value
        Else
           wComplemento := QContasPagarBaixaNome.Value;
        If RGFormaPagto.ItemIndex <> 2 then
          If RGFormaPagto.ItemIndex = 0 then // Pagto em dinheiro
            wGera_Caixa := 'S'
          Else
            if DMParamSistema.QParamSistemaInd_Baixa_Cp_Bancos_Cx.Value = 'S' Then
              wGera_Caixa := 'S';  // pagto com cheque mas opção para caixa

        If wValor_Baixa > 0 then
        Begin     //Inclui no Movimento a Baixa
          QContasPagarBaixaMov.Insert; // INICIA A GRAVACAO DO  MOV.
          If wGera_Caixa = 'S' Then
          Begin
            If wHistorico_Baixa <> '' then
            Begin
              If DMParamSistema.QParamSistemaInd_Tipo_Integracao.Value = 'C' Then  // integração via caixa ou extra-caixa
                wValor:=wValor_Baixa
              Else
                wValor:=wValor_Baixa - wValor_Desconto;

              DMCaixa.IncluiCaixa(QContasPagarBaixaCod_Filial.Value,QContasPagarBaixaCod_Departamento.Value,
                                  StrToInt(wHistorico_Baixa),wValor,QContasPagarBaixaNum_Titulo.Value,
                                  QContasPagarBaixaCod_Cadastro.Value,wComplemento,
                                  StrToDate(MEDataBaixa.Text),QContasPagarBaixaCod_Conta_Pagar_Cab.Text,'','','');
              QContasPagarBaixaMovCod_Caixa_Mov.Value := DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
            End;
          end;
          If RGFormaPagto.ItemIndex=1 then  // pagto em Cheque
          Begin        // Inclusão no Movimento Bancário
            If wHistorico_Cheque <> '' then
            Begin
              //--alterado por Fabio 16/12/2002
              //----valor a ser baixado
              wValorPagamento:=(wValor_Baixa - wValor_Desconto - wVlDesconto_Comercial);
              // busca valor limite de cheque para cobrança da taxa
              try
                wValor_Limite_Cheque := StrToFloat('0'+DMOracle.BuscaNome('SELECT VAL_LIMITE_CHEQUE FROM TB_BANCO_AGENCIA', 'COD_BANCO_AGENCIA = '+FContaPagarBaixa.MECodBanco.Text));
              except
                wValor_Limite_Cheque := 0;
              end;
              //----compara o valor da baixa com o valor limite de cobrança da taxa
              if(RGPgtoTaxa.ItemIndex = 0) and (wValorPagamento >= wValor_Limite_Cheque) then
              Begin
                wInd_Pgto_Taxa:='S';
                wValor_Taxa:=((wValor_Baixa - wValor_Desconto - wVlDesconto_Comercial) *
                StrToFloat(DMOracle.BuscaNome('SELECT PERC_TAXA_LIMITE FROM TB_BANCO_AGENCIA',
                  ' COD_BANCO_AGENCIA = ' +FContaPagarBaixa.MECodBanco.Text)))/100;
              End
              else
                wInd_Pgto_Taxa:='N';
              If DMParamSistema.QParamSistemaInd_Tipo_Integracao.Value = 'C' Then  // integração via caixa ou extra-caixa
                wValor:=wValor_Baixa
              Else
                wValor:=wValor_Baixa - wValor_Desconto - wVlDesconto_Comercial;
              DMBancoAgencia.IncluiBanco(StrToInt(wHistorico_Cheque),StrToInt(MECodContaCorrente.Text),StrToInt(MENrCheque.Text),
              QContasPagarBaixaCod_Cadastro.Value,QContasPagarBaixaCod_Departamento.Value,StrToDate(MeDtPreDatado.Text),
              wValor,QContasPagarBaixaNome.Value,
                  'Título:'+floatToStr(QContasPagarBaixaNum_Titulo.Value)+' Tipo Docto:'+QContasPagarBaixaDesc_Tipo_Documento.Value,
              QContasPagarBaixaCod_Conta_Pagar_Cab.Text,'',wInd_Pgto_Taxa,'');
              QContasPagarBaixaMovCod_Bco_Movimento.Value:=DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
              wCodMovBanco := DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value; // guarda para atualizar o nominal caso emita cheque
              DMHistorico.QHistorico.Close;
              DMHistorico.QHistorico.SetVariable('PK', wHistorico_Cheque);
              DMHistorico.QHistorico.open;

              if(DMHistorico.QHistoricoCOD_HISTORICO_CAIXA.Value > 0) and (DMHistorico.QHistoricoCOD_DEPARTAMENTO.Value > 0) then
              //FAZ A CHAMADA DA PROCEDURE NO BANCO PARA INCLUIR UM LANÇAMENTO NO CAIXA
//              OPBanco.CallProcedure('PROC_ATUALIZA_MOV_CAIXA',[DMUsuario.CodUsuarioCorrente,0,DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value,'',DMHistorico.QHistoricoCOD_HISTORICO_CAIXA.Value]);
            End;
          End;
          if RGFormaPagto.ItemIndex = 3 then  // BANCO - PIX
          Begin
            If wHistorico_Pix <> '' then
            Begin
              wValor:=wValor_Baixa - wValor_Desconto;
              DMBancoAgencia.IncluiBanco(StrToInt(wHistorico_Pix),StrToInt(MECodContaCorrente.Text),StrToInt(QContasPagarBaixaNUM_TITULO.Text),
                                         QContasPagarBaixaCod_Cadastro.Value,QContasPagarBaixaCod_Departamento.Value,Date,wValor,QContasPagarBaixaNome.Value,
                                         'Título:'+floatToStr(QContasPagarBaixaNum_Titulo.Value)+' Tipo Docto:'+QContasPagarBaixaDesc_Tipo_Documento.Value,
                                         QContasPagarBaixaCod_Conta_Pagar_Cab.Text,'',wInd_Pgto_Taxa,'');
              QContasPagarBaixaMovCod_Bco_Movimento.Value:=DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
              wCodMovBanco := DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
            end
            else
              Raise Exception.Create('Cod. Histórico não foi informado na Finalidade: ' + QContasPagarBaixaCOD_FINALIDADE.Text + '!');
          end;

          if RGFormaPagto.ItemIndex = 4 then  // Cartão de Crédito
          Begin
            If wHistorico_Credito <> '' then
            Begin
              wValor:=wValor_Baixa - wValor_Desconto;
              DMCaixa.IncluiCaixa(QContasPagarBaixaCod_Filial.Value,QContasPagarBaixaCod_Departamento.Value,
                                  StrToInt(wHistorico_Credito),wValor,QContasPagarBaixaNum_Titulo.Value,
                                  QContasPagarBaixaCod_Cadastro.Value,wComplemento,
                                  StrToDate(MEDataBaixa.Text),QContasPagarBaixaCod_Conta_Pagar_Cab.Text,'','','');
              QContasPagarBaixaMovCod_Caixa_Mov.Value := DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
            end
            else
              Raise Exception.Create('Cod. Histórico para baixa de cartão de Crédito não foi informado na Finalidade: ' + QContasPagarBaixaCOD_FINALIDADE.Text + '!');
          end;

          if RGFormaPagto.ItemIndex = 5 then  // Cartão de Débito
          Begin
            If wHistorico_Debito <> '' then
            Begin
              wValor:=wValor_Baixa - wValor_Desconto;
              DMCaixa.IncluiCaixa(QContasPagarBaixaCod_Filial.Value,QContasPagarBaixaCod_Departamento.Value,
                                  StrToInt(wHistorico_Debito),wValor,QContasPagarBaixaNum_Titulo.Value,
                                  QContasPagarBaixaCod_Cadastro.Value,wComplemento,
                                  StrToDate(MEDataBaixa.Text),QContasPagarBaixaCod_Conta_Pagar_Cab.Text,'','','');
              QContasPagarBaixaMovCod_Caixa_Mov.Value := DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
            end
            else
              Raise Exception.Create('Cod. Histórico para baixa de cartão de Débito não foi informado na Finalidade: ' + QContasPagarBaixaCOD_FINALIDADE.Text + '!');
          end;

          If DMParamSistema.QparamSistemaIND_CONTABILIZA.Value = 'S' Then
          Begin  //  Lancto Contábil
            wCodDoc   := QContasPagarBaixaCod_Conta_Pagar_Cab.Value;
            wNumDoc   := FloatToStr(QContasPagarBaixaNum_Titulo.Value)+'-'+Copy(Trim(QContasPagarBaixaNome.Value),1,20)+' Cheque:'+Trim(MeNrCheque.Text);
            wFilial   := QContasPagarBaixaCod_Filial.Value;
            wFilial_Contabil := QContasPagarBaixaCod_Filial.Value;
            wContaDeb := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_BAIXA_DEB.Text;
            If RGFormaPagto.ItemIndex = 0 then // Pagto em dinheiro
              wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_BAIXA_CRED.Text
            else
              If RGFormaPagto.ItemIndex = 1 then // Pagto bancos
               Begin
                 wContaCred:=DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_PRIN_BCO_CRED FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MeCodBanco.Text);
                 If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GONZATTI') Then
                     wFilial_Contabil := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
               End
              Else
               Begin
                 If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And
                    (DMParamSistema.QParamSistemaDesc_Empresa.Value <> 'GRUPO CAVALCA') And
                    (QContasPagarBaixaCod_Filial.Value <> 9) Then
                    wFilial_Contabil := 1;
                 wContaCred:=DMFinalidade.QFinalidadeCOD_CONTABIL_BAIXA_CONT_CRED.Text;
                 wContaDeb := DMFinalidade.QFinalidadeCOD_CONTABIL_BAIXA_CONT_DEB.Text;
               End;

            wCodCompl  := QContasPagarBaixaCod_Cadastro.Value;
            wVlrLancto := wValor_Baixa - wValor_Taxa;
            wDtLancto  := StrToDate(MEDataBaixa.Text);
            If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CITY')   Or
               (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VIEIRA') Then  // permite que a agricola vieira mude a conta contabil - César
            Begin
              if FCaixa_Lanc_Cont = nil then
                FCaixa_Lanc_Cont := TFCaixa_Lanc_Cont.Create(Application);
              FCaixa_Lanc_Cont.MEContaCredito.text := wContaCred;
              if DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'UNICO' then
                FCaixa_Lanc_Cont.pFilial := 1
              else
                FCaixa_Lanc_Cont.pFilial := wFilial;
              FCaixa_Lanc_Cont.MEContaDebito.Text := wContaDeb;
              FCaixa_Lanc_Cont.MEContaDebitoExit(Self);
              FCaixa_Lanc_Cont.MEContaCreditoExit(Self);
              FCaixa_Lanc_Cont.MeFilialDebito.Text := FloatToStr(wFilial);
              FCaixa_Lanc_Cont.MeFilialCredito.Text := FloatToStr(wFilial);
              FCaixa_Lanc_Cont.ShowModal;
              wContaCred := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaCredito.text, '.');
              wContaDeb := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaDebito.text, '.');
            End;
            If (wContaCred <>  '') And (wContaDeb <> '') Then
            Begin
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaCred);
              QContasPagarBaixaMovCod_Lancto_Contabil_Deb.Value:=DMPlanilha.QLcto1Cod_Lancto_Contabil.Value;
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial_Contabil,wContaCred,'CREDITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaDeb);
              QContasPagarBaixaMovCod_Lancto_Contabil_Cred.Value:=DMPlanilha.QLcto1Cod_Lancto_Contabil.Value;
            End;
          End;
          // Grava o Movimento

          QContasPagarBaixaMovVAL_MOVIMENTO.Value       := wValor_Baixa - wValor_Taxa;
          QContasPagarBaixaMovDT_MOVIMENTO.Value        := StrToDate(MEDataBaixa.Text);
          QContasPagarBaixaMovDESC_OBSERVACAO.Value     := MEObservacao.Text;
          QContasPagarBaixaMovIND_TIPO_MOVIMENTO.Value  := 'PGTO. PRINCIPAL';
          QContasPagarBaixaMovIND_FORMA_PAGAMENTO.Value := RGFormaPagto.Items[RGFormaPagto.ItemIndex];

          //------alterado fabiano: 08/12/2004.
          if trim(MECodAdiantamento.text) <> '' then
            QContasPagarBaixaMovCOD_ADIANTAMENTO.Value    := strtoint(trim(MECodAdiantamento.text))
          else
            QContasPagarBaixaMovCOD_ADIANTAMENTO.text    := '';
          //--------------------------

          If CbDevolucao.Checked Then
            QContasPagarBaixaMovInd_Devolucao.Value := 'SIM';
          QContasPagarBaixaMov.Post;
          // Grava o Lançamento
        End; // Termino da Inclusão dos Movimnetos de Baixa

        If wValor_Desconto>0 then
        Begin     //Inclui no Movimento o Desconto
          QContasPagarBaixaMov.Insert;
          If (DMParamSistema.QParamSistemaInd_Tipo_Integracao.Value = 'C') Then  // integração via caixa (tudo passa pelo caixa)
           Begin
             If wGera_Caixa = 'S' Then // Pagto em dinheiro
             begin
               If wHistorico_Desc <>  '' then
               Begin
                 DMCaixa.IncluiCaixa(QContasPagarBaixaCod_Filial.Value,
                                     QContasPagarBaixaCod_Departamento.Value,
                                     StrToInt(wHistorico_Desc),
                                     wValor_Desconto,
                                     QContasPagarBaixaNum_Titulo.Value,
                                     QContasPagarBaixaCod_Cadastro.Value,
                                     wComplemento,
                                     StrToDate(MEDataBaixa.Text),
                                     QContasPagarBaixaCod_Conta_Pagar_Cab.Text,
                                     '','','');
                 QContasPagarBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
               End;
             end;
             If (RGFormaPagto.ItemIndex = 1) Then  // Pagamento via banco
             Begin
               DMBancoAgencia.IncluiBanco(StrToInt(wHistorico_Desc),StrToInt(MECodContaCorrente.Text),StrToInt(MENrCheque.Text),
               QContasPagarBaixaCod_Cadastro.Value,QContasPagarBaixaCod_Departamento.Value,StrToDate(MeDtPreDatado.Text),
               wValor_Desconto,QContasPagarBaixaNome.Value,
                   'Título:'+floatToStr(QContasPagarBaixaNum_Titulo.Value)+' Tipo Docto:'+QContasPagarBaixaDesc_Tipo_Documento.Value,
               QContasPagarBaixaCod_Conta_Pagar_Cab.Text,'',wInd_Pgto_Taxa,'');
               QContasPagarBaixaMovCod_Bco_Movimento.Value:=DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
             end;
           End;
          If DMParamSistema.QparamSistemaIND_CONTABILIZA.Value = 'S' Then
          Begin
            wCodDoc    := QContasPagarBaixaCod_Conta_Pagar_Cab.Value;
            wNumDoc    := FloatToStr(QContasPagarBaixaNum_Titulo.Value)+'-'+Trim(QContasPagarBaixaNome.Value);
            wFilial    := QContasPagarBaixaCod_Filial.Value;
            wFilial_Contabil := QContasPagarBaixaCod_Filial.Value;
            wContaCred := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_DESC_CRED.Text;

            If RGFormaPagto.ItemIndex <> 1 then // Pagto em dinheiro
              wContaDeb := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_DESC_DEB.Text
            else
             Begin
               wContaDeb := DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_DESC_BCO_DEB FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MeCodBanco.Text);
               If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GONZATTI') Then
                  wFilial_Contabil := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
             End;
            If RGFormaPagto.ItemIndex = 2 then // contabil
              If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And
                 (DMParamSistema.QParamSistemaDesc_Empresa.Value <> 'GRUPO CAVALCA') And
                 (QContasPagarBaixaCod_Filial.Value <> 9) Then
                 wFilial_Contabil := 1;

            wCodCompl  := QContasPagarBaixaCod_Cadastro.Value;
            wVlrLancto := wValor_Desconto;
            wDtLancto  := StrToDate(MEDataBaixa.Text);

            If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CITY')   Or
               (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VIEIRA') Then  // permite que a agricola vieira mude a conta contabil - César
            Begin
              if FCaixa_Lanc_Cont = nil then
                FCaixa_Lanc_Cont := TFCaixa_Lanc_Cont.Create(Application);
              if DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'UNICO' then
                FCaixa_Lanc_Cont.pFilial := 1
              else
                FCaixa_Lanc_Cont.pFilial := wFilial;
              FCaixa_Lanc_Cont.MEContaCredito.text := wContaCred;
              FCaixa_Lanc_Cont.MEContaDebito.Text := wContaDeb;
              FCaixa_Lanc_Cont.MEContaDebitoExit(Self);
              FCaixa_Lanc_Cont.MEContaCreditoExit(Self);
              FCaixa_Lanc_Cont.MeFilialDebito.Text := FloatToStr(wFilial);
              FCaixa_Lanc_Cont.MeFilialCredito.Text := FloatToStr(wFilial);
              FCaixa_Lanc_Cont.ShowModal;
              wContaCred := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaCredito.text, '.');
              wContaDeb := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaDebito.text, '.');
            End;

            If (wContaCred <> '') And (wContaDeb <> '') Then
            Begin
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaDeb);
              QContasPagarBaixaMovCOD_LANCTO_CONTABIL_CRED.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaCred);
              QContasPagarBaixaMovCOD_LANCTO_CONTABIL_DEB.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
            End;
          End;

          QContasPagarBaixaMovVAL_MOVIMENTO.Value       := wValor_Desconto;
          QContasPagarBaixaMovDT_MOVIMENTO.Value        := StrToDate(MEDataBaixa.Text);
          QContasPagarBaixaMovDESC_OBSERVACAO.Value     := MEObservacao.Text;
          QContasPagarBaixaMovIND_TIPO_MOVIMENTO.Value  := 'DESCONTO';
          QContasPagarBaixaMovIND_FORMA_PAGAMENTO.Value := RGFormaPagto.Items[RGFormaPagto.ItemIndex];

          //---adicionado codigo do adiantamento no desconto. Diego A
          if trim(MECodAdiantamento.text) <> '' then
            QContasPagarBaixaMovCOD_ADIANTAMENTO.Value    := strtoint(trim(MECodAdiantamento.text))
          else
            QContasPagarBaixaMovCOD_ADIANTAMENTO.text    := '';

          //---

          If CbDevolucao.Checked Then
            QContasPagarBaixaMovInd_Devolucao.Value := 'SIM';
          QContasPagarBaixaMov.Post;
        End; // Término da Inclusao do Movimento de Desconto

        If wVlJuroFornecedores > 0 then
        Begin     //Inclui no Movimento o Juro fornecedor
          QContasPagarBaixaMov.Insert;
          If wGera_Caixa = 'S' Then // Pagto em dinheiro
          begin
            If wHistorico_Juro <>  '' then
            Begin
              DMCaixa.IncluiCaixa(QContasPagarBaixaCod_Filial.Value,
                                  QContasPagarBaixaCod_Departamento.Value,
                                  StrToInt(wHistorico_Juro),
                                  wVlJuroFornecedores,
                                  QContasPagarBaixaNum_Titulo.Value,
                                  QContasPagarBaixaCod_Cadastro.Value,
                                  wComplemento,
                                  StrToDate(MEDataBaixa.Text),
                                  QContasPagarBaixaCod_Conta_Pagar_Cab.Text,
                                  '','','');

              QContasPagarBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
            End;
          end;
          If RGFormaPagto.ItemIndex=1 then // pagto em cheques
          Begin        // Inclusão no Movimento Bancário
            If wHistorico_Juro <> '' then
            Begin
              DMBancoAgencia.IncluiBanco(
                   StrToInt(wHistorico_Juro),
                   StrToInt(MECodContaCorrente.Text),
                   StrToInt(MENrCheque.Text),
                   QContasPagarBaixaCod_Cadastro.Value,
                   QContasPagarBaixaCod_Departamento.Value,
                   StrToDate(MeDtPreDatado.Text),
                   wVlJuroFornecedores,
                   QContasPagarBaixaNome.Value,
                   'Título:'+floatToStr(QContasPagarBaixaNum_Titulo.Value)+' Tipo Docto:'+QContasPagarBaixaDesc_Tipo_Documento.Value,
                   QContasPagarBaixaCod_Conta_Pagar_Cab.Text,'','N','');
              QContasPagarBaixaMovCod_Bco_Movimento.Value := DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
            End;
          End;
          If DMParamSistema.QparamSistemaIND_CONTABILIZA.Value = 'S' Then
          Begin
            wCodDoc   := QContasPagarBaixaCod_Conta_Pagar_Cab.Value;
            wNumDoc   := FloatToStr(QContasPagarBaixaNum_Titulo.Value)+'-'+Trim(QContasPagarBaixaNome.Value);
            wFilial   := QContasPagarBaixaCod_Filial.Value;
            wFilial_Contabil := QContasPagarBaixaCod_Filial.Value;
            wContaDeb := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_DESC_FIN_CRED.Text;
                                                     // ficou invertido para aproveitamento de campo no banco de dados
            If RGFormaPagto.ItemIndex <> 1 then // Pagto em dinheiro
              wContaCred := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_JURO_CRED.Text
            else
             Begin
               wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_JURO_BCO_CRED FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MeCodBanco.Text);
               If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GONZATTI') Then
                  wFilial_Contabil := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
             End;
            If RGFormaPagto.ItemIndex = 2 then // contabil
              If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And
                 (DMParamSistema.QParamSistemaDesc_Empresa.Value <> 'GRUPO CAVALCA') And
                 (QContasPagarBaixaCod_Filial.Value <> 9) Then
                 wFilial_Contabil := 1;


            wCodCompl  :=QContasPagarBaixaCod_Cadastro.Value;
            wVlrLancto :=wVlJuroFornecedores;
            wDtLancto  :=StrToDate(MEDataBaixa.Text);

            If (wContaCred <> '') And (wContaDeb <> '') Then
            Begin
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaCred);
              QContasPagarBaixaMovCOD_LANCTO_CONTABIL_DEB.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial_Contabil,wContaCred,'CREDITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaDeb);
              QContasPagarBaixaMovCOD_LANCTO_CONTABIL_CRED.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
            End;
          End;

          QContasPagarBaixaMovVal_Movimento.Value       :=wVlJuroFornecedores;
          QContasPagarBaixaMovDt_Movimento.Value        :=StrToDate(MEDataBaixa.Text);
          QContasPagarBaixaMovDesc_Observacao.Value     :=MEObservacao.Text;
          QContasPagarBaixaMovInd_Tipo_Movimento.Value  :='JURO FORN';
          QContasPagarBaixaMovInd_Forma_Pagamento.Value :=RGFormaPagto.Items[RGFormaPagto.ItemIndex];
          if trim(MECodAdiantamento.text) <> '' then
            QContasPagarBaixaMovCOD_ADIANTAMENTO.Value    := strtoint(trim(MECodAdiantamento.text))
          else
            QContasPagarBaixaMovCOD_ADIANTAMENTO.text    := '';

          If CbDevolucao.Checked Then
            QContasPagarBaixaMovInd_Devolucao.Value := 'SIM';
          QContasPagarBaixaMov.Post;
        End; // Término da Inclusao do Movimento de Desconto Financeiro
        If wVlDesconto_Comercial > 0 then
        Begin     //Inclui no Movimento o Desconto Comercial
          QContasPagarBaixaMov.Insert;
          If wGera_Caixa = 'S' Then // Pagto em dinheiro
          begin
            If wHistorico_Desc <>  '' then
            Begin
              DMCaixa.IncluiCaixa(QContasPagarBaixaCod_Filial.Value,
                                  QContasPagarBaixaCod_Departamento.Value,
                                  StrToInt(wHistorico_Desc),
                                  wVlDesconto_Comercial,
                                  QContasPagarBaixaNum_Titulo.Value,
                                  QContasPagarBaixaCod_Cadastro.Value,
                                  wComplemento,
                                  StrToDate(MEDataBaixa.Text),
                                  QContasPagarBaixaCod_Conta_Pagar_Cab.Text,
                                  '','','');

              QContasPagarBaixaMovCOD_CAIXA_MOV.Value := DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
            End;
          end;
          If DMParamSistema.QparamSistemaIND_CONTABILIZA.Value = 'S' Then
          Begin
            wCodDoc    := QContasPagarBaixaCod_Conta_Pagar_Cab.Value;
            wNumDoc    := FloatToStr(QContasPagarBaixaNum_Titulo.Value)+'-'+Trim(QContasPagarBaixaNome.Value);
            wFilial    := QContasPagarBaixaCod_Filial.Value;
            wFilial_Contabil := QContasPagarBaixaCod_Filial.Value;
            wContaCred := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_DESC_COM_CRED.Text;

            If RGFormaPagto.ItemIndex <> 1 then // Pagto em dinheiro
              wContaDeb:=DMFinalidade.QFinalidadeCOD_CONTABIL_VL_DESC_DEB.Text
            else
             Begin
               wContaDeb:=DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_DESC_BCO_DEB FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MeCodBanco.Text);
               If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GONZATTI') Then
                  wFilial_Contabil := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
             End;
            If RGFormaPagto.ItemIndex = 2 then // contabil
              If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And
                 (DMParamSistema.QParamSistemaDesc_Empresa.Value <> 'GRUPO CAVALCA') And
                 (QContasPagarBaixaCod_Filial.Value <> 9) Then
                 wFilial_Contabil := 1;

            wCodCompl  := QContasPagarBaixaCod_Cadastro.Value;
            wVlrLancto := wVlDesconto_Comercial;
            wDtLancto  := StrToDate(MEDataBaixa.Text);

            If (wContaCred <> '') And (wContaDeb <> '') Then
            Begin
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaDeb);
              QContasPagarBaixaMovCOD_LANCTO_CONTABIL_CRED.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaCred);
              QContasPagarBaixaMovCOD_LANCTO_CONTABIL_DEB.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
            End;
          End;
          QContasPagarBaixaMovVAL_MOVIMENTO.Value       := wVlDesconto_Comercial;
          QContasPagarBaixaMovDT_MOVIMENTO.Value        := StrToDate(MEDataBaixa.Text);
          If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GONZATTI' Then
             QContasPagarBaixaMovDESC_OBSERVACAO.Value  := MEObservacao.Text;
          QContasPagarBaixaMovIND_TIPO_MOVIMENTO.Value  := 'DESCONTO';
          QContasPagarBaixaMovIND_FORMA_PAGAMENTO.Value := RGFormaPagto.Items[RGFormaPagto.ItemIndex];
          if trim(MECodAdiantamento.text) <> '' then
            QContasPagarBaixaMovCOD_ADIANTAMENTO.Value    := strtoint(trim(MECodAdiantamento.text))
          else
            QContasPagarBaixaMovCOD_ADIANTAMENTO.text    := '';

          If CbDevolucao.Checked Then
            QContasPagarBaixaMovIND_DEVOLUCAO.Value := 'SIM';
          QContasPagarBaixaMov.Post;
        End; // Término da Inclusao do Movimento de Desconto Comercial

        If wValor_Juro>0 then
        Begin     //Inclui no Movimento do Juro
          QContasPagarBaixaMov.Insert;
          If wGera_Caixa = 'S' Then // Pagto em dinheiro
          begin
            If wHistorico_Juro <>  '' then
            Begin
              DMCaixa.IncluiCaixa(QContasPagarBaixaCod_Filial.Value,
                                  QContasPagarBaixaCOD_DEPARTAMENTO.Value,
                                  StrToInt(wHistorico_Juro),
                                  wValor_Juro,
                                  QContasPagarBaixaNUM_TITULO.Value,
                                  QContasPagarBaixaCOD_CADASTRO.Value,
                                  wComplemento,
                                  StrToDate(MEDataBaixa.Text),
                                  QContasPagarBaixaCOD_CONTA_PAGAR_CAB.Text,'','','');

               QContasPagarBaixaMovCOD_CAIXA_MOV.Value := DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
            End;
          end;
          If RGFormaPagto.ItemIndex=1 then // pagto em cheques
          Begin        // Inclusão no Movimento Bancário
            If wHistorico_Juro <> '' then
            Begin
              DMBancoAgencia.IncluiBanco(StrToInt(wHistorico_Juro),
                                         StrToInt(MECodContaCorrente.Text),
                                         StrToInt(MENrCheque.Text),
                                         QContasPagarBaixaCod_Cadastro.Value,
                                         QContasPagarBaixaCod_Departamento.Value,
                                         StrToDate(MeDtPreDatado.Text),
                                         wValor_Juro,
                                         QContasPagarBaixaNome.Value,
                                         'Título:'+floatToStr(QContasPagarBaixaNum_Titulo.Value)+' Tipo Docto:'+QContasPagarBaixaDesc_Tipo_Documento.Value,
                                         QContasPagarBaixaCod_Conta_Pagar_Cab.Text,'','N','');
              QContasPagarBaixaMovCod_Bco_Movimento.Value:=DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
            End;
          End;

          If DMParamSistema.QparamSistemaIND_CONTABILIZA.Value = 'S' Then
          Begin
            wCodDoc   := QContasPagarBaixaCod_Conta_Pagar_Cab.Value;
            wNumDoc   := FloatToStr(QContasPagarBaixaNum_Titulo.Value)+'-'+Trim(QContasPagarBaixaNome.Value);
            wFilial   := QContasPagarBaixaCod_Filial.Value;
            wFilial_Contabil := QContasPagarBaixaCod_Filial.Value;
            wContaDeb := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_JURO_DEB.Text;

            If RGFormaPagto.ItemIndex <> 1then // Pagto em dinheiro
              wContaCred := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_JURO_CRED.Text
            else
             Begin
               wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_JURO_BCO_CRED FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MeCodBanco.Text);
               wFilial_Contabil := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
             End;
            If RGFormaPagto.ItemIndex = 2 then // contabil
              If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And
                 (DMParamSistema.QParamSistemaDesc_Empresa.Value <> 'GRUPO CAVALCA') And
                 (QContasPagarBaixaCod_Filial.Value <> 9) Then
                 wFilial_Contabil := 1;

            wCodCompl  := QContasPagarBaixaCOD_CADASTRO.Value;
            wVlrLancto := wValor_Juro;
            wDtLancto  := StrToDate(MEDataBaixa.Text);
            If (wContaCred <> '') And  (wContaDeb <> '') Then
            Begin
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaCred);
              QContasPagarBaixaMovCOD_LANCTO_CONTABIL_DEB.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial_Contabil,wContaCred,'CREDITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaDeb);
              QContasPagarBaixaMovCod_Lancto_Contabil_Cred.Value := DMPlanilha.QLcto1Cod_Lancto_Contabil.Value;
            End;
          End;
          QContasPagarBaixaMovVal_Movimento.Value       := wValor_Juro;
          QContasPagarBaixaMovDt_Movimento.Value        := StrToDate(MEDataBaixa.Text);
          QContasPagarBaixaMovDesc_Observacao.Value     := MEObservacao.Text;
          QContasPagarBaixaMovInd_Tipo_Movimento.Value  := 'PGTO. JUROS';
          QContasPagarBaixaMovInd_Forma_Pagamento.Value := RGFormaPagto.Items[RGFormaPagto.ItemIndex];
          if trim(MECodAdiantamento.text) <> '' then
            QContasPagarBaixaMovCOD_ADIANTAMENTO.Value  := strtoint(trim(MECodAdiantamento.text))
          else
            QContasPagarBaixaMovCOD_ADIANTAMENTO.text   := '';

          If CbDevolucao.Checked Then
            QContasPagarBaixaMovInd_Devolucao.Value := 'SIM';
          QContasPagarBaixaMov.Post;
        End;

        If Trim(MeVariacaoPos.Text) <> '' then
        Begin     //Inclui no Movimento o Variacao Cambial Positiva
          wHistorico_Variacao := DMFinalidade.QFinalidadeCOD_HISTORICO_VARIACAO_POS.Text;
          QContasPagarBaixaMov.Insert;
          If wGera_Caixa = 'S' Then // Pagto em dinheiro
          begin
            If wHistorico_Variacao <>  '' then
            Begin
              DMCaixa.IncluiCaixa(QContasPagarBaixaCod_Filial.Value,
                                  QContasPagarBaixaCod_Departamento.Value,
                                  StrToInt(wHistorico_Variacao),
                                  StrToFloat(Trim(MeVariacaoPos.Text)),
                                  QContasPagarBaixaNum_Titulo.Value,
                                  QContasPagarBaixaCod_Cadastro.Value,
                                  wComplemento,
                                  StrToDate(MEDataBaixa.Text),
                                  QContasPagarBaixaCod_Conta_Pagar_Cab.Text,
                                  '','','');
              QContasPagarBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
            End;
          end;
          If RGFormaPagto.ItemIndex=1 then // pagto em cheques
          Begin        // Inclusão no Movimento Bancário
            If wHistorico_Variacao <> '' then
            Begin
              DMBancoAgencia.IncluiBanco(StrToInt(wHistorico_Variacao),
                                         StrToInt(MECodContaCorrente.Text),
                                         StrToInt(MENrCheque.Text),
                                         QContasPagarBaixaCod_Cadastro.Value,
                                         QContasPagarBaixaCod_Departamento.Value,
                                         StrToDate(MeDtPreDatado.Text),
                                         StrToFloat(Trim(MeVariacaoPos.Text)),
                                         QContasPagarBaixaNome.Value,
                                         'Título:'+floatToStr(QContasPagarBaixaNum_Titulo.Value)+' Tipo Docto:'+QContasPagarBaixaDesc_Tipo_Documento.Value,
                                         QContasPagarBaixaCod_Conta_Pagar_Cab.Text,
                                         '',
                                         'N','');
              QContasPagarBaixaMovCod_Bco_Movimento.Value:=DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
            End;
          End;

          If DMParamSistema.QparamSistemaIND_CONTABILIZA.Value = 'S' Then
          Begin
            wCodDoc    := QContasPagarBaixaCod_Conta_Pagar_Cab.Value;
            wNumDoc    := FloatToStr(QContasPagarBaixaNum_Titulo.Value)+'-'+Trim(QContasPagarBaixaNome.Value);
            wFilial    := QContasPagarBaixaCod_Filial.Value;
            wFilial_Contabil := QContasPagarBaixaCod_Filial.Value;
            wContaDeb  := DMFinalidade.QFinalidadeCOD_CONTABIL_VARIACAO_POS_DEB.Text;
            wContaCred := DMFinalidade.QFinalidadeCOD_CONTABIL_VARIACAO_POS_CRED.Text;
            wCodCompl  := QContasPagarBaixaCOD_CADASTRO.Value;
            wVlrLancto := StrToFloat(Trim(MeVariacaoPos.Text));
            wDtLancto  := StrToDate(MEDataBaixa.Text);
            If RGFormaPagto.ItemIndex = 1 then // Pagto banco
               wFilial_Contabil := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;

            If (wContaCred <> '') And  (wContaDeb <> '') Then
            Begin
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaCred);
              QContasPagarBaixaMovCOD_LANCTO_CONTABIL_DEB.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial_Contabil,wContaCred,'CREDITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaDeb);
              QContasPagarBaixaMovCOD_LANCTO_CONTABIL_CRED.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
            End;
          End;

          QContasPagarBaixaMovVAL_MOVIMENTO.Value       := StrToFloat(Trim(MeVariacaoPos.Text));
          QContasPagarBaixaMovDT_MOVIMENTO.Value        := StrToDate(MEDataBaixa.Text);
          QContasPagarBaixaMovDESC_OBSERVACAO.Value     := MEObservacao.Text;
          QContasPagarBaixaMovIND_TIPO_MOVIMENTO.Value  := 'VARIACAO POS';
          QContasPagarBaixaMovIND_FORMA_PAGAMENTO.Value := RGFormaPagto.Items[RGFormaPagto.ItemIndex];

          If CbDevolucao.Checked Then
            QContasPagarBaixaMovInd_Devolucao.Value := 'SIM';
          QContasPagarBaixaMov.Post;
        End;  // FINAL ROTINA VARIACAO CAMBIAL POSITIVA

        If Trim(MeVariacaoNeg.Text) <> '' then
        Begin     //Inclui no Movimento o Variacao Cambial Negativa
          wHistorico_Variacao:=DMFinalidade.QFinalidadeCOD_HISTORICO_VARIACAO_NEG.Text;
          QContasPagarBaixaMov.Insert;
          If wGera_Caixa = 'S' Then // Pagto em dinheiro
          begin
            If wHistorico_Variacao <>  '' then
            Begin
              DMCaixa.IncluiCaixa(QContasPagarBaixaCod_Filial.Value,
                                  QContasPagarBaixaCod_Departamento.Value,
                                  StrToInt(wHistorico_Variacao),
                                  StrToFloat(Trim(MeVariacaoNeg.Text)),
                                  QContasPagarBaixaNum_Titulo.Value,
                                  QContasPagarBaixaCod_Cadastro.Value,
                                  wComplemento,
                                  StrToDate(MEDataBaixa.Text),
                                  QContasPagarBaixaCod_Conta_Pagar_Cab.Text,
                                  '','','');
              QContasPagarBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
            End;
          end;
          If RGFormaPagto.ItemIndex = 1 then // pagto em cheques
          Begin        // Inclusão no Movimento Bancário
            If wHistorico_Variacao <> '' then
            Begin
              DMBancoAgencia.IncluiBanco(StrToInt(wHistorico_Variacao),
                                         StrToInt(MECodContaCorrente.Text),
                                         StrToInt(MENrCheque.Text),
                                         QContasPagarBaixaCod_Cadastro.Value,
                                         QContasPagarBaixaCod_Departamento.Value,
                                         StrToDate(MeDtPreDatado.Text),
                                         StrToFloat(Trim(MeVariacaoNeg.Text)),
                                         QContasPagarBaixaNome.Value,
                                         'Título:'+floatToStr(QContasPagarBaixaNum_Titulo.Value)+' Tipo Docto:'+QContasPagarBaixaDesc_Tipo_Documento.Value,
                                         QContasPagarBaixaCod_Conta_Pagar_Cab.Text,
                                         '',
                                         'N','');
              QContasPagarBaixaMovCod_Bco_Movimento.Value:=DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
            End;
          End;
          If DMParamSistema.QparamSistemaIND_CONTABILIZA.Value = 'S' Then
          Begin
            wCodDoc    := QContasPagarBaixaCod_Conta_Pagar_Cab.Value;
            wNumDoc    := FloatToStr(QContasPagarBaixaNum_Titulo.Value)+'-'+Trim(QContasPagarBaixaNome.Value);
            wFilial    := QContasPagarBaixaCod_Filial.Value;
            wFilial_Contabil := QContasPagarBaixaCod_Filial.Value;
            wContaDeb  := DMFinalidade.QFinalidadeCOD_CONTABIL_VARIACAO_NEG_DEB.Text;
            wContaCred := DMFinalidade.QFinalidadeCOD_CONTABIL_VARIACAO_NEG_CRED.Text;
            wCodCompl  := QContasPagarBaixaCod_Cadastro.Value;
            wVlrLancto := StrToFloat(Trim(MeVariacaoNeg.Text));
            wDtLancto  := StrToDate(MEDataBaixa.Text);
            If RGFormaPagto.ItemIndex = 1 then // Pagto banco
               wFilial_Contabil := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;

            If (wContaCred <> '') And  (wContaDeb <> '') Then
            Begin
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaCred);
              QContasPagarBaixaMovCOD_LANCTO_CONTABIL_DEB.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial_Contabil,wContaCred,'CREDITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaDeb);
              QContasPagarBaixaMovCod_Lancto_Contabil_Cred.Value:=DMPlanilha.QLcto1Cod_Lancto_Contabil.Value;
            End;
          End;
          QContasPagarBaixaMovVAL_MOVIMENTO.Value       := StrToFloat(Trim(MeVariacaoNeg.Text));
          QContasPagarBaixaMovDT_MOVIMENTO.Value        := StrToDate(MEDataBaixa.Text);
          QContasPagarBaixaMovDESC_OBSERVACAO.Value     := MEObservacao.Text;
          QContasPagarBaixaMovIND_TIPO_MOVIMENTO.Value  := 'VARIACAO NEG';
          QContasPagarBaixaMovIND_FORMA_PAGAMENTO.Value := RGFormaPagto.Items[RGFormaPagto.ItemIndex];
          If CbDevolucao.Checked Then
             QContasPagarBaixaMovInd_Devolucao.Value := 'SIM';
          QContasPagarBaixaMov.Post;
        End;  // FINAL ROTINA VARIACAO CAMBIAL NEGATIVA

        If wValor_IR > 0 then
        Begin     //Inclui no Movimento o IR
          QContasPagarBaixaMov.Insert;
          If DMParamSistema.QparamSistemaIND_CONTABILIZA.Value = 'S' Then
          Begin
            wCodDoc    := QContasPagarBaixaCod_Conta_Pagar_Cab.Value;
            wNumDoc    := FloatToStr(QContasPagarBaixaNum_Titulo.Value)+'-'+Trim(QContasPagarBaixaNome.Value);
            wFilial    := QContasPagarBaixaCod_Filial.Value;
            wFilial_Contabil := QContasPagarBaixaCod_Filial.Value;
            wContaCred := DMFinalidade.QFinalidadeCOD_CONTABIL_IR_CRED.Text;
            wContaDeb := DMFinalidade.QFinalidadeCOD_CONTABIL_IR_DEB.Text;

            If RGFormaPagto.ItemIndex = 2 then // contabil
              If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And
                 (DMParamSistema.QParamSistemaDesc_Empresa.Value <> 'GRUPO CAVALCA') And
                 (QContasPagarBaixaCod_Filial.Value <> 9) Then
                 wFilial_Contabil := 1;

            wCodCompl  := QContasPagarBaixaCod_Cadastro.Value;
            wVlrLancto := wValor_IR;
            wDtLancto  := StrToDate(MEDataBaixa.Text);

            If (wContaCred <> '') And (wContaDeb <> '') Then
            Begin
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaDeb);
              QContasPagarBaixaMovCOD_LANCTO_CONTABIL_CRED.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaCred);
              QContasPagarBaixaMovCOD_LANCTO_CONTABIL_DEB.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
            End;
          End;

          QContasPagarBaixaMovVAL_MOVIMENTO.Value       := wValor_IR;
          QContasPagarBaixaMovDT_MOVIMENTO.Value        := StrToDate(MEDataBaixa.Text);
          QContasPagarBaixaMovDESC_OBSERVACAO.Value     := MEObservacao.Text;
          QContasPagarBaixaMovIND_TIPO_MOVIMENTO.Value  := 'IMPOSTO RENDA';
          QContasPagarBaixaMovIND_FORMA_PAGAMENTO.Value := RGFormaPagto.Items[RGFormaPagto.ItemIndex];

          If CbDevolucao.Checked Then
            QContasPagarBaixaMovInd_Devolucao.Value := 'SIM';
          QContasPagarBaixaMov.Post;
        End; // Término da Inclusao do Movimento de IR

        // Rotina que ira contabilizar e gerar caixa da taxa de emissao de cheque acima de valor
        If (wInd_Pgto_Taxa = 'S') And (wValor_Taxa > 0) Then
        Begin
          wHistorico_Taxa:=DMOracle.BuscaNome('SELECT COD_HISTORICO_CAIXA_TAXA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+FContaPagarBaixa.MECodBanco.Text);
          QContasPagarBaixaMov.Insert;
          If (wHistorico_Taxa <> '') and (DmParamSistema.QParamSistemaCOD_EMPRESA.value <> 'MOINHO') then
          Begin
            DMCaixa.IncluiCaixa(QContasPagarBaixaCod_Filial.Value,
                                QContasPagarBaixaCod_Departamento.Value,
                                StrToInt(wHistorico_Taxa),
                                wValor_Taxa,
                                QContasPagarBaixaNum_Titulo.Value,
                                QContasPagarBaixaCod_Cadastro.Value,
                                wComplemento,
                                StrToDate(MEDataBaixa.Text),
                                QContasPagarBaixaCod_Conta_Pagar_Cab.Text,
                                '','','');
            QContasPagarBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
          End;
          If DMParamSistema.QparamSistemaIND_CONTABILIZA.Value = 'S' Then
          Begin
            wCodDoc    := QContasPagarBaixaCOD_CONTA_PAGAR_CAB.Value;
            wNumDoc    := FloatToStr(QContasPagarBaixaNUM_TITULO.Value)+'-'+Trim(QContasPagarBaixaNOME.Value);
            wFilial    := QContasPagarBaixaCOD_FILIAL.Value;
            wFilial_Contabil := QContasPagarBaixaCOD_FILIAL.Value;
            wContaDeb  := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_BAIXA_DEB.Text;
            //wContaDeb:= DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_TAXA_DEB FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+FContaPagarBaixa.MECodBanco.Text);
            wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_TAXA_CRED FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+FContaPagarBaixa.MECodBanco.Text);
            wCodCompl  := QContasPagarBaixaCOD_CADASTRO.Value;
            wVlrLancto := wValor_Taxa;
            wDtLancto  := StrToDate(MEDataBaixa.Text);
            If RGFormaPagto.ItemIndex = 1 then // Pagto banco
               wFilial_Contabil := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;

            If (wContaCred <> '') And  (wContaDeb <> '') Then
            Begin
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaCred);
              QContasPagarBaixaMovCOD_LANCTO_CONTABIL_DEB.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial_Contabil,wContaCred,'CREDITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaDeb);
              QContasPagarBaixaMovCOD_LANCTO_CONTABIL_CRED.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
            End;
          End;
          QContasPagarBaixaMovVAL_MOVIMENTO.Value       := wValor_Taxa;
          QContasPagarBaixaMovDT_MOVIMENTO.Value        := StrToDate(MEDataBaixa.Text);
          QContasPagarBaixaMovDESC_OBSERVACAO.Value     := MEObservacao.Text;
          QContasPagarBaixaMovIND_TIPO_MOVIMENTO.Value  := 'TAXA CHEQUE';
          QContasPagarBaixaMovIND_FORMA_PAGAMENTO.Value := RGFormaPagto.Items[RGFormaPagto.ItemIndex];
          If CbDevolucao.Checked Then
            QContasPagarBaixaMovIND_DEVOLUCAO.Value := 'SIM';
          QContasPagarBaixaMov.Post;
        End; // termino da rotina que contabiliza e gera caixa

        If wValor_Outros > 0 then
        Begin     //Inclui no Movimento o Outros Valores
          QContasPagarBaixaMov.Insert;
          If wGera_Caixa = 'S' Then // Pagto em dinheiro
          begin
            If wHistorico_Outros <>  '' then
            Begin
              DMCaixa.IncluiCaixa(QContasPagarBaixaCod_Filial.Value,
                                  QContasPagarBaixaCod_Departamento.Value,
                                  StrToInt(wHistorico_Outros),
                                  wValor_Outros,
                                  QContasPagarBaixaNum_Titulo.Value,
                                  QContasPagarBaixaCod_Cadastro.Value,
                                  wComplemento,
                                  StrToDate(MEDataBaixa.Text),
                                  QContasPagarBaixaCod_Conta_Pagar_Cab.Text,
                                  '','','');
              QContasPagarBaixaMovCod_Caixa_Mov.Value:=DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
            End;
          end;
          If RGFormaPagto.ItemIndex = 1 then // pagto em cheques
          Begin        // Inclusão no Movimento Bancário
            If wHistorico_Outros <> '' then
            Begin
              DMBancoAgencia.IncluiBanco(StrToInt(wHistorico_Outros),
                                         StrToInt(MECodContaCorrente.Text),
                                         StrToInt(MENrCheque.Text),
                                         QContasPagarBaixaCod_Cadastro.Value,
                                         QContasPagarBaixaCod_Departamento.Value,
                                         StrToDate(MeDtPreDatado.Text),
                                         wValor_Outros,
                                         QContasPagarBaixaNome.Value,
                                         'Título:'+floatToStr(QContasPagarBaixaNum_Titulo.Value)+' Tipo Docto:'+QContasPagarBaixaDesc_Tipo_Documento.Value,
                                         QContasPagarBaixaCod_Conta_Pagar_Cab.Text,
                                         '',
                                         'N','');
              QContasPagarBaixaMovCod_Bco_Movimento.Value:=DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
            End;
          End;
          If DMParamSistema.QparamSistemaIND_CONTABILIZA.Value = 'S' Then
          Begin
            wCodDoc    := QContasPagarBaixaCod_Conta_Pagar_Cab.Value;
            wNumDoc    := FloatToStr(QContasPagarBaixaNum_Titulo.Value)+'-'+Trim(QContasPagarBaixaNome.Value);
            wFilial    := QContasPagarBaixaCod_Filial.Value;
            wFilial_Contabil := QContasPagarBaixaCod_Filial.Value;
            wContaCred := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_OUTROS_CRED.Text;

            If RGFormaPagto.ItemIndex <> 1 then // Pagto em dinheiro
              wContaDeb := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_OUTROS_DEB.Text
            else
             Begin
               wContaDeb := DMOracle.BuscaNome('SELECT COD_CONTABIL_CONTRAPARTIDA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MeCodBanco.Text);
               wFilial_Contabil := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
             End;
            If RGFormaPagto.ItemIndex = 2 then // contabil
              If (DMParamSistema.QParamSistemaCod_Empresa.Value   = 'MOINHO')        And
                 (DMParamSistema.QParamSistemaDesc_Empresa.Value <> 'GRUPO CAVALCA') And
                 (QContasPagarBaixaCod_Filial.Value <> 9) Then
                 wFilial_Contabil := 1;

            wCodCompl  := QContasPagarBaixaCod_Cadastro.Value;
            wVlrLancto := wValor_Outros;
            wDtLancto  := StrToDate(MEDataBaixa.Text);

            If (wContaCred <> '') And (wContaDeb <> '') Then
            Begin
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaDeb);
              QContasPagarBaixaMovCOD_LANCTO_CONTABIL_CRED.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
              DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,StrToFloat(wHistorico_Contabil),wVlrlancto,wDTLancto,wContaCred);
              QContasPagarBaixaMovCOD_LANCTO_CONTABIL_DEB.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
            End;
          End;

          QContasPagarBaixaMovVAL_MOVIMENTO.Value       := wValor_Outros;
          QContasPagarBaixaMovDT_MOVIMENTO.Value        := StrToDate(MEDataBaixa.Text);
          QContasPagarBaixaMovDESC_OBSERVACAO.Value  := MEObservacao.Text;
          QContasPagarBaixaMovIND_TIPO_MOVIMENTO.Value  := 'PAGTO OUTROS';
          QContasPagarBaixaMovIND_FORMA_PAGAMENTO.Value := RGFormaPagto.Items[RGFormaPagto.ItemIndex];

          //---adicionado codigo do adiantamento no desconto. Diego A
          if trim(MECodAdiantamento.text) <> '' then
            QContasPagarBaixaMovCOD_ADIANTAMENTO.Value    := strtoint(trim(MeCodAdiantamento.text))
          else
            QContasPagarBaixaMovCOD_ADIANTAMENTO.text    := '';

          //---

          If CbDevolucao.Checked Then
            QContasPagarBaixaMovInd_Devolucao.Value := 'SIM';
          QContasPagarBaixaMov.Post;
        End; // Término da Inclusao do Movimento de Outros Valores


        // Término da Inclusão de Movimentos

        QContasPagar_Cab.Close;
        QContasPagar_Cab.SetVariable('PK',QContasPagarBaixaCod_Conta_Pagar_Cab.Value);
        QContasPagar_Cab.Open;
        QContasPagar_Cab.Edit;
        QContasPagar_CabVal_Titulo.Value:=QContasPagar_CabVal_Titulo.Value-StrToFloat(MEValorBaixa.Text);

        // Variação cambial

        if StrToFloat(wMoeda)<>DMParamSistema.QParamSistemaCOD_Moeda.Value then
          QContasPagar_CabVal_indexado.Value:=QContasPagar_CabVal_Indexado.Value-(wValor_Baixa/DMMoeda.MaiorCotacao(StrToFloat(wMoeda),StrToDate(MEDataBaixa.Text)));

        // Muda a Situção do Título
        wTeste_Valor := FormatFloat('0.00',QContasPagar_CabVal_Titulo.Value);
        QContasPagar_CabVal_Titulo.Value := StrToFloat(wTeste_Valor);
        //QContasPagar_CabVal_Titulo.Value := Trunc(QContasPagar_CabVal_Titulo.Value * 1000) / 1000;
        If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO') And
           (StrToDate(MEDataBaixa.Text) > QContasPagar_CabDt_Capitalizacao.Value)  Then
           QContasPagar_CabDt_Capitalizacao.Value := StrToDate(MEDataBaixa.Text);
        If QContasPagar_CabVal_Titulo.Value = 0 then
        Begin
          QContasPagar_CabDT_Baixa.Value     := StrToDate(MEDataBaixa.Text);
          QContasPagar_CabInd_Situacao.Value := 'BAIXA TOTAL';
          if not wBaixaEmLote then
            PCBaixa.ActivePage               := TS0Localiza;
        End
        Else
          If (QContasPagar_CabVal_Titulo.Value < QContasPagar_CabVal_Original.Value) then
          begin
            QContasPagar_CabInd_Situacao.Value := 'BAIXA PARCIAL';
            QContasPagar_CabDT_Baixa.Value     := StrToDate(MEDataBaixa.Text);
          end;
        QContasPagar_Cab.Post;
        if not wBaixaEmLote then //quando é feita a baixa em lote e feito o commit dentro do bloco do botao de baixa todos
          DMOracle.DBCemapa.Commit; // Fim da Transação
      except
        If QContasPagarBaixaMov.State In [DsInsert,DsEdit] Then
          QContasPagarBaixaMov.Cancel;
        if not wBaixaEmLote then
          DMOracle.DBCemapa.RollBack;
        raise;
      end;
                                           // Grasel nao emite cheque no pagamento de contas a pagar - faz o cheque por fora
      If (RGFormaPagto.ItemIndex = 1) And (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GRASEL') then // Pagto.em cheque
        If DMOracle.BuscaNome('SELECT IND_EMITE_CHEQUE FROM TB_HISTORICO','COD_HISTORICO  = ' + wHistorico_Cheque) = 'S' Then
          if MessageDlg('Deseja emitir o cheque agora ?',mtInformation,[mbYes,mbNo],0)= MrYes then
          Begin
            QEmiteCheque.Close;
            QEmiteCheque.setVariable('COD_CONTA_PAGAR_CAB',QContasPagar_CabCOD_CONTA_PAGAR_CAB.Value);
            QEmiteCheque.Open;
            QEmiteCheque.Last;
            If FEmiteCheque=Nil then
               FEmiteCheque:=TFEmiteCheque.Create(Application);
            FEmiteCheque.CodFilial            := QEmiteChequeCOD_FILIAL.Value;
            FEmiteCheque.MECodBanco.Text      := FContaPagarBaixa.MECodBanco.Text;
            FEmiteCheque.MEContaCorrente.Text := FContaPagarBaixa.MECodContaCorrente.Text;
            FEmiteCheque.MENrCheque.Text      := FContaPagarBaixa.MENrCheque.Text;
            if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GONZATTI') and (wBaixaemLote)) THEN
              FEmiteCheque.MEValor.Text       := Bib.LimpaString(LblTotal.Caption, '.')
            else
//              if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'SRTERRA') Then  // para emitir o valor do cheque com juros - César
//                 FEmiteCheque.MEValor.Text    := FloatTostr(StrToFloat(MeValorBaixa.Text) + StrToFloat(Trim(MeValorJuro.Text)+'0'))
//              Else
                 FEmiteCheque.MEValor.Text    := FloatTostr(QEmiteChequeVal_Movimento.Value);
            FEmiteCheque.MECidade.Text        := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_FILIAL','COD_FILIAL  = '+FloatToStr(DMParamSistema.QParamSistemaCod_Filial.Value));
            FEmiteCheque.MENominal.Text       := DMContasPagar.QContasPagarBaixaNome.Value;
            FEmiteCheque.MEData.Text          := FContaPagarBaixa.MEDataBaixa.Text;

            If FEmiteCheque.ShowModal = MrOK then
            begin
              DMBancoAgencia.QAtualizaNrCheque.Close;
              DMBancoAgencia.QAtualizaNrCheque.SQL.Clear;
              DMBancoAgencia.QAtualizaNrCheque.Sql.Add('UPDATE TB_CONTA_CORRENTE SET NUM_CHEQUE = '+FEmiteCheque.MENrCheque.Text
                                                      +' WHERE (COD_BANCO_AGENCIA = '+FEmiteCheque.MECodBanco.Text+' ) AND ( COD_CONTA_CORRENTE = '+FEmiteCheque.MEContaCorrente.Text+')');
              DMBancoAgencia.QAtualizaNrCheque.ExecSQL;
              // AQUI ATUALIZA O NOMINAL NO MOVIMENTO BANCARIO - POIS PODE MUDAR NO ATO DE EMITIR O CHEQUE
              If wCodMovBanco <> 0 Then
               Begin
                 DMOracle.QExecSQL.close;
                 DMOracle.QExecSQL.SQL;
                 DMOracle.QExecSQL.sql.Clear;
                 DMOracle.QExecSQL.sql.Add('UPDATE TB_BCO_MOVIMENTO SET DESC_OBSERVACAO = ' + QuotedStr(Copy(Trim(FEmiteCheque.MENominal.Text),1,40)) +
                              ' WHERE COD_BCO_MOVIMENTO = ' + IntToStr(wCodMovBanco) );
                 DMOracle.QExecSQL.ExecSQL;
               End;

              If DMOracle.DBCemapa.InTransaction Then
                if not wBaixaEmLote then
                  DMOracle.DBCemapa.Commit; // Fim da Transação
              end;

              If (wValor_Taxa > 0) and
                 (not wBaixaEmLote) Then //quando for feita a baixa em lote, o recibo é emitido um só no final de todas as baixa
              Begin
                if FRRecibo = nil then
                  FRRecibo:=TFRRecibo.Create(Application);
                DMFilial.QFilial.Close;
                DMFilial.QFilial.SetVariable('PK',DMOracle.BuscaNome('SELECT TB_CONTA_CORRENTE.COD_FILIAL FROM TB_CONTA_CORRENTE ',
                                                                     'TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = '+FContaPagarBaixa.MECodContaCorrente.Text));
                DMFilial.QFilial.Open;
                FRRecibo.QRLabel1.enabled        := false;
                FRRecibo.QRLabel3.enabled        := false;
                FRRecibo.QRLabel7.enabled        := false;
                FRRecibo.QRLabel10.enabled       := false;
                FRRecibo.QRLabel11.enabled       := false;
                FRRecibo.QRLabel12.enabled       := false;
                FRRecibo.QRLabel14.enabled       := false;
                FRRecibo.QRLabel15.Caption       := 'Pago....:';
                FRRecibo.QRLValor.enabled        := false;
                FRRecibo.QRDBCod_Conta.enabled   := false;
                FRRecibo.QRLDesconto.enabled     := false;
                FRRecibo.QRDBVenc.enabled        := false;
                FRRecibo.QRDBParcela.enabled     := false;
                FRRecibo.QRLValor_Juros.enabled  := false;
                FRRecibo.QRLDataEmissao.enabled  := false;
                FRRecibo.QRLValor_Baixa.Caption  := QEmiteChequeVal_Desconto_Taxa.Text;
                FRRecibo.QRLRecebido.Caption     := DMContasPagar.QContasPagarBaixaNome.Value;
                FRRecibo.QRLValorExtenso.Caption := Bib.Extenso(QEmiteChequeVal_Desconto_Taxa.Value,'REAL');
                FRRecibo.QRLDescricao.Caption    := 'Ressarcimento de Taxa Bancaria';
                FRRecibo.QRLData.Caption         := MEDataBaixa.Text;
                FRRecibo.QRLResponsavel.Caption  := DMFilial.QFilialDesc_Filial.Value;
                //----------------
                FRRecibo.QuickRep1.Preview;
                //   FRRecibo.QuickRep1.Destroy;
                DMFilial.QFilial.Close;
              End;

              If DmParamSistema.QParamSistemaCOD_EMPRESA.value='GONZATTI' Then
              begin
                if (not wBaixaEmLote) and //se for baixa em lote nem chama a pergunta
                   (MessageDlg('Deseja emitir a cópia de cheque agora ?',mtInformation,[mbYes,mbNo],0)=mrYes) then
                Begin
                  with DMBancoAgenciaRel do
                  begin
                    QRBancoMov_CopCheque.Close;
                    QRBancoMov_CopCheque.SetVariable('COD_BANCO_AGENCIA',StrToInt(FContaPagarBaixa.MECodBanco.Text));
                    QRBancoMov_CopCheque.SetVariable('COD_CONTA_CORRENTE',StrToInt(FContaPagarBaixa.MECodContaCorrente.Text));
                    QRBancoMov_CopCheque.SetVariable('DT_INICIAL',StrToDate(FContaPagarBaixa.MEDataBaixa.Text));
                    QRBancoMov_CopCheque.SetVariable('DT_FINAL',StrToDate(FContaPagarBaixa.MEDataBaixa.Text));
                    QRBancoMov_CopCheque.SetVariable('NUM_CHEQUE',StrToInt(FContaPagarBaixa.MENrCheque.Text));
                    QRBancoMov_CopCheque.Open;
                    if FRBancoMov_CopCheque=Nil then
                      FRBancoMov_CopCheque:=TFRBancoMov_CopCheque.Create(Application);
                    FRBancoMov_CopCheque.QRPrimario.Preview;
                    QRBancoMov_CopCheque.Close;
                  end;
                End;
              end;
            End;
          If (not wBaixaEmLote) and //se for baixa em lote nao entra aqui
             (wRecibo = 'S') then
          Begin
            If FEmiteRecibo=Nil then
              FEmiteRecibo:=TFEmiteRecibo.Create(Application);
            FEmiteRecibo.LCadastro.Caption := 'Fornecedor';
            FEmiteRecibo.MECodConta.Text   := FloatToStr(DMContasPagar.QContasPagarBaixaCOD_CONTA_PAGAR_CAB.Value);
            FEmiteRecibo.MENrTitulo.Text   := FloatToStr(DMContasPagar.QContasPagarBaixaNum_Titulo.Value);
            FEmiteRecibo.MEParcela.Text    := FloatToStr(DMContasPagar.QContasPagarBaixaNum_Parcela.Value);
            FEmiteRecibo.MEFornecedor.Text := DMContasPagar.QContasPagarBaixaNome.Value;
            FEmiteRecibo.MEValor.Text      := FloatTostr(wValor_Baixa - wValor_Desconto+ wValor_Juro);
            FEmiteRecibo.MEJuros.Text      := FloatTostr(wValor_Juro);
            FEmiteRecibo.MEDesconto.Text   := FloatTostr(wValor_Desconto);
            FEmiteRecibo.MEData.Text       := FContaPagarBaixa.MEDataBaixa.Text;
            FEmiteRecibo.MECodFilial.Text  := FloatToStr(DMContasPagar.QContasPagarBaixaCod_Filial.Value);
            FEmiteRecibo.MEDescricao.Text  := DMContasPagar.QContasPagarBaixaDesc_Observacao.Value + ' ' + Trim(MeObservacao.Text);
            FEmiteRecibo.MeSaldoTitulo.Text:= DmContasPagar.QContasPagar_CabVAL_TITULO.Text;
            FEmiteRecibo.MeFormaPagamento.Text := RGFormaPagto.Items[RGFormaPagto.ItemIndex] + ' ' + MECodBanco.Text + ' ' + MEBanco.Text + ' ' + MECodContaCorrente.Text;
            DMFilial.QFilial.Close;
            DMFilial.QFilial.SetVariable('PK',DMContasPagar.QContasPagarBaixaCod_Filial.Value);
            DMFilial.QFilial.Open;
            FEmiteRecibo.ShowModal;
          End;
          // dar um refresh na tabela de ContasPagarBaixa
          wCodigo:=QContasPagarBaixaCod_Conta_Pagar_Cab.Value;
          QContasPagarBaixa.DisableControls;
          QContasPagarBaixa.Close;
          QContasPagarBaixa.Open;
          QContasPagarBaixa.Locate('COD_CONTA_PAGAR_Cab',wCodigo,[]);
          QContasPagarBaixa.EnableControls;

          // Limpa os Campos Mask Edit
          //MEDataBaixa.Clear;
          MEValorBaixa.Clear;
          MeValorOutros.Clear;
          MEValorDesconto.Clear;
          MEDescontoComercial.Clear;
          MeJuroFornecedores.Clear;
          MENumero.Clear;
          MEValorJuro.Clear;
          MEObservacao.Clear;
          MEBanco.Clear;
          MECodContaCorrente.Clear;
          MENrCheque.Clear;
          MECodAdiantamento.Clear;
          MEAdiantamento.Clear;
          MECodBanco.Clear;
          MEvariacaoPos.Clear;
          MEvariacaoNeg.Clear;
          RGFormaPagto.ItemIndex := 0;
          RGPgtoTaxa.ItemIndex   := 1;
          CbDevolucao.Checked    := False;
        End //  End If
      Else
          ShowMessage('Erro! Valores incorretos na Baixa.'+chr(13)+'Valores Negativos estão sendo gerados, favor verificar.');
  End; // End With
end;

procedure TFContaPagarBaixa.MEValorBaixaExit(Sender: TObject);
begin
  If Trim(MEValorBaixa.Text) <> '' then
   Begin
     Try
       StrToFloat(MEValorBaixa.Text);
     except
       Raise Exception.Create('Valor Inválido!');
     end;
   End;
end;

procedure TFContaPagarBaixa.MEValorDescontoExit(Sender: TObject);
begin
  If Trim(MEValorDesconto.Text)<>'' then
    Begin
      Try
        StrToFloat(MEValorDesconto.Text);
      except
        Raise Exception.Create('Valor Inválido!');
      end;
    End;
end;

procedure TFContaPagarBaixa.MEValorJuroExit(Sender: TObject);
begin
  If Trim(MEValorJuro.Text)<>'' then
    Begin
      Try
        StrToFloat(MEValorJuro.Text);
      except
        Raise Exception.Create('Valor Inválido!');
      end;
    End;
end;

procedure TFContaPagarBaixa.SBConsContaCorrenteClick(Sender: TObject);
begin
  If FContaCorrenteCons=Nil Then
    FContaCorrenteCons:=TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.ShowModal=MrOk then
    Begin
      MECodBanco.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value);
      MEBanco.Text:=DMBancoAgencia.QContaCorrenteConsDesc_Banco_Agencia.Value;
      MECodContaCorrente.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value);
      MENrCheque.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsNum_Cheque.Value + 1);
    End;
end;

procedure TFContaPagarBaixa.RGFormaPagtoClick(Sender: TObject);
Var Whistorico : String;
begin
  //If (RGFormaPagto.ItemIndex <> 1) or ( then  // Pgto. em Dinheiro
  if (RGFormaPagto.ItemIndex = 0) or (RGFormaPagto.ItemIndex = 2) or
     (RGFormaPagto.ItemIndex = 4) or (RGFormaPagto.ItemIndex = 5) then
  Begin
    SBConsContaCorrente.Enabled:=False;
    MEBanco.Clear;
    MECodBanco.Clear;
    MECodContaCorrente.Clear;
    MENrCheque.Clear;
    SBBaixa.Enabled:=True;
  End
  Else                              // Pagto. em Cheque
  Begin
    wHistorico := DMOracle.BuscaNome('SELECT COD_HISTORICO_CHEQUE FROM TB_FINALIDADE','COD_FINALIDADE = '+FloatToStr(DMContasPagar.QContasPagarBaixaCod_Finalidade.Value));
    If wHistorico = '' Then
    Begin                        // caso cod_historico_cheque estiver vazio não será
      RGFormaPagto.ItemIndex:=0; // permitido efetuar o pgto. com cheque
      raise Exception.create('Erro! Cod. do Historico do Cheque deste Título em Branco !');
    End
    Else
    Begin
      If MEBanco.Text='' then
        SBBaixa.Enabled:=False
      Else
        SBBaixa.Enabled:=True;
      SBConsContaCorrente.Enabled:=True;
    End;
  End;
end;

procedure TFContaPagarBaixa.MEBancoChange(Sender: TObject);
begin
 If MEBanco.Text='' then
   SBBaixa.Enabled:=False
 Else
   SBBaixa.Enabled:=True;
end;

procedure TFContaPagarBaixa.FormCreate(Sender: TObject);
var
  lc : TListColumn;
  i : integer;
begin
  {PCBaixa.ActivePage:=TS0Localiza;
  With DMContasPagar do
    Begin}
//  MEDataVencInicial.Text:=DateToStr(DMOracle.DataServ-10);
//  MEDataVencFinal.Text:=DateToStr(DMOracle.DataServ+4);
{      QContasPagarBaixa.ParamByName('DT_VENC_INI').AsDate:=StrToDate(MEDataVencInicial.Text);
      QContasPagarBaixa.ParamByName('DT_VENC_FINAL').AsDate:=StrToDate(MEDataVencInicial.Text);
      QContasPagarBaixa.Close;
      QContasPagarBaixa.Open;
      QContasPagarBaixaMov.Close;
      QContasPagarBaixaMov.Open;
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

  //a primeira coluna guarda o codigo do conta a pagar cab.
  lc := ListView1.Columns.Add;
  lc.Caption := 'X';
  lc.Width := 20;

  for i:=0 to dbgrid1.Columns.Count-1 do
  begin
    lc := ListView1.Columns.Add;
    lc.Caption := DBGrid1.Columns.Items[i].Title.Caption;
    lc.Width := DBGrid1.Columns.Items[i].Width + 10;
    lc.Alignment := DBGrid1.Columns.Items[i].Alignment;
  end;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'RAZENTE' then
   Begin
     DbGrid1.Columns.Items[11].Index := 3;
     DbGrid1.Columns.Items[4].Index := 11;
   End;

end;

procedure TFContaPagarBaixa.BtnCadastroConsClick(Sender: TObject);
begin
  if FCadastrocons = Nil then
     FCadastrocons:=TFCadastrocons.Create(Application);
  if FCadastrocons.ShowModal=MrOk then
  begin
    MECodFornecedor.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    MECodFornecedor.OnExit(Self);
  end;
end;

procedure TFContaPagarBaixa.MECodFornecedorExit(Sender: TObject);
Var wValor : String;
begin
  if Trim(MECodFornecedor.Text) <> '' then
   Begin
      MEtexto.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodFornecedor.text);
      If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO' Then
       Begin
         wValor:=DMOracle.BuscaNome('SELECT SUM(VAL_TITULO) FROM TB_CONTA_RECEBER_CAB','IND_SITUACAO <> ' + CHR(39) + 'BAIXA TOTAL' + CHR(39) + ' AND COD_CADASTRO = '+MECodFornecedor.text);
         If wValor <> '' then
            showMessage ('Cliente Possui Titulos em Aberto  R$ ' + wValor);
       End;
   End
  else
    MEtexto.Clear;
  If Trim(MECodFornecedor.Text) <> '' Then
     SBProcuraClick(Self);
end;

procedure TFContaPagarBaixa.SbProcuraClick(Sender: TObject);
var
  wdata_teste:TDate;
  li : TListItem;
  i : integer;
begin
    DmUsuario.Checar_Filial_Usuario( Trim(MECodFilial.Text) ,'CONTAS A PAGAR');
    With DMContasPagar do
      Begin
        QContasPagarBaixa.Close;
        QContasPagarBaixa.Sql.Clear;
        QContasPagarBaixa.Sql.Add('SELECT TB_CADASTRO."NOME" ,TB_CONTA_PAGAR_CAB."COD_CONTA_PAGAR_CAB" ,TB_CONTA_PAGAR_CAB."COD_FINALIDADE" ,');
        QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."COD_BANCO_AGENCIA" ,TB_CONTA_PAGAR_CAB."COD_CADASTRO" ,TB_CONTA_PAGAR_CAB."COD_DEPARTAMENTO" ,');
        QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."COD_FILIAL" ,TB_CONTA_PAGAR_CAB."NUM_TITULO" ,TB_CONTA_PAGAR_CAB.COD_CONTRATO_GP,TB_CONTA_PAGAR_CAB."NUM_PARCELA" ,TB_CONTA_PAGAR_CAB."DESC_TIPO_DOCUMENTO" ,');
        QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."DT_MOVIMENTO" ,TB_CONTA_PAGAR_CAB."DT_BAIXA" ,TB_CONTA_PAGAR_CAB."DT_VENCIMENTO" ,TB_CONTA_PAGAR_CAB."DT_VENCIMENTO_PRORROGADO" ,TB_CONTA_PAGAR_CAB."DT_EMISSAO" ,');
        QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."DT_CAPITALIZACAO" ,TB_CONTA_PAGAR_CAB."VAL_TITULO" ,TB_CONTA_PAGAR_CAB."COD_NOTA_CAB" ,TB_CONTA_PAGAR_CAB."DESC_OBSERVACAO" ,');
        QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."IND_ACEITE" ,TB_CONTA_PAGAR_CAB."DT_ACEITE" ,TB_CONTA_PAGAR_CAB."IND_SITUACAO" ,TB_CONTA_PAGAR_CAB."VAL_ORIGINAL" ,TB_CONTA_PAGAR_CAB."VAL_INDEXADO",');
        QContasPagarBaixa.Sql.Add('TB_FINALIDADE."COD_HISTORICO_DESC",TB_CONTA_PAGAR_CAB.PERC_DESC_PONTUALIDADE,TB_CONTA_PAGAR_CAB.PERC_DESC_ANTECIPACAO, ');
        QContasPagarBaixa.Sql.Add('TB_FINALIDADE.NUM_TIPO_JURO,TB_FINALIDADE.PERC_TAXA,TB_FINALIDADE.COD_MOEDA,TB_FINALIDADE.PERC_JURO_MORA,TB_FINALIDADE.DESC_FINALIDADE, ');
        QContasPagarBaixa.Sql.Add('DECODE(TB_CONTA_PAGAR_CAB.IND_SITUACAO,'+Chr(39)+'ABERTO'+Chr(39)+',TB_FINALIDADE.NUM_DIAS_CARENCIA,0) AS NUM_DIAS_CARENCIA, ');
        QContasPagarBaixa.Sql.Add('TB_OBRA.DESC_OBRA, TB_FILIAL.DESC_FILIAL, TB_CADASTRO.DESC_ENDERECO, TB_CADASTRO.DESC_CIDADE ');
        QContasPagarBaixa.Sql.Add(' FROM TB_CONTA_PAGAR_CAB,TB_CADASTRO,TB_FINALIDADE,TB_OBRA,TB_FILIAL WHERE ');
        QContasPagarBaixa.Sql.Add(' TB_CONTA_PAGAR_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO ');
        QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FINALIDADE = TB_FINALIDADE.COD_FINALIDADE ');
        QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_OBRA = TB_OBRA.COD_OBRA(+) ');
        QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL ');
        if (DMParamSistema.QParamSistemaIND_GERA_PARCELA_DEVOL.Value = 'S') and (pCodNotaCab > 0 ) then
          QContasPagarBaixa.SQL.Add('AND TB_CONTA_PAGAR_CAB.COD_CADASTRO = ' + Char (39) + IntToStr(pCodCadastro) + Char(39));
        If CBMostraBaixatotal.Checked=True then
           QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.VAL_TITULO  > -1') // um número menor que zero
        Else
           QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.VAL_TITULO  > 0');
        If Trim(MECodFornecedor.Text) <> '' then
           QContasPagarBaixa.Sql.Add(' AND TB_CADASTRO.COD_CADASTRO = ' + Trim(MECodFornecedor.Text));
        If Trim(MEDataVencInicial.Text) <> '' Then
           QContasPagarBaixa.Sql.Add(' AND NVL(TB_CONTA_PAGAR_CAB.DT_VENCIMENTO_PRORROGADO,TB_CONTA_PAGAR_CAB.DT_VENCIMENTO) >= ' + chr(39) + Trim(MEDataVencInicial.Text) + chr(39));
        If Trim(MEDataVencFinal.Text) <> '' Then
           QContasPagarBaixa.Sql.Add(' AND NVL(TB_CONTA_PAGAR_CAB.DT_VENCIMENTO_PRORROGADO,TB_CONTA_PAGAR_CAB.DT_VENCIMENTO) <= ' + chr(39) + Trim(MEDataVencFinal.Text) + chr(39));
        If Trim(MECodFilial.Text) <> '' Then
           QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FILIAL = ' + Trim(MECodFilial.Text));
        If Trim(MeNumero.Text) <> '' Then
           QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.NUM_TITULO = ' + Trim(MeNumero.Text));
        if Trim(MeValor.text) <> '' Then
           QContasPagarBaixa.Sql.Add(' AND VAL_TITULO ='+Trim(MeValor.text));
        if Trim(MeFinalidade.text) <> '' Then
           QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FINALIDADE ='+Trim(MeFinalidade.text));
        Case RgOrdem.ItemIndex Of
          0 : QContasPagarBaixa.Sql.Add(' ORDER BY TB_CONTA_PAGAR_CAB.DT_VENCIMENTO');
          1 : QContasPagarBaixa.Sql.Add(' ORDER BY TB_CONTA_PAGAR_CAB.NUM_TITULO');
          2 : QContasPagarBaixa.Sql.Add(' ORDER BY TB_CADASTRO.NOME');
          3 : QContasPagarBaixa.Sql.Add(' ORDER BY TB_CONTA_PAGAR_CAB.DT_EMISSAO');
        End;
        QContasPagarBaixa.Open;
      End;
  DMContasPagar.QContasPagarBaixa.first;
  ListView1.Items.Clear;
  wSomaSelecionados := 0.00; //guarda a soma dos itens selecionados na aba de baixa em lote.
  while not DMContasPagar.QContasPagarBaixa.Eof do
  begin
    li := ListView1.Items.Add;
    li.Caption := DMContasPagar.QContasPagarBaixaCOD_CONTA_PAGAR_CAB.AsString;
    for i:=0 to DBGrid1.Columns.Count-1 do
      li.SubItems.add(DBGrid1.Columns.Items[i].Field.Text);
    DMContasPagar.QContasPagarBaixa.next;
  end;
  DMContasPagar.QContasPagarBaixa.first;

end;

procedure TFContaPagarBaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMCaixa.QCaixa_mov.Close;
  DMBancoAgencia.QBancoMovimento.Close;
  DMBancoAgencia.QContaCorrenteCons.Close;
end;

procedure TFContaPagarBaixa.SBFilialConsClick(Sender: TObject);
begin
  If FFilialCons=Nil then
     FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
   Begin
     MeCodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
     MeCodFilial.OnExit(Self);
   End;
end;

procedure TFContaPagarBaixa.MECodFilialExit(Sender: TObject);
begin
  if Trim(MECodFilial.Text)<>'' then
    MEFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.Text)
  else
    MEFilial.Text := 'Todas';

end;

procedure TFContaPagarBaixa.MECodAdiantamentoExit(Sender: TObject);
begin

  //somente um dos busca_nome vai retornar alguma coisa, o outro sempre trará ''
  if trim(MECodAdiantamento.Text) <> '' then
    MEAdiantamento.Text := DMOracle.BuscaNome('SELECT NUM_DOCUMENTO FROM TB_CAIXA_MOV T1, TB_ADIANTAMENTO T2',
                                              'T1.COD_CAIXA_MOV = T2.COD_CAIXA_MOV AND '+
                                              'T2.COD_ADIANTAMENTO = ' + trim(MECodAdiantamento.Text))+
                           DMOracle.BuscaNome('SELECT NUM_CHEQUE FROM TB_BCO_MOVIMENTO T1, TB_ADIANTAMENTO T2',
                                              'T1.COD_BCO_MOVIMENTO = T2.COD_BCO_MOVIMENTO AND '+
                                              'T2.COD_ADIANTAMENTO = ' + trim(MECodAdiantamento.Text))
  else
    MEAdiantamento.Text := '';                                              
end;

procedure TFContaPagarBaixa.SBAdiantamentoClick(Sender: TObject);
begin
  if FAdiantamentoCons = nil then
    FAdiantamentoCons := TFAdiantamentoCons.create(application);

  FAdiantamentoCons.MECadastro.Text := DMContasPagar.QContasPagarBaixaCOD_CADASTRO.Text;
  FAdiantamentoCons.MECadastroExit(Sender);
  FAdiantamentoCons.MeDtInicial.Text := DateToStr(Date - 30);
  FAdiantamentoCons.MeDtFinal.Text := DateToStr(Date);
  FAdiantamentoCons.RgTipoAdiantamento.ItemIndex := 1;
  FAdiantamentoCons.BtProcurar.Click;

  if FAdiantamentoCons.showmodal = mrok then
  begin
    MECodAdiantamento.text := DMAdiantamento.QAdiantamentoConsCOD_ADIANTAMENTO.Text;
    MECodAdiantamentoExit(Sender);
  end;
end;

procedure TFContaPagarBaixa.MeValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = ',' Then
     Key := '.';
end;

procedure TFContaPagarBaixa.SB2BaixaClick(Sender: TObject);
var i, cont, wCodFilial : integer;
    wRecibo, wDescFilial : string;
begin
  if MessageDlg('Deseja realmente baixar todos os itens selecionados', mtConfirmation, [mbyes, mbNo], 0 ) = mryes then
  begin
    cont := 0;
    //Utiliza a mesmo ClientDataSet do Contas a Receber por ter a mesma função.
    DMContasReceber_Rel.cdsRContasReceberBaixaLote.Open; //Abre a Query em Memória para inserção de Dados.
    try
      DMOracle.DBCemapa.StartTransaction;

      for i:=0 to ListView1.Items.Count-1 do
      begin
        if ListView1.Items.Item[i].Checked then
        begin
          cont := cont + 1;

          if DMContasPagar.QContasPagarBaixa.Locate('COD_CONTA_PAGAR_CAB',StrToInt(ListView1.Items.Item[i].Caption),[]) then;
          begin

            if trim(ME2DataBaixa.text) = '' then
               ME2DataBaixa.text := DateToStr(DMOracle.DataServ);

            If Trim(Me2DtPreDatado.Text) = '' Then
               Me2DtPreDatado.text := DatetoStr(DMOracle.DataServ);

            RGFormaPagto.ItemIndex  := RG2FormaPagto.ItemIndex;
            MECodBanco.Text         := ME2CodBanco.Text;
            MEBanco.Text            := ME2Banco.Text;
            MECodContaCorrente.Text := ME2CodContaCorrente.Text;
            MeObservacao.text       := Me2Observacao.Text;
            MENrCheque.Text         := ME2NrCheque.Text;
            DMContasPagar.QContasPagarBaixaMov.Close;
            DMContasPagar.QContasPagarBaixaMov.SetVariable('COD_CONTA_PAGAR_CAB', StrToInt(ListView1.Items.Item[i].Caption));
            DMContasPagar.QContasPagarBaixaMov.Open;

            MEDataBaixa.Text := ME2DataBaixa.text;
            MeDtPreDatado.Text := Me2DtPreDatado.Text;

            MEValorBaixa.Text := FloatToStr(dmcontasPagar.QContasPagarBaixaVal_Titulo.Value);

            if DMOracle.BuscaNome('SELECT IND_RECIBO FROM TB_FINALIDADE',
                'COD_FINALIDADE = '+FloatToStr(DMContasPagar.QContasPagarBaixaCOD_FINALIDADE.Value)) = 'S' then
            begin
              wRecibo := 'S';

              if MEValorDesconto.Text = '' then
                MEValorDesconto.Text := '0';
              if MeDescontoComercial.Text = '' then
                MeDescontoComercial.Text := '0';
              if MEValorJuro.Text = '' then
                MEValorJuro.Text := '0';
              if MeJuroFornecedores.Text = '' then
                MeJuroFornecedores.Text := '0';

              wCodFilial := STRTOINT(DMOracle.BuscaNome('SELECT COD_FILIAL  FROM TB_FILIAL','COD_FILIAL = '+ DMContasPagar.QContasPagarBaixaCOD_FILIAL.Text)); //cod_filial
              wDescFilial := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL'  ,'COD_FILIAL = '+ DMContasPagar.QContasPagarBaixaCOD_FILIAL.Text); //nomeCliente
              //Adiciona na Query em Memória a Conta a Receber para Gerar o Recibo em Lote - 14/01/2008 - Camila.
              DMContasReceber_Rel.AddDadosReciboLote(DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ DMContasPagar.QContasPagarBaixaCOD_CADASTRO.Text), //nomeCliente
                                 wcodfilial, DMContasPagar.QContasPagarBaixaNUM_TITULO.AsInteger,  //numDuplicata
                                 DMContasPagar.QContasPagarBaixaNUM_PARCELA.Value, //numParcela
                                 DMContasPagar.QContasPagarBaixaVAL_TITULO.Value,  //valPrincipal
                                 0,                                                //valJuros
                                 StrToFloat(MEValorBaixa.Text),                    //valPrincipalRecebido
                                 (StrToFloat(MeJuroFornecedores.Text) + StrToFloat(MEValorJuro.Text)),     //valJurosRecebido
                                 (StrToFloat(MEValorDesconto.Text) + StrToFloat(MeDescontoComercial.Text)), //valDesconto
                                 //valRecebido = valPrincipalRecebido + valJurosRecebido - valDesconto
                                 (StrToFloat(MEValorBaixa.Text) + (StrToFloat(MeJuroFornecedores.Text) + StrToFloat(MEValorJuro.Text)) - (StrToFloat(MEValorDesconto.Text) + StrToFloat(MeDescontoComercial.Text))),
                                 //valPendente  = (valPrincipal + valJuros) - (valPrincipalRecebido + valJurosRecebido - valDesconto)
                                 (DMContasPagar.QContasPagarBaixaVAL_TITULO.Value - (StrToFloat(MEValorBaixa.Text) + (StrToFloat(MeJuroFornecedores.Text) + StrToFloat(MEValorJuro.Text)) - (StrToFloat(MEValorDesconto.Text) + StrToFloat(MeDescontoComercial.Text)))),
                                 Trim(DMContasPagar.QContasPagarBaixaDesc_Finalidade.Value) +' '+Trim(DMContasPagar.QContasPagarBaixaDesc_Observacao.Value) );
            end;

            SBBaixaClick(Sender); //executa o codigo responsavel pela baixa de cada item
          end;
        end;
      end;
      if wRecibo = 'S' then
      begin
        DMContasReceber_Rel.cdsRContasReceberBaixaLote.First;
        //colocar aqui a chamada dos recibos.
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL' then
          EmiteReciboLote('Cerealista Grasel', StrToDateTime(MEDataBaixa.Text), wCodFilial)
        Else
          if DMParamSistema.QParamSistemaCod_Empresa.Value = 'INSIDE' then
          begin
             //if DMContasPagar.QContasPagarBaixaCod_Filial.Value = 1 then //alterado porque não aparecia Inside no recibo. Vanessa 19/12/2013
             if DMContasPagar.QContasPagar_CabCOD_FILIAL.Value = 1 then
               EmiteReciboLote('Inside', StrToDateTime(MEDataBaixa.Text), wCodFilial)
             else
               EmiteReciboLote('Dispart', StrToDateTime(MEDataBaixa.Text), wCodFilial)
          end
          Else
            if DMParamSistema.QParamSistemaCod_Empresa.Value = 'NIR' then
               EmiteReciboLote('Cemapa Informatica', StrToDateTime(MEDataBaixa.Text), wCodFilial)
            Else
             if DMParamSistema.QParamSistemaCod_Empresa.Value = 'TOFECO' then
                EmiteReciboLote('Tofeco Fecularia', StrToDateTime(MEDataBaixa.Text), wCodFilial)
             Else
               // EmiteReciboLote(DMParamSistema.QParamSistemaDESC_EMPRESA.Value, StrToDateTime(MEDataBaixa.Text), wCodFilial);
               EmiteReciboLote(wDescFilial, StrToDateTime(MEDataBaixa.Text), wCodFilial);
      end;
      DMContasReceber_Rel.cdsRContasReceberBaixaLote.EmptyDataSet; //Limpa os Dados da Baixa Anterior.
      DMContasReceber_Rel.cdsRContasReceberBaixaLote.Close; //Fecha a Query em Memória.
      DMOracle.DBCemapa.Commit;
      if (cont > 0 ) then
        MessageDlg('Baixa feita com sucesso', mtInformation, [mbok], 0 )
      else
        MessageDlg('Selecione um ou mais títulos', mtInformation, [mbok], 0 );
      RG2FormaPagto.ItemIndex := 0;
      ME2CodBanco.Clear;
      ME2Banco.Clear;
      ME2CodContaCorrente.Clear;
      ME2NrCheque.Clear;
      Me2Observacao.Clear;
      PCBaixa.ActivePage := TS0Localiza;
      SbProcura.Click;

    except
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
  end;
end;

procedure TFContaPagarBaixa.EmiteReciboLote(logo:String; pDataBaixa : TDateTime; wCodFilial : Integer);
begin
  if FRReciboLote = Nil then
   FRReciboLote := TFRReciboLote.Create(Application);

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
  FRReciboLote.QRLDataCidade.Caption            := FormatDateTime('dd "de" mmmm "de" yyyy', pDataBaixa) + ' , ' + DMFilial.QFilialDESC_CIDADE.Text;
  FRReciboLote.QRDBAssinaRecibo.DataSet         := DMContasReceber_Rel.cdsRContasReceberBaixaLote;
  FRReciboLote.QRDBAssinaRecibo.DataField       := 'nome_cliente';
  FRReciboLote.QRDBAssinatura.Dataset           := DMFilial.QFilial;
  FRReciboLote.QRDBAssinatura.DataField         := 'Desc_Filial';
  //-----------------------------------
//  FRReciboLote.QRDBAssinatura.Dataset := DMFilial.QFilial;
//  FRReciboLote.QRDBAssinatura.Datafield := 'Desc_Filial';
  //Mostra o Relatório
  //-----------------------------------
  FRReciboLote.QRPrimario.Preview;
  //-----------------------------------

end;
//---------------------------------------------------------------
procedure TFContaPagarBaixa.RG2FormaPagtoClick(Sender: TObject);
Var wHistorico : String;
begin
//  If RG2FormaPagto.ItemIndex <> 1 then  // Pgto. em Dinheiro
  if (RG2FormaPagto.ItemIndex = 0) or (RG2FormaPagto.ItemIndex = 2) then
  Begin
    SB2ConsContaCorrente.Enabled:=False;
    ME2Banco.Clear;
    ME2CodBanco.Clear;
    ME2CodContaCorrente.Clear;
    ME2NrCheque.Clear;
    SB2Baixa.Enabled := True;
  End
  Else                              // Pagto. em Cheque
  Begin
    //wHistorico := DMOracle.BuscaNome('SELECT COD_HISTORICO_CHEQUE FROM TB_FINALIDADE','COD_FINALIDADE = '+FloatToStr(DMContasPagar.QContasPagarBaixaCod_Finalidade.Value));
    //If wHistorico = '' Then
    //Begin                        // caso cod_historico_cheque estiver vazio não será
    //  RG2FormaPagto.ItemIndex := 0; // permitido efetuar o pgto. com cheque
    //  ShowMessage('Erro! Cod. do Historico do Cheque deste Título em Branco !');
    //End
    //Else
    //Begin
    If ME2Banco.Text = '' then
      SB2Baixa.Enabled := False
    Else
      SB2Baixa.Enabled := True;
      
    SB2ConsContaCorrente.Enabled := True;
    //End;
  End;
end;

procedure TFContaPagarBaixa.SB2ConsContaCorrenteClick(Sender: TObject);
begin
  If FContaCorrenteCons = Nil Then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.ShowModal=MrOk then
    Begin
      ME2CodBanco.Text := FloatToStr(DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value);
      ME2Banco.Text := DMBancoAgencia.QContaCorrenteConsDesc_Banco_Agencia.Value;
      ME2CodContaCorrente.Text := FloatToStr(DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value);
      ME2NrCheque.Text := FloatToStr(DMBancoAgencia.QContaCorrenteConsNum_Cheque.Value + 1);
      SB2Baixa.Enabled := True;
    End;
end;

procedure TFContaPagarBaixa.SbHistoricoDescontoClick(Sender: TObject);
begin
  If FHistoricoCons = Nil Then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=MrOk then
     MeHistoricoDesconto.Text:=DMHistorico.QHistoricoConsCod_Historico.Text;

end;

procedure TFContaPagarBaixa.TsBaixaLoteEnter(Sender: TObject);
begin
//  if Trim(ME2DataBaixa.Text) = '' then
  ME2DataBaixa.Text := datetostr(DMOracle.DataServ);
  Me2DtPreDatado.Text := datetostr(DMOracle.DataServ);
end;

procedure TFContaPagarBaixa.ListView1Change(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  if item.Checked then
  begin
    DMContasPagar.QContasPagarBaixa.Locate('COD_CONTA_PAGAR_CAB', strtoint(item.Caption),[]);
    wSomaSelecionados := wSomaSelecionados + DMContasPagar.QContasPagarBaixaVAL_TITULO.Value;
    wSelecionaTodos := true;
  end
  else
  begin
    if item.caption <> '' then
    begin
      wSelecionaTodos := true;
      DMContasPagar.QContasPagarBaixa.Locate('COD_CONTA_PAGAR_CAB', strtoint(item.Caption),[]);
      if wSomaSelecionados - DMContasPagar.QContasPagarBaixaVAL_TITULO.Value >= 0 then
        wSomaSelecionados := wSomaSelecionados - DMContasPagar.QContasPagarBaixaVAL_TITULO.Value
      else
        wSomaSelecionados := 0;
    end;
  end;

  lblTotal.Caption := FormatFloat('#,##0.00', wSomaSelecionados);
end;

procedure TFContaPagarBaixa.ListView1ColumnClick(Sender: TObject;
  Column: TListColumn);
var i : integer; aux : boolean;
begin
  if Column.Caption = 'X' then
  begin
    aux := wSelecionaTodos;
    for i:=0 to ListView1.Items.Count-1 do
      ListView1.Items[i].Checked := aux;

    wSelecionaTodos := not aux;
  end;
end;

procedure TFContaPagarBaixa.BtFinalidadeClick(Sender: TObject);
begin
  if FFinalidadecons = Nil then
     FFinalidadecons:=TFFinalidadecons.Create(Application);
  if FFinalidadecons.ShowModal=MrOk then
    MeFinalidade.Text:=FloatToStr(DMFinalidade.QFinalidadeConsCod_Finalidade.Value);
end;

procedure TFContaPagarBaixa.SbMensagemClick(Sender: TObject);
begin
  if FMensagemCons = nil then
    FMensagemCons := TFMensagemCons.create(application);
  If FMensagemCons.ShowModal = MrOk Then
     MeObservacao.Text := DMMensagem.QMensagemConsDesc_Mensagem.Value;

end;

procedure TFContaPagarBaixa.MeValorOutrosExit(Sender: TObject);
begin
  If Trim(MeValorOutros.Text)<>'' then
    Begin
      Try
        StrToFloat(MeValorOutros.Text);
      except
        Raise Exception.Create('Valor Inválido!');
      end;
    End;
end;

procedure TFContaPagarBaixa.MEDataBaixaExit(Sender: TObject);
begin
  MeDtPreDatado.Text := MEDataBaixa.Text;
end;

procedure TFContaPagarBaixa.SpeedButton5Click(Sender: TObject);
begin
  If FFinalidadeCons=Nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal = MrOk then
  begin
    if DMFinalidade.QFinalidadeConsIND_FINALIDADE.Value = 'P' then
      MeFinalidadeReparcelamento.Text:=FloatToStr(DMFinalidade.QFinalidadeConsCod_Finalidade.Value)
    else
    begin
      MeFinalidadeReparcelamento.Clear;
      raise Exception.Create('A Finalidade não é de Contas a Pagar.');
    end;
  end;
end;

procedure TFContaPagarBaixa.BtReparcelarClick(Sender: TObject);
var
  wTotal, wTotalSemPrimeira, wValorPrimeira, wValorParcela, wTotalInformado: Double;
  wParcelas, wContParcela, wNumTitulo, i: Integer;
  wCodCadastro, wCodFilial, wCodFinalidade, wCodDepartamento, wObservacao : string;
  wVencimentoPrimeira, wHoje : TDateTime;
  wAchou, wEncontraNota : Boolean;
  wCodNotaCab: Integer;
  wCodContaRep, wNotasRepRetifoz, wTitulosRep : String;
  wNotasSeparadas, wNotasReparceladas, wTitulosRepSeparados: TStrings;
begin
  wNotasSeparadas := TStringList.Create;
  wTitulosRepSeparados := TStringList.Create;
  wNotasRepRetifoz := '';
  wCodContaRep := '';
  wTitulosRep := '';

  //Gian - 07/12/2018
  //Feito semelhante ao reparcelamento do contas a receber
  //À pedido do Junior

  wTotal := 0;
  wTotalSemPrimeira := 0;
  wAchou := False;

  if Trim(MeFinalidadeReparcelamento.Text) = '' then
    raise Exception.Create('Informar finalidade');

  if Trim(MeVenctoReparcelamento.Text) = '' then
    raise Exception.Create('Informe o vencimento da primeira parcela');

  if Trim(MeNrParcelas.Text) = '' then
    raise Exception.Create('Informe a quantidade de parcelas.');

  if Trim(MeValPrimeiraParcela.Text) = '' then
    raise Exception.Create('Informe o valor da primeira parcela.');

  if Trim(MECodFornecedor.Text) = '' then
    raise Exception.Create('Informe o cadastro.');

  if Trim(MECodFilial.Text) = '' then
    raise Exception.Create('Informe a filial.');

  if not StrToInt(Trim(MeNrParcelas.Text)) > 0 then
    raise Exception.Create('Quantidade de parcelas inválidas.');

  wVencimentoPrimeira := StrToDate(Trim(MeVenctoReparcelamento.Text));
  wParcelas := StrToInt(Trim(MeNrParcelas.Text));
  wValorPrimeira := StrToFloat(Trim(MeValPrimeiraParcela.Text));

  wHoje := Now;

  wCodCadastro := Trim(MECodFornecedor.Text);
  wCodFilial := Trim(MECodFilial.Text);
  wCodFinalidade := Trim(MeFinalidadeReparcelamento.Text);

  with DMContasPagar do
  begin
    wCodDepartamento := CdsContasPagarReparcelamentoCOD_DEPARTAMENTO.Text;

    CdsContasPagarReparcelamento.First;

    if DMParamSistema.CodEmpresa = 'RETIFOZ' then
      QReparcelamentoCP.Open;

    while not CdsContasPagarReparcelamento.EoF do
    begin
      wNotasSeparadas.Clear; //para atualizar a lista de notas e não gerar duplicidade
      wTitulosRepSeparados.Clear;
      //REPARCELAMENTO PARA RETIFOZ
      if DMParamSistema.CodEmpresa = 'RETIFOZ' then
      begin
        ExtractStrings([':'], [], PChar(wNotasRepRetifoz), wNotasSeparadas);
        ExtractStrings([':'], [], PChar(wTitulosRep), wTitulosRepSeparados);
        if CdsContasPagarReparcelamentoCHECADO.Value = 'SIM' then
        begin
          //ATUALIZA SITUAÇÃO DA NOTA PARA REPARCELADA
          DMOracle.ExecutaSql('UPDATE TB_CONTA_PAGAR_CAB SET IND_SITUACAO = ' + QuotedStr('REPARCELAR') +
                    ', VAL_TITULO = 0, DT_BAIXA = ' + QuotedStr(DateToStr(Date)) + ' WHERE COD_CONTA_PAGAR_CAB = ' +
                    CdsContasPagarReparcelamentoCOD_CONTA_PAGAR_CAB.Text, false);
          wTitulosRep := wTitulosRep + ':' + CdsContasPagarReparcelamentoNUM_TITULO.Text;



          wTotal := wTotal + CdsContasPagarReparcelamentoVAL_TITULO.Value;
          wObservacao := wObservacao + CdsContasPagarReparcelamentoNUM_TITULO.Text + '/' + CdsContasPagarReparcelamentoNUM_PARCELA.Text +
          '-' + CdsContasPagarReparcelamentoDT_EMISSAO.Text + chr(13)+chr(10);
          wAchou := True; //Adicionar Num_parcela na obs. Junior 18/02/2019
        end;
      end
      else
      begin
        if CdsContasPagarReparcelamentoCHECADO.Value = 'SIM' then
        begin
          wTotal := wTotal + CdsContasPagarReparcelamentoVAL_TITULO.Value;
          wObservacao := wObservacao + CdsContasPagarReparcelamentoNUM_TITULO.Text + '/' + CdsContasPagarReparcelamentoNUM_PARCELA.Text +
          '-' + CdsContasPagarReparcelamentoDT_EMISSAO.Text + chr(13)+chr(10);
          wAchou := True; //Adicionar Num_parcela na obs. Junior 18/02/2019
        end;

      end;

      CdsContasPagarReparcelamento.Next;

    end;

    wObservacao := 'Títulos Reparcelados: ' + chr(13)+Chr(10) + wObservacao; //Junior 18/02/2019

    if not wAchou then
      raise Exception.Create('Selecione ao menos uma parcela.');


    if DMParamSistema.CodEmpresa = 'RETIFOZ' then
    begin
      if wValorPrimeira = 0 then
        wValorPrimeira := wTotal/wParcelas;
    end;

    wTotalSemPrimeira := (wTotal - wValorPrimeira);

    //Primeira parcela com valor manual
    if wParcelas = 1 then
    begin
      wValorParcela := wValorPrimeira;
      if Trunc(wValorParcela) <> Trunc(wTotal) then
        raise Exception.Create('Valor da primeira parcela diferente que o total das parcelas selecionadas.');
    end
    else
    begin
      wValorParcela := (wTotalSemPrimeira/(wParcelas-1));
      wTotalInformado := (wValorPrimeira + ((wValorParcela)*(wParcelas-1)));
      if wValorParcela = 0 then
        raise Exception.Create('Valor de uma parcela não pode ser zero.');
      if Trunc(wTotal) <> Trunc(wTotalInformado) then
        raise Exception.Create('Valor final do reparcelamento é diferente do valor das parcelas selecionadas. Verifique a quantidade de parcelas.');
    end;
        if DMParamSistema.CodEmpresa <> 'RETIFOZ' then
      wNumTitulo := DMSequencia.Sequencia(StrToInt(wCodFilial),'Num_Titulo_CR')
    else
      wNumTitulo := DMSequencia.Sequencia(StrToInt(wCodFilial),'NUM_TITULO_REP_CP');


    if (DMParamSistema.CodEmpresa = 'RETIFOZ') then
    begin
      CdsContasPagarReparcelamento.First;
      while not CdsContasPagarReparcelamento.Eof do
      begin
        if CdsContasPagarReparcelamentoCHECADO.Value = 'SIM' then
        begin
          QReparcelamentoCP.Append;
          QReparcelamentoCPNUM_TITULO.Value := wNumTitulo;
          QReparcelamentoCPNUM_TITULO_ANT.Value := CdsContasPagarReparcelamentoNUM_TITULO.Value;
          QReparcelamentoCPDT_EMISSAO_ANT.Value := CdsContasPagarReparcelamentoDT_EMISSAO.Value;
          QReparcelamentoCPNUM_PARCELA_ANT.Value := CdsContasPagarReparcelamentoNUM_PARCELA.Value;
          QReparcelamentoCPCOD_NOTA_CAB.Value := CdsContasPagarReparcelamentoCOD_NOTA_CAB.Value;
          QReparcelamentoCP.Post;
        end;
        CdsContasPagarReparcelamento.Next;
      end;
    end;

    with DMOracle do
    begin
      DBCemapa.StartTransaction;
      try
        for wContParcela := 1 to wParcelas do
        begin
          wCodNotaCab := StrToInt(DMOracle.BuscaNome('SELECT SQCONTA_PAGAR.NEXTVAL FROM DUAL', '1=1'));
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          QExecSQL.SQL.Add('INSERT INTO TB_CONTA_PAGAR_CAB ');
          QExecSQL.SQL.Add('(COD_CONTA_PAGAR_CAB,');
          QExecSQL.SQL.Add('COD_FINALIDADE,COD_CADASTRO,COD_FILIAL,');
          QExecSQL.SQL.Add('NUM_TITULO,NUM_PARCELA,VAL_TITULO,');
          QExecSQL.SQL.Add('DT_MOVIMENTO,DT_VENCIMENTO,DT_EMISSAO,dt_capitalizacao,');
          QExecSQL.SQL.Add('IND_ACEITE,IND_SITUACAO,DESC_TIPO_DOCUMENTO,COD_USUARIO,');
          QExecSQL.SQL.Add('COD_DEPARTAMENTO,DESC_OBS,VAL_ORIGINAL)');
          QExecSQL.SQL.Add(' VALUES (');                                                                                           
          QExecSQL.SQL.Add(IntToStr(wCodNotaCab) + ',');
          QExecSQL.SQL.Add(QuotedStr(wCodFinalidade)+','+QuotedStr(wCodCadastro)+','+QuotedStr(wCodFilial)+',');
          if wContParcela = 1 then
            QExecSQL.SQL.Add(QuotedStr(IntToStr(wNumTitulo))+','+QuotedStr(IntToStr(wContParcela))+','+QuotedStr(FloatToStr(wValorPrimeira))+',')
          else
            QExecSQL.SQL.Add(QuotedStr(IntToStr(wNumTitulo))+','+QuotedStr(IntToStr(wContParcela))+','+QuotedStr(FloatToStr(wValorParcela))+',');

          if DMParamSistema.CodEmpresa <> 'RETIFOZ' then
          begin
            QExecSQL.SQL.Add(QuotedStr(DateToStr(wHoje))+','+QuotedStr(DateToStr(IncMonth(wVencimentoPrimeira,wContParcela-1)))+',');
            QExecSQL.SQL.Add(QuotedStr(DateToStr(wHoje))+','+QuotedStr(DateToStr(IncMonth(wVencimentoPrimeira,wContParcela-1)))+',');
          end
          else
          begin
            QExecSQL.SQL.Add(QuotedStr(DateToStr(wHoje))+','+QuotedStr(DateToStr(wVencimentoPrimeira+(StrToInt(RGReparcelamento.Items[RGReparcelamento.ItemIndex])*wContParcela)))+',');
            QExecSQL.SQL.Add(QuotedStr(DateToStr(wHoje))+','+QuotedStr(DateToStr(wVencimentoPrimeira+(StrToInt(RGReparcelamento.Items[RGReparcelamento.ItemIndex])*wContParcela)))+',');
          end;
          QExecSQL.SQL.Add(QuotedStr('NAO')+','+QuotedStr('ABERTO')+','+QuotedStr('REP')+',' + IntToStr(DMUsuario.CodUsuarioCorrente) +',' );
          QExecSQL.SQL.Add(QuotedStr(wCodDepartamento)+','+ QuotedStr(wObservacao) +',');
          if wContParcela = 1 then
            QExecSQL.SQL.Add(QuotedStr(FloatToStr(wValorPrimeira))+')')
          else
            QExecSQL.SQL.Add(QuotedStr(FloatToStr(wValorParcela))+')');
          QExecSQL.ExecSQL;
          //CONTAS PAGAR MOV
          QExecSQL.Close;    //Não estava criando o MOVIMENTO PRINCIPAL no Reparcelamento. Junior 09/08/2019. Suporte(12862)
          QExecSQL.SQL.Clear;
          QExecSQL.SQL.Add('INSERT INTO TB_CONTA_PAGAR_MOV ');
          QExecSQL.SQL.Add('(COD_CONTA_PAGAR_MOV, COD_CONTA_PAGAR_CAB,');
          QExecSQL.SQL.Add('DT_MOVIMENTO,VAL_MOVIMENTO,IND_TIPO_MOVIMENTO,');
          QExecSQL.SQL.Add('DT_USUARIO, COD_USUARIO)');
          QExecSQL.SQL.Add(' VALUES ');
          QExecSQL.SQL.Add('(SQCONTA_PAGAR_MOV.NEXTVAL,' + IntToStr(wCodNotaCab) + ',');//cod_conta_pagar_cab)
          QExecSQL.SQL.Add(QuotedStr(DateToStr(wHoje))+',');//DT_MOVIMENTO
          if wContParcela = 1 then
            QExecSQL.SQL.Add(QuotedStr(FloatToStr(wValorPrimeira))+',')
          else
            QExecSQL.SQL.Add(QuotedStr(FloatToStr(wValorParcela))+','); //val_movimento
          QExecSQL.SQL.Add(QuotedStr('PRINCIPAL')+',');  //ind_tipo_movimento
          QExecSQL.SQL.Add(QuotedStr(DateToStr(DMOracle.DataServ))+',' + IntToStr(DMUsuario.CodUsuarioCorrente) + ')');
          QExecSQL.ExecSQL;

        end;

        if DMParamSistema.CodEmpresa <> 'RETIFOZ' then
        begin
          CdsContasPagarReparcelamento.First;
          while not CdsContasPagarReparcelamento.EoF do
          begin
            if CdsContasPagarReparcelamentoCHECADO.Value = 'SIM' then
            begin
              //Apaga os movimentos do contas a pagar e apaga o codigo do contas a pagar do caixa_mov
              //Pra então apagar o titulo
              //Feito igual esta no constar a receber
              QExecSQL.Close;
              QExecSQL.SQL.Clear;
              QExecSQL.SQL.Add('DELETE FROM TB_CONTA_PAGAR_MOV WHERE ');
              QExecSQL.SQL.Add('COD_CONTA_PAGAR_CAB = '+QuotedStr(CdsContasPagarReparcelamentoCOD_CONTA_PAGAR_CAB.Text));
              QExecSQL.ExecSQL;
             
              QExecSQL.Close;
              QExecSQL.SQL.Clear;
              QExecSQL.SQL.Add('UPDATE TB_CAIXA_MOV SET');
              QExecSQL.SQL.Add('COD_CONTA_PAGAR_CAB = '+QuotedStr(''));
              QExecSQL.SQL.Add('WHERE COD_CONTA_PAGAR_CAB = '+QuotedStr(CdsContasPagarReparcelamentoCOD_CONTA_PAGAR_CAB.Text));
              QExecSQL.ExecSQL;

              QExecSQL.Close;
              QExecSQL.SQL.Clear;
              QExecSQL.SQL.Add('DELETE FROM TB_CONTA_PAGAR_CAB WHERE ');
              QExecSQL.SQL.Add('COD_CONTA_PAGAR_CAB = '+QuotedStr(CdsContasPagarReparcelamentoCOD_CONTA_PAGAR_CAB.Text));
              QExecSQL.ExecSQL;
            end;
            CdsContasPagarReparcelamento.Next;
          end;

        end;

        DBCemapa.Commit;
        SbProcuraClick(Sender);
        PCBaixa.ActivePage := TS0Reparcelamento;
        PCBaixaChange(Sender);
        DMContasPagar.pTotalReparcelamento := 0;
        MeSemJurosReparcelamento.Text := FloatToStr(DMContasPagar.pTotalReparcelamento);

        if (DMParamSistema.CodEmpresa = 'RETIFOZ') and (MessageDlg('Deseja imprimir o compromisso ?',mtInformation,[mbYes,mbNo],0)= MrYes) then
            BibContasPagar.ImprimeCompromissoRetifoz(wNumTitulo, wHoje);

      except on E : Exception do
        if True then
        begin
          DBCemapa.Rollback;
          MessageDlg('Houve um erro ao reparcelar: '+ E.Message, mtError, [mbOk],0);
          Abort;
        end;
      end;

    end;
  end; 
end;

procedure TFContaPagarBaixa.DBGReparcelamentoCellClick(Column: TColumn);
var
  recNumber :Integer;
begin
  with DMContasPagar do
  begin
    if (Column.FieldName = 'CHECADO') then
    begin
      if (not CdsContasPagarReparcelamento.IsEmpty) then
      begin
        CdsContasPagarReparcelamento.Edit;
        if CdsContasPagarReparcelamentoCHECADO.Value = 'SIM' then
        begin
          CdsContasPagarReparcelamentoCHECADO.Value := 'NAO';
        end
        else
        begin
          CdsContasPagarReparcelamentoCHECADO.Value := 'SIM'; 
        end;
        CdsContasPagarReparcelamento.Post;
      end;
      DBGReparcelamento.Refresh;
    end;
  end;

  MeSemJurosReparcelamento.Text := FloatToStr(DMContasPagar.pTotalReparcelamento);
end;

procedure TFContaPagarBaixa.DBGReparcelamentoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  wTotal : Double;
begin
  if Column.FieldName = 'CHECADO' then
  begin
    DBGReparcelamento.Canvas.FillRect(Rect);
    if DMContasPagar.CdsContasPagarReparcelamentoCHECADO.Value = 'SIM' then
      ILChecks.Draw(DBGReparcelamento.Canvas, Rect.Left + 2, Rect.Top + 1, 1)
    else
      ILChecks.Draw(DBGReparcelamento.Canvas, Rect.Left + 2, Rect.Top + 1, 0);
  end;
end;

procedure TFContaPagarBaixa.PCBaixaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if PCBaixa.ActivePage = TS1Baixa then
  begin
    IF DMOracle.BuscaNome('SELECT IND_ACEITE_CP FROM TB_PARAM_SISTEMA','IND_ACEITE_CP IS NOT NULL')='S' Then
    Begin
     If (DMContasPagar.QContasPagarBaixaInd_Aceite.value='NAO') or (DMContasPagar.QContasPagarBaixaCod_Conta_Pagar_Cab.Value=0) Then
       Begin
         ShowMessage('Não é Possível dar baixa neste título sem que seja dado o Aceite.');
         AllowChange:=False;
       End;
    End
    Else
    Begin
      If (DMContasPagar.QContasPagarBaixaCod_Conta_Pagar_Cab.Value=0) Then
        Begin
          ShowMessage('Não é Possível dar baixa neste título sem que seja dado o Aceite.');
          AllowChange:=False;
        End;
    End;
  end;
end;

procedure TFContaPagarBaixa.BitBtn1Click(Sender: TObject);
var
  x, y: array of string;
begin
  inherited;
   if DMContasPagar.QContasPagarBaixaCOD_NOTA_CAB.Text <> '' then
   Begin
     setLength(x, 3); //4 sql diferentes
     setLength(y, 3);

     x[0] := 'SELECT COD_VENDEDOR FROM TB_NOTA_CAB WHERE COD_NOTA_CAB =  '+DMContasPagar.QContasPagarBaixaCod_Nota_Cab.Text;
     x[1] := 'SELECT DT_EMISSAO FROM TB_NOTA_CAB WHERE COD_NOTA_CAB =  '+DMContasPagar.QContasPagarBaixaCod_Nota_Cab.Text;
     x[2] := 'SELECT COD_PRAZO_VENCIMENTO FROM TB_NOTA_CAB WHERE COD_NOTA_CAB =  '+DMContasPagar.QContasPagarBaixaCod_Nota_Cab.Text;

     DMOracle.BuscaNomes(x, y);
     DMNotaSaida.QItemNfCons.Close;
     DMNotaSaida.QItemNfCons.SetVariable('Cod_Nota_Cab',DMContasPagar.QContasPagarBaixaCod_Nota_Cab.Value);
     DMNotaSaida.QItemNfCons.Open;
     If FNotaItensCons = Nil Then
        FNotaItensCons := TFNotaItensCons.Create(application);
     FNotaItensCons.MeTexto.Text := Y[1];
     FNotaItensCons.MeVendedor.Text := Y[0];
     FNotaItensCons.MePagto.Text := Y[2];
     FNotaItensCons.ShowModal;
   End;

end;

procedure TFContaPagarBaixa.MeFinalidadeExit(Sender: TObject);
begin
  if Trim(MeFinalidade.Text) <> '' then
      MeDescFinalidade.Text:=DMOracle.BuscaNome('SELECT desc_finalidade FROM TB_FINALIDADE','COD_FINALIDADE = '+MeFinalidade.text);

end;

procedure TFContaPagarBaixa.BtFinalidadeExit(Sender: TObject);
begin
  MeFinalidade.OnExit(Self);
end;

procedure TFContaPagarBaixa.MeFinalidadeReparcelamentoExit(
  Sender: TObject);
begin
  if DMOracle.FastSelect('IND_FINALIDADE','TB_FINALIDADE','COD_FINALIDADE = ' + Trim(MeFinalidadeReparcelamento.Text)) = 'R' then
  begin
    MeFinalidadeReparcelamento.Clear;
    raise Exception.Create('A Finalidade não é de Contas a Pagar.');
  end;
end;

end.
