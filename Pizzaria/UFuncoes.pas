unit UFuncoes;

interface

uses IBQuery, Dialogs, Windows, Forms, StdCtrls, Grids, Buttons, Messages, DB;

var
  RetornoConsulta: Integer;
  VendedorLogado: Integer;
  function BuscaString(Campo, Tabela: String; CampoChave: String = ''; Valorchave: Integer = 0): String;
  function BuscaInteger(Campo, Tabela: String; CampoChave: String = ''; Valorchave: Integer = 0): Integer;
  function DataValida(data: String): Boolean;
  function LocalizaRecNo(DataSet: TDataSet; RecNo: Integer; CampoRetorno: String): Variant;
  procedure ImprimeTicket(NumVenda: Integer; Tipo: String = 'NORMAL');
  Function TiraAcentos(wString: String):String;

implementation

uses UDmSistema, SysUtils, UBiblioteca, UDmVenda_Nova, UDmParamSistema;

function BuscaString(Campo, Tabela: String; CampoChave: String = ''; Valorchave: Integer = 0): String;
var q: TIBQuery;
retornar, Condicao: String;
begin
  if ((CampoChave = '') or (Valorchave = 0)) then
    Condicao := 'WHERE (1 = 0)'
  else
    Condicao := 'WHERE ' + CampoChave + ' = ' + IntToStr(Valorchave);

  try
    q := TIBQuery.Create(DmSistema);
    q.Database := DmSistema.DbSistema;
    q.SQL.Clear;
    q.SQL.Add('SELECT ' + Campo + ' FROM ' + Tabela + ' ' + Condicao);
    q.Close;
    q.Open;

    if q.IsEmpty then
      retornar := ''
    else
      retornar := q.Fields[0].Value;
    q.Free;
  except
//    ShowMessage(q.SQL.Text);
    retornar := '';
  end;

  Result := retornar;
end;

function BuscaInteger(Campo, Tabela: String; CampoChave: String = ''; Valorchave: Integer = 0): Integer;
var q: TIBQuery;
 Condicao: String;
 retornar: Integer;
begin
  if ((CampoChave = '') or (Valorchave = 0)) then
    Condicao := 'WHERE (1 = 0)'
  else
    Condicao := 'WHERE ' + CampoChave + ' = ' + IntToStr(Valorchave);

  try
    q := TIBQuery.Create(DmSistema);
    q.Database := DmSistema.DbSistema;
    q.SQL.Clear;
    q.SQL.Add('SELECT ' + Campo + ' FROM ' + Tabela + ' ' + Condicao);
    q.Close;
    q.Open;

    if q.IsEmpty then
      retornar := 0
    else
      retornar := q.Fields[0].Value;
    q.Free;
  except
//    ShowMessage(q.SQL.Text);
    retornar := 0;
  end;

  Result := retornar;
end;

function DataValida(data: String): Boolean;
begin
  try
    StrToDate(data);
  except
    Result := False;
    Exit;
  end;

  Result := True;
End;

function LocalizaRecNo(DataSet: TDataSet; RecNo: Integer; CampoRetorno: String): Variant;
Begin
  DataSet.First;
  while not DataSet.Eof do
  Begin
    if DataSet.RecNo = RecNo then
    Begin
      Result := DataSet.FieldValues[CampoRetorno];
      Exit;
    End;
    DataSet.Next;
  End;
  Result := '';
End;

procedure ImprimeTicket(NumVenda: Integer; Tipo: String = 'NORMAL');
var wNumLinhas, wLinha, wVendaItemAnt, wProdutoAnt, wIndiceAnt: Integer;
    wTotal: Real;
    wDescCompleta, wObservacao: String;
Begin
  if UpperCase(Tipo) = 'NORMAL' then
  Begin
    wLinha := 0;
    wTotal := 0;

    if Imp = Nil Then
      Imp := TImp.Create;

    try
      Imp.AbreImpressora;
    except
      Raise Exception.Create('Não foi possível encontrar a impressora.');
    end;

    Imp.ConfiguraImpressora('CONDENSADO_ON', 'OITAVOS', 40);

    DmVenda_Nova.QTicketCab.Close;
    DmVenda_Nova.QTicketCab.ParamByName('COD_VENDA').AsInteger := NumVenda;
    DmVenda_Nova.QTicketCab.Open;

    DmVenda_Nova.QTicketItem.Close;
    DmVenda_Nova.QTicketItem.ParamByName('COD_VENDA').AsInteger := NumVenda;
    DmVenda_Nova.QTicketItem.Open;
    DmVenda_Nova.QTicketItem.First;

    Imp.WriteXY(0, wLinha, TiraAcentos(Copy(DmParamSistema.QParamSistemaDESC_FANTASIA.Value, 1, 40)));
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, TiraAcentos(Copy(DmParamSistema.QParamSistemaDESC_ENDERECO.Value, 1, 40)));
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, TiraAcentos(Copy(DmParamSistema.QParamSistemaDESC_CIDADE.Value + ' - ' + DmParamSistema.QParamSistemaDESC_UF.Value, 1, 40)));
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, DmParamSistema.QParamSistemaDESC_TELEFONE.Value);
    Imp.WriteXY(4.3, wLinha, FormatDateTime('dd/MM/yyyy', DmVenda_Nova.QTicketCabDT_VENDA.Value));
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, '----------------------------------------');
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, TiraAcentos(Copy(DmVenda_Nova.QTicketCabDESC_NOME_CLIENTE.Value, 1, 40)));
    if Trim(DmVenda_Nova.QTicketCabDESC_ENDERECO.Value) <> '' then
    Begin
      Inc(wLinha);
      Imp.WriteXY(0, wLinha, TiraAcentos(Copy(DmVenda_Nova.QTicketCabDESC_ENDERECO.Value, 1, 40)));
    End;
    if Trim(DmVenda_Nova.QTicketCabDESC_LOCALIZACAO.Value) <> '' then
    Begin
      Inc(wLinha);
      Imp.WriteXY(0, wLinha, TiraAcentos(Copy(DmVenda_Nova.QTicketCabDESC_LOCALIZACAO.Value, 1, 40)));
    End;
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, DmVenda_Nova.QTicketCabDESC_TELEFONE.Value);
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, '----------------------------------------');
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, 'Produto                           Total ');
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, '----------------------------------------');

    while not DmVenda_Nova.QTicketItem.Eof do
    Begin
      wTotal := wTotal + (DmVenda_Nova.QTicketItemVAL_PRECO.Value * DmVenda_Nova.QTicketItemQT_QUANTIDADE.Value);

      wDescCompleta := TiraAcentos(DmVenda_Nova.QTicketItemDESC_PRODUTO.Value);

      Inc(wLinha);
      Imp.WriteXY(0, wLinha, Bib.NumToTexto(DmVenda_Nova.QTicketItemQT_QUANTIDADE.Value, 0, 2));
      Imp.WriteXY(0.4, wLinha, Copy(wDescCompleta, 1, 30));
      Imp.WriteXY(4.8, wLinha, Bib.NumToTexto(DmVenda_Nova.QTicketItemVAL_PRECO.Value * DmVenda_Nova.QTicketItemQT_QUANTIDADE.Value, 2, 6));
      if Copy(wDescCompleta, 31, 30) <> '' then
      Begin
        Inc(wLinha);
        Imp.WriteXY(0.4, wLinha, Copy(wDescCompleta, 31, 30));
      End;
      if Copy(wDescCompleta, 61, 30) <> '' then
      Begin
        Inc(wLinha);
        Imp.WriteXY(0.4, wLinha, Copy(wDescCompleta, 61, 30));
      End;

      DmVenda_Nova.QTicketItem.Next;
    End;

    wObservacao := TiraAcentos(DmVenda_Nova.QTicketCabDESC_OBSERVACAO.Value);

    Inc(wLinha);
    Imp.WriteXY(0, wLinha, '----------------------------------------');
    Inc(wLinha);
    Imp.WriteXY(2.5, wLinha, 'Produtos: ');
    Imp.WriteXY(4.8, wLinha, Bib.NumToTexto(wTotal, 2, 6));
    Inc(wLinha);
    Imp.WriteXY(2.5, wLinha, 'Total com Taxa: ');
    Imp.WriteXY(4.8, wLinha, Bib.NumToTexto(wTotal + DmVenda_Nova.QTicketCabVAL_TAXA_TOTAL.Value, 2, 6));
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, '----------------------------------------');
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, Copy(wObservacao, 1, 40));
    if Copy(wObservacao, 41, 40) <> '' then
    Begin
      Inc(wLinha);
      Imp.WriteXY(0, wLinha, Copy(wObservacao, 41, 40));
    End;
    if Copy(wObservacao, 81, 40) <> '' then
    Begin
      Inc(wLinha);
      Imp.WriteXY(0, wLinha, Copy(wObservacao, 81, 40));
    End;

//    Imp.SaltaPagina;
    Inc(wLinha, 8);
    Imp.WriteXY(0, wLinha, '');

    Imp.FechaImpressora;
  End;

  if UpperCase(Tipo) = 'COZINHA' then
  Begin
    wLinha := 0;

    if Imp = Nil Then
      Imp := TImp.Create;

    if Imp = Nil Then
      Imp := TImp.Create;

    try
      Imp.AbreImpressora;
    except
      Raise Exception.Create('Não foi possível encontrar a impressora.');
    end;

    Imp.ConfiguraImpressora('CONDENSADO_OFF', 'OITAVOS', 40);

    DmVenda_Nova.QTicketCab.Close;
    DmVenda_Nova.QTicketCab.ParamByName('COD_VENDA').AsInteger := NumVenda;
    DmVenda_Nova.QTicketCab.Open;

    DmVenda_Nova.QTicketCozinha.Close;
    DmVenda_Nova.QTicketCozinha.ParamByName('COD_VENDA').AsInteger := NumVenda;
    DmVenda_Nova.QTicketCozinha.Open;

    Imp.WriteXY(0, wLinha, TiraAcentos(Copy(DmVenda_Nova.QTicketCabDESC_NOME_CLIENTE.Value, 1, 23)));
    if Trim(DmVenda_Nova.QTicketCabDESC_ENDERECO.Value) <> '' then
    Begin
      Inc(wLinha);
      Imp.WriteXY(0, wLinha, TiraAcentos(Copy(DmVenda_Nova.QTicketCabDESC_ENDERECO.Value, 1, 23)));
    End;
    if Trim(DmVenda_Nova.QTicketCabDESC_LOCALIZACAO.Value) <> '' then
    Begin
      Inc(wLinha);
      Imp.WriteXY(0, wLinha, TiraAcentos(Copy(DmVenda_Nova.QTicketCabDESC_LOCALIZACAO.Value, 1, 23)));
    End;
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, DmVenda_Nova.QTicketCabDESC_TELEFONE.Value);
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, '-----------------------');
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, '         PIZZAS        ');

    wProdutoAnt := 0;
    wVendaItemAnt := 0;
  
    while not DmVenda_Nova.QTicketCozinha.Eof do
    Begin
      if ((wProdutoAnt <> DmVenda_Nova.QTicketCozinhaCOD_PRODUTO.Value) or (wVendaItemAnt <> DmVenda_Nova.QTicketCozinhaCOD_VENDA_ITEM.Value) or (wIndiceAnt <> DmVenda_Nova.QTicketCozinhaINDICE.Value)) then
      Begin
        wProdutoAnt := DmVenda_Nova.QTicketCozinhaCOD_PRODUTO.Value;
        wVendaItemAnt := DmVenda_Nova.QTicketCozinhaCOD_VENDA_ITEM.Value;
        wIndiceAnt := DmVenda_Nova.QTicketCozinhaINDICE.Value;

        wDescCompleta := TiraAcentos(DmVenda_Nova.QTicketCozinhaDESC_PRODUTO.Value);

        Inc(wLinha);
        Imp.WriteXY(0, wLinha, '-----------------------');
        Inc(wLinha);

        Imp.WriteXY(0, wLinha, Copy(wDescCompleta, 1, 23));
        if Copy(wDescCompleta, 24, 23) <> '' then
        Begin
          Inc(wLinha);
          Imp.WriteXY(0, wLinha, Copy(wDescCompleta, 24, 23));
        End;
        if Copy(wDescCompleta, 47, 23) <> '' then
        Begin
          Inc(wLinha);
          Imp.WriteXY(0, wLinha, Copy(wDescCompleta, 47, 23));
        End;
      End;

      wDescCompleta := TiraAcentos(DmVenda_Nova.QTicketCozinhaDESC_SABOR.Value);

      Inc(wLinha);
      Imp.WriteXY(0.4, wLinha, Copy(wDescCompleta, 1, 23));
      if Copy(wDescCompleta, 24, 23) <> '' then
      Begin
        Inc(wLinha);
        Imp.WriteXY(0.4, wLinha, Copy(wDescCompleta, 24, 23));
      End;
      if Copy(wDescCompleta, 47, 23) <> '' then
      Begin
        Inc(wLinha);
        Imp.WriteXY(0.4, wLinha, Copy(wDescCompleta, 47, 23));
      End;

      DmVenda_Nova.QTicketCozinha.Next;
    End;

    wObservacao := TiraAcentos(DmVenda_Nova.QTicketCabDESC_OBSERVACAO.Value);

    Inc(wLinha);
    Imp.WriteXY(0, wLinha, '-----------------------');
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, Copy(wObservacao, 1, 23));
    if Copy(wObservacao, 24, 23) <> '' then
    Begin
      Inc(wLinha);
      Imp.WriteXY(0, wLinha, Copy(wObservacao, 24, 23));
    End;
    if Copy(wObservacao, 47, 23) <> '' then
    Begin
      Inc(wLinha);
      Imp.WriteXY(0, wLinha, Copy(wObservacao, 47, 23));
    End;

    Inc(wLinha, 8);
    Imp.WriteXY(0, wLinha, '');
//    Imp.SaltaPagina;

    Imp.FechaImpressora;
  End;
End;

Function TiraAcentos(wString: String):String;
Var i: Integer;
    wStringNova, wCharNovo: String;
Begin
  wStringNova := '';
  For i := 1 to Length(wString) do
  Begin
    wCharNovo := wString[i];

    if wString[i] in ['à', 'á', 'ã', 'â'] then
      wCharNovo := 'a';
    if wString[i] in ['é', 'è', 'ê'] then
      wCharNovo := 'e';
    if wString[i] in ['í', 'ì'] then
      wCharNovo := 'i';
    if wString[i] in ['ó', 'õ', 'ô', 'ò', 'ö'] then
      wCharNovo := 'o';
    if wString[i] in ['ú', 'ù', 'ü'] then
      wCharNovo := 'u';
    if wString[i] in ['ç'] then
      wCharNovo := 'c';

    if wString[i] in ['À', 'Á', 'Ã', 'Â'] then
      wCharNovo := 'A';
    if wString[i] in ['É', 'È', 'Ê'] then
      wCharNovo := 'E';
    if wString[i] in ['Í', 'Ì'] then
      wCharNovo := 'I';
    if wString[i] in ['Ó', 'Õ', 'Ô', 'Ò', 'Ö'] then
      wCharNovo := 'O';
    if wString[i] in ['Ú', 'Ù', 'Ü'] then
      wCharNovo := 'U';
    if wString[i] in ['Ç'] then
      wCharNovo := 'C';

    wStringNova := wStringNova + wCharNovo;
  End;

  Result := wStringNova;
End;

end.
