unit UNFCeFechamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DBCtrls, DB, Grids, DBGrids, Mask, ExtCtrls,
  ActnList, ComCtrls;

type
  TFNFCeFechamento = class(TForm)
    Label1: TLabel;
    cbFormaPagamento: TComboBox;
    edValor: TEdit;
    btAdicionarPagamento: TBitBtn;
    BtCancelarCupom: TBitBtn;
    BtTerminarFechamento: TBitBtn;
    dbgPagamentos: TDBGrid;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    MePercDesc: TMaskEdit;
    edDesconto: TEdit;
    Label3: TLabel;
    Panel1: TPanel;
    label19: TLabel;
    lbTroco: TLabel;
    label5: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    lbTotal: TLabel;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Action1: TAction;
    Label4: TLabel;
    edDespesa: TEdit;
    DSPagamentos: TDataSource;
    Label8: TLabel;
    procedure ValidaKeyPress(Sender: TObject; var Key: Char);
    procedure ValidaValorDescontoDespesa(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btAdicionarPagamentoClick(Sender: TObject);
    procedure edDescontoExit(Sender: TObject);
    procedure edDespesaExit(Sender: TObject);
    procedure edValorExit(Sender: TObject);
    procedure MePercDescExit(Sender: TObject);
    procedure LancarParcelas(ValorPagamento: Real);
    procedure dbgPagamentosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    fParcelas: TStrings;
    fDepartamento: Integer;
    fFinalidade: Integer;
    fContaCorrente: Integer;
    ValorTotal: Real;
    procedure AtualizaValorTotal;
  public
    property pParcelas: TStrings read fParcelas write fParcelas;
    property pDepartamento: Integer read fDepartamento write fDepartamento;
    property pFinalidade: Integer read fFinalidade write fFinalidade;
    property pContaCorrente: Integer read fContaCorrente write fContaCorrente;
  end;

var
  FNFCeFechamento: TFNFCeFechamento;

implementation

uses UBiblioteca, UParamSistema_cl, UOracle_cl, UNotaSaida_cl,
  UNFCeParcelas, Math, UCadastro_cl, UInformaBancoPix, ULancamentoCartaoCad;
//ULancamentoCartaoCad;

{$R *.dfm}

procedure TFNFCeFechamento.ValidaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (not (key in ['0'..'9', ',', #8])) then
    key := #0;
end;

procedure TFNFCeFechamento.ValidaValorDescontoDespesa(Sender: TObject);
var
  wValorAux: String;
  wValor: Real;
begin
  if trim((Sender as TEdit).Text) <> '' then
  begin
    try
      wValorAux := trim((Sender as TEdit).Text);
      wValor := StrToFloat(bib.LimpaNumero(wValorAux,true));
      if (Pos(',', wValorAux) <> 0) and ((Length(wValorAux) - Pos(',', wValorAux)) > 2) then //verifica se tem mais de 2 casa decimais
      begin
        wValor := trunc(wValor * 100)/100;
        (Sender as TEdit).Text := FormatFloat('#,##0.00', wValor);
        MessageDlg('Foram informadas mais de 2 casas decimais. Apenas 2 serão consideradas!', mtWarning, [mbOK], 0);
      end;
      if wValor >= (DMNotaSaida.QSomaItemNotaSVAL_TOTAL.Value -
                    DMNotaSaida.QSomaItemNotaSVAL_DESCONTO_ITEM.Value) then
        raise Exception.Create('O valor informado não pode ser maior ou igual que a soma do valor total dos itens!');
      if wValor < 0 then
        raise Exception.Create('O valor informado não pode ser negativo!');
    except
      on E: EConvertError do
      begin
        MessageDlg('Valor inválido!', mtError, [mbOK], 0);
        (Sender as TEdit).SetFocus;
        (Sender as TEdit).SelectAll;
      end
      else
      begin
        (Sender as TEdit).SetFocus;
        (Sender as TEdit).SelectAll;
        raise;
      end;
    end;
  end;
end;

procedure TFNFCeFechamento.FormActivate(Sender: TObject);
var
  wValTotal: Real;
  wContNota,wData,wHora: String;
begin
  //DMImpressoraFiscal.QSomaPagamentos.Close;
  //DMImpressoraFiscal.QSomaPagamentos.SetVariable('COD_NOTA_CAB', DMImpressoraFiscal.QNotaSaidaCOD_NOTA_CAB.Value);
  //DMImpressoraFiscal.QSomaPagamentos.Open;
  fParcelas := nil;
  with DMNotaSaida do
  begin
    QSomaPagamentos.Refresh;
    QPagamento.Close;
    QPagamento.SetVariable('COD_NOTA_CAB', DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
    QPagamento.Open;
    if QSomaPagamentosVAL_PAGO.Value = 0 then
    begin
      //lbValorPago.Caption := '0,00';
      lbTroco.Caption := '0,00';
      BtTerminarFechamento.Enabled := False;
      btAdicionarPagamento.Enabled := true;
      cbFormaPagamento.Enabled := True;
      cbFormaPagamento.ItemIndex := 0;
      edValor.Enabled := True;
      edDesconto.Enabled := True;
      MePercDesc.Enabled := True;
      edDespesa.Enabled := True;
      cbFormaPagamento.SetFocus;
    end;
  end;
  if DMParamSistema.CodEmpresa = 'PAULINHO' then  //Junior 18/12/2019. Solicitado por Paulinho
    cbFormaPagamento.ItemIndex := 10;
  AtualizaValorTotal;
end;

procedure TFNFCeFechamento.btAdicionarPagamentoClick(Sender: TObject);
var
  wFormaPgto, wValorAux, wDtVencto, wLibera: String;
  wValorPagamento, wTroco: Real;
begin
  if trim(cbFormaPagamento.Text) = '' then
  begin
    MessageDlg('Forma de pagamento não informada',mtError,[mbOk],0);
    cbFormaPagamento.SetFocus;
    Abort;
  end;
  wFormaPgto := trim(cbFormaPagamento.Text);
  if trim(edValor.Text) = '' then
  begin
    MessageDlg('Valor não informado',mtError,[mbOk],0);
    edValor.SetFocus;
    Abort;
  end;
  wValorPagamento := StrToFloat(bib.LimpaString(edValor.Text,'.'));
{//Controle de lançamento bandeira do cartão
  if DMParamSistema.QParamSistemaIND_CONTROLE_CARTAO.Value = 'S' then
  begin
    DMNotaSaida.wLancCartaoIndividual := False;
    if (( wFormaPgto = 'Cartão de Crédito') or ( wFormaPgto = 'Cartão de Débito') ) then
    begin
      if FLancamentoCartao = nil then
        FLancamentoCartao := TFLancamentoCartao.Create(Application);
      FLancamentoCartao.ShowModal;
    end;
  end;}
//Fim
//Tipo de pagamento Pix, solicitado pela Refrigração SMI. Alex 20/09/2022
  if (DMNotaSaida.QSomaPagamentosVAL_PIX.Value > 0 ) and ( (DMParamSistema.CodEmpresa = 'REFRISM'){ or (DMParamSistema.CodEmpresa = 'FERRAGMED')} ) then
  begin
    if FInformaBancoPix = nil then
      FInformaBancoPix := TFInformaBancoPix.create(Application);
    FInformaBancoPix.ShowModal;
  end;

//  wValorPagamentoMenosVale := wValorPagamento -((wValorPagamento * 100 / ValorTotal) *
//      (DMNotaSaida.pValorValeCompras + DMNotaSaida.pValorValePresente)  / 100);
  if (DMOracle.BuscaNome('SELECT IND_BLOQUEIO_VENDA_VCTO FROM TB_FILIAL', 'COD_FILIAL = ' +
      FloatToStr(DmNotaSaida.QNotaSaidaCod_Filial.Value)) = 'SIM') and
      ((wFormaPgto = 'Crédito Loja') or (wFormaPgto = 'Outros')) then
  begin
    wDtVencto := DMOracle.BuscaNome('SELECT Min(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB', 'COD_CADASTRO = ' +
      FloatToStr(DMNotaSaida.QNotaSaidaCod_Cadastro.Value) + ' AND IND_SITUACAO <> ' + chr(39) + 'BAIXA TOTAL' + chr(39));
    wLibera := DMOracle.BuscaNome('SELECT IND_LIBERA_VENDA FROM TB_CADASTRO', 'TB_CADASTRO.COD_CADASTRO = ' +
      FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
    if wDtvencto <> '' then
      if StrToDate(wDtVencto) < (Date - DMParamSistema.QParamSistemaNum_Dias_Bloqueio.Value) then
        if wLibera = 'NAO' then
          raise Exception.Create('Cliente Com Titulos Em Aberto - Checar Venda com Gerência');
  end;

  //if (wValorPagamento - (ValorTotal - DMNotaSaida.QSomaPagamentosVAL_PAGO.Value)) > 0.01 then
//  begin
//    MessageDlg('Não é possível gerar troco',mtError,[mbok],0);
//    edValor.SetFocus;
//    edValor.SelectAll;
//    Abort;
//  end;
  if wFormaPgto = 'Crédito Loja' then
  begin
    with DMNotaSaida do
    begin
      //Verifcar Credito do Cadastro. Solitado por Dinglis. Junior 18/03/2016
      DMCadastro.ValidaCredito(DMNotaSaida.QNotaSaidaCod_Cadastro.Value, wValorPagamento);
      QPagamento.First;
      while not QPagamento.Eof do
      begin
        if QPagamentoDESC_PAGAMENTO.Value = 'Crédito Loja' then
          raise Exception.Create('É permitido apenas um pagamento Crédito Loja por venda!');
        QPagamento.Next;
      end;
    end;

    if RoundTo(wValorPagamento, -2) > RoundTo((ValorTotal - DMNotaSaida.QSomaPagamentosVAL_PAGO.Value),-2) then
      raise Exception.Create('O valor do pagamento a prazo não pode ultrapassar o valor restante para o pagamento!');
    LancarParcelas(wValorPagamento);
    DMNotaSaida.GeraContaReceber(pParcelas, pFinalidade, '',
                  IntToStr(pDepartamento), IntToStr(pContaCorrente));
  end;
  edValor.Clear;
  cbFormaPagamento.SetFocus;
  with DMNotaSaida do
  begin
    QPagamento.Append;
    QPagamentoDESC_PAGAMENTO.Value := wFormaPgto;
    QPagamentoVAL_PAGAMENTO.Value := wValorPagamento;
    QPagamentoVal_Valor.Value := wValorPagamento;
    wTroco := wValorPagamento - (ValorTotal - QSomaPagamentosVAL_PAGO.Value);
    QPagamentoVAL_TROCO.Value := Bib.ift(RoundTo(wTroco, -2) > 0, RoundTo(wTroco,-2), 0);
    QPagamento.Post;
  end;
//Controle de lançamento bandeira do cartão
  if DMParamSistema.QParamSistemaIND_CONTROLE_CARTAO.Value = 'S' then
  begin
    DMNotaSaida.wLancCartaoIndividual := False;
    if (( wFormaPgto = 'Cartão de Crédito') or ( wFormaPgto = 'Cartão de Débito') ) then
    begin
      if FLancamentoCartao = nil then
        FLancamentoCartao := TFLancamentoCartao.Create(Application);
      FLancamentoCartao.ShowModal;
    end;
  end;

  AtualizaValorTotal;
  MePercDesc.Enabled := false;
  edDesconto.Enabled := false;
  edDespesa.Enabled := false;
end;

procedure TFNFCeFechamento.edDescontoExit(Sender: TObject);
var wValor: String;
begin
  wValor := bib.limpaString(edDesconto.Text,'.');
  try
    StrToFloat(wValor);
  Except
    edDesconto.Text := '0,00';
  end;
  if StrToFloat(Trim(edDesconto.Text)) < 0.000 then
  begin
    MessageDlg('Não é permitido informar valor nulo(zero) ou negativo!',
      mtError,[mbOk],0);
    edDesconto.SetFocus;
    Abort;
  end;
  ValidaValorDescontoDespesa(Sender);
  AtualizaValorTotal;
  if Trim(edDesconto.Text) <> '' then
    edDesconto.Text :=
      FormatFloat('#,##0.00',StrToFloat(wValor));
end;

procedure TFNFCeFechamento.edDespesaExit(Sender: TObject);
var wValor: String;
begin
  wValor := bib.limpaString(edDespesa.Text,'.');
  try
    StrToFloat(wValor);
  Except
    edDespesa.Text := '0,00';
  end;
  if StrToFloat(Trim(edDespesa.Text)) < 0.000 then
  begin
    MessageDlg('Não é permitido informar valor nulo(zero) ou negativo!',
      mtError,[mbOk],0);
    edDesconto.SetFocus;
    Abort;
  end;
  ValidaValorDescontoDespesa(Sender);
  AtualizaValorTotal;
  if Trim(edDespesa.Text) <> '' then
    edDespesa.Text :=
      FormatFloat('#,##0.00',StrToFloat(wValor));
end;

procedure TFNFCeFechamento.AtualizaValorTotal;
var
  wValDesconto, wValDespesa: Real;
begin
  if trim(edDesconto.Text) <> '' then
    wValDesconto := StrToFloat(bib.LimpaNumero(trim(edDesconto.Text),true))
  else
    wValDesconto := 0.00;
  if trim(edDespesa.Text) <> '' then
    wValDespesa := StrToFloat(bib.LimpaNumero(trim(edDespesa.Text),true))
  else
    wValDespesa := 0.00;
  DMNotaSaida.QSomaPagamentos.Refresh;
  ValorTotal := DMNotaSaida.QSomaItemNotaSVAL_TOTAL.Value -
                DMNotaSaida.QSomaItemNotaSVAL_DESCONTO_ITEM.Value -
                wValDesconto + wValDespesa;
  lbTotal.Caption := FormatFloat('#,##0.00', ValorTotal);
  edValor.Text := FormatFloat('#,##0.00',
    ValorTotal + DMNotaSaida.QNotaSaidaVAL_TROCO.Value -
    DMNotaSaida.QSomaPagamentosVAL_PAGO.Value);
  if StrToFloat(bib.LimpaString(edValor.Text,'.')) <= 0 then
    edValor.Clear;
{
//Tipo de pagamento Pix, solicitado pela Refrigração SMI. Alex 20/09/2022
  if (DMNotaSaida.QSomaPagamentosVAL_PIX.Value > 0 ) and ( (DMParamSistema.CodEmpresa = 'REFRISM') or (DMParamSistema.CodEmpresa = 'FERRAGMED') ) then
  begin
    if FInformaBancoPix = nil then
      FInformaBancoPix := TFInformaBancoPix.create(Application);
    FInformaBancoPix.ShowModal;
  end;
 }
  //Para saber se pode habilitar o botão de fechamento do cupom
  //Tolera diferença de 1 centavo
  if (Abs(ValorTotal - DMNotaSaida.QSomaPagamentosVAL_PAGO.Value) <= 0.01) or
    (DMNotaSaida.QSomaPagamentosVAL_PAGO.Value >= ValorTotal) then
  begin
    lbTroco.Caption := FormatFloat('#,##0.00', DMNotaSaida.QSomaPagamentosVAL_PAGO.Value - ValorTotal);
    btAdicionarPagamento.Enabled := False;
    cbFormaPagamento.Enabled := False;
    edValor.Enabled := False;
    BtTerminarFechamento.Enabled := true;
    BtTerminarFechamento.SetFocus;
  end
  else
  begin
    lbTroco.Caption := '0,00';
    btAdicionarPagamento.Enabled := True;
    cbFormaPagamento.Enabled := True;
    edValor.Enabled := True;
    BtTerminarFechamento.Enabled := False;
    cbFormaPagamento.SetFocus;
  end;
end;

procedure TFNFCeFechamento.edValorExit(Sender: TObject);
var
  wValorAux: String;
  wValor: Real;
begin
  if trim((Sender as TEdit).Text) <> '' then
  begin
    try
      wValorAux := trim((Sender as TEdit).Text);
      wValor := StrToFloat(bib.LimpaString(wValorAux,'.'));
      if (Pos(',', wValorAux) <> 0) and ((Length(wValorAux) - Pos(',', wValorAux)) > 2) then //verifica se tem mais de 2 casa decimais
      begin
        wValor := trunc(wValor * 100)/100;
        (Sender as TEdit).Text := FormatFloat('#,##0.00', wValor);
        MessageDlg('Foram informadas mais de 2 casas decimais. Apenas 2 serão consideradas!', mtWarning, [mbOK], 0);
      end;
      if wValor <= 0.00 then
        raise Exception.Create('O valor informado não pode ser nulo(zero) ou negativo!');
    except
      on E: EConvertError do
      begin
        MessageDlg('Valor inválido!', mtError, [mbOK], 0);
        (Sender as TEdit).SetFocus;
        (Sender as TEdit).SelectAll;
      end
      else
      begin
        (Sender as TEdit).SetFocus;
        (Sender as TEdit).SelectAll;
        raise;
      end;
    end;
    if Trim(edValor.Text) <> '' then
      edValor.Text :=
        FormatFloat('#,##0.00',StrToFloat(
          bib.LimpaString(edValor.Text,'.')));
  end;
end;

procedure TFNFCeFechamento.MePercDescExit(Sender: TObject);
var
  wPercDesc: Double;
begin   
  wPercDesc := 0;
  try
    MePercDesc.Text := FormatFloat('#,##0.00',
      StrToFloat(MePercDesc.Text));
  Except
    MePercDesc.Text := '0,00'
  end;
  if StrToFloat(MePercDesc.Text) < 0 then
  begin
    MessageDlg('Não é permitido informar valor nulo(zero) ou negativo!',
      mtError,[mbOk],0);
    MePercDesc.SetFocus;
    Abort;
  end;
  if Trim(MePercDesc.Text) <> '0,00' then
  begin
    wPercDesc := StrToFloat(Trim(MePercDesc.Text));
    edDesconto.Text := FormatFloat('#,##0.00',ValorTotal*wPercDesc/100);
  end;
end;

procedure TFNFCeFechamento.LancarParcelas(ValorPagamento: Real);
begin
  if FNFCeParcelas = nil then
    FNFCeParcelas := TFNFCeParcelas.Create(Application);
  FNFCeParcelas.pValorTotal := ValorPagamento;
  if FNFCeParcelas.ShowModal = mrOk then
  begin
    pParcelas := FNFCeParcelas.LBContaReceber.Items;
    pDepartamento := StrToInt(trim(FNFCeParcelas.FmDepartamento.MeDepartamento.Text));
    pFinalidade := StrToInt(trim(FNFCeParcelas.FmFinalidade.MeFinalidade.Text));
    pContaCorrente := StrToInt('0'+trim(FNFCeParcelas.FmContaCorrente.MeContaCorrente.Text));
  end
  else
  begin
    MessageDlg('Parcelamento cancelado!', mtWarning, [mbOK], 0);
    Abort;
  end;
end;

procedure TFNFCeFechamento.dbgPagamentosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_delete then
    if not DMNotaSaida.QPagamento.Eof then
    begin
      DMNotaSaida.QPagamento.RefreshRecord;
//Para excluir lançamento do cartão quando nos parametros estiver habilitado para controlar bandeira do cartão. Alex 26/01/2023
      If DMOracle.BuscaNome('SELECT COD_LANCAMENTO_CARTAO FROM TB_LANCAMENTO_CARTAO','COD_NOTA_CAB ='+DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text) <> '' then
      Begin
        try
          DMOracle.DBCemapa.StartTransaction;
          DMOracle.QExecSQL.Close;
          DMOracle.QExecSQL.SQL.Clear;
          DMOracle.QExecSQL.SQL.Add('DELETE TB_LANCAMENTO_CARTAO WHERE COD_NOTA_CAB = ' + chr(39) + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text + chr(39));
          DMOracle.QExecSQL.ExecSQL;
          DMOracle.DBCemapa.Commit;
        except
          DMOracle.DBCemapa.Rollback;
        raise Exception.Create('Não foi possível voltar o lançamento do cartão!');
        end;
      end;
      DMNotaSaida.QPagamento.Delete;
      AtualizaValorTotal;
    end;
end;

procedure TFNFCeFechamento.FormCreate(Sender: TObject);
var items: TStrings;
    i: Integer;
begin
 if (DMParamSistema.CodEmpresa = 'FERRAGMED') or (DMParamSistema.CodEmpresa = 'NFCE-BORTO') then
  begin
    items := TStringList.Create;
    for i := 0 to 4 do
      items.Add(cbFormaPagamento.Items[i]);
    cbFormaPagamento.Items.Clear;
    for i := 0 to 4 do
      cbFormaPagamento.Items.Add(items[i]);
    cbFormaPagamento.Items.Add('Pagamento Instantâneo (PIX)');
  end;

end;

end.
