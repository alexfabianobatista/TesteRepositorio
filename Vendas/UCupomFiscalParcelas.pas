unit UCupomFiscalParcelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, UFmContaCorrente, UFmFinalidade,
  UFmDepartamento;

type
  TFCupomFiscalParcelas = class(TForm)
    GBCPNota: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label23: TLabel;
    MEDataCP: TMaskEdit;
    MEValorCP: TMaskEdit;
    BtApagaParcela: TBitBtn;
    LBContaReceber: TListBox;
    MEDiasCP: TMaskEdit;
    MePrazo: TMaskEdit;
    BtPrazo: TBitBtn;
    btOK: TBitBtn;
    BtCancelar: TBitBtn;
    Label1: TLabel;
    lbValTotal: TLabel;
    Label3: TLabel;
    lbValorPago: TLabel;
    FmDepartamento: TFmDepartamento;
    FmFinalidade: TFmFinalidade;
    FmContaCorrente: TFmContaCorrente;
    procedure BtApagaParcelaClick(Sender: TObject);
    procedure MEValorCPExit(Sender: TObject);
    procedure MePrazoExit(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure MEDiasCPExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtPrazoClick(Sender: TObject);
    procedure FmDepartamentoMeDepartamentoExit(Sender: TObject);
    procedure FmFinalidadeMeFinalidadeExit(Sender: TObject);
    procedure FmContaCorrenteMeContaCorrenteExit(Sender: TObject);
  private
    fValorTotal: Real;
    Function CalculaValorPago: Real;
    procedure geraParcelas;
  public
    property pValorTotal: Real read fValorTotal write fValorTotal;
  end;

var
  FCupomFiscalParcelas: TFCupomFiscalParcelas;

implementation

uses UBiblioteca, UPrazoVencimento_cl, UOracle_cl, UImpressoraFiscal,
  UImpressoraFiscal_cl, UPrazoVencimentoCons, UUsuario_cl;

{$R *.dfm}

procedure TFCupomFiscalParcelas.BtApagaParcelaClick(Sender: TObject);
begin
  LBContaReceber.Items.Delete(LBContaReceber.ItemIndex);
  lbValorPago.Caption := FormatFloat('#,##0.00', CalculaValorPago);
end;

function TFCupomFiscalParcelas.CalculaValorPago: Real;
var wCont: Integer;
  wValPago: Real;
  wAux: String;
begin
  wValPago := 0.00;
  for wCont := 0 to LBContaReceber.Items.Count - 1 do
  begin
    wAux := Copy(LBContaReceber.Items[wCont], 11, 15);
    wAux := Bib.LimpaString(wAux, '.');
    wValPago := wValPago + StrToFloat(wAux);
  end;
  Result := wValPago;
end;

procedure TFCupomFiscalParcelas.MEValorCPExit(Sender: TObject);
var wLinha, wAux: string;
const wBranco: string = '                            ';
begin
  if (MEDataCP.Text <> '') and
    (MEValorCP.Text <> '') then
  begin
    if StrToDate(MEDataCp.Text) < Date then
      raise Exception.Create('Data de Vencimento Menor que Data Atual!');
    wLinha := DateToStr(StrToDate(MEDataCP.Text));
    wAux := FormatFloat('###,###,##0.00', StrToFloat(bib.LimpaString(MEValorCP.Text,'.')));
    wAux := Copy(wBranco, 1, 15 - Length(waux)) + wAux;
    wLinha := wLinha + wAux;
    LBContaReceber.Items.Add(wLinha);
    lbValorPago.Caption := FormatFloat('#,##0.00', CalculaValorPago);
    MEDataCP.Text := '';
    MEValorCP.Text := '';
    MEDiasCP.SetFocus;
  end;
end;

procedure TFCupomFiscalParcelas.geraParcelas;
var wLinha, wAux, wParc: string;
  wParcela, wSoma, wDiferenca: Real;
  wCont: Integer;
  wComissao: Extended;
const wBranco: string = '                            ';
begin
  if Trim(MePrazo.Text) <> '' then
  begin
    wParc := DMOracle.BuscaNome('SELECT NUM_PARCELAS FROM TB_PRAZO_VENCIMENTO', 'COD_PRAZO_VENCIMENTO = ' + Trim(MePrazo.Text));
    if wParc = '' then
      raise Exception.Create('Código de parcelas inexistente');
    if StrToInt(wParc) = 0 then
    begin
      MePrazo.SetFocus;
      MePrazo.SelectAll;
      raise exception.Create('Prazo cadastrado sem parcelas. Não pode ser utilizado. Verifique!');
    end;
    wAux := DMOracle.BuscaNome('SELECT VAL_MINIMO_VENDA FROM TB_PRAZO_VENCIMENTO', 'COD_PRAZO_VENCIMENTO = ' + Trim(MePrazo.Text));
    if StrToFloat(wAux) <> 0 then
      if pValorTotal < StrToFloat(wAux) then
      begin
        MePrazo.SetFocus;
        raise Exception.Create('Valor do pagamento menor que mínimo exigido para este prazo');
      end;
    DMPrazoVencimento.QPrazoVencimentoDias.Close;
    DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('COD_PRAZO_VENCIMENTO', Trim(MePrazo.Text));
    DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('NUM_DIAS', Null);
    DMPrazoVencimento.QPrazoVencimentoDias.Open;
    LBContaReceber.Items.Clear;
	wParcela := Trunc(pValorTotal / StrToFloat(wParc) * 100) / 100;
	wCont := 0;
	wSoma := 0;
	while not (DMPrazoVencimento.QPrazoVencimentoDias.Eof) do
	begin
		inc(wCont);
		wSoma := wSoma + wParcela;
		if wCont = StrToInt(wParc) then
		begin
		  wDiferenca := pValorTotal - wSoma;
		  wParcela := wParcela + wDiferenca;
		end;
		wLinha := DateToStr(Date + DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value);
		wAux := FormatFloat('###,###,##0.00', wParcela);
		wAux := Copy(wBranco, 1, 15 - Length(waux)) + wAux;
		wLinha := wLinha + wAux;
		LBContaReceber.Items.Add(wLinha);
		DMPrazoVencimento.QPrazoVencimentoDias.Next;
	end;
    MEDataCP.Text := '';
    MEValorCP.Text := '';
    MePrazo.Text := '';
  end;
  lbValorPago.Caption := FormatFloat('#,##0.00', CalculaValorPago);
end;

procedure TFCupomFiscalParcelas.MePrazoExit(Sender: TObject);
begin
  if Trim(MePrazo.Text) <> '' then
  begin
    StrToInt(Trim(MePrazo.Text));
    geraParcelas;
    btOK.SetFocus;
  end;
end;

procedure TFCupomFiscalParcelas.btOKClick(Sender: TObject);
begin
  if trim(FmDepartamento.MeDepartamento.Text) <> '' then
  begin
    StrToInt(Trim(FmDepartamento.MeDepartamento.Text));
    if trim(DMOracle.FastSelect('COD_DEPARTAMENTO', 'TB_DEPARTAMENTO',
      'COD_DEPARTAMENTO = ' + trim(FmDepartamento.MeDepartamento.Text))) = '' then
      raise Exception.Create('O departamento informado não está cadastrado!');
  end
  else
    raise Exception.Create('O departamento não está informado!');

  if trim(FmFinalidade.MeFinalidade.Text) <> '' then
  begin
    StrToInt(Trim(FmFinalidade.MeFinalidade.Text));
    if trim(DMOracle.FastSelect('COD_FINALIDADE', 'TB_FINALIDADE',
      'COD_FINALIDADE = ' + trim(FmFinalidade.MeFinalidade.Text))) = '' then
      raise Exception.Create('A finalidade informada não está cadastrada!');
  end
  else
    raise Exception.Create('A finalidade não está informada!');

  if trim(FmContaCorrente.MeContaCorrente.Text) <> '' then
  begin
    StrToInt(trim(FmContaCorrente.MeContaCorrente.Text));
    if trim(DMOracle.FastSelect('COD_CONTA_CORRENTE', 'TB_CONTA_CORRENTE',
      'COD_CONTA_CORRENTE = ' + trim(FmContaCorrente.MeContaCorrente.Text))) = '' then
      raise Exception.Create('A conta corrente informada não está cadastrada!');
  end;
  
  if CalculaValorPago <> pValorTotal then
    Raise Exception.Create('O valor a ser parcelado e o total das parcelas são diferentes!'
    + #13 + #10 + 'Valor a ser parcelado: ' + FormatFloat('#,##0.00', pValorTotal)
      + ' Total das parcelas: ' + FormatFloat('#,##0.00', CalculaValorPago));
  ModalResult := mrOk;
end;

procedure TFCupomFiscalParcelas.MEDiasCPExit(Sender: TObject);
begin
  if Trim(MEDiasCP.Text) <> '' then
  begin
    MEDataCP.Text := DateToStr(DMImpressoraFiscal.QCupomFiscalCabDT_EMISSAO.Value + StrToFloat(MEDiasCP.Text));
    MEDiasCP.Text := '';
  end;
end;

procedure TFCupomFiscalParcelas.FormActivate(Sender: TObject);
var
  wCodDep, wCodFin: String;
begin
  wCodDep := DMOracle.FastSelect('COD_DEPARTAMENTO','TB_USUARIO','COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente));
  wCodFin := DMOracle.FastSelect('COD_FINALIDADE','TB_USUARIO','COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente));
  LBContaReceber.Clear;

  FmDepartamento.MeDepartamento.Text := wCodDep;
  FmFinalidade.MeFinalidade.Text := wCodFin;
  FmContaCorrente.MeContaCorrente.Clear;
  MePrazo.Clear;
  lbValTotal.Caption := FormatFloat('#,##0.00', pValorTotal);
end;

procedure TFCupomFiscalParcelas.BtPrazoClick(Sender: TObject);
begin
  if FPrazoVencimentoCons = nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  if FPrazoVencimentoCons.showModal = mrOk then
  begin
    MePrazo.Text := DMPrazoVencimento.QPrazoVencimento_ConsCod_Prazo_Vencimento.Text;
    MePrazoExit(Self);
  end;
end;

procedure TFCupomFiscalParcelas.FmDepartamentoMeDepartamentoExit(
  Sender: TObject);
begin
  try
    if trim(FmDepartamento.MeDepartamento.Text) <> '' then
      StrToInt(trim(FmDepartamento.MeDepartamento.Text));
    FmDepartamento.MeDepartamentoExit(Sender);
  except
    FmDepartamento.MeDepartamento.SetFocus;
    FmDepartamento.MeDepartamento.SelectAll;
    raise;
  end;
end;

procedure TFCupomFiscalParcelas.FmFinalidadeMeFinalidadeExit(
  Sender: TObject);
begin
  try
    if trim(FmFinalidade.MeFinalidade.Text) <> '' then
      StrToInt(trim(FmFinalidade.MeFinalidade.Text));
    FmFinalidade.MeFinalidadeExit(Sender);
  except
    FmFinalidade.MeFinalidade.SetFocus;
    FmFinalidade.MeFinalidade.SelectAll;
    raise;
  end;
end;

procedure TFCupomFiscalParcelas.FmContaCorrenteMeContaCorrenteExit(
  Sender: TObject);
begin
  try
    if trim(FmContaCorrente.MeContaCorrente.Text) <> '' then
      StrToInt(trim(FmContaCorrente.MeContaCorrente.Text));
    FmContaCorrente.MeContaCorrenteExit(Sender);
  except
    FmContaCorrente.MeContaCorrente.SetFocus;
    FmContaCorrente.MeContaCorrente.SelectAll;
    raise;
  end;
end;

end.
