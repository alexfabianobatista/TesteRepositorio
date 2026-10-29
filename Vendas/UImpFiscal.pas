unit UImpFiscal;

interface

Uses SysUtils, Dialogs;

Type
  TFImpFiscal = Class
  Private
    fStatus : String;
    pArqImpressora : TextFile;
    Property pStatusImp : String Read FStatus Write FStatus;
    Procedure AbreCupom;
    Procedure FechaCupom(wTotal:Real);
    Procedure GravaItemCupom(wCodProduto,wQuantidade,wPrecoUnitario: Real;wDescProduto:String);
  Public
    Function AbreImpressora(wTipo:String):Boolean;
    Procedure FechaImpressora;
    Procedure Imprime(wComando:String);
    Function LeituraX : Boolean;
    Function CancelaCupom : Boolean;
    Function EmiteCupom(wCodNota:Integer) : Boolean;
    Function LeResposta : String;
End;

Var ImpFiscal : TFImpFiscal;

implementation

Uses Printers, UNotaSaida_cl,UBiblioteca, UOracle_cl ;

{ TFImpFiscal }

procedure TFImpFiscal.AbreCupom;
begin
  If pStatusImp <> 'ABERTA_GRAVACAO' Then
    AbreImpressora('GRAVACAO');
  Write(pArqImpressora,#27+'.17}');
  LeResposta;
end;

Function TFImpFiscal.AbreImpressora(wTipo:String):Boolean;
Var wAux : String;
    wQtde : Integer;
    wAchou : Boolean;
begin
  // Abre Impressora
  wAchou := False;
  For wQtde := 0 to Printer.Printers.Count-1 do
  Begin
    wAux := UpperCase( Copy(Printer.Printers.Strings[wQtde],1,9) );
    If wAux = 'IMPFISCAL' Then
    Begin
      // Printer.PrinterIndex := wQtde;
      wAchou := True;
    End;
  End;
  If wAchou = True Then
  Begin
    //Printer.BeginDoc;
    //Printer.EndDoc;
    AssignFile(pArqImpressora ,'EASYAPF');
    FileMode := 2; // 0 - Read Only; 1-Write Only; 2-Read and Write
    // $I-
    Reset(pArqImpressora ); // Abre Arquivo
    If IOResult <> 0 Then
      Abort
    Else
      If wTipo = 'GRAVACAO' Then
        Rewrite(pArqImpressora ); //Cria e Abre um novo arquivo
    {$I+}
    If wTipo = 'GRAVACAO' Then
      pStatusImp := 'ABERTA_GRAVACAO'
    Else
      pStatusImp := 'ABERTA_LEITURA';
  End
  Else
  Begin
    pStatusImp := 'FECHADA';
    MessageDlg('Impressora Fiscal não localizada!'
          +#13+'Instale uma impressora com o nome "ImpFiscal"',mtWarning,[mbOk],0);
  End;
  Result := wAchou;
end;

function TFImpFiscal.CancelaCupom: Boolean;
begin
  If pStatusImp <> 'ABERTA_GRAVACAO' Then
    AbreImpressora('GRAVACAO');
  Write(pArqImpressora,#27+'.05}');
  LeResposta;
  Result := True;
end;

function TFImpFiscal.EmiteCupom(wCodNota: Integer): Boolean;
var wTotal : Real;
    wEmite_Cupom : String;
Const wBranco : String = '                                             ';
begin
  with DMNotaSaida do
  begin
    if QNotaSaidaCod_Nota_Cab.Value <> wCodNota Then
    begin
      QNotaSaida.Close;
      QNotaSaida.SetVariable('PK',wCodNota);
      QNotaSaida.Open;
    end;
    wEmite_Cupom := DMOracle.BuscaNome('SELECT IND_CUPOM_FISCAL FROM TB_OPERACAO',
                          'COD_OPERACAO = '+QNotaSaidaCOD_OPERACAO.Text);
    If (wEmite_Cupom = 'S') and (QNotaSaidaCOD_SERIE_MODELO.Value <> '65')Then
    Begin
      ImpFiscal.AbreCupom;
      wTotal := 0;
      QItemNF.First;
      While not QItemNF.Eof do
      Begin
        GravaItemCupom( QItemNFCod_Produto.Value,
                        QItemNFQt_Quantidade.Value,
                        QItemNFVal_Unitario.Value,
                        QItemNFnome_produto.Value);
        wTotal := wTotal + QItemNFVal_Total.Value;
        QItemNF.Next;
      End;
      ImpFiscal.FechaCupom(wTotal);
    End;
  End;
  Result := True;
end;

procedure TFImpFiscal.FechaCupom(wTotal:Real);
Var wAux, wAux2 : String;
begin
  // A Vista = Dinheiro
  // A Prazo = Outros
  // OBS: Estas condições de pagamento devem ter sido cadastradas na Impressora
  If ImpFiscal.pStatusImp <> 'ABERTA_GRAVACAO' Then
    ImpFiscal.AbreImpressora('GRAVACAO');
  With DMNotaSaida do
  Begin
    If QNotaSaidaVal_Desconto.Value > 0 Then
    Begin
      wAux := #27+'.03          ';
      wAux2 := FormatFloat('0000000000.00',QNotaSaidaVal_Desconto.Value);
      wAux2 := Bib.LimpaString(wAux2,'.,');
      Write(pArqImpressora,wAux+wAux2+'}');
    End;
    If QNotaSaidaVal_Despesas.Value > 0 Then
    Begin
      wAux := #27+'.11  0000';
      wAux2 := FormatFloat('000000000.00',QNotaSaidaVal_Despesas.Value);
      wAux2 := Bib.LimpaString(wAux2,'.,');
      Write(pArqImpressora,wAux+wAux2+'}');
    End;
    wAux := DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value;
    wAux := FormatFloat('00',StrToFloat(wAux) );
    wAux2 := FormatFloat('0000000000.00',wTotal
                                         -QNotaSaidaVal_Desconto.Value
                                         +QNotaSaidaVal_Despesas.Value);
    wAux2 := Bib.LimpaString(wAux2,'.,');
    Write(pArqImpressora,#27+'.10'+wAux+wAux2+'}');
    Write(pArqImpressora,#27+'.12}');
    LeResposta;
  End;
  // Result := True;
end;

procedure TFImpFiscal.FechaImpressora;
begin
  // Fecha Impressora
  CloseFile(pArqImpressora);
  pStatusImp := 'FECHADA';
end;

procedure TFImpFiscal.GravaItemCupom(wCodProduto, wQuantidade,
  wPrecoUnitario: Real; wDescProduto: String);
Var wAux, wProduto : String;
begin
  If ImpFiscal.pStatusImp <> 'ABERTA_GRAVACAO' Then
    ImpFiscal.AbreImpressora('GRAVACAO');
  Write(pArqImpressora,#27+'.01');
  Write(pArqImpressora,FormatFloat('0000000000000',wCodProduto) );
  wAux := FormatFloat('0000.000',wQuantidade);
  wAux := Bib.LimpaString(wAux,'.,');
  Write(pArqImpressora,wAux );
  wAux := FormatFloat('0000000.00',wPrecoUnitario);
  wAux := Bib.LimpaString(wAux,'.,');
  Write(pArqImpressora,wAux );
  Write(pArqImpressora,'            ');
  wProduto := Copy(wDescProduto,1,24);
  If Length(wProduto) < 24 Then
    wProduto := wProduto + Copy(wBranco,1,24-Length(wProduto));
  Write(pArqImpressora,wProduto);
  wAux := DMOracle.BuscaNome('SELECT COD_TRIB_IMP_FISCAL FROM TB_TRIBUTACAO',
             'COD_TRIBUTACAO = '+DMNotaSaida.QItemNFCod_Tributacao.Text);
  If wAux[1] in ['I','F','N'] Then
    wAux := wAux[1]+'  }'
  Else
    wAux := Copy(wAux,1,3)+'}';
  Write(pArqImpressora,wAux); // Situacao Tributaria
  LeResposta;
end;

procedure TFImpFiscal.Imprime(wComando: String);
begin
  Write(pArqImpressora,wcomando);
end;

function TFImpFiscal.LeituraX: Boolean;
begin
  if pStatusImp <> 'ABERTA_GRAVACAO' Then
     AbreImpressora('GRAVACAO');
  Write(pArqImpressora,#27+'.13}');
  LeResposta;
  Result := True;
end;

Function TFImpFiscal.LeResposta:String;
var
  Ch: Char;
  wResposta : String;
  wCont : Integer;
begin
  If pStatusImp <> 'ABERTA_LEITURA' Then
    AbreImpressora('LEITURA');
  wCont := 0;
  wResposta := '';
  while (not Eof(pArqImpressora) )
        and
        (wCont < 30) do
  begin
    Read(pArqImpressora, Ch);
    wResposta := wResposta + ch;
    Inc(wCont);
    If wCont = 30 Then
      wResposta := '';

    If Ch = '}' Then
     wCont := 31;
  end;
  If Copy(wResposta,2,1) = '-' Then
    MessageDlg('Erro gravando na impressora. '+wResposta,mtWarning,[mbOk],0);
  Result := Trim(wResposta);
  ImpFiscal.FechaImpressora;
end;

end.
