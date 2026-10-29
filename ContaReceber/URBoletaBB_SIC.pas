unit URBoletaBB_SIC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Barcode, UNITBOLETA, jpeg, QRPDFFilt;

type
  TFRBoletaBB_SIC = class(TBoleta)
    QRLFator: TQRLabel;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel67: TQRLabel;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel51: TQRLabel;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText31Print(sender: TObject; var Value: string);
    procedure QRDBText32Print(sender: TObject; var Value: string);
    procedure QRDBText33Print(sender: TObject; var Value: string);
    procedure QRDBText28Print(sender: TObject; var Value: string);
    procedure QRDBText38Print(sender: TObject; var Value: string);
    procedure Especie3Print(sender: TObject; var Value: string);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRBoletaBB_SIC: TFRBoletaBB_SIC;
  wNumConvenio : string; //4+6 digitos - fixei 1244 + o que for informado no campo num_convenio

implementation

uses Clipbrd, UContasReceber_cl, UBiblioteca,
  USequencia_cl, UOracle_cl, UParamSistema_cl, UContasReceberParam, DB;

{$R *.DFM}

function intdecimais(wValor :String; wTamanho, wDecimais:integer): String;
var
  C, Cont, Posicao :integer;
  Res, Aux :String;
begin
  for Cont := 1 to wTamanho do
    Aux := '0' + Aux;

  If wValor <> '' then
  Begin
    Str(StrToFloat(Trim(wValor)):wTamanho:wDecimais, Res);

    while Pos(' ', Res) > 0 do
      Res[Pos(' ', Res)] := '0';

    while Pos('.', Res) > 0 do
    Begin
      Posicao:= Pos('.', Res);
      Delete(Res,Posicao,1);
    End;

  C := Length(Res);
  for Cont:= wTamanho downto 1 do
  Begin
    Aux[Cont] := Res[C];
    Dec(C,1);
    If C < 1 then
      Break;
  End;

  End;
  Res:= Aux;
  Result := Res;
End;

procedure TFRBoletaBB_SIC.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  CampoLivre, wAux, wCodBarras: string;
  DVBarras, DVCampo1, DVCampo2, DVCampo3: string;
  Campo1,Campo2, Campo3: string;
  wNN, agencia : string;
  Barcode : TBarcode;
  wDesconto : Real;
begin
  With DMContasReceber do
  BEGIN
  wNN := '';
  try
    QRDBText36.Enabled := True;
    QRDBText35.Enabled := True;
    NossoNumero3.Enabled := True;

    Agencia := Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCOD_AGENCIA.Value), 4);
    wNumConvenio := '1244' + copy(DMContasReceber.qrbloquetoNUM_CONVENIO.Text,1,6); //4+6 digitos - fixei 1244 + o que for informado no campo num_convenio

    if DMContasReceber.QRBloquetoNOSSO_NUMERO.Text = '' then
    begin
      DMContasReceber.QRBloquetonosso_numero_seq.Value :=
        DMSequencia.Sequencia(dmcontasreceber.QRBloquetoCOD_FILIAL.Value, 'NossoNumero_BB_SIC');

      if (DMContasReceber.QRBloquetonosso_numero_seq.Value >= 100000) then
      begin
        MessageDlg('Sequência Nosso Número atingiu valor máximo.', MtWarning, [mbOk], 0);
        QRPrimario.QRPrinter.Cancel;
        Exit;
      end
      else
        DMContasReceber.QRBloquetoNOSSO_NUMERO.Text := wNumConvenio + bib.strzero(DMContasReceber.QRBloquetonosso_numero_seq.AsString,7);
        wNN := DMContasReceber.QRBloquetoNOSSO_NUMERO.Text;
      end
    else
      wNN := DMContasReceber.QRBloquetoNOSSO_NUMERO.Text;

    CampoLivre := copy(wNumConvenio,1,10) +
      Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCOD_AGENCIA.Value), 4) +
      DMContasReceber.QRBloquetoDIGITO_VERIFICADOR_AGENCIA.Value +
      Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCODIGO_CEDENTE.Value), 8) +
      Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCARTEIRA.Value), 2);

    {Codigo de Barras}
    if DMContasReceber.QRBloquetoDT_VENCIMENTO.Value > StrToDate('22/02/2025') then  // Em 22/02/2025 o fator de vcto zerá resetado para inicial 1000
      QRLFator.Caption := FloatToStr(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('29/05/2022'))
    else
      QRLFator.Caption := FloatToStr(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('07/10/1997'));

    DVBarras := Modulo11BB_CBarra('001' + '9' +
      QRLFator.Caption +
      intdecimais(Bib.StrZero(DMContasReceber.QRBloquetoVAL_TITULO.Text,10),10,2) +
      '000000' + wNN + Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCARTEIRA.Value), 2));//CampoLivre);

    Barcode := TBarcode.Create(Self);
    try
      Barcode.BarcodeType := btInterleaved2of5;
    // Calculo usando fator de vencimento.

    Barcode.Digits := '001' + '9' + DVBarras + QRLFator.Caption +
      intdecimais(Bib.StrZero(DMContasReceber.QRBloquetoVAL_TITULO.Text,10),10,2) +
      '000000' + wNN + Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCARTEIRA.Value), 2);

    wCodBarras := Barcode.Digits;
    Barcode.BarcodeCopy;

    finally
      Barcode.Free;
    end;
    try
      QRImage1.Picture.Assign(Clipboard);
    except
      ShowMessage('Erro capturando Clipboard');
    end;

    {Linha Digitavel}
    DVCampo1 := Modulo10('001' + '9' + Copy(wCodBarras, 20, 5));
    Campo1 := '001' + '9' + Copy(wCodBarras, 20, 5) + DVCampo1;

    DVCampo2 := Modulo10(Copy(wCodBarras, 25, 10));
    Campo2 := Copy(wCodBarras, 25, 10) + DVCampo2;

    DVCampo3 := Modulo10(Copy(wCodBarras, 35, 10));
    Campo3 := Copy(wCodBarras, 35, 10) + DVCampo3;

    LabelNumeroDigitavel3.Caption :=
      Copy(Campo1, 1, 5) + '.' + Copy(Campo1, 6, 5) + ' ' + Copy(Campo2, 1, 5) + '.' + Copy(Campo2, 6, 6) + ' ' +
      Copy(Campo3, 1, 5) + '.' + Copy(Campo3, 6, 6) + ' ' + DVBarras;

    LabelNumeroDigitavel2.Caption := LabelNumeroDigitavel3.Caption;
    LabelNumeroDigitavel1.Caption := LabelNumeroDigitavel3.Caption;

    LocalPagamento1.Caption := DMContasReceber.QRBloquetoDESC_LOCAL_PGTO_BLOQ.Value;
    LocalPagamento2.Caption := LocalPagamento1.Caption;
    LocalPagamento3.Caption := LocalPagamento1.Caption;

    LabelValorNumeroDigitavel3.Caption :=
      QRLFator.Caption + intdecimais(Bib.StrZero(DMContasReceber.QRBloquetoVAL_TITULO.Text,10),10,2);

    LabelValorNumeroDigitavel2.Caption := LabelValorNumeroDigitavel3.Caption;
    LabelValorNumeroDigitavel1.Caption := LabelValorNumeroDigitavel3.Caption;

    LabelAgenciaCedente3.Caption := Agencia + '-' +
      DMContasReceber.QRBloquetoDIGITO_VERIFICADOR_AGENCIA.AsString + ' / ' +
      DMContasReceber.QRBloquetoCODIGO_CEDENTE.AsString + '-' +
      DMContasReceber.QRBloquetoDIGITO_VERIFICADOR_CEDENTE.AsString;

    LabelAgenciaCedente2.Caption := LabelAgenciaCedente3.Caption;
    LabelAgenciaCedente1.Caption := LabelAgenciaCedente3.Caption;

    QRDBText36.Caption := wnn;
    QRDBText35.Caption := wnn;
    NossoNumero3.Caption := wnn;

    QRMemo1.Lines.Clear;

    if (DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value <> 0) then
      QRMemo1.Lines.Add(DMContasReceber.QRBloquetoinstrucao_juro.Text);

    if DMContasReceber.QRBloquetoPERC_DESCONTO.Value > 0 then
    begin
      wDesconto := ((DMContasReceber.QRBloquetoVAL_TITULO.Value * DMContasReceber.QRBloquetoPERC_DESCONTO.Value) / 100);
      QRLabel61.Caption := FormatFloat('#,##0.00',wDesconto);
      QRLabel62.Caption := FormatFloat('#,##0.00',wDesconto);
      QRLabel63.Caption := FormatFloat('#,##0.00',wDesconto);
    end
    else
    Begin
      QRLabel61.Caption := '';
      QRLabel62.Caption := '';
      QRLabel63.Caption := '';
    End;

    if (DMContasReceber.QRBloquetoPRIMEIRA_INSTR_COD.Value = '07') then
      QRMemo1.Lines.Add('Não protestar')
    else
      QRMemo1.Lines.Add(Trim(DMContasReceber.QRBloquetoDESC_INSTRUCAO_BLOQUETO.Value));

    //(nos parametros do relatorios é informado o codigo da mensagem que deve sair no campo de instrucoes)
    wAux := '';
    if DMContasReceber.pCodMensagem > 0 then
      wAux := DMOracle.BuscaNome('SELECT DESC_MENSAGEM FROM TB_MENSAGEM', 'COD_MENSAGEM = ' + IntToStr(DMContasReceber.pCodMensagem));
    if wAux <> '' then
      QRMemo1.Lines.Add(wAux);

    QRMemo2.Lines := QRMemo1.Lines;
    QRMemo3.Lines := QRMemo1.Lines;
    if DMContasReceber.QRBloquetoval_acrescimo.Value > 0 then
    begin
      QRDBText46.Enabled := True;
      QRDBText47.Enabled := True;
      QRDBText48.Enabled := True;
    end
    else
    begin
      QRDBText46.Enabled := False;
      QRDBText47.Enabled := False;
      QRDBText48.Enabled := False;
    end;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
  END;
end;

procedure TFRBoletaBB_SIC.QRDBText31Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := '-' + Bib.StrZero(Value, 3);
end;

procedure TFRBoletaBB_SIC.QRDBText32Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := '-' + Bib.StrZero(Value, 3);
end;

procedure TFRBoletaBB_SIC.QRDBText33Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := '-' + Bib.StrZero(Value, 3);
end;

procedure TFRBoletaBB_SIC.QRDBText28Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := 'DM';
end;

procedure TFRBoletaBB_SIC.QRDBText38Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := 'DM';
end;

procedure TFRBoletaBB_SIC.Especie3Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := 'DM';
end;

procedure TFRBoletaBB_SIC.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  with DMContasReceber do
  begin
  try
    if QRBloquetoNOSSO_NUMERO.Text = '' then
    begin
      if DMOracle.DBCemapa.InTransaction = False then
        DMOracle.DBCemapa.StartTransaction;
      if QRBloquetoNUM_TITULO.Value = 0 then
      begin
        QRBloquetoPeriodo.Close;
        QRBloquetoPeriodo.SetVariable('COD_BANCO_AGENCIA', Trim(FContasReceberParam.ME36Banco.Text));
        QRBloquetoPeriodo.SetVariable('COD_CONTA_CORRENTE', Trim(FContasReceberParam.ME36ContaCorrente.Text));
        QRBloquetoPeriodo.SetVariable('COD_FILIAL', Trim(FContasReceberParam.ME36Filial.Text));
        QRBloquetoPeriodo.SetVariable('COD_CADASTRO', QRBloquetoCOD_CADASTRO.Text);
        QRBloquetoPeriodo.SetVariable('DT_INICIAL', Trim(FContasReceberParam.ME36DtInicial.Text));
        QRBloquetoPeriodo.SetVariable('DT_FINAL', Trim(FContasReceberParam.ME36DtFinal.Text) + ' 23:59:59');
        QRBloquetoPeriodo.Open;
        QRBloquetoPeriodo.First;
        while not QRBloquetoPeriodo.Eof do
        begin
          QAtuBloq.Close;
            QAtuBloq.SetVariable('NUMERO', wNumConvenio +//Trim(QRBloquetoNUM_CONVENIO.Text) +
              Bib.StrZero(QRBloquetonosso_numero_seq.AsString, 7));
          QAtuBloq.SetVariable('COD_CONTA_RECEBER_CAB', QRBloquetoPeriodoCOD_CONTA_RECEBER_CAB.Value);
          QAtuBloq.ExecSQL;
          QRBloquetoPeriodo.Next;
        end;
      end;
    end
    else
    begin
      QAtuBloq.Close;
        QAtuBloq.SetVariable('NUMERO', QRBloquetoNOSSO_NUMERO.Text);
      QAtuBloq.SetVariable('COD_CONTA_RECEBER_CAB', QRBloquetoCOD_CONTA_RECEBER_CAB.Value);
      QAtuBloq.ExecSQL;
    end;
    DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      raise exception.Create('Erro ao tentar gravar Nosso Número no Contas a Receber.');
    end;
    end;
  end;
procedure TFRBoletaBB_SIC.FormCreate(Sender: TObject);
begin
  inherited;
  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE') or
    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE') or
    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DISPART') or
    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'LANGE')) then
  begin
    QRDBText46.Enabled := False;
    QRDBText47.Enabled := False;
    QRDBText48.Enabled := False;
  end;
end;

end.
