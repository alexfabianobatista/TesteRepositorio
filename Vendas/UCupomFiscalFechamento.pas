unit UCupomFiscalFechamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DBCtrls, DB, Grids, DBGrids, Mask, ExtCtrls,
  ActnList, ComCtrls, UFmOperacao;

type
  TFCupomFiscalFechamento = class(TForm)
    Label1: TLabel;
    cbFormaPagamento: TComboBox;
    edValor: TEdit;
    btAdicionarPagamento: TBitBtn;
    BtCancelarCupom: TBitBtn;
    BtTerminarFechamento: TBitBtn;
    dbgPagamentos: TDBGrid;
    DSPagamentos: TDataSource;
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
    cbNotaManual: TCheckBox;
    pNotaManual: TPanel;
    MESerie: TMaskEdit;
    MEModelo: TMaskEdit;
    btSerieCons: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    FmOperacao1: TFmOperacao;
    btEstornar: TBitBtn;
    procedure ValidaKeyPress(Sender: TObject; var Key: Char);
    procedure ValidaValorDescontoDespesa(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btAdicionarPagamentoClick(Sender: TObject);
    procedure edDescontoExit(Sender: TObject);
    procedure edDespesaExit(Sender: TObject);
    procedure edValorExit(Sender: TObject);
    procedure MePercDescExit(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure btSerieConsClick(Sender: TObject);
    procedure cbNotaManualClick(Sender: TObject);
    procedure MEModeloExit(Sender: TObject);
    procedure FmOperacao1MeOperacaoExit(Sender: TObject);
    procedure btEstornarClick(Sender: TObject);
    procedure dbgPagamentosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
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
  FCupomFiscalFechamento: TFCupomFiscalFechamento;

implementation

uses UImpressoraFiscal, UImpressoraFiscal_cl, UCupomFiscalParcelas,
  UBiblioteca, UParamSistema_cl, USerieCons, USerie_cl, UOracle_cl;

{$R *.dfm}

procedure TFCupomFiscalFechamento.ValidaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (not (key in ['0'..'9', ',', #8])) then
    key := #0;
end;

procedure TFCupomFiscalFechamento.ValidaValorDescontoDespesa(Sender: TObject);
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
      if wValor >= DMImpressoraFiscal.QSomaCupomVAL_TOTAL.Value then
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

procedure TFCupomFiscalFechamento.FormActivate(Sender: TObject);
var
  wValTotal: Real;
  wContNota,wData,wHora: String;
begin
  edDesconto.Text := '0,00';
  MePercDesc.Text := '0,00';
  edDespesa.Text := '0,00';
  //DMImpressoraFiscal.QSomaCupom.Close;
  //DMImpressoraFiscal.QSomaCupom.SetVariable('COD_NOTA_CAB', DMImpressoraFiscal.QCupomFiscalCabCOD_NOTA_CAB.Value);
  //DMImpressoraFiscal.QSomaCupom.Open;
  DMImpressoraFiscal.QSomaCupom.Refresh;
  DMImpressoraFiscal.QPagamento.Close;
  DMImpressoraFiscal.QPagamento.SetVariable('COD_NOTA_CAB', DMImpressoraFiscal.QCupomFiscalCabCOD_NOTA_CAB.Value);
  DMImpressoraFiscal.QPagamento.Open;
  AtualizaValorTotal;
  //lbValorPago.Caption := '0,00';
  lbTroco.Caption := '0,00';
  BtTerminarFechamento.Enabled := False;
  btAdicionarPagamento.Enabled := true;
  cbFormaPagamento.Enabled := True;
  edValor.Enabled := True;
  edDesconto.Enabled := True;
  MePercDesc.Enabled := True;
  edDespesa.Enabled := True;
  MePercDesc.SetFocus;  
end;

procedure TFCupomFiscalFechamento.btAdicionarPagamentoClick(Sender: TObject);
var
  wFormaPgto, wValorAux: String;
  wValorPagamento, wValorPago: Real;
  wAuxValPago: Integer;
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
  if wFormaPgto <> 'DINHEIRO' then
  begin
    if (wValorPagamento - (ValorTotal - DMImpressoraFiscal.QSomaCupomVAL_PAGO.Value)) > 0.01 then
    begin
      MessageDlg('Somente pagamento em dinheiro pode gerar troco',mtError,[mbok],0);
      edValor.SetFocus;
      edValor.SelectAll;
      Abort;
    end;
  end;
  if wFormaPgto = 'A PRAZO' then
  begin
    with DMImpressoraFiscal do
    begin
      QPagamento.First;
      while not QPagamento.Eof do
      begin
        if QPagamentoDESC_PAGAMENTO.Value = 'A PRAZO' then
          raise Exception.Create('É permitido apenas um pagamento A PRAZO por venda!');
        QPagamento.Next;
      end;
    end;
    if wValorPagamento > (ValorTotal - DMImpressoraFiscal.QSomaCupomVAL_PAGO.Value) then
      raise Exception.Create('O valor do pagamento a prazo não pode ultrapassar o valor restante para o pagamento!');
    if FCupomFiscalParcelas = nil then
      FCupomFiscalParcelas := TFCupomFiscalParcelas.Create(Application);
    FCupomFiscalParcelas.pValorTotal := wValorPagamento;
    if FCupomFiscalParcelas.ShowModal = mrOk then
    begin
      pParcelas := FCupomFiscalParcelas.LBContaReceber.Items;
      pDepartamento := StrToInt(trim(FCupomFiscalParcelas.FmDepartamento.MeDepartamento.Text));
      pFinalidade := StrToInt(trim(FCupomFiscalParcelas.FmFinalidade.MeFinalidade.Text));
      pContaCorrente := StrToInt('0'+trim(FCupomFiscalParcelas.FmContaCorrente.MeContaCorrente.Text));
    end
    else
    begin
      MessageDlg('Parcelamento cancelado!', mtWarning, [mbOK], 0);
      Abort;
    end;
  end;
  //edDesconto.Enabled := false;
//  MePercDesc.Enabled := false;
//  edDespesa.Enabled := false;
  edValor.Clear;
  cbFormaPagamento.ItemIndex := -1;
  cbFormaPagamento.SetFocus;
  with DMImpressoraFiscal do
  begin
    QSomaCupom.Refresh; //Pega o valor pago antes do pagamento
    wValorPago := QSomaCupomVAL_PAGO.Value;
    QPagamento.Append;
    QPagamentoDESC_PAGAMENTO.Value := wFormaPgto;
    QPagamentoVAL_PAGAMENTO.Value := wValorPagamento;
    if(wValorPagamento+wValorPago > ValorTotal) then
      QPagamentoVal_Valor.Value :=  wValorPagamento -
        (wValorPagamento - (ValorTotal - wValorPago))
    else
      QPagamentoVal_Valor.Value := wValorPagamento;
    QPagamento.Post;
    QSomaCupom.Refresh; //Pega o valor pago depois do pagamento
    wValorPago := QSomaCupomVAL_PAGO.Value * 100;  
  end;
  wAuxValPago := trunc(wValorPago);
  wValorPago := wAuxValPago / 100;

  //Para saber se pode habilitar o botão de fechamento do cupom
  //Tolera diferença de 1 centavo
  if (Abs(ValorTotal - wValorPago) <= 0.01) or
    (wValorPago >= ValorTotal) then
  begin
    lbTroco.Caption := FormatFloat('#,##0.00', wValorPago - ValorTotal);
    btAdicionarPagamento.Enabled := False;
    cbFormaPagamento.Enabled := False;
    edValor.Enabled := False;
    BtTerminarFechamento.Enabled := true;
    BtTerminarFechamento.SetFocus;
  end
  else
    cbFormaPagamento.SetFocus;
  AtualizaValorTotal;
  MePercDesc.Enabled := false;
  edDesconto.Enabled := false;
  edDespesa.Enabled := false;
end;

procedure TFCupomFiscalFechamento.edDescontoExit(Sender: TObject);
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

procedure TFCupomFiscalFechamento.edDespesaExit(Sender: TObject);
begin
  ValidaValorDescontoDespesa(Sender);
  if StrToFloat(Trim(edDespesa.Text)) < 0.000 then
  begin
    MessageDlg('Não é permitido informar valor nulo(zero) ou negativo!',
      mtError,[mbOk],0);
    edDespesa.SetFocus;
    Abort;
  end;
  AtualizaValorTotal;
  if Trim(edDespesa.Text) <> '' then
    edDespesa.Text :=
      FormatFloat('#,##0.00',StrToFloat(edDespesa.Text));
end;

procedure TFCupomFiscalFechamento.AtualizaValorTotal;
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
  ValorTotal := DMImpressoraFiscal.QSomaCupomVAL_TOTAL.Value
    - wValDesconto + wValDespesa;
  lbTotal.Caption := FormatFloat('#,##0.00', ValorTotal);
  edValor.Text := FormatFloat('#,##0.00',
    ValorTotal -
    DMImpressoraFiscal.QSomaCupomVAL_PAGO.Value);
  if StrToFloat(bib.LimpaString(edValor.Text,'.')) <= 0 then
    edValor.Clear;
end;

procedure TFCupomFiscalFechamento.edValorExit(Sender: TObject);
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

procedure TFCupomFiscalFechamento.MePercDescExit(Sender: TObject);
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

procedure TFCupomFiscalFechamento.Action1Execute(Sender: TObject);
begin
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFCupomFiscalFechamento.btSerieConsClick(Sender: TObject);
begin
  if FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
  FSerieCons.METexto.Text := DMImpressoraFiscal.QCupomFiscalCabCOD_FILIAL.Text;
  FSerieCons.METexto.Enabled := false;
  FSerieCons.BtProcurarClick(Self);
  if FSerieCons.ShowModal = MrOk then
  begin
    with DMSerie do
    begin
      MESerie.Text := QSerieConsCOD_SERIE.Value;
      MEModelo.Text := QSerieConsCOD_SERIE_MODELO.Value;
      MEModeloExit(Self);
    end;
  end;
end;

procedure TFCupomFiscalFechamento.cbNotaManualClick(Sender: TObject);
begin
  pNotaManual.Visible := cbNotaManual.Checked;
  if cbNotaManual.Checked then
    MESerie.SetFocus;
end;

procedure TFCupomFiscalFechamento.MEModeloExit(Sender: TObject);
begin
  if (Trim(MEModelo.Text) <> '') and (Trim(MEModelo.Text) <> '02')then
  begin
    MessageDlg('Modelo de série não permitido. Deve-se utilizar modelo 02.',
      mtError, [mbOk], 0);
    MEModelo.Clear;
    MEModelo.SetFocus;
  end;
end;

procedure TFCupomFiscalFechamento.FmOperacao1MeOperacaoExit(
  Sender: TObject);
begin
  FmOperacao1.MeOperacaoExit(Sender);
  if trim(FmOperacao1.MeOperacao.Text) <> '' then
  begin
    if DMOracle.FastSelect('IND_TIPO_OPERACAO','TB_OPERACAO',
      'COD_OPERACAO = ' + trim(FmOperacao1.MeOperacao.Text)) = 'E' then
    begin
      MessageDlg('Operação deve ser de saída',mtError,[mbOk],0);
      FmOperacao1.MeOperacao.Clear;
      FMOperacao1.SetFocus;
    end;
  end;
end;

procedure TFCupomFiscalFechamento.btEstornarClick(Sender: TObject);
  var wValor: String;
begin
  wValor := InputBox('Estorno','Insira o valor a ser estornado',
    DMImpressoraFiscal.QPagamentoVAL_PAGAMENTO.Text);
  try
    StrToFloat(wValor);
  Except
    MessageDlg('Valor informado é incorreto',mtError,
      [mbOk],0);
    Abort;
  end;
  try
    if StrToFloat(wValor) > DMImpressoraFiscal.QPagamentoVAL_PAGAMENTO.Value then
      Exception.Create('Valor a ser estornado é maior que valor da parcela');
  Except
    on e: Exception do
    begin
      MessageDlg(e.Message,mtError,[mbok],0);
      Abort;
    end;
  end;
  FImpressoraFiscal.AdicionaPagamento('ESTORNO',StrToFloat(wValor),
    DMImpressoraFiscal.QPagamentoCOD_NOTA_CAB.Value);
  DMImpressoraFiscal.QSomaCupom.Close;
  DMImpressoraFiscal.QSomaCupom.SetVariable('COD_NOTA_CAB',
    DMImpressoraFiscal.QCupomFiscalCabCOD_NOTA_CAB.Value);
  DMImpressoraFiscal.QSomaCupom.Open;
  AtualizaValorTotal;
end;

procedure TFCupomFiscalFechamento.dbgPagamentosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var i: integer;
begin                                   
  if (DMImpressoraFiscal.QPagamentoIND_ESTORNO.Value = 'S') or
    (DMImpressoraFiscal.QPagamentoIND_ESTORNO.Value = 'P') then
  begin
    dbgPagamentos.Canvas.Font.Style := dbgPagamentos.Canvas.Font.Style + [fsBold];
    dbgPagamentos.Canvas.Font.Color := clWhite;
    dbgPagamentos.Canvas.Brush.Color := clRed;
    dbgPagamentos.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

end.
