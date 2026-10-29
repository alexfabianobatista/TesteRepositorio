unit UBancosMovCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, variants, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, DBPanel;
  //, VaClasses, VaComm;

type
  TFBancosMovCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBECodHistorico: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBENrCheque: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    BtHistorico: TSpeedButton;
    BtContaCorrente: TSpeedButton;
    BtCadastro: TSpeedButton;
    EmiteCheque1: TMenuItem;
    RelaodeChequesLanados1: TMenuItem;
    RelaodeChequesContaCorrente1: TMenuItem;
    SaldosBancos1: TMenuItem;
    ResumodeLanamentos1: TMenuItem;
    RelaodeMovimentosSaldos1: TMenuItem;
    ListadeChequesPredatados1: TMenuItem;
    EmiteCpiadeCheque1: TMenuItem;
    RelaodeChequesPrDatados1: TMenuItem;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    BtDepartamento: TSpeedButton;
    RelaodeHistrico1: TMenuItem;
    BtObservacao: TSpeedButton;
    Ed1Historico: TEdit;
    Label11: TLabel;
    EdHistorico: TEdit;
    Opes1: TMenuItem;
    CancelarCheque1: TMenuItem;
    NrChequesEmitidos1: TMenuItem;
    Chequesprdatadospendentes1: TMenuItem;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    GerarArquivoRemessaCheque1: TMenuItem;
    SaveDialog: TSaveDialog;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit13: TDBEdit;
    LanamentosGeral1: TMenuItem;
    DBRadioGroup2: TDBRadioGroup;
    Label19: TLabel;
    DBEdit14: TDBEdit;
    SpeedButton1: TSpeedButton;
    ComissoVendedor1: TMenuItem;
    Label20: TLabel;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit25: TDBEdit;
    SaldoDirioporContaCorrente1: TMenuItem;
    Label23: TLabel;
    DBEdit26: TDBEdit;
    DBRadioGroup3: TDBRadioGroup;
    ReldeDepsitosPendentes1: TMenuItem;
    BaixasdeDepsitosPendentes1: TMenuItem;
    ChequesDevolvidos1: TMenuItem;
    DBRadioGroup4: TDBRadioGroup;
    BaixadeChequesDevolvidos1: TMenuItem;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DBDirceu5: TDBDirceu;
    SaldoMdioPerodo1: TMenuItem;
    RelAdiantamentos1: TMenuItem;
    RelAdiantamentosBaixa1: TMenuItem;
    EmissoRecibo1: TMenuItem;
    SaldoMdioPerodoCC1: TMenuItem;
    SBProtocolo: TSpeedButton;
    SpeedButton2: TSpeedButton;
    LblSituacao: TLabel;
    AlterarContaCorrente1: TMenuItem;
    Label26: TLabel;
    DBEdit3: TDBEdit;
    ChequesEmitidosContasPagar1: TMenuItem;
    Label24: TLabel;
    DBEDepartamento: TDBEdit;
    Label25: TLabel;
    DBEHistorico: TDBEdit;
    Extrato1: TMenuItem;
    Label38: TLabel;
    SBAdiantamento: TSpeedButton;
    MEAdiantamento: TMaskEdit;
    DBEdit19: TDBEdit;
    DBPTitularCheque: TDBPanel;
    ControleLanamentosCarto1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure BtHistoricoClick(Sender: TObject);
    procedure BtContaCorrenteClick(Sender: TObject);
    procedure BtCadastroClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure DBECodHistoricoExit(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure EmiteCheque1Click(Sender: TObject);
    procedure RelaodeChequesLanados1Click(Sender: TObject);
    procedure RelaodeChequesContaCorrente1Click(Sender: TObject);
    procedure SaldosBancos1Click(Sender: TObject);
    procedure ResumodeLanamentos1Click(Sender: TObject);
    procedure RelaodeMovimentosSaldos1Click(Sender: TObject);
    procedure ListadeChequesPredatados1Click(Sender: TObject);
    procedure EmiteCpiadeCheque1Click(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure RelaodeChequesPrDatados1Click(Sender: TObject);
    procedure BtDepartamentoClick(Sender: TObject);
    procedure RelaodeHistrico1Click(Sender: TObject);
    procedure Ed1HistoricoExit(Sender: TObject);
    procedure BtObservacaoClick(Sender: TObject);
    procedure CancelarCheque1Click(Sender: TObject);
    procedure NrChequesEmitidos1Click(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit8Exit(Sender: TObject);
    procedure Chequesprdatadospendentes1Click(Sender: TObject);
    procedure GerarArquivoRemessaCheque1Click(Sender: TObject);
    procedure VaComm1RxChar(Sender: TObject; Count: Integer);
    procedure FormCreate(Sender: TObject);
    procedure LanamentosGeral1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComissoVendedor1Click(Sender: TObject);
    procedure SaldoDirioporContaCorrente1Click(Sender: TObject);
    procedure ReldeDepsitosPendentes1Click(Sender: TObject);
    procedure BaixasdeDepsitosPendentes1Click(Sender: TObject);
    procedure ChequesDevolvidos1Click(Sender: TObject);
    procedure BaixadeChequesDevolvidos1Click(Sender: TObject);
    procedure SaldoMdioPerodo1Click(Sender: TObject);
    procedure RelAdiantamentos1Click(Sender: TObject);
    procedure RelAdiantamentosBaixa1Click(Sender: TObject);
    procedure EmissoRecibo1Click(Sender: TObject);
    procedure SaldoMdioPerodoCC1Click(Sender: TObject);
    procedure SBProtocoloClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure AlterarContaCorrente1Click(Sender: TObject);
    procedure ChequesEmitidosContasPagar1Click(Sender: TObject);
    procedure Extrato1Click(Sender: TObject);
    procedure DBEdit19Exit(Sender: TObject);
    procedure SBAdiantamentoClick(Sender: TObject);
    procedure DBPTitularChequeDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure ControleLanamentosCarto1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FBancosMovCad: TFBancosMovCad;
  cont: integer = 0;

implementation

uses UBancoAgencia_cl, UHistoricoCons, UHistorico_cl, UContaCorrenteCons,
  UCadastroCons, UCadastro_cl, UBiblioteca, UPlanilha_cl, UOracle_cl, UParamSistema_cl,
  UEmiteCheque, UBancoMovCons, UBancoMovParam, URBancoMov_Cheques_Data,
  URBancoMov_Cheques_CC, URBancosMov_SaldosBanco, URBancoMov_ChequesPD,
  URBancosMov_MovSaldos, URBancosMov_Lanc, URBancoMov_CopCheque,
  UCaixaLanc_Cont, UCaixa_cl, UUsuario_cl, URCheques_Baixados,
  UDepartamentoCons, UDepartamento_cl, URMov_Historico, UHistContabilCons,
  UHistContabil_cl, URBancosNrCheques,
  URChequePDatadoPendente, UFilial_cl, UChequeCad, USequencia_cl,
  URCustodiaCheque, URGuiaCustodia, URBancoMov_Historico, URReciboOS,
  URBcoComissaoVendedor, URSaldoDiarioCC, UBancoCCorrenteParam,
  URDep_Pendente, UBancoAgenciaRel_cl, URBaixaDepositoPendente,
  URChequeDevolvido, URBaixaChequeDevolvido, URSaldoMedioPeriodo,
  UAdiantamentoParam, UAdiantamento_cl, URAdiantamento, URAdiantamentoBaixa,
  URReciboBanco, URSaldoMedioPeriodoContaCorrente, URProtocolo,
  UAlteraCCMovimento, URBancosMov_MovSaldosAvemed,
  URChequesEmitidosContasPagar, UFmFilial, URBancosMov_Extrato,
  UAdiantamentoCons, URControleLancamentoCartao, UFmBanco;

{$R *.DFM}

function RMaskCGC_CPF(wCgc1: string; Zeros: Integer): string;
var S: string;
  x: integer;
begin

  for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] then
      S := S + wCgc1[x];

  while Length(S) < Zeros do
    S := '0' + S;

  Result := S;

end;

procedure TFBancosMovCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMBancoAgencia.QBancoMovimento.Open;
  DMParamSistema.QParamSistema.Open;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'SRTERRA' then
    BtCopia.Visible := false;
{  SBAlterar.Visible:=False;
  Alterar1.Visible:=False;
  DSPrimario.Autoedit:=False; }
end;

procedure TFBancosMovCad.BtHistoricoClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal = MrOk then
  begin
    DMBancoAgencia.QBancoMovimentoCOD_HISTORICO.Value := DMHistorico.QHistoricoConsCod_Historico.Value;
    DBECodHistorico.SetFocus;
  end;
end;

procedure TFBancosMovCad.BtContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOk then
    DMBancoAgencia.QBancoMovimentoCOD_CONTA_CORRENTE.Value := DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value;
end;

procedure TFBancosMovCad.BtCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMBancoAgencia.QBancoMovimentoCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFBancosMovCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [dsInsert, dsEdit] then
  begin
    BtHistorico.Enabled := True;
    BtContaCorrente.Enabled := True;
    BtCadastro.Enabled := True;
    BtDepartamento.Enabled := True;
    BtObservacao.Enabled := True;
    SBAdiantamento.Enabled := True;
  end
  else
  begin
    BtHistorico.Enabled := False;
    BtContaCorrente.Enabled := False;
    BtCadastro.Enabled := False;
    BtDepartamento.Enabled := False;
    BtObservacao.Enabled := False;
    SBAdiantamento.Enabled := False;
  end;
  if DSPrimario.State in [DSEdit] then
  begin
    SbCancelar.Visible := False;
    Cancelar1.Visible := False;
  end
  else
  begin
    SbCancelar.Visible := True;
    Cancelar1.Visible := True;
  end;
  if DMBancoAgencia.QBancoMovimentoIND_BAIXA_CHEQUE.Value = 'S' then
    LblSituacao.Caption := 'BAIXADO';
  if DMBancoAgencia.QBancoMovimentoIND_BAIXA_CHEQUE.Value = 'N' then
    LblSituacao.Caption := '';
end;

procedure TFBancosMovCad.SBConfirmarClick(Sender: TObject);
var
  wCodDoc, wFilial, wCodCompl, wCodHistorico, wCodDepartamento: Integer;
  wVlrLcto, wDesconto, wValorLimite: Real;
  wNumDoc, wContaCred, wContaDeb, wAux, wCodHistorico_Caixa, wBancoAgencia, wNada, wCod_Nota_Cab, wDepCaixa: string;
  wDtLcto: TDateTime;
  wState: TDataSetState;
  wVal: string;
begin
  wCodDepartamento := 0;

  if DMParamSistema.QParamSistemaDt_Fechamento_Financeiro.Value >= DMBancoAgencia.QBancoMovimentoDt_Movimento.Value then
     raise Exception.Create('Não é Permitido Realizar Este Lançamento - Fechamento Contabil');
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
  begin
    if (Trim(DBEdit17.Text) <> '') then
    begin
      if DMOracle.BuscaNome('SELECT COD_VENDEDOR FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(DBEdit17.Text)) = '' then
        raise Exception.Create('Cadastro Sem Código de Vendedor');
    end
    else
      raise Exception.Create('O campo Cadastro Deve Conter um Valor');
  end;

  if (DMBancoAgencia.QBancoMovimentoIND_CHEQUE_DEVOLVIDO.Value  = 'SIM') and
     (DMBancoAgencia.QBancoMovimentoIND_DEPOSITO_PENDENTE.Value = 'SIM') then
     raise Exception.Create('Um Movimento bancário não pode ser Depósito pendente e Cheque devolvido ao mesmo tempo.');

  DMHistorico.QHistorico.Close;
  DMHistorico.QHistorico.SetVariable('PK', DMBancoAgencia.QBancoMovimentoCod_Historico.Value);
  DMHistorico.QHistorico.Open;

  if DMHistorico.QHistoricoIND_SITUACAO.Value = 'NAO' then
     raise Exception.Create('Histórico Não Liberado Para Uso');
  if (Trim(DBEDIT15.Text) <> '') and
     (Trim(DBEDIT16.Text) <> '') and
     (Trim(DBEDIT17.Text) <> '') then
  begin
    wCod_Nota_Cab := DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_NOTA_CAB ',
      ' COD_CADASTRO = ' + Trim(DBEDIT17.Text) +
      ' AND NUM_NOTA = ' + Trim(DBEDIT15.Text) +
      ' AND COD_SERIE = ' + CHR(39) + Trim(DBEDIT16.Text) + CHR(39) +
      ' AND IND_CONDICAO_PAGTO = 3');
    if wCod_Nota_Cab = '' then
      raise Exception.Create('Verifique a NF e a condição de Pagamento')
    else
      DMBancoAgencia.QBancoMovimentoCod_Nota_Cab.Value := StrToInt(wCod_Nota_Cab);
  end;

  try
    DBEdit10.SetFocus;
    //Gera o nr_cheque.
    if (DMBancoAgencia.QBancoMovimentoInd_operacao.Value = '-') then
    begin
      if DMHistorico.QHistoricoIND_EMITE_CHEQUE.Value = 'S' then
      begin
        if (DMBancoAgencia.QBancoMovimentoInd_Pgto_Taxa.Value = 'SIM') then
        begin
          wValorLimite := StrToFloat('0' + DMOracle.BuscaNome('SELECT TB_BANCO_AGENCIA.VAL_LIMITE_CHEQUE FROM TB_CONTA_CORRENTE,TB_BANCO_AGENCIA',
            ' TB_CONTA_CORRENTE.COD_BANCO_AGENCIA = TB_BANCO_AGENCIA.COD_BANCO_AGENCIA' +
            ' AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.text));
          if (DMBancoAgencia.QBancoMovimentoVal_Movimento.Value >= wValorLimite) then
          begin
            wDesconto := (DMBancoAgencia.QBancoMovimentoVal_Movimento.Value * StrToFloat('0' + DMOracle.BuscaNome('SELECT TB_BANCO_AGENCIA.PERC_TAXA_LIMITE FROM TB_CONTA_CORRENTE,TB_BANCO_AGENCIA',
              ' TB_CONTA_CORRENTE.COD_BANCO_AGENCIA = TB_BANCO_AGENCIA.COD_BANCO_AGENCIA' +
              ' AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Text)) / 100);
            DMBancoAgencia.QBancoMovimentoVal_Desconto_Taxa.Value := wDesconto;
            DMBancoAgencia.QBancoMovimentoVal_Movimento.Value := DMBancoAgencia.QBancoMovimentoVal_Movimento.Value - wDesconto;
            if FRReciboOS = nil then
              FRReciboOS := TFRReciboOS.Create(Application);
            DMFilial.QFilial.Close;
            DMFilial.QFilial.SetVariable('PK', DMOracle.BuscaNome('SELECT TB_CONTA_CORRENTE.COD_FILIAL FROM TB_CONTA_CORRENTE ',
              ' TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + IntToStr(DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value)));
            DMFilial.QFilial.Open;
            //------------- Inicio preenchimento dos campos label do recibo
            FRReciboOS.QRLCliente.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMBancoAgencia.QBancoMovimentoCod_Cadastro.Value));
            FRReciboOS.QRLValorExtenso.Caption := Bib.Extenso(DMBancoAgencia.QBancoMovimentoVal_Desconto_Taxa.Value, 'REAL');
            FRReciboOS.pValor := DMBancoAgencia.QBancoMovimentoVal_Desconto_Taxa.Value;
            FRReciboOS.QRLNumRecibo.Caption := IntToStr(DMSequencia.Sequencia(DMFilial.QFilialCod_Filial.Value, 'RECIBO'));
            FRReciboOS.QRLReferente.Caption := 'Pagamento Taxa desconto Cheque';
            FRReciboOS.QRLData.Caption := DateToStr(DMBancoAgencia.QBancoMovimentoDt_Movimento.Value);
            FRReciboOS.QRLResponsavel.Caption := DMFilial.QFilialDesc_Filial.Value;
            //----------------
            FRReciboOS.QRPrimario.Preview;
            FRReciboOS.Free;
            FRReciboOS := nil;
            DMFilial.QFilial.Close;
          end;
        end;
         // Atualiza o nr do cheque Caso a operaçao for de saida
        if (DMBancoAgencia.QBancoMovimentoNum_Cheque.Value = 0) and
          (DMBancoAgencia.QBancoMovimentoind_operacao.Value = '-') then
        begin
          DMBancoAgencia.QBancoMovimentoNum_Cheque.Value := StrToInt('0' +
            DMOracle.BuscaNome('SELECT NUM_CHEQUE FROM TB_CONTA_CORRENTE',
            'COD_CONTA_CORRENTE = ' + FloatToStr(DMBancoAgencia.QBancoMovimentoCOD_CONTA_CORRENTE.Value)));
          if DMBancoAgencia.QBancoMovimentoNum_Cheque.Value = 0 then
            MessageDlg('Atenção!' + #13 + #10 + 'Número do cheque cadastrado na conta corrente é zero ou nulo.',
              mtWarning, [mbOK], 0);
          DMBancoAgencia.QAtualizaNrCheque.Close;
          DMBancoAgencia.QAtualizaNrCheque.SQL.Clear;
          DMBancoAgencia.QAtualizaNrCheque.Sql.Add('UPDATE TB_CONTA_CORRENTE SET NUM_CHEQUE = ' + FloatToStr(DMBancoAgencia.QBancoMovimentoNum_Cheque.Value + 1) +
            ' WHERE (COD_BANCO_AGENCIA = ' + FloatToStr(DMBancoAgencia.QBancoMovimentocod_banco_agencia.Value) +
            ' ) AND ( COD_CONTA_CORRENTE = ' + FloatToStr(DMBancoAgencia.QBancoMovimentoCOD_CONTA_CORRENTE.Value) + ')');
          DMBancoAgencia.QAtualizaNrCheque.ExecSQL;
        end;
      end;
    end;

    DMBancoAgencia.QBancoMovimentoDESC_OBSERVACAO.Text := DMBancoAgencia.QBancoMovimentoDESC_OBSERVACAO.Text;

    wState := DMBancoAgencia.QBancoMovimento.State; //pega o estado, para ver se estava inserindo, para usar abaixo
    DMBancoAgencia.QBancoMovimento.Post;

    with DMBancoAgencia do
    begin
      wCodDoc := QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
      if QBancoMovimentoDESC_COMPLEMENTO1.Value <> '' then
        wNumDoc := IntToStr(QBancoMovimentoNUM_CHEQUE.Value) + '-' + QBancoMovimentoDESC_COMPLEMENTO1.Value
      else
        wNumDoc := IntToStr(QBancoMovimentoNUM_CHEQUE.Value) + '-' + QBancoMovimentoDESC_CADASTRO.Value;
      wFilial := StrToInt(DMOracle.BuscaNome('SELECT COD_FILIAL FROM TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + FloatToStr(QBancoMovimentoCod_conta_corrente.Value)));
      if DMBancoAgencia.QBancoMovimentoInd_operacao.Value = '-' then
      begin
        wContaDeb := DMHistorico.QHistoricoCOD_CONTABIL_DEB.Value;
        wContaCred := '';
      end
      else
      begin
        wContaCred := DMHistorico.QHistoricoCOD_CONTABIL_CRED.Value;
        wContaDeb := '';
      end;
      if wContaCred = '' then
      begin
        wBancoAgencia := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + FloatToStr(QBancoMovimentoCod_Conta_Corrente.Value));
        wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_CONTRAPARTIDA FROM TB_BANCO_AGENCIA', 'COD_BANCO_AGENCIA = ' + wBancoAgencia);
      end;
      if wContaDeb = '' then
      begin
        wBancoAgencia := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + FloatToStr(QBancoMovimentoCod_Conta_Corrente.Value));
        wContaDeb := DMOracle.BuscaNome('SELECT COD_CONTABIL_CONTRAPARTIDA FROM TB_BANCO_AGENCIA', 'COD_BANCO_AGENCIA = ' + wBancoAgencia);
      end;
      wCodCompl := QBancoMovimentoCod_Cadastro.Value;
      wCodHistorico_Caixa := DMHistorico.QHistoricoCOD_HISTORICO_CAIXA.Text;
      if Trim(Ed1Historico.Text) <> '' then
        wCodHistorico := StrToInt(Trim(Ed1Historico.Text))
      else
      begin
        wAux := DMHistorico.QHistoricoCOD_HISTORICO_CONTABIL.Text;
        if Trim(wAux) <> '' then
          wCodHistorico := StrToInt(wAux)
        else
          wCodHistorico := 0;
      end;
      wVlrLcto := QBancoMovimentoVal_Movimento.Value;
      if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI') And
         (QBancoMovimentoDt_Movimento.Value > date)   then  // FOI COLOCADO A PEDIDO DO VAGNER DIA 16/03/2011
        wDtLcto := QBancoMovimentoDt_Usuario.Value // para contabilizar pela data que foi efetuado o lancamento e nao pela data do cheque
      else
        wDtLcto := QBancoMovimentoDt_Movimento.Value;
    end;
      //Caso for uma inclusão contabiliza e gera a conciliaçao Bancaria
    if (DMParamSistema.QParamSistemaIND_CONTABILIZA.Value = 'S') and
       (wCodHistorico <> 0) then // nao contabiliza quando historico contabil igual a 0
    begin
      if FCaixa_Lanc_Cont = nil then
         Fcaixa_Lanc_Cont := TFCaixa_Lanc_Cont.Create(Application);
      FCaixa_Lanc_Cont.MEContaCredito.text := wContaCred;
      if (DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'FILIAL') or
         (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') then
        FCaixa_Lanc_Cont.pFilial := wFilial
      else
        FCaixa_Lanc_Cont.pFilial := 1;
      FCaixa_Lanc_Cont.MEContaDebito.Text := wContaDeb;
      FCaixa_Lanc_Cont.MEContaDebitoExit(Self);
      FCaixa_Lanc_Cont.MEContaCreditoExit(Self);
      FCaixa_Lanc_Cont.MeFilialDebito.Text := IntToStr(wFilial);
      FCaixa_Lanc_Cont.MeFilialCredito.Text := IntToStr(wFilial);
      FCaixa_Lanc_Cont.ShowModal;
      wContaCred := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaCredito.text, '.');
      wContaDeb := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaDebito.text, '.');
      DMPlanilha.GravaLanc('BC', wCodDoc, wNumDoc, StrToInt(FCaixa_Lanc_Cont.MeFilialCredito.Text), wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrLcto, wDtLcto, wContaDeb);
      DMPlanilha.GravaLanc('BC', wCodDoc, wNumDoc, StrToInt(FCaixa_Lanc_Cont.MeFilialDebito.Text), wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrLcto, wDtLcto, wContaCred);
      wBancoAgencia := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + FloatToStr(DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value));
      wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_TAXA_CRED FROM TB_BANCO_AGENCIA', 'COD_BANCO_AGENCIA = ' + wBancoAgencia);
      wContaDeb := DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_TAXA_DEB FROM TB_BANCO_AGENCIA', 'COD_BANCO_AGENCIA = ' + wBancoAgencia);
      wContaCred := Bib.LimpaString(wContaCred, '.');
      wContaDeb := Bib.LimpaString(wContaDeb, '.');
          // rotina para contabilizar a taxa
      if (wContaCred <> '') and
        (wContaDeb <> '') and
        (DMBancoAgencia.QBancoMovimentoVal_Desconto_Taxa.Value <> 0) then
      begin
        DMPlanilha.GravaLanc('BC', wCodDoc, wNumDoc, StrToInt(FCaixa_Lanc_Cont.MeFilialCredito.Text), wContaCred, 'CREDITO', wCodCompl, wCodHistorico, DMBancoAgencia.QBancoMovimentoVal_Desconto_Taxa.Value, wDtLcto, wContaDeb);
        DMPlanilha.GravaLanc('BC', wCodDoc, wNumDoc, StrToInt(FCaixa_Lanc_Cont.MeFilialDebito.Text), wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, DMBancoAgencia.QBancoMovimentoVal_Desconto_Taxa.Value, wDtLcto, wContaCred);
      end;

    end;
 // FOI CRIADO UMA TRIGGER CÉSAR 08/07/2009
{      If trim(MEDptoCheque.Text) <> '' then
        wCodDepartamento := strToInt(trim(MEDptoCheque.Text));

      If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE' then
      begin
        If (wCodHistorico_Caixa <> '') and (trim(MeDptoCheque.Text) <> '') then
            DMBancoAgencia.OPBanco.CallProcedure('PROC_ATUALIZA_MOV_CAIXA',[DMUsuario.CodUsuarioCorrente, wCodDepartamento, wCodDoc, Trim(EdHistorico.Text), wCodHistorico_Caixa]);
      end
      else
        If (wCodHistorico_Caixa <> '') then
            DMBancoAgencia.OPBanco.CallProcedure('PROC_ATUALIZA_MOV_CAIXA',[DMUsuario.CodUsuarioCorrente, wCodDepartamento, wCodDoc, Trim(EdHistorico.Text), wCodHistorico_Caixa]);
}
        //FOI CRIADO UMA PROCEDURE NO BANCO
      {If wCodHistorico_Caixa <> '' Then
      Begin
         DMCaixa.QCaixa_Mov.AutoCalcFields :=False;
         DMCaixa.QCaixa_Mov.Open;
         DMCaixa.QCaixa_Mov.Insert;
         DMCaixa.QCaixa_MovCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;
         DMCaixa.QCaixa_MovDT_Usuario.Value:=DMOracle.DataHoraServ;
         DMCaixa.QCaixa_MovCod_Filial.Value:=wFilial;
         If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE' then//alterado Marcos 10/11/06
           DMCaixa.QCaixa_MovCod_Departamento.Value:= StrToInt(Trim(MEDptoCheque.Text))
         else
           DMCaixa.QCaixa_MovCod_Departamento.Value:=DMUsuario.CodDepartamentoUsuario;
         DMCaixa.QCaixa_MovCod_Historico.Value:=StrToInt(wCodHistorico_Caixa);
         If StrtoInt(Trim(DBECodHistorico.Text)) = 96 Then
            DMcaixa.QCaixa_MovDT_Movimento.value:=DMOracle.DataServ  // para cheques devolvidos do moinho
         else
            DMcaixa.QCaixa_MovDT_Movimento.value:=wDtLcto;
         DMcaixa.QCaixa_MovVal_Movimento.value:=wVlrLcto;
         DMcaixa.QCaixa_MovNum_Documento.value:=DMBancoAgencia.QBancoMovimentoNUM_CHEQUE.Value;
         DMcaixa.QCaixa_MovCod_Bco_Movimento.value:=wCodDoc;
         if wCodCompl > 0 Then
            DMcaixa.QCaixa_MovCod_Cadastro.value:=wCodCompl;
         If DmParamSistema.QParamSistemaCOD_EMPRESA.value <> 'MOINHO' Then
            DMcaixa.QCaixa_MovDesc_Complemento.Value:=DMBancoAgencia.QBancoMovimentoDesc_Observacao.Value
         else
            If DMBancoAgencia.QBancoMovimentoDesc_Observacao.Value <> '' Then
               DMcaixa.QCaixa_MovDesc_Complemento.Value:=DMBancoAgencia.QBancoMovimentoDesc_Observacao.Value
            else
               If DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value <> '' Then
                  DMcaixa.QCaixa_MovDesc_Complemento.Value:=DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value
               else
                  DMcaixa.QCaixa_MovDesc_Complemento.Value:=Trim(EdHistorico.Text);
         DMCaixa.QCaixa_Mov.Post;
         DMCaixa.QCaixa_Mov.Close;
         DMCaixa.QCaixa_Mov.AutoCalcFields :=True;
      End; }//FOI CRIADO UMA PROCEDURE NO BANCO

      // inclui no caixa valor taxa
    wCodHistorico_Caixa := DMOracle.BuscaNome('SELECT Cod_Historico_Caixa_Taxa FROM TB_BANCO_AGENCIA', 'COD_BANCO_AGENCIA = ' + wBancoAgencia);

    if (DMBancoAgencia.QBancoMovimentoVal_Desconto_Taxa.Value <> 0) and
      (wCodHistorico_Caixa <> '') then
    begin
      DMCaixa.QCaixa_Mov.AutoCalcFields := False;
      DMCaixa.QCaixa_Mov.Open;
      DMCaixa.QCaixa_Mov.Insert;
      DMCaixa.QCaixa_MovCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
      DMCaixa.QCaixa_MovDT_Usuario.Value := DMOracle.DataHoraServ;
      DMCaixa.QCaixa_MovCod_Filial.Value := wFilial;
      wDepCaixa := DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_HISTORICO', 'COD_HISTORICO = ' + wCodHistorico_Caixa);
      if wDepCaixa = '' then
        wDepCaixa := IntToStr(DMUsuario.CodDepartamentoUsuario);
      DMCaixa.QCaixa_MovCod_Departamento.Value := StrToInt(wDepCaixa);
      DMCaixa.QCaixa_MovCod_Historico.Value := StrToInt(wCodHistorico_Caixa);
      DMcaixa.QCaixa_MovDT_Movimento.value := wDtLcto;
      DMcaixa.QCaixa_MovVal_Movimento.value := DMBancoAgencia.QBancoMovimentoVal_Desconto_Taxa.Value;
      DMcaixa.QCaixa_MovNum_Documento.value := DMBancoAgencia.QBancoMovimentoNUM_CHEQUE.Value;
      DMcaixa.QCaixa_MovCod_Bco_Movimento.value := wCodDoc;
      if wCodCompl > 0 then
        DMcaixa.QCaixa_MovCod_Cadastro.value := wCodCompl;
      if DmParamSistema.QParamSistemaCOD_EMPRESA.value <> 'MOINHO' then
        DMcaixa.QCaixa_MovDesc_Complemento.Value := DMBancoAgencia.QBancoMovimentoDesc_Observacao.Value
      else
        if DMBancoAgencia.QBancoMovimentoDesc_Observacao.Value <> '' then
          DMcaixa.QCaixa_MovDesc_Complemento.Value := DMBancoAgencia.QBancoMovimentoDesc_Observacao.Value
        else
          if DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value <> '' then
            DMcaixa.QCaixa_MovDesc_Complemento.Value := DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value
          else
            DMcaixa.QCaixa_MovDesc_Complemento.Value := Trim(EdHistorico.Text);
      DMCaixa.QCaixa_Mov.Post;
      DMCaixa.QCaixa_Mov.Close;
      DMCaixa.QCaixa_Mov.AutoCalcFields := True;
    end;

    DBENrCheque.Enabled := True;
//      foi colocado uma trigger
{      If DMHistorico.QHistoricoInd_Lancto_Mov_Fluxo.Value = 'SIM' Then
       Begin
         DMBancoAgencia.QFluxoCaixa.Close;
         DMBancoAgencia.QFluxoCaixa.Open;
         DMBancoAgencia.QFluxoCaixa.Insert;
         DMBancoAgencia.QFluxoCaixaCod_Filial.Value := wFilial;
         DMBancoAgencia.QFluxoCaixaCod_Departamento.Value := DMBancoAgencia.QBancoMovimentoCod_Departamento.Value;
         DMBancoAgencia.QFluxoCaixaDt_Fluxo_Caixa.Value := wDtLcto;
         If DMHistorico.QHistoricoInd_Operacao.Value = '+' Then
          Begin
            DMBancoAgencia.QFluxoCaixaVal_Fluxo_Caixa.Value := DMBancoAgencia.QBancoMovimentoVal_Movimento.Value;
            DMBancoAgencia.QFluxoCaixaVal_Pagar.Value := 0;
          End
         Else
          Begin
            DMBancoAgencia.QFluxoCaixaVal_Pagar.Value := DMBancoAgencia.QBancoMovimentoVal_Movimento.Value;
            DMBancoAgencia.QFluxoCaixaVal_Fluxo_Caixa.Value := 0;
          End;
         DMBancoAgencia.QFluxoCaixaDesc_Observacao.Value := DMBancoAgencia.QBancoMovimentoDesc_Observacao.Value;
         DMBancoAgencia.QFluxoCaixaCod_Bco_Movimento.Value := DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
         DMBancoAgencia.QFluxoCaixa.Post;
         DMBancoAgencia.QFluxoCaixa.Close;
       End;           }// foi colocado uma trigger
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  except
    if DMCaixa.QCaixa_Mov.State in [DsInsert, DsEdit] then
      DMCaixa.QCaixa_Mov.Cancel;
    DMOracle.DBCemapa.RollBack;
    DMBancoAgencia.QBancoMovimento.Close;
    DMBancoAgencia.QBancoMovimento.Open;
    raise;
  end;
  if DMHistorico.QHistoricoIND_EMITE_CHEQUE.Value = 'S' then
    if MessageDlg('Deseja emitir o cheque agora ?', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      if FEmiteCheque = nil then
        FEmiteCheque := TFEmiteCheque.Create(Application);
      FEmiteCheque.MECodBanco.Text := FloatToStr(DMBancoAgencia.QBancoMovimentocod_banco_agencia.Value);
      FEmiteCheque.MEContaCorrente.Text := FloatToStr(DMBancoAgencia.QBancoMovimentoCOD_CONTA_CORRENTE.Value);
      FEmiteCheque.MENrCheque.Text := FloatToStr(DMBancoAgencia.QBancoMovimentonum_cheque.Value);
      FEmiteCheque.MEValor.Text := FloatToStr(Round(DMBancoAgencia.QBancoMovimentoVal_Movimento.Value * 100) / 100);
      FEmiteCheque.MECidade.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_FILIAL', 'COD_FILIAL  = ' + FloatToStr(wFilial));
      if DMBancoAgencia.QBancoMovimentoDesc_Cadastro.Value = '' then
        FEmiteCheque.MENominal.Text := DMBancoAgencia.QBancoMovimentoDESC_OBSERVACAO.Value
      else
        FEmiteCheque.MENominal.Text := DMBancoAgencia.QBancoMovimentoDesc_Cadastro.Value;
      FEmiteCheque.MEData.Text := DateToStr(DMBancoAgencia.QBancoMovimentoDt_Movimento.Value);
      FEmiteCheque.ShowModal;
      if (DMParamSistema.QParamSistemaCOD_EMPRESA.value <> 'MOINHO') and
        (DMParamSistema.QParamSistemaCOD_EMPRESA.value <> 'GRASEL') then
        if MessageDlg('Deseja emitir a cópia de cheque agora ?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          with DMBancoAgenciaRel do
          begin
            QRBancoMov_CopCheque.Close;
            QRBancoMov_CopCheque.SetVariable('COD_BANCO_AGENCIA', DMBancoAgencia.QBancoMovimentocod_banco_agencia.Value);
            QRBancoMov_CopCheque.SetVariable('COD_CONTA_CORRENTE', DMBancoAgencia.QBancoMovimentoCOD_CONTA_CORRENTE.Value);
            QRBancoMov_CopCheque.SetVariable('DT_INICIAL', DMBancoAgencia.QBancoMovimentoDt_Movimento.Value);
            QRBancoMov_CopCheque.SetVariable('DT_FINAL', DMBancoAgencia.QBancoMovimentoDt_Movimento.Value);
            QRBancoMov_CopCheque.SetVariable('NUM_CHEQUE', DMBancoAgencia.QBancoMovimentonum_cheque.Value);
            QRBancoMov_CopCheque.Open;
            if FRBancoMov_CopCheque = nil then
              FRBancoMov_CopCheque := TFRBancoMov_CopCheque.Create(Application);
            FRBancoMov_CopCheque.QRPrimario.Preview;
            QRBancoMov_CopCheque.Close;
          end;
        end;
    end;
  DMBancoAgencia.QBancoMovimento.Close;
  DMBancoAgencia.QBancoMovimento.SetVariable('PK', wCodDoc);
  DMBancoAgencia.QBancoMovimento.Open;
  Ed1Historico.Clear;
end;

procedure TFBancosMovCad.SBExcluirClick(Sender: TObject);
var
  wNumDoc: Integer;
  wComando: string;
begin
  if DMParamSistema.QParamSistemaDt_Fechamento_Financeiro.Value >= DMBancoAgencia.QBancoMovimentoDt_Movimento.Value then
    raise Exception.Create('Não é Permitido Voltar Confirmação - Fechamento Contabil');

  if MessageDlg('Apagar este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if (DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.IsNull) and
      (DMBancoAgencia.QBancoMovimentoCod_Conta_Pagar_Cab.IsNull) then
    begin
      if not (DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.IsNull) then
      begin
        DMOracle.DBCemapa.StartTransaction;
        try
          wNumDoc := DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
          DMPlanilha.Descontabiliza(wNumDoc, 'BC');
          with DMOracle do
          begin
{           QExecSQL.Close; /* foi colocado na trigger
           QExecSQL.SQL.Clear;
           wComando := 'DELETE FROM TB_CAIXA_MOV ';
           wComando := wComando + ' WHERE COD_BCO_MOVIMENTO = '+FloatToStr(DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value);
           QExecSQL.SQL.Add(wComando);
           QExecSQL.ExecSQL;
}
            QExecSQL.Close;
            QExecSQL.SQL.Clear;
            wComando := 'DELETE FROM TB_BCO_CONCILIA ';
            wComando := wComando + ' WHERE COD_BCO_MOVIMENTO = ' + FloatToStr(DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value);
            QExecSQL.SQL.Add(wComando);
            QExecSQL.ExecSQL;

            QExecSQL.Close;
            QExecSQL.SQL.Clear;
            wComando := 'DELETE FROM TB_FLUXO_CAIXA ';
            wComando := wComando + ' WHERE COD_BCO_MOVIMENTO = ' + FloatToStr(DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value);
            QExecSQL.SQL.Add(wComando);
            QExecSQL.ExecSQL;

          end;

          DSPrimario.DataSet.Delete;
          DMOracle.DBCemapa.Commit;

        except
          DMOracle.DBCemapa.Rollback;
          raise Exception.Create('Erro ! Não foi possível excluir este Registro');
        end;
      end;
    end
    else
      MessageDlg('Não é Possível Excluir um Registro de Movimento gerado pela Nota, Contas a Pagar ou Contas a Receber', mtWarning, [mbOk], 0);
  end;
end;

procedure TFBancosMovCad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  DBENrCheque.Enabled := True;
  DMOracle.DBCemapa.Rollback;
end;

procedure TFBancosMovCad.DBECodHistoricoExit(Sender: TObject);
var wDep: string;
begin
  inherited;
  if DSPrimario.State = dsInsert then
  begin
    if DMBancoAgencia.QBancoMovimentoind_operacao.value = '-' then
      DMBancoAgencia.QBancoMovimentoNUM_CHEQUE.Value := 0;
  end;
  if Trim(DMBancoAgencia.QBancoMovimentoCod_Historico.Text) <> '' then
  begin
    Ed1Historico.Text := (DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_HISTORICO', 'COD_HISTORICO = ' + FloatToStr(DMBancoAgencia.QBancoMovimentoCod_Historico.Value)));
    if Ed1Historico.Text <> '' then
      EdHistorico.Text := (DMOracle.BuscaNome('SELECT DESC_HISTORICO_CONTABIL FROM TB_HISTORICO_CONTABIL', 'COD_HISTORICO_CONTABIL = ' + Trim(Ed1Historico.Text)));
  end;
  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') then
  begin
    if DBECodHistorico.Text <> '' then
    begin
      wDep := DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_HISTORICO', 'COD_HISTORICO = ' + DBECodHistorico.Text);
      if wDep <> '' then
        if wDep <> DBEdit2.Text then
        begin
          DBECodHistorico.SetFocus;
          raise exception.Create('Historico Não Permitido Para Este Departamento');
        end;
      if DBECodHistorico.Text = '14' then
        DMBancoAgencia.QBancoMovimentoIND_DEPOSITO_PENDENTE.Value := 'SIM';
      if (DBECodHistorico.Text = '833') or
        (DBECodHistorico.Text = '33') then
        DMBancoAgencia.QBancoMovimentoIND_CHEQUE_DEVOLVIDO.Value := 'SIM';
    end;
  end;
  if DBECodHistorico.Text <> '' then
  begin
    wDep := DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_HISTORICO', 'COD_HISTORICO = ' + DBECodHistorico.Text);
    if wDep <> '' then
      DMBancoAgencia.QBancoMovimentoCOD_DEPARTAMENTO.Text := wDep;
  end
end;

procedure TFBancosMovCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FBancoMovCons = nil then
    FBancoMovCons := TFBancoMovCons.Create(Application);
  if FBancoMovCons.ShowModal = mrOk then
  begin
    with DMBancoAgencia do
    begin
      QBancoMovimento.Close;
      QBancoMovimento.SetVariable('PK', QBancoMovConsCOD_BCO_MOVIMENTO.Value);
      QBancoMovimento.Open;
    end;
  end;
end;

procedure TFBancosMovCad.EmiteCheque1Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja emitir o cheque agora ?', mtInformation, [mbYes, mbNo], 0) = mrYes then
  begin
    if FEmiteCheque = nil then
      FEmiteCheque := TFEmiteCheque.Create(Application);
    FEmiteCheque.MECodBanco.Text := FloatToStr(DMBancoAgencia.QBancoMovimentocod_banco_agencia.Value);
    FEmiteCheque.MEContaCorrente.Text := FloatToStr(DMBancoAgencia.QBancoMovimentoCOD_CONTA_CORRENTE.Value);
    FEmiteCheque.MENrCheque.Text := FloatToStr(DMBancoAgencia.QBancoMovimentonum_cheque.Value);
    FEmiteCheque.MEValor.Text := FloatToStr(DMBancoAgencia.QBancoMovimentoVal_Movimento.Value);
    FEmiteCheque.MECidade.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_FILIAL', 'COD_FILIAL  = ' + FloatToStr(DMParamSistema.QParamSistemaCod_Filial.Value));
    if DMBancoAgencia.QBancoMovimentoDesc_Cadastro.Value = '' then
      FEmiteCheque.MENominal.Text := DMBancoAgencia.QBancoMovimentoDESC_OBSERVACAO.Value
    else
      FEmiteCheque.MENominal.Text := DMBancoAgencia.QBancoMovimentoDesc_Cadastro.Value;
    FEmiteCheque.MEData.Text := DateToStr(DMBancoAgencia.QBancoMovimentoDt_Movimento.Value);
    FEmiteCheque.ShowModal;
    FEmiteCheque.Release;
    FEmiteCheque := nil;
  end;
end;

procedure TFBancosMovCad.RelaodeChequesLanados1Click(Sender: TObject);
var
  winicial, wfinal: string;
begin
  inherited;
  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[0].TabVisible := True;
  if FBancoMovParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRBancoMov_Cheques_Data.Close;
      if Trim(FBancoMovParam.ME0CodBanco.Text) <> '' then
        QRBancoMov_Cheques_Data.SetVariable('COD_BANCO', StrToInt(Trim(FBancoMovParam.ME0CodBanco.Text)))
      else
        QRBancoMov_Cheques_Data.SetVariable('COD_BANCO', Null);
      if Trim(FBancoMovParam.ME0CodContaCorrente.Text) <> '' then
        QRBancoMov_Cheques_Data.SetVariable('COD_CONTA_CORRENTE', StrToInt(Trim(FBancoMovParam.ME0CodContaCorrente.Text)))
      else
        QRBancoMov_Cheques_Data.SetVariable('COD_CONTA_CORRENTE', Null);
      if Trim(FBancoMovParam.ME0Carga.Text) <> '' then
        QRBancoMov_Cheques_Data.SetVariable('NUM_CARGA', StrToInt(Trim(FBancoMovParam.ME0Carga.Text)))
      else
        QRBancoMov_Cheques_Data.SetVariable('NUM_CARGA', Null);
      if Trim(FBancoMovParam.ME0Serie.Text) <> '' then
        QRBancoMov_Cheques_Data.SetVariable('COD_SERIE', Trim(FBancoMovParam.ME0Serie.Text))
      else
        QRBancoMov_Cheques_Data.SetVariable('COD_SERIE', Null);
      if Trim(FBancoMovParam.ME0Historico.Text) <> '' then
        QRBancoMov_Cheques_Data.SetVariable('COD_HISTORICO', StrToInt(Trim(FBancoMovParam.ME0Historico.Text)))
      else
        QRBancoMov_Cheques_Data.SetVariable('COD_HISTORICO', Null);
      if Trim(FBancoMovParam.ME0Historico1.Text) <> '' then
        QRBancoMov_Cheques_Data.SetVariable('COD_HISTORICO1', StrToInt(Trim(FBancoMovParam.ME0Historico1.Text)))
      else
        QRBancoMov_Cheques_Data.SetVariable('COD_HISTORICO1', Null);
      if Trim(FBancoMovParam.ME0Historico2.Text) <> '' then
        QRBancoMov_Cheques_Data.SetVariable('COD_HISTORICO2', StrToInt(Trim(FBancoMovParam.ME0Historico2.Text)))
      else
        QRBancoMov_Cheques_Data.SetVariable('COD_HISTORICO2', Null);
      if Trim(FBancoMovParam.ME0Historico3.Text) <> '' then
        QRBancoMov_Cheques_Data.SetVariable('COD_HISTORICO3', StrToInt(Trim(FBancoMovParam.ME0Historico3.Text)))
      else
        QRBancoMov_Cheques_Data.SetVariable('COD_HISTORICO3', Null);
      if Trim(FBancoMovParam.ME0Departamento.Text) <> '' then
        QRBancoMov_Cheques_Data.SetVariable('COD_DEPARTAMENTO', StrToInt(Trim(FBancoMovParam.ME0Departamento.Text)))
      else
        QRBancoMov_Cheques_Data.SetVariable('COD_DEPARTAMENTO', Null);
      if Trim(FBancoMovParam.ME0Vendedor.Text) <> '' then
        QRBancoMov_Cheques_Data.SetVariable('VENDEDOR', StrToInt(Trim(FBancoMovParam.ME0Vendedor.Text)))
      else
        QRBancoMov_Cheques_Data.SetVariable('VENDEDOR', Null);
      if Trim(FBancoMovParam.ME0Cadastro.Text) <> '' then
        QRBancoMov_Cheques_Data.SetVariable('COD_CADASTRO', StrToInt(Trim(FBancoMovParam.ME0Cadastro.Text)))
      else
        QRBancoMov_Cheques_Data.SetVariable('COD_CADASTRO', Null);
      if Trim(FBancoMovParam.ME0DtInicial.Text) <> '' then
      begin
        QRBancoMov_Cheques_Data.SetVariable('DT_INICIAL', StrToDate(FBancoMovParam.ME0DtInicial.Text));
        winicial := DateToStr(StrToDate(FBancoMovParam.ME0DtInicial.Text));
      end
      else
      begin
        QRBancoMov_Cheques_Data.SetVariable('DT_INICIAL', Null);
        winicial := '00/00/0000';
      end;
      if Trim(FBancoMovParam.ME0DtFinal.text) <> '' then
      begin
        QRBancoMov_Cheques_Data.SetVariable('DT_FINAL', StrToDate(FBancoMovParam.ME0DtFinal.text));
        wfinal := DateToStr(StrToDate(FBancoMovParam.ME0DtFinal.text));
      end
      else
      begin
        QRBancoMov_Cheques_Data.SetVariable('DT_FINAL', Null);
        wFinal := '99/99/9999';
      end;

      QRBancoMov_Cheques_Data.Open;

      if FRBancoMov_Cheques_Data = nil then
        FRBancoMov_Cheques_Data := TFRBancoMov_Cheques_Data.Create(Application);
      FRBancoMov_Cheques_Data.QRLPeriodo.Caption := 'PERIODO DE: ' + wInicial + ' ATE: ' + wFinal + '   CARGA: ' + FBancoMovParam.Me0Carga.Text;
      FRBancoMov_Cheques_Data.QRLVendedor.Caption := 'Vendedor: ' + FBancoMovParam.Ed0Vendedor.text;
      if FBancoMovParam.RGPreview.ItemIndex = 0 then
        FRBancoMov_Cheques_Data.QRPrimario.Preview
      else
        FRBancoMov_Cheques_Data.QRPrimario.Print;
      QRBancoMov_Cheques_Data.Close;
      FRBancoMov_Cheques_Data.Release;
      FRBancoMov_Cheques_Data := nil;
    end;
  end;
  FBancoMovParam.Release;
  FBancoMovParam := nil;
end;

procedure TFBancosMovCad.RelaodeChequesContaCorrente1Click(
  Sender: TObject);
var
  winicial, wfinal: string;
begin
  inherited;
  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[1].TabVisible := True;
  if FBancoMovParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRBancoMov_Cheques_CC.Close;
      if Trim(FBancoMovParam.ME1CodBanco.Text) <> '' then
        QRBancoMov_Cheques_CC.SetVariable('COD_BANCO', StrToInt(Trim(FBancoMovParam.ME1CodBanco.Text)))
      else
        QRBancoMov_Cheques_CC.SetVariable('COD_BANCO', Null);

      if Trim(FBancoMovParam.ME1CodContaCorrente.Text) <> '' then
        QRBancoMov_Cheques_CC.SetVariable('COD_CONTA_CORRENTE', StrToInt(Trim(FBancoMovParam.ME1CodContaCorrente.Text)))
      else
        QRBancoMov_Cheques_CC.SetVariable('COD_CONTA_CORRENTE', Null);

      if Trim(FBancoMovParam.ME1Historico.Text) <> '' then
        QRBancoMov_Cheques_CC.SetVariable('COD_HISTORICO', StrToInt(Trim(FBancoMovParam.ME1Historico.Text)))
      else
        QRBancoMov_Cheques_CC.SetVariable('COD_HISTORICO', Null);

      if Trim(FBancoMovParam.ME1Historico1.Text) <> '' then
        QRBancoMov_Cheques_CC.SetVariable('COD_HISTORICO1', StrToInt(Trim(FBancoMovParam.ME1Historico1.Text)))
      else
        QRBancoMov_Cheques_CC.SetVariable('COD_HISTORICO1', Null);

      if Trim(FBancoMovParam.ME1Historico2.Text) <> '' then
        QRBancoMov_Cheques_CC.SetVariable('COD_HISTORICO2', StrToInt(Trim(FBancoMovParam.ME1Historico2.Text)))
      else
        QRBancoMov_Cheques_CC.SetVariable('COD_HISTORICO2', Null);

      if Trim(FBancoMovParam.ME1Historico3.Text) <> '' then
        QRBancoMov_Cheques_CC.SetVariable('COD_HISTORICO3', StrToInt(Trim(FBancoMovParam.ME1Historico3.Text)))
      else
        QRBancoMov_Cheques_CC.SetVariable('COD_HISTORICO3', Null);

      if Trim(FBancoMovParam.ME1Departamento.Text) <> '' then
        QRBancoMov_Cheques_CC.SetVariable('COD_DEPARTAMENTO', StrToInt(Trim(FBancoMovParam.ME1Departamento.Text)))
      else
        QRBancoMov_Cheques_CC.SetVariable('COD_DEPARTAMENTO', Null);
      if Trim(FBancoMovParam.ME1Serie.Text) <> '' then
        QRBancoMov_Cheques_CC.SetVariable('COD_SERIE', Trim(FBancoMovParam.ME1Serie.Text))
      else
        QRBancoMov_Cheques_CC.SetVariable('COD_SERIE', Null);

      if Trim(FBancoMovParam.ME1CodBancoDestino.Text) <> '' then
        QRBancoMov_Cheques_CC.SetVariable('COD_BANCO_DESTINO', StrToInt(Trim(FBancoMovParam.ME1CodBancoDestino.Text)))
      else
        QRBancoMov_Cheques_CC.SetVariable('COD_BANCO_DESTINO', Null);

      if trim(FBancoMovParam.FmCadastro2.MeCadastro.Text) <> '' then
        QRBancoMov_Cheques_CC.SetVariable('CADASTRO', trim(FBancoMovParam.FmCadastro2.MeCadastro.Text))
      else
        QRBancoMov_Cheques_CC.SetVariable('CADASTRO', null);
      if Trim(FBancoMovParam.ME1DtInicial.Text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Preenchido');
      QRBancoMov_Cheques_CC.SetVariable('DT_INICIAL', StrToDate(FBancoMovParam.ME1DtInicial.Text));
      winicial := DateToStr(StrToDate(FBancoMovParam.ME1DtInicial.Text));

      if Trim(FBancoMovParam.ME1DtFinal.text) = '' then
        raise Exception.Create('Campo Data Final Deve Ser Preenchido');
      QRBancoMov_Cheques_CC.SetVariable('DT_FINAL', StrToDate(FBancoMovParam.ME1DtFinal.text));
      wfinal := DateToStr(StrToDate(FBancoMovParam.ME1DtFinal.text));

      QRBancoMov_Cheques_CC.Open;

      if FRBancoMov_Cheques_CC = nil then
         FRBancoMov_Cheques_CC := TFRBancoMov_Cheques_CC.Create(Application);
      FRBancoMov_Cheques_CC.QRLPeriodo.Caption := 'PERIODO DE: ' + wInicial + ' ATE: ' + wFinal;
      if FBancoMovParam.RGPreview.ItemIndex = 0 then
        FRBancoMov_Cheques_CC.QRPrimario.Preview
      else
        FRBancoMov_Cheques_CC.QRPrimario.Print;
      QRBancoMov_Cheques_CC.Close;
      FRBancoMov_Cheques_CC.Release;
      FRBancoMov_Cheques_CC := nil;
    end;
  end;
  FBancoMovParam.Release;
  FBancoMovParam := nil;
end;

procedure TFBancosMovCad.SaldosBancos1Click(Sender: TObject);
var
  winicial: string;
begin
  inherited;
  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[2].TabVisible := True;
  if FBancoMovParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRBancoMov_SaldosBanco.Close;

      if Trim(FBancoMovParam.ME2DtSaldo.Text) = '' then
        raise Exception.Create('Campo Data Para Saldo Deve Ser Preenchido');
      QRBancoMov_SaldosBanco.SetVariable('DATA_SALDO', StrToDate(FBancoMovParam.ME2DtSaldo.Text));
      QRBancoMov_SaldosBanco.SetVariable('IND_BAIXA_CHEQUE', 'IND_BAIXA_CHEQUE='+QuoteDStr('N'));
      winicial := DateToStr(StrToDate(FBancoMovParam.ME2DtSaldo.Text));

      QRBancoMov_SaldosBanco.Open;
      if FRBancosMov_SaldosBanco = nil then
        FRBancosMov_SaldosBanco := TFRBancosMov_SaldosBanco.Create(Application);
      FRBancosMov_SaldosBanco.QRLPeriodo.Caption := 'SALDO: ' + wInicial;
      if FBancoMovParam.RGPreview.ItemIndex = 0 then
        FRBancosMov_SaldosBanco.QRPrimario.Preview
      else
        FRBancosMov_SaldosBanco.QRPrimario.Print;
      QRBancoMov_SaldosBanco.Close;
      FRBancosMov_SaldosBanco.Release;
      FRBancosMov_SaldosBanco := nil;
    end;
  end;
  FBancoMovParam.Release;
  FBancoMovParam := nil;
end;

procedure TFBancosMovCad.ResumodeLanamentos1Click(Sender: TObject);
var
  winicial, wfinal: string;
begin
  inherited;
  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[3].TabVisible := True;
  if FBancoMovParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRBancoMov_Lanc.Close;
      if Trim(FBancoMovParam.ME3DtInicial.Text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Preenchido');
      QRBancoMov_Lanc.SetVariable('DT_INICIAL', StrToDate(FBancoMovParam.ME3DtInicial.Text));
      winicial := DateToStr(StrToDate(FBancoMovParam.ME3DtInicial.Text));

      if Trim(FBancoMovParam.ME3DtFinal.text) = '' then
        raise Exception.Create('Campo Data Final Deve Ser Preenchido');
      QRBancoMov_Lanc.SetVariable('DT_FINAL', StrToDate(FBancoMovParam.ME3DtFinal.text));
      wfinal := DateToStr(StrToDate(FBancoMovParam.ME3DtFinal.text));
      if Trim(FBancoMovParam.ME3CodBanco.text) <> '' then
        QRBancoMov_Lanc.SetVariable('COD_BANCO_AGENCIA', StrToInt(Trim(FBancoMovParam.ME3CodBanco.text)))
      else
        QRBancoMov_Lanc.SetVariable('COD_BANCO_AGENCIA', Null);
      if Trim(FBancoMovParam.ME3CodContaCorrente.Text) <> '' then
        QRBancoMov_Lanc.SetVariable('COD_CONTA_CORRENTE', StrToInt(Trim(FBancoMovParam.ME3CodContaCorrente.Text)))
      else
        QRBancoMov_Lanc.SetVariable('COD_CONTA_CORRENTE', Null);
      if Trim(FBancoMovParam.ME3CodHistorico.Text) <> '' then
        QRBancoMov_Lanc.SetVariable('COD_HISTORICO', StrToInt(Trim(FBancoMovParam.ME3CodHistorico.Text)))
      else
        QRBancoMov_Lanc.SetVariable('COD_HISTORICO', Null);
      if Trim(FBancoMovParam.ME3Departamento.Text) <> '' then
        QRBancoMov_Lanc.SetVariable('COD_DEPARTAMENTO', StrToInt(Trim(FBancoMovParam.ME3Departamento.Text)))
      else
        QRBancoMov_Lanc.SetVariable('COD_DEPARTAMENTO', Null);

      QRBancoMov_Lanc.Open;

      if FRBancosMov_Lanc = nil then
        FRBancosMov_Lanc := TFRBancosMov_Lanc.Create(Application);
      FRBancosMov_Lanc.QRLPeriodo.Caption := 'PERIODO DE: ' + wInicial + ' ATE: ' + wFinal;
      if FBancoMovParam.RGPreview.ItemIndex = 0 then
        FRBancosMov_Lanc.QRPrimario.Preview
      else
        FRBancosMov_Lanc.QRPrimario.Print;
      QRBancoMov_Lanc.Close;
      FRBancosMov_Lanc.Release;
      FRBancosMov_Lanc := nil;
    end;
  end;
  FBancoMovParam.Release;
  FBancoMovParam := nil;
end;

procedure TFBancosMovCad.RelaodeMovimentosSaldos1Click(Sender: TObject);
var
  winicial, wfinal: string;
begin
  inherited;
  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[4].TabVisible := True;
  if FBancoMovParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRBancoMov_MovSaldos.Close;
      QRBancoMov_SaldosBanco.Close;
      if Trim(FBancoMovParam.ME4DtInicial.Text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Preenchido');
      QRBancoMov_MovSaldos.SetVariable('DT_INICIAL', StrToDate(FBancoMovParam.ME4DtInicial.Text));
      QRBancoMov_SaldosBanco.SetVariable('DATA_SALDO', (StrToDate(FBancoMovParam.ME4DtInicial.Text)) - 1);
      winicial := DateToStr(StrToDate(FBancoMovParam.ME4DtInicial.Text));

      if Trim(FBancoMovParam.ME4DtFinal.text) = '' then
        raise Exception.Create('Campo Data Final Deve Ser Preenchido');
      QRBancoMov_MovSaldos.SetVariable('DT_FINAL', StrToDate(Trim(FBancoMovParam.ME4DtFinal.text)));
      wfinal := DateToStr(StrToDate(FBancoMovParam.ME4DtFinal.text));

      if Trim(FBancoMovParam.ME4CodBanco.text) <> '' then
        QRBancoMov_MovSaldos.SetVariable('COD_BANCO_AGENCIA', StrToInt(Trim(FBancoMovParam.ME4CodBanco.text)))
      else
        QRBancoMov_MovSaldos.SetVariable('COD_BANCO_AGENCIA', Null);

      if Trim(FBancoMovParam.ME4CodContaCorrente.Text) <> '' then
        QRBancoMov_MovSaldos.SetVariable('COD_CONTA_CORRENTE', StrToInt(Trim(FBancoMovParam.ME4CodContaCorrente.Text)))
      else
        QRBancoMov_MovSaldos.SetVariable('COD_CONTA_CORRENTE', Null);

      if FBancoMovParam.Cb4Conciliacao.Checked then
        QRBancoMov_MovSaldos.SetVariable('CONCILIACAO_MOVIMENTO', 'S')
      else
        QRBancoMov_MovSaldos.SetVariable('CONCILIACAO_MOVIMENTO', 'N');
      If FBancoMovParam.Rg4ChequeBaixado.ItemIndex = 0 Then
       Begin
         QRBancoMov_MovSaldos.SetVariable('IND_BAIXA_CHEQUE', '0 = 0');
         QRBancoMov_SaldosBanco.SetVariable('IND_BAIXA_CHEQUE', '0 = 0');
       End
      Else
       Begin
         QRBancoMov_MovSaldos.SetVariable('IND_BAIXA_CHEQUE', 'BMOV.IND_BAIXA_CHEQUE = '+Chr(39) + 'N' + Chr(39));
         QRBancoMov_SaldosBanco.SetVariable('IND_BAIXA_CHEQUE', 'T1.IND_BAIXA_CHEQUE = '+Chr(39) + 'N' + Chr(39));
       End;
      QRBancoMov_MovSaldos.Open;
      QRBancoMov_SaldosBanco.Open;

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AVEMED' then
      begin
        if FRBancosMov_MovSaldosAvemed = nil then
          FRBancosMov_MovSaldosAvemed := TFRBancosMov_MovSaldosAvemed.Create(Application);
        FRBancosMov_MovSaldosAvemed.QRLPeriodo.Caption := 'PERIODO DE: ' + wInicial + ' ATÉ: ' + wFinal;
        if FBancoMovParam.RGPreview.ItemIndex = 0 then
          FRBancosMov_MovSaldosAvemed.QRPrimario.Preview
        else
          FRBancosMov_MovSaldosAvemed.QRPrimario.Print;
      end
      else
      begin
        if FRBancosMov_MovSaldos = nil then
          FRBancosMov_MovSaldos := TFRBancosMov_MovSaldos.Create(Application);
        FRBancosMov_MovSaldos.QRLPeriodo.Caption := 'PERIODO DE: ' + wInicial + ' ATÉ: ' + wFinal;
        if FBancoMovParam.RGPreview.ItemIndex = 0 then
          FRBancosMov_MovSaldos.QRPrimario.Preview
        else
          FRBancosMov_MovSaldos.QRPrimario.Print;
      end;
      QRBancoMov_MovSaldos.Close;
      QRBancoMov_SaldosBanco.Close;
      FRBancosMov_MovSaldos.Release;
      FRBancosMov_MovSaldos := nil;
    end;
  end;
  FBancoMovParam.Release;
  FBancoMovParam := nil;
end;

procedure TFBancosMovCad.ListadeChequesPredatados1Click(Sender: TObject);
var
  winicial, wfinal: string;
begin
  inherited;
  if FBancoMovParam = nil then
     FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[5].TabVisible := True;
  if FBancoMovParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRBancoMov_Cheques_PD.Close;
      if Trim(FBancoMovParam.ME5CodBanco.Text) <> '' then
         QRBancoMov_Cheques_PD.SetVariable('COD_BANCO', StrToInt(Trim(FBancoMovParam.ME5CodBanco.Text)))
      else
         QRBancoMov_Cheques_PD.SetVariable('COD_BANCO', Null);

      if Trim(FBancoMovParam.ME5CodContaCorrente.Text) <> '' then
         QRBancoMov_Cheques_PD.SetVariable('COD_CONTA_CORRENTE', StrToInt(Trim(FBancoMovParam.ME5CodContaCorrente.Text)))
      else
         QRBancoMov_Cheques_PD.SetVariable('COD_CONTA_CORRENTE', Null);
      if Trim(FBancoMovParam.Me5CodHistorico.Text) <> '' then
         QRBancoMov_Cheques_PD.SetVariable('COD_HISTORICO', StrToInt(Trim(FBancoMovParam.ME5CodHistorico.Text)))
      else
         QRBancoMov_Cheques_PD.SetVariable('COD_HISTORICO', Null);
      if Trim(FBancoMovParam.Me5Cadastro.Text) <> '' then
         QRBancoMov_Cheques_PD.SetVariable('COD_CADASTRO', StrToInt(Trim(FBancoMovParam.Me5Cadastro.Text)))
      else
         QRBancoMov_Cheques_PD.SetVariable('COD_CADASTRO', Null);
      if Trim(FBancoMovParam.Me5Vendedor.Text) <> '' then
         QRBancoMov_Cheques_PD.SetVariable('COD_VENDEDOR', StrToInt(Trim(FBancoMovParam.Me5Vendedor.Text)))
      else
         QRBancoMov_Cheques_PD.SetVariable('COD_VENDEDOR', Null);
      if Trim(FBancoMovParam.ME5DtInicial.Text) = '' then
         raise Exception.Create('Campo Data Inicial Deve Ser Preenchido');
      QRBancoMov_Cheques_PD.SetVariable('DT_INICIAL', StrToDate(FBancoMovParam.ME5DtInicial.Text));
      winicial := DateToStr(StrToDate(FBancoMovParam.ME5DtInicial.Text));

      if Trim(FBancoMovParam.ME5DtFinal.text) = '' then
         raise Exception.Create('Campo Data Final Deve Ser Preenchido');
      QRBancoMov_Cheques_PD.SetVariable('DT_FINAL', StrToDate(FBancoMovParam.ME5DtFinal.text));
      wfinal := DateToStr(StrToDate(FBancoMovParam.ME5DtFinal.text));

      QRBancoMov_Cheques_PD.SQL[QRBancoMov_Cheques_PD.SQL.Count - 1] := ''; // elimina a última Linha da SQL
      case FBancoMovParam.RG5Ordem.ItemIndex of
        0: DMBancoAgenciaRel.QRBancoMov_Cheques_PD.SQL.Add('ORDER BY TB_BANCO_AGENCIA.COD_BANCO_AGENCIA, T1.DT_MOVIMENTO');
        1: DMBancoAgenciaRel.QRBancoMov_Cheques_PD.SQL.Add('ORDER BY TB_BANCO_AGENCIA.COD_BANCO_AGENCIA, T1.COD_HISTORICO');
        2: DMBancoAgenciaRel.QRBancoMov_Cheques_PD.SQL.Add('ORDER BY TB_BANCO_AGENCIA.COD_BANCO_AGENCIA, TB_CADASTRO.NOME');
        3: DMBancoAgenciaRel.QRBancoMov_Cheques_PD.SQL.Add('ORDER BY TB_BANCO_AGENCIA.COD_BANCO_AGENCIA, T1.COD_BCO_MOVIMENTO');
      end;

      QRBancoMov_Cheques_PD.Open;

      if FRBancoMov_ChequesPD = nil then
         FRBancoMov_ChequesPD := TFRBancoMov_ChequesPD.Create(Application);
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERMED' then
      begin
        FRBancoMov_ChequesPD.QrLabel12.Caption := 'Nome';
        FRBancoMov_ChequesPD.QRDBText8.DataField := 'nome';
      end;

      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE' then
      begin
        FRBancoMov_ChequesPD.QRBand4.Height := 33;
      end;

      FRBancoMov_ChequesPD.QRLPeriodo.Caption := 'PERIODO DE: ' + wInicial + ' Até ' + wFinal;
      if Trim(FBancoMovParam.Me5Vendedor.Text) <> '' then
        FRBancoMov_ChequesPD.QRLPeriodo.Caption := FRBancoMov_ChequesPD.QRLPeriodo.Caption + '  Vendedor:' + FBancoMovParam.Ed5Vendedor.Text;
      if FBancoMovParam.RGPreview.ItemIndex = 0 then
         FRBancoMov_ChequesPD.QRPrimario.Preview
      else
         FRBancoMov_ChequesPD.QRPrimario.Print;
      QRBancoMov_Cheques_PD.Close;
      FRBancoMov_ChequesPD.Release;
      FRBancoMov_ChequesPD := nil;
    end;
  end;
  FBancoMovParam.Release;
  FBancoMovParam := nil;
end;

procedure TFBancosMovCad.EmiteCpiadeCheque1Click(Sender: TObject);
begin
  inherited;
  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[6].TabVisible := True;
  if FBancoMovParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRBancoMov_CopCheque.Close;
      if Trim(FBancoMovParam.ME6CodBanco.Text) <> '' then
        QRBancoMov_CopCheque.SetVariable('COD_BANCO_AGENCIA', StrToInt(Trim(FBancoMovParam.ME6CodBanco.Text)))
      else
        QRBancoMov_CopCheque.SetVariable('COD_BANCO_AGENCIA', Null);

      if Trim(FBancoMovParam.ME6CodContaCorrente.Text) <> '' then
        QRBancoMov_CopCheque.SetVariable('COD_CONTA_CORRENTE', StrToInt(Trim(FBancoMovParam.ME6CodContaCorrente.Text)))
      else
        QRBancoMov_CopCheque.SetVariable('COD_CONTA_CORRENTE', Null);

      if Trim(FBancoMovParam.ME6DtInicial.Text) <> '' then
        QRBancoMov_CopCheque.SetVariable('DT_INICIAL', StrToDate(FBancoMovParam.ME6DtInicial.Text))
      else
        QRBancoMov_CopCheque.SetVariable('DT_INICIAL', Null);

      if Trim(FBancoMovParam.ME6DtFinal.text) <> '' then
        QRBancoMov_CopCheque.SetVariable('DT_FINAL', StrToDate(FBancoMovParam.ME6DtFinal.text))
      else
        QRBancoMov_CopCheque.SetVariable('DT_FINAL', Null);

      if Trim(FBancoMovParam.ME6NrCheque.text) <> '' then
        QRBancoMov_CopCheque.SetVariable('NUM_CHEQUE', StrToInt(Trim(FBancoMovParam.ME6NrCheque.text)))
      else
        QRBancoMov_CopCheque.SetVariable('NUM_CHEQUE', Null);

      QRBancoMov_CopCheque.Open;

      if FRBancoMov_CopCheque = nil then
        FRBancoMov_CopCheque := TFRBancoMov_CopCheque.Create(Application);
      if FBancoMovParam.RGPreview.ItemIndex = 0 then
        FRBancoMov_CopCheque.QRPrimario.Preview
      else
        FRBancoMov_CopCheque.QRPrimario.Print;
      QRBancoMov_CopCheque.Close;
//        FRBancoMov_CopCheque.Release;
//        FRBancoMov_CopCheque := Nil;
    end;
  end;
  FBancoMovParam.Release;
  FBancoMovParam := nil;
end;

procedure TFBancosMovCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DBEdit4.SetFocus;
  Ed1Historico.Text := '';
  EdHistorico.Text := '';
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL' then
    DBENrCheque.SetFocus;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE' then
  begin
    DBEdit5.SetFocus;
  end;
end;

procedure TFBancosMovCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(4);
end;

procedure TFBancosMovCad.RelaodeChequesPrDatados1Click(Sender: TObject);
begin
  inherited;
  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[7].TabVisible := True;
  if FBancoMovParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRCheques_Baixados.Close;

      if Trim(FBancoMovParam.ME7DtInicial.Text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Preenchido');
      QRCheques_Baixados.SetVariable('DATA_I', StrToDate(FBancoMovParam.ME7DtInicial.Text));

      if Trim(FBancoMovParam.ME7DtFinal.text) = '' then
        raise Exception.Create('Campo Data Final Deve Ser Preenchido');
      QRCheques_Baixados.SetVariable('DATA_F', StrToDate(FBancoMovParam.ME7DtFinal.text));

      if Trim(FBancoMovParam.ME7CodBanco.text) = '' then
        QRCheques_Baixados.SetVariable('COD_BANCO_DESTINO', null)
      else
        QRCheques_Baixados.SetVariable('COD_BANCO_DESTINO', Trim(FBancoMovParam.ME7CodBanco.text));


      if FBancoMovParam.RG7TipoCheque.ItemIndex = 0 then
        QRCheques_Baixados.SetVariable('IND_TIPO_CHEQUE', null);
      if FBancoMovParam.RG7TipoCheque.ItemIndex = 1 then
        QRCheques_Baixados.SetVariable('IND_TIPO_CHEQUE', 'NORMAL');
      if FBancoMovParam.RG7TipoCheque.ItemIndex = 2 then
        QRCheques_Baixados.SetVariable('IND_TIPO_CHEQUE', 'CUSTODIA');
      if FBancoMovParam.RG7TipoCheque.ItemIndex = 3 then
        QRCheques_Baixados.SetVariable('IND_TIPO_CHEQUE', 'DESCONTO');
      if FBancoMovParam.RG7TipoCheque.ItemIndex = 4 then
        QRCheques_Baixados.SetVariable('IND_TIPO_CHEQUE', 'DEPOSITO');

      QRCheques_Baixados.Open;
      if FRCheques_Baixados = nil then
        FRCheques_Baixados := TFRCheques_Baixados.Create(Application);
      FRCheques_Baixados.QRLTitulo.Caption := 'Relação de Cheques Baixados no período de ' + (FBancoMovParam.ME7DtInicial.Text) +
        ' até ' + (FBancoMovParam.ME7DtFinal.text);
      if FBancoMovParam.RGPreview.ItemIndex = 0 then
        FRCheques_Baixados.QRPrimario.Preview
      else
        FRCheques_Baixados.QRPrimario.Print;
      QRCheques_Baixados.Close;
      FRCheques_Baixados.Release;
      FRCheques_Baixados := nil;
    end;
  end;
  FBancoMovParam.Release;
  FBancoMovParam := nil;
end;

procedure TFBancosMovCad.BtDepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = mrOk then
    DMBancoAgencia.QBancoMovimentoCOD_DEPARTAMENTO.Value := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Value;
end;

procedure TFBancosMovCad.RelaodeHistrico1Click(Sender: TObject);
begin
  inherited;
  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[8].TabVisible := True;
  if FBancoMovParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRMov_Historico.Close;
      if Trim(FBancoMovParam.ME8DtInicial.Text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Preenchido');
      QRMov_Historico.SetVariable('DATA_I', StrToDate(FBancoMovParam.ME8DtInicial.Text));

      if Trim(FBancoMovParam.ME8DtFinal.text) = '' then
        raise Exception.Create('Campo Data Final Deve Ser Preenchido');
      QRMov_Historico.SetVariable('DATA_F', StrToDate(FBancoMovParam.ME8DtFinal.text));

      if Trim(FBancoMovParam.ME8CodContaCorrente.Text) <> '' then
        QRMov_Historico.SetVariable('CONTA_CORRENTE', StrToInt(Trim(FBancoMovParam.ME8CodContaCorrente.Text)))
      else
        QRMov_Historico.SetVariable('CONTA_CORRENTE', Null);

      if Trim(FBancoMovParam.ME8CodHistorico.Text) <> '' then
        QRMov_Historico.SetVariable('HISTORICO', StrToInt(Trim(FBancoMovParam.ME8CodHistorico.Text)))
      else
        QRMov_Historico.SetVariable('HISTORICO', Null);

      if Trim(FBancoMovParam.ME8CodDepartamento.Text) <> '' then
        QRMov_Historico.SetVariable('DEPARTAMENTO', StrToInt(Trim(FBancoMovParam.ME8CodDepartamento.Text)))
      else
        QRMov_Historico.SetVariable('DEPARTAMENTO', Null);

      QRMov_Historico.Open;
      if FRMov_Historico = nil then
        FRMov_Historico := TFRMov_Historico.Create(Application);

      FRMov_Historico.QRLTitulo.Caption := 'Movimentação de Histórico no período de ' + (FBancoMovParam.ME8DtInicial.Text) +
        ' até ' + (FBancoMovParam.ME8DtFinal.text);
      if FBancoMovParam.RGPreview.ItemIndex = 0 then
        FRMov_Historico.QRPrimario.Preview
      else
        FRMov_Historico.QRPrimario.Print;
      QRMov_Historico.Close;
      FRMov_Historico.Release;
      FRMov_Historico := nil;
    end;
  end;
  FBancoMovParam.Release;
  FBancoMovParam := nil;
end;

procedure TFBancosMovCad.Ed1HistoricoExit(Sender: TObject);
begin
  inherited;
  if Trim(Ed1Historico.Text) <> '' then
    EdHistorico.Text := DMOracle.BuscaNome('SELECT DESC_HISTORICO_CONTABIL FROM TB_HISTORICO_CONTABIL', 'COD_HISTORICO_CONTABIL = ' + Ed1Historico.Text);
end;

procedure TFBancosMovCad.BtObservacaoClick(Sender: TObject);
begin
  inherited;
  if FHistContabilCons = nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  if FHistContabilCons.ShowModal = mrOk then
  begin
    EdHistorico.Text := DMHistContabil.QHistContabilConsDesc_Historico_Contabil.Value;
    Ed1Historico.Text := DMHistContabil.QHistContabilConsCod_Historico_Contabil.Text;
  end;
  FHistContabilCons.Release;
  FHistContabilCons := nil;
end;

procedure TFBancosMovCad.CancelarCheque1Click(Sender: TObject);
var
  wNumDoc: Integer;
  wComando: string;
begin
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMBancoAgencia.QBancoMovimentoDt_Movimento.Value then
    raise Exception.Create('Não é Permitido Cancelar Cheque - Fechamento Contabil');

  if MessageDlg('Cancelar Este Registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if (DMBancoAgencia.QBancoMovimentoCod_Nota_Cab.isNull) and
      (DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.IsNull) and
      (DMBancoAgencia.QBancoMovimentoCod_Conta_Pagar_Cab.IsNull) then
    begin
      if not (DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.IsNull) then
      begin
        DMOracle.DBCemapa.StartTransaction;
        try
          wNumDoc := DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
          DMPlanilha.Descontabiliza(wNumDoc, 'BC');
          with DMOracle do
          begin
            QExecSQL.Close;
            QExecSQL.SQL.Clear;
            wComando := 'DELETE FROM TB_CAIXA_MOV ';
            wComando := wComando + ' WHERE COD_BCO_MOVIMENTO = ' + CHR(39) + DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Text + CHR(39);
            wComando := wComando + ' AND DT_MOVIMENTO = ' + CHR(39) + DMBancoAgencia.QBancoMovimentoDt_Movimento.Text + Chr(39);
            QExecSQL.SQL.Add(wComando);
            QExecSQL.ExecSQL;
          end;
          DMBancoAgencia.QExcluiConcilia.Close; // volta movimento de conciliação
          DMBancoAgencia.QExcluiConcilia.SetVariable('COD_BCO_MOVIMENTO', DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value);
          DMBancoAgencia.QExcluiConcilia.ExecSQL;
          DMBancoAgencia.QBancoMovimento.Edit;
          DMBancoAgencia.QBancoMovimentoVal_Movimento.Value := 0;
          DMBancoAgencia.QBancoMovimento.Post;
          DMOracle.DBCemapa.Commit;
        except
          DMOracle.DBCemapa.Rollback;
          raise Exception.Create('Erro ! Não Foi Possível Cancelar Este Registro');
        end;
      end;
    end
    else
      MessageDlg('Não é Possível Excluir um Registro de Movimento gerado pela Nota, Contas a Pagar ou Contas a Receber', mtWarning, [mbOk], 0);
  end;
end;

procedure TFBancosMovCad.NrChequesEmitidos1Click(Sender: TObject);
begin
  inherited;
  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[9].TabVisible := True;
  if FBancoMovParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRBancosNrCheques.Close;
      if Trim(FBancoMovParam.ME9DataI.Text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Preenchido');
      QRBancosNrCheques.SetVariable('DATA_I', StrToDate(FBancoMovParam.ME9DataI.Text));

      if Trim(FBancoMovParam.ME9DataF.text) = '' then
        raise Exception.Create('Campo Data Final Deve Ser Preenchido');
      QRBancosNrCheques.SetVariable('DATA_F', StrToDate(FBancoMovParam.ME9DataF.text));

      QRBancosNrCheques.Open;
      if FRBancosNrCheques = nil then
        FRBancosNrCheques := TFRBancosNrCheques.Create(Application);

      FRBancosNrCheques.QRLTitulo.Caption := 'Número de Cheques Emitidos no período de ' + (FBancoMovParam.ME9DataI.Text) + ' até ' + (FBancoMovParam.ME9DataF.text);
      if FBancoMovParam.RGPreview.ItemIndex = 0 then
        FRBancosNrCheques.QRPrimario.Preview
      else
        FRBancosNrCheques.QRPrimario.Print;
      FRBancosNrCheques.Close;

      FRBancosNrCheques.Release;
      FRBancosNrCheques := nil;
    end;
  end;
  FBancoMovParam.Release;
  FBancoMovParam := nil;
end;

procedure TFBancosMovCad.SBAlterarClick(Sender: TObject);
var
  wNumDoc: Integer;
  wComando: string;
begin
  if DMParamSistema.QParamSistemaDt_Fechamento_Financeiro.Value >= DMBancoAgencia.QBancoMovimentoDt_Movimento.Value then
    raise Exception.Create('Não é Permitido Voltar Confirmação - Fechamento Contabil');
//  if Not (DMBancoAgencia.QBancoMovimentoCod_Nota_Cab.isNull) Then
//     raise Exception.Create('Não é Permitido Alterar Movimento Gerado por uma Nota Fiscal');
  if (DMParamSistema.CodEmpresa <> 'TOMATESMI') then
  begin
    if not (DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.IsNull) then
      raise Exception.Create('Não é Permitido Alterar Movimento Gerado por um Contas a Receber');
    if not (DMBancoAgencia.QBancoMovimentoCod_Conta_Pagar_Cab.IsNull) then
      raise Exception.Create('Não é Permitido Alterar Movimento Gerado por um Contas a Pagar');
  end;
  if MessageDlg('Alterar este Lançamento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if not (DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.IsNull) then
    begin
      DMOracle.DBCemapa.StartTransaction;
      try
        wNumDoc := DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
        DMPlanilha.Descontabiliza(wNumDoc, 'BC');
        with DMOracle do
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'DELETE FROM TB_CAIXA_MOV ';
          wComando := wComando + ' WHERE COD_BCO_MOVIMENTO = ' + FloatToStr(DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value);
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;

    {           QExecSQL.Close;    FOI COLOCADO TRIGGER
           QExecSQL.SQL.Clear;
           wComando := 'DELETE FROM TB_BCO_CONCILIA ';
           wComando := wComando + ' WHERE COD_BCO_MOVIMENTO = '+FloatToStr(DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value);
           QExecSQL.SQL.Add(wComando);
           QExecSQL.ExecSQL;     }

{           QExecSQL.Close;    FOI COLOCADO TRIGGER
           QExecSQL.SQL.Clear;
           wComando := 'DELETE FROM TB_FLUXO_CAIXA ';
           wComando := wComando + ' WHERE COD_BCO_MOVIMENTO = '+FloatToStr(DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value);
           QExecSQL.SQL.Add(wComando);
           QExecSQL.ExecSQL;  }
        end;
        DMOracle.DBCemapa.Commit;
        DSPrimario.DataSet.Edit;
      except
        DMOracle.DBCemapa.Rollback;
        raise Exception.Create('Erro ! Não foi possível excluir este Registro');
      end;
    end;
  end;
end;

procedure TFBancosMovCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMBancoAgencia.QBancoMovimento.Close;
//  VaComm1.close;
  Action := caFree;
  FBancosMovCad := nil;
end;

procedure TFBancosMovCad.DBEdit8Exit(Sender: TObject);
begin
  inherited;
  If DMParamSistema.QParamSistemaIND_CONTABILIZA.Value = 'S' Then
     DMBancoAgencia.QBancoMovimentoDESC_COMPLEMENTO1.Value := DMBancoAgencia.QBancoMovimentoDesc_Observacao.Value;
end;

procedure TFBancosMovCad.Chequesprdatadospendentes1Click(Sender: TObject);
begin
  inherited;
  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[10].TabVisible := True;
  if FBancoMovParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRChequePDatadoPendente.Close;
      if Trim(FBancoMovParam.ME10CodBanco.Text) <> '' then
        QRChequePDatadoPendente.SetVariable('COD_BANCO_AGENCIA', StrToInt(Trim(FBancoMovParam.ME10CodBanco.Text)))
      else
        QRChequePDatadoPendente.SetVariable('COD_BANCO_AGENCIA', Null);
      if Trim(FBancoMovParam.ME10CodContaCorrente.Text) <> '' then
        QRChequePDatadoPendente.SetVariable('COD_CONTA_CORRENTE', StrToInt(Trim(FBancoMovParam.ME10CodContaCorrente.Text)))
      else
        QRChequePDatadoPendente.SetVariable('COD_CONTA_CORRENTE', Null);
      if Trim(FBancoMovParam.Me10CodHistorico.Text) <> '' then
        QRChequePDatadoPendente.SetVariable('COD_HISTORICO', StrToInt(Trim(FBancoMovParam.ME10CodHistorico.Text)))
      else
        QRChequePDatadoPendente.SetVariable('COD_HISTORICO', Null);
      QRChequePDatadoPendente.SetVariable('DT_INICIAL', FBancoMovParam.Me10DtInicial.Text);
      QRChequePDatadoPendente.SetVariable('DT_FINAL', FBancoMovParam.Me10DtFinal.Text);
      QRChequePDatadoPendente.Open;
      if FRChequePDatadoPendente = nil then
        FRChequePDatadoPendente := TFRChequePDatadoPendente.Create(Application);

      if trim(FBancoMovParam.ME10CodBanco.Text) = '' then
      begin
        FRChequePDatadoPendente.QRDBText1.DataField := 'Todos';
        FRChequePDatadoPendente.QRDBText2.DataField := 'Todos';
      end;
      if trim(FBancoMovParam.ME10CodContaCorrente.Text) = '' then
      begin
        FRChequePDatadoPendente.QRDBText4.DataField := 'Todos';
        FRChequePDatadoPendente.QRDBText9.DataField := 'Todos';
      end;

      FRChequePDatadoPendente.QrlTitulo.Caption := 'Relação de Cheques Pré-datados Pendentes de ' + FBancoMovParam.Me10DtInicial.Text + ' Até ' + FBancoMovParam.Me10DtFinal.Text;
      if FBancoMovParam.RGPreview.ItemIndex = 0 then
        FRChequePDatadoPendente.QRPrimario.Preview
      else
        FRChequePDatadoPendente.QRPrimario.Print;
      QRChequePDatadoPendente.Close;
      FRChequePDatadoPendente.Release;
      FRChequePDatadoPendente := nil;
    end;
  end;
end;


procedure TFBancosMovCad.GerarArquivoRemessaCheque1Click(Sender: TObject);
var
  S: string;
  F: TextFile;
  wNumContaCorrente, wConta: string;
  wNumContaCorrenteDV: string;
  wAgencia: string;
  wDescAgencia: string;
  wBanco: string;
  wCodFilial: integer;
  wConvenio: string;
  wContadorRegistros, x, I, wPos, wNumArquivo: integer;
  wVal_total_Cheque: real;
  wCMC7: string;
  wAgenciaDV: string;
  wCep: string;
  wComplementoCEP: string;
  wEndereco: string;
  wDescFilial: string;
begin
  wConta := '';
  wContadorRegistros := 0; // Inicializa valor da variavel de contagem de registros
  wVal_total_Cheque := 0;
  x := 1;
  wCep := '';

  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.create(application);
  FBancoMovParam.PGRelatorio.Pages[11].TabVisible := True;
  if FBancoMovParam.showmodal = mrok then
  begin

    wBanco := DMOracle.BuscaNome('SELECT TB_BANCO_AGENCIA.COD_BANCO FROM TB_BANCO_AGENCIA, TB_CONTA_CORRENTE',
      'TB_BANCO_AGENCIA.COD_BANCO_AGENCIA = TB_CONTA_CORRENTE.COD_BANCO_AGENCIA AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + Trim(FBancoMovParam.ME11ContaCorrente.Text));
    wAgencia := DMOracle.BuscaNome('SELECT TB_BANCO_AGENCIA.COD_AGENCIA FROM TB_BANCO_AGENCIA, TB_CONTA_CORRENTE',
      'TB_BANCO_AGENCIA.COD_BANCO_AGENCIA = TB_CONTA_CORRENTE.COD_BANCO_AGENCIA AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + Trim(FBancoMovParam.ME11ContaCorrente.Text));
    wAgenciaDV := DMOracle.BuscaNome('SELECT TB_BANCO_AGENCIA.DIGITO_VERIFICADOR_AGENCIA FROM TB_BANCO_AGENCIA, TB_CONTA_CORRENTE',
      'TB_BANCO_AGENCIA.COD_BANCO_AGENCIA = TB_CONTA_CORRENTE.COD_BANCO_AGENCIA AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + Trim(FBancoMovParam.ME11ContaCorrente.Text));

    wDescAgencia := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA, TB_CONTA_CORRENTE',
      'TB_BANCO_AGENCIA.COD_BANCO_AGENCIA = TB_CONTA_CORRENTE.COD_BANCO_AGENCIA AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + Trim(FBancoMovParam.ME11ContaCorrente.Text));
    wNumContaCorrente := DMOracle.BuscaNome('SELECT NUM_CONTA_CORRENTE FROM TB_CONTA_CORRENTE',
      'TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + Trim(FBancoMovParam.ME11ContaCorrente.Text));
    wCodFilial := StrToInt(DMOracle.BuscaNome('SELECT TB_FILIAL.COD_FILIAL FROM TB_FILIAL, TB_CONTA_CORRENTE',
      'TB_FILIAL.COD_FILIAL = TB_CONTA_CORRENTE.COD_FILIAL AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + Trim(FBancoMovParam.ME11ContaCorrente.Text)));
    wConvenio := DMOracle.BuscaNome('SELECT TB_BANCO_AGENCIA.COD_CONVENIO_CUSTODIA FROM TB_BANCO_AGENCIA, TB_CONTA_CORRENTE',
      'TB_BANCO_AGENCIA.COD_BANCO_AGENCIA = TB_CONTA_CORRENTE.COD_BANCO_AGENCIA AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + Trim(FBancoMovParam.ME11ContaCorrente.Text));
    wNumArquivo := DMSequencia.Sequencia(wCodFilial, 'ARQUIVO_CUSTODIA');

    while (wNumContaCorrente[x] <> '-') and (x < length(wNumContaCorrente)) do
    begin
      wConta := wConta + wNumContaCorrente[x]; //---copia o numero da conta eliminando DV
      inc(x);
    end;

    for x := 1 to length(wNumContaCorrente) do
      if wNumContaCorrente[x] = '-' then //---encontra posicao separador entre a conta e o digito verificador
        wPos := x; //para que possa copiar o dv da conta corrente

    wNumContaCorrenteDV := Copy(wNumContaCorrente, wPos + 1, length(wNumContaCorrente)); //---copia o digito verificador da conta corrente

    wConta := Bib.LimpaString(wConta, '.');
    wConta := Bib.LimpaString(wConta, '-');
    wConta := Bib.LimpaString(wConta, ',');
    wConta := Bib.LimpaString(wConta, ' ');
    wConta := Bib.LimpaString(wConta, '/');

    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('PK', wCodFilial);
    DMFilial.QFilial.Open;

    wEndereco := DMFIlial.QFilialDesc_Endereco.Text;
    wEndereco := Bib.LimpaString(wEndereco, '.');
    wEndereco := Bib.LimpaString(wEndereco, '-');
    wEndereco := Bib.LimpaString(wEndereco, ',');
    wEndereco := Bib.LimpaString(wEndereco, '/');
    wEndereco := Bib.LimpaString(wEndereco, 'º');
    wEndereco := Bib.LimpaString(wEndereco, 'ª');
    wEndereco := Bib.LimpaString(wEndereco, '~');
    wEndereco := Bib.LimpaString(wEndereco, '_');
    wEndereco := Bib.LimpaString(wEndereco, '\');
    wEndereco := uppercase(wEndereco);

    wDescFilial := DMFilial.QFilialDesc_Filial.Text;
    wDescFilial := Bib.LimpaString(wDescFilial, '.');
    wDescFilial := Bib.LimpaString(wDescFilial, '-');
    wDescFilial := Bib.LimpaString(wDescFilial, '&');
    wDescFilial := Bib.LimpaString(wDescFilial, '_');
    wDescFilial := Bib.LimpaString(wDescFilial, 'º');
    wDescFilial := Bib.LimpaString(wDescFilial, 'ª');
    wDescFilial := Bib.LimpaString(wDescFilial, '^');
    wDescFilial := Bib.LimpaString(wDescFilial, '~');
    wDescFilial := Bib.LimpaString(wDescFilial, '/');
    wDescFilial := Bib.LimpaString(wDescFilial, '\');
    wDescFilial := uppercase(wDescFilial);

    while (DMFilial.QFilialDesc_Cep.Text[I] <> '-') and (i < length(DMFilial.QFilialDesc_Cep.Text)) do
    begin
      wCEP := wCEP + DMFilial.QFilialDesc_Cep.Text[I]; //---copia o cep eliminando o complemento
      inc(I);
    end;

    for I := 1 to length(DMFilial.QFilialDesc_Cep.Text) do
      if DMFilial.QFilialDesc_Cep.Text[I] = '-' then //---encontra posicao separador entre o cep o complemento
        wPos := I; //para que possa copiar o complemento do cep

    wComplementoCEP := Copy(DMFilial.QFilialDesc_Cep.Text, wPos + 1, length(DMFilial.QFilialDesc_Cep.Text)); //---copia o digito verificador da conta corrente

    with DMBancoAgencia do
    begin
      QExportaCheque.Close;
      if Trim(FBancoMovParam.ME11CodContaCorrente.Text) = '' then
        QExportaCheque.SetVariable('COD_CONTA_CORRENTE', Null)
      else
        QExportaCheque.SetVariable('COD_CONTA_CORRENTE', FBancoMovParam.ME11CodContaCorrente.Text);
      if FBancoMovParam.RGTipoRemessa.ItemIndex = 0 then
        QExportaCheque.SetVariable('IND_TIPO_CHEQUE', 'CUSTODIA')
      else
        QExportaCheque.SetVariable('IND_TIPO_CHEQUE', 'DESCONTO');
      QExportaCheque.SetVariable('DATA_I', FBancoMovParam.ME11DT_Movimento_I.Text);
      QExportaCheque.SetVariable('DATA_F', FBancoMovParam.ME11DT_Movimento_F.Text);
      QExportaCheque.open;

      S := ''; // Inicializa valor da variavel.
      S := S + RMaskCGC_CPF(wBanco, 3) + // inicio da gravacao do cabeçalho do arquivo
        '0000' +
        '0' +
        '         ' +
        '2' +
        RMaskCGC_CPF(DMFilial.QFilialNUM_CGC.Value, 14) +
        RMaskCGC_CPF(wConvenio, 9) +
        '           ' +
        RMaskCGC_CPF(wAgencia, 5) +
        Bib.FormataTexto(wAgenciaDV, 1) +
        RMaskCGC_CPF(wConta, 12) +
        Bib.FormataTexto(wNumContaCorrenteDV, 1) +
        ' ' {falta DV AG/Con} +
        Bib.FormataTextoEsq(uppercase(wDescFilial), 30) +
        Bib.FormataTexto(uppercase(wDescAgencia), 30) +
        '          ' +
        '1' +
        Bib.FormataTexto(Bib.LimpaString(DateToStr(Date), '/'), 8) +
        Bib.FormataTexto(Bib.LimpaString(TimeToStr(Time), ':'), 6) +
        Bib.FormataTexto(RMaskCGC_CPF(IntToStr(wNumArquivo), 6), 6) + {numero sequencial do arquivo remessa}
        '030' +
        RMaskCGC_CPF('     ', 5) +
        Bib.FormataTexto('', 20) +
        Bib.FormataTexto('', 20) +
        '                   ' +
        Bib.FormataTexto('', 2) +
        Bib.FormataTexto('', 8);
      S := S + Chr(13) + Chr(10); // fim da gravacao do cabeçalho do arquivo

      S := S + RMaskCGC_CPF(wBanco, 3) + //--------- inicio da gravacao do HEADER DE LOTE
        '0001' +
        '1' +
        'R' +
        '07' +
        '01' +
        '020' +
        ' ' +
        '2' +
        RMaskCGC_CPF(DMFilial.QFilialNUM_CGC.Value, 14) +
        RMaskCGC_CPF(wConvenio, 9) +
        '           ' +
        RMaskCGC_CPF(wAgencia, 5) {agencia receptora CH} +
        Bib.FormataTexto(wAgenciaDV, 1) +
        RMaskCGC_CPF(IntToStr(wNumArquivo), 6) +
        RMaskCGC_CPF(wAgencia, 5) +
        Bib.FormataTexto(wAgenciaDV, 1) +
        RMaskCGC_CPF(wConta, 12) +
        RMaskCGC_CPF(wNumContaCorrenteDV, 1) +
        ' ' {DV agencia conta} +
        Bib.FormataTextoEsq(wDescFilial, 30) +
        Bib.FormataTexto(Bib.LimpaString(DateToStr(Date), '/'), 8) +
        '      ' {numero da remessa a q pertence o retorno} +
        '              ' {informacao} +
        Bib.FormataTexto(wEndereco, 30) +
        '00001' {numero da empresa} +
        Bib.FormataTexto(uppercase(DMFIlial.QFilialDesc_Complemento_Endereco.Text), 15) +
        Bib.FormataTexto(uppercase(DMFIlial.QFilialDesc_Cidade.Text), 20) +
        Bib.FormataTexto(Bib.LimpaString(DMFIlial.QFilialDesc_CEP.Text, '-'), 5) +
        Bib.FormataTexto(wComplementoCEP, 3) {complemento CEP} +
        Bib.FormataTexto(DMFIlial.QFilialCod_Estado.Text, 2) +
        '        ' +
        '  ' {CODIGO RETORNO} +
        '        ';
      S := S + Chr(13) + Chr(10); //-----fIM DA GRAVACAO DO HEADER DE LOTE


      while not QExportaCheque.Eof do //----INICIO DA GRAVACAO DOS REGISTROS
      begin
        Inc(wContadorRegistros);
        wCMC7 := Copy(DMBancoAgencia.QExportaChequeDesc_Tarja_Magnetica.Value, 2, length(DMBancoAgencia.QExportaChequeDesc_Tarja_Magnetica.Value) - 1);
        S := S + RMaskCGC_CPF(wBanco, 3) +
          '0001' {lote sequencial} +
          '3' +
          RMaskCGC_CPF(IntToStr(wContadorRegistros), 5) {numero de registros} +
          'N' +
          '0' +
          '02' +
          Bib.FormataTexto(wCMC7, 34) +
          Bib.FormataTexto(QExportaChequeNUM_CGC_CPF_EMITENTE.Value, 14) {CGC Emitente cheque} +
          RMaskCGC_CPF(FloatToStr(QExportaChequeVal_movimento.Value * 100), 15) +
          Bib.FormataTexto(Bib.LimpaString(DateToStr(QExportaChequeDT_BOM_PARA.Value), '/'), 8) +
          '                    ' +
          '000' +
          RMaskCGC_CPF(wBanco, 3) +
          RMaskCGC_CPF(wAgencia, 5) +
//        RMaskCGC_CPF(wAgenciaDV,1)                                                          +
        RMaskCGC_CPF(wAgencia, 5) +
//        RMaskCGC_CPF(wAgenciaDV,1)                                                          +
        RMaskCGC_CPF(wConta, 12) +
//        Bib.FormataTexto(wNumContaCorrenteDV,1)                                             +
        '000000000000000' +
          '000000000000000' +
          '000000000000000' +
          '                                                ' +
          ' ' +
          '  ' +
          '        ';
        S := S + Chr(13) + Chr(10);
        wVal_total_Cheque := (wVal_total_Cheque + QExportaChequeVal_Movimento.Value);
        QExportaCheque.Next;
      end; //------FIM DA GRAVACAO DOS REGISTROS

        //-------INICIO DA GRAVACAO DO TRAILER DE LOTE

      S := S + RMaskCGC_CPF(wBanco, 3) +
        '0001' {seq. lote} +
        '5' +
        '         ' +
        RMaskCGC_CPF(IntToStr(wContadorRegistros + 2), 6) {quant. reg} +
        RMaskCGC_CPF(FloatToStr(wVal_total_Cheque * 100), 18) {Valor total cheque} +
        RMaskCGC_CPF(IntToStr(wContadorRegistros), 6) {quant. cheques} +
        '                                                    ' {CNAB} +
        '                  ' {TOTAL DE JUROS SOBRE DESCONTO} +
        '                  ' {TOTAL DE IOF SOBRE DESCONTO} +
        '                  ' {TOTAL OUTROS ENCARGOS} +
        '      ' {QUANT. PROCESS.} +
        '                  ' {VALOR PROCESSADOD} +
        '                                                               ' {CNAB};
      S := S + Chr(13) + Chr(10); //------FIM GRAVACAO TRAILER DE LOTE

        //-------------INICIO GRAVACAO TRAILER DE ARQUIVO

      S := S + RMaskCGC_CPF(wBanco, 3) + // inicio da gravacao do HEADER DE LOTE
        '9999' {lote DE SERVICO} +
        '9' {REGISTRO TRAILER DE LOTE} +
        '         ' {CNAB} +
        '000001' {QUANT LOTES DO ARQ.} +
        RMaskCGC_CPF(IntToStr(wContadorRegistros + 4), 6) {quant. reg} +
        '000000' {QUANT LOTES DE CONTAS} +
        Bib.FormataTexto(' ', 205) {CNAB};
      S := S + Chr(13) + Chr(10);
        //-------------FIM GRAVACAO TRAILER DE ARQUIVO

      if FBancosMovCad.SaveDialog.Execute then
      begin
        AssignFile(F, FBancosMovCad.SaveDialog.FileName);
        Rewrite(F);
        Writeln(F, S);
        CloseFile(F);
        MessageDlg('Arquivo Gerado com Sucesso!', mtInformation, [mbOk], 0);
      end
      else
        MessageDlg('Arquivo não foi Gerado!', mtWarning, [mbOk], 0);
    end;
  end;
  {if FRelatorioCustodia = nil then
    FRelatorioCustodia:=TFRelatorioCustodia.create(application);
  FRelatorioCustodia.QRPrimario.PreviewModal;}

  if FRGuiaCustodia = nil then
    FRGuiaCustodia := TFRGuiaCustodia.Create(Application);
  FRGuiaCustodia.QRLBDT_Entrega.Caption := DateToStr(Date);
  FRGuiaCustodia.QRLConta.Caption := wNumContaCorrente;
  FRGuiaCustodia.QRLAgencia.Caption := wAgencia + '-' + wAgenciaDV;
  FRGuiaCustodia.QRLAgenciaEntrega.Caption := wAgencia + '-' + wAgenciaDV;
  FRGuiaCustodia.QRLNumRemessa.Caption := IntToStr(wNumArquivo);
  FRGuiaCustodia.QRLConvenio.Caption := FRGuiaCustodia.QRLConvenio.Caption + wConvenio;
  FRGuiaCustodia.QRPrimario.Preview;
  DMFilial.QFilial.Close;
end;

procedure TFBancosMovCad.VaComm1RxChar(Sender: TObject; Count: Integer);
//var  Tmp: string;
begin
  inherited;
//  Tmp := VaComm1.ReadText;
//  DMBancoAgencia.QBancoMovimentoDesc_Tarja_Magnetica.Value:=DMBancoAgencia.QBancoMovimentoDesc_Tarja_Magnetica.Value + Tmp;
  inc(cont);
  if cont > 2 then
  begin
    with DMBancoAgencia do
    begin
      QBancoMovimentoDESC_BANCO.Value := StrToInt(copy(DMBancoAgencia.QBancoMovimentoDesc_Tarja_Magnetica.value, 3, 3));
      QBancoMovimentoDESC_AGENCIA.Value := StrToInt(copy(DMBancoAgencia.QBancoMovimentoDesc_Tarja_Magnetica.value, 6, 4));
      QBancoMovimentoNum_Cheque.value := StrToInt(copy(DMBancoAgencia.QBancoMovimentoDesc_Tarja_Magnetica.value, 15, 6));
      {if QBancoMovimentoDESC_BANCO.Value = 1 then
        QBancoMovimentoDESC_CONTA.Value:=StrToInt(copy(DMBancoAgencia.QBancoMovimentoDesc_Tarja_Magnetica.value,26,8))
      else
        QBancoMovimentoDESC_CONTA.Value:=StrToInt(copy(DMBancoAgencia.QBancoMovimentoDesc_Tarja_Magnetica.value,24,10));}
      if FChequeCad = nil then
        FChequeCad := TFChequeCad.create(application);
      FChequeCad.showmodal;
      if FChequeCad.MEVal_Cheque.Text <> '' then
        QBancoMovimentoVal_Movimento.Value := StrToFloat(Trim(FChequeCad.MEVal_Cheque.Text));
      if FChequeCad.MEDT_BomPara.Text <> '' then
      begin
        QBancoMovimentoDT_BOM_PARA.Value := StrToDate(Trim(FChequeCad.MEDT_BomPara.Text));
        QBancoMovimentoDT_MOVIMENTO.Value := StrToDate(Trim(FChequeCad.MEDT_BomPara.Text));
      end;
      if FChequeCad.MECGC_CPF.Text <> '' then
        QBancoMovimentoNUM_CGC_CPF_EMITENTE.Value := Trim(FChequeCad.MECGC_CPF.Text);
      DBEdit8.SetFocus;
      cont := 0;
    end;
  end;
end;

procedure TFBancosMovCad.FormCreate(Sender: TObject);
begin
  inherited;
//  if UpperCase(DMParamSistema.QParamSistemaIND_LEITURA_CHEQUE.Value) = 'SIM' then
//    VaComm1.Open;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE' then
  begin
    Label24.Visible := True;
    Label25.Visible := True;
    DBEDepartamento.Visible := True;
    DBEHistorico.Visible := True;
  end
  else
  begin
    Label24.Visible := False;
    Label25.Visible := False;
    DBEDepartamento.Visible := False;
    DBEHistorico.Visible := False;
  end;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
  begin
    MMCadSimples.Items[2].Items[2].Enabled := true;
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RAZENTE' then
  begin
    Label11.Visible := False;
    Label13.Visible := False;
    Label14.Visible := False;
    Label15.Visible := False;
    Label16.Visible := False;
    Label18.Visible := False;
    Label19.Visible := False;
    Label20.Visible := False;
    Label21.Visible := False;
    Label23.Visible := False;
    Label24.Visible := False;
    Label25.Visible := False;
    Label26.Visible := False;
    DbEdit14.Visible := False;
    DbEdit15.Visible := False;
    DbEdit16.Visible := False;
    DbEdit18.Visible := False;
    DbEdit11.Visible := False;
    DbEdit12.Visible := False;
    DbDirceu5.Visible := False;
    Ed1Historico.Visible := False;
    DBRadioGroup4.Visible := False;
    DBEDepartamento.Visible := False;
    DBEHistorico.Visible := False;
    DBEdit3.Visible := False;
    DBEdit22.Visible := False;
    DbEdit26.Visible := False;
    DBRadioGroup3.Visible := False;
    DBRadioGroup2.Visible := False;
    BtObservacao.Visible := False;
    EdHistorico.Visible := False;
    DBRadioGroup1.Visible := False;
    Label5.Top := 236;
    Label6.Top := 236;
    Label7.Top := 236;
    Label22.Top := 236;
    DBENrCheque.Top := 252;
    DBEdit6.Top := 252;
    DBEdit7.Top := 252;
    DBEdit25.Top := 252;
    DBDirceu4.Width := 253;
    Label8.Caption := 'Cidade/Agencia/Conta';
    Label9.Caption := 'Nome Emitente Cheque';
    Label10.Caption := 'Repassado Para';
    Label22.Caption := 'Pagado Por';
  end;
end;

procedure TFBancosMovCad.LanamentosGeral1Click(Sender: TObject);
begin
  inherited;
  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[12].TabVisible := True;
  if FBancoMovParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRBanco_Mov_Historico.Close;
      if Trim(FBancoMovParam.ME13CodHistorico.Text) <> '' then
        QRBanco_Mov_Historico.SetVariable('COD_HISTORICO', StrToInt(Trim(FBancoMovParam.ME13CodHistorico.Text)))
      else
        QRBanco_Mov_Historico.SetVariable('COD_HISTORICO', Null);
      if Trim(FBancoMovParam.ME13Serie.Text) <> '' then
        QRBanco_Mov_Historico.SetVariable('COD_SERIE', Trim(FBancoMovParam.Me13Serie.Text))
      else
        QRBanco_Mov_Historico.SetVariable('COD_SERIE', Null);
      if Trim(FBancoMovParam.ME13Data_I.Text) <> '' then
        QRBanco_Mov_Historico.SetVariable('DATA_I', StrToDate(FBancoMovParam.ME13Data_I.Text))
      else
        QRBanco_Mov_Historico.SetVariable('DATA_I', Null);
      if Trim(FBancoMovParam.ME13Data_F.text) <> '' then
        QRBanco_Mov_Historico.SetVariable('DATA_F', StrToDate(FBancoMovParam.ME13Data_F.text))
      else
        QRBanco_Mov_Historico.SetVariable('DATA_F', Null);
      if Trim(FBancoMovParam.ME13Vendedor.Text) <> '' then
        QRBanco_Mov_Historico.SetVariable('VENDEDOR', StrToInt(Trim(FBancoMovParam.ME13Vendedor.Text)))
      else
        QRBanco_Mov_Historico.SetVariable('VENDEDOR', Null);
      if Trim(FBancoMovParam.ME13Departamento.Text) <> '' then
        QRBanco_Mov_Historico.SetVariable('DEPARTAMENTO', StrToInt(Trim(FBancoMovParam.ME13Departamento.Text)))
      else
      begin
        QRBanco_Mov_Historico.SetVariable('DEPARTAMENTO', Null);
        QRBanco_Mov_Historico.SQL[QRBanco_Mov_Historico.SQL.Count - 1] := '';
        QRBanco_Mov_Historico.SQL.Add('ORDER BY T1.COD_DEPARTAMENTO');
      end;
      QRBanco_Mov_Historico.Open;
      if FRMovimentoHistorico = nil then
        FRMovimentoHistorico := TFRMovimentoHistorico.Create(Application);
      FRMovimentoHistorico.QRLPeriodo.Caption := 'PERIODO DE: ' + FBancoMovParam.ME13Data_I.text + ' ATE: ' + FBancoMovParam.ME13Data_F.text;
      FRMovimentoHistorico.QRLVendedor.Caption := 'Vendedor: ' + FBancoMovParam.Ed13Vendedor.text;
      FRMovimentoHistorico.QRLDepartamento.Caption := 'Departamento: ' + FBancoMovParam.Ed13Departamento.text;
      if Trim(FBancoMovParam.ME13Departamento.Text) = '' then
      begin
        FRMovimentoHistorico.QRGroup1.Enabled := true;
        FRMovimentoHistorico.QRBand3.Enabled := true;
      end
      else
      begin
        FRMovimentoHistorico.QRGroup1.Enabled := false;
        FRMovimentoHistorico.QRBand3.Enabled := false;
      end;
      if FBancoMovParam.RGPreview.ItemIndex = 0 then
        FRMovimentoHistorico.QRPrimario.Preview
      else
        FRMovimentoHistorico.QRPrimario.Print;
      QRBanco_Mov_Historico.Close;
        //  FRBancoMov_Cheques_Data := Nil;
    end;
  end;
  FBancoMovParam.Release;
  FBancoMovParam := nil;
end;

procedure TFBancosMovCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if DMBancoAgencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Text = '' then
    raise exception.create('É necessário escolher um cheque!!');
  if FRReciboOS = nil then
    FRReciboOS := TFRReciboOS.Create(Application);
  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK', DMOracle.BuscaNome('SELECT TB_CONTA_CORRENTE.COD_FILIAL FROM TB_CONTA_CORRENTE ',
    ' TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + IntToStr(DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value)));
  DMFilial.QFilial.Open;
  //------------- Inicio preenchimento dos campos label do recibo
  FRReciboOS.QRLCliente.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMBancoAgencia.QBancoMovimentoCod_Cadastro.Value));
  FRReciboOS.QRLValorExtenso.Caption := Bib.Extenso(DMBancoAgencia.QBancoMovimentoVal_Desconto_Taxa.Value, 'REAL');
  FRReciboOS.pValor := DMBancoAgencia.QBancoMovimentoVal_Desconto_Taxa.Value;
  FRReciboOS.QRLNumRecibo.Caption := IntToStr(DMSequencia.Sequencia(DMFilial.QFilialCod_Filial.Value, 'RECIBO'));
  FRReciboOS.QRLReferente.Caption := 'pagamento Taxa desconto Cheque';
  FRReciboOS.QRLData.Caption := DateToStr(DMBancoAgencia.QBancoMovimentoDt_Movimento.Value);
  FRReciboOS.QRLResponsavel.Caption := DMFilial.QFilialDesc_Filial.Value;
  //----------------
  FRReciboOS.QRPrimario.Preview;
  FRReciboOS.QRPrimario.Destroy;
  FRReciboOS := nil;
  DMFilial.QFilial.Close;
end;

procedure TFBancosMovCad.ComissoVendedor1Click(Sender: TObject);
begin
  inherited;
  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[13].TabVisible := True;
  if FBancoMovParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRBcoComissaoVend.Close;
      if Trim(FBancoMovParam.ME14Cod_Vendedor.Text) <> '' then
        QRBcoComissaoVend.SetVariable('COD_VENDEDOR', StrToInt(Trim(FBancoMovParam.ME14Cod_Vendedor.Text)))
      else
        QRBcoComissaoVend.SetVariable('COD_VENDEDOR', null);
      if Trim(FBancoMovParam.Me14Serie.Text) <> '' then
        QRBcoComissaoVend.SetVariable('COD_SERIE', Trim(FBancoMovParam.Me14Serie.Text))
      else
        QRBcoComissaoVend.SetVariable('COD_SERIE', null);
      QRBcoComissaoVend.SetVariable('DATA_I', Trim(FBancoMovParam.ME14DATA_I.Text));
      QRBcoComissaoVend.SetVariable('DATA_F', Trim(FBancoMovParam.ME14DATA_F.Text));
      QRBcoComissaoVend.SetVariable('DT_EMISSAO', Trim(FBancoMovParam.ME14Dt_Emissao.Text));
      QRBcoComissaoVend.SetVariable('DT_EMISSAO_FINAL', Trim(FBancoMovParam.ME14Dt_EmissaoFinal.Text));
      QRBcoComissaoVend.Open;
      if FRBcoComissaoVendedor = nil then
        FRBcoComissaoVendedor := TFRBcoComissaoVendedor.Create(Application);
      FRBcoComissaoVendedor.QRLEmissao.Caption := Trim(FBancoMovParam.ME14Dt_Emissao.Text);
      FRBcoComissaoVendedor.QRLPeriodo.Caption := Trim(FBancoMovParam.ME14DATA_I.Text) + ' Até ' + Trim(FBancoMovParam.ME14DATA_F.Text);
      if FBancoMovParam.RGPreview.ItemIndex = 0 then
        FRBcoComissaoVendedor.QRPrimario.Preview
      else
        FRBcoComissaoVendedor.QRPrimario.Print;
      QRBcoComissaoVend.Close;
      FRBcoComissaoVendedor := nil;
    end;
  end;
end;

procedure TFBancosMovCad.SaldoDirioporContaCorrente1Click(Sender: TObject);
begin
  inherited;
  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[14].TabVisible := True;
  if FBancoMovParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRSaldoDiarioCC.Close;
      if (trim(FBancoMovParam.ME15DtInicial.Text) = '') or (trim(FBancoMovParam.ME15DtFinal.text) = '') then
        raise Exception.Create('Campo Período Deve Ser Preenchido');
      QRSaldoDiarioCC.SetVariable('DT_INICIAL', StrToDate(FBancoMovParam.ME15DtInicial.Text));
      QRSaldoDiarioCC.SetVariable('DT_FINAL', StrToDate(FBancoMovParam.ME15DtFinal.text));

      if Trim(FBancoMovParam.ME15Banco.Text) <> '' then
        QRSaldoDiarioCC.SetVariable('BANCO', StrToInt(Trim(FBancoMovParam.ME15Banco.Text)))
      else
        QRSaldoDiarioCC.SetVariable('BANCO', null);
      if Trim(FBancoMovParam.ME15CC.Text) <> '' then
        QRSaldoDiarioCC.SetVariable('CC', (Trim(FBancoMovParam.ME15CC.Text)))
      else
        QRSaldoDiarioCC.SetVariable('CC', null);
      QRSaldoDiarioCC.Open;
      if FRSaldoDiarioCC = nil then
        FRSaldoDiarioCC := TFRSaldoDiarioCC.Create(Application);
      FRSaldoDiarioCC.pDtReferencia := StrToDate(FBancoMovParam.ME15DtInicial.Text); // property criado dentro do relatorio
      FRSaldoDiarioCC.QRLPeriodo.Caption := 'Periodo:' + (FBancoMovParam.ME15DtInicial.Text) + ' até ' + (FBancoMovParam.ME15DtFinal.text);
      FRSaldoDiarioCC.QRLBanco.Caption := 'Banco:' + (FBancoMovParam.Ed15Banco.Text);
      if FBancoMovParam.RGPreview.ItemIndex = 0 then
        FRSaldoDiarioCC.QRPrimario.Preview
      else
        FRSaldoDiarioCC.QRPrimario.Print;
      QRSaldoDiarioCC.Close;
      FRSaldoDiarioCC.Release;
      FRSaldoDiarioCC := nil;
    end;
  end;
  FBancoMovParam.Release;
  FBancoMovParam := nil;
end;

procedure TFBancosMovCad.ReldeDepsitosPendentes1Click(Sender: TObject);
begin
  inherited;
  if FBancoAgenciaParam = nil then
    FBancoAgenciaParam := TFBancoAgenciaParam.Create(Application);
  FBancoAgenciaParam.PGRelatorio.Pages[2].TabVisible := True;
  if FBancoAgenciaParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRDeposito_Pendente.Close;
      if (trim(FBancoAgenciaParam.ME2DtInicial.Text) = '') or (trim(FBancoAgenciaParam.ME2DtFinal.text) = '') then
        raise Exception.Create('O Campo Data Deve Ser Preenchido');
      QRDeposito_Pendente.SetVariable('DT_INICIAL', StrToDate(FBancoAgenciaParam.ME2DtInicial.Text));
      QRDeposito_Pendente.SetVariable('DT_FINAL', StrToDate(FBancoAgenciaParam.ME2DtFinal.text));
      QRDeposito_Pendente.SetVariable('DT_BASE', StrToDate(FBancoAgenciaParam.ME2DtBase.text));
      if Trim(FBancoAgenciaParam.ME2Banco.Text) <> '' then
        QRDeposito_Pendente.SetVariable('BANCO', StrToInt(Trim(FBancoAgenciaParam.ME2Banco.Text)))
      else
        QRDeposito_Pendente.SetVariable('BANCO', null);
      if Trim(FBancoAgenciaParam.Me2CodFilial.Text) <> '' then
        QRDeposito_Pendente.SetVariable('COD_FILIAL', StrToInt(Trim(FBancoAgenciaParam.Me2CodFilial.Text)))
      else
        QRDeposito_Pendente.SetVariable('COD_FILIAL', null);
      QRDeposito_Pendente.Open;
      if FRDep_Pendente = nil then
        FRDep_Pendente := TFRDep_Pendente.Create(Application);
      FRDep_Pendente.QRLPeriodo.Caption := 'Periodo:' + (FBancoAgenciaParam.ME2DtInicial.Text) + ' até ' + (FBancoAgenciaParam.ME2DtFinal.text) + ' Dt.Base:' + FBancoAgenciaParam.ME2DtBase.text;
      FRDep_Pendente.QRLBanco.Caption := 'Banco:' + (FBancoAgenciaParam.Ed2Banco.Text);
      if FBancoAgenciaParam.RGPreview.ItemIndex = 0 then
        FRDep_Pendente.QRPrimario.Preview
      else
        FRDep_Pendente.QRPrimario.Print;
      QRDeposito_Pendente.Close;
    end;
  end;
end;

procedure TFBancosMovCad.BaixasdeDepsitosPendentes1Click(Sender: TObject);
begin
  inherited;
  if FBancoAgenciaParam = nil then
    FBancoAgenciaParam := TFBancoAgenciaParam.Create(Application);
  FBancoAgenciaParam.PGRelatorio.Pages[3].TabVisible := True;
  if FBancoAgenciaParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRBaixaDep_Pendente.Close;
      if (trim(FBancoAgenciaParam.ME3DtInicial.Text) = '') or (trim(FBancoAgenciaParam.ME3DtFinal.text) = '') then
        raise Exception.Create('O Campo Data Deve Ser Preenchido');
      QRBaixaDep_Pendente.SetVariable('DT_INICIAL', StrToDate(FBancoAgenciaParam.ME3DtInicial.Text));
      QRBaixaDep_Pendente.SetVariable('DT_FINAL', StrToDate(FBancoAgenciaParam.ME3DtFinal.text));
      if Trim(FBancoAgenciaParam.ME3Banco.Text) <> '' then
        QRBaixaDep_Pendente.SetVariable('BANCO', StrToInt(Trim(FBancoAgenciaParam.ME3Banco.Text)))
      else
        QRBaixaDep_Pendente.SetVariable('BANCO', null);
      if Trim(FBancoAgenciaParam.Me3Filial.Text) <> '' then
        QRBaixaDep_Pendente.SetVariable('COD_FILIAL', StrToInt(Trim(FBancoAgenciaParam.Me3Filial.Text)))
      else
        QRBaixaDep_Pendente.SetVariable('COD_FILIAL', null);

      if FBancoAgenciaParam.RG3BaixadoNo.ItemIndex = 0 then
        QRBaixaDep_Pendente.SetVariable('BAIXADO', 'TODOS');
      if FBancoAgenciaParam.RG3BaixadoNo.ItemIndex = 1 then
        QRBaixaDep_Pendente.SetVariable('BAIXADO', 'BANCO');
      if FBancoAgenciaParam.RG3BaixadoNo.ItemIndex = 2 then
        QRBaixaDep_Pendente.SetVariable('BAIXADO', 'CAIXA');

      QRBaixaDep_Pendente.Open;
      if FRBaixaDepositoPendente = nil then
        FRBaixaDepositoPendente := TFRBaixaDepositoPendente.Create(Application);
      FRBaixaDepositoPendente.QRLPeriodo.Caption := 'Periodo:' + (FBancoAgenciaParam.ME3DtInicial.Text) + ' até ' + (FBancoAgenciaParam.ME3DtFinal.text);
      FRBaixaDepositoPendente.QRLBanco.Caption := 'Banco:' + (FBancoAgenciaParam.Ed3Banco.Text);
      if FBancoAgenciaParam.RGPreview.ItemIndex = 0 then
        FRBaixaDepositoPendente.QRPrimario.Preview
      else
        FRBaixaDepositoPendente.QRPrimario.Print;
      QRBaixaDep_Pendente.Close;
    end;
  end;
end;

procedure TFBancosMovCad.ChequesDevolvidos1Click(Sender: TObject);
begin
  inherited;
  if FBancoAgenciaParam = nil then
    FBancoAgenciaParam := TFBancoAgenciaParam.Create(Application);
  FBancoAgenciaParam.PGRelatorio.Pages[4].TabVisible := True;
  if FBancoAgenciaParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRChequeDevolvido.Close;
      if (trim(FBancoAgenciaParam.ME4DtInicial.Text) = '') or (trim(FBancoAgenciaParam.ME4DtFinal.text) = '') then
        raise Exception.Create('O Campo Data Deve Ser Preenchido');
      QRChequeDevolvido.SetVariable('DT_INICIAL', StrToDate(FBancoAgenciaParam.ME4DtInicial.Text));
      QRChequeDevolvido.SetVariable('DT_FINAL', StrToDate(FBancoAgenciaParam.ME4DtFinal.text));
      QRChequeDevolvido.SetVariable('DT_BASE', StrToDate(FBancoAgenciaParam.ME4DtBase.text));
      if Trim(FBancoAgenciaParam.ME4CC.Text) <> '' then
        QRChequeDevolvido.SetVariable('CC', StrToInt(Trim(FBancoAgenciaParam.ME4CC.Text)))
      else
        QRChequeDevolvido.SetVariable('CC', null);
      if Trim(FBancoAgenciaParam.ME4Vendedor.Text) <> '' then
        QRChequeDevolvido.SetVariable('VENDEDOR', StrToInt(Trim(FBancoAgenciaParam.ME4Vendedor.Text)))
      else
        QRChequeDevolvido.SetVariable('VENDEDOR', null);
      if Trim(FBancoAgenciaParam.ME4Departamento.Text) <> '' then
        QRChequeDevolvido.SetVariable('DEPARTAMENTO', StrToInt(Trim(FBancoAgenciaParam.ME4Departamento.Text)))
      else
        QRChequeDevolvido.SetVariable('DEPARTAMENTO', null);

      if Trim(FBancoAgenciaParam.ME4Cadastro.Text) <> '' then
        QRChequeDevolvido.SetVariable('COD_CADASTRO', StrToInt(Trim(FBancoAgenciaParam.ME4Cadastro.Text)))
      else
        QRChequeDevolvido.SetVariable('COD_CADASTRO', null);
      if Trim(FBancoAgenciaParam.Me4CodFilial.Text) <> '' then
        QRChequeDevolvido.SetVariable('COD_FILIAL', StrToInt(Trim(FBancoAgenciaParam.Me4CodFilial.Text)))
      else
        QRChequeDevolvido.SetVariable('COD_FILIAL', null);

      QRChequeDevolvido.Open;
      if FRChequeDevolvido = nil then
        FRChequeDevolvido := TFRChequeDevolvido.Create(Application);
      FRChequeDevolvido.QRLPeriodo.Caption := 'Periodo:' + (FBancoAgenciaParam.ME4DtInicial.Text) + ' até ' + (FBancoAgenciaParam.ME4DtFinal.text) + ' Dt.Base:' + (FBancoAgenciaParam.ME4DtBase.text);
      FRChequeDevolvido.QRLConta.Caption := 'Conta:' + (FBancoAgenciaParam.Ed4CC.Text);
      FRChequeDevolvido.QRLDepartamento.Caption := 'Departamento:' + (FBancoAgenciaParam.ME4Departamento.Text) + ' - ' + (FBancoAgenciaParam.Ed4Departamento.text);
      if FBancoAgenciaParam.Rg4Opcao.itemIndex = 0 then
      begin
        FRChequeDevolvido.QrGroup1.ForceNewPage := True;
        FRChequeDevolvido.QRBand4.ForceNewPage := True;
      end
      else
      begin
        FRChequeDevolvido.QrGroup1.ForceNewPage := False;
        FRChequeDevolvido.QRBand4.ForceNewPage := False;
      end;
      if FBancoAgenciaParam.RGPreview.ItemIndex = 0 then
        FRChequeDevolvido.QRPrimario.Preview
      else
        FRChequeDevolvido.QRPrimario.Print;
      QRChequeDevolvido.Close;
    end;
  end;
end;

procedure TFBancosMovCad.BaixadeChequesDevolvidos1Click(Sender: TObject);
begin
  inherited;
  if FBancoAgenciaParam = nil then
    FBancoAgenciaParam := TFBancoAgenciaParam.Create(Application);
  FBancoAgenciaParam.PGRelatorio.Pages[6].TabVisible := True;
  if FBancoAgenciaParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRCOntroleLancamentoCartao.Close;
      if (trim(FBancoAgenciaParam.FmDtRecebimento6.MeDtInicial.Text  ) = '') or
         (trim(FBancoAgenciaParam.FmDtRecebimento6.MeDtFinal.Text) = '') then
        raise Exception.Create('O Campo Data Deve Ser Preenchido');
      QRCOntroleLancamentoCartao.SetVariable('DT_RECEBIMENTO_I', StrToDate(FBancoAgenciaParam.FmDtRecebimento6.MeDtInicial.Text));
      QRCOntroleLancamentoCartao.SetVariable('DT_RECEBIMENTO_F', StrToDate(FBancoAgenciaParam.FmDtRecebimento6.MeDtFinal.text));

      if Trim(FBancoAgenciaParam.FMBanco6.MeBanco.Text) <> '' then
        QRCOntroleLancamentoCartao.SetVariable('COD_BANCO', StrToInt(Trim(Trim(FBancoAgenciaParam.FMBanco6.MeBanco.Text))))
      else
        Raise Exception.Create('Obrigatório informar banco!');

      if FBancoAgenciaParam.RG5BaixadoNo.ItemIndex = 0 then
        QRBaixaChequeDevolvido.SetVariable('BAIXADO', 'TODOS');
      if FBancoAgenciaParam.RG5BaixadoNo.ItemIndex = 1 then
        QRBaixaChequeDevolvido.SetVariable('BAIXADO', 'BANCO');
      if FBancoAgenciaParam.RG5BaixadoNo.ItemIndex = 2 then
        QRBaixaChequeDevolvido.SetVariable('BAIXADO', 'CAIXA');

      QRBaixaChequeDevolvido.Open;
      if FRBaixaChequeDevolvido = nil then
        FRBaixaChequeDevolvido := TFRBaixaChequeDevolvido.Create(Application);
      FRBaixaChequeDevolvido.QRLPeriodo.Caption := 'Período:' + (FBancoAgenciaParam.ME5DtInicial.Text) + ' até ' + (FBancoAgenciaParam.ME5DtFinal.text);
      FRBaixaChequeDevolvido.QRLBanco.Caption := 'Banco:' + (FBancoAgenciaParam.Ed5Banco.Text);
      if FBancoAgenciaParam.RGPreview.ItemIndex = 0 then
        FRBaixaChequeDevolvido.QRPrimario.Preview
      else
        FRBaixaChequeDevolvido.QRPrimario.Print;
      QRBaixaChequeDevolvido.Close;
    end;
  end;
end;

procedure TFBancosMovCad.SaldoMdioPerodo1Click(Sender: TObject);
var
  wData: TDate;
  wCont, wContLinha: integer;
  wSaldo: Real;
begin
  inherited;
  wSaldo := 0;
  wContLinha := 0;
  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[15].TabVisible := True;
  if FBancoMovParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRSaldoMedioPeriodo.Close;
      if (trim(FBancoMovParam.ME16DtInicial.Text) = '') or (trim(FBancoMovParam.ME16DtFinal.text) = '') then
        raise Exception.Create('O Campo Data Deve Ser Preenchido');
      QRSaldoMedioPeriodo.SetVariable('DT_INICIAL', StrToDate(FBancoMovParam.ME16DtInicial.Text));
      QRSaldoMedioPeriodo.SetVariable('DT_FINAL', StrToDate(FBancoMovParam.ME16DtFinal.text));
      if Trim(FBancoMovParam.ME16Banco.Text) <> '' then
        QRSaldoMedioPeriodo.SetVariable('BANCO', StrToInt(Trim(FBancoMovParam.ME16Banco.Text)))
      else
        QRSaldoMedioPeriodo.SetVariable('BANCO', null);
      if Trim(FBancoMovParam.ME16ContaCorrente.Text) <> '' then
        QRSaldoMedioPeriodo.SetVariable('CONTACORRENTE', StrToInt(Trim(FBancoMovParam.ME16ContaCorrente.Text)))
      else
        QRSaldoMedioPeriodo.SetVariable('CONTACORRENTE', null);
      QRSaldoMedioPeriodo.Open;
      if FRSaldoMedioPeriodo = nil then
        FRSaldoMedioPeriodo := TFRSaldoMedioPeriodo.Create(Application);
      FRSaldoMedioPeriodo.QRLPeriodo.Caption := 'Periodo:' + (FBancoMovParam.ME16DtInicial.Text) + ' até ' + (FBancoMovParam.ME16DtFinal.text);
      FRSaldoMedioPeriodo.QRLBanco.Caption := 'Banco:' + (FBancoMovParam.Ed16Banco.Text);
      FRSaldoMedioPeriodo.QRLContaCorrente.Caption := 'Conta Corrente:' + (FBancoMovParam.Ed16ContaCorrente.Text);
      if FBancoMovParam.RGPreview.ItemIndex = 0 then
        FRSaldoMedioPeriodo.QRPrimario.Preview
      else
        FRSaldoMedioPeriodo.QRPrimario.Print;
      QRSaldoMedioPeriodo.Close;
    end;
  end;
end;

procedure TFBancosMovCad.RelAdiantamentos1Click(Sender: TObject);
begin
  inherited;
  If FAdiantamentoParam = nil then
     FAdiantamentoParam := TFAdiantamentoParam.create(application);
  FAdiantamentoParam.PGRelatorio.Pages[0].TabVisible := True;
  FAdiantamentoParam.ME0DtBase.Text := DateToStr(DmOracle.DataServ);
  If FAdiantamentoParam.showmodal = mrok then
  begin
    DMAdiantamento.QRAdiantamento.close;
    if trim(FAdiantamentoParam.Me0DtInicial.Text) = '' then
      raise Exception.Create('Preencha a Data Inicial');
    if trim(FAdiantamentoParam.Me0DtFinal.Text) = '' then
      raise Exception.Create('Preencha a Data Final');
    if trim(FAdiantamentoParam.Me0DtBase.Text) = '' then
      raise Exception.Create('Preencha a Data Base');
    DMAdiantamento.QRAdiantamento.SetVariable('DT_MOVIMENTO_INI', strtodate(FAdiantamentoParam.ME0DtInicial.Text));
    DMAdiantamento.QRAdiantamento.SetVariable('DT_MOVIMENTO_FIM', strtodate(FAdiantamentoParam.ME0DtFinal.Text));
    DMAdiantamento.QRAdiantamento.SetVariable('DT_BASE', strtodate(FAdiantamentoParam.ME0DtBase.Text));

    if trim(FAdiantamentoParam.Me0Cadastro.Text) <> '' then
      DMAdiantamento.QRAdiantamento.SetVariable('COD_CADASTRO', trim(FAdiantamentoParam.ME0Cadastro.Text))
    else
      DMAdiantamento.QRAdiantamento.SetVariable('COD_CADASTRO', null);
    if trim(FAdiantamentoParam.Me0Filial.Text) <> '' then
      DMAdiantamento.QRAdiantamento.SetVariable('COD_FILIAL', trim(FAdiantamentoParam.Me0Filial.Text))
    else
      DMAdiantamento.QRAdiantamento.SetVariable('COD_FILIAL', null);
    if trim(FAdiantamentoParam.FMHistorico0.MeHistorico.Text) <> '' then
      DMAdiantamento.QRAdiantamento.SetVariable('COD_HISTORICO', trim(FAdiantamentoParam.FMHistorico0.MeHistorico.Text))
    else
      DMAdiantamento.QRAdiantamento.SetVariable('COD_HISTORICO', null);
    DMAdiantamento.QRAdiantamento.SQL[DMAdiantamento.QRAdiantamento.SQL.Count - 1] := ''; // elimina a última Linha da SQL
    case FAdiantamentoParam.Rg0Situacao.ItemIndex of
      0: DMAdiantamento.QRAdiantamento.SQL.Add(' where ((val_saldo > 0)) ');
      1: DMAdiantamento.QRAdiantamento.SQL.Add(' where ((val_saldo = 0)) ');
//      2: DMAdiantamento.QRAdiantamento.SQL.Add(' GROUP BY NUM_DOC, DT_MOVIMENTO, NOME');
    end;
    DMAdiantamento.QRAdiantamento.SQL.Add(' ORDER BY DT_MOVIMENTO');
    DMAdiantamento.QRAdiantamento.open;

    if FRAdiantamento = nil then
       FRAdiantamento := TFRAdiantamento.create(application);
    FRAdiantamento.QRLPeriodo.Caption := 'Período: ' + FAdiantamentoParam.ME0DtInicial.Text + ' a ' +
       FAdiantamentoParam.ME0DtFinal.Text + ' - Data Base: ' + FAdiantamentoParam.ME0DtBase.Text +
       ' Histórico:' + trim(FAdiantamentoParam.FMHistorico0.EdHistorico.Text); 

    if FAdiantamentoParam.RGPreview.ItemIndex = 0 then
      FRAdiantamento.QRPrimario.Preview
    else
      FRAdiantamento.QRPrimario.Print;
    DMAdiantamento.QRAdiantamento.Close;

    // As 2 Linhas abaixo removem Cláusulas Where e Group By da SQL para se gerar novamente não duplicá-las - Djeison 22/01/2013
    DMAdiantamento.QRAdiantamento.SQL.Delete(DMAdiantamento.QRAdiantamento.SQL.Count - 1);
    //DMAdiantamento.QRAdiantamento.SQL.Delete(DMAdiantamento.QRAdiantamento.SQL.Count - 1);

  end;
end;

procedure TFBancosMovCad.RelAdiantamentosBaixa1Click(Sender: TObject);
begin
  inherited;
  if FAdiantamentoParam = nil then
    FAdiantamentoParam := TFAdiantamentoParam.create(application);
  FAdiantamentoParam.PGRelatorio.Pages[1].TabVisible := True;
  if FAdiantamentoParam.showmodal = mrok then
  begin
    DMAdiantamento.QRAdiantamentoBaixa.close;
    if trim(FAdiantamentoParam.ME1DtInicial.Text) = '' then
      raise Exception.Create('Preencha a Data Inicial');
    if trim(FAdiantamentoParam.ME1DtFinal.Text) = '' then
      raise Exception.Create('Preencha a Data Final');

    DMAdiantamento.QRAdiantamentoBaixa.SetVariable('DT_MOVIMENTO_INI', strtodate(FAdiantamentoParam.ME1DtInicial.Text));
    DMAdiantamento.QRAdiantamentoBaixa.SetVariable('DT_MOVIMENTO_FIM', strtodate(FAdiantamentoParam.ME1DtFinal.Text));

    if trim(FAdiantamentoParam.Me1Cadastro.Text) <> '' then
      DMAdiantamento.QRAdiantamentoBaixa.SetVariable('COD_CADASTRO', Trim(FAdiantamentoParam.Me1Cadastro.Text))
    else
      DMAdiantamento.QRAdiantamentoBaixa.SetVariable('COD_CADASTRO', null);
    if trim(FAdiantamentoParam.Me1Filial.Text) <> '' then
      DMAdiantamento.QRAdiantamentoBaixa.SetVariable('COD_FILIAL', Trim(FAdiantamentoParam.Me1Filial.Text))
    else
      DMAdiantamento.QRAdiantamentoBaixa.SetVariable('COD_FILIAL', null);
    if trim(FAdiantamentoParam.FMHistorico1.MeHistorico.Text) <> '' then
      DMAdiantamento.QRAdiantamentoBaixa.SetVariable('COD_HISTORICO', trim(FAdiantamentoParam.FMHistorico1.MeHistorico.Text))
    else
      DMAdiantamento.QRAdiantamentoBaixa.SetVariable('COD_HISTORICO', null);

    DMAdiantamento.QRAdiantamentoBaixa.open;

    If FRAdiantamentoBaixa = nil then
       FRAdiantamentoBaixa := TFRAdiantamentoBaixa.create(application);
    FRAdiantamentoBaixa.QRLPeriodo.Caption := 'Período: ' + FAdiantamentoParam.ME1DtInicial.Text + ' a ' +
      FAdiantamentoParam.ME1DtFinal.Text + ' Histórico:'+trim(FAdiantamentoParam.FMHistorico0.EdHistorico.Text);

    if FAdiantamentoParam.RGPreview.ItemIndex = 0 then
      FRAdiantamentoBaixa.QRPrimario.Preview
    else
      FRAdiantamentoBaixa.QRPrimario.Print;

    DMAdiantamento.QRAdiantamentoBaixa.Close;
  end;
end;

procedure TFBancosMovCad.EmissoRecibo1Click(Sender: TObject);
var
  wFilial, wOperacao: string;
  wNumero: Integer;
begin
  inherited;
  if DMBancoAgencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value <> 0 then
  begin
    if FRReciboBanco = nil then
      FRReciboBanco := TFRReciboBanco.Create(Application);
    wFilial := DMOracle.BuscaNome('SELECT COD_FILIAL FROM TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + FloatToStr(DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value));
    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('PK', StrToInt(wFilial));
    DMFilial.QFilial.Open;
    wOperacao := DMOracle.BuscaNome('SELECT IND_OPERACAO FROM TB_HISTORICO', 'COD_HISTORICO = ' + FloatToStr(DMBancoAgencia.QBancoMovimentoCod_Historico.Value));
    if wOperacao = '+' then
    begin
      FRReciboBanco.QRLResponsavel.Caption := DMFilial.QFilialDesc_Filial.value;
      if DMBancoAgencia.QBancoMovimentoCod_Cadastro.Text <> '' then
        FRReciboBanco.QRLRecibo.Caption := DMBancoAgencia.QBancoMovimentoDesc_Cadastro.Value
      else
        FRReciboBanco.QRLRecibo.Caption := DMBancoAgencia.QBancoMovimentoDESC_OBSERVACAO.Value;
    end
    else
    begin
      if DMBancoAgencia.QBancoMovimentoCod_Cadastro.Text <> '' then
        FRReciboBanco.QRLResponsavel.Caption := DMBancoAgencia.QBancoMovimentoDesc_Cadastro.Value
      else
        FRReciboBanco.QRLResponsavel.Caption := DMBancoAgencia.QBancoMovimentoDESC_OBSERVACAO.Value;
      FRReciboBanco.QRLRecibo.Caption := DMFilial.QFilialDesc_Filial.value;
    end;
    wNumero := DMSequencia.Sequencia(StrToInt(wFilial), 'RECIBO');
    FRReciboBanco.QRLNumero.Caption := FloatToStr(wNumero);
    if DMBancoAgencia.QBancoMovimentoNum_Cheque.Text = '' then
    begin
      DMBancoAgencia.QBancoMovimento.Edit;
      DMBancoAgencia.QBancoMovimentoNum_Cheque.Value := wNumero;
      DMBancoAgencia.QBancoMovimento.Post;
      if DMOracle.DBCemapa.InTransaction then
        DMOracle.DBCemapa.Commit;
    end;
    FRReciboBanco.QRLComplemento.Caption := DMBancoAgencia.QBancoMovimentoDesc_Historico.Text + ' - ' +
      Trim(DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value) +
      Trim(DMBancoAgencia.QBancoMovimentoDesc_Complemento2.Value);
    FRReciboBanco.QRLValorExtenso.Caption := Bib.extenso(DMBancoAgencia.QBancoMovimentoVal_Movimento.Value, 'REAL');
    FRReciboBanco.QRLData.Caption := FormatDateTime(', dd "de" mmmm "de" yyyy', DMBancoAgencia.QBancoMovimentoDT_MOVIMENTO.Value);
    FRReciboBanco.QuickRep1.Preview;
    DMFilial.QFilial.Close;
  end
  else
  begin
    ShowMessage('É necessário escolher um movimento no banco,' + #13 +
      'antes de solicitar a impressão do recibo.');
  end;
end;

procedure TFBancosMovCad.SaldoMdioPerodoCC1Click(Sender: TObject);
begin
  inherited;
  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[16].TabVisible := True;
  if FBancoMovParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRSaldoMedioPeriodoCC.Close;
      if (trim(FBancoMovParam.ME17DtInicial.Text) = '') or (trim(FBancoMovParam.ME17DtFinal.text) = '') then
        raise Exception.Create('O Campo Data Deve Ser Preenchido');
      QRSaldoMedioPeriodoCC.SetVariable('DT_INICIO', StrToDate(FBancoMovParam.ME17DtInicial.Text));
      QRSaldoMedioPeriodoCC.SetVariable('DT_FIM', StrToDate(FBancoMovParam.ME17DtFinal.text));

      if Trim(FBancoMovParam.ME17Banco.Text) <> '' then
        QRSaldoMedioPeriodoCC.SetVariable('COD_BANCO_AGENCIA', StrToInt(Trim(FBancoMovParam.ME17Banco.Text)))
      else
        QRSaldoMedioPeriodoCC.SetVariable('COD_BANCO_AGENCIA', null);

      if Trim(FBancoMovParam.ME17ContaCorrente.Text) <> '' then
        QRSaldoMedioPeriodoCC.SetVariable('COD_CONTA_CORRENTE', StrToInt(Trim(FBancoMovParam.ME17ContaCorrente.Text)))
      else
        QRSaldoMedioPeriodoCC.SetVariable('COD_CONTA_CORRENTE', null);

      QRSaldoMedioPeriodoCC.Open;

      if FRSaldoMedioPeriodoContaCorrente = nil then
        FRSaldoMedioPeriodoContaCorrente := TFRSaldoMedioPeriodoContaCorrente.Create(Application);

      FRSaldoMedioPeriodoContaCorrente.QRLPeriodo.Caption := (FBancoMovParam.ME17DtInicial.Text) + ' até ' + (FBancoMovParam.ME17DtFinal.text);
      FRSaldoMedioPeriodoContaCorrente.QRLBanco.Caption := (FBancoMovParam.Ed17Banco.Text);
      FRSaldoMedioPeriodoContaCorrente.QRLContaCorrente.Caption := (FBancoMovParam.Ed17ContaCorrente.Text);

      if FBancoMovParam.RGPreview.ItemIndex = 0 then
        FRSaldoMedioPeriodoContaCorrente.QRPrimario.Preview
      else
        FRSaldoMedioPeriodoContaCorrente.QRPrimario.Print;

      QRSaldoMedioPeriodoCC.Close;
    end;
  end;
end;

procedure TFBancosMovCad.SBProtocoloClick(Sender: TObject);
begin
  inherited;
  if DMBancoAgencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value = 0 then
    raise Exception.Create('É necessário selecionar um movimento!')
  else
    if FRProtocolo = nil then
      FRProtocolo := TFRProtocolo.Create(Application);
  FRProtocolo.QRPrimario.Preview;

end;

{**** imprime na impressora de cheque CHRONOS ****}

procedure TFBancosMovCad.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente imprimir o cheque?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    DMBancoAgencia.EmiteChequeChronos(DMBancoAgencia.QBancoMovimentoDESC_OBSERVACAO.Text,
      DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_CIDADE FROM TB_FILIAL, TB_CONTA_CORRENTE', 'TB_FILIAL.COD_FILIAL = TB_CONTA_CORRENTE.COD_FILIAL AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + DMBancoAgencia.QBancoMovimentoCOD_CONTA_CORRENTE.Text),
      DMOracle.BuscaNome('SELECT TB_BANCO_AGENCIA.COD_BANCO FROM TB_BANCO_AGENCIA, TB_CONTA_CORRENTE', 'TB_BANCO_AGENCIA.COD_BANCO_AGENCIA = TB_CONTA_CORRENTE.COD_BANCO_AGENCIA AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + DMBancoAgencia.QBancoMovimentoCOD_CONTA_CORRENTE.Text),
      DMBancoAgencia.QBancoMovimentoVAL_MOVIMENTO.value,
      DMBancoAgencia.QBancoMovimentoDT_MOVIMENTO.Value);
  end;


{  if MessageDlg('Deseja realmente imprimir o cheque?', mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    wPorta := DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_PORTA_CHRONOS FROM TB_FILIAL, TB_CONTA_CORRENTE', 'TB_FILIAL.COD_FILIAL = TB_CONTA_CORRENTE.COD_FILIAL AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + DMBancoAgencia.QBancoMovimentoCOD_CONTA_CORRENTE.Text);

    if AbrirPorta(wPorta) then   //Abre a porta serial.  //funcao definida acima
    begin
      if ConfiguraControle() and ConfiguraTimeOuts() then  //funcoes definida acima
      begin
        //FAVORECIDO
        wComando := chr(27) + chr(160) + DMBancoAgencia.QBancoMovimentoDESC_OBSERVACAO.Text + chr(13);
        WriteFile( hCom,PChar(wComando)^,length(wComando), BytesEscritos, nil);

        //LOCALIDADE
        wAux := DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_CIDADE FROM TB_FILIAL, TB_CONTA_CORRENTE', 'TB_FILIAL.COD_FILIAL = TB_CONTA_CORRENTE.COD_FILIAL AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + DMBancoAgencia.QBancoMovimentoCOD_CONTA_CORRENTE.Text);
        wComando := chr(27) + chr(161) + wAux + chr(13);
        WriteFile( hCom,PChar(wComando)^,length(wComando), BytesEscritos, nil);

        //BANCO
        wAux := DMOracle.BuscaNome('SELECT TB_BANCO_AGENCIA.COD_BANCO FROM TB_BANCO_AGENCIA, TB_CONTA_CORRENTE', 'TB_BANCO_AGENCIA.COD_BANCO_AGENCIA = TB_CONTA_CORRENTE.COD_BANCO_AGENCIA AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + DMBancoAgencia.QBancoMovimentoCOD_CONTA_CORRENTE.Text);
        wComando := chr(27) + chr(162) + wAux + chr(13);
        WriteFile( hCom,PChar(wComando)^,length(wComando), BytesEscritos, nil);

        //VALOR
        wComando := chr(27) + chr(163) + FormatFloat('0.00',DMBancoAgencia.QBancoMovimentoVAL_MOVIMENTO.value) + chr(13); //stringreplace retira os pontos (.)
        WriteFile( hCom,PChar(wComando)^,length(wComando), BytesEscritos, nil);

        //DATA
        wComando := chr(27) + chr(164) + FormatDateTime('dd/mm/yy',DMBancoAgencia.QBancoMovimentoDT_MOVIMENTO.Value) + chr(13);
        WriteFile( hCom,PChar(wComando)^,length(wComando), BytesEscritos, nil);

        //FIM - MANDA IMPRIMIR
        wComando := chr(27) + chr(176);
        WriteFile( hCom,PChar(wComando)^,length(wComando), BytesEscritos, nil);
      end
      else
        ShowMessage('A porta utilizada pela impressora está sendo usada no momento.');

      CloseHandle(hCom);   //Fecha a porta Serial.
    end
    else
      ShowMessage('A porta utilizada pela impressora está sendo usada no momento.');
  end;
}


end;

procedure TFBancosMovCad.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  DBENrCheque.Text := Copy(DBEdit5.Text, 14, 6);
  DBEdit8.Text := 'BANCO: ' + Copy(DBEdit5.Text, 2, 3) + '  AG: ' + Copy(DBEdit5.Text, 5, 4);
end;

procedure TFBancosMovCad.DBEdit5Change(Sender: TObject);
begin
  inherited;
  DBEdit5Exit(Self);
end;

procedure TFBancosMovCad.AlterarContaCorrente1Click(Sender: TObject);
var
  wNumDoc: Integer;
  wComando: string;
begin
  inherited;
  if DMBancoAgencia.QBancoMovimento.RecordCount > 0 then
  begin
    if FAlteraCCMovimento = nil then
      FAlteraCCMovimento := TFAlteraCCMovimento.Create(Application);
    if (FAlteraCCMovimento.ShowModal = MrOk) and (trim(FAlteraCCMovimento.FmContaCorrente1.MeContaCorrente.Text) <> '') then
    begin
      with DMOracle do
      begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        QExecSQL.SQL.Add('UPDATE TB_BCO_MOVIMENTO SET COD_CONTA_CORRENTE = ' + Trim(FAlteraCCMovimento.FmContaCorrente1.MeContaCorrente.Text) +
          'WHERE COD_BCO_MOVIMENTO =' + DMBancoAgencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Text);
        try
          DBCemapa.StartTransaction;
          QExecSQL.ExecSQL;
          DBCemapa.Commit;
          SBRefreshClick(Self);
        except
          DBCemapa.RollBack;
          raise Exception.Create('Falha na execução da operação');
        end;

        {try
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'DELETE FROM TB_CAIXA_MOV ';
          wComando := wComando + ' WHERE COD_BCO_MOVIMENTO = '+FloatToStr(DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value);
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;
        Except
          DBCemapa.Rollback;
          Raise Exception.Create('Falha na execução da operação');
        end;}
      end;
    end;
    //wNumDoc:=DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
    //DMPlanilha.Descontabiliza(wNumDoc,'BC');
    //DMBancoAgencia.QBancoMovimento.Edit;
    //FBancosMovCad.SBConfirmarClick(Self);
  end
  else
    raise Exception.Create('Nenhum movimento bancário encontrado');
end;

procedure TFBancosMovCad.ChequesEmitidosContasPagar1Click(Sender: TObject);
begin
  inherited;

  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[17].TabVisible := True;
  if FBancoMovParam.ShowModal = MrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRChequeEmitidoCP.Close;
      if (Trim(FBancoMovParam.ME18DtInicial.Text) = '/  /') or (Trim(FBancoMovParam.ME18DtFinal.Text) = '/  /') then
        raise Exception.Create('O Campo Data Deve Ser Preenchido');
      QRChequeEmitidoCP.SetVariable('DT_INICIAL', StrToDate(FBancoMovParam.ME18DtInicial.Text));
      QRChequeEmitidoCP.SetVariable('DT_FINAL', StrToDate(FBancoMovParam.ME18DtFinal.Text));

      if (Trim(FBancoMovParam.FmFilial18.MeFilial.Text) <> '') then
        QRChequeEmitidoCP.SetVariable('COD_FILIAL', StrToInt(Trim(FBancoMovParam.FmFilial18.MeFilial.Text)))
      else
        QRChequeEmitidoCP.SetVariable('COD_FILIAL', null);

      if (Trim(FBancoMovParam.ME18Banco.Text) <> '') then
        QRChequeEmitidoCP.SetVariable('BANCO', StrToInt(Trim(FBancoMovParam.ME18Banco.Text)))
      else
        QRChequeEmitidoCP.SetVariable('BANCO', null);

      QRChequeEmitidoCP.open;

      if FRChequesEmitidosContasPagar = nil then
        FRChequesEmitidosContasPagar := TFRChequesEmitidosContasPagar.Create(Application);

      FRChequesEmitidosContasPagar.QRLBanco.Caption := FBancoMovParam.Ed18Banco.Text;
      FRChequesEmitidosContasPagar.QRLFilial.Caption := FBancoMovParam.FmFilial18.EdFilial.Text;
      FRChequesEmitidosContasPagar.QRLPeriodo.Caption := FBancoMovParam.ME18DtInicial.Text + ' até ' + FBancoMovParam.ME18DtFinal.Text;

      if FBancoMovParam.RGPreview.ItemIndex = 0 then
        FRChequesEmitidosContasPagar.QRPrimario.Preview
      else
        FRChequesEmitidosContasPagar.QRPrimario.Print;

      QRChequeEmitidoCP.Close;
    end;
  end;

end;

procedure TFBancosMovCad.Extrato1Click(Sender: TObject);
var wSaldo: Extended;
begin
  if FBancoMovParam = nil then
    FBancoMovParam := TFBancoMovParam.Create(Application);
  FBancoMovParam.PGRelatorio.Pages[18].TabVisible := True;
  if FBancoMovParam.ShowModal = mrOk then
  begin
    if Trim(FBancoMovParam.Fm18DataMov.MeDtInicial.Text) = '' then
    begin
      MessageDlg('Informe a data inicial.', mtError, [mbOK], 0);
      Exit;
    end;
    if Trim(FBancoMovParam.Fm18DataMov.MeDtFinal.Text) = '' then
    begin
      MessageDlg('Informe a data final.', mtError, [mbOK], 0);
      Exit;
    end;
    if Trim(FBancoMovParam.Fm18ContaCorrente.MeContaCorrente.Text) = '' then
    begin
      MessageDlg('Informe a conta corrente.', mtError, [mbOK], 0);
      Exit;
    end;

    with DMBancoAgenciaRel do
    begin
      wSaldo := 0;

      CdRExtrato.Close;
      Bib.LimpaParams(CdRExtrato);
      CdRExtrato.Params.ParamByName('DT_MOVIMENTO_INI').AsDate := StrToDate(Trim(FBancoMovParam.Fm18DataMov.MeDtInicial.Text));
      CdRExtrato.Params.ParamByName('DT_MOVIMENTO_FIN').AsDate := StrToDate(Trim(FBancoMovParam.Fm18DataMov.MeDtFinal.Text));
      CdRExtrato.Params.ParamByName('COD_CONTA_CORRENTE').AsInteger := StrToInt(Trim(FBancoMovParam.Fm18ContaCorrente.MeContaCorrente.Text));
      If FBancoMovParam.Rg18ChequeBaixado.ItemIndex = 0 Then
         CdRExtrato.Params.ParamByName('IND_BAIXA_CHEQUE').AsString := ''
      Else
         CdRExtrato.Params.ParamByName('IND_BAIXA_CHEQUE').AsString := 'N';
      CdRExtrato.Open;

      CdRExtrato.First;
      if (not (CdRExtrato.Locate('IND_TIPO_REGISTRO', 0, []))) then
      begin
        CdRExtrato.Append;
        CdRExtratoCOD_BCO_MOVIMENTO.Value := -1;
        CdRExtratoIND_TIPO_REGISTRO.Value := 0;
        CdRExtratoDT_MOVIMENTO.Value := StrToDate(Trim(FBancoMovParam.Fm18DataMov.MeDtInicial.Text)) -1;
        CdRExtratoDESC_HISTORICO.Value := 'SALDO INICIAL';
        CdRExtratoVAL_MOVIMENTO.Value := 0;
        CdRExtratoVAL_SALDO.Value := 0;
        CdRExtratoNUM_CONTA_CORRENTE.Value := DMOracle.FastSelect('NUM_CONTA_CORRENTE', 'TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + Trim(FBancoMovParam.Fm18ContaCorrente.MeContaCorrente.Text));
        CdRExtratoCOD_CONTA_CORRENTE.Value := StrToInt(Trim(FBancoMovParam.Fm18ContaCorrente.MeContaCorrente.Text));
        CdRExtratoCOD_BANCO_AGENCIA.Value := StrToInt(DMOracle.FastSelect('COD_BANCO_AGENCIA', 'TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + Trim(FBancoMovParam.Fm18ContaCorrente.MeContaCorrente.Text)));
        CdRExtratoDESC_BANCO_AGENCIA.Value := DMOracle.FastSelect('DESC_BANCO_AGENCIA', 'TB_BANCO_AGENCIA', 'COD_BANCO_AGENCIA = ' + DMOracle.FastSelect('COD_BANCO_AGENCIA', 'TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + Trim(FBancoMovParam.Fm18ContaCorrente.MeContaCorrente.Text)));
        CdRExtrato.Post;
      end;

      CdRExtrato.First;
      while not CdRExtrato.Eof do
      begin
        wSaldo := wSaldo + CdRExtratoVAL_MOVIMENTO.Value;
        CdRExtrato.Edit;
        CdRExtratoVAL_SALDO.Value := wSaldo;
        CdRExtrato.Post;
        CdRExtrato.Next;
      end;

      CdRExtrato.First;
      if (not (CdRExtrato.Locate('IND_TIPO_REGISTRO', 2, []))) then
      begin
        CdRExtrato.Append;
        CdRExtratoCOD_BCO_MOVIMENTO.Value := -2;
        CdRExtratoIND_TIPO_REGISTRO.Value := 2;
        CdRExtratoDT_MOVIMENTO.Value := StrToDate(Trim(FBancoMovParam.Fm18DataMov.MeDtFinal.Text));
        CdRExtratoDESC_HISTORICO.Value := 'SALDO ATUAL';
        CdRExtratoVAL_MOVIMENTO.Value := 0;
        CdRExtratoVAL_SALDO.Value := wSaldo;
        CdRExtratoNUM_CONTA_CORRENTE.Value := DMOracle.FastSelect('NUM_CONTA_CORRENTE', 'TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + Trim(FBancoMovParam.Fm18ContaCorrente.MeContaCorrente.Text));
        CdRExtratoCOD_CONTA_CORRENTE.Value := StrToInt(Trim(FBancoMovParam.Fm18ContaCorrente.MeContaCorrente.Text));
        CdRExtratoCOD_BANCO_AGENCIA.Value := StrToInt(DMOracle.FastSelect('COD_BANCO_AGENCIA', 'TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + Trim(FBancoMovParam.Fm18ContaCorrente.MeContaCorrente.Text)));
        CdRExtratoDESC_BANCO_AGENCIA.Value := DMOracle.FastSelect('DESC_BANCO_AGENCIA', 'TB_BANCO_AGENCIA', 'COD_BANCO_AGENCIA = ' + DMOracle.FastSelect('COD_BANCO_AGENCIA', 'TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + Trim(FBancoMovParam.Fm18ContaCorrente.MeContaCorrente.Text)));
        CdRExtrato.Post;
      end;

      if FRBancosMov_Extrato = nil then
         FRBancosMov_Extrato := TFRBancosMov_Extrato.Create(Application);
      if FBancoMovParam.RGPreview.ItemIndex = 0 then
         FRBancosMov_Extrato.QRPrimario.Preview
      else
         FRBancosMov_Extrato.QRPrimario.Print;
    end;
  end;
end;

procedure TFBancosMovCad.DBEdit19Exit(Sender: TObject);
begin
  inherited;
  //somente um dos busca_nome vai retornar alguma coisa, o outro sempre trará ''
  if Trim(DbEdit19.Text) <> '' then
    MEAdiantamento.Text := DMOracle.BuscaNome('SELECT NUM_DOCUMENTO FROM TB_CAIXA_MOV T1, TB_ADIANTAMENTO T2',
                                              'T1.COD_CAIXA_MOV = T2.COD_CAIXA_MOV AND '+
                                              'T2.COD_ADIANTAMENTO = ' + trim(DBEdit19.Text))+
                           DMOracle.BuscaNome('SELECT NUM_CHEQUE FROM TB_BCO_MOVIMENTO T1, TB_ADIANTAMENTO T2',
                                              'T1.COD_BCO_MOVIMENTO = T2.COD_BCO_MOVIMENTO AND '+
                                              'T2.COD_ADIANTAMENTO = ' + trim(DBEdit19.Text));

end;

procedure TFBancosMovCad.SBAdiantamentoClick(Sender: TObject);
begin
  inherited;
  if FAdiantamentoCons = nil then
    FAdiantamentoCons := TFAdiantamentoCons.create(application);

  FAdiantamentoCons.MECadastro.Text := DMBancoAgencia.QBancoMovimentoCOD_CADASTRO.Text;
  FAdiantamentoCons.MECadastroExit(Sender);
  FAdiantamentoCons.MeDtInicial.Text := DateToStr(Date - 30);
  FAdiantamentoCons.MeDtFinal.Text := DateToStr(Date);
  FAdiantamentoCons.BtProcurar.Click;

  if FAdiantamentoCons.showmodal = mrok then
  begin
    DMBancoAgencia.QBancoMovimentoCod_Adiantamento.Value := Trunc(DMAdiantamento.QAdiantamentoConsCOD_ADIANTAMENTO.Value);
    DBEdit19Exit(Sender);
  end;


end;

procedure TFBancosMovCad.DBPTitularChequeDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFBancosMovCad.ControleLanamentosCarto1Click(Sender: TObject);
begin
  inherited; 
  if FBancoAgenciaParam = nil then
    FBancoAgenciaParam := TFBancoAgenciaParam.Create(Application);
  FBancoAgenciaParam.PGRelatorio.Pages[6].TabVisible := True;
  FBancoAgenciaParam.FMBanco6.MeBanco.Text := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','IND_BANCO_PADRAO = ''SIM''');
  if FBancoAgenciaParam.ShowModal = mrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRCOntroleLancamentoCartao.Close;
      if (trim(FBancoAgenciaParam.FmDtRecebimento6.MeDtInicial.Text  ) = '') or
         (trim(FBancoAgenciaParam.FmDtRecebimento6.MeDtFinal.Text) = '') then
      Begin
        QRCOntroleLancamentoCartao.SetVariable('DT_RECEBIMENTO_I', NULL);
        QRCOntroleLancamentoCartao.SetVariable('DT_RECEBIMENTO_F',NULL);
      end
      Else
      Begin
        QRCOntroleLancamentoCartao.SetVariable('DT_RECEBIMENTO_I', StrToDate(FBancoAgenciaParam.FmDtRecebimento6.MeDtInicial.Text));
        QRCOntroleLancamentoCartao.SetVariable('DT_RECEBIMENTO_F', StrToDate(FBancoAgenciaParam.FmDtRecebimento6.MeDtFinal.text));
      end;
      
      if Trim(FBancoAgenciaParam.FMBanco6.MeBanco.Text) <> '' then
        QRCOntroleLancamentoCartao.SetVariable('COD_BANCO', StrToInt(Trim(Trim(FBancoAgenciaParam.FMBanco6.MeBanco.Text))))
      else
        Raise Exception.Create('Obrigatório informar banco!');

      if (trim(FBancoAgenciaParam.FmDtEmissao6.MeDtInicial.Text  ) = '') or
         (trim(FBancoAgenciaParam.FmDtEmissao6.MeDtFinal.Text) = '') then
      Begin
        QRCOntroleLancamentoCartao.SetVariable('DT_EMISSAO_I', NULL);
        QRCOntroleLancamentoCartao.SetVariable('DT_EMISSAO_F',NULL);
      end
      else
      Begin
        QRCOntroleLancamentoCartao.SetVariable('DT_EMISSAO_I', StrToDate(FBancoAgenciaParam.FmDtEmissao6.MeDtInicial.Text));
        QRCOntroleLancamentoCartao.SetVariable('DT_EMISSAO_F', StrToDate(FBancoAgenciaParam.FmDtEmissao6.MeDtFinal.text));
      end;

      if FBancoAgenciaParam.RG6Bandeira.ItemIndex = 0 then
        QRCOntroleLancamentoCartao.SetVariable('BANDEIRA', 'VISA');
      if FBancoAgenciaParam.RG6Bandeira.ItemIndex = 1 then
        QRCOntroleLancamentoCartao.SetVariable('BANDEIRA', 'MASTERCARD');
      if FBancoAgenciaParam.RG6Bandeira.ItemIndex = 2 then
        QRCOntroleLancamentoCartao.SetVariable('BANDEIRA', 'ELO');
      if FBancoAgenciaParam.RG6Bandeira.ItemIndex = 3 then
        QRCOntroleLancamentoCartao.SetVariable('BANDEIRA', 'NUBANK');
      if FBancoAgenciaParam.RG6Bandeira.ItemIndex = 4 then
        QRCOntroleLancamentoCartao.SetVariable('BANDEIRA', 'OUTROS');
      if FBancoAgenciaParam.RG6Bandeira.ItemIndex = 5 then
        QRCOntroleLancamentoCartao.SetVariable('BANDEIRA', 'BPF');
      if FBancoAgenciaParam.RG6Bandeira.ItemIndex = 6 then
        QRCOntroleLancamentoCartao.SetVariable('BANDEIRA', NULL);

      QRCOntroleLancamentoCartao.Open;

      if FRControleLancamentoCartao = nil then
        FRControleLancamentoCartao := TFRControleLancamentoCartao.Create(Application);
      if trim(FBancoAgenciaParam.FmDtRecebimento6.MeDtInicial.Text)  <> '' Then
         FRControleLancamentoCartao.QRLDtRecebimento.Caption := 'Periodo:' + (FBancoAgenciaParam.FmDtRecebimento6.MeDtInicial.Text) +
                                                                ' até ' + (FBancoAgenciaParam.FmDtRecebimento6.MEDtFinal.text)
      else
         FRControleLancamentoCartao.QRLDtRecebimento.Caption := 'Periodo:' + (FBancoAgenciaParam.FmDtEmissao6.MeDtInicial.Text) +
                                                                ' até ' + (FBancoAgenciaParam.FmDtEmissao6.MEDtFinal.text);

      FRControleLancamentoCartao.QRLBanco.Caption := 'Banco:' + (FBancoAgenciaParam.FMBanco6.MeBanco.Text) +' '+
                                                         (FBancoAgenciaParam.FMBanco6.EdBanco.Text);
      if (DMParamSistema.CodEmpresa = 'PIXIXE_FAB') then
        FRControleLancamentoCartao.QRDBText4.DataField := 'NUM_NOTA';
      if FBancoAgenciaParam.RGPreview.ItemIndex = 0 then
        FRControleLancamentoCartao.QRPrimario.Preview
      else
        FRControleLancamentoCartao.QRPrimario.Print;
      QRCOntroleLancamentoCartao.Close;
    end;
  end;


end;

end.

