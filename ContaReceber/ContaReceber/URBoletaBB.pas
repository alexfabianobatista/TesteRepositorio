unit URBoletaBB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Barcode, UNITBOLETA, jpeg;

type
  TFRBoletaBB = class(TBoleta)
    QRLFator: TQRLabel;
    QRLDVNossoNumero1: TQRLabel;
    QRLDVNossoNumero2: TQRLabel;
    QRLDVNossoNumero3: TQRLabel;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel51: TQRLabel;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel67: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure NossoNumero3Print(sender: TObject; var Value: string);
    procedure QRDBText35Print(sender: TObject; var Value: string);
    procedure QRDBText36Print(sender: TObject; var Value: string);
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
  FRBoletaBB: TFRBoletaBB;
  wBoleta7: Boolean;

implementation

uses Clipbrd, UContasReceber_cl, UBiblioteca,
  USequencia_cl, UOracle_cl, UParamSistema_cl, UContasReceberParam;

{$R *.DFM}

procedure TFRBoletaBB.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  CampoLivre, wAux, wCodBarras: string;
  CodigoCarteira,
    DVBarras,
    DVCampo1,
    DVCampo2,
    DVCampo3: string[1];
  Banco, Agencia: string[4];
  ValorInt: string[12];
  ValorFrac: string[2];
  Campo1,
    Campo2,
    Campo3: string[15];
  Barcode: TBarcode;
  wDesconto: Real;
//  DVNNumero: string;
//  CalculoDigitoBarra: string;
//  x : integer;
begin
  wBoleta7 := (Length(DMContasReceber.QRBloquetoNUM_CONVENIO.Text) = 7); //Variavel para alterar emissao do boleto quando for convenio de 7 digitos.
  if DMContasReceber.QRBloquetoPERC_DESCONTO.Value > 0 then
  begin
    wDesconto := ((DMContasReceber.QRBloquetoVAL_TITULO.Value * DMContasReceber.QRBloquetoPERC_DESCONTO.Value) / 100);
    QRLabel61.Caption := FormatFloat('#,##0.00',wDesconto);
    QRLabel62.Caption := FormatFloat('#,##0.00',wDesconto);
    QRLabel63.Caption := FormatFloat('#,##0.00',wDesconto);
  end
  else
  begin
    QRLabel61.Caption := '';
    QRLabel62.Caption := '';
    QRLabel63.Caption := '';
  end;
  if DMContasReceber.QRBloquetoNOSSO_NUMERO.Text = '' then
  begin
    try
      QRlabel24.caption := '';
      QRLabel28.Caption := QRlabel24.caption;
      QRLabel29.Caption := QRlabel24.caption;
      QRDBText36.Enabled := True;
      QRDBText35.Enabled := True;
      NossoNumero3.Enabled := True;

      DMContasReceber.QRBloquetonosso_numero_seq.Value :=
        DMSequencia.Sequencia(Trunc(1), 'NossoNumero_BB');
      if (DMContasReceber.QRBloquetonosso_numero_seq.Value >= 100000) and (not wBoleta7) then
      begin
        MessageDlg('Sequência Nosso Número deve ser inicializada, sequência atingiu valor máximo!!!', mtWarning, [mbOk], 0);
        QRPrimario.QRPrinter.Cancel;
        Exit;
      end;
      Banco := Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCOD_BANCO.Value), 3);
      Agencia := Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCOD_AGENCIA.Value), 4);
      CodigoCarteira := DMContasReceber.QRBloquetoCARTEIRA.AsString;
      if wBoleta7 then
        CampoLivre := Bib.StrZero(DMContasReceber.QRBloquetoNUM_CONVENIO.AsString, 6) +
          Bib.StrZero(DMContasReceber.QRBloquetonosso_numero_seq.AsString, 10) +
          Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCOD_AGENCIA.Value), 4) +
          Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCODIGO_CEDENTE.Value), 8) +
          Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCARTEIRA.Value), 2)
      else
        CampoLivre := Bib.StrZero(DMContasReceber.QRBloquetoNUM_CONVENIO.AsString, 6) +
          Bib.StrZero(DMContasReceber.QRBloquetonosso_numero_seq.AsString, 5) +
          Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCOD_AGENCIA.Value), 4) +
          Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCODIGO_CEDENTE.Value), 8) +
          Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCARTEIRA.Value), 2);
    {Codigo de Barras}
      ValorInt := Bib.StrZero(IntToStr(Trunc(DMContasReceber.QRBloquetoVAL_TITULO.Value)), 12);
      ValorFrac := Bib.Right(FloatToStrF(DMContasReceber.QRBloquetoVAL_TITULO.Value, ffFixed, 10, 2), 2);
      QRLFator.Caption := FloatToStr(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('07/10/1997'));
      if wBoleta7 then
        DVBarras := Modulo11BB_CBarra(Banco +
          '9' +
          DVBarras +
          QRLFator.Caption +
          Copy(ValorInt, 5, 8) +
          ValorFrac + '000000' +
          Copy(CampoLivre, 1, 17) +
          DMContasReceber.QRBloquetoCARTEIRA.AsString)
      else
        DVBarras := Modulo11BB_CBarra(Banco +
          '9' +
          QRLFator.Caption +
          Bib.StrZero(IntToStr(Trunc(DMContasReceber.QRBloquetoVAL_TITULO.Value)), 8) +
          ValorFrac +
          Copy(CampoLivre, 1, 11) +
          Agencia +
          Bib.StrZero(DMContasReceber.QRBloquetoCODIGO_CEDENTE.AsString, 8) +
          DMContasReceber.QRBloquetoCARTEIRA.AsString);
      Barcode := TBarcode.Create(Self);
      try
        Barcode.BarcodeType := btInterleaved2of5;
      // Calculo usando fator de vencimento.

        if wBoleta7 then
          Barcode.Digits := Banco + '9' + DVBarras + QRLFator.Caption + Copy(ValorInt, 5, 8) + ValorFrac + '000000' + Copy(CampoLivre, 1, 17) +
            DMContasReceber.QRBloquetoCARTEIRA.AsString
        else
          Barcode.Digits := Banco + '9' + DVBarras + QRLFator.Caption + Copy(ValorInt, 5, 8) + ValorFrac + Copy(CampoLivre, 1, 11) +
            Agencia + Bib.StrZero(DMContasReceber.QRBloquetoCODIGO_CEDENTE.Text, 8) +
            DMContasReceber.QRBloquetoCARTEIRA.AsString;
        wCodBarras := Barcode.Digits;
//      InputBox('codigo barra', 'codigo de barras', Barcode.Digits);
//      InputBox('campo livre', 'campo livre', CampoLivre);
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
      if wBoleta7 then
      begin
        Campo1 := Banco + '9' + Copy(wCodBarras, 20, 5);
        DVCampo1 := Modulo10(Campo1);
        Campo1 := Campo1 + DVCampo1;

        Campo2 := Copy(wCodBarras, 25, 10);
        DVCampo2 := Modulo10(Campo2);
        Campo2 := Campo2 + DVCampo2;

        Campo3 := Copy(wCodBarras, 35, 10);
        DVCampo3 := Modulo10(Campo3);
        Campo3 := Campo3 + DVCampo3;
      end
      else
      begin
        DVCampo1 := Modulo10(Banco + '9' + Copy(CampoLivre, 1, 5));
        Campo1 := Banco + '9' + Copy(CampoLivre, 1, 5) + DVCampo1;

        DVCampo2 := Modulo10(Copy(CampoLivre, 6, 10));
        Campo2 := Copy(CampoLivre, 6, 10) + DVCampo2;

        DVCampo3 := Modulo10(Copy(CampoLivre, 16, 10));
        Campo3 := Copy(CampoLivre, 16, 10) + DVCampo3;
      end;

      LabelNumeroDigitavel3.Caption :=
        Copy(Campo1, 1, 5) + '.' + Copy(Campo1, 6, 5) + ' ' + Copy(Campo2, 1, 5) + '.' + Copy(Campo2, 6, 6) + ' ' +
        Copy(Campo3, 1, 5) + '.' + Copy(Campo3, 6, 6) + ' ' + DVBarras;

      LabelNumeroDigitavel2.Caption := LabelNumeroDigitavel3.Caption;
      LabelNumeroDigitavel1.Caption := LabelNumeroDigitavel3.Caption;

      LocalPagamento1.Caption := DMContasReceber.QRBloquetoDESC_LOCAL_PGTO_BLOQ.Value;
      LocalPagamento2.Caption := LocalPagamento1.Caption;
      LocalPagamento3.Caption := LocalPagamento1.Caption;

      LabelValorNumeroDigitavel3.Caption :=
        QRLFator.Caption + Bib.StrZero(IntToStr(Trunc(DMContasReceber.QRBloquetoVAL_TITULO.Value)), 8) +
        Bib.StrZero(ValorFrac, 2);

      LabelValorNumeroDigitavel2.Caption := LabelValorNumeroDigitavel3.Caption;
      LabelValorNumeroDigitavel1.Caption := LabelValorNumeroDigitavel3.Caption;
    {Agência / Código Cedente}

      LabelAgenciaCedente3.Caption := Agencia + '-' +
        DMContasReceber.QRBloquetoDIGITO_VERIFICADOR_AGENCIA.AsString + ' / ' +
        DMContasReceber.QRBloquetoCODIGO_CEDENTE.AsString + '-' +
        DMContasReceber.QRBloquetoDIGITO_VERIFICADOR_CEDENTE.AsString;

      LabelAgenciaCedente2.Caption := LabelAgenciaCedente3.Caption;
      LabelAgenciaCedente1.Caption := LabelAgenciaCedente3.Caption;

      if wBoleta7 then
      begin
        QRLDVNossoNumero1.Enabled := False;
        QRLDVNossoNumero2.Enabled := False;
        QRLDVNossoNumero3.Enabled := False;
      end
      else
      begin
        QRLDVNossoNumero1.Caption := Modulo11BB_NossoNumero(Copy(CampoLivre, 1, 11));
        QRLDVNossoNumero2.Caption := QRLDVNossoNumero1.Caption;
        QRLDVNossoNumero3.Caption := QRLDVNossoNumero1.Caption;
      end;

      QRMemo1.Lines.Clear;

      if (DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value <> 0) then
      begin
        QRMemo1.Lines.Add(DMContasReceber.QRBloquetoinstrucao_juro.Text);

{      If(Trim(DMContasReceber.QRBloquetoIND_TIPO_JURO.Text) = 'VALOR')Then             //SERGIO ADICIONADO 20/02/2003
      Begin

      End
      Else
      Begin
        QRMemo1.Lines.Add('Juro diário de R$ ' + FormatFloat('###,##0.00',
        ( DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.value / DMoracle.DiasNoMes(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value) * DMContasReceber.QRBloquetoVAL_TITULO.Value / 100) )
        + ' por atraso de Pgto.');
      End}
      end;
      QRMemo1.Lines.Add(Trim(DMContasReceber.QRBloquetoDESC_INSTRUCAO_BLOQUETO.Value));

    //pedido pelo luister (nos parametros do relatorios é informado o codigo da mensagem que deve sair no campo de instrucoes)
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
  end
  else
  begin // COPIA DO BLOQUETO MARCOS
    Banco := Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCOD_BANCO.Value), 3);
    Agencia := Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCOD_AGENCIA.Value), 4);
    CodigoCarteira := DMContasReceber.QRBloquetoCARTEIRA.AsString;
    CampoLivre := Bib.StrZero(DMContasReceber.QRBloquetoNUM_CONVENIO.AsString, 6) +
      copy(Bib.StrZero(DMContasReceber.QRBloquetoNOSSO_NUMERO.Text, 5), 7, 5) +
      Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCOD_AGENCIA.Value), 4) +
      Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCODIGO_CEDENTE.Value), 8) +
      Bib.StrZero(FloatToStr(DMContasReceber.QRBloquetoCARTEIRA.Value), 2);
    {Codigo de Barras}
    ValorInt := Bib.StrZero(IntToStr(Trunc(DMContasReceber.QRBloquetoVAL_TITULO.Value)), 12);
    ValorFrac := Bib.Right(FloatToStrF(DMContasReceber.QRBloquetoVAL_TITULO.Value, ffFixed, 10, 2), 2);
    QRLFator.Caption := FloatToStr(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value - StrToDate('07/10/1997'));
    DVBarras := Modulo11BB_CBarra(Banco +
      '9' +
      QRLFator.Caption +
      Bib.StrZero(IntToStr(Trunc(DMContasReceber.QRBloquetoVAL_TITULO.Value)), 8) +
      ValorFrac +
      Copy(CampoLivre, 1, 11) +
      Agencia +
      Bib.StrZero(DMContasReceber.QRBloquetoCODIGO_CEDENTE.AsString, 8) +
      DMContasReceber.QRBloquetoCARTEIRA.AsString);
    Barcode := TBarcode.Create(Self);
    try
      Barcode.BarcodeType := btInterleaved2of5;
      // Calculo usando fator de vencimento.

      Barcode.Digits := Banco + '9' + DVBarras + QRLFator.Caption + Copy(ValorInt, 5, 8) + ValorFrac + Copy(CampoLivre, 1, 11) +
        Agencia + Bib.StrZero(DMContasReceber.QRBloquetoCODIGO_CEDENTE.Text, 8) +
        DMContasReceber.QRBloquetoCARTEIRA.AsString;
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
    DVCampo1 := Modulo10(Banco + '9' + Copy(CampoLivre, 1, 5));
    Campo1 := Banco + '9' + Copy(CampoLivre, 1, 5) + DVCampo1;

    DVCampo2 := Modulo10(Copy(CampoLivre, 6, 10));
    Campo2 := Copy(CampoLivre, 6, 10) + DVCampo2;

    DVCampo3 := Modulo10(Copy(CampoLivre, 16, 10));
    Campo3 := Copy(CampoLivre, 16, 10) + DVCampo3;

    LabelNumeroDigitavel3.Caption :=
      Copy(Campo1, 1, 5) + '.' + Copy(Campo1, 6, 5) + ' ' + Copy(Campo2, 1, 5) + '.' + Copy(Campo2, 6, 6) + ' ' +
      Copy(Campo3, 1, 5) + '.' + Copy(Campo3, 6, 6) + ' ' + DVBarras;

    LabelNumeroDigitavel2.Caption := LabelNumeroDigitavel3.Caption;
    LabelNumeroDigitavel1.Caption := LabelNumeroDigitavel3.Caption;

    LocalPagamento1.Caption := DMContasReceber.QRBloquetoDESC_LOCAL_PGTO_BLOQ.Value;
    LocalPagamento2.Caption := LocalPagamento1.Caption;
    LocalPagamento3.Caption := LocalPagamento1.Caption;

    LabelValorNumeroDigitavel3.Caption :=
      QRLFator.Caption + Bib.StrZero(IntToStr(Trunc(DMContasReceber.QRBloquetoVAL_TITULO.Value)), 8) +
      Bib.StrZero(ValorFrac, 2);

    LabelValorNumeroDigitavel2.Caption := LabelValorNumeroDigitavel3.Caption;
    LabelValorNumeroDigitavel1.Caption := LabelValorNumeroDigitavel3.Caption;
    {Agência / Código Cedente}

    LabelAgenciaCedente3.Caption := Agencia + '-' +
      DMContasReceber.QRBloquetoDIGITO_VERIFICADOR_AGENCIA.AsString + ' / ' +
      DMContasReceber.QRBloquetoCODIGO_CEDENTE.AsString + '-' +
      DMContasReceber.QRBloquetoDIGITO_VERIFICADOR_CEDENTE.AsString;

    LabelAgenciaCedente2.Caption := LabelAgenciaCedente3.Caption;
    LabelAgenciaCedente1.Caption := LabelAgenciaCedente3.Caption;

    QRLDVNossoNumero1.Caption := Modulo11BB_NossoNumero(Copy(CampoLivre, 1, 11));
    QRLDVNossoNumero2.Caption := QRLDVNossoNumero1.Caption;
    QRLDVNossoNumero3.Caption := QRLDVNossoNumero1.Caption;

    QRMemo1.Lines.Clear;

    if (DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.Value <> 0) then
    begin
      QRMemo1.Lines.Add(DMContasReceber.QRBloquetoinstrucao_juro.Text);

{      If(Trim(DMContasReceber.QRBloquetoIND_TIPO_JURO.Text) = 'VALOR')Then             //SERGIO ADICIONADO 20/02/2003
      Begin

      End
      Else
      Begin
        QRMemo1.Lines.Add('Juro diário de R$ ' + FormatFloat('###,##0.00',
        ( DMContasReceber.QRBloquetoPERC_JURO_BLOQUETO.value / DMoracle.DiasNoMes(DMContasReceber.QRBloquetoDT_VENCIMENTO.Value) * DMContasReceber.QRBloquetoVAL_TITULO.Value / 100) )
        + ' por atraso de Pgto.');
      End}
    end;
    QRMemo1.Lines.Add(Trim(DMContasReceber.QRBloquetoDESC_INSTRUCAO_BLOQUETO.Value));
    QRMemo2.Lines := QRMemo1.Lines;
    QRMemo3.Lines := QRMemo1.Lines;
    QRlabel24.caption := copy(DMContasReceber.QRBloquetoNOSSO_NUMERO.Text, 1, 2) + '.' +
      copy(DMContasReceber.QRBloquetoNOSSO_NUMERO.Text, 3, 3) + '.' +
      copy(DMContasReceber.QRBloquetoNOSSO_NUMERO.Text, 6, 3) + '.' +
      copy(DMContasReceber.QRBloquetoNOSSO_NUMERO.Text, 9, 3) + '-';
    QRLabel28.Caption := QRlabel24.caption;
    QRLabel29.Caption := QRlabel24.caption;
    QRDBText36.Enabled := False;
    QRDBText35.Enabled := False;
    NossoNumero3.Enabled := False;
  end;
end;

procedure TFRBoletaBB.NossoNumero3Print(sender: TObject; var Value: string);
begin
  inherited;
  if wBoleta7 then
    Value := Trim(DMContasReceber.QRBloquetoNUM_CONVENIO.Text) +
      Bib.StrZero(DMContasReceber.QRBloquetonosso_numero_seq.AsString, 10)
  else
  begin
    Value := Trim(DMContasReceber.QRBloquetoNUM_CONVENIO.Text) +
      Bib.StrZero(DMContasReceber.QRBloquetonosso_numero_seq.AsString, 5);
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'TEMPERMED' then
      Value := Copy(Value, 1, 2) + '.' + Copy(Value, 3, 3) + '.' + Copy(Value, 6, 3) + '.' + Copy(Value, 9, 3);
    Value := Value + '-';
  end;
end;

procedure TFRBoletaBB.QRDBText35Print(sender: TObject; var Value: string);
begin
  inherited;
  if wBoleta7 then
    Value := Trim(DMContasReceber.QRBloquetoNUM_CONVENIO.Text) +
      Bib.StrZero(DMContasReceber.QRBloquetonosso_numero_seq.AsString, 10)
  else
  begin
    Value := Trim(DMContasReceber.QRBloquetoNUM_CONVENIO.Text) +
      Bib.StrZero(DMContasReceber.QRBloquetonosso_numero_seq.AsString, 5);
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'TEMPERMED' then
      Value := Copy(Value, 1, 2) + '.' + Copy(Value, 3, 3) + '.' + Copy(Value, 6, 3) + '.' + Copy(Value, 9, 3);
    Value := Value + '-';
  end;
end;

procedure TFRBoletaBB.QRDBText36Print(sender: TObject; var Value: string);
begin
  inherited;
  if wBoleta7 then
    Value := Trim(DMContasReceber.QRBloquetoNUM_CONVENIO.Text) +
      Bib.StrZero(DMContasReceber.QRBloquetonosso_numero_seq.AsString, 10)
  else
  begin
    Value := Trim(DMContasReceber.QRBloquetoNUM_CONVENIO.Text) +
      Bib.StrZero(DMContasReceber.QRBloquetonosso_numero_seq.AsString, 5);
    Value := Copy(Value, 1, 11) + '-';
  end;
  //comentado Marcos 07/10/08 conf.Analise Inside q diz q nao pode ter pontos no nossonumero
  //Value:= Copy(Value,1,2)+'.'+Copy(Value,3,3)+'.'+Copy(Value,6,3)+'.'+Copy(Value,9,3)+'-';
end;

procedure TFRBoletaBB.QRDBText31Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := '-' + Bib.StrZero(Value, 3);
end;

procedure TFRBoletaBB.QRDBText32Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := '-' + Bib.StrZero(Value, 3);
end;

procedure TFRBoletaBB.QRDBText33Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := '-' + Bib.StrZero(Value, 3);
end;

procedure TFRBoletaBB.QRDBText28Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := 'DM';
end;

procedure TFRBoletaBB.QRDBText38Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := 'DM';
end;

procedure TFRBoletaBB.Especie3Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := 'DM';
end;

procedure TFRBoletaBB.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  with DMContasReceber do
  begin
    if QRBloquetoNOSSO_NUMERO.Text = '' then
    begin
      try
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
          QRBloquetoPeriodo.SetVariable('DT_FINAL', Trim(FContasReceberParam.ME36DtFinal.Text));
          QRBloquetoPeriodo.Open;
          QRBloquetoPeriodo.First;
          while not QRBloquetoPeriodo.Eof do
          begin
            QAtuBloq.Close;
            if wBoleta7 then
              QAtuBloq.SetVariable('NUMERO', Trim(QRBloquetoNUM_CONVENIO.Text) +
                Bib.StrZero(QRBloquetonosso_numero_seq.AsString, 10))
            else
              QAtuBloq.SetVariable('NUMERO', Trim(QRBloquetoNUM_CONVENIO.Text) +
                Bib.StrZero(QRBloquetonosso_numero_seq.AsString, 5) +
                QRLDVNossoNumero3.Caption);
            QAtuBloq.SetVariable('COD_CONTA_RECEBER_CAB', QRBloquetoPeriodoCOD_CONTA_RECEBER_CAB.Value);
            QAtuBloq.ExecSQL;
            QRBloquetoPeriodo.Next;
          end;
        end
        else
        begin
          QAtuBloq.Close;
          if wBoleta7 then
            QAtuBloq.SetVariable('NUMERO', Trim(QRBloquetoNUM_CONVENIO.Text) +
              Bib.StrZero(QRBloquetonosso_numero_seq.AsString, 10))
          else
            QAtuBloq.SetVariable('NUMERO', Trim(QRBloquetoNUM_CONVENIO.Text) +
              Bib.StrZero(QRBloquetonosso_numero_seq.AsString, 5) +
              QRLDVNossoNumero3.Caption);
          QAtuBloq.SetVariable('COD_CONTA_RECEBER_CAB', QRBloquetoCOD_CONTA_RECEBER_CAB.Value);
          QAtuBloq.ExecSQL;
        end;

//      QEnviadoBanco.Close;
//      QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',QRBloquetoCOD_CONTA_RECEBER_CAB.Value);
//      QEnviadoBanco.ExecSQL;

        DMOracle.DBCemapa.Commit;
      except
        DMOracle.DBCemapa.Rollback;
        raise exception.Create('Erro ao tentar gravar Nosso Numero no Contas a Receber!');
      end;
    end;
  end;
end;

procedure TFRBoletaBB.FormCreate(Sender: TObject);
begin
  inherited;
  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE') or
    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE') or
    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'LANGE')) then
  begin
    QRDBText46.Enabled := False;
    QRDBText47.Enabled := False;
    QRDBText48.Enabled := False;
  end;
end;

end.

