unit UNotaSaida_Confirma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ComCtrls, Db, Grids, DBGrids, DBCtrls, ExtCtrls, variants, maskutils,
  ActnList,
   // USES PARA O PIX
  Cemapa.Conversoes.API, Cemapa.NotaSaida.Vendas.Pix.PSPController,
  Cemapa.NotaSaida.Vendas.Pix.Interfaces, ACBrBase,
  ACBrPIXCD, ACBrPIXBase;

type
  TFNotaSaida_Confirma = class(TForm)
    PCConfirma: TPageControl;
    TSContaReceber: TTabSheet;
    TSFutura: TTabSheet;
    BtAvancar: TBitBtn;
    BtCancelar: TBitBtn;
    Label2: TLabel;
    GBCPNota: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MEDataCP: TMaskEdit;
    MEValorCP: TMaskEdit;
    BtApagaParcela: TBitBtn;
    LBContaReceber: TListBox;
    MEFinalidade: TMaskEdit;
    BtConsFinalidade: TBitBtn;
    EdFinalidade: TEdit;
    GBCPFrete: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    MEDtParcFrete: TMaskEdit;
    MEValParcFrete: TMaskEdit;
    BtApagaParcFrete: TBitBtn;
    LBContaPagarFrete: TListBox;
    MEFinalidadeFrete: TMaskEdit;
    BtConsFinalidadeFrete: TBitBtn;
    EdFinalidadeFrete: TEdit;
    Label1: TLabel;
    LFutura: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBGrid4: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid5: TDBGrid;
    BtBaixaAux: TBitBtn;
    BtCancelaBaixaAux: TBitBtn;
    MEQtBaixarAux: TMaskEdit;
    DBECod_Nota: TDBEdit;
    TSContaCorrente: TTabSheet;
    TSConfima: TTabSheet;
    Label16: TLabel;
    EdTotalNF: TEdit;
    Label18: TLabel;
    Label17: TLabel;
    Label8: TLabel;
    MEDiasCP: TMaskEdit;
    TabSheet1: TTabSheet;
    Label20: TLabel;
    Label21: TLabel;
    Label31: TLabel;
    MEDepartamento: TMaskEdit;
    BtConsDepartamento: TBitBtn;
    EdDepartamento: TEdit;
    Label22: TLabel;
    MEDepContaPagar: TMaskEdit;
    BtConsDepContaPagar: TBitBtn;
    EdDepContaPagar: TEdit;
    Label19: TLabel;
    MeBanco: TMaskEdit;
    EdBanco: TEdit;
    BtConsBanco: TBitBtn;
    Label23: TLabel;
    MePrazo: TMaskEdit;
    BtPrazo: TBitBtn;
    BitBtn1: TBitBtn;
    Label24: TLabel;
    MeBaixado: TMaskEdit;
    MeContaCorrente: TMaskEdit;
    Label25: TLabel;
    lblTotalImposto: TLabel;
    Label35: TLabel;
    Label3: TLabel;
    MeContaCorrente_Cheque: TMaskEdit;
    Label7: TLabel;
    MeDepartamento_Cheque: TMaskEdit;
    MeHistorico: TMaskEdit;
    Label26: TLabel;
    Label27: TLabel;
    MeNrCheque: TMaskEdit;
    BtDepartamento: TBitBtn;
    BtConsHistorico: TBitBtn;
    Label28: TLabel;
    MeValorCheque: TMaskEdit;
    MeDtCheque: TMaskEdit;
    Label29: TLabel;
    Label30: TLabel;
    MeObservacao: TMaskEdit;
    MeObservacao1: TMaskEdit;
    LbCheques: TListBox;
    BtInsertContaCorrente: TBitBtn;
    BtExcluiContaCorrente: TBitBtn;
    BtConsContaCorrente: TBitBtn;
    PnComissao: TPanel;
    Label32: TLabel;
    EComissao: TEdit;
    Label33: TLabel;
    EDataComissao: TEdit;
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    Action1: TAction;
    cbEnviaEmail: TCheckBox;
    cpPixCemapa: TACBrPixCD;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BtConsFinalidadeClick(Sender: TObject);
    procedure MEFinalidadeExit(Sender: TObject);
    procedure BtConsFinalidadeFreteClick(Sender: TObject);
    procedure MEFinalidadeFreteExit(Sender: TObject);
    procedure MEValorCPExit(Sender: TObject);
    procedure MEValParcFreteExit(Sender: TObject);
    procedure BtAvancarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtApagaParcelaClick(Sender: TObject);
    procedure BtApagaParcFreteClick(Sender: TObject);
    procedure DBECod_NotaChange(Sender: TObject);
    procedure BtBaixaAuxClick(Sender: TObject);
    procedure BtCancelaBaixaAuxClick(Sender: TObject);
    procedure MEDiasCPExit(Sender: TObject);
    procedure MEDepartamentoExit(Sender: TObject);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure MEDepContaPagarExit(Sender: TObject);
    procedure BtConsDepContaPagarClick(Sender: TObject);
    procedure BtConsBancoClick(Sender: TObject);
    procedure BtPrazoClick(Sender: TObject);
    procedure MePrazoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MeContaCorrenteExit(Sender: TObject);
    procedure BtInsertContaCorrenteClick(Sender: TObject);
    procedure BtExcluiContaCorrenteClick(Sender: TObject);
    procedure BtConsContaCorrenteClick(Sender: TObject);
    procedure BtDepartamentoClick(Sender: TObject);
    procedure BtConsHistoricoClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
    cControllerPix: IPSPPixController;
    fAtivado: Boolean;
    fPercAntecipacao: Double;
    procedure DoContaReceberPagar;
    procedure Finaliza;
    procedure SetaContaReceber;
    function SetaGera_Futura: Boolean;
    procedure SetaContaCorrente;
    procedure AtivaPagina(pNomePagina: string);
    // para uso do PIX
    procedure LimpaStatusPix(var StatusPix: TFluxoPagtoDados);
    function FormatarJson(const AJSON: String): String;
    procedure SetPercAntecipacao(Value: Double);
  public
    { Public declarations }
    fTXID, fPIXCopiaCola: String;
    procedure SetaConfirma;
    property pAtivado: Boolean read fAtivado write fAtivado;
    property PercAntecipacao: Double read fPercAntecipacao write SetPercAntecipacao;
    procedure geraParcelas;
    procedure emiteReciboEntrada;
    procedure EmiteReciboEntrada40Col;
  end;

var
  FNotaSaida_Confirma: TFNotaSaida_Confirma;

implementation

uses UOperacao_cl, UNotaSaida_cl, UFinalidade_cl, UOracle_cl, UDevolucaoTroca,
  UFinalidadeCons, USerie_cl, UBancoAgencia_cl, UBancosCons, URBloqueto,
  UNotaEntrada_cl, UDepartamentoCons, UDepartamento_cl, UGuiaAplicacaoParam,
  UNotaImpressao, UParamSistema_cl, UContasReceber_cl, URBoletaBB,
  URContasReceber_Duplicatas_Ab, UReceitaCad, UReceita_cl,
  URelatorioVenda_cl, UImpressoraFiscal, Ubiblioteca, UPrazoVencimentoCons,
  UPrazoVencimento_cl, UContaCorrenteCons, UPromissoria, UHistoricoCons,
  UHistorico_cl, UCadastro_cl, URContasReceber_Duplicatas_MEDIBENS,
  NfeUtils, UNfe_cl, UComissao_cl, USequencia_cl, URReciboCaixa,
  UFilial_cl, Math, URPromissorias, UImpressoraFiscal_cl,
  UDevolucaoTroca_cl, UBibVenda, UNotaAutomaticaFlag, UPagamentosNFe4,
  ULancamentoCartaoCad, UTela_cl,UInformaBancoPix,UUsuario_cl,
   // Uso no envio e geração do PIX
  ACBrPIXPSPShipay, UFQrCodePix, ACBrUtil, ACBrPIXSchemasCob,
  UContasPagarBaixa;

{$R *.DFM}

procedure TFNotaSaida_Confirma.FormActivate(Sender: TObject);
var wDescFunrural, wDescCadastro : String;
begin
  try
    if not pAtivado then
    begin
      pAtivado := True;
      BtAvancar.Enabled := True;
      BtCancelar.Enabled := True;
      DMOperacao.QOperacao.Close;
      DMOperacao.QOperacao.SetVariable('PK', DMNotaSaida.QNotaSaidaCod_Operacao.Value);
      DMOperacao.QOperacao.Open;
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK', DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value);
      DMCadastro.QCadastro.Open;
      if DmOperacao.QOperacaoInd_Tipo_Operacao.Value <> 'S' then
         raise Exception.Create('Operação Não é de Saída');
      if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') and (DMNotaSaida.QNotaSaidaCod_Departamento.Value <> 12) then
        if (DMOperacao.QOperacaoInd_Vendas.Value = 'V') and (DMNotaSaida.QNotaSaidaCod_Contrato_Vend.Text = '') then
        begin
          if (DMNotaSaida.QNotaSaidaCod_Vendedor.Text = '') or (DMNotaSaida.QNotaSaidaCod_Vendedor.Value = 0) then
            raise Exception.Create('Informar Código do Vendedor');
{            If (DMNotaSaida.QNotaSaidaCod_Cultura.Text = '') Or (DMNotaSaida.QNotaSaidaCod_Cultura.Value = 0) Then
               Raise Exception.Create ('Informar Cultura');   }
        end;
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL' then
      begin
        if DMNotaSaida.QNotaSaidaCod_Filial.Value = 1 then
          MeFinalidade.Text := '15'
        else
          MeFinalidade.Text := '25';
      end;
      if ((DMParamsistema.CodEmpresa = 'COZER') or (DMParamsistema.CodEmpresa = 'PROPE')) then
        MeFinalidade.Text := '2';
      LBContaReceber.Items.Clear;
      LBCheques.Items.Clear;
      LBContaPagarFrete.Items.Clear;
      MeContaCorrente_Cheque.Clear;
      MeDepartamento_Cheque.Clear;
      MeHistorico.Clear;
      MeNrCheque.Clear;
      MeValorCheque.Clear;
      MeDtCheque.Clear;
      MeObservacao.Clear;
      MeObservacao1.Clear;
      with DMNotaSaida do
      begin
        QItemNF.AutoCalcFields := False;
        QNotaSaida.Edit; // Abre Transaçao
        QNotaSaidaIND_SITUACAO.Value := '2'; // Confirmada
        // Gerar Caixa com o Cod_Historico_Caixa da Operacao
        //RateiaFrete;   Alterado por Adriel 21/09/2017, para fazer o rateio na trigger TRG_RATEIA_DESCONTO.
        AtualizaEstoque(-1);
        IncluiNotaAux;
        QItemNF.AutoCalcFields := True;
      end;
      if (DMParamSistema.CodEmpresa = 'TOMATESMI') or (DMParamSistema.CodEmpresa = 'STEIN') or (DMParamSistema.CodEmpresa = 'VIDAVERDE') or
         (DMParamSistema.CodEmpresa = 'SCALA') then //Suporte: 8021. Junior 05/10/2023
      begin             
        wDescFunrural := FormatFloat('0.00',(DMNotaSaida.QSomaItemNotasval_total_nota.Value - DMNotaSaida.QNotaSaidaVAL_AVISTA.Value - DMNotaSaida.pValorValeCompras -
                               DMNotaSaida.pValorValePresente)* (DMCadastro.QCadastroPERC_FUNRURAL.Value/100));

        wDescCadastro := FormatFloat('0.00',((DMNotaSaida.QSomaItemNotasval_total_nota.Value -
                      DMNotaSaida.QNotaSaidaVAL_AVISTA.Value -
                      DMNotaSaida.pValorValeCompras -
                      DMNotaSaida.pValorValePresente - StrToFloat(wDescFunrural)) * (DMCadastro.QCadastroPERC_DESCONTO.Value/100) ));

        EdTotalNF.Text := FormatFloat('#,##0.00',(DMNotaSaida.QSomaItemNotasval_total_nota.Value -
                      DMNotaSaida.QNotaSaidaVAL_AVISTA.Value -
                      DMNotaSaida.pValorValeCompras -
                      DMNotaSaida.pValorValePresente - StrToFloat(wDescFunrural) - StrToFloat(wDescCadastro) ));

        if (StrToFloat(wDescFunrural) > 0) and (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value = '55') then
          if DMNotaSaida.QNotaSaidaDESC_OBS_CORPO_NOTA.Text = '' then
          DMNotaSaida.QNotaSaidaDESC_OBS_CORPO_NOTA.Value := 'Percentual funrural ' + DMOracle.FastSelect('PERC_FUNRURAL','TB_CADASTRO','COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text) +
                                         '%. Valor R$ ' + wDescFunrural;

      end
      else
        EdTotalNF.Text := FormatFloat('#,##0.00',DMNotaSaida.QSomaItemNotasval_total_nota.Value -
                      DMNotaSaida.QNotaSaidaVAL_AVISTA.Value -
                      DMNotaSaida.pValorValeCompras -
                      DMNotaSaida.pValorValePresente);

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEBONA' then
      begin
        FNotaSaida_Confirma.PnComissao.Visible := True;
//        if (not DMNotaSaida.QNotaSaidaNUM_PEDIDO.IsNull) then
//          FNotaSaida_Confirma.EComissao.Text := FormatFloat('#,###,##0.00', StrToFloat(DMOracle.FastSelect('VAL_COMISSAO', 'TB_PEDIDO_CAB', 'NUM_PEDIDO = ' + DMNotaSaida.QNotaSaidaNUM_PEDIDO.Text + ' AND COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCOD_FILIAL.Text)))
//        else
//          FNotaSaida_Confirma.EComissao.Text := FormatFloat('#,###,##0.00', (Bib.Arredondar(StrToFloat(Trim(EdTotalNF.Text)) * DMNotaSaida.QNotaSaidaPERC_COMISSAO.Value / 100, 2)) );
          FNotaSaida_Confirma.EComissao.Text := FormatFloat('#,###,##0.00', DMNotaSaida.QNotaSaidaVAL_COMISSAO.Value);
      end
      else
        FNotaSaida_Confirma.PnComissao.Visible := False;

      SetaContaCorrente;
      cbEnviaEmail.Enabled := (Trim(DMCadastro.QCadastroDESC_E_MAIL1.Value) <> '')
        and (DMCadastro.QCadastroIND_LIBERA_BLOQUETO.Value = 'SIM')
        and (Trim(MeContaCorrente.Text) <> '');
    end;
  except
    BtAvancar.Enabled := False;
    AtivaPagina('ERRO');
    raise;
  end;
  if ( (DMParamSistema.CodEmpresa = 'CGS') or (DMParamSistema.CodEmpresa = 'FORTE')) then
  begin
    //wCC.Text := DMOracle.BuscaNome('SELECT DESC_AGENCIA FROM TB_CADASTRO','COD_CADASTRO ='+DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value);
    MEContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_AGENCIA FROM TB_CADASTRO', 'COD_CADASTRO =' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
    MEContaCorrenteExit(self);
  end;
  if DMParamSistema.CodEmpresa = 'ARISTIDES' then
  begin
    FNotaSaida_Confirma.Top := 0;
  end;

  if DMParamSistema.CodEmpresa = 'DEBONA' then
    FNotaSaida_Confirma.geraParcelas;

  if (DMParamSistema.CodEmpresa = 'SCALA') and (DMNotaSaida.QNotaSaidaIND_TIPO_PAGAMENTO.Text = '2') then
  begin
    FNotaSaida_Confirma.MePrazo.Text := '1';
    FNotaSaida_Confirma.MePrazo.SetFocus;
  end;

  if NotaAutomaticaFlag = Nil then
    NotaAutomaticaFlag := TNotaAutomaticaFlag.Create;
  if NotaAutomaticaFlag.pNotaAutomatica then
  begin
    if DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '2' then
    begin
      MePrazo.Text := '1';
      geraParcelas;
      BtAvancarClick(sender);
    end;

    FNotaSaida_Confirma.ModalResult := mrOk;
    // Utilizado para fechar o form
    FNotaSaida_Confirma.Tag := 777;
    FNotaSaida_Confirma.Finaliza;   
  end;

end;

procedure TFNotaSaida_Confirma.DoContaReceberPagar;
begin
  with DMNotaSaida do
  begin
    if (Trim(MEDepartamento.Text) = '') and (QNotaSaidaInd_Condicao_Pagto.Value = '2') then
    begin
      MEDepartamento.SetFocus;
      raise Exception.Create('Informe o departamento do contas a receber.');
    end;
    if (Trim(MeContaCorrente.Text) = '') and (QItemNF_CalcFieldsDESC_FORMA_COMPRA.Value = 'Boleto') then
    begin
      MeContaCorrente.SetFocus;
      raise Exception.Create('Informe a conta corrente para a geração do boleto');
    end;
    if (DMNotaSaida.QNotaSaidaVal_Frete.Value > 0) and
      (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'DEBONA') and //(DMParamSistema.QParamSistemaCod_Empresa.Value <> 'RETIFOZ')MUDEI DE RETIFOZ PARA DEBONA JUNIOR 13/08/2024
      (DMNotaSaida.QNotaSaidaCod_Transportador.Text <> '') and         //NÃO GERAR CP P/ RETIFOZ O VALOR DO FRETE VAI NO TOTAL DA NOTA
      (DMNotaSaida.QNotaSaidaInd_Tipo_Frete.Value = 'CIF') then // Contas a Pagar do Frete
    begin
      DMNotaSaida.ValidaContaPagar(LBContaPagarFrete.Items, StrToInt(Trim(MEFinalidadeFrete.Text)));
      if Trim(MEDepContaPagar.Text) = '' then
        raise Exception.Create('Informe o departamento do contas a pagar.');
    end;
    try
//      QItemNF.AutoCalcFields := False;
//      QNotaSaida.Edit; // Abre Transaçao
//      QNotaSaidaInd_Situacao.Value := '2'; // Confirmada
      // Gerar Caixa com o Cod_Historico_Caixa da Operacao
//      DMNotaSaida.RateiaFrete;
//      DMNotaSaida.AtualizaEstoque(-1);
//      DMNotaSaida.IncluiNotaAux;
      // AtivaPagina('CONTA_RECEBER');
//      QItemNF.AutoCalcFields := True;
      SetaGera_Futura;
    except
      QItemNF.AutoCalcFields := True;
      AtivaPagina('ERRO');
      raise;
    end;
  end;
end;

procedure TFNotaSaida_Confirma.FormCreate(Sender: TObject);
var wQtdePagina: Integer;
  wAux: string;
begin
  for wQtdePagina := 0 to PCConfirma.PageCount - 1 do
  begin
    PCConfirma.Pages[wQtdePagina].TabVisible := False;
  end;
  pAtivado := False;
  //calcula o valor da soma dos impostos e mostra na tela de confirmacao
  If DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text <> '' Then
   Begin
     wAux := '0' + DMOracle.BuscaNome('SELECT NVL(SUM(VAL_IMPOSTO),0) FROM TB_NOTA_IMPOSTO_SERVICO', 'COD_NOTA_CAB = ' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text);
     lblTotalImposto.Caption := FormatFloat('#,##0.00', strtofloat(wAux));
   End;
  cControllerPix := TPSPPixController.New;
end;

procedure TFNotaSaida_Confirma.FormDeactivate(Sender: TObject);
var wQtdePagina: Integer;
begin
  for wQtdePagina := 0 to PCConfirma.PageCount - 1 do
  begin
    PCConfirma.Pages[wQtdePagina].TabVisible := False;
  end;
end;

procedure TFNotaSaida_Confirma.BtConsFinalidadeClick(Sender: TObject);
begin
  if FFinalidadeCons = nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.showModal = mrOk then
  begin
    MEFinalidade.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    MEFinalidadeExit(Self);
  end;
end;

procedure TFNotaSaida_Confirma.MEFinalidadeExit(Sender: TObject);
var
  IndFinalidade: string;
begin
  if Trim(MEFinalidade.Text) <> '' then
    begin
      EdFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE',
                                              'COD_FINALIDADE = ' + MEFinalidade.Text);
    if UpperCase(Trim(DMOracle.BuscaNome('SELECT IND_LIBERADO FROM TB_FINALIDADE',
                                            'COD_FINALIDADE = ' + MEFinalidade.Text))) <> 'SIM' then
    begin
      MEFinalidade.SetFocus;
      Raise Exception.Create('Finalidade não liberada para uso.');
    end;
      IndFinalidade := DMOracle.BuscaNome('SELECT IND_FINALIDADE FROM TB_FINALIDADE',
                                          'COD_FINALIDADE = ' + MEFinalidade.Text);
    if UpperCase(Trim(IndFinalidade)) = 'P' then
    begin
      MEFinalidade.SetFocus;
      Raise Exception.Create('Não é permitido selecionar uma finalidade de "Pagar" em Contas a Receber.');
    end;
    end
  else
    EdFinalidade.Text := '';
end;



procedure TFNotaSaida_Confirma.BtConsFinalidadeFreteClick(Sender: TObject);
begin
  if FFinalidadeCons = nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.showModal = mrOk then
  begin
    MEFinalidadeFrete.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    MEFinalidadeFreteExit(Self);
  end;
end;

procedure TFNotaSaida_Confirma.MEFinalidadeFreteExit(Sender: TObject);
var
  IndFinalidade: string;
begin
  If Trim(MEFinalidadeFrete.Text) <> '' Then
    begin
      EdFinalidadeFrete.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE',
                                                   'COD_FINALIDADE = ' + MEFinalidadeFrete.Text);
      If UpperCase(Trim(DMOracle.BuscaNome('SELECT IND_LIBERADO FROM TB_FINALIDADE',
                                            'COD_FINALIDADE = ' + MEFinalidadeFrete.Text))) <> 'SIM' Then
        begin
          MEFinalidadeFrete.SetFocus;
          Raise Exception.Create('Finalidade não liberada para uso.');
        end;
      IndFinalidade := DMOracle.BuscaNome('SELECT IND_FINALIDADE FROM TB_FINALIDADE',
                                          'COD_FINALIDADE = ' + MEFinalidadeFrete.Text);
      If UpperCase(Trim(IndFinalidade)) = 'R' Then
        begin
          MEFinalidadeFrete.SetFocus;
          Raise Exception.Create('Não é permitido selecionar uma finalidade de "Receber" em Contas a Pagar.');
        end;
    end
  else
    EdFinalidadeFrete.Text := '';
end;

procedure TFNotaSaida_Confirma.MEValorCPExit(Sender: TObject);
var wLinha, wAux: string;
const wBranco: string = '                            ';
begin
  if (MEDataCP.Text <> '') and
    (MEValorCP.Text <> '') then
  begin
    if StrToDate(MEDataCp.Text) < Date then
      MessageDlg('Data de Vencimento Menor que Data Atual!', mtWarning, [mbOk], 0);
      //raise Exception.Create('Data de Vencimento Menor que Data Atual!');
      
    wLinha := DateToStr(StrToDate(MEDataCP.Text));
    wAux := FormatFloat('###,###,##0.00', StrToFloat(bib.LimpaString(MEValorCP.Text,'.')));
    wAux := Copy(wBranco, 1, 15 - Length(waux)) + wAux;
    wLinha := wLinha + wAux;
    LBContaReceber.Items.Add(wLinha);
    MEDataCP.Text := '';
    MEValorCP.Text := '';
    MEDiasCP.SetFocus;
  end;
end;

procedure TFNotaSaida_Confirma.MEValParcFreteExit(Sender: TObject);
var wLinha, wAux: string;
const wBranco: string = '                            ';
begin
  if (MEDtParcFrete.Text <> '') and
    (MEValParcFrete.Text <> '') then
  begin
    wLinha := DateToStr(StrToDate(MEDtParcFrete.Text));
    wAux := FormatFloat('###,###,##0.00', StrToFloat(MEValParcFrete.Text));
    wAux := Copy(wBranco, 1, 15 - Length(waux)) + wAux;
    wLinha := wLinha + wAux;
    LBContaPagarFrete.Items.Add(wLinha);
    MEDtParcFrete.Text := '';
    MEValParcFrete.Text := '';
    MEDtParcFrete.SetFocus;
  end;
end;

procedure TFNotaSaida_Confirma.BtAvancarClick(Sender: TObject);
var wQt_Baixa: Real;
begin
//  pModulo := 'VENDA';
  DMNotaSaida.QItemNF.AutoCalcfields := False;
  try
//Adicionado para abrir a tela de lançamento de cartão. Alex 01/02/2023
  if (DMParamSistema.QParamSistemaIND_CONTROLE_CARTAO.Value = 'S') and (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> '65')  then
  Begin
    DMNotaSaida.wLancCartaoIndividual := False;
    if ((DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '5') or//cartão débito
        (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '4')) then //cartão Crédito
    Begin
      if FLancamentoCartao = nil then
        FLancamentoCartao := TFLancamentoCartao.Create(Application);
      DMTela.VerificaTela('VENDA',FLancamentoCartao.Caption,FLancamentoCartao.Name);
      FLancamentoCartao.ShowModal;
    end;
  end;

  //>>>>>> Adicionado para cobrança Pix via Sistema <<<<<<<<<<<<<<<
  if (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Text = '6')
      and (DMNotaSaida.QContaPixIND_PIX_PADRAO.Text = 'S') then
  begin

  end;

//Adicionado lançamento PIX para a Refrigeração SMI. Alex 23/09/2022
//Adicionado Ferragem Medianeira por Solicitação da Dani. Alex 05/04/2024
  if ( (DMParamSistema.CodEmpresa = 'REFRISM') or (DMParamSistema.CodEmpresa = 'FERRAGMED') ) and (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '6') and
     (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> '65') then
  begin
    if FInformaBancoPix = nil then
      FInformaBancoPix := TFInformaBancoPix.create(Application);
    FInformaBancoPix.ShowModal;
  end;
 //Adicionado cod_empresa ACOESTE. 13/09/2023. Alex /  Adicionado para cartão débito Guilherme 13/11/2023
  if (DMParamSistema.CodEmpresa = 'ACOESTE') and
     ((DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '5') or  (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '6'))
     and (DMNotaSaida.QNotaSaidaCOD_SERIE.Value <> '65') then
  begin
    if FInformaBancoPix = nil then
      FInformaBancoPix := TFInformaBancoPix.create(Application);
    FInformaBancoPix.ShowModal;
  end;
{Adicionado para remover a guia de pagamento. Alex 20/05/2025}
  if DMParamSistema.QParamSistemaIND_GUIA_PAGAMENTO.Value = 'SIM' then
  begin
    if (DMUsuario.pTipoFuncionario <> 'VENDEDOR') and (DMUsuario.pTipoFuncionario <> 'COLABORADOR') then
    begin
      DMOracle.ExecutaSql('UPDATE TB_NOTA_CAB SET COD_GUIA_PAGAMENTO = NULL, COD_DEPARTAMENTO = ' + IntToStr(DMUsuario.CodDepartamentoUsuario) +
      ' WHERE COD_NOTA_CAB = ' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text);
    end;
  end;

  case PcConfirma.ActivePage.PageIndex of
    0: begin
//            If Trim(MEBancoAgencia.Text) = '' Then
//              Raise Exception.Create('Banco agência não informado!');
//            If (Trim(DBLCBContaCorrente.Text) = '')
//               and (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '3') then
//              Raise Exception.Create('Conta Corrente não informada!');
         // if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PUBLICAR' Then
          //  EdTotalNF.Text := FloatToStr((DMNotaSaida.QSomaItemNotaSVal_Total_Nota.Value - DMNotaSaida.QNotaSaidaVal_AVista.Value - DMNotaSaida.QSomaItemNotaSVAL_ISS.Value ))
         // else

        EdTotalNF.Text := FormatFloat('#,##0.00',DMNotaSaida.QSomaItemNotasval_total_nota.Value -
                          DMNotaSaida.QNotaSaidaVAL_AVISTA.Value -
                          DMNotaSaida.pValorValeCompras -
                          DMNotaSaida.pValorValePresente);
        FNotaSaida_Confirma.SetaContaReceber;
      end;
    1: begin // Aba de Conta Pagar    Aqui Atualiza Estoque
        FNotaSaida_Confirma.DoContaReceberPagar;
      end;
    2: begin // Futura
        with DMNotaSaida do
        begin
          QItemNF.First;
          while not QItemNF.Eof do
          begin
            wQt_Baixa := 0;
            QBaixaAux.First;
            while not QBaixaAux.Eof do
            begin
              wQt_Baixa := wQt_Baixa + QBaixaAuxQt_Quantidade.Value;
              QBaixaAux.Next;
            end;
//              If DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MFARINHA' Then - retirado pelo Cesar a pedido da Carla 06/07/2016
               If wQt_Baixa <> QItemNFQt_Quantidade.Value then
                  raise Exception.Create('Quantidade de rateio inválida!');
            QItemNF.Next;
          end;
        end;
          //FNotaSaida_Confirma.Finaliza;
        SetaConfirma;
      end;
    4: BtCancelarClick(Self);
    3: begin // Confirmação
        FNotaSaida_Confirma.Finaliza;
      end;
  end; // Case

  except
    DMNotaSaida.QItemNF.Close;
    DMNotaSaida.QItemNF.Open;
    ModalResult := mrNone;
    raise;
  end;
end;

procedure TFNotaSaida_Confirma.Finaliza;
var
  wValordesconto: Double;
begin
  with DMNotaSaida do
  begin
    try
      if QNotaSaida.State = dsEdit then
        QNotaSaida.Post;
      if (DMParamSistema.CodEmpresa = 'IRRIGA') or (DMParamSistema.CodEmpresa = 'MOINHO')     or (DMParamSistema.CodEmpresa = 'GOLDEN') or
         (DMParamSistema.CodEmpresa = 'GRASEL') or (DMParamSistema.CodEmpresa = 'PLANTIAGRO') then
      begin
        QGuiaAplicacao.Open;
        if QGuiaAplicacaoCod_Produto.Value > 0 then
        begin
          DMReceita.pNome_Tela := 'NOTA';
          if FReceitaCad = nil then
            FReceitaCad := TFReceitaCad.Create(Application);
          FReceitaCad.ShowModal;
        end;
      end;
{Criado este bloco para trazer o valor das notas de devoluções como desconto, quando os titulos da nota original já estão baixados. Alex 08/04/2026}
      if (DMParamSistema.QParamSistemaIND_BAIXA_PARCELA.Value = 'S') then
      begin
        with DMDevolucaoTroca do
        begin
          QContasPagarCabCons.Close;
          QContasPagarCabCons.SetVariable('COD_CADASTRO',QNotaSaidaCOD_CADASTRO.Text);
          QContasPagarCabCons.Open;
          if (QContasPagarCabCons.RecordCount > 0) and (QContasPagarCabConsIND_DEVOLUCAO.Value = 'S') then
          begin
            QContasPagarCabCons.First;
            wValordesconto := 0;
            while not QContasPagarCabCons.Eof do
            begin
              wValordesconto := wValordesconto + QContasPagarCabConsVAL_TITULO.Value;
              QContasPagarCabCons.Next;
            end;
            FDevolucaoTroca.baixaCP(wValordesconto, QNotaSaidaCOD_NOTA_CAB.Value, QNotaSaidaCOD_CADASTRO.Value);
          end;
        end;
      end;

      if DMOracle.DBCemapa.InTransaction then
        DMOracle.DBCemapa.Commit;
    except
      QNotaSaida.Cancel;
      raise;
    end;
    //Teste
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' then
      DMOracle.DBCemapa.Commit;
  end;

  //Insere pagamento para o PAF
  //with DMNotaSaida,DMImpressoraFiscal do
//  begin
//    QSomaItemNota.Refresh; //Pega o valor pago antes do pagamento
//    wValorPago := QSomaItemNotasVAL_TOTAL.Value;
//    QPagamento.Append;
//    QPagamentoDESC_PAGAMENTO.Value := wFormaPgto;
//    QPagamentoVAL_PAGAMENTO.Value := wValorPagamento;
//    if(wValorPagamento+wValorPago > ValorTotal) then
//      QPagamentoVal_Valor.Value :=  wValorPagamento -
//        (wValorPagamento - (ValorTotal - wValorPago))
//    else
//      QPagamentoVal_Valor.Value := wValorPagamento;
//    QPagamento.Post;
//    QSomaCupom.Refresh; //Pega o valor pago depois do pagamento
//    wValorPago := QSomaCupomVAL_PAGO.Value * 100;
//  end;
  FNotaSaida_Confirma.Close;
end;

procedure TFNotaSaida_Confirma.BtCancelarClick(Sender: TObject);
begin
  if DMNotaSaida.QNotaSaida.State <> dsBrowse then
    DMNotaSaida.QNotaSaida.Cancel;
  if DMOracle.DBCemapa.InTransaction then
  begin
    if not (DMNotaSaida.pTR) and not (DMNotaSaida.pTRF) then
      DMOracle.DBCemapa.RollBack
    else
      DMNotaSaida.pCF := True;
    DMNotaSaida.QNotaSaida.Close;
    DMNotaSaida.QNotaSaida.Open;
  end;
end;

procedure TFNotaSaida_Confirma.BtApagaParcelaClick(Sender: TObject);
begin
  LBContaReceber.Items.Delete(LBContaReceber.ItemIndex);
end;

procedure TFNotaSaida_Confirma.BtApagaParcFreteClick(Sender: TObject);
begin
  LBContaPagarFrete.Items.Delete(LBContaPagarFrete.ItemIndex);
end;

procedure TFNotaSaida_Confirma.DBECod_NotaChange(Sender: TObject);
Var
   wEmbalagem : Real;
begin
  with DMNotaSaida do
  begin
    if QNotaSaidaCod_FILIAL.Value <> 0 then
    begin
      QNFAuxAberto.Close;
      QNFAuxAberto.SetVariable('COD_FILIAL', QNotaSaidaCod_FILIAL.Value);
      If DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'KREUZ' Then
         QNFAuxAberto.SetVariable('COD_SERIE_MODELO',Null)
      else
         QNFAuxAberto.SetVariable('COD_SERIE_MODELO',QNotaSaidaCod_Serie_Modelo.Value);
//      If DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MFARINHA' Then  - retirado pelo Cesar a Pedido de Carla 06/07/2016
         QNFAuxAberto.SetVariable('COD_PRODUTO', QItemNFCod_Produto.Value);
{      Else
         QNFAuxAberto.SetVariable('COD_PRODUTO', Null);
}      if QNotaSaidaCod_Armazem_Alfandegado.Text <> '' then
        QNFAuxAberto.SetVariable('COD_CADASTRO', 'COD_ARMAZEM_ALFANDEGADO = ' + QNotaSaidaCod_Armazem_Alfandegado.Text)
      else
        QNFAuxAberto.SetVariable('COD_CADASTRO', 'COD_CADASTRO = ' + QNotaSaidaCod_Cadastro.Text);
      QNFAuxAberto.Open;
//      If DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MFARINHA' Then
         MEQtBaixarAux.Text := bib.LimpaString(QItemNFQt_Quantidade.Text, '.');
{      Else
        Begin
          wEmbalagem := StrToFloat('0'+DMOracle.BuscaNome('SELECT Num_Peso_Liquido FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value)));
          MEQtBaixarAux.Text := bib.LimpaString(FloatToStr(QItemNFQt_Quantidade.Value * wEmbalagem), '.');
        End;
}    end;
  end;
end;

procedure TFNotaSaida_Confirma.BtBaixaAuxClick(Sender: TObject);
var wQtde: Real;
    wNotaCabReferenciada : integer;
begin
  wQtde := StrToFloat(MEQtBaixarAux.Text);
  with DMNotaSaida do
  begin
    try
      if (wQtde > QNFAuxAbertoQt_Saldo.Value) Then
         raise Exception.Create('Quantidade inválida! - Quantidade nota maior que quantidade em aberto ');
//      If DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MFARINHA' Then  - retirei a pedido da carla 06/07/2016 César 
         If (wQtde > QItemNFQt_Quantidade.Value) then
            raise Exception.Create('Quantidade inválida! - Quantidade informada maior que quantidade da nota fiscal');
      QBaixaAux.Insert;
      QBaixaAuxCod_Nota_Item.Value := QItemNFCod_Nota_Item.Value;
      QBaixaAuxCod_Nota_Aux.Value := QNFAuxAbertoCod_Nota_Aux.Value;
      QBaixaAuxQt_Quantidade.Value := wQtde;
      QBaixaAux.Post;

      if QNotaSaidaCOD_SERIE_MODELO.Value = '55' then
      begin
        if ((QNotaSaidaIND_FINALIDADE_NFE.Value = 4) or
            (DMOperacao.QOperacaoIND_FUTURA_CLIENTE.Value = 'S') or
            (DMOperacao.QOperacaoIND_DEPOSITO_EMPRESA.Value = 'S') or
            (DMOperacao.QOperacaoIND_EMPRESTIMO_FORNECEDOR.Value = 'D') or
            (DMOperacao.QOperacaoIND_CONSIGNACAO_FORNECEDOR.Value = 'D')) and
            (QNFAuxAbertoDESC_CHAVE_ACESSO.Value <> '') then
        begin
          try
            begin
//              wNotaCabReferenciada := StrToInt(DMOracle.FastSelect('COD_NOTA_CAB_REF','TB_NOTA_REFERENCIADA','COD_NOTA_CAB = ' + QNotaSaidaCOD_NOTA_CAB.Text));
              QNotaReferenciada.Insert;
              QNotaReferenciadaCOD_NOTA_CAB.Value :=  QNotaSaidaCOD_NOTA_CAB.Value;
              QNotaReferenciadaCOD_NOTA_CAB_REF.Value := QNFAuxAbertoCOD_NOTA_CAB.Value;
              QNotaReferenciadaDESC_CHAVE_ACESSO.Value := Bib.LimpaNumero(QNFAuxAbertoDESC_CHAVE_ACESSO.Value);
              QNotaReferenciadaNUM_NOTA.Value := QNFAuxAbertoNUM_NOTA.Value;
              QNotaReferenciadaCOD_SERIE.Value := QNFAuxAbertoCOD_SERIE.Value;
              QNotaReferenciadaCOD_SERIE_MODELO.Value := QNFAuxAbertoCOD_SERIE_MODELO.Value;
              QNotaReferenciadaDT_EMISSAO.Value := QNFAuxAbertoDT_EMISSAO.Value;
              QNotaReferenciada.Post;
            end;
          Except
            QNotaReferenciada.Cancel;
          end;
        end;
      end;
      QNFAuxAberto.Close;
      QNFAuxAberto.Open;
      MeBaixado.Text := DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_BAIXA_AUX', 'COD_NOTA_ITEM = ' + FloatToStr(QItemNFCod_Nota_Item.Value));
    except
      if QBaixaAux.State in [dsEdit, dsInsert] then
        QBaixaAux.Cancel;
      raise;
    end;
  end;
end;

procedure TFNotaSaida_Confirma.BtCancelaBaixaAuxClick(Sender: TObject);
begin
  with DMNotaSaida do
  begin
    QBaixaAux.Delete;
    QNFAuxAberto.Close;
    QNFAuxAberto.Open;
    MeBaixado.Text := DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_BAIXA_AUX', 'COD_NOTA_ITEM = ' + FloatToStr(QItemNFCod_Nota_Item.Value));
  end;
end;

procedure TFNotaSaida_Confirma.SetaContaReceber;
var wMes, wAno, wDia: Word;
begin
  // Verifica se será gerado contas a Receber ou Contas a Pagar
  if ((DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '2')             or
      (DMNotaSaida.QItemNF_CalcFieldsDESC_FORMA_COMPRA.Value = 'BOLETO') or
      ((DMNotaSaida.QNotaSaidaVal_Frete.Value > 0)                       and
     (DMNotaSaida.QNotaSaidaInd_Tipo_Frete.Value = 'CIF')))  then
  begin
    GBCPNota.Enabled := DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '2'; // A Prazo
    GBCPFrete.Enabled := DMNotaSaida.QNotaSaidaVal_Frete.Value > 0;

    if DMCadastro.QCadastroNum_Dia_Vencto.Text <> '' then // esta rotina é quando foi colocado um dia para vencimento
    begin // das contas do cliente no cadastro
      DecodeDate(Date, wAno, wMes, wDia); // o sistema gera automaticamente para o proximo mes o C.R.
      Inc(wMes);
      if wMes > 12 then
      begin
        wMes := 1;
        Inc(wAno);
      end;
      if DMOracle.DiasNoMes(StrToDate('01/' + IntToStr(wMes) + '/' + IntToStr(wAno))) < DMCadastro.QCadastroNum_Dia_Vencto.Value then // isto serve para o caso de informar 31 e o mes so tem 30 dias
        wDia := DMOracle.DiasNoMes(StrToDate('01/' + IntToStr(wMes) + '/' + IntToStr(wAno)))
      else
        wDia := DMCadastro.QCadastroNum_Dia_Vencto.Value;
      MEDataCP.Text := IntToStr(wDia) + '/' + IntToStr(wMes) + '/' + IntToStr(wAno);
      MeValorCp.Text := EdTotalNF.Text;
    end;
    AtivaPagina('CONTA_RECEBER');
  end
  else
    FNotaSaida_Confirma.DoContaReceberPagar;
end;

function TFNotaSaida_Confirma.SetaGera_Futura;
var wFinalizar: Boolean;
begin
  wFinalizar := True;
  // Baixa de Deposito na Empresa
  DMNotaSaida.QNFAuxAberto.Close;
//  DMNotaSaida.QNFAuxAberto.SetVariable('COD_FILIAL',DMNotaSaida.QNotaSaidaCod_FILIAL.Value);
//  DMNotaSaida.QNFAuxAberto.SetVariable('COD_PRODUTO',DMNotaSaida.QItemNFCod_Produto.Value);
  if DMOperacao.QOperacaoInd_Deposito_Empresa.Value = 'S' then // Simples Remessa
  begin
    LFutura.Caption := 'Baixa de Depósito na Empresa';
    PCConfirma.Pages[2].Caption := 'Depósito';
    if DMNotaSaida.QNotaSaidaCod_Armazem_Alfandegado.Text <> '' then
      DMNotaSaida.QNFAuxAberto.SetVariable('COD_CADASTRO', 'COD_ARMAZEM_ALFANDEGADO = ' + DMNotaSaida.QNotaSaidaCod_Armazem_Alfandegado.Text)
    else
      DMNotaSaida.QNFAuxAberto.SetVariable('COD_CADASTRO', 'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCod_Cadastro.Text);
    DMNotaSaida.QNFAuxAberto.SetVariable('TIPO', 'DEP_EMP'); // Depósito na Empresa
    DMNotaSaida.QNFAuxAberto.Open;
    DMNotaSaida.QBaixaAux.Open;
    wFinalizar := False;
  end;
  // Remessa de Venda Futura
  if DMOperacao.QOperacaoInd_Futura_Cliente.Value = 'S' then // Simples Remessa
  begin
    LFutura.Caption := 'Simples Remessa de Venda Futura';
    PCConfirma.Pages[2].Caption := 'Venda Futura';
//    DMNotaSaida.QNFAuxAberto.Close;
    if DMNotaSaida.QNotaSaidaCod_Armazem_Alfandegado.Text <> '' then
      DMNotaSaida.QNFAuxAberto.SetVariable('COD_CADASTRO', 'COD_ARMAZEM_ALFANDEGADO = ' + DMNotaSaida.QNotaSaidaCod_Armazem_Alfandegado.Text)
    else
      DMNotaSaida.QNFAuxAberto.SetVariable('COD_CADASTRO', 'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCod_Cadastro.Text);
    DMNotaSaida.QNFAuxAberto.SetVariable('TIPO', 'VEN_FUT'); // Venda Futura
    DMNotaSaida.QNFAuxAberto.Open;
    DMNotaSaida.QBaixaAux.Close;
    DMNotaSaida.QBaixaAux.Open;
    wFinalizar := False;
  end;

  // Devolução de Compra Futura
  if DMOperacao.QOperacaoInd_Futura_Fornecedor.Value = 'D' then
  begin
    LFutura.Caption := 'Devolução de Compra Futura';
    PCConfirma.Pages[2].Caption := 'Compra Futura';
//    DMNotaSaida.QNFAuxAberto.Close;
    if DMNotaSaida.QNotaSaidaCod_Armazem_Alfandegado.Text <> '' then
      DMNotaSaida.QNFAuxAberto.SetVariable('COD_CADASTRO', 'COD_ARMAZEM_ALFANDEGADO = ' + DMNotaSaida.QNotaSaidaCod_Armazem_Alfandegado.Text)
    else
      DMNotaSaida.QNFAuxAberto.SetVariable('COD_CADASTRO', 'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCod_Cadastro.Text);
    DMNotaSaida.QNFAuxAberto.SetVariable('TIPO', 'COM_FUT'); // Compra Futura
    DMNotaSaida.QNFAuxAberto.Open;
    DMNotaSaida.QBaixaAux.Open;
    wFinalizar := False;
  end;

  // Devolucao de Mercadoria em Consignação
  if DMOperacao.QOperacaoInd_Consignacao_Fornecedor.Value = 'D' then
  begin
    LFutura.Caption := 'Devolução de Consignação';
    PCConfirma.Pages[2].Caption := 'Consignação';
//    DMNotaSaida.QNFAuxAberto.Close;
    if DMNotaSaida.QNotaSaidaCod_Armazem_Alfandegado.Text <> '' then
      DMNotaSaida.QNFAuxAberto.SetVariable('COD_CADASTRO', 'COD_ARMAZEM_ALFANDEGADO = ' + DMNotaSaida.QNotaSaidaCod_Armazem_Alfandegado.Text)
    else
      DMNotaSaida.QNFAuxAberto.SetVariable('COD_CADASTRO', 'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCod_Cadastro.Text);
    DMNotaSaida.QNFAuxAberto.SetVariable('TIPO', 'CON_FOR'); // Devolução de Compra em Consignação
    DMNotaSaida.QNFAuxAberto.Open;
    DMNotaSaida.QBaixaAux.Open;
    wFinalizar := False;
  end;

  // Devolucao de Empréstimo
  if DMOperacao.QOperacaoInd_Emprestimo_Fornecedor.Value = 'D' then
  begin
    LFutura.Caption := 'Devolução de Empréstimo';
    PCConfirma.Pages[2].Caption := 'Empréstimo';
//    DMNotaSaida.QNFAuxAberto.Close;
    if DMNotaSaida.QNotaSaidaCod_Armazem_Alfandegado.Text <> '' then
      DMNotaSaida.QNFAuxAberto.SetVariable('COD_CADASTRO', 'COD_ARMAZEM_ALFANDEGADO = ' + DMNotaSaida.QNotaSaidaCod_Armazem_Alfandegado.Text)
    else
      DMNotaSaida.QNFAuxAberto.SetVariable('COD_CADASTRO', 'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCod_Cadastro.Text);
    DMNotaSaida.QNFAuxAberto.SetVariable('TIPO', 'EMP_FOR'); // Devolução de Empréstimo
    DMNotaSaida.QNFAuxAberto.Open;
    DMNotaSaida.QBaixaAux.Open;
    wFinalizar := False;
  end;
  if wFinalizar = True then
    SetaConfirma
  else
  begin
    DMNotaSaida.QItemNF.EnableControls;
    DMNotaSaida.QItemNF.First;
    AtivaPagina('FUTURA');
  end;
  Result := True;
end;

procedure TFNotaSaida_Confirma.SetaContaCorrente;
begin
  { Este código foi comentado para não aparecer mais a aba Conta Corrente na tela de confirmação da nota
  
  if (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO') and
    (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GONZATTI') then
    AtivaPagina('CONTA_CORRENTE')
  else}

  // código existente dentro do evento click do botão Avançar

  if ((DMParamSistema.CodEmpresa <> 'TOMATESMI') and (DMParamSistema.CodEmpresa <> 'STEIN') and (DMParamSistema.CodEmpresa <> 'VIDAVERDE') and
      (DMParamSistema.CodEmpresa <> 'SCALA') ) then //Suporte: 8021. Junior 05/10/2023
    EdTotalNF.Text := FormatFloat('#,##0.00',DMNotaSaida.QSomaItemNotasval_total_nota.Value -
                      DMNotaSaida.QNotaSaidaVAL_AVISTA.Value -
                      DMNotaSaida.pValorValeCompras -
                      DMNotaSaida.pValorValePresente);
  FNotaSaida_Confirma.SetaContaReceber;

end;


procedure TFNotaSaida_Confirma.SetaConfirma;
var
  wLibera_Bloqueto, wComando, wResult, wAVista, sCaminho: string;
  x, y: array of string;
  wLote: Integer;
  wTipoPagamento: String;
  // Para o pix
  vDigCpfCnpj, iItem, wBanco : integer;
  aCpfCnpj, aCodBarra, aProduto, wPadrao: string;
label
  lDispensaQrCode;
begin
  sCaminho := ExtractFileDir(Application.ExeName);
  FNotaImpressao := TFNotaImpressao.Create;
  with DMNotaSaida do
  begin
    try
      AcertaValoresNota; //Chamando função do banco para acertar valores da nota
      QItemNF.AutoCalcfields := False;
      if QNotaSaidaNum_Nota.Value = 0 then
        QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value, QNotaSaidaCod_Serie.Value,
          QNotaSaidaCOD_SERIE_MODELO.Value);
      if ((QNotaSaidaInd_Condicao_Pagto.Value = '1') or (QNotaSaidaInd_Condicao_Pagto.Value = '6')) and
                   (QNotaSaidaCOD_SERIE_MODELO.Value <> '65') then // 1-A Vista 6-PIX
      begin
        if QNotaSaidaInd_Condicao_Pagto.Value = '1' then
          wAVista := 'A VISTA'
        else
          wAvista := 'PIX';
        //INICIO DO PIX
        QContaPix.Open;
        if QContaPix.RecordCount > 0 then
        begin
          // PIX QRCODE --> Atribui as configurações padrão salvas no form do módulo bancos
          cControllerPix.Configuracao
                .PSP(TTipoBancoPix(QContaPixCOD_PSP_BANCO.Value))
                .ClientID(QContaPixDESC_CLIENT_ID.Text)
                .ClientSecret(QContaPixDESC_CLIENT_SECRET.Text)
                .ConsumerKey(QContaPixDESC_CONSUMER_KEY.Text)
                .ConsumerSecret(QContaPixDESC_CONSUMER_SECRET.Text)
                .DevelopApplication(QContaPixDESC_DEVELOPER_APPLICATION_KEY.Text)
                .AccountID(QContaPixDESC_ACCOUNT_ID.Text)
                .ChavePrivada(QContaPixDESC_ARQUIVO_CHAVE_PRIVADA.Text)
                .Certificado(QContaPixDESC_ARQUIVO_CERTIFICADO.Text)
                .CertificadoRoot(QContaPixDESC_ARQUIVO_ROOT_CERTIFICADO.Text)
                .SecretKey(QContaPixDESC_SECRET_KEY.Text)
                .AccessKey(QContaPixDESC_ACCESS_KEY.Text)
                .CertificadoPFX(QContaPixDESC_ARQUIVO_PFX.Text)
                .SenhaCertificado(QContaPixDESC_SENHA_PFX.Text)
                .Token(QContaPixDESC_TOKEN.Text)
                .TokenSandbox(QContaPixDESC_ACCESS_TOKEN.Text)
                .MediatorFee(QContaPixDESC_MEDIATOR_FEE.Value)
                .APIVersion(QContaPixCOD_API_VERSION.Text)
                .Ambiente(QContaPixIND_AMBIENTE_PSP.Text)
                .ChavePIX(QContaPixDESC_CHAVE_PIX.Text);
          // Executa o componente que vai gerar a comunicação com o banco de forma dinâmica
          // De acorodo com o banco cadastrado, sobe o componente.
          cpPixCemapa.PSP :=  cControllerPix.Contexto.ExecutarStrategy.PSP;
          // Define o ambiente com base na informação trazida do cadastro pix
          cpPixCemapa.Ambiente := TACBrPixCDAmbiente(StrToInt(cControllerPix.Configuracao.Ambiente));
          cpPixCemapa.TimeOut := 3600;
          cpPixCemapa.ArqLOG := './defaultFailPix.log';
          cpPixCemapa.NivelLog := 4;
          // Constantes da classe Cemapa.Conversoes.API
          cpPixCemapa.Recebedor.Nome := QNFE_EmiteNOME_FILIAL.Text; //SOFTWARE_HOUSE;
          cpPixCemapa.Recebedor.CEP := QNFE_EmiteCEP_FILIAL.Text; //SOFTWARE_HOUSE_CEP;
          cpPixCemapa.Recebedor.Cidade := QNFE_EmiteCIDADE_FILIAL.Text; //SOFTWARE_HOUSE_CIDADE;
          cpPixCemapa.Recebedor.UF := QNFE_EmiteUF_FILIAL.Text; // SOFTWARE_HOUSE_UF;
        end;
        if (QNotaSaidaIND_CONDICAO_PAGTO.Text = '6') and (QContaPixIND_PIX_PADRAO.Text = 'S') and (QNotaSaidaDESC_TXID.Text = '') then
        begin
          with cpPixCemapa.PSP.epCob.CobSolicitada do
          begin
            chave := cControllerPix.Configuracao.ChavePIX;
            calendario.expiracao := 3600;

            devedor.nome := Trim(QNotaNomeNOME.Value);
            BIB.IFT(Trim(QNotaNomeNome.Value) = '' , 'CONSUMIDOR', Trim(QnotaNomeNOME.Value));
            aCpfCnpj := trim(QNotaNomeDESC_CGC_CPF.Value);
            aCpfCnpj := Bib.LimpaString(Bib.LimpaString(aCpfCnpj, '-'), '.');
            aCpfCnpj := Bib.LimpaString(aCpfCnpj, '/');

            vDigCpfCnpj := Length(aCpfCnpj);

            if (vDigCpfCnpj > 11) then
              devedor.cnpj := aCpfCnpj
            else
              devedor.cpf := aCpfCnpj;


             QItemNfCons.Close;
             QItemNfCons.SetVariable('COD_NOTA_CAB', QItemNFCOD_NOTA_CAB.Value);
             QItemNfCons.Open;
             QItemNfCons.First;
            //quando é pra este prestador de serviço de pagamento
            //precisa mandar os itens da nota
            if (cpPixCemapa.PSP is TACBrPSPShipay) then
            begin
              with infoAdicionais.New do
              begin
                nome := 'order_ref';
                valor := FormatDateTime('yymmddhhnnss', Now);
              end;
              for iItem := 0 to QItemNfCons.RecordCount -1 do
              begin
                with infoAdicionais.New do
                begin
                  aCodBarra := DMOracle.BuscaNome('SELECT DESC_CODIGO_BARRA FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNfConsCOD_PRODUTO.Value));
                  nome := 'item_' + IntToStr(iItem + 1);
                  aProduto := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNfConsCOD_PRODUTO.Value));
                  valor := '{' + '"ean": "' + aCodBarra + '", ' +
                     '"item_title": "' + aProduto + '", ' +
                     '"quantity":'+  QItemNfConsQT_QUANTIDADE.Text  +', ' +
                     '"sku": "' + 'EAN' + '", ' +
                     '"unit_price": ' + StringReplace(QItemNfConsVAL_UNITARIO.Text, '.', '', []) + '}';
                end; // preenchimento das informações
                QItemNfCons.Next;
              end; // for
              QItemNfCons.Close;
            end; //  if shipay
            QSomaItemNota.Close;
            QSomaItemNota.SetVariable('COD_NOTA_CAB',QNotaSaidaCOD_NOTA_CAB.Value);
            QSomaItemNota.Open;
            // busca o valor total da nota, não encontrei em outro lugar
            valor.original := QSomaItemNotaSVAL_TOTAL.Value + QSomaItemNotaSVAL_DESPESAS.Value - QSomaItemNotaSVAL_DESCONTO.Value - QNotaSaidaVal_AVista.Value - DMNotaSaida.pValorValeCompras - DMNotaSaida.pValorValePresente;
            LimpaStatusPix(fPixDadosStatus);
            fPixDadosStatus.Total := valor.original;
            // Começa a executar a cobrança
            if cpPixCemapa.PSP.epCob.CriarCobrancaImediata then
            begin
              fPixDadosStatus.TxID := cpPixCemapa.PSP.epCob.CobGerada.txId;
              fPixDadosStatus.QRCode := Trim(cpPixCemapa.PSP.epCob.CobGerada.pixCopiaECola);
              if (fPixDadosStatus.QRCode = EmptyStr) then
                fPixDadosStatus.QRCode := cpPixCemapa.GerarQRCodeDinamico(cpPixCemapa.PSP.epCob.CobGerada.location);

              if FQrCodePix = nil then
                FQrCodePix := TFQrCodePix.Create(nil);
              FQrCodePix.recebeDados(cpPixCemapa, fPixDadosStatus);
            end
            else
            begin
              fPixDadosStatus.EmErro := True;
              Raise Exception.Create('Erro ao Criar Cobrança Pix: ' + sLineBreak +
                      FormatarJSON(cpPixCemapa.PSP.epCob.Problema.AsJSON));
            end;
            FQrCodePix.ShowModal;
            if (FQrCodePix.isAbort) then
              goto lDispensaQrCode;
            if (FQrCodePix.ModalResult = MRCancel) and not (fPixDadosStatus.EmErro)then
            begin
              cpPixCemapa.PSP.epCob.CobRevisada.status := stcREMOVIDA_PELO_USUARIO_RECEBEDOR;
              if cpPixCemapa.PSP.epCob.RevisarCobrancaImediata(fPixDadosStatus.TxID) then
              begin
                cpPixCemapa.PSP.Clear;
                Raise Exception.Create('Operação com o Pix CANCELADA!');
              end
              else if (FQrCodePix.ModalResult = MRCancel) and (fPixDadosStatus.EmErro) then
              begin
                Raise Exception.Create('Falha ao CANCELAR a Cobrança!');
              end;
            end
            else if (fPixDadosStatus.EmErro) then
            begin
              Raise Exception.Create('Erro ao realizar a cobrança!');
            end;
          end;
          //// Aqui daria continidade para pegar os dados do pix e do valor.
          //// FPixDadosStatus.TxID é onde fica o codigo único do pix
          //// fPixDadosStatus.QRCode é onde está a url para gerar o qrcode
          //// fPixDadosStatus.Total é o valor da cobrança
          //// fPixDadosStatus.EmErro Caso dê erro, vai ser aqui que pega a informaçao
          //// fPixDadosStatus.QtdConsultas quantidade de consultas tentadas. Vou limitar em 36
          QNotaSaidaDESC_TXID.Value := fPixDadosStatus.TxID;
          QContaPix.Close;
          FQrCodePix := nil;
        end;
        lDispensaQrCode: //vem pra cá para dispensar QRCODE
        if QSomaItemNotaSVal_Total_Nota.Value - DMNotaSaida.pValorValeCompras - DMNotaSaida.pValorValePresente -
          QSomaItemNotaSVAL_CHEQUE_CAIXA.Value > 0 then
          begin
            AtuCaixa(QSomaItemNotaSVal_Total_Nota.Value - DMNotaSaida.pValorValeCompras - DMNotaSaida.QNotaSaidaVAL_AVISTA.Value -
              DMNotaSaida.pValorValePresente - QSomaItemNotaSVAL_CHEQUE_CAIXA.Value,
              wAvista{'A VISTA'}, QNotaSaidaCod_Operacao.Text, QNotaSaidaCod_Filial.Text,
              QNotaSaidaCod_Departamento.Text, QNotaSaidaNum_Nota.Text, QNotaSaidaCod_Cadastro.Text, QNotaSaidaCod_Nota_Cab.Text,
              '', Trunc(QNotaSaidaDt_Recebimento.Value));
          end;
      end;
      if QNotaSaidaVal_AVista.Value > 0 then // Valor da Entrada
      begin
        AtuCaixa(QNotaSaidaVal_AVista.Value, 'ENTRADA', QNotaSaidaCod_Operacao.Text, QNotaSaidaCod_Filial.Text,
          QNotaSaidaCod_Departamento.Text, QNotaSaidaNum_Nota.Text, QNotaSaidaCod_Cadastro.Text, QNotaSaidaCod_Nota_Cab.Text,
          '', Trunc(QNotaSaidaDt_Recebimento.Value));
      end;

      if (QNotaSaidaInd_Condicao_Pagto.Value = '2') and (QNotaSaidaCOD_SERIE_MODELO.Value <> '65') then // A Prazo
        GeraContaReceber(LBContaReceber.Items, StrToInt(Trim(MEFinalidade.Text)), Trim(MEBanco.Text), Trim(MEDepartamento.Text), Trim(MeContaCorrente.Text), fPercAntecipacao);


      if (QNotaSaidaVal_Frete.Value > 0) and
        (Trim(QNotaSaidaNum_Conhecimento_Frete.Text) <> '') and
        (Trim(QNotaSaidaCod_Transportador.Text) <> '') and
        (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'AB') and
        (QNotaSaidaInd_Tipo_Frete.Value = 'CIF') then // Contas a Pagar do Frete
        GeraContaPagar(LBContaPagarFrete.Items, StrToInt(Trim(MEFinalidadeFrete.Text)), StrToInt(Trim(MEDepContaPagar.Text)));
      if DMParamSistema.QparamSistemaInd_Contabiliza.Value = 'S' then
        Contabiliza;
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
        DesdobramentoClaspar;
      if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI') and
        (QNotaSaidaVal_Frete.Value <> 0) then
        Conhecimento_Frete(QNotaSaidaCod_Nota_Cab.Value, QNotaSaidaNum_Conhecimento_Frete.Value, QNotaSaidaCod_Filial.Value,
          QNotaSaidaCod_Transportador.Value, QNotaSaidaCod_Operacao_Cf.Value, QNotaSaidaCod_Tributacao_Frete.Value, QNotaSaidaVal_Pedagio.Value,
          QNotaSaidaVal_Icm_Frete.Value, QNotaSaidaVal_Frete_Ton.Value, QNotaSaidaVal_Frete.Value,
          QNotaSaidaDesc_Placa.Value, QNotaSaidaDesc_Transportadora.Value, QNotaSaidaCod_Contrato_Vend.Text, QNotaSaidaDt_Emissao_Cf.Value);
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'GRASEL' then
        AtuPedido(1);
//    DMNotaSaida.AtuCPFunrural(1);
      if pTRF2 then // nota de transferencia:Gravar o codigo da nota de entrada para chegar na volta de confirmação se a nota de entrada ja foi confirmada
        QNotaSaidaCOD_NOTA_CAB_TRANS_ENT.Value := DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Value;
      QNotaSaida.Post;
// vai gerar o movimento bancario dos cheques lançados
      DMBancoAgencia.GeraMovBancario(LBCheques.Items, QNotaSaidaCod_Nota_Cab.Value, QNotaSaidaNum_Nota.Value, QNotaSaidaCod_Cadastro.Value, QNotaSaidaCod_Vendedor.Value, QNotaSaidaCod_Serie.Value);
      QSomaItemNota.Refresh;
      if (QSomaItemNotaSVAL_CHEQUE_CAIXA.Value > 0) and (QNotaSaidaCOD_SERIE_MODELO.Value <> '65') then
        AtuCaixa(QSomaItemNotaSVAL_CHEQUE_CAIXA.Value, 'CHEQUE', QNotaSaidaCOD_OPERACAO.Text, QNotaSaidaCOD_FILIAL.Text,
          QNotaSaidaCOD_DEPARTAMENTO.Text, QNotaSaidaNUM_NOTA.Text, QNotaSaidaCOD_CADASTRO.Text,
          QNotaSaidaCOD_NOTA_CAB.Text, '', trunc(QNotaSaidaDT_RECEBIMENTO.Value));
      if not (pTR) and not (pTRF) then
        DMOracle.DBCemapa.Commit;
      if DMNotaSaida.QNotaSaidaCod_Ordem_Carregamento_Cab.Text <> '' then
        with DMOracle do
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_ORDEM_CARREGAMENTO_CAB SET IND_SITUACAO=' + Chr(39) + 'B' + Chr(39);
          wComando := wComando + ',COD_NOTA_CAB=' + DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text + ' WHERE COD_ORDEM_CARREGAMENTO_CAB = ' + FloatToStr(DMNotaSaida.QNotaSaidaCod_Ordem_Carregamento_Cab.Value);
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;
          if DMOracle.DBCemapa.InTransaction then
            DMOracle.DBCemapa.Commit;
        end;
      //Chamada do procedimento que cadastra os pagamentos da nf-e 4.00
      PagamentosNFe4.GeraPagamentos('S');
      if (DMOperacao.QOperacaoInd_Cupom_Fiscal.Value = 'S') and (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> '65') then
      begin
        if FImpressoraFiscal = nil then
          FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
        FimpressoraFiscal.EmiteCF_Yanco(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
        if(DMOperacao.QOperacaoInd_Emite.Value = 'P') then
          FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
      end
      else
      begin
        wResult := DMOracle.BuscaNome('SELECT ID_LOTE FROM TB_NF_ELETRONICA','COD_NOTA_CAB = '+QNotaSaidaCod_Nota_Cab.Text);
        if wResult = '' then
          wLote := 0
        else
          wLote := StrToInt(wResult);
        if (DMOperacao.QOperacaoInd_Emite.Value <> 'N') then
        begin
          if (DMParamSistema.QParamSistemaIND_CONFIRMA_EMISSAO.Value = 'N') Or // não solicita uma confirmação para imprimir
            (DMOperacao.QOperacaoInd_Emite.Value = 'F') Then                  // Quando for nota fiscal nao solicita confirmação
            FNotaImpressao.EmiteNF(QNotaSaidaCod_Nota_Cab.Value,'', wLote,true)
          else
            if MessageDlg('Deseja emitir a NOTA/PEDIDO Nº ' + DMNotaSaida.QNotaSaidaNUM_NOTA.AsString + ' ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value,'', wLote,true);
        end;
        if ((DMParamSistema.QParamSistemaCod_Empresa.Value = 'INSIDE') or
            (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DISPART')) and
          (MessageDlg('Deseja emitir a PEDIDO ESTOQUE', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
          FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value,'ESTOQUE',wLote,true) // SERVE PARA IMPRIMIR SEGUNDO PEDIDO INSIDE
      end;
      if ((DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '2') and
         (DMOperacao.QOperacaoInd_Bloqueto.Value = 'S')) or (cbEnviaEmail.Checked) then
      begin
        wLibera_Bloqueto := DMOracle.BuscaNome('SELECT IND_LIBERA_BLOQUETO FROM TB_CADASTRO',
          'COD_CADASTRO = ' + IntToStr(DMNotaSaida.QNotaSaidaCod_Cadastro.Value)); //somente emite bloqueto se estiver liberado no cadastro de clientes
        // QRBloqueto.Open;
        if (wLibera_Bloqueto = 'SIM') and (Trim(MeContaCorrente.Text) <> '') then
        begin
           // Verifica se usa API do banco para geração do boleto. Se sim, não imprime mas gera
          // os dados para envio da API.
          QBoletoAPINota.Close;
          QBoletoAPINota.SetVariable('COD_NOTA_CAB', QNotaSaidaCOD_NOTA_CAB.Value);
          QBoletoAPINota.Open;
          if (QBoletoAPINotaIND_API_BOLETO.Text <> 'SIM') then  // Se não usar api, segue fluxo antigo
          begin
            if cbEnviaEmail.Checked  then // solicitado envio do boleto somente por e-mail
              if (MessageDlg('Deseja enviar o(s) boleto(s) por e-mail?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
              begin
                with DMContasReceber do
                begin
                  QRBloqueto.Close;
                  QRBloqueto.SetVariable('COD_NOTA_CAB_INICIAL', DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text);
                  QRBloqueto.SetVariable('COD_NOTA_CAB_FINAL', DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text);
                  QRBloqueto.SetVariable('COD_CONTA_CORRENTE', Trim(MeContaCorrente.Text));
                  QRBloqueto.SetVariable('NUMERO_TITULOS', '1 = 1');
                  Chama_Emissao_Bloqueto(1); //pDefineEmissaoBoleto: pImprime = 0, pEnviaEmail = 1, pImprimeEnviaEmail = 2
                end;
              end;
              // sempre vai solicitar a impressão dos boletos - mesmo quando for enviado por e_mail
              if (MessageDlg('Deseja imprimir o(s) boleto(s)?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
              begin
                with DMContasReceber do
                begin
                  QRBloqueto.Close;
                  QRBloqueto.SetVariable('COD_NOTA_CAB_INICIAL', DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text);
                  QRBloqueto.SetVariable('COD_NOTA_CAB_FINAL', DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text);
                  QRBloqueto.SetVariable('COD_CONTA_CORRENTE', Trim(MeContaCorrente.Text));
                  QRBloqueto.SetVariable('NUMERO_TITULOS', '1 = 1');
                  Chama_Emissao_Bloqueto(0); //pDefineEmissaoBoleto: pImprime = 0, pEnviaEmail = 1, pImprimeEnviaEmail = 2
                end;
              end;
          end
          else   // Se usar API segue o fluxo novo. A validação do envio por e-mail está em BoletoAPI
          begin
            with DMContasReceber do
            begin
              QRBloqueto.Close;
              QRBloqueto.SetVariable('COD_NOTA_CAB_INICIAL', DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text);
              QRBloqueto.SetVariable('COD_NOTA_CAB_FINAL', DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text);
              QRBloqueto.SetVariable('COD_CONTA_CORRENTE', Trim(MeContaCorrente.Text));
              QRBloqueto.SetVariable('NUMERO_TITULOS', '1 = 1');
              Chama_Emissao_Bloqueto_API;
              with DMOracle do
              begin
                DMOracle.QExecSQL.Close;
                DMOracle.QExecSQL.SQL.Clear;
                wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET IND_WEB_API = ' + QuotedStr('S');
                wComando := wComando + ' WHERE COD_NOTA_CAB = ' + FloatToStr(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
                DMOracle.QExecSQL.SQL.Add(wComando);
                DMOracle.QExecSQL.ExecSQL;
              end;
            end;
          end
        end;
      end;
      if DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'AB' then
      begin
        if DMNotaSaida.QNotaSaidaDt_Recebimento.Text = '' then
        begin
          with DMOracle do
          begin
            QExecSQL.Close;
            QExecSQL.SQL.Clear;
            wComando := 'UPDATE TB_NOTA_CAB SET DT_RECEBIMENTO = DT_EMISSAO';
            wComando := wComando + ' WHERE COD_NOTA_CAB = ' + FloatToStr(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
            QExecSQL.SQL.Add(wComando);
            QExecSQL.ExecSQL;
            if DMOracle.DBCemapa.InTransaction then
              DMOracle.DBCemapa.Commit;
          end;
        end;
      end;
      if (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value <> '1') and
        ((DMOperacao.QOperacaoInd_Duplicata.Value = 'S') or
        (DMOperacao.QOperacaoInd_Promissoria.Value = 'S')) and
        not NotaAutomaticaFlag.pNotaAutomatica then
      begin
        with DMContasReceber do
        begin
          QRContasReceber_Duplicatas.Close;
          QRContasReceber_Duplicatas.SetVariable('COD_NOTA_CAB', DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
          QRContasReceber_Duplicatas.SetVariable('COD_FILIAL', DMNotaSaida.QNotaSaidaCod_Filial.Value);
          QRContasReceber_Duplicatas.SetVariable('COD_DEPARTAMENTO', Null);
          QRContasReceber_Duplicatas.SetVariable('COD_CONTA_RECEBER_CAB', Null);
          QRContasReceber_Duplicatas.Open;
        end;
        if DMOperacao.QOperacaoInd_Duplicata.Value = 'S' then
          if MessageDlg('Emitir Duplicata?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            if FRContasReceberDuplicatas_MEDIBENS = nil then
              FRContasReceberDuplicatas_MEDIBENS := TFRContasReceberDuplicatas_MEDIBENS.Create(Application);
            setLength(x, 9); //8 sql diferentes
            setLength(y, 9);
            x[0] := 'SELECT DESC_FILIAL FROM TB_FILIAL WHERE COD_FILIAL= ' + DMNotaSaida.QNotaSaidaCod_Filial.Text;
            x[1] := 'SELECT DESC_ENDERECO FROM TB_FILIAL WHERE COD_FILIAL= ' + DMNotaSaida.QNotaSaidaCod_Filial.Text;
            x[2] := 'SELECT DESC_CIDADE FROM TB_FILIAL WHERE COD_FILIAL= ' + DMNotaSaida.QNotaSaidaCod_Filial.Text;
            x[3] := 'SELECT NUM_CGC FROM TB_FILIAL WHERE COD_FILIAL= ' + DMNotaSaida.QNotaSaidaCod_Filial.Text;
            x[4] := 'SELECT DESC_INSCRICAO FROM TB_FILIAL WHERE COD_FILIAL= ' + DMNotaSaida.QNotaSaidaCod_Filial.Text;
            x[5] := 'SELECT COD_ESTADO FROM TB_FILIAL WHERE COD_FILIAL= ' + DMNotaSaida.QNotaSaidaCod_Filial.Text;
            x[6] := 'SELECT DESC_CEP FROM TB_FILIAL WHERE COD_FILIAL= ' + DMNotaSaida.QNotaSaidaCod_Filial.Text;
            x[7] := 'SELECT DESC_TELEFONE FROM TB_FILIAL WHERE COD_FILIAL= ' + DMNotaSaida.QNotaSaidaCod_Filial.Text;
            x[8] := 'SELECT DESC_E_MAIL FROM TB_FILIAL WHERE COD_FILIAL= ' + DMNotaSaida.QNotaSaidaCod_Filial.Text;
            DMOracle.BuscaNomes(x, y);
            FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa.caption := Y[0];
            FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa2.caption := Y[0];
            FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa3.caption := Y[0];
            FRContasReceberDuplicatas_MEDIBENS.QRLEndereco.caption := Y[1];
            FRContasReceberDuplicatas_MEDIBENS.QRLCidade.caption := Y[2];
            FRContasReceberDuplicatas_MEDIBENS.QRLPracaPgto.Caption := Y[2];
            FRContasReceberDuplicatas_MEDIBENS.QRLPracaPgto.Enabled := True;
            FRContasReceberDuplicatas_MEDIBENS.QRLCGC.caption := Y[3];
            FRContasReceberDuplicatas_MEDIBENS.QRLInscricao.caption := Y[4];
            FRContasReceberDuplicatas_MEDIBENS.QRLEstado.caption := Y[5];
            FRContasReceberDuplicatas_MEDIBENS.QRLCEP.caption := Y[6];
            FRContasReceberDuplicatas_MEDIBENS.QRLfone.caption := Y[7];
            FRContasReceberDuplicatas_MEDIBENS.QRLE_mail.caption := Y[8];

            //COMENTADO ESTAS LINHAS PELO MOTIVO DE TER RETIRADO O SUBDTAIL DO RELATORIO
            //MOTIVO: IMPRIMIR 2 VIAS DA DUPLICATA
            {FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa5.caption := Y[0];
            FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa4.caption := Y[0];
            FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa6.caption := Y[0];
            FRContasReceberDuplicatas_MEDIBENS.QRLEndereco1.caption := Y[1];
            FRContasReceberDuplicatas_MEDIBENS.QRLCidade1.caption := Y[2];
            FRContasReceberDuplicatas_MEDIBENS.QRLCGC1.caption := Y[3];
            FRContasReceberDuplicatas_MEDIBENS.QRLInscricao1.caption := Y[4];
            FRContasReceberDuplicatas_MEDIBENS.QRLEstado1.caption := Y[5];
            FRContasReceberDuplicatas_MEDIBENS.QRLCEP1.caption := Y[6];
            FRContasReceberDuplicatas_MEDIBENS.QRLfone1.caption := Y[7];
            FRContasReceberDuplicatas_MEDIBENS.QRLE_mail1.caption := Y[8]; }
            if (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'MOINHO') or
              (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'GRASEL') then
            begin
              FRContasReceberDuplicatas_MEDIBENS.QRLDt_Aceite.Caption := '';
             // FRContasReceberDuplicatas_MEDIBENS.QRLDt_Aceite1.Caption := '';
            end
            else
            begin
              FRContasReceberDuplicatas_MEDIBENS.QRLDt_Aceite.Caption := DateToStr(Date);
             // FRContasReceberDuplicatas_MEDIBENS.QRLDt_Aceite1.Caption := DateToStr(Date);
            end;
            //comentando pelo motivo de ser reitirado o subdetail do relatório.
            if (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'PIXIXE') then
              FRContasReceberDuplicatas_MEDIBENS.QRPrimario.Preview
            else
              FRContasReceberDuplicatas_MEDIBENS.QRCompositeReport1.Preview;
          end;
        if DMOperacao.QOperacaoIND_PROMISSORIA.Value = 'S' then
          if MessageDlg('Emitir Nota Promissória?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            if DMParamSistema.QParamSistemaIND_IMPRESSAO_PROMISSORIA.Value = 'M' then
              FPromissoria.Promissoria_Dos
            else
            begin
              if FRPromissorias = nil then
                 FRPromissorias := TFRPromissorias.Create(Application);
              FRPromissorias.QRPrimario.Preview;
            end;
          end;
      end;
      If (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '1')     Or
         (DMNotaSaida.QNotaSaidaVAL_AVISTA.Value >= 0.01) or
         ((DMParamSistema.CodEmpresa = 'RADIO') AND
         ((QNotaSaidaIND_CONDICAO_PAGTO.Value = '4') OR (QNotaSaidaIND_CONDICAO_PAGTO.Value = '5')))    Then
         If (DMOperacao.QOperacaoIND_EMITE_RECIBO_ENTRADA.Value = 'S') Then
            if MessageDlg('Deseja emitir recibo do valor de entrada?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              // Se a Operaçao emite Pedido 40 Colunas, o recibo deve ser
              // emitido em 40 Colunas - Djeison A. Selzlein - 19/08/2013
              if ((DMOperacao.QOperacaoIND_EMITE.Value = 'R') or ((DMOperacao.QOperacaoIND_EMITE.Value = 'P') and
                  (DMParamSistema.CodEmpresa = 'RADIO')))then
                EmiteReciboEntrada40Col
              else
                EmiteReciboEntrada;
      //Solicitacao: Nutrivet (SIMONI)
      //para nutrivet estava gerando as parcelas do cts receber com a condicao de pgto cartao de credito.
      if (QNotaSaidaIND_CONDICAO_PAGTO.Value = '4') or
         (QNotaSaidaIND_CONDICAO_PAGTO.Value = '5') then
      begin
        //if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'NUTRIVET') then
        //  wAVista := 'A CARTAO'
        //else
        //begin
          if (QNotaSaidaIND_CONDICAO_PAGTO.Value = '4') then
            wAVista := 'CARTAO CREDITO'
          else
            wAVista := 'CARTAO DEBITO';
        //end;
        //if QNotaSaidaObs.Text <> '' then // somente para lancar a obs no caixa
        //  wAVista := QNotaSaidaObs.Text;
        QSomaItemNota.close;
        QSomaItemNota.Open;
        if (QSomaItemNotasval_total_nota.Value -
           pValorValeCompras - pValorValePresente -
           QSomaItemNotaSVAL_CHEQUE_CAIXA.Value > 0) and (QNotaSaidaCOD_SERIE_MODELO.Value <> '65') then
          AtuCaixa(QSomaItemNotaSVal_Total_Nota.Value - QNotaSaidaVal_AVista.Value -
            DMNotaSaida.pValorValeCompras - pValorValePresente - QSomaItemNotaSVAL_CHEQUE_CAIXA.Value,
            wAVista, QNotaSaidaCod_Operacao.Text,
            QNotaSaidaCod_Filial.Text, QNotaSaidaCod_Departamento.Text, QNotaSaidaNum_Nota.Text,
            QNotaSaidaCod_Cadastro.Text, QNotaSaidaCod_Nota_Cab.Text,
            '', Trunc(QNotaSaidaDt_Recebimento.Value));
      end;

      //Para inserir pagamentos do PAF-ECF
      if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
      begin
        QSomaItemNota.Close;
        QSomaItemNota.SetVariable('COD_NOTA_CAB',QNotaSaidaCOD_NOTA_CAB.Value);
        QSomaItemNota.Open;
        if (QNotaSaidaIND_TIPO_PAGAMENTO.Value = 'CARTÃO') or
          (QNotaSaidaIND_TIPO_PAGAMENTO.Value = 'OUTROS') or
          (QNotaSaidaIND_TIPO_PAGAMENTO.Value = 'A VISTA') then
          wTipoPagamento := 'DINHEIRO'
        else if (QNotaSaidaIND_TIPO_PAGAMENTO.Value = 'PIX') then
          wTipoPagamento := 'PIX'
        else
          wTipoPagamento := QNotaSaidaIND_TIPO_PAGAMENTO.Value;
        FImpressoraFiscal.AdicionaPagamento(wTipoPagamento,
          QSomaItemNotasval_total_nota.Value,QNotaSaidaCOD_NOTA_CAB.Value);
        QSomaItemNota.Close;
      end;
      AtivaPagina('CONFIRMA');
    except
      AtivaPagina('ERRO');
      raise;
    end;
  end;
  FNotaImpressao.Free;
end;

procedure TFNotaSaida_Confirma.MEDiasCPExit(Sender: TObject);
begin
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'KREUZ' Then
     If Trim(MeDiasCp.Text) <> '' Then
        If StrToInt(Trim(MeDiasCp.Text)) = 10 Then
           MeFinalidade.Text := '100';
  if Trim(MEDiasCP.Text) <> '' then
  begin
    if DMParamSistema.CodEmpresa = 'TOMATESMI' then
      MEDataCP.Text := DateToStr(DMNotaSaida.QNotaSaidaDT_RECEBIMENTO.Value + StrToFloat(MEDiasCP.Text))
    else
      MEDataCP.Text := DateToStr(DMNotaSaida.QNotaSaidaDt_Emissao.Value + StrToFloat(MEDiasCP.Text));
    MEDiasCP.Text := '';
  end;
end;

procedure TFNotaSaida_Confirma.AtivaPagina(pNomePagina: string);
begin
  if PCConfirma.ActivePage <> nil then
    PCConfirma.ActivePage.TabVisible := False;
  if pNomePagina = 'CONTA_CORRENTE' then
    PCConfirma.Pages[0].TabVisible := True // Conta Corrente
  else
    if pNomePagina = 'CONTA_RECEBER' then
    begin
      PCConfirma.Pages[1].TabVisible := True; // Contas a Receber
      if MeValorCp.Text <> '' then
        MeValorCpExit(Self);
    end
    else
      if pNomePagina = 'FUTURA' then
        PCConfirma.Pages[2].TabVisible := True // Futura
      else
        if pNomePagina = 'CONFIRMA' then
        begin
          PCConfirma.Pages[3].TabVisible := True; // Confirmação
          BtCancelar.Enabled := False;
        end
        else
          if pNomePagina = 'ERRO' then
          begin
            BtAvancar.Enabled := False;
            PCConfirma.Pages[4].TabVisible := True // Erro
          end
          else
            raise Exception.Create('Página Inválida!');
end;

procedure TFNotaSaida_Confirma.MEDepartamentoExit(Sender: TObject);
begin
  if Trim(MEDepartamento.Text) <> '' then
    EdDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO', 'COD_DEPARTAMENTO = ' + MEDepartamento.Text)
  else
    EdDepartamento.Text := '';
end;

procedure TFNotaSaida_Confirma.BtConsDepartamentoClick(Sender: TObject);
begin
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.showModal = mrOk then
  begin
    MEDepartamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    MEDepartamentoExit(Self);
  end;

end;

procedure TFNotaSaida_Confirma.MEDepContaPagarExit(Sender: TObject);
begin
  if Trim(MEDepContaPagar.Text) <> '' then
    EdDepContaPagar.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO', 'COD_DEPARTAMENTO = ' + MEDepContaPagar.Text)
  else
    EdDepContaPagar.Text := '';
end;

procedure TFNotaSaida_Confirma.BtConsDepContaPagarClick(Sender: TObject);
begin
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.showModal = mrOk then
  begin
    MEDepContaPagar.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    MEDepContaPagarExit(Self);
  end;
end;

procedure TFNotaSaida_Confirma.BtConsBancoClick(Sender: TObject);
begin
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.showModal = mrOk then
  begin
    MeBanco.Text := DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Text;
    MeContaCorrente.Text := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Text;
    MeContaCorrenteExit(Self);
  end;
end;

procedure TFNotaSaida_Confirma.BtPrazoClick(Sender: TObject);
begin
  if FPrazoVencimentoCons = nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  if FPrazoVencimentoCons.showModal = mrOk then
  begin
    MePrazo.Text := DMPrazoVencimento.QPrazoVencimento_ConsCod_Prazo_Vencimento.Text;
    MePrazoExit(Self);
  end;
end;

procedure TFNotaSaida_Confirma.MePrazoExit(Sender: TObject);
begin
  if Trim(MePrazo.Text) <> '' then
  begin
    if DMOracle.FastSelect('IND_SITUACAO','TB_PRAZO_VENCIMENTO','COD_PRAZO_VENCIMENTO = ' + MePrazo.Text) <> 'ATIVO' then
    begin
      MePrazo.Text := '';
      raise Exception.Create('O Prazo de Vencimento Selecionado Precisa estar "ATIVO".');
    end;
    If DMParamSistema.CodEmpresa = 'KREUZ' Then
        If StrToInt(Trim(MePrazo.Text)) = 10 Then
           MeFinalidade.Text := '100';
    If DMParamSistema.CodEmpresa = 'CONKRETA' Then
        If StrToInt(Trim(MePrazo.Text)) = 20 Then
           MeFinalidade.Text := '100';
    if DMParamSistema.CodEmpresa = 'POLLYANA' then
      wCodPrazoPgto := trim(MePrazo.Text);
    geraParcelas;
    MEDiasCP.SetFocus;
    if DMParamSistema.CodEmpresa <> 'DEBONA' then
      BtAvancarClick(Self);
  end;
end;

Function retornaSegundaCasaDecimal(valor:Double) : Double;
Var
  wDecimal: Double;
Begin
  wDecimal := Frac(valor);
  wDecimal := StrToFloat(copy(FormatFloat('###0.00', wDecimal), 4,1));

  Result := (wDecimal*0.01);
End;

procedure TFNotaSaida_Confirma.geraParcelas;
var wLinha, wAux, wParc: string;
    wParcela, wDiferenca, wCentavoFinal, wSomaCentavos, wSoma: Real;
    wCont : Integer;
    wComissao: Extended;
    X, Y : Array of String;
    wDtVencto : TDateTime;
    const wBranco: string = '                            ';
begin
  SetPercAntecipacao(0);
  if Trim(MePrazo.Text) <> '' then
  begin

    setLength(x, 4); //4 sql diferentes
    setLength(y, 4);

    x[0] := 'SELECT NUM_PARCELAS FROM TB_PRAZO_VENCIMENTO WHERE COD_PRAZO_VENCIMENTO = ' + Trim(MePrazo.Text);
    x[1] := 'SELECT VAL_MINIMO_VENDA FROM TB_PRAZO_VENCIMENTO WHERE COD_PRAZO_VENCIMENTO = ' + Trim(MePrazo.Text);
    x[2] := 'SELECT IND_SUBST_PRIMEIRA_PARC FROM TB_PRAZO_VENCIMENTO WHERE COD_PRAZO_VENCIMENTO = ' + Trim(MePrazo.Text);
    x[3] := 'SELECT PERC_DESC_ADIANTAMENTO FROM TB_PRAZO_VENCIMENTO WHERE COD_PRAZO_VENCIMENTO = ' + Trim(MePrazo.Text);

    DMOracle.BuscaNomes(x, y);


    wParc := y[0];
    if y[3] <> '' then
      SetPercAntecipacao(StrToFloat(y[3]));
    
    if wParc = '' then
       raise Exception.Create('Código de parcelas inexistente');
    wAux := y[1];
    if StrToFloat(wAux) <> 0 then
      if (StrToFloat(StringReplace(EdTotalNF.Text,'.','',[rfReplaceAll]))) < StrToFloat(wAux) then
      begin
        MePrazo.SetFocus;
        raise Exception.Create('Valor da nota menor que mínimo exigido para este prazo');
      end;
    DMPrazoVencimento.QPrazoVencimentoDias.Close;
    DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('COD_PRAZO_VENCIMENTO', Trim(MePrazo.Text));
    DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('NUM_DIAS', Null);
    DMPrazoVencimento.QPrazoVencimentoDias.Open;
    LBContaReceber.Items.Clear;
    if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEBONA') and (not DMNotaSaida.QNotaSaidaCOD_VENDEDOR.IsNull)) then //and (not DMNotaSaida.QNotaSaidaNUM_PEDIDO.IsNull)) then
    begin
      wComissao := StrToFloat(Bib.LimpaNumero(EComissao.Text, True)); //StrToFloat(DMOracle.FastSelect('VAL_COMISSAO', 'TB_PEDIDO_CAB', 'NUM_PEDIDO = ' + DMNotaSaida.QNotaSaidaNUM_PEDIDO.Text + ' AND COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCOD_FILIAL.Text));
      if wParc = '1' then
        wParcela := Trunc(StrToFloat(StringReplace(EdTotalNF.Text,'.','',[rfReplaceAll])) / StrToFloat(wParc) * 100) / 100
      else
        wParcela := Trunc((StrToFloat(StringReplace(EdTotalNF.Text,'.','',[rfReplaceAll])) - wComissao) / (StrToFloat(wParc) - 1) * 100) / 100;
      wCont := 0;
      wSoma := 0;
      wSomaCentavos := 0;
      while not (DMPrazoVencimento.QPrazoVencimentoDias.Eof) do
      begin
        if ((wParc <> '1') and (DMPrazoVencimento.QPrazoVencimentoDias.RecNo = 1)) then
        begin
          wLinha := DateToStr(Date + DMPrazoVencimento.QPrazoVencimentoDiasNUM_DIAS.Value);
          wAux := FormatFloat('###,###,##0.00', wComissao);
          EDataComissao.Text := FormatDateTime('dd/mm/yyyy', Date + DMPrazoVencimento.QPrazoVencimentoDiasNUM_DIAS.Value);
          Inc(wCont);
          wSoma := wSoma + wComissao;
        end
        else
        begin
          if DMPrazoVencimento.QPrazoVencimentoDias.RecNo = 1 then
            EDataComissao.Text := FormatDateTime('dd/mm/yyyy', Date + DMPrazoVencimento.QPrazoVencimentoDiasNUM_DIAS.Value);
          Inc(wCont);
          wSoma := wSoma + wParcela;
{       if wCont = StrToInt(wParc) then
          begin
            wDiferenca := StrToFloat(EdTotalNF.Text) - DMNotaSaida.pValorValeCompras - DMNotaSaida.pValorValePresente - wSoma;
            wParcela := wParcela + wDiferenca;
          end;  }
          wLinha := DateToStr(Date + DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value);
          wAux := FormatFloat('###,###,##0.00', wParcela);
        end;
        wAux := Copy(wBranco, 1, 15 - Length(waux)) + wAux;
        wLinha := wLinha + wAux;
        LBContaReceber.Items.Add(wLinha);
        DMPrazoVencimento.QPrazoVencimentoDias.Next;
      end;
    end
    else
    begin
//
//  Código a seguir editado 01/08/2017 por Giancarlo Visentin
//  Alterado para jogar ST, diferença e centavos para primeira parcela
//
      if Y[2] = 'SIM' then  // VALOR DA SUBSTITUICAO NA PRIMEIRA PARCELA
        wParcela := Trunc((StrToFloat(StringReplace(EdTotalNF.Text,'.','',[rfReplaceAll])) - DMNotaSaida.QSomaItemNotaSVAL_ICMS_SUBST.Value) / StrToFloat(wParc) * 100) / 100
      else
        wParcela := Trunc(StrToFloat(StringReplace(EdTotalNF.Text,'.','',[rfReplaceAll])) / StrToFloat(wParc) * 100) / 100;

      wCont := 0;
      wSoma := 0;
      wCentavoFinal := wParcela - Trunc(wParcela*10)/10;//retornaSegundaCasaDecimal(wParcela);
      wSomaCentavos := StrToInt(wParc) * wCentavoFinal;

      while not (DMPrazoVencimento.QPrazoVencimentoDias.Eof) do
      begin
        Inc(wCont);

        if ((Y[2] = 'SIM') and (wCont = 1)) then
        begin
          wDiferenca := StrToFloat(StringReplace(EdTotalNF.Text,'.','',[rfReplaceAll])) - (wParcela*StrToInt(wParc)) - DMNotaSaida.QSomaItemNotaSVAL_ICMS_SUBST.Value
        end
        else if wCont = 1 then
        begin
          wDiferenca := StrToFloat(StringReplace(EdTotalNF.Text,'.','',[rfReplaceAll])) - (wParcela*StrToInt(wParc));
        end;

          // Alterado para contar vencimento a partir da data de saida da nota - Djeison A. S. 08/11/2013
         // alterado pelo César para considerar carencia na primeira e demais parcelas - quando tem carencia não gera ultima parcela pelo Prazo e sim pela carencia
        If (wCont = 1) And (DMNotaSaida.QNotaSaidaNum_Dias_Carencia.Value <> 0) Then
         Begin
           wLinha := DateToStr( DMNotaSaida.QNotaSaidaDt_Recebimento.Value + DMNotaSaida.QNotaSaidaNum_Dias_Carencia.Value);
           wDtVencto := DMNotaSaida.QNotaSaidaDt_Recebimento.Value + DMNotaSaida.QNotaSaidaNum_Dias_Carencia.Value; // Radiolandia que os vencimento no mesmo dia - César 23/02/2021
         End
        Else
         Begin
           wLinha := DateToStr(DMNotaSaida.QNotaSaidaDT_RECEBIMENTO.Value + DMPrazoVencimento.QPrazoVencimentoDiasNUM_DIAS.Value + DMNotaSaida.QNotaSaidaNum_Dias_Carencia.Value);
           If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RADIO' Then
              If wCont <> 1 Then // isso porque se dias de carencia for igual a zero
               Begin
                 wDtVencto := IncMonth(wDtVencto, 1);  // data de vencimento sempre no mesmo dia da primeira parcela - muda o mes - Cesar 23/02/2021  a pedido Marcos Radiolandia
                 wLinha := DateToStr(wDtVencto);
               End
              Else
                 wDtVencto := DMNotaSaida.QNotaSaidaDt_Recebimento.Value + DMPrazoVencimento.QPrazoVencimentoDiasNUM_DIAS.Value; // Radiolandia que os vencimento no mesmo dia - César 23/02/2021
           DMPrazoVencimento.QPrazoVencimentoDias.Next;
         End;
        if ((Y[2] = 'SIM') and (wCont = 1)) then
          wAux := FormatFloat('###,###,##0.00', wParcela + wDiferenca + (wSomaCentavos - wCentavoFinal) + DMNotaSaida.QSomaItemNotaSVAL_ICMS_SUBST.Value)
        else if wCont = 1 then
          wAux := FormatFloat('###,###,##0.00', wParcela + wDiferenca + (wSomaCentavos - wCentavoFinal))
        else
          wAux := FormatFloat('###,###,##0.00', wParcela - wCentavoFinal);
        wAux := Copy(wBranco, 1, 15 - Length(waux)) + wAux;
        wLinha := wLinha + wAux;
        LBContaReceber.Items.Add(wLinha);
        If wCont = StrToInt(wParc) Then  // Para gerar uma parcela pela carencia
           Exit;
      end;
    end;
    MEDataCP.Text := '';
    MEValorCP.Text := '';
    MePrazo.Text := '';
  end;
end;

procedure TFNotaSaida_Confirma.BitBtn1Click(Sender: TObject);
var wQtde, wQtBaixar, wEmbalagem: Real;
begin
  with DMNotaSaida do
  begin
//    If DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MFARINHA' Then  - retirado pelo cesar a pedido da Carla 06/07/2016
       wQtde := QItemNFQt_Quantidade.Value;
{    Else
      Begin
        wEmbalagem := StrToFloat(DMOracle.BuscaNome('SELECT Num_Peso_Liquido FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCod_Produto.Value)));
        wQtde := QItemNFQt_Quantidade.Value * wEmbalagem;
      End;
}    while not QNFAuxAberto.Eof do
    begin
      try
        if wQtde > QNFAuxAbertoQt_Saldo.Value then
        begin
          wQtBaixar := QNFAuxAbertoQt_Saldo.Value;
          wQtde := wQtde - QNFAuxAbertoQt_Saldo.Value;
        end
        else
        begin
          wQtBaixar := wQtde;
          wQtde := 0;
        end;
        QBaixaAux.Insert;
        QBaixaAuxCod_Nota_Item.Value := QItemNFCod_Nota_Item.Value;
        QBaixaAuxCod_Nota_Aux.Value := QNFAuxAbertoCod_Nota_Aux.Value;
        QBaixaAuxQt_Quantidade.Value := wQtBaixar;
        QBaixaAux.Post;
        QNFAuxAberto.Close;
        QNFAuxAberto.Open;
        if wQtde = 0 then
          Exit;
      except
        if QBaixaAux.State in [dsEdit, dsInsert] then
          QBaixaAux.Cancel;
        raise;
      end;
    end;
    QBaixaAux.Close;
    QNFAuxAberto.Close;
  end;
end;

procedure TFNotaSaida_Confirma.MeContaCorrenteExit(Sender: TObject);
begin
  if Trim(MeContaCorrente.Text) <> '' then
  begin
    MeBanco.Text := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + Trim(MeContaCorrente.Text));
    if Trim(MeBanco.Text) = '' then
      raise Exception.Create('Conta Corrente Não Cadastrada');
    EdBanco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA', 'COD_BANCO_AGENCIA = ' + MEBanco.Text);
  end
  else
    EdBanco.Text := '';
  cbEnviaEmail.Enabled := (Trim(DMCadastro.QCadastroDESC_E_MAIL1.Value) <> '')
        and (DMCadastro.QCadastroIND_LIBERA_BLOQUETO.Value = 'SIM')
        and (Trim(MeContaCorrente.Text) <> '');
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ' Then
    if (DMNotaSaida.QNotaSaidaCOD_FILIAL.Value = 2) And
       (Trim(MeContaCorrente.Text) <> '4') Then
     Begin
       Raise exception.Create('Informado Conta Corrente Errado');
       MeContaCorrente.SetFocus;
     end;

  if cbEnviaEmail.Enabled then
   Begin
     if cbEnviaEmail.CanFocus then
      cbEnviaEmail.SetFocus;
      If (DMParamSistema.CodEmpresa = 'DINIZ') or (DMParamSistema.CodEmpresa = 'SCALA') Then
          cbEnviaEmail.Checked := True;
   End;
end;

procedure TFNotaSaida_Confirma.BtInsertContaCorrenteClick(Sender: TObject);
var wLinha, wAux: string;
const wBranco: string = '                            ';
begin
  if StrToDate(MeDtCheque.Text) < Date then
    raise Exception.Create('Data do Cheque Menor que Data Atual!');
  wLinha := FormatMaskText('CCCCCC', Trim(MeContaCorrente_Cheque.Text)) + ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCC', Trim(MeDepartamento_Cheque.Text)) + ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCC', Trim(MeHistorico.Text)) + ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCC', Trim(MeNrCheque.Text)) + ' - ';
  wAux := FormatFloat('###,###,##0.00', StrToFloat(MeValorCheque.Text)) + ' - ';
  wAux := Copy(wBranco, 1, 15 - Length(waux)) + wAux;
  wLinha := wLinha + wAux;
  wLinha := wLinha + DateToStr(StrToDate(MeDtCheque.Text)) + ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC', MeObservacao.Text) + ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC', MeObservacao1.Text);
  LbCheques.Items.Add(wLinha);
end;

procedure TFNotaSaida_Confirma.BtExcluiContaCorrenteClick(Sender: TObject);
begin
  LBCheques.Items.Delete(LBCheques.ItemIndex);
end;

procedure TFNotaSaida_Confirma.BtConsContaCorrenteClick(Sender: TObject);
begin
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.showModal = mrOk then
    MeContaCorrente_Cheque.Text := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Text;
end;

procedure TFNotaSaida_Confirma.BtDepartamentoClick(Sender: TObject);
begin
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.showModal = mrOk then
    MEDepartamento_Cheque.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
end;

procedure TFNotaSaida_Confirma.BtConsHistoricoClick(Sender: TObject);
begin
  if FHistoricoCons = nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.showModal = mrOk then
    MEHistorico.Text := DMHistorico.QHistoricoConsCod_Historico.Text;
end;

procedure TFNotaSaida_Confirma.emiteReciboEntrada;
var
  wCod_caixa_mov, wNum_documento:string;
  wBuscador: TBuscador;
  wNumero : Integer;
  wValMovimento: Real;
begin
  wBuscador := TBuscador.Create;
  wBuscador.Limpa;
  wCod_caixa_mov := dmoracle.FastSelect('COD_CAIXA_MOV', 'TB_CAIXA_MOV', 'COD_NOTA_CAB = ' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.AsString);

  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK', DMNotaSaida.QNotaSaidaCOD_FILIAL.AsString);
    QFilial.Open;
  end;
  
  //wBuscador.Adiciona('DESC_FILIAL', 'TB_FILIAL', 'COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCOD_FILIAL.AsString);
  wBuscador.Adiciona('NOME', 'TB_CADASTRO', 'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.AsString);
  wBuscador.Adiciona('NUM_DOCUMENTO', 'TB_CAIXA_MOV', 'COD_CAIXA_MOV = ' + wCod_caixa_mov);
  wBuscador.Adiciona('VAL_MOVIMENTO', 'TB_CAIXA_MOV', 'COD_CAIXA_MOV = ' + wCod_caixa_mov);
  wBuscador.Adiciona('DT_MOVIMENTO', 'TB_CAIXA_MOV', 'COD_CAIXA_MOV = ' + wCod_caixa_mov);
  wBuscador.Buscar;

  if FRReciboCaixa = nil then
    FRReciboCaixa := TFRReciboCaixa.Create(Application);

  FRReciboCaixa.QRLResponsavel.Caption := DMFilial.QFilialDESC_FILIAL.Value;
  FRReciboCaixa.QRLRecibo.Caption := wBuscador.Proximo;
  wNumero := DMSequencia.Sequencia(DMNotaSaida.QNotaSaidaCOD_FILIAL.Value, 'RECIBO');
  FRReciboCaixa.QRLNumero.Caption := FloatToStr(wNumero);

  wNum_documento := wBuscador.Proximo;
  FRReciboCaixa.QRLNumDocumento.Caption := wNum_documento;
  wValMovimento := strtofloat(wBuscador.Proximo);
  FRReciboCaixa.QRLValor.Caption := FormatFloat('#,##0.00', wValMovimento);
  FRReciboCaixa.QRLComplemento.Caption := 'Entrada NF N. ' + wNum_documento;
  FRReciboCaixa.QRLValorExtenso.Caption := Bib.extenso(wValMovimento, 'REAL');
  FRReciboCaixa.QRLData.Caption := FormatDateTime(', dd "de" mmmm "de" yyyy', StrToDate(wBuscador.Proximo));

  FRReciboCaixa.QRLResponsavel1.Caption := FRReciboCaixa.QRLResponsavel.Caption;
  FRReciboCaixa.QRLRecibo1.Caption := FRReciboCaixa.QRLRecibo.Caption;
  FRReciboCaixa.QRLNumero1.Caption := FRReciboCaixa.QRLNumero.Caption;
  FRReciboCaixa.QRLNumDocumento1.Caption := FRReciboCaixa.QRLNumDocumento.Caption;
  FRReciboCaixa.QRLValor1.Caption := FRReciboCaixa.QRLValor.Caption;
  FRReciboCaixa.QRLComplemento1.Caption := FRReciboCaixa.QRLComplemento.Caption;
  FRReciboCaixa.QRLValorExtenso1.Caption := FRReciboCaixa.QRLValorExtenso.Caption;
  FRReciboCaixa.QRLData1.Caption := FRReciboCaixa.QRLData.Caption;
  FRReciboCaixa.QuickRep1.PreviewInitialState := wsMaximized;
  FRReciboCaixa.QuickRep1.Preview;
  wBuscador.Fecha;
end;

procedure TFNotaSaida_Confirma.EmiteReciboEntrada40Col;
var wEndereco, wCidade, wVal : string;
    wContador : integer;
begin
  // Impressão de Recibo - Matricial - Modificado por Djeison A. Selzlein - 17/08/2013
  if Imp = Nil Then
     Imp := TImp.Create;

  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RADIO' Then
  Begin
    wVal := 'LPT3'; 
    imp.AbreImpressora_Lpt3;
  end
  Else
  Begin
    wVal := DMOracle.BuscaNome('SELECT DESC_LPT_PEDIDO FROM TB_FILIAL','COD_FILIAL = '
      + DMNotaSaida.QNotaSaidaCOD_FILIAL.AsString);
    if wVal = 'LPT1' then
      imp.AbreImpressora;
    if wVal = 'LPT2' then
      imp.AbreImpressora_Lpt2;
    if wval = 'COM2' then
      imp.AbreImpressora_Com2;
  end;


  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',3);

  DMFilial.QFilial.close;
  DMFilial.QFilial.SetVariable('PK', DMNotaSaida.QNotaSaidaCOD_FILIAL.AsString);
  DMFilial.QFilial.open;

  wEndereco := DMOracle.BuscaNome('SELECT DESC_ENDERECO                    FROM TB_CADASTRO',
    'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
  wCidade   := DMOracle.BuscaNome('SELECT DESC_CIDADE || '' - '' || COD_ESTADO FROM TB_CADASTRO',
    'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);

  wContador := 7;
  Imp.WriteXY(0,wContador,Copy(DMFilial.QFilialDESC_FILIAL.Value,1,40));
  Inc(wContador);
  Imp.WriteXY(0,wContador,Copy(DMFilial.QFilialDESC_ENDERECO.Value,1,40));
  Inc(wContador);
  Imp.WriteXY(0,wContador,Copy(DMFilial.QFilialDESC_TELEFONE.Value,1,40));
  Inc(wContador);

  With DMNotaSaida do
  begin
    QSomaItemNota.Close;
    QSomaItemNota.SetVariable('COD_NOTA_CAB',QNotaSaidaCOD_NOTA_CAB.Value);
    QSomaItemNota.Open;
    Imp.WriteXY(0,wContador,'RECIBO DE VENDA');
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    Inc(wContador);
    Imp.WriteXY(0,wContador,DateToStr(DMOracle.DataServ) + '            N. Nota.:  ' + QNotaSaidaNUM_NOTA.AsString);
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    Inc(wContador);
    Imp.WriteXY(0,wContador,'CLI.:' + copy(DMCadastro.QCadastroNOME.Value, 1, 35));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'END.:' + copy(wEndereco,1,35));
    Inc(wContador);
    Imp.WriteXY(0,wContador,copy(wCidade,1,40));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Num. Nota..: ' + Bib.NumToTexto(QNotaSaidaNUM_NOTA.Value,0,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Dt. Emissao: ' + DateToStr(QNotaSaidaDT_EMISSAO.Value));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Val. Prod..: ' + Bib.NumToTexto(QSomaItemNotaSVAL_TOTAL.Value,2,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Desconto...: ' + Bib.NumToTexto(QSomaItemNotaSVAL_DESCONTO.Value,2,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Total......: ' + Bib.NumToTexto(QSomaItemNotasval_total_nota.Value,2,10));
    Inc(wContador);
    if(QNotaSaidaVAL_AVISTA.Value > 0.01) then
    begin
      Imp.WriteXY(0,wContador,'  Val.Pago...: ' + Bib.NumToTexto(QNotaSaidaVAL_AVISTA.Value,2,10));
      Inc(wContador);
      Imp.WriteXY(0,wContador,'  Val.a.Pagar: ' + Bib.NumToTexto(QSomaItemNotasval_total_nota.Value -
                                              QNotaSaidaVAL_AVISTA.Value,2,10));
      Inc(wContador);
    end;
    Imp.WriteXY(0,wContador,'----------------------------------------');
    wContador := wContador + 6;
    Imp.WriteXY(0,wContador,' ');
  end;

  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
end;

procedure TFNotaSaida_Confirma.Action1Execute(Sender: TObject);
begin
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal();
end;

function TFNotaSaida_Confirma.FormatarJson(const AJSON: String): String;
{$IfDef FPC}
var
  jpar: TJSONParser;
  j: TJsonObject;
{$EndIf}
begin
  Result := AJSON;
  {$IfDef FPC}
  try
    j := TJSONObject.Create();
    try
      Result := j.Decode(Result);
    finally
      j.Free;
    end;
    jpar := TJSONParser.Create(Result, [joUTF8]);
    try
      Result := jpar.Parse.FormatJSON([], 2);
    finally
      jpar.Free;
    end;
  except
    Result := AJSON;
  end;
  {$EndIf}
end;

procedure TFNotaSaida_Confirma.LimpaStatusPix(var StatusPix: TFluxoPagtoDados);
begin
  //Limpa a estrutura para retornar os dados novos ao reiniciar a cobrança
  with StatusPix do
  begin
    TxID := EmptyStr;
    E2E := EmptyStr;
    QRCode := EmptyStr;
    Total := 0;
    StatusCobranca := stcNENHUM;
    StatusDevolucao := stdNENHUM;
    EmErro := False;
    QtdConsultas := 0;
  end;
end;

procedure TFNotaSaida_Confirma.SetPercAntecipacao(Value: Double);
begin
  fPercAntecipacao := Value;
end;

end.

