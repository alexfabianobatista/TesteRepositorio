unit UOSFechamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Grids, DBGrids, DBCtrls, UFmOperacao, ActnList, UFmMensagem,
  UFmFinalidade, UFmDepartamento, variants, OraTeste, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFOSFechamento = class(TFTCadSimples)
    Panel3: TPanel;
    DSOSFechamento: TDataSource;
    EdLbl1: TEdit;
    EdLbl2: TEdit;
    EdLbl3: TEdit;
    EdLbl4: TEdit;
    RGPagto: TRadioGroup;
    Label5: TLabel;
    MENumOS: TMaskEdit;
    BtnNFOficina: TBitBtn;
    PopupMenu1: TPopupMenu;
    CancelarNF1: TMenuItem;
    SBLimpaTela: TSpeedButton;
    MENome: TMaskEdit;
    EdLbl5: TEdit;
    EdLbl6: TEdit;
    SBOSCons: TSpeedButton;
    EdLbl7: TEdit;
    PPrazo: TPanel;
    LBContaReceber: TListBox;
    Label8: TLabel;
    MEDiasCP: TMaskEdit;
    MEDataCP: TMaskEdit;
    Label4: TLabel;
    LblValorCR: TLabel;
    MEValorCR: TMaskEdit;
    BtApagaParcela: TBitBtn;
    FmMensagem: TFmMensagem;
    FmFinalidade: TFmFinalidade;
    FmDepartamento: TFmDepartamento;
    PValores: TPanel;
    Label13: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EdValApl1: TEdit;
    EdValApl2: TEdit;
    EdValApl3: TEdit;
    EdValApl4: TEdit;
    EdValTotalNF: TEdit;
    EdValApl5: TEdit;
    EdValCalc1: TEdit;
    EdValCalc2: TEdit;
    EdValCalc3: TEdit;
    EdValCalc4: TEdit;
    EdValCalc5: TEdit;
    EdValTotal: TEdit;
    EdValApl6: TEdit;
    EdValCalc6: TEdit;
    EdValApl7: TEdit;
    EdValCalc7: TEdit;
    BtVoltaFechamento: TBitBtn;
    PSugerido: TPanel;
    Label7: TLabel;
    EdValSug1: TEdit;
    EdValSug2: TEdit;
    EdValSug3: TEdit;
    EdValSug4: TEdit;
    EdValSug5: TEdit;
    EdValSug6: TEdit;
    EdValSug7: TEdit;
    PPrazoVencimento: TPanel;
    Label1: TLabel;
    Dias: TLabel;
    MEParcela: TMaskEdit;
    MEDias: TMaskEdit;
    BtConfirmaPrazo: TBitBtn;
    FmOperacaoS: TFmOperacao;
    FmOperacao: TFmOperacao;
    PProdutos: TPanel;
    MEProduto6: TMaskEdit;
    MEProduto5: TMaskEdit;
    MEProduto1: TMaskEdit;
    MEProduto2: TMaskEdit;
    rgTipoProduto: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure MENumOSExit(Sender: TObject);
    procedure BtnNFOficinaClick(Sender: TObject);
    procedure BtApagaParcelaClick(Sender: TObject);
    procedure MEDiasCPExit(Sender: TObject);
    procedure MEValorCRExit(Sender: TObject);
    procedure EdValTotalNFEnter(Sender: TObject);
    procedure CancelarNF1Click(Sender: TObject);
    procedure CopiaNotaOficina();
    procedure SBLimpaTelaClick(Sender: TObject);
    procedure EdValCalc1Enter(Sender: TObject);
    procedure EdValApl1Change(Sender: TObject);
    procedure EdValApl2Change(Sender: TObject);
    procedure EdValApl3Change(Sender: TObject);
    procedure EdValApl4Change(Sender: TObject);
    procedure EdValApl5Change(Sender: TObject);
    procedure EdValCalc2Enter(Sender: TObject);
    procedure EdValCalc3Enter(Sender: TObject);
    procedure EdValCalc4Enter(Sender: TObject);
    procedure EdValCalc5Enter(Sender: TObject);
    procedure EdValTotalEnter(Sender: TObject);
    procedure EdValTotalNFChange(Sender: TObject);
    procedure EdValApl6Change(Sender: TObject);
    procedure EdValCalc6Exit(Sender: TObject);
    procedure SBOSConsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdValApl7Change(Sender: TObject);
    procedure FmOperacao1BtOperacaoClick(Sender: TObject);
    procedure FmOperacaoMeOperacaoExit(Sender: TObject);
    procedure FmMensagemMeMensagemExit(Sender: TObject);
    procedure FmFinalidadeMeFinalidadeExit(Sender: TObject);
    procedure FmDepartamentoMeDepartamentoExit(Sender: TObject);
    procedure RGPagtoClick(Sender: TObject);
    procedure BtVoltaFechamentoClick(Sender: TObject);
    procedure MEParcelaKeyPress(Sender: TObject; var Key: Char);
    procedure BtConfirmaPrazoClick(Sender: TObject);
    procedure EdLbl1DblClick(Sender: TObject);
    procedure EdLbl5DblClick(Sender: TObject);
    procedure EdLbl6DblClick(Sender: TObject);
    procedure MEProduto1KeyPress(Sender: TObject; var Key: Char);
    procedure EdLbl2DblClick(Sender: TObject);
    procedure rgTipoProdutoClick(Sender: TObject);
  private
    function GetValPecas: Extended;
    function GetValServicos: Double;
    function GetValTotal: Extended;
    function GetValGeral: Extended;
    function GetValPecasSug: Extended;
  private
    TotalParcelasPecas: Extended;
    TotalParcelasServicos: Extended;
    Parcelas: TStringList;
    procedure LimpaTela(zerar: Boolean = False);
    procedure BuscaValores;
    procedure BuscaValoresAgronews;
    procedure FechaOSAgronews;
    procedure OS_GeraContaReceber(wListaParcela: TStrings; wFinalidade: Integer;
      wBancoAgencia, wDepartamento: string; wNf: Boolean);
  public
    property ValPecasSug: Extended read GetValPecasSug;
    property ValPecas: Extended read GetValPecas;
    property ValServicos: Double read GetValServicos;
    property ValTotal: Extended read GetValTotal;
    property ValGeral: Extended read GetValGeral;
  end;

var
  FOSFechamento: TFOSFechamento;
  mCont: Real;

implementation

uses UOficina_cl, UOSCons, UOracle_cl, UParamSistema_cl,
  UFilialCons, UFilial_cl, UOperacao_cl, UFinalidade_cl, UOperacaoCons,
  UFinalidadeCons, UDepartamentoCons, UDepartamento_cl, UBancosCons,
  UBancoAgencia_cl, UMensagemCons, UMensagem_cl,
  UUsuario_cl, UBiblioteca, USerie_cl, UContasReceber_cl, UOSCancelaNF,
  UCaixa_cl, OracleData, UOSEmite_cl, UOs_cl, UOficinaParam, UNotaSaida_cl,
  UNotaImpressao, UProduto_cl, UProdutoCons, Math, StrUtils;
// UNotaSaida_Confirma,
//UNotaSaida_cl,
{$R *.DFM}

procedure TFOSFechamento.FormActivate(Sender: TObject);
begin
  inherited;
  with DMOficina do
  begin
    QOSFechamento.Close;
    QOSFechamento.Open;
  end;
  //  MENumOS.Clear;
  //  FmOperacao.MeOperacao.Clear;
  //  FmMensagem.MeMensagem.Clear;
  //  FmFinalidade.MeFinalidade.Clear;
  //  FmDepartamento.MeDepartamento.Clear;
  //  FmOperacao.EdOperacao.Clear;
  //  FmMensagem.EdMensagem.Clear;
  //  FmFinalidade.EdFinalidade.Clear;
  //  FmDepartamento.EdDepartamento.Clear;
  //  EdValSug1.Clear;
  //  EdValSug2.Clear;
  //  EdValSug3.Clear;
  //  EdValSug4.Clear;
  //  EdValTotalNF.Clear;
  //  EdValApl1.Clear;
  //  EdValApl2.Clear;
  //  EdValApl3.Clear;
  //  EdValApl4.Clear;
  //  LBContaReceber.Items.Clear;
  LimpaTela();
end;

procedure TFOSFechamento.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FOsCons = nil then
    FOsCons := TFOsCons.Create(Application);
  if FOsCons.ShowModal = mrOk then
  begin
    if DMOs.QOSConsIND_SITUACAO.Value = 'F' then
    begin
      MessageDlg('Ordem de serviço: ' + IntToStr(DMOs.QOSConsNUM_OS.Value) + ' já foi fechada!', mtInformation, [mbOk], 0);
      Exit;
    end;
    MENumOS.Text := DMOs.QOSConsNUM_OS.Text;
    MENumOSExit(Sender);
  end;
end;

procedure TFOSFechamento.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBIncluir.Enabled := False;
  SBExcluir.Enabled := False;
end;

procedure TFOSFechamento.MELocalizaExit(Sender: TObject);
begin
  inherited;
  if DMOficina.QOSFechamentoIND_SITUACAO.Value = 'F' then
  begin
    //MessageDlg('Ordem de serviço : '+IntToStr(DMOficina.QOSFechamentoNUM_OS.Value)+' já foi fechada!',mtInformation,[mbOk],0);
    Exit;
  end;
end;

procedure TFOSFechamento.MENumOSExit(Sender: TObject);
begin
  inherited;
  if Trim(MENumOS.Text) <> '' then
    with DMOficina do
    begin
      QOSFechamento.Close;
      QOSFechamento.SetVariable('PK', MENumOS.Text);
      QOSFechamento.Open;
      if (Trim(QOSFechamentoNUM_OS.Text) <> Trim(MENumOS.Text)) or
        (QOSFechamentoIND_SITUACAO.Value = 'F') then
      begin
        MENumOS.SetFocus;
        MessageDlg('O.S. não existe ou já está fechada.', mtError, [mbOK], 0);
        Abort;
      end;
      MENome.Text := QOSFechamentonome_cadastro.Value;
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
      begin
        BuscaValoresAgronews;
        EdValTotalNFEnter(Sender);
        EdValCalc1Enter(Sender);
      end
      else
        BuscaValores;
      try
        EdValTotalNFEnter(Sender);
      except
      end;
    end;
end;

procedure TFOSFechamento.BuscaValoresAgronews;
var
  wOs: Integer;
begin
  with DMOficina do
  begin
    wOs := StrToInt(Trim(MENumOS.Text));
    LimpaTela(True);
    MENumOS.Text := IntToStr(wOs);

    QNFTotalPecasAplicadas.Close;
    QNFTotalPecasAplicadas.SetVariable('NUM_OS', wOs);
    QNFTotalPecasAplicadas.SetVariable('TIPO', 'SERVIÇO');
    QNFTotalPecasAplicadas.Open;
    if QOSFechamentoIND_CAMPO_OFICINA.Value = 'C' then
    begin
      //Serviços no campo
      EdValSug1.Text := QNFTotalPecasAplicadasTOTAL_PECAS_APLICADAS.Text;
      EdValApl1.Text := EdValSug1.Text;
    end
    else
    begin
      //Serviços na oficina
      EdValSug2.Text := QNFTotalPecasAplicadasTOTAL_PECAS_APLICADAS.Text;
      EdValApl2.Text := EdValSug2.Text;
    end;

    EdValSug3.Text := '0';
    EdValApl3.Text := EdValSug3.Text;

    QNFTotalPecasAplicadas.Close;
    QNFTotalPecasAplicadas.SetVariable('NUM_OS', wOs);
    QNFTotalPecasAplicadas.SetVariable('NTIPO', 'SERVIÇO');
    QNFTotalPecasAplicadas.Open;
    //Peças
    EdValSug4.Text := QNFTotalPecasAplicadasTOTAL_PECAS_APLICADAS.Text;
    EdValApl4.Text := EdValSug4.Text;

    EdValSug5.Text := '0';
    EdValApl5.Text := EdValSug5.Text;

    QNFTotalServicoTerceiro.Close;
    QNFTotalServicoTerceiro.SetVariable('NUM_OS', wOs);
    QNFTotalServicoTerceiro.Open;
    //Serviço de terceiros
    EdValSug6.Text := QNFTotalServicoTerceiroTOTAL_SERVICO_TERCEIRO.Text;
    EdValApl6.Text := EdValSug6.Text;

    QNFTotalPecasAplicadas.Close;
    QNFTotalPecasAplicadas.SetVariable('NUM_OS', wOs);
    QNFTotalPecasAplicadas.SetVariable('VEICULO', 'S');
    QNFTotalPecasAplicadas.Open;
    //Gastos com deslocamento
    EdValSug7.Text := QNFTotalPecasAplicadasTOTAL_PECAS_APLICADAS.Text;
    EdValApl7.Text := EdValSug7.Text;
  end;
end;

procedure TFOSFechamento.BuscaValores;
var
  mSerie: string;
begin
  with DMOficina do
  begin
    //Mostra na tela informações totais - ® 15/04/2001

    //CALCULO DA MAO DE OBRA DE FUNCIONARIOS EFETIVOS
    QNFTotalMaoObra.Close;
    QNFTotalMaoObra.SetVariable('NUM_OS', MENumOS.Text);
    QNFTotalMaoObra.Open;
    {  // Calcula horas
      mHoraI  := FloatToStr(INT(QNFTotalMaoObraHR_INICIO.Value));
      mHoraF  := FloatToStr(INT(QNFTotalMaoObraHR_FINAL.Value));
      mMinutoI:= FloatToStr(FRAC(QNFTotalMaoObraHR_INICIO.Value));
      mMinutoF:= FloatToStr(FRAC(QNFTotalMaoObraHR_FINAL.Value));

      if FRAC(QNFTotalMaoObraHR_INICIO.Value) = 0 then   // Isto é necessario!
         mMinutoI:= '0,60';
      if FRAC(QNFTotalMaoObraHR_FINAL.Value) = 0 then
         mMinutoF:= '0,60';

      if StrToFloat(mMinutoF) >= StrToFloat(mMinutoI) then
         mTotalMinutos:=StrToFloat(mMinutoF) - StrToFloat(mMinutoI)
      else
         mTotalMinutos:=StrToFloat(mMinutoI) - StrToFloat(mMinutoF);
      //mTotalMinutos:= 60-mTotalMinutos;

      if StrToFloat(mHoraF) > StrToFloat(mHoraI) then
         mTotalHora:=StrToFloat(mHoraF) - StrToFloat(mHoraI)
      else
         mTotalHora:=StrToFloat(mHoraI) - StrToFloat(mHoraF);

      mTotal:= mTotalHora * QNFTotalMaoObraVAL_HORA_MECANICO.Value;

      mTotal:=mTotal+QNFTotalMaoObraVAL_HORA_MECANICO.Value/60*(mTotalMinutos*100);}
    EdValSug1.Text := FormatFloat('#,##0.00', QNFTotalMaoObraVAL_MO_MECANICO.Value);
    EdValApl1.Text := EdValSug1.Text;
    QNFTotalMaoObra.Close;
    //-- TERMINO DO CALCULO DE HORAS TRABALHADAS PELOS FUNCIONARIOS EFETIVOS

    // CALCULO DA MAO DE OBRA DE CHAPEACAO
    QNFTotalMOChapeacao.Close;
    QNFTotalMOChapeacao.SetVariable('NUM_OS', MENumOS.Text);
    QNFTotalMOChapeacao.Open;

    //mTotal:=mTotal+QNFTotalMOChapeacaoVAL_HORA_MECANICO.Value/60*(mTotalMinutos*100);}
    EdValSug5.Text := FormatFloat('#,##0.00', QNFTotalMOChapeacaoVAL_MO_MECANICO.Value);
    EdValApl5.Text := EdValSug5.Text;
    QNFTotalMOChapeacao.Close;
    //-- TERMINO DO CALCULO DA MAO DE OBRA DE CHAPEACAO

    //CALCULO DA MAO DE OBRA ELETRICISTA
    QNFTotalMOEletricista.Close;
    QNFTotalMOEletricista.SetVariable('NUM_OS', MENumOS.Text);
    QNFTotalMOEletricista.Open;
    EdValSug6.Text := FormatFloat('#,##0.00', QNFTotalMOEletricistaVAL_MO_ELETRICISTA.Value);
    EdValApl6.Text := EdValSug6.Text;
    QNFTotalMOChapeacao.Close;
    //-- TERMINO DO CALCULO DA MAO ELETRICISTA

    // ----------------- SERVICO TERCEIRO-------
    QNFTotalServicoTerceiro.Close;
    QNFTotalServicoTerceiro.SetVariable('NUM_OS', MENumOS.Text);
    QNFTotalServicoTerceiro.Open;
    EdValSug2.Text := FloatToStr(QNFTotalServicoTerceiroTOTAL_SERVICO_TERCEIRO.Value);
    EdValApl2.Text := EdValSug2.Text;
    QNFTotalServicoTerceiro.Close;
    // ------------------
    QNFTotalPecasAplicadas.Close;
    QNFTotalPecasAplicadas.SetVariable('NUM_OS', MENumOS.Text);
    QNFTotalPecasAplicadas.Open;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
    begin
      EdValSug3.Text := '0';
      EdValSug4.Text := FloatToStr(QNFTotalPecasAplicadasTOTAL_PECAS_APLICADAS.Value);
    end
    else
      EdValSug3.Text := FloatToStr(QNFTotalPecasAplicadasTOTAL_PECAS_APLICADAS.Value);
    EdValApl3.Text := EdValSug3.Text;
    QNFTotalPecasAplicadas.Close;
    //--------------------
    QNFTotalItensIsentos.Close;
    QNFTotalItensIsentos.SetVariable('NUM_OS', MENumOS.Text);
    QNFTotalItensIsentos.Open;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS' then
      EdValSug4.Text := FloatToStr(QNFTotalItensIsentosTOTAL_ITENS_ISENTOS.Value);
    EdValApl4.Text := EdValSug4.Text;
    QNFTotalItensIsentos.Close;
    //--------------------
    EdValApl7.Text := '0';
    EdValCalc7.Text := '0';
    //--------------------

    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS' then
    begin
      //Mostra ultima nota fiscal/proxima numero.
      mSerie := DMOracle.BuscaNome('SELECT NUM_SERIE FROM TB_SERIE', 'COD_FILIAL = ' + FloatToStr(QOSFechamentoCOD_FILIAL.Value));
      if Trim(mSerie) <> '' then
        Caption := 'Ultima NF.: ' + mSerie + ' - Próxima: ' + FloatToStr(StrToFloat(mSerie) + 1);
    end;
  end;
end;

procedure TFOSFechamento.BtnNFOficinaClick(Sender: TObject);
  procedure GeraParcelas(var Str: TStrings; ValTotal: Extended; pTipo :String);
  var
    i: Integer;
    Val, Total: Extended;
    wValAux :String;
  begin
    Str.Clear;
    Total := 0;
    for i := 1 to LBContaReceber.Items.Count do
    begin
      if copy(LBContaReceber.Items[i-1],12,1) = pTipo then //Considera apenas parcelas do tipo passado por parametro
      begin
        if i = (LBContaReceber.Items.Count) then
          Val := ValTotal - Total //Última parcela recebe o total restante (resolvendo problema de dízimas)
        else
        begin
          //Val := StrToFloat(FormatFloat('#0.00', ValTotal / (LBContaReceber.Items.Count)));
          wValAux := copy(LBContaReceber.Items[i-1],15,15);
          wValAux := StringReplace(wValAux, '.','',[rfReplaceAll, rfIgnoreCase]);
          Val := StrToFloat(wValAux);
        end;
        Str.Add(Copy(LBContaReceber.Items[i-1], 1, 10) +
          Bib.Chars(' ', 2) +
          FormatFloat('#0.00', Val));
        Total := Total + Val;
      end;
    end;
  end;
  procedure AdicionaServico(Query: TOracleDataset1; CodProduto: Integer; Valor: Real; Descricao: String);
  begin
    Query.Append;
    Query.FieldByName('NUM_OS').Value := DMOficina.QOSFechamentoNUM_OS.Value;
    Query.FieldByName('COD_TRIBUTACAO').Value := StrToInt(DMOracle.FastSelect('COD_TRIBUTACAO',
      'TB_PRODUTO', 'COD_PRODUTO = ' + IntToStr(CodProduto)));
    Query.FieldByName('COD_PRODUTO').Value := CodProduto;
    Query.FieldByName('DESC_COMPLEMENTO').Value := Descricao;
    Query.FieldByName('QT_QUANTIDADE').Value := 1;
    Query.FieldByName('VAL_UNITARIO').Value := Valor;
    Query.FieldByName('VAL_TOTAL').Value := Valor;
    Query.FieldByName('COD_LOTE_TIPO').Value := 1;
    Query.FieldByName('IND_TIPO').Value := 'S';
    Query.Post;
  end;
  procedure VerificaServico(Query: TOracleDataset1; Produto, Valor, Descricao: String);
  var
    wProduto: Integer;
    wValor: Real;
  begin
    wProduto := StrToInt('0' + Trim(Bib.LimpaNumero(Produto)));
    wValor := StrToFloat('0' + Trim(Valor));
    if wValor > 0 then
    begin
      if wProduto = 0 then
        Raise Exception.Create('Obrigatório informar produto para ' + Descricao + '.');
      if Trim(FmOperacaoS.MeOperacao.Text) = '' then
        Raise Exception.Create('Favor informar operação para gerar notas de serviços.');
      AdicionaServico(Query, wProduto, wValor, Descricao);
    end;
  end;
var
  wAux, wNumOS, wCodSerie, wSerieModelo, wPagto, wSql, wLinha, wLpt_Nota, wNumNota,
    wOperacao, wFilial, wDepartamento, wCadastro, wNotaCab, wOficinaCab: string;
  wTotalParcelas, wTotalSugerido, wTotalAplicado, wValPecas, wValDiferenca: Real;
  wDate : TDateTime;
  ValAuxDesc, ValAuxDescTot: Extended;
  wX, wNfServ, wNfPeca: Integer;
  wParcelas: TStrings;
  wNf: Boolean;
  Buscador: TBuscador;
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
  begin
    FechaOSAgronews;
    if DMOficina.QOSFechamentoIND_SITUACAO.Value = 'F' then
    begin
      if FOficinaParam = nil then
        FOficinaParam := TFOficinaParam.Create(Application);
      FOficinaParam.PGRelatorio.Pages[23].TabVisible := True;
      if FOficinaParam.ShowModal = MrOk then
        for wX := 1 to StrToInt(FOficinaParam.ME23NumCopias.Text) do //apenas reaproveitando variavel wX
          DMOSEmite.EmiteOS(DMOficina.QOSFechamentoNUM_OS.Value, (FOficinaParam.RG23Tipo.ItemIndex = 0));
    end;
    Exit;
  end;
  if Trim(MENumOS.Text) = '' then
  begin
    MessageDlg('Por favor, informe uma OS antes.', mtError, [mbOK], 0);
    Exit;
  end;
  with DMOficina do
  begin
    if QOSFechamentoNUM_OS.Text <> MENumOS.Text then
    begin
      QOSFechamento.Close;
      QOSFechamento.SetVariable('PK', MENumOS.Text);
      QOSFechamento.Open;
    end;
    if (QOSFechamentoNUM_OS.IsNull) or (QOSFechamentoIND_SITUACAO.Value <> 'A') then
    begin
      MessageDlg('O.S. não existe ou já está fechada.', mtError, [mbOK], 0);
      Exit;
    end;
  end;
  if (Trim(EdValTotal.Text) = '') or (Trim(EdValCalc1.Text) = '') or
    (Trim(EdValCalc2.Text) = '') or (Trim(EdValCalc3.Text) = '') or
    (Trim(EdValCalc4.Text) = '') or (Trim(EdValCalc6.Text) = '') then
    raise exception.Create('Valores a serem aplicados não podem ficar em branco!');

  // Venda a vista gera uma parcela baixada no contas a receber.
  if RGPagto.ItemIndex = 0 then
  begin
    LBContaReceber.Items.Clear;
    wLinha := DateToStr(Date);
    wAux := FormatFloat('###,###,##0.00', StrToFloat(EdValTotal.Text));
    wAux := Copy(wBranco, 1, 15 - Length(waux)) + wAux;
    wLinha := wLinha + wAux;
    LBContaReceber.Items.Add(wLinha);
  end;

  if (DMOficina.QOSFechamentoCOD_FILIAL.Value = 1) and (FmMensagem.MeMensagem.Text = '') then
    raise exception.Create('Mensagem deve ser informada!');
  if Trim(FmFinalidade.MeFinalidade.Text) = '' then
    raise exception.Create('Finalidade deve ser informada!');
  if Trim(FmDepartamento.MeDepartamento.Text) = '' then
    raise exception.Create('Departamento deve ser informado!');
  if Trim(FmOperacao.MeOperacao.Text) = '' then
    raise exception.Create('Operação deve ser informada!');
  if Trim(EdValTotalNF.Text) = '' then
    raise exception.Create('Verifique Total Nota Fiscal!');

  with DMOficina do
  begin
    QOSContaReceberCons.Close;
    QOSContaReceberCons.SetVariable('NUM_OS', MENumOS.Text);
    QOSContaReceberCons.Open;
    if QOSContaReceberCons.RecordCount > 0 then
      raise exception.Create('Registro já existe lançado no Contas a Receber para esta O.S.');
    QOSContaReceberCons.Close;
  end;
  wTotalParcelas := 0;
  for wX := 0 to LBContaReceber.Items.Count - 1 do
  begin
    wAux := Copy(LBContaReceber.Items[wX], 13, 17);
    wAux := Bib.LimpaString(wAux, '.');
    wTotalParcelas := wTotalParcelas + StrToFloat(wAux);
  end;
  if RGPagto.ItemIndex = 2 then
    wTotalParcelas := ValGeral
  else
  if RGPagto.ItemIndex = 0 then
  begin
    if Abs(wTotalParcelas - ValGeral) > 0.01 then
      raise exception.Create('Total das parcelas (' + Trim(FloatToStr(wTotalParcelas)) +
        ') não confere com total da OS (' + Trim(EdValTotalNF.Text) + ').');
  end
  else
  begin
    if Abs(wTotalParcelas - StrToFloat(Trim(EdValTotalNF.Text))) > 0.01 then
      raise exception.Create('Total das parcelas (' + Trim(FloatToStr(wTotalParcelas)) +
        ') não confere com total da OS (' + Trim(EdValTotalNF.Text) + ').');
  end;

  wNumOs := DMOracle.BuscaNome('SELECT NUM_OS FROM TB_OS', 'NUM_OS = ' + FloatToStr(DMOficina.QOSFechamentoNUM_OS.Value));
  if Trim(wNumOs) = '' then
  begin
    MessageDlg('O.S. informada não foi encontrada.', mtError, [mbOk], 0);
    Exit;
  end;

  wNumNota := ''; // Inicializa valor da variavel

  // Verifica tipo de pagamento.
  if RGPagto.ItemIndex = 0 then
    wPagto := '1' // Avista
  else
    if RGPagto.ItemIndex = 1 then
      wPagto := '2' // Aprazo
    else
      wPagto := '3'; //Outros

  // Alimenta variaveis com valores padroes da tabela tb_param_sistema.
  DMOperacao.QOperacao.Close;
  DMOperacao.QOperacao.SetVariable('PK', FmOperacao.MeOperacao.Text);
  DMOperacao.QOperacao.Open;
  // Incluindo no banco a operação e o valor dos descontos, para gerar nota_cab
  if DMOperacao.QOperacao.IsEmpty then
    raise Exception.Create('Operação inexistente');
  //  if (DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_OPERACAO',
  //                         'COD_OPERACAO = ' + FmOperacao.MeOperacao.Text) = '') then
  //    Raise Exception.Create('Operação precisa possuir uma série.');
  wNf := (DMOperacao.QOperacaoIND_EMITE.Value = 'F');
  if wNf then //Se emitir NF-e, entao tem de gerar nota e tambem tem de gerar contas a receber separadamente (produtos e servicos)
    wNf := (DMOracle.FastSelect('IND_TIPO_NOTA', 'TB_FILIAL',
      'COD_FILIAL = ' + DMOficina.QOSFechamentoCOD_FILIAL.Text) = 'ELETRONICA');
  wTotalAplicado := StrToFloat(EdValApl1.Text) +
    StrToFloat(EdValApl2.Text) +
    StrToFloat(EdValApl3.Text) +
    StrToFloat(EdValApl4.Text) +
    StrToFloat(EdValApl5.Text) +
    StrToFloat(EdValApl6.Text);
  wTotalSugerido := StrToFloat(EdValSug1.Text) +
    StrToFloat(EdValSug2.Text) +
    StrToFloat(EdValSug3.Text) +
    StrToFloat(EdValSug4.Text) +
    StrToFloat(EdValSug5.Text) +
    StrToFloat(EdValSug6.Text);
  try
    //    with DMOracle do
    //    begin
    //      QExecSQL.Close;
    //      QExecSQL.SQL.Clear;
    //      QExecSQL.SQL.Append('UPDATE TB_OS SET COD_OPERACAO = ' + FmOperacao.MeOperacao.Text);
    //      QExecSQL.SQL.Append(', IND_VISTA_PRAZO = ' + IntToStr(RGPagto.ItemIndex + 1));
    //      if Trim(FmMensagem.MeMensagem.Text) <> '' then
    //        QExecSQL.SQL.Append(', COD_MENSAGEM = ' + FmMensagem.MeMensagem.Text);
    //      if (wTotalSugerido - wTotalAplicado) > 0 then
    //        QExecSQL.SQL.Append(', VAL_DESCONTO = ' + Bib.TrocaVirgulaPorPonto(FloatToStr(wTotalSugerido - wTotalAplicado)))
    //      else
    //        QExecSQL.SQL.Append(', VAL_DESCONTO = 0');
    //      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
    //        QExecSQL.SQL.Append(', HR_SAIDA = TO_CHAR(CURRENT_DATE,' +
    //            QuotedStr('hh:mm') + '), DT_FECHAMENTO = CURRENT_DATE');
    //      QExecSQL.SQL.Append(' WHERE NUM_OS = ' + MENumOS.Text);
    //      QExecSQL.ExecSQL;
    //      if DMOracle.DBCemapa.InTransaction then
    //        DMOracle.DBCemapa.Commit;
    //    end;
    wSql := 'UPDATE TB_OS SET COD_OPERACAO = ' + FmOperacao.MeOperacao.Text + ', IND_VISTA_PRAZO = ' +
      IntToStr(RGPagto.ItemIndex + 1);
    if Trim(FmMensagem.MeMensagem.Text) <> '' then
      wSql := wSql + ', COD_MENSAGEM = ' + FmMensagem.MeMensagem.Text;
    if (wTotalSugerido - wTotalAplicado) > 0 then
      wSql := wSql + ', VAL_DESCONTO = ' + Bib.TrocaVirgulaPorPonto(FloatToStr(wTotalSugerido - wTotalAplicado))
    else
      wSql := wSql + ', VAL_DESCONTO = 0';
    //    if wAgronews then
    //      wSql := wSql + ', HR_SAIDA = TO_CHAR(CURRENT_DATE,' + QuotedStr('hh:mm') + '), DT_FECHAMENTO = CURRENT_DATE';
    wSql := wSql + ' WHERE NUM_OS = ' + MENumOS.Text;
    DMOracle.ExecutaSql(wSql);
  except
    DMOracle.DBCemapa.Rollback;
  end;
  //---
//  if DMOperacao.QOperacaoIND_EMITE.Value = 'F' then
//    wCodSerie := DMParamSistema.QParamSistemaCOD_SERIE_NOTA.Value
//  else
//    wCodSerie := DMParamSistema.QParamSistemaCOD_SERIE_PEDIDO.Value;
  if wNf then
  begin
    if ValServicos > 0 then
    begin
      wCodSerie := DMOracle.FastSelect('COD_SERIE', 'TB_OPERACAO', 'COD_OPERACAO = ' + FmOperacaoS.MeOperacao.Text);
      wSerieModelo := DMOracle.FastSelect('COD_SERIE_MODELO', 'TB_OPERACAO', 'COD_OPERACAO = ' +
        FmOperacaoS.MeOperacao.Text);
    end
    else
    begin
      wCodSerie := '0';
      wSerieModelo := '99';
    end;
  end
  else
  begin
    wCodSerie := DMParamSistema.QParamSistemaCOD_SERIE_PEDIDO.Value;
    wSerieModelo := '99';
  end;

  // Consulta valor atual da nota fiscal.
//  with DMSerie do
//  begin
  try
    if wCodSerie > '0' then
      wNumNota := IntToStr(DMSerie.NumeroSerie(DMOficina.QOSFechamentoCOD_FILIAL.Value, wCodSerie, wSerieModelo));
  except
    raise exception.Create('Erro na tentativa de pegar sequencia para Nota Fiscal!');
  end;
//    QSerie.Close;
//    QSerie.SetVariable('COD_FILIAL', DMOficina.QOSFechamentoCOD_FILIAL.Value);
//    QSerie.SetVariable('COD_SERIE', wCodSerie);
//    QSerie.Open;
//    if QSerie.RecordCount = 0 then
//      raise exception.Create('Erro na tentativa de pegar sequencia para Nota Fiscal!');
//
//    wNumNota := IntToStr(QSerieNUM_SERIE.Value);
//    wNumNota := IntToStr(StrToInt(wNumNota) + 1); // Incrementa um no numero da nota fiscal.
//  end;

  if (DMOficina.QOSFechamentoCOD_FILIAL.Value = 1) then
    MENumOS.Text := wNumNota;

  // -- Gera contas a receber automaticamente.
//  if not DMOracle.DBCemapa.InTransaction then
//    DMOracle.DBCemapa.StartTransaction;
  try
    //if (ValServicos > 0) and (wPagto <> '3') then
    //  OS_GeraContaReceber(LBContaReceber.Items, StrToInt(Trim(FmFinalidade.MeFinalidade.Text)),
    //      '', Trim(FmDepartamento.MeDepartamento.Text), wNf);
//    DMOracle.DBCemapa.Commit;
  except
    MessageDlg('Não foi possivel gerar contas a receber, faça manualmente!', mtWarning, [mbOk], 0);
    DMOracle.DBCemapa.Rollback;
    raise;
  end;

  try
    if (not wNf) and (DMOficina.QOSFechamentoCOD_FILIAL.Value = 1) then
    begin
      // Pega parametros para impressão da nota fiscal.
      wLpt_Nota := DMOracle.BuscaNome('SELECT DESC_LPT_NOTA FROM TB_FILIAL',
          'COD_FILIAL = ' + FloatToStr(DMOficina.QOSFechamentoCOD_FILIAL.Value));
      if Imp = nil then
        Imp := TImp.Create;

      if Trim(wLpt_Nota) = 'LPT1' then
        Imp.AbreImpressora
      else if Trim(wLpt_Nota) = 'LPT2' then
        Imp.AbreImpressora_Lpt2
      else
        Imp.AbreImpressora_Com2;

      Imp.ConfiguraImpressora('CONDENSADO_ON', 'SEXTOS', 78);
      // COMEÇA IMPRESSÃO DA NOTA FISCAL

      mCont := 2;

      Imp.WriteXY(12.9, mCont, 'X');
      Imp.WriteXY(18.3, mCont, wNumNota);
      mCont := mCont + 5;
      Imp.WriteXY(0.5, mCont, DMOperacao.QOperacaoDESC_OPERACAO.Value);
      if DMOficina.QOSFechamentoDt_Emissao.Value >= StrToDate('01/01/2003') then
      begin
        if (trim(EdValCalc3.text) <> '0,00') or (trim(EdValCalc4.text) <> '0,00') then
        begin
          Imp.WriteXY(6.8, mCont, DMOperacao.QOperacaoNUM_NATUREZA_EST_NOVO.Text);
          mCont := mCont + 1;
        end;
        if (trim(EdValCalc1.text) <> '0,00') or (trim(EdValCalc2.text) <> '0,00') or (trim(EdValCalc5.text) <> '0,00') or (trim(EdValCalc6.text) <> '0,00') then
        begin
          Imp.WriteXY(6.8, mCont, '5933');
        end
      end;
      //else
      //begin
        //Imp.WriteXY(6.8, mCont, DMOperacao.QOperacaoNUM_NATUREZA_EST.Text);
      //end;
      mCont := 10;
      Imp.WriteXY(0.5, mCont, DMOficina.QOSFechamentoCOD_CADASTRO.Text);
      Imp.WriteXY(1.4, mCont, DMOficina.QOSFechamentonome_cadastro.Value);
      Imp.WriteXY(12.8, mCont, DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMOficina.QOSFechamentoCOD_CADASTRO.Value)));
      Imp.WriteXY(18.2, mCont, DateToStr(DMOracle.DataServ));
      mCont := mCont + 2;
      Imp.WriteXY(0.5, mCont, DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMOficina.QOSFechamentoCOD_CADASTRO.Value)));
      Imp.WriteXY(11.0, mCont, DMOracle.BuscaNome('SELECT DESC_BAIRRO    FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMOficina.QOSFechamentoCOD_CADASTRO.Value)));
      Imp.WriteXY(15.1, mCont, DMOracle.BuscaNome('SELECT DESC_CEP       FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMOficina.QOSFechamentoCOD_CADASTRO.Value)));
      Imp.WriteXY(18.2, mCont, DateToStr(DMOracle.DataServ));
      mCont := mCont + 2;
      Imp.WriteXY(0.5, mCont, DMOracle.BuscaNome('SELECT DESC_CIDADE   FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMOficina.QOSFechamentoCOD_CADASTRO.Value)));
      Imp.WriteXY(8.1, mCont, DMOracle.BuscaNome('SELECT DESC_TELEFONE FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMOficina.QOSFechamentoCOD_CADASTRO.Value)));
      Imp.WriteXY(11.8, mCont, DMOracle.BuscaNome('SELECT COD_ESTADO    FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMOficina.QOSFechamentoCOD_CADASTRO.Value)));
      Imp.WriteXY(12.8, mCont, DMOracle.BuscaNome('SELECT NUM_INSCRICAO FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMOficina.QOSFechamentoCOD_CADASTRO.Value)));
      Imp.WriteXY(18.2, mCont, TimeToStr(Time));
      mCont := mCont + 4;
      if Trim(EdValApl1.Text) <> '' then
      begin
        Imp.WriteXY(1.9, mCont, EdLbl1.Text); // Valor mao de obra
        Imp.WriteXY(13.9, mCont, Bib.NumToTexto(StrToFloat(EdValCalc1.Text), 2, 11));
        Imp.WriteXY(16.2, mCont, Bib.NumToTexto(StrToFloat(EdValCalc1.Text), 2, 11));
      end;
      mCont := mCont + 1;
      if Trim(EdValApl2.Text) <> '' then
      begin
        Imp.WriteXY(1.9, mCont, EdLbl2.Text); // Valor serviços terceiro
        Imp.WriteXY(13.9, mCont, Bib.NumToTexto(StrToFloat(EdValCalc2.Text), 2, 11));
        Imp.WriteXY(16.2, mCont, Bib.NumToTexto(StrToFloat(EdValCalc2.Text), 2, 11));
      end;
      mCont := mCont + 1;
      if Trim(EdLbl3.Text) <> '' then
      begin
        Imp.WriteXY(1.9, mCont, EdLbl3.Text); // Valor peças aplicadas
        Imp.WriteXY(13.9, mCont, Bib.NumToTexto(StrToFloat(EdValCalc3.Text), 2, 11));
        Imp.WriteXY(16.2, mCont, Bib.NumToTexto(StrToFloat(EdValCalc3.Text), 2, 11));
      end;
      mCont := mCont + 1;
      if Trim(EdLbl4.Text) <> '' then
      begin
        Imp.WriteXY(1.9, mCont, EdLbl4.Text); // Valor itens isentos.
        Imp.WriteXY(13.9, mCont, Bib.NumToTexto(StrToFloat(EdValCalc4.Text), 2, 11));
        Imp.WriteXY(16.2, mCont, Bib.NumToTexto(StrToFloat(EdValCalc4.Text), 2, 11));
      end;
      mCont := mCont + 1;
      if Trim(EdValApl5.Text) <> '' then
      begin
        Imp.WriteXY(1.9, mCont, EdLbl5.Text); // Valor SERVICO CHAPEACAO.
        Imp.WriteXY(13.9, mCont, Bib.NumToTexto(StrToFloat(EdValCalc5.Text), 2, 11));
        Imp.WriteXY(16.2, mCont, Bib.NumToTexto(StrToFloat(EdValCalc5.Text), 2, 11));
      end;
      mCont := mCont + 1;
      if Trim(EdLbl6.Text) <> '' then
      begin
        Imp.WriteXY(1.9, mCont, EdLbl6.Text); // Valor SERVICO ELETRICO
        Imp.WriteXY(13.9, mCont, Bib.NumToTexto(StrToFloat(EdValCalc6.Text), 2, 11));
        Imp.WriteXY(16.2, mCont, Bib.NumToTexto(StrToFloat(EdValCalc6.Text), 2, 11));
      end;
      mCont := mCont + 15;
      with DMMensagem do
      begin
        QMensagem.Close;
        QMensagem.SetVariable('Pk', FmMensagem.MeMensagem.Text);
        QMensagem.Open;
        Imp.WriteXY(0.8, mCont, QMensagemDESC_MENSAGEM.Value);
        //-------impressao imposto sobre serviços
        mCont := mCont + 1;
        Imp.WriteXY(0.8, mCont, QMensagemDESC_COMPLEMENTO.Value);
        mCont := mCont + 1;
        Imp.WriteXY(0.8, mCont, QMensagemDESC_COMPLEMENTO1.Value);
        Imp.WriteXY(16.8, mCont, Bib.NumToTexto((StrToFloat(EdValCalc2.Text) + StrToFloat(EdValCalc1.Text) + StrToFloat(EdValCalc5.Text) + StrToFloat(EdValCalc6.Text)) * 3 / 100, 2, 11)); // Valor de ISS
        //ALTERADO POR FABIO 29/07/2003 INCLUSAO DOS SERVICOS DE CHAPEACAO NO CALC. DO TOTAL DA MAO DE OBRA
        mCont := mCont + 1;
        Imp.WriteXY(0.8, mCont, QMensagemDESC_COMPLEMENTO2.Value);
        mCont := mCont + 1;
        Imp.WriteXY(16.8, mCont, Bib.NumToTexto(StrToFloat(EdValCalc1.Text) + StrToFloat(EdValCalc2.Text) + StrToFloat(EdValCalc5.Text) + StrToFloat(EdValCalc6.Text), 2, 11)); // Total da mão de obra
      end;
      mCont := 46;
      Imp.WriteXY(0.5, mCont, Bib.NumToTexto(StrToFloat(EdValCalc3.Text), 2, 11)); // Base calculo ICMS
      Imp.WriteXY(4.1, mCont, Bib.NumToTexto(StrToFloat(EdValCalc3.Text) * 18 / 100, 2, 8)); // Valor ICMS
      Imp.WriteXY(16.8, mCont, Bib.NumToTexto(StrToFloat(EdValCalc3.Text) + StrToFloat(EdValCalc4.Text), 2, 11)); // Total produtos
      mCont := mCont + 2;
      Imp.WriteXY(17.4, mCont, EdValTotal.Text); // Total da nota fiscal
      mCont := mCont + 10;
      Imp.WriteXY(0.5, mCont, 'O.S.: ' + FloatToStr(DMOficina.QOSFechamentoNUM_OS.Value) + ' - EMPRESA OPTANTE DO SIMPLES - PR');
      if Trim(EdLbl3.Text) <> '' then
        Imp.WriteXY(10, mCont, 'ICMS Subst. Tribut. artigo 268 decreto 1980/07.');
      mCont := mCont + 1;
      if wPagto = '1' then // Pagamento avista
      begin
        Imp.WriteXY(0.5, mCont, 'Pagamento a Vista');
        mCont := mCont + 1;
      end;

      if wPagto = '2' then // Aprazo
        Imp.WriteXY(0.5, mCont, 'Vencimentos:');

      mCont := mCont + 1;

      DMOficina.QOSContaReceberCons.Close;
      DMOficina.QOSContaReceberCons.SetVariable('NUM_OS', MENumOS.Text);

      if DMOficina.QOSFechamentoCOD_FILIAL.Value = 1 then
        DMOficina.QOSContaReceberCons.SetVariable('DESC_TIPO_OS', 'NF')
      else
        DMOficina.QOSContaReceberCons.SetVariable('DESC_TIPO_OS', 'OS');

      if DMOficina.QOSFechamentoCOD_FILIAL.Value = 1 then
      begin
        DMOficina.QOSContaReceberCons.Open;
        if DMOficina.QOSContaReceberCons.RecordCount = 0 then
          raise exception.Create('Não foi encontrado no contas a receber as parcelas para O.S.');
        while not DMOficina.QOSContaReceberCons.Eof do
        begin
          Imp.WriteXY(0.5, mCont, Bib.NumToTexto(DMOficina.QOSContaReceberConsCOD_CONTA_RECEBER_CAB.Value, 0, 8));
          Imp.WriteXY(2.8, mCont, Bib.NumToTexto(DMOficina.QOSContaReceberConsVAL_TITULO.Value, 2, 8));
          Imp.WriteXY(4.0, mCont, Bib.NumToTexto(DMOficina.QOSContaReceberVAL_JUROS.Value, 2, 8));
          Imp.WriteXY(5.8, mCont, DateToStr(DMOficina.QOSContaReceberConsDT_VENCIMENTO.Value));
          mCont := mCont + 1;
          DMOficina.QOSContaReceberCons.Next;
        end;
        DMOficina.QOSContaReceberCons.Close;
        mCont := mCont + 5;
        Imp.WriteXY(18.8, mCont, wNumNota);
        mCont := mCont + 3;
        Imp.WriteXY(0.5, mCont, '        ');
        Imp.FechaImpressora; // Finaliza os serviços de Impressao
      end; // Final end que verifica se filial e 1
    end;

    // Fechar bases abertas
    with DMOficina do
    begin
      QOSFechamento.RefreshRecord;
      QOSFechamento.Edit;
      //      if wAgronews then
      //        QOSFechamentoNUM_TITULO.Value := StrToInt(wNumNota)
      //      else
      QOSFechamentoNUM_TITULO.Value := StrToInt('0' + MENumOS.Text);
      QOSFechamentoVAL_NF_MAO_DE_OBRA.Value := StrToFloat('0' + EdValApl1.Text);
      QOSFechamentoVAL_NF_SERVICO_TERCEIRO.Value := StrToFloat('0' + EdValApl2.Text);
      QOSFechamentoVAL_NF_PECAS.Value := StrToFloat('0' + EdValApl3.Text);
      QOSFechamentoVAL_NF_PECAS_ISENTAS.Value := StrToFloat('0' + EdValApl4.Text);
      QOSFechamentoVAL_NF_SERVICO_CHAPEACAO.Value := StrToFloat('0' + EdValApl5.Text);
      QOSFechamentoVAL_NF_SERVICO_ELETRICO.Value := StrToFloat('0' + EdValApl6.Text);
      QOSFechamentoVAL_NF_LOCOMOCAO.Value := StrToFloat('0' + EdValApl7.Text);
      QOSFechamentoVAL_NF_MAO_DE_OBRA2.Value := StrToFloat('0' + EdValCalc1.Text);
      QOSFechamentoVAL_NF_SERVICO_TERCEIRO2.Value := StrToFloat('0' + EdValCalc2.Text);
      QOSFechamentoVAL_NF_PECAS2.Value := StrToFloat('0' + EdValCalc3.Text);
      QOSFechamentoVAL_NF_PECAS_ISENTAS2.Value := StrToFloat('0' + EdValCalc4.Text);
      QOSFechamentoVAL_NF_SERVICO_CHAPEACAO2.Value := StrToFloat('0' + EdValCalc5.Text);
      QOSFechamentoVAL_NF_SERVICO_ELETRICO2.Value := StrToFloat('0' + EdValCalc6.Text);
      QOSFechamentoVAL_NF_LOCOMOCAO2.Value := StrToFloat('0' + EdValCalc7.Text);
      QOSFechamentoCOD_SERIE.Value := wCodSerie;
      QOSFechamento.Post;
    end;
    if not DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.StartTransaction;
//    try
//      with DMSerie do
//      begin
//        QSerie.Edit;
//        QSerieNUM_SERIE.Value := QSerieNUM_SERIE.Value + 1; // Incrementa valor  da sequencia.
//        QSerie.Post;
//      end;
//    except
//      MessageDlg('Erro na tentativa de gravar número de sequencia para NF', mtWarning, [mbOk], 0);
//      DMOracle.DBCemapa.Rollback;
//      raise;
//    end;
    wNfServ := 0;
    wNfPeca := 0;
    if wNf then
    begin
      try
        //Inserindo itens para cair na nota
        with DMOSEmite do
        begin
          SetaEmissao(DMOficina.QOSFechamentoNUM_OS.Value);
          QOSItem.First;
          while not QOSItem.Eof do
            QOSItem.Delete; //Removendo itens antigos

          ValAuxDescTot := 0;
          QRequisicao.First;
          while not QRequisicao.Eof do
          begin
            QRequisicaoIt.First;
            while not QRequisicaoIt.Eof do
            begin
              Buscador := TBuscador.Create;
              Buscador.Limpa;
              Buscador.Adiciona('COD_TRIBUTACAO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QRequisicaoItCOD_PRODUTO.Text);
              Buscador.Adiciona('IND_TIPO_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QRequisicaoItCOD_PRODUTO.Text);
              Buscador.Buscar;

              QOSItem.Append;
              QOSItemNUM_OS.Value := DMOficina.QOSFechamentoNUM_OS.Value;
              QOSItemCOD_PRODUTO.Value := QRequisicaoItCOD_PRODUTO.Value;
              QOSItemCOD_TRIBUTACAO.Value := StrToInt('0' + Buscador.Proximo);
              QOSItemDESC_COMPLEMENTO.Value := QRequisicaoItDESC_PRODUTO.Value;
              QOSItemQT_QUANTIDADE.Value := QRequisicaoItQT_QUANTIDADE.Value;
              QOSItemVAL_UNITARIO.Value := QRequisicaoItVAL_UNITARIO.Value;
              QOSItemVAL_TOTAL.Value := QRequisicaoItval_total.Value;
              QOSItemVAL_DESPESA.Value := QRequisicaoItval_despesa.Value;
              QOSItemVAL_DESCONTO.Value := QRequisicaoItval_total.Value * (QRequisicaoItPERC_DESCONTO.Value / 100);
              QOSItemVAL_CUSTO.Value := QRequisicaoItVAL_CUSTO.Value;
              QOSItemCOD_LOTE_TIPO.Value := 1;
              if Buscador.Proximo = 'SERVIÇO' then
                QOSItemIND_TIPO.Value := 'S'
              else
              begin
                QOSItemIND_TIPO.Value := 'P';
                ValAuxDesc := StrToFloat(FormatFloat('#0.00', (QRequisicaoItval_total.Value*100/ValPecasSug) * (ValPecasSug - ValPecas) / 100));
                ValAuxDescTot := ValAuxDescTot + ValAuxDesc;
                if ValPecasSug > ValPecas then //Tem desconto, rateia no item
                  QOSItemVAL_DESCONTO.Value := ValAuxDesc;
              end;
              QOSItem.Post;
              QRequisicaoIt.Next;
            end;
            QRequisicao.Next;
            if (QRequisicao.Eof) and (ValAuxDescTot > 0) then
            begin
              wValDiferenca := ValPecasSug - ValPecas - ValAuxDescTot;
              while wValDiferenca <> 0 do
              begin
                if QOSItemIND_TIPO.Value = 'P' then
                begin
                  QOSItem.RefreshRecord;
                  QOSItem.Edit;
                  if(QOSItemVAL_DESCONTO.Value + wValDiferenca) < 0 then
                  begin
                    wValDiferenca := QOSItemVAL_DESCONTO.Value + wValDiferenca;
                    QOSItemVAL_DESCONTO.Value := 0
                  end
                  else
                  begin
                    QOSItemVAL_DESCONTO.Value := QOSItemVAL_DESCONTO.Value + wValDiferenca;
                    wValDiferenca := 0;
                  end;
                  QOSItem.Post;
                end;
                QOSItem.Prior;
              end;
            end;
          end;

          VerificaServico(QOSItem, MEProduto1.Text, EdValApl1.Text, EdLbl1.Text);
          VerificaServico(QOSItem, MEProduto2.Text, EdValApl2.Text, EdLbl2.Text);
          VerificaServico(QOSItem, MEProduto5.Text, EdValApl5.Text, EdLbl5.Text);
          VerificaServico(QOSItem, MEProduto6.Text, EdValApl6.Text, EdLbl6.Text);
        end;
        //Itens inseridos na TB_OS_ITEM, AGORA CHAMAR A GERACAO DA NOTA A PARTIR DOS DADOS DESTA TABELA

        //Gerando nota de serviços
        wNfServ := DMOSEmite.GeraNotaBancoByOSItem(DMOficina.QOSFechamentoNUM_OS.Value, False, True,
          StrToInt('0' + Trim(FmOperacaoS.MeOperacao.Text)), StrToInt('0'+wNumNota));
        if wNfServ > 0 then
        begin
          if RGPagto.ItemIndex = 1 then
          begin
            //DMOracle.ExecutaSql('UPDATE TB_CONTA_RECEBER_CAB SET COD_NOTA_CAB = ' +
            //  IntToStr(wNfServ) + ' WHERE NUM_OS = ' + wNumNota + ' AND COD_NOTA_CAB IS NULL', False);
            wParcelas := TStringList.Create;
            GeraParcelas(wParcelas, ValServicos, 'S');
            DMNotaSaida.GeraContaReceber(wParcelas, StrToInt(Trim(
                FmFinalidade.MeFinalidade.Text)), '', Trim(FmDepartamento.MeDepartamento.Text), '');
          end;
        end;

        //Gerando nota de produtos
        wNfPeca := DMOSEmite.GeraNotaBancoByOSItem(DMOficina.QOSFechamentoNUM_OS.Value, True, False,
          0, 0, IfThen(ValPecasSug < ValPecas, ValPecas - ValPecasSug, 0));
        if wNfPeca > 0 then
        begin
          if (RGPagto.ItemIndex = 1) then
          begin //Se houve nota de produtos e for à prazo, gerar parcelas dos produtos.
            with DMNotaSaida.QSomaItemNota do
            begin
              Close;
              Open;
            end;
            wParcelas := TStringList.Create;
            wValPecas := ValPecas;
            GeraParcelas(wParcelas, wValPecas, 'P');
            DMNotaSaida.GeraContaReceber(wParcelas, StrToInt(Trim(
                FmFinalidade.MeFinalidade.Text)), '', Trim(FmDepartamento.MeDepartamento.Text), '');
          end;
        end;
        If RgPagto.ItemIndex = 0 then //OS a vista cair no caixa. Vanessa 17/04/2015
        Begin
          wOperacao := DmNotaSaida.QNotaSaidaCOD_OPERACAO.Text;
          wFilial := DMNotaSaida.QNotaSaidaCOD_FILIAL.Text;
          wDepartamento := dmnotasaida.QNotaSaidaCOD_DEPARTAMENTO.Text;
          wNumNota := dmnotasaida.QNotaSaidaNUM_NOTA.Text;
          wCadastro := dmnotasaida.QNotaSaidaCOD_CADASTRO.Text;
          wNotaCab := dmnotasaida.QNotaSaidaCOD_NOTA_CAB.Text;
          wDate := trunc(dmnotasaida.QNotaSaidaDT_MOVIMENTO.Value);
          //valor das pecas e serviços em um mesmo lançamento no caixa.
          DMNotaSaida.AtuCaixa(Strtofloat(Trim(EdValTotalNF.Text)),'', wOperacao, wFilial, wDepartamento, wNumNota, wCadastro, wNotaCab, '', wDate);
        end;
      except
        on E: Exception do
        begin
          DMOracle.DBCemapa.Rollback;
          Raise Exception.Create('Erro ao gerar notas:' + #13 + #10 + e.Message);
          Exit;
        end;
      end;
    end;
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
    Raise;
  end;
  try
    if wNf then
    begin
      if wNfServ > 0 then
        FNotaImpressao.EmiteNF(wNfServ,'',0,true);
      if wNfPeca > 0 then
        FNotaImpressao.EmiteNF(wNfPeca);
      DMOracle.DBCemapa.Commit;
    end;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message + #13 + #10 +
        'As notas foram geradas, mas não emitidas com êxito.'+#13+#10+
        'Se NÃO saiu nota de serviço e EXISTEM serviços nesta OS, abra o PjVendas e emita cópia da nota código .'+#13+#10+
        'Se NÃO saiu nota DANFE e EXISTEM peças nesta OS, abra o PjVendas e emita cópia da nota código .',
        mtInformation, [mbOK], 0);
    end;
  end;

  if (not wNf) and (DMOficina.QOSFechamentoCOD_FILIAL.Value = 1) and
    (MessageDlg('Deseja imprimir cópia Nota Fiscal?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      CopiaNotaOficina;

  DMOficina.QOSFechamento.Close;
  DMSerie.QSerie.Close;
  DMOperacao.QOperacao.Close;
  wAux := MENumOS.Text;
  LimpaTela(True);
  MENumOS.Text := wAux;
  Refresh;

  //  if wAgronews then
  //  begin
  //    try
  //      DMOracle.DBCemapa.Commit;
  //      MessageDlg('OS fechada com sucesso!', mtInformation, [mbOK], 0);
  //    except
  //      DMOracle.DBCemapa.Rollback;
  //      Raise;
  //    end;
  //    LimpaTela;
  //  end;
end;

procedure TFOSFechamento.BtApagaParcelaClick(Sender: TObject);
begin
  inherited;
  if Pos(' P ', LBContaReceber.Items[LBContaReceber.ItemIndex]) = 0 then
    TotalParcelasServicos := TotalParcelasServicos - StrToFloat(Parcelas[LBContaReceber.ItemIndex])
  else
    TotalParcelasPecas := TotalParcelasPecas - StrToFloat(Parcelas[LBContaReceber.ItemIndex]);
  Parcelas.Delete(LBContaReceber.ItemIndex);
  LBContaReceber.Items.Delete(LBContaReceber.ItemIndex);
end;

procedure TFOSFechamento.MEDiasCPExit(Sender: TObject);
begin
  inherited;
  if Trim(MEDiasCP.Text) <> '' then
  begin
    MEDataCP.Text := DateToStr(DMOficina.QOSFechamentoDT_EMISSAO.Value + StrToFloat(MEDiasCP.Text));
    MEDiasCP.Text := '';
  end;
end;

procedure TFOSFechamento.MEValorCRExit(Sender: TObject);
var
  wLinha, wAux, wTipo: string;
const
  wBranco: string = '                            ';
begin
  if rgTipoProduto.ItemIndex < 0 then
  begin
    MessageDlg('Por favor, selecione o tipo de parcela (Peça ou Serviço).',
      mtError, [mbOk], 0);
    Abort;
  end;
  if (MEDataCP.Text <> '') and (MEValorCR.Text <> '') then
  begin
    try
      if StrToDate(MEDataCp.Text) < Date then
        raise Exception.Create('Data de Vencimento Menor que Data Atual!');
      wLinha := DateToStr(StrToDate(MEDataCP.Text));
    except
      raise Exception.Create('Informe uma data válida!');
    end;
    
    if rgTipoProduto.Items[rgTipoProduto.itemIndex] = 'Peça' then
    begin
      wLinha := wLinha + ' P';
      if  RoundTo((TotalParcelasPecas +StrToFloat(MEValorCR.Text)),-2) > RoundTo(ValPecas,-2) then
        raise Exception.Create('A soma das parcelas de peças não pode exceder o valor total das peças.')
      else
        TotalParcelasPecas := TotalParcelasPecas + StrToFloat(MEValorCR.Text);
    end
    else
    begin
      wLinha := wLinha + ' S';
      if  RoundTo((TotalParcelasServicos + StrToFloat(MEValorCR.Text)),-2) > RoundTo(ValServicos,-2) then
        raise Exception.Create('A soma das parcelas do serviço não pode exceder o valor total do Serviço.')
      else
        TotalParcelasServicos := TotalParcelasServicos + StrToFloat(MEValorCR.Text);
    end;

    wAux := FormatFloat('###,###,##0.00', StrToFloat(MEValorCR.Text));
    wAux := Copy(wBranco, 1, 15 - Length(waux) + 2) + wAux;
    wLinha := wLinha + wAux;
    LBContaReceber.Items.Add(wLinha);
    Parcelas.Add(MEValorCR.Text);
    // Muda para venda aprazo.
    RGPagto.ItemIndex := 1;

    MEDataCP.Text := '';
    MEValorCR.Text := '';
//    MEDiasCP.SetFocus;
  end;
end;

procedure TFOSFechamento.OS_GeraContaReceber(wListaParcela: TStrings;
  wFinalidade: Integer;
  wBancoAgencia, wDepartamento: string;
  wNf: Boolean);
var
  wTotalParcelas, wValServ: Extended;
  wCont: Integer;
  wAux: string;
  wVista: Boolean;
begin
  wTotalParcelas := 0;
  wVista := RGPagto.ItemIndex = 0;
  for wCont := 0 to wListaParcela.Count - 1 do
  begin
    wAux := Copy(wListaParcela[wCont], 13, 15);
    wAux := Bib.LimpaString(wAux, '.');
    wTotalParcelas := wTotalParcelas + StrToFloat(wAux);
  end;
  with DMOficina do
  begin
    QOSContaReceber.Close;
    QOSContaReceber.SetVariable('PK', 0);
    QOSContaReceber.Open;
    QOSContaReceberMov.Open;

    wValServ := ValServicos;
    wTotalParcelas := 0; //Reutilizando variavel.
    for wCont := 0 to wListaParcela.Count - 1 do
    begin
      try
        QOSContaReceber.Insert;
        QOSContaReceberCOD_CONTA_RECEBER_CAB.Value := DMOracle.Sequencia('CONTA_RECEBER');
        QOSContaReceberCOD_FINALIDADE.Value := wFinalidade;
        if Trim(wBancoAgencia) <> '' then
          QOSContaReceberCOD_BANCO_AGENCIA.Value := 0; // StrToInt(Trim(wBancoAgencia));
        QOSContaReceberCOD_CADASTRO.Value := DMOFicina.QOSFechamentoCOD_CADASTRO.Value;
        QOSContaReceberCOD_FILIAL.Value := DMOficina.QOSFechamentoCOD_FILIAL.Value;
        QOSContaReceberCOD_DEPARTAMENTO.Text := wDepartamento;
        if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS') and
          (DMOficina.QOSFechamentoCOD_FILIAL.Value = 1) then
          QOSContaReceberDESC_TIPO_DOCUMENTO.Value := 'NF'
        else
          QOSContaReceberDESC_TIPO_DOCUMENTO.Value := 'OS';

        if wVista then // Pagamento a vista.
        begin
          QOSContaReceberDT_VENCIMENTO.Value := DMOracle.DataServ;
          QOSContaReceberIND_SITUACAO.Value := 'BAIXA TOTAL';
          QOSContaReceberDT_BAIXA.Value := DMOracle.DataServ;
        end
//        if RGPagto.ItemIndex = 1 then
        else
        begin
          QOSContaReceberDT_VENCIMENTO.Value := StrToDate(Copy(wListaParcela[wCont], 1, 10));
          QOSContaReceberIND_SITUACAO.Value := 'ABERTO';
        end;

        QOSContaReceberNUM_TITULO.Value := StrToInt(MENumOS.Text);
        QOSContaReceberNUM_OS.Value := StrToInt(MENumOS.Text);
        QOSContaReceberNUM_PARCELA.Value := wCont + 1;
        QOSContaReceberDT_MOVIMENTO.Value := DMOracle.DataServ;
        QOSContaReceberDT_EMISSAO.Value := DMOracle.DataServ;
        QOSContaReceberDT_CAPITALIZACAO_MOEDA.Value := DMOracle.DataServ;
        with DMFinalidade do
        begin
          QFinalidade.Close;
          QFinalidade.SetVariable('PK', wFinalidade);
          QFinalidade.Open;
          if QFinalidadeInd_Encargo.Value = 'EMISSAO' then
            QOSContaReceberDT_CAPITALIZACAO.Value := QOSContaReceberDT_EMISSAO.Value
          else
            QOSContaReceberDT_CAPITALIZACAO.Value := QOSContaReceberDT_VENCIMENTO.Value;
        end;
        wAux := Copy(wListaParcela[wCont], 11, 15);
        wAux := Bib.LimpaString(wAux, '.');
//        if RGPagto.ItemIndex <> 0 then // Pagamento a prazo.
//          QOSContaReceberVAL_TITULO.Value := StrToFloat(wAux)
//        else
//          QOSContaReceberVAL_TITULO.Value := 0;
        if wNf and (not wVista) then
        begin
          if wCont = wListaParcela.Count - 1 then
            QOSContaReceberVAL_ORIGINAL.Value := wValServ - wTotalParcelas //Ultima parcela recebe o restante
          else
            QOSContaReceberVAL_ORIGINAL.Value := StrToFloat(FormatFloat('#0.00', wValServ / wListaParcela.Count));
          wTotalParcelas := wTotalParcelas + QOSContaReceberVAL_ORIGINAL.Value;
        end
        else
          QOSContaReceberVAL_ORIGINAL.Value := StrToFloat(wAux);
        if wVista then
          QOSContaReceberVAL_TITULO.Value := 0
        else
          QOSContaReceberVAL_TITULO.Value := QOSContaReceberVAL_ORIGINAL.Value;

        QOSContaReceberIND_ACEITE.Value := 'NAO';

//        QOSContaReceberVAL_ORIGINAL.Value := QOSContaReceberVAL_TITULO.Value;
        QOSContaReceberPERC_COMISSAO.Value := 0; //QNotaSaidaPerc_Comissao.Value;
        QOSContaReceberCOD_VENDEDOR.Value := DMOficina.QOSFechamentoCOD_VENDEDOR.Value;
        QOSContaReceber.Post;

        QOSContaReceberMov.Insert;
        QOSContaReceberMovCOD_CONTA_RECEBER_CAB.Value := QOSContaReceberCod_Conta_Receber_Cab.Value;
        QOSContaReceberMovCOD_CONTA_RECEBER_MOV.Value := DMOracle.Sequencia('CONTA_RECEBER_MOV');
        QOSContaReceberMovDT_MOVIMENTO.Value := DMOracle.DataServ;
        QOSContaReceberMovIND_TIPO_MOVIMENTO.Value := 'PRINCIPAL';
        QOSContaReceberMovDT_USUARIO.Value := DMOracle.DataHoraServ;
        QOSContaReceberMovCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
        QOSContaReceberMovVAL_MOVIMENTO.Value := QOSContaReceberVAL_ORIGINAL.Value;
        QOSContaReceberMov.Post;
        if wVista then // Pagamento a vista.
        begin
          // Gera movimento caixa.
          DMCaixa.QCaixa_Mov.Open;
          DMCaixa.QCaixa_Mov.Insert;
          DMCaixa.QCaixa_MovCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
          DMCaixa.QCaixa_MovDT_USUARIO.Value := DMOracle.DataHoraServ;
          DMCaixa.QCaixa_MovCOD_FILIAL.Value := DMOficina.QOSFechamentoCOD_FILIAL.Value;
          DMCaixa.QCaixa_MovCOD_DEPARTAMENTO.Value := StrToInt(Trim(FmDepartamento.MeDepartamento.Text));
          DMCaixa.QCaixa_MovCOD_HISTORICO.Value := wFinalidade;
          DMcaixa.QCaixa_MovDT_MOVIMENTO.value := DMOracle.DataServ;
          DMcaixa.QCaixa_MovVAL_MOVIMENTO.value := StrToFloat(EdValTotalNF.Text);
          DMcaixa.QCaixa_MovNUM_DOCUMENTO.value := StrToInt(MENumOS.Text);
          DMcaixa.QCaixa_MovCOD_CADASTRO.value := DMOficina.QOSFechamentoCOD_CADASTRO.Value;
          DMcaixa.QCaixa_MovCOD_CONTA_RECEBER_CAB.value := DMOficina.QOSContaReceberCOD_CONTA_RECEBER_CAB.Value;
          DMCaixa.QCaixa_Mov.Post;

          QOSContaReceberMov.Insert;
          QOSContaReceberMovCOD_CONTA_RECEBER_CAB.Value := QOSContaReceberCod_Conta_Receber_Cab.Value;
          QOSContaReceberMovCOD_CONTA_RECEBER_MOV.Value := DMOracle.Sequencia('CONTA_RECEBER_MOV');
          QOSContaReceberMovDT_MOVIMENTO.Value := DMOracle.DataServ;
          QOSContaReceberMovIND_TIPO_MOVIMENTO.Value := 'RECEBTO. PRINCIPAL';
          QOSContaReceberMovDT_USUARIO.Value := DMOracle.DataHoraServ;
          QOSContaReceberMovCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
          QOSContaReceberMovVAL_MOVIMENTO.Value := QOSContaReceberVAL_ORIGINAL.Value;
          QOSContaReceberMovCOD_CAIXA_MOV.Value := DMcaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
          QOSContaReceberMov.Post;
        end;
      except
        if QOSContaReceberMov.State in [dsEdit, dsInsert] then
          QOSContaReceberMov.Cancel;
        if QOSContaReceber.State in [dsEdit, dsInsert] then
          QOSContaReceber.Cancel;
        raise;
      end;
    end;
    QOSContaReceberMov.Close;
    QOSContaReceber.Close;
  end;
end;

procedure TFOSFechamento.EdValTotalNFEnter(Sender: TObject);
var
  mValorTotal: Real;
begin
  inherited;
  mValorTotal := 0; // Incia valor da variavel.
  if Trim(EdValApl1.Text) <> '' then
  begin
    EdValApl1.Text := FormatFloat('##0.00', StrToFloat(EdValApl1.Text));
    mValorTotal := mValorTotal + StrToFloat(EdValApl1.Text);
  end;
  if Trim(EdValApl2.Text) <> '' then
  begin
    EdValApl2.Text := FormatFloat('##0.00', StrToFloat(EdValApl2.Text));
    mValorTotal := mValorTotal + StrToFloat(EdValApl2.Text);
  end;
  if Trim(EdValApl3.Text) <> '' then
  begin
    EdValApl3.Text := FormatFloat('##0.00', StrToFloat(EdValApl3.Text));
    mValorTotal := mValorTotal + StrToFloat(EdValApl3.Text);
  end;
  if Trim(EdValApl4.Text) <> '' then
  begin
    EdValApl4.Text := FormatFloat('##0.00', StrToFloat(EdValApl4.Text));
    mValorTotal := mValorTotal + StrToFloat(EdValApl4.Text);
  end;
  if Trim(EdValApl5.Text) <> '' then
  begin
    EdValApl5.Text := FormatFloat('##0.00', StrToFloat(EdValApl5.Text));
    mValorTotal := mValorTotal + StrToFloat(EdValApl5.Text);
  end;
  if Trim(EdValApl6.Text) <> '' then
  begin
    EdValApl6.Text := FormatFloat('##0.00', StrToFloat(EdValApl6.Text));
    mValorTotal := mValorTotal + StrToFloat(EdValApl6.Text);
  end;
  if Trim(EdValApl7.Text) <> '' then
  begin
    EdValApl7.Text := FormatFloat('##0.00', StrToFloat(EdValApl7.Text));
    mValorTotal := mValorTotal + StrToFloat(EdValApl7.Text);
  end;
  EdValTotalNF.Text := FormatFloat('##0.00', mValorTotal);
end;

procedure TFOSFechamento.CancelarNF1Click(Sender: TObject);
var
  wNum_titulo, wNfe, wBuscaNfe, wNf, wCondNfe, wCr, wNumeroNf, wDataOs: string;
  wcod_nota_cab : String;
  Buscador: TBuscador;
begin
  inherited;
  if FOFI0012 = nil then
     FOFI0012 := TFOFI0012.Create(Application);
  if FOFI0012.ShowModal = mrOK then
  begin
    if Trim(FOFI0012.EdNUM_OS.Text) = '' then
       raise exception.Create('Número da O.S. não foi informado!');

    wBuscaNfe := MontaSelect('N.COD_NOTA_CAB', 'TB_NOTA_CAB N', 'N.NUM_OS = ' + Trim(FOFI0012.EDNum_OS.Text));
    wCr := MontaSelect('COD_CONTA_RECEBER_CAB', 'TB_CONTA_RECEBER_CAB', 'COD_NOTA_CAB IN (' + wBuscaNfe + ')');
    Buscador := TBuscador.Create;
    Buscador.Limpa;
    Buscador.Adiciona('COUNT(*)', 'TB_CONTA_RECEBER_MOV', 'COD_CONTA_RECEBER_CAB IN (' +
      wCr + ') AND IND_TIPO_MOVIMENTO <> ' + QuotedStr('PRINCIPAL'));
    Buscador.Adiciona('NUM_TITULO', 'TB_OS', 'NUM_OS =' + FOFI0012.EDNum_OS.Text);
    wCondNfe := ' AND ''55'' = (' + MontaSelect('S.COD_SERIE_MODELO', 'TB_SERIE S',
      'S.COD_SERIE = N.COD_SERIE AND S.COD_SERIE_MODELO=N.COD_SERIE_MODELO AND S.COD_FILIAL = N.COD_FILIAL') + ')';
    Buscador.Adiciona(wBuscaNfe + wCondNfe);
    Buscador.Adiciona('N.NUM_NOTA', 'TB_NOTA_CAB N', 'N.NUM_OS = ' + Trim(FOFI0012.EDNum_OS.Text) + wCondNfe);
    Buscador.Adiciona('DT_ENTRADA', 'TB_OS', 'NUM_OS =' + FOFI0012.EDNum_OS.Text);
    Buscador.Buscar;

    if Buscador.Proximo > '0' then //Qualquer título com tipo de movimento diferente de 'PRINCIPAL'.
       Raise Exception.Create('Contas à receber geradas pela nota fiscal já possuem baixas. É necessário voltar as baixas para cancelar.');
    wNum_titulo := Buscador.Proximo;
    wNfe := Buscador.Proximo;
    wNumeroNf := Buscador.Proximo;
    wDataOs := Buscador.Proximo;

    with DMOficina do
    begin
      QOSContaReceberCons.Close;
      QOSContaReceberCons.SetVariable('NUM_OS', wNum_titulo);
      QOSContaReceberCons.SetVariable('DT_MIN', wDataOs);
      QOSContaReceberCons.Open;
      if ((DMOficina.QOSContaReceberCons.RecordCount > 0) and (DMOficina.QOSContaReceberConsIND_SITUACAO.Text <> 'ABERTO')) then
         raise exception.Create('Registro já baixado no Contas a Receber para esta O.S.');
      QOSContaReceberCons.Close;
    end;

    if StrToInt(DMOracle.BuscaNome('SELECT TB_OS.IND_CONDICAO_PAGTO FROM TB_OS', 'TB_OS.NUM_OS = ' +
      Trim(FOFI0012.EdNUM_OS.Text))) <> 1 then
      raise exception.Create('Os títulos gerados no Contas a Receber já foram baixados e devem ser voltados e excluidos para que a nota possa ser excluida.');

    with DMOficina do
    begin
      QOSVoltaFechamento.Close;
      QOSVoltaFechamento.SetVariable('PK', FOFI0012.EdNUM_OS.Text);
      QOSVoltaFechamento.Open;

      if QOSVoltaFechamento.RecordCount = 0 then
        raise exception.Create('O.S. informada não foi encontrada ou não está fechada! Verifique!');

      if QOSVoltaFechamentoIND_SITUACAO.Value <> 'F' then
        raise exception.Create('O.S. não está fechada!');

      QOSVoltaFechamento.Edit;
      QOSVoltaFechamentoIND_SITUACAO.Value := 'A'; // Aberta.
      QOSVoltaFechamento.Post;

      QLocalizaContaReceberCab.Close;
      QLocalizaContaReceberCab.SetVariable('COD_CADASTRO', FloatToStr(QOSVoltaFechamentoCOD_CADASTRO.Value));
      QLocalizaContaReceberCab.SetVariable('NUM_TITULO', FloatToStr(QOSVoltaFechamentoNUM_TITULO.Value));
      QLocalizaContaReceberCab.Open;

      try
        if DMOracle.DBCemapa.InTransaction = false then
           DMOracle.DBCemapa.StartTransaction;
        QLocalizaContaReceberCab.First;
        while not (QLocalizaContaReceberCab.Eof) do
        begin
          //Localiza movimento do contas a receber
          QOSCtaReceberExcluiMov.Close;
          QOSCtaReceberExcluiMov.SetVariable('COD_CONTA_RECEBER_CAB', QLocalizaContaReceberCabCOD_CONTA_RECEBER_CAB.Value);
          QOSCtaReceberExcluiMov.Open;

          //Localiza movimento caixa
          QOSCaixaExcluirMov.Close;
          QOSCaixaExcluirMov.SetVariable('COD_CONTA_RECEBER_CAB', QLocalizaContaReceberCabCOD_CONTA_RECEBER_CAB.Value);
          QOSCaixaExcluirMov.Open;

          //Localiza conta a receber
          QOSCtaReceberExcluiCab.Close;
          QOSCtaReceberExcluiCab.SetVariable('PK', QLocalizaContaReceberCabCOD_CONTA_RECEBER_CAB.Value);
          QOSCtaReceberExcluiCab.Open;

          // este laço excluir o movimento do contas a receber
          while not QOSCtaReceberExcluiMov.Eof do
            QOSCtaReceberExcluiMov.Delete;

          // este laço exclui o movimento do caixa
          while not QOSCaixaExcluirMov.Eof do
            QOSCaixaExcluirMov.Delete;

          if QOSCtaReceberExcluiCab.RecordCount > 0 then
             QOSCtaReceberExcluiCab.Delete;
          QLocalizaContaReceberCab.Next;
        end;

        //deleta do Caixa os lancamentos de OS a vista. Vanessa 21/07/2016
        wcod_nota_cab := DMOracle.FastSelect('COD_NOTA_CAB','TB_CAIXA_MOV','NUM_DOCUMENTO = '
          + wNum_titulo + 'AND COD_NOTA_CAB is not null');

        if wcod_nota_cab <> '' then
        begin
          QDeletaCaixaAvista.Close;
          QDeletaCaixaAvista.SetVariable('COD_NOTA_CAB', strtoint(wcod_nota_cab));
          QDeletaCaixaAvista.Open;
        end;

        //        DMOSEmite.VoltaNotaBanco(QOSVoltaFechamentoNUM_OS.Value);
        Executador.Limpa;
        if wNfe <> '' then
        begin
          Executador.Adiciona(MontaDelete('TB_CONTA_RECEBER_MOV', 'COD_CONTA_RECEBER_CAB IN (' +
            MontaSelect('COD_CONTA_RECEBER_CAB', 'TB_CONTA_RECEBER_CAB', 'COD_NOTA_CAB = ' + wNfe) + ')'));
          Executador.Adiciona(MontaDelete('TB_CONTA_RECEBER_CAB', 'COD_NOTA_CAB = ' + wNfe));
          Executador.Adiciona('IND_SITUACAO = ' + QuotedStr('1') + ', NUM_OS = NULL ',
            'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + wNfe); //Deixa a NF-e digitada para cancelar ou excluir pelo vendas, além de remover a referência para a os para o caso da OS ser confirmada novamente.
        end;
        Executador.Adiciona(MontaDelete('TB_CONTA_RECEBER_MOV',
            'COD_CONTA_RECEBER_CAB IN (' + wCr + ')'));
        Executador.Adiciona(MontaDelete('TB_CONTA_RECEBER_CAB',
            'COD_CONTA_RECEBER_CAB IN (' + wCr + ')'));
        wNf := MontaSelect('COD_NOTA_CAB', 'TB_NOTA_CAB', 'NUM_OS = ' + Trim(FOFI0012.EDNum_OS.Text) +
          IfThen(wNfe <> '', ' AND COD_NOTA_CAB <> ' + wNfe));
        Executador.Adiciona('IND_SITUACAO = ' + QuotedStr('1') + ', NUM_OS = NULL ',
          'TB_NOTA_CAB', 'COD_NOTA_CAB IN (' + wNf + ')'); //Deixa a NF de Serviço cancelada.
        Executador.Adiciona(MontaDelete('TB_CAIXA_MOV','COD_NOTA_CAB IN (' + wNf + ')'));
        if Trim(wNfe) <> '' then
          Executador.Adiciona(MontaDelete('TB_CAIXA_MOV','COD_NOTA_CAB IN (' + wNfe + ')'));
        Executador.Executar;

        DMOracle.DBCemapa.Commit; // nao tava dando commit na volta da OS.
        if (wNfe <> '') then
          MessageDlg('Atenção, NF está como digitada, agora você precisa abrir ela no PjVendas e:'+#13+#10+
              ' - Se foi emitido DANFE: cancelar;'+#13+#10+
              ' - Se NÃO foi emitido DANFE: excluir.'+#13+#10+#13+#10+
              'Código NF: ' + wNfe + '. Número: ' + wNumeroNf + '.', mtWarning, [mbOK], 0);
        if (wcod_nota_cab <> '') then
          MessageDlg('Atenção, NF está como digitada, agora você precisa abrir ela no PjVendas e:'+#13+#10+
              ' - Se foi emitido DANFE: cancelar;'+#13+#10+
              ' - Se NÃO foi emitido DANFE: excluir.'+#13+#10+#13+#10+
              'Código NF: ' + wcod_nota_cab + '. Número: ' + wNum_titulo + '.', mtWarning, [mbOK], 0);
      except
        DMOracle.DBCemapa.Rollback;
        raise;
      end;
    end;
  end;
end;

procedure TFOSFechamento.CopiaNotaOficina();
var
  wAux, wNumOS, wCodSerie, wPagto: string;
  wNumNota: string;
  wTotalParcelas, wCont: Real;
  wLpt_Nota: string;
  wX: Integer;
begin
  inherited;

  if (Trim(EdValTotalNF.Text) = '') or (Trim(EdValApl1.Text) = '') or
    (Trim(EdValApl2.Text) = '') or (Trim(EdValApl3.Text) = '') or (Trim(EdValApl4.Text) = '') then
    raise exception.Create('Valores a serem aplicados não podem ficar em branco!');

  // Venda a vista gera uma parcela baixada no contas a receber.
  //if RGPagto.ItemIndex = 0 then
  //begin
  //  wLinha := DateToStr(Date);
  //  wAux := FormatFloat('###,###,##0.00',StrToFloat(EdValTotalNF.Text));
  //  wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
  //  wLinha := wLinha + wAux;
  //  LBContaReceber.Items.Add(wLinha);
  //end;

  if (DMOficina.QOSFechamentoCOD_FILIAL.Value = 1) and (FmMensagem.MeMensagem.Text = '') then
    raise exception.Create('Mensagem deve ser informada!');

  if Trim(FmFinalidade.MeFinalidade.Text) = '' then
    raise exception.Create('Finalidade deve ser informada!');
  if Trim(FmDepartamento.MeDepartamento.Text) = '' then
    raise exception.Create('Departamento deve ser informado!');
  if Trim(FmOperacao.MeOperacao.Text) = '' then
    raise exception.Create('Operação deve ser informada!, Preencha e tente novamente!');
  if Trim(EdValTotalNF.Text) = '' then
    raise exception.Create('Verifique Total Nota Fiscal!');

  wTotalParcelas := 0;
  for wX := 0 to LBContaReceber.Items.Count - 1 do
  begin
    wAux := Copy(LBContaReceber.Items[wX], 11, 15);
    wAux := Bib.LimpaString(wAux, '.');
    wTotalParcelas := wTotalParcelas + StrToFloat(wAux);
  end;
  if Abs(wTotalParcelas - StrToFloat(Trim(EdValTotalNF.Text))) > 0.01 then
    raise exception.Create('Total das parcelas ' + Trim(FloatToStr(wTotalParcelas)) + ' não confere com total NF. ' + Trim(EdValTotalNF.Text));

  wNumOs := DMOracle.BuscaNome('SELECT NUM_OS FROM TB_OS', 'NUM_OS = ' + FloatToStr(DMOficina.QOSFechamentoNUM_OS.Value));
  if Trim(wNumOs) = '' then
  begin
    MessageDlg('Os informada não foi encontrada, Tente novamente!', mtWarning, [mbOk], 0);
    Exit;
  end;

  wNumNota := ''; // Inicializa valor da variavel

  // Verifica tipo de pagamento.
  if RGPagto.ItemIndex = 0 then
    wPagto := '1' // Avista
  else
    wPagto := '2'; // Aprazo

  // Alimenta variaveis com valores padroes da tabela tb_param_sistema.
  DMOperacao.QOperacao.Close;
  DMOperacao.QOperacao.SetVariable('PK', FmOperacao.MeOperacao.Text);
  DMOperacao.QOperacao.Open;
  if DMOperacao.QOperacaoInd_Emite.Value = 'F' then
    wCodSerie := DMParamSistema.QParamSistemaCOD_SERIE_NOTA.Value
  else
    wCodSerie := DMParamSistema.QParamSistemaCOD_SERIE_PEDIDO.Value;

  // Consulta valor atual da nota fiscal.
  with DMSerie do
  begin
    QSerie.Close;
    QSerie.SetVariable('COD_FILIAL', DMOficina.QOSFechamentoCOD_FILIAL.Value);
    QSerie.SetVariable('COD_SERIE', wCodSerie);
    QSerie.Open;
    if QSerie.RecordCount = 0 then
      raise exception.Create('Erro na tentativa de pegar sequencia para Nota Fiscal!');
    wNumNota := IntToStr(QSerieNUM_SERIE.Value);
  end;

  if DMOficina.QOSFechamentoCOD_FILIAL.Value = 1 then
  begin
    // Pega parametros para impressão da nota fiscal.
    wLpt_Nota := DMOracle.BuscaNome('SELECT DESC_LPT_NOTA FROM TB_FILIAL', 'COD_FILIAL = ' + FloatToStr(DMOficina.QOSFechamentoCOD_FILIAL.Value));
    if Imp = nil then
      Imp := TImp.Create;

    if Trim(wLpt_Nota) = 'LPT1' then
      Imp.AbreImpressora
    else if Trim(wLpt_Nota) = 'LPT2' then
      Imp.AbreImpressora_Lpt2
    else
      Imp.AbreImpressora_Com2;

    Imp.ConfiguraImpressora('CONDENSADO_ON', 'SEXTOS', 78);
    // COMEÇA IMPRESSÃO DA NOTA FISCAL

    wCont := 2;

    Imp.WriteXY(12.9, wCont, 'X');
    Imp.WriteXY(18.3, wCont, wNumNota);
    wCont := wCont + 5;
    Imp.WriteXY(0.5, wCont, DMOperacao.QOperacaoDESC_OPERACAO.Value);
    //Imp.WriteXY(6.8, wCont, DMOperacao.QOperacaoNUM_NATUREZA_EST.Text);
    wCont := wCont + 3;
    Imp.WriteXY(0.5, wCont, DMOficina.QOSFechamentoCOD_CADASTRO.Text);
    Imp.WriteXY(1.4, wCont, DMOficina.QOSFechamentonome_cadastro.Value);
    Imp.WriteXY(12.8, wCont, DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMOficina.QOSFechamentoCOD_CADASTRO.Value)));
    Imp.WriteXY(18.2, wCont, DateToStr(DMOracle.DataServ));
    wCont := wCont + 2;
    Imp.WriteXY(0.5, wCont, DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMOficina.QOSFechamentoCOD_CADASTRO.Value)));
    Imp.WriteXY(11.0, wCont, DMOracle.BuscaNome('SELECT DESC_BAIRRO    FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMOficina.QOSFechamentoCOD_CADASTRO.Value)));
    Imp.WriteXY(15.1, wCont, DMOracle.BuscaNome('SELECT DESC_CEP       FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMOficina.QOSFechamentoCOD_CADASTRO.Value)));
    Imp.WriteXY(18.2, wCont, DateToStr(DMOracle.DataServ));
    wCont := wCont + 2;
    Imp.WriteXY(0.5, wCont, DMOracle.BuscaNome('SELECT DESC_CIDADE   FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMOficina.QOSFechamentoCOD_CADASTRO.Value)));
    Imp.WriteXY(8.1, wCont, DMOracle.BuscaNome('SELECT DESC_TELEFONE FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMOficina.QOSFechamentoCOD_CADASTRO.Value)));
    Imp.WriteXY(11.8, wCont, DMOracle.BuscaNome('SELECT COD_ESTADO    FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMOficina.QOSFechamentoCOD_CADASTRO.Value)));
    Imp.WriteXY(12.8, wCont, DMOracle.BuscaNome('SELECT NUM_INSCRICAO FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMOficina.QOSFechamentoCOD_CADASTRO.Value)));
    Imp.WriteXY(18.2, wCont, TimeToStr(Time));
    wCont := wCont + 4;
    if Trim(EdValApl1.Text) <> '' then
    begin
      Imp.WriteXY(1.9, wCont, EdLbl1.Text); // Valor mao de obra
      Imp.WriteXY(13.9, wCont, Bib.NumToTexto(StrToFloat(EdValApl1.Text), 2, 11));
      Imp.WriteXY(16.2, wCont, Bib.NumToTexto(StrToFloat(EdValApl1.Text), 2, 11));
    end;
    wCont := wCont + 1;
    if Trim(EdValApl2.Text) <> '' then
    begin
      Imp.WriteXY(1.9, wCont, EdLbl2.Text); // Valor serviços terceiro
      Imp.WriteXY(13.9, wCont, Bib.NumToTexto(StrToFloat(EdValApl2.Text), 2, 11));
      Imp.WriteXY(16.2, wCont, Bib.NumToTexto(StrToFloat(EdValApl2.Text), 2, 11));
    end;
    wCont := wCont + 1;
    if Trim(EdLbl3.Text) <> '' then
    begin
      Imp.WriteXY(1.9, wCont, EdLbl3.Text); // Valor peças aplicadas
      Imp.WriteXY(13.9, wCont, Bib.NumToTexto(StrToFloat(EdValApl3.Text), 2, 11));
      Imp.WriteXY(16.2, wCont, Bib.NumToTexto(StrToFloat(EdValApl3.Text), 2, 11));
    end;
    wCont := wCont + 1;
    if Trim(EdLbl4.Text) <> '' then
    begin
      Imp.WriteXY(1.9, wCont, EdLbl4.Text); // Valor itens isentos.
      Imp.WriteXY(13.9, wCont, Bib.NumToTexto(StrToFloat(EdValApl4.Text), 2, 11));
      Imp.WriteXY(16.2, wCont, Bib.NumToTexto(StrToFloat(EdValApl4.Text), 2, 11));
    end;
    wCont := wCont + 19;
    with DMMensagem do
    begin
      QMensagem.Close;
      QMensagem.SetVariable('Pk', FmMensagem.MeMensagem.Text);
      QMensagem.Open;
      Imp.WriteXY(0.8, wCont, QMensagemDESC_MENSAGEM.Value);
      Imp.WriteXY(16.8, wCont, Bib.NumToTexto((StrToFloat(EdValApl2.Text) + StrToFloat(EdValApl1.Text)) * 3 / 100, 2, 11)); // Valor de ISS
      wCont := wCont + 1;
      Imp.WriteXY(0.8, wCont, QMensagemDESC_COMPLEMENTO.Value);
      wCont := wCont + 1;
      Imp.WriteXY(0.8, wCont, QMensagemDESC_COMPLEMENTO1.Value);
      Imp.WriteXY(16.8, wCont, Bib.NumToTexto(StrToFloat(EdValApl1.Text), 2, 11)); // Total da mão de obra
      wCont := wCont + 1;
      Imp.WriteXY(0.8, wCont, QMensagemDESC_COMPLEMENTO2.Value);
    end;
    wCont := 46;
    Imp.WriteXY(0.5, wCont, Bib.NumToTexto(StrToFloat(EdValApl3.Text), 2, 11)); // Base calculo ICMS
    Imp.WriteXY(4.1, wCont, Bib.NumToTexto(StrToFloat(EdValApl3.Text) * 17 / 100, 2, 8)); // Valor ICMS
    Imp.WriteXY(16.8, wCont, Bib.NumToTexto(StrToFloat(EdValApl3.Text) + StrToFloat(EdValApl4.Text), 2, 11)); // Total produtos
    wCont := wCont + 2;
    Imp.WriteXY(17.4, wCont, EdValTotalNF.Text); // Total da nota fiscal
    wCont := wCont + 10;
    Imp.WriteXY(0.5, wCont, 'O.S.: ' + FloatToStr(DMOficina.QOSFechamentoNUM_OS.Value));
    wCont := wCont + 1;
    if wPagto = '1' then // Pagamento avista
    begin
      Imp.WriteXY(0.5, wCont, 'Pagamento a Vista');
      wCont := wCont + 1;
    end;
    if wPagto = '2' then // Aprazo
      Imp.WriteXY(0.5, wCont, 'Vencimentos:');
    with DMOficina do
    begin
      QOSContaReceberCons.Close;
      QOSContaReceberCons.SetVariable('NUM_OS', MENumOS.Text);
      QOSContaReceberCons.SetVariable('DESC_TIPO_OS', 'NF');
      QOSContaReceberCons.Open;
      if QOSContaReceberCons.RecordCount = 0 then
        raise exception.Create('Nada encontrado no contas a receber as parcelas para O.S.');
      wCont := wCont + 1;
      while not QOSContaReceberCons.Eof do
      begin
        Imp.WriteXY(0.5, wCont, Bib.NumToTexto(QOSContaReceberConsCOD_CONTA_RECEBER_CAB.Value, 0, 8));
        Imp.WriteXY(2.8, wCont, Bib.NumToTexto(QOSContaReceberConsVAL_TITULO.Value, 2, 8));
        Imp.WriteXY(4.0, wCont, Bib.NumToTexto(QOSContaReceberVAL_JUROS.Value, 2, 8));
        Imp.WriteXY(5.8, wCont, DateToStr(QOSContaReceberConsDT_VENCIMENTO.Value));
        wCont := wCont + 1;
        QOSContaReceberCons.Next;
      end;
      QOSContaReceberCons.Close;
    end; // Final gravação e impressao aprazo.
    wCont := wCont + 6;
    Imp.WriteXY(18.8, wCont, wNumNota);

    Imp.FechaImpressora; // Finaliza os serviços de Impressao

  end; // Final end que verifica se filial e 1

  DMOficina.QOSFechamento.Close;
  DMSerie.QSerie.Close;
  DMOperacao.QOperacao.Close;
  Refresh;
end;

procedure TFOSFechamento.SBLimpaTelaClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
end;

procedure TFOSFechamento.LimpaTela(zerar: Boolean = False);
begin
  MENumOS.Clear;
  FmOperacao.MeOperacao.Clear;
  FmOperacaoS.MeOperacao.Clear;
  FmMensagem.MeMensagem.Clear;
  FmFinalidade.MeFinalidade.Clear;
  FmDepartamento.MeDepartamento.Clear;
  FmOperacao.EdOperacao.Clear;
  FmOperacaoS.EdOperacao.Clear;
  FmMensagem.EdMensagem.Clear;
  FmFinalidade.EdFinalidade.Clear;
  FmDepartamento.EdDepartamento.Clear;
  TotalParcelasPecas := 0;
  TotalParcelasServicos := 0;
  if Parcelas = nil then
    Parcelas := TStringList.Create;
  Parcelas.Clear;
  if zerar then
  begin
    EdValSug1.Text := '0';
    EdValSug2.Text := '0';
    EdValSug3.Text := '0';
    EdValSug4.Text := '0';
    EdValSug5.Text := '0';
    EdValSug6.Text := '0';
    EdValSug7.Text := '0';
    EdValTotalNF.Text := '0';
    EdValApl1.Text := '0';
    EdValApl2.Text := '0';
    EdValApl3.Text := '0';
    EdValApl4.Text := '0';
    EdValApl5.Text := '0';
    EdValApl6.Text := '0';
    EdValApl7.Text := '0';
    EdValTotal.Text := '0';
  end
  else
  begin
    EdValSug1.Clear;
    EdValSug2.Clear;
    EdValSug3.Clear;
    EdValSug4.Clear;
    EdValSug5.Clear;
    EdValSug6.Clear;
    EdValSug7.Clear;
    EdValTotalNF.Clear;
    EdValApl1.Clear;
    EdValApl2.Clear;
    EdValApl3.Clear;
    EdValApl4.Clear;
    EdValApl5.Clear;
    EdValApl6.Clear;
    EdValApl7.Clear;
    EdValTotal.Clear;
  end;
  LBContaReceber.Clear;
end;

procedure TFOSFechamento.EdValCalc1Enter(Sender: TObject);
var
  mValorTotal: Real;
begin
  inherited;
  mValorTotal := 0; // Incia valor da variavel.
  if Trim(EdValCalc1.Text) <> '' then
  begin
    EdValCalc1.Text := FormatFloat('##0.00', StrToFloat(EdValCalc1.Text));
    mValorTotal := mValorTotal + StrToFloat(EdValCalc1.Text);
  end;
  if Trim(EdValCalc2.Text) <> '' then
  begin
    EdValCalc2.Text := FormatFloat('##0.00', StrToFloat(EdValCalc2.Text));
    mValorTotal := mValorTotal + StrToFloat(EdValCalc2.Text);
  end;
  if Trim(EdValCalc3.Text) <> '' then
  begin
    EdValCalc3.Text := FormatFloat('##0.00', StrToFloat(EdValCalc3.Text));
    mValorTotal := mValorTotal + StrToFloat(EdValCalc3.Text);
  end;
  if Trim(EdValCalc4.Text) <> '' then
  begin
    EdValCalc4.Text := FormatFloat('##0.00', StrToFloat(EdValCalc4.Text));
    mValorTotal := mValorTotal + StrToFloat(EdValCalc4.Text);
  end;
  if Trim(EdValCalc5.Text) <> '' then
  begin
    EdValCalc5.Text := FormatFloat('##0.00', StrToFloat(EdValCalc5.Text));
    mValorTotal := mValorTotal + StrToFloat(EdValCalc5.Text);
  end;
  if Trim(EdValCalc6.Text) <> '' then
  begin
    EdValCalc6.Text := FormatFloat('##0.00', StrToFloat(EdValCalc6.Text));
    mValorTotal := mValorTotal + StrToFloat(EdValCalc6.Text);
  end;
  if Trim(EdValCalc7.Text) <> '' then
  begin
    EdValCalc7.Text := FormatFloat('##0.00', StrToFloat(EdValCalc7.Text));
    mValorTotal := mValorTotal + StrToFloat(EdValCalc7.Text);
  end;
  EdValTotal.Text := FormatFloat('##0.00', mValorTotal);

end;

procedure TFOSFechamento.EdValApl1Change(Sender: TObject);
begin
  inherited;
  EdValCalc1.text := EdValApl1.text;
end;

procedure TFOSFechamento.EdValApl2Change(Sender: TObject);
begin
  inherited;
  EdValCalc2.text := EdValApl2.text;
end;

procedure TFOSFechamento.EdValApl3Change(Sender: TObject);
begin
  inherited;
  EdValCalc3.text := EdValApl3.text;
end;

procedure TFOSFechamento.EdValApl4Change(Sender: TObject);
begin
  inherited;
  EdValCalc4.text := EdValApl4.text;
end;

procedure TFOSFechamento.EdValApl5Change(Sender: TObject);
begin
  inherited;
  EdValCalc5.text := EdValApl5.text;
end;

procedure TFOSFechamento.EdValCalc2Enter(Sender: TObject);
begin
  inherited;
  EdValCalc1Enter(self);
end;

procedure TFOSFechamento.EdValCalc3Enter(Sender: TObject);
begin
  inherited;
  EdValCalc1Enter(self);
end;

procedure TFOSFechamento.EdValCalc4Enter(Sender: TObject);
begin
  inherited;
  EdValCalc1Enter(self);
end;

procedure TFOSFechamento.EdValCalc5Enter(Sender: TObject);
begin
  inherited;
  EdValCalc1Enter(self);
end;

procedure TFOSFechamento.EdValTotalEnter(Sender: TObject);
begin
  inherited;
  EdValCalc1Enter(self);
end;

procedure TFOSFechamento.EdValTotalNFChange(Sender: TObject);
begin
  inherited;
  EdValTotalEnter(self);
end;

procedure TFOSFechamento.EdValApl6Change(Sender: TObject);
begin
  inherited;
  EdValCalc6.text := EdValApl6.text;
end;

procedure TFOSFechamento.EdValCalc6Exit(Sender: TObject);
begin
  inherited;
  EdValCalc1Enter(self);
end;

procedure TFOSFechamento.SBOSConsClick(Sender: TObject);
begin
  inherited;
  if FOsCons = nil then
    FOsCons := TFOsCons.Create(Application);
  if FOsCons.ShowModal = mrOk then
  begin
    MENumOS.Text := DMOs.QOSConsNUM_OS.Text;
    MENumOS.SetFocus;
  end;
end;

procedure TFOSFechamento.FormCreate(Sender: TObject);
var
  b: Boolean;
begin
  inherited;
  b := (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS');
  EdLbl7.Visible := b;
  EdValSug7.Visible := b;
  EdValApl7.Visible := b;
  EdValCalc7.Visible := b;
  PPrazo.Visible := not b;
  BtVoltaFechamento.Visible := b;
  if b then
  begin
    EdLbl1.Text := '1 - VALOR DE MAO DE OBRA NO CAMPO';
    EdLbl2.Text := '2 - VALOR DE MAO DE OBRA NA OFICINA';
    EdLbl3.Text := '3 - VALOR DE DESLOCAMENTO DO TECNICO';
    EdLbl4.Text := '4 - VALOR DAS PEÇAS E ACESSORIOS';
    EdLbl5.Text := '5 - VALOR DE LUBRIFICANTES';
    EdLbl6.Text := '6 - VALOR SERVIÇOS TERCEIRO';
    BtnNFOficina.Caption := '&Fechar OS';
    StBLongHint.SimplePanel := False;
    StBLongHint.Panels.Add.Text := StBLongHint.SimpleText;
    StBLongHint.Panels.Add.Text := 'ALT L - LIMPA; ALT F - FECHA OS; ALT V - VOLTA OS';

    PValores.Enabled := False;
    PSugerido.Visible := False;
  end;
end;

procedure TFOSFechamento.EdValApl7Change(Sender: TObject);
begin
  inherited;
  EdValCalc7.Text := EdValApl7.Text;
end;

procedure TFOSFechamento.FmOperacao1BtOperacaoClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
  FmOperacao.BtOperacaoClick(Sender);
end;

procedure TFOSFechamento.FmOperacaoMeOperacaoExit(Sender: TObject);
begin
  inherited;
  FmOperacao.MeOperacaoExit(Sender);
  if Trim(FmOperacao.MeOperacao.Text) = '' then
    FmOperacao.EdOperacao.Text := '';
end;

procedure TFOSFechamento.FmMensagemMeMensagemExit(Sender: TObject);
begin
  inherited;
  FmMensagem.MeMensagemExit(Sender);
  if Trim(FmMensagem.MeMensagem.Text) = '' then
    FmMensagem.EdMensagem.Text := '';
end;

procedure TFOSFechamento.FmFinalidadeMeFinalidadeExit(Sender: TObject);
begin
  inherited;
  FmFinalidade.MeFinalidadeExit(Sender);
  if Trim(FmFinalidade.MeFinalidade.Text) = '' then
    FmFinalidade.EdFinalidade.Text := '';
end;

procedure TFOSFechamento.FmDepartamentoMeDepartamentoExit(Sender: TObject);
begin
  inherited;
  FmDepartamento.MeDepartamentoExit(Sender);
  if Trim(FmDepartamento.MeDepartamento.Text) = '' then
    FmDepartamento.EdDepartamento.Text := '';
end;

procedure TFOSFechamento.RGPagtoClick(Sender: TObject);
//var
//  b: bool;
begin
  inherited;
//  b := DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS';
//  PPrazo.Visible := ((not b) or (RGPagto.ItemIndex = 1));
//  PPrazoVencimento.Visible := ((b) and (RGPagto.ItemIndex = 1));
  PPrazo.Visible := (RGPagto.ItemIndex = 1);
end;

procedure TFOSFechamento.BtVoltaFechamentoClick(Sender: TObject);
var
  wNumOS: Integer;
  wAux: string;
  wCommitar: Boolean;
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
  begin
    if FOFI0012 = nil then
      FOFI0012 := TFOFI0012.Create(Application);
    if FOFI0012.ShowModal = mrOK then
    begin
      wNumOS := StrToInt('0' + FOFI0012.EdNUM_OS.Text);
      if wNumOS > 0 then
        with DMOficina do
        begin
          wCommitar := QOSFechamento.CommitOnPost;
          QOSFechamento.CommitOnPost := False;
          QOSFechamento.Close;
          QOSFechamento.SetVariable('PK', wNumOS);
          QOSFechamento.Open;

          if QOSFechamento.RecordCount = 0 then
            raise Exception.Create('OS não enconstrada');
          if QOSFechamentoIND_SITUACAO.Value <> 'F' then
            raise Exception.Create('Esta OS não está fechada');

          try
            wAux := DMOracle.FastSelect('COD_CONTA_RECEBER_CAB', 'TB_CONTA_RECEBER_CAB',
              'NUM_OS = ' + IntToStr(wNumOS));
            while wAux <> '' do
            begin
              if (DMOracle.FastSelect('COUNT(*)', 'TB_CONTA_RECEBER_MOV',
                'COD_CONTA_RECEBER_CAB = ' + wAux) > '1') then
                raise Exception.Create('Os títulos gerados por esta OS no sistema de contas à receber possuem baixas.' + #13 + #10 +
                  'Por favor, exclua as baixas antes de voltar a OS.');
              DMOracle.ExecutaSql('DELETE FROM TB_CONTA_RECEBER_MOV WHERE COD_CONTA_RECEBER_CAB = ' + wAux, False);
              DMOracle.ExecutaSql('DELETE FROM TB_CONTA_RECEBER_CAB WHERE COD_CONTA_RECEBER_CAB = ' + wAux, False);
              wAux := DMOracle.FastSelect('COD_CONTA_RECEBER_CAB', 'TB_CONTA_RECEBER_CAB',
                'NUM_OS = ' + IntToStr(wNumOS));
            end;
            DMOracle.ExecutaSql('DELETE FROM TB_CAIXA_MOV WHERE NUM_OS = ' + IntToStr(wNumOS), False);
            wAux := DMOracle.FastSelect('COD_NOTA_CAB', 'TB_NOTA_CAB',
                'IND_ENTRADA_SAIDA = ''S'' AND NUM_OS = ' + IntToStr(wNumOS));
            if wAux <> '' then
            begin
              DMOracle.ExecutaSql('DELETE FROM TB_NOTA_ITEM WHERE COD_NOTA_CAB = ' + wAux, False);
              DMOracle.ExecutaSql('DELETE FROM TB_NOTA_CAB WHERE COD_NOTA_CAB = ' + wAux, False);
            end;
            DMOracle.ExecutaSql('UPDATE TB_OS SET IND_SITUACAO = ''A'' WHERE NUM_OS = ' + IntToStr(wNumOS), False);

            DMOracle.DBCemapa.Commit;
            QOSFechamento.Close;
            QOSFechamento.CommitOnPost := wCommitar;
          except
            DMOracle.DBCemapa.Rollback;
            QOSFechamento.CommitOnPost := wCommitar;
            raise;
          end;
        end;
    end;
  end;
end;

// Fechamento de OS para AgronNews

procedure TFOSFechamento.FechaOSAgronews;
var
  wNumOS, wOperacao, wMensagem, wFinalidade, wDepartamento, wPagto, wNumNota, wInt: Integer;
  wTotalParcelas, wTotalAplicado: Real;
  wSerie, wSerieModelo, wAux: string;
  wCommitar: Boolean;
begin
  wNumOS := StrToInt('0' + Trim(MENumOS.Text));
  wOperacao := StrToInt('0' + Trim(FmOperacao.MeOperacao.Text));
  wMensagem := StrToInt('0' + Trim(FmMensagem.MeMensagem.Text));
  wFinalidade := StrToInt('0' + Trim(FmFinalidade.MeFinalidade.Text));
  wDepartamento := StrToInt('0' + Trim(FmDepartamento.MeDepartamento.Text));
  wPagto := RGPagto.ItemIndex;

  if wNumOS = 0 then
    Exit;
  if wOperacao = 0 then
    raise Exception.Create('Por favor, informe a operacao.');
  if wPagto = 1 then
  begin
    if wFinalidade = 0 then
      raise Exception.Create('Por favor, informe a finalidade para gerar Contas à Receber.');
    if wDepartamento = 0 then
      raise Exception.Create('Por favor, informe o departamento para gerar Contas à Receber.');
  end;
  if DMOficina.QOSFechamento.RecordCount = 0 then
    raise Exception.Create('OS não foi encontrada.');
  if DMOracle.FastSelect('COUNT(*)', 'TB_MARCACAO', 'NUM_OS = ' + IntToStr(wNumOS)) = '0' then
    raise Exception.Create('OS não possui nenhuma marcação.');
  if DMOracle.FastSelect('COUNT(*)', 'TB_MARCACAO', 'IND_SITUACAO <> ''F'' AND NUM_OS = ' + IntToStr(wNumOS)) > '0' then
    raise Exception.Create('OS possui marcação em aberto.');

  wTotalAplicado := StrToFloat(EdValTotalNF.Text);

  wTotalParcelas := 0;
  if wPagto = 1 then
  begin
    for wInt := 0 to LBContaReceber.Items.Count - 1 do
    begin
      wAux := Copy(LBContaReceber.Items[wInt], 11, 15);
      wAux := Bib.LimpaString(wAux, '.');
      wTotalParcelas := wTotalParcelas + StrToFloat(wAux);
    end;
    if Abs(wTotalParcelas - wTotalAplicado) > 0.01 then
      raise exception.Create('Total das parcelas (' + Trim(FloatToStr(wTotalParcelas)) +
        ') não confere com total da NF (' + Trim(EdValTotalNF.Text) + ').');
  end;

  wCommitar := DMOficina.QOSFechamento.CommitOnPost;
  DMOficina.QOSFechamento.CommitOnPost := False;
  try
    DMOperacao.QOperacao.Close;
    DMOperacao.QOperacao.SetVariable('PK', wOperacao);
    DMOperacao.QOperacao.Open;
    wSerie := '';
    if DMOficina.QOSFechamentoNUM_TITULO.Value > 0 then
      wNumNota := DMOficina.QOSFechamentoNUM_TITULO.Value
    else
    begin
      wSerie := DMOperacao.QOperacaoCOD_SERIE.Value;
      wSerieModelo := DMOperacao.QOperacaoCOD_SERIE_MODELO.Value;
      if wSerie = '' then
      begin
        if DMOperacao.QOperacaoIND_EMITE.Value = 'F' then
          wSerie := DMParamSistema.QParamSistemaCOD_SERIE_NOTA.Value
        else
          wSerie := DMParamSistema.QParamSistemaCOD_SERIE_PEDIDO.Value;
      end;
      wNumNota := DMSerie.NumeroSerie(DMOficina.QOSFechamentoCOD_FILIAL.Value, wSerie, wSerieModelo);
    end;

    if wPagto = 0 then // À VISTA
    begin
      if (wDepartamento > 0) and (UpperCase(DMOracle.FastSelect('IND_FLUXO_CAIXA', 'TB_DEPARTAMENTO',
        'COD_DEPARTAMENTO = ' + IntToStr(wDepartamento))) = 'SIM') then
      begin
        with DMOficina do
          DMCaixa.IncluiCaixa(QOSFechamentoCOD_FILIAL.Value, wDepartamento,
            DMOperacao.QOperacaoCOD_HISTORICO_CAIXA.Value, wTotalAplicado,
            wNumNota, QOSFechamentoCOD_CADASTRO.Value, '', Date, '', '', '', '',
            wNumOS);
      end
      else if (wDepartamento = 0) then
        if (MessageDlg('Você não informou o departamento, com isso não será gerado fluxo de caixa.' + #13 + #10 +
          'Continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
          raise Exception.Create('Cancelado pelo usuário.');
    end
    else
    begin // À PRAZO
      with DMOficina do
        for wInt := 0 to LBContaReceber.Items.Count - 1 do
        begin
          DMContasReceber.IncluiCR(0, wNumNota, wInt + 1, wFinalidade,
            wDepartamento, 0, QOSFechamentoCOD_CADASTRO.Value,
            QOSFechamentoCOD_FILIAL.Value, StrToFloat(Bib.LimpaString(Copy(
            LBContaReceber.Items[wInt], 11, 15), '.')), 'OS', StrToDate(Copy(
            LBContaReceber.Items[wInt], 1, 10)), Date, wNumOS);
        end;
    end;

    with DMOficina do
    begin
      QOSFechamento.RefreshRecord;
      QOSFechamento.Edit;
      QOSFechamentoCOD_OPERACAO.Value := wOperacao;
      QOSFechamentoIND_VISTA_PRAZO.Value := wPagto + 1;
      if wMensagem > 0 then
        QOSFechamentoCOD_MENSAGEM.Value := wMensagem;
      QOSFechamentoVAL_DESCONTO.Value := 0;
      QOSFechamentoHR_SAIDA.Value := FormatDateTime('dd:nn', Date);
      QOSFechamentoDT_FECHAMENTO.Value := Date;
      if wSerie <> '' then
        QOSFechamentoCOD_SERIE.Value := wSerie;
      QOSFechamentoNUM_TITULO.Value := wNumNota;
      QOSFechamentoVAL_NF_MAO_DE_OBRA.Value := StrToFloat('0' + EdValApl1.Text);
      QOSFechamentoVAL_NF_SERVICO_TERCEIRO.Value := StrToFloat('0' + EdValApl2.Text);
      QOSFechamentoVAL_NF_PECAS.Value := StrToFloat('0' + EdValApl3.Text);
      QOSFechamentoVAL_NF_PECAS_ISENTAS.Value := StrToFloat('0' + EdValApl4.Text);
      QOSFechamentoVAL_NF_SERVICO_CHAPEACAO.Value := StrToFloat('0' + EdValApl5.Text);
      QOSFechamentoVAL_NF_SERVICO_ELETRICO.Value := StrToFloat('0' + EdValApl6.Text);
      QOSFechamentoVAL_NF_LOCOMOCAO.Value := StrToFloat('0' + EdValApl7.Text);
      QOSFechamentoVAL_NF_MAO_DE_OBRA2.Value := StrToFloat('0' + EdValCalc1.Text);
      QOSFechamentoVAL_NF_SERVICO_TERCEIRO2.Value := StrToFloat('0' + EdValCalc2.Text);
      QOSFechamentoVAL_NF_PECAS2.Value := StrToFloat('0' + EdValCalc3.Text);
      QOSFechamentoVAL_NF_PECAS_ISENTAS2.Value := StrToFloat('0' + EdValCalc4.Text);
      QOSFechamentoVAL_NF_SERVICO_CHAPEACAO2.Value := StrToFloat('0' + EdValCalc5.Text);
      QOSFechamentoVAL_NF_SERVICO_ELETRICO2.Value := StrToFloat('0' + EdValCalc6.Text);
      QOSFechamentoVAL_NF_LOCOMOCAO2.Value := StrToFloat('0' + EdValCalc7.Text);
      DMOficina.QOSFechamento.Post;
    end;

    DMOperacao.QOperacao.Close;

    DMOSEmite.GeraNotaBanco(wNumOS, False);
    DMOracle.DBCemapa.Commit;
    MessageDlg('OS fechada com sucesso!', mtInformation, [mbOK], 0);
    LimpaTela;
  except
    on e: Exception do
    begin
      DMOficina.QOSFechamento.Cancel;
      DMOracle.DBCemapa.Rollback;
      MessageDlg('O fechamento da OS não obteve êxito.' + #13 + #10 +
        e.message, mtError, [mbOK], 0);
    end;
  end;
  DMOficina.QOSFechamento.CommitOnPost := wCommitar;
end;

procedure TFOSFechamento.MEParcelaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', #8, #13]) then
    Key := #0;
end;

procedure TFOSFechamento.BtConfirmaPrazoClick(Sender: TObject);
var
  wPar, wDia, wInt: Integer;
  wTotal, wAdicionado, wVal: Extended;
  wData: String;
begin
  inherited;
  wPar := StrToInt('0' + MEParcela.Text);
  wDia := StrToInt('0' + MEDias.Text);
  wTotal := ValTotal;
  if (wPar > 0) and (wDia > 0) and (wTotal > 0) then
  begin
    LBContaReceber.Items.Clear;
    TotalParcelasPecas := 0;
    TotalParcelasServicos := 0;
    Parcelas.Clear;
    wAdicionado := 0;
    for wInt := 1 to wPar do
    begin
      if wInt = wPar then
        wVal := wTotal - wAdicionado
      else
        wVal := StrToFloat(FormatFloat('#0.00', wTotal / wPar));
      wData := FormatDateTime('dd/mm/yyyy', DMOficina.QOSFechamentoDT_EMISSAO.Value + (wDia * wInt));
      if not InputQuery('Vencimento da parcela ' + IntToStr(wInt), 'Data', wData) then
      begin
        LBContaReceber.Items.Clear;
        TotalParcelasPecas := 0;
        TotalParcelasServicos := 0;
        Parcelas.Clear;
        Exit;
      end;
//      MEDiasCP.Text := IntToStr(wDia * wInt);
//      MEDiasCPExit(Sender);
      MEDataCP.Text := wData;
      MEValorCR.Text := FormatFloat('#0.00', wVal);
      MEValorCRExit(Sender);
      wAdicionado := wAdicionado + wVal;
    end;
  end;
end;

function TFOSFechamento.GetValPecas: Extended;
begin
  Result := StrToFloat('0' + EdValApl3.Text) + StrToFloat('0' + EdValApl4.Text);
end;

function TFOSFechamento.GetValServicos: Double;
begin
  Result := ValTotal - ValPecas;
end;

function TFOSFechamento.GetValTotal: Extended;
begin
  Result := StrToFloat('0' + EdValTotalNF.Text);
end;

procedure TFOSFechamento.EdLbl1DblClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
    MEProduto1.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
end;

procedure TFOSFechamento.EdLbl5DblClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
    MEProduto5.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
end;

procedure TFOSFechamento.EdLbl6DblClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
    MEProduto6.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
end;

procedure TFOSFechamento.EdLbl2DblClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
    MEProduto2.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
end;

procedure TFOSFechamento.MEProduto1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (GetKeyState(VK_CONTROL) >= 0) and (not (Key in ['0'..'9', #8, #13])) then
    Key := #0;
end;

function TFOSFechamento.GetValGeral: Extended;
begin
  Result := StrToFloat('0' + EdValTotal.Text);
end;

function TFOSFechamento.GetValPecasSug: Extended;
begin
  Result := StrToFloat('0' + EdValSug3.Text) + StrToFloat('0' + EdValSug4.Text);
end;

procedure TFOSFechamento.rgTipoProdutoClick(Sender: TObject);
begin
  inherited;
  if (MEDataCP.Text <> '') and (MEValorCR.Text <> '') then
    MEValorCRExit(Sender);
end;

end.

