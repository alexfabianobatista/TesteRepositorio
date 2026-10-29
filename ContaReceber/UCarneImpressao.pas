unit UCarneImpressao;

interface

type
  TCarneImp = class
    private
      procedure ConfiguraQuery(Filial, Cadastro, Titulo, Parcela: String);
    public
      procedure CarneRadio(Filial, Cadastro, Titulo, Parcela: String; Commit: Boolean = True;
        Acrescimo: Extended = 0; Desconto: Extended = 0);
      procedure CarneEncopel(Filial, Cadastro, Titulo, Parcela: String; Commit: Boolean = True);
    end;

var
  CarneImp: TCarneImp;

implementation

uses UContasReceber_cl, UBiblioteca, UOracle_cl, SysUtils;

{ TCarneImp }

procedure TCarneImp.CarneEncopel(Filial, Cadastro, Titulo, Parcela: String;
  Commit: Boolean = True);
var
  wCont: Integer;
  wTotal, wComando: string;
begin
  ConfiguraQuery(Filial, Cadastro, Titulo, Parcela);
  with DMContasReceber do
  begin
    if QEmissaoCarneCOD_CADASTRO.Text = '' then
      raise Exception.Create('Nenhum Cliente Selecionado!');
    if not (QEmissaoCarneCOD_NOTA_CAB.IsNull) then
      wTotal := DMOracle.BuscaNome('SELECT SUM(VAL_ORIGINAL) FROM TB_CONTA_RECEBER_CAB', 'COD_NOTA_CAB =' + QEmissaoCarneCod_Nota_Cab.Text);
    if Imp = nil then
      Imp := Timp.create;
    Imp.AbreImpressora;
    Imp.ConfiguraImpressora('CONDENSADO_OFF', 'OITAVOS', 24);
    QEmissaoCarne.First;
    while not QEmissaoCarne.EOF do
    begin
      if wTotal = '' then
        wTotal := QEmissaoCarneVAL_ORIGINAL.Text;
      wCont := 0;
      Imp.WriteXY(8, wCont, QEmissaoCarneCOD_CADASTRO.Text);
      Imp.WriteXY(18.8, wCont, QEmissaoCarneCOD_CADASTRO.Text);
      wCont := 4;
      Imp.WriteXY(0.8, wCont, QEmissaoCarneNOME.Value);
      Imp.WriteXY(11.2, wCont, QEmissaoCarneNOME.Value);
      wCont := 8;
      Imp.WriteXY(0.5, wCont, QEmissaoCarneDT_EMISSAO.Text);
      Imp.WriteXY(4, wCont, Bib.NumToTexto(StrToFloat(wTotal), 2, 10));
      Imp.WriteXY(8, wCont, Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value,
        2, 8));
      Imp.WriteXY(11.2, wCont, QEmissaoCarneDT_EMISSAO.Text);
      Imp.WriteXY(15, wCont, Bib.NumToTexto(StrToFloat(wTotal), 2, 10));
      Imp.WriteXY(18.1, wCont,
        Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value, 2, 7));
      wCont := 12;
      Imp.WriteXY(0.8, wCont, QEmissaoCarneNUM_PARCELA.Text);
      Imp.WriteXY(2.2, wCont, QEmissaoCarneDT_VENCIMENTO.Text);
      Imp.WriteXY(11.5, wCont, QEmissaoCarneNUM_PARCELA.Text);
      Imp.WriteXY(12.8, wCont, QEmissaoCarneDT_VENCIMENTO.Text);
      wCont := 18;
      Imp.WriteXY(0.8, wCont, 'Juro diario de R$ ' + FormatFloat('#,##0.00',
        (QEmissaoCarnePERC_TAXA.Value /
        DMoracle.DiasNoMes(QEmissaoCarneDT_VENCIMENTO.Value) *
        QEmissaoCarneVal_Original.Value / 100)) + ' por atraso de Pgto.');
      Imp.SaltaPagina;
      with DMOracle do
      begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET IND_EMITIDO_CARNE=' +
          Chr(39) + 'SIM' + Chr(39);
        wComando := wComando + ' WHERE COD_CONTA_RECEBER_CAB = ' +
          FloatToStr(QEmissaoCarneCOD_CONTA_RECEBER_CAB.Value);
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;
      end;
      QEmissaoCarne.Next;
    end;
    DMOracle.DBCemapa.Commit;
    Imp.ConfiguraImpressora('CONDENSADO_OFF', 'SEXTOS', 66);
    Imp.FechaImpressora;
    QEmissaoCarne.Close;
  end;
end;

procedure TCarneImp.CarneRadio(Filial, Cadastro, Titulo, Parcela: String; Commit: Boolean = True;
  Acrescimo: Extended = 0; Desconto: Extended = 0);
var
  wCont: Integer;
  wTotal, wComando: string;
begin
  ConfiguraQuery(Filial, Cadastro, Titulo, Parcela);
  with DMContasReceber do
  begin
    if QEmissaoCarneCOD_CADASTRO.Text = '' then
      raise Exception.Create('Nenhum Cliente Selecionado.');
    if Imp = nil then
      Imp := Timp.create;
    Imp.AbreImpressora;
    Imp.ConfiguraImpressora('CONDENSADO_ON', 'SEXTOS', 22);
    QEmissaoCarne.First;
    while not QEmissaoCarne.EOF do
    begin
      wCont := 3;
      Imp.WriteXY(0.5, wCont, QEmissaoCarneNOME.Value);
      Imp.WriteXY(8, wCont, QEmissaoCarneNOME.Value);
      Imp.WriteXY(15.2, wCont, QEmissaoCarneNOME.Value);

      wCont := 6;
      Imp.WriteXY(1, wCont, QEmissaoCarneCOD_CADASTRO.Text);
      Imp.WriteXY(4, wCont, QEmissaoCarneNUM_TITULO.Text);
      Imp.WriteXY(8.5, wCont, QEmissaoCarneCOD_CADASTRO.Text);
      Imp.WriteXY(11.5, wCont, QEmissaoCarneNUM_TITULO.Text);
      Imp.WriteXY(15.5, wCont, QEmissaoCarneCOD_CADASTRO.Text);
      Imp.WriteXY(18.5, wCont, QEmissaoCarneNUM_TITULO.Text);

      WCont := 8;
      Imp.WriteXY(0.5, wCont, QEmissaoCarneDT_VENCIMENTO.Text);
      Imp.WriteXY(2.7, wCont, QEmissaoCarneNUM_PARCELA.Text);
      Imp.WriteXY(3.8, wCont, Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value, 2, 10));
      Imp.WriteXY(7.9, wCont, QEmissaoCarneDT_VENCIMENTO.Text);
      Imp.WriteXY(10, wCont, QEmissaoCarneNUM_PARCELA.Text);
      Imp.WriteXY(11, wCont, Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value, 2, 10));
      Imp.WriteXY(15, wCont, QEmissaoCarneDT_VENCIMENTO.Text);
      Imp.WriteXY(17.1, wCont, QEmissaoCarneNUM_PARCELA.Text);
      Imp.WriteXY(18, wCont, Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value, 2, 10));

      Inc(wCont, 2);
      Imp.WriteXY(0.5, wCont, Bib.NumToTexto(Acrescimo, 2, 10));
      Imp.WriteXY(3.8, wCont, Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value + Acrescimo, 2, 10));
      Imp.WriteXY(11, wCont, Bib.NumToTexto(Acrescimo, 2, 10));
      Imp.WriteXY(18, wCont, Bib.NumToTexto(Acrescimo, 2, 10));

      Inc(wCont, 2);
      Imp.WriteXY(11, wCont, Bib.NumToTexto(Desconto, 2, 10));
      Imp.WriteXY(18, wCont, Bib.NumToTexto(Desconto, 2, 10));

      Inc(wCont, 3);
      Imp.WriteXY(11, wCont, Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value + Acrescimo - Desconto, 2, 10));
      Imp.WriteXY(18, wCont, Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value + Acrescimo - Desconto, 2, 10));

      Imp.SaltaPagina;
      with DMOracle do
      begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET IND_EMITIDO_CARNE=' +
          Chr(39) + 'SIM' + Chr(39);
        wComando := wComando + ' WHERE COD_CONTA_RECEBER_CAB = ' +
          FloatToStr(QEmissaoCarneCOD_CONTA_RECEBER_CAB.Value);
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;
      end;
      QEmissaoCarne.Next;
    end;
    if Commit then
      DMOracle.DBCemapa.Commit;
    Imp.ConfiguraImpressora('CONDENSADO_OFF', 'SEXTOS', 66);
    Imp.FechaImpressora;
    QEmissaoCarne.Close;
  end;
end;

procedure TCarneImp.ConfiguraQuery(Filial, Cadastro, Titulo,
  Parcela: String);
begin
  with DMContasReceber.QEmissaoCarne do
  begin
    Close;
    ClearVariables;
    if Filial <> '' then
      SetVariable('FILIAL', Filial);
    if Cadastro <> '' then
      SetVariable('CADASTRO', Cadastro);
    if Titulo <> '' then
      SetVariable('TITULO', Titulo);
    if Parcela <> '' then
      SetVariable('PARCELA', Parcela);
    Open;
  end;
end;

end.
