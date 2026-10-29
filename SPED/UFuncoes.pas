unit UFuncoes;

interface

uses IBQuery, Dialogs, Windows, Forms, StdCtrls, Grids, Buttons, Messages, DB, SysUtils,
  Registro, Arquivo, OraTeste, OracleData, DateUtils, Classes, Variants, Oracle;

var
  RetornoConsulta: Integer;
  VendedorLogado: Integer;
function DataValida(data: string): Boolean;
function TiraAcentos(wString: string): string;
function LimpaString(wString, wRetirar: string): string;
function LimpaEConverte(wString: string): Integer;
function Limpa(wString: string): string;
function TiraPipe(wString: string): string;
function SomenteNumeros(wString: string): string;
function SomenteNumerosEConverte(wString: string): Longint;
function RemoveNumEndereco(wEndereco, wNumero: string): string;
function NumEndereco(wEndereco: string): Integer;
procedure gravaLinha(var arquivo: TArquivo; var registro: TRegistro);
function executaQuery(var queryBase: TOracleDataSet1; abrir: Boolean = False): TOracleDataSet1;
function abreQuery(var query: TOracleDataSet1): Boolean;
procedure fechaQuery(var query: TOracleDataSet1);
function pegaValor(var query: TOracleDataSet1; campo: string): Variant;
function eNulo(var query: TOracleDataSet1; campo: string): Boolean;
function leContaAnterior(conta: Integer): Integer;
function geraStringFiliais(filiais: TStrings; separador: string = ', '): string;
function SomenteNumerosELetras(wString: string): string;
function pegaVersao(pDataFin: TDateTime; pTipo: String): Integer;
function CampoExiste(pQuery: TOracleDataSet1; pCampo: String): Boolean;

implementation

uses UBiblioteca, UOracle_cl, USped_cl;

function DataValida(data: string): Boolean;
begin
  try
    StrToDate(data);
  except
    Result := False;
    Exit;
  end;

  Result := True;
end;

function TiraAcentos(wString: string): string;
var i: Integer;
  wStringNova, wCharNovo: string;
begin
  wStringNova := '';
  for i := 1 to Length(wString) do
  begin
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
  end;

  Result := wStringNova;
end;

function LimpaString(wString, wRetirar: string): string;
var wCont, wCont2: Integer;
  wRetorno: string;
  wOk: Boolean;
begin
  wRetorno := '';
  for wCont := 1 to Length(wString) do
  begin
    wOk := True;
    for wCont2 := 1 to Length(wRetirar) do
    begin
      if wString[wCont] = wRetirar[wCont2] then
        wOk := False;
    end;
    if wOk = True then
      wRetorno := wRetorno + wString[wCont];
  end;
  Result := wRetorno;
end;

function LimpaEConverte(wString: string): Integer;
var wStringNova: string;
begin
  wStringNova := LimpaString(LimpaString(LimpaString(LimpaString(LimpaString(wString, '/'), '.'), '-'), '.'), '|');
  try
    Result := StrToInt(wString);
  except
    Result := 0;
  end;
end;

function SomenteNumeros(wString: string): string;
var i: Integer;
  wStringNova: string;
begin
  wStringNova := '';

  for i := 1 to Length(wString) do
    if wString[i] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ','] then
      wStringNova := wStringNova + wString[i];

  Result := wStringNova;
end;

function SomenteNumerosEConverte(wString: string): Longint;
var i: Integer;
  wStringNova: string;
begin
  wStringNova := '';

  for i := 1 to Length(wString) do
    if wString[i] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ','] then
      wStringNova := wStringNova + wString[i];

  if wStringNova = '' then
    wStringNova := '0';

  try
    Result := StrToInt64(wStringNova);
  except
    Result := 0;
  end;
end;

function Limpa(wString: string): string;
var i: Integer;
  wStringNova: string;
begin
  wStringNova := '';

  for i := 1 to Length(wString) do
    if not (wString[i] in ['/', '.', '-', '|']) then
      wStringNova := wStringNova + wString[i];

  Result := wStringNova;
end;

function TiraPipe(wString: string): string;
var wStringNova: string;
begin
  wStringNova := LimpaString(wString, '|');
  Result := wStringNova;
end;

function RemoveNumEndereco(wEndereco, wNumero: string): string;
var
  wEnderecoNovo: string;
  i, j: Integer;
  wAux: string;
begin
  wEnderecoNovo := '';
  if wEndereco = '' then
  begin
    Result := '';
    Exit;
  end;
  i := Bib.ProcuraStr(wNumero, wEndereco);
  if i < 0 then
    wEnderecoNovo := wEndereco
  else
  begin
    wEnderecoNovo := Copy(wEndereco, 1, i) + Copy(wEndereco, i + Length(wNumero) + 1, Length(wEndereco));
    if i = Length(wEnderecoNovo) then
    begin
      wEnderecoNovo := Trim(wEnderecoNovo);
      i := Length(wEnderecoNovo);
      try
        while ((wEnderecoNovo[i] = ',')
          or (wEnderecoNovo[i] = '-')
          or (wEnderecoNovo[i] = '.')) do
        begin
          wEnderecoNovo := Copy(wEnderecoNovo, 1, i - 1);
          wEnderecoNovo := Trim(wEnderecoNovo);
          i := Length(wEnderecoNovo);
        end;
      except
      end;
    end
    else
    begin
      wAux := Copy(wEnderecoNovo, 1, i);
      j := i;
      wAux := Trim(wAux);
      j := Length(wAux);
//      try
      while ((wAux[j] = ',') or (wAux[j] = '-')) do
      begin
        wAux := Copy(wAux, 1, j - 1);
        wAux := Trim(wAux);
        j := Length(wAux);
      end;
//      except
//        ShowMessage('wEndereco: ' + wEndereco + #13+#10 +
//                    'wNumero: ' + wNumero + #13+#10 +
//                    'wEnderecoNovo: ' + wEnderecoNovo + #13+#10 +
//                    'wAux: ' + wAux + #13+#10 +
//                    'j: ' + IntToStr(j) + #13+#10 +
//                    'i: ' + IntToStr(i) + #13+#10);
//      end;
      if (wEnderecoNovo[i + 1] = ' ')
        or (wEnderecoNovo[i + 1] = ',')
        or (wEnderecoNovo[i + 1] = '.') then
      begin
        if (wEnderecoNovo[i + 2] = ',') or (wEnderecoNovo[i + 2] = '.') then
          wEnderecoNovo := wAux + Copy(wEnderecoNovo, i + 2, Length(wEnderecoNovo))
        else
          wEnderecoNovo := wAux + Copy(wEnderecoNovo, i + 1, Length(wEnderecoNovo));
      end
      else
        wEnderecoNovo := wAux + ' ' + Copy(wEnderecoNovo, i + 1, Length(wEnderecoNovo));
    end;
  end;

  Result := wEnderecoNovo;
end;

function NumEndereco(wEndereco: string): Integer;
var
  wNum: string;
  i: Integer;
begin
  i := Length(wEndereco);
  wNum := '';
  while i > 1 do
  begin
    if wNum = '' then
    begin
      if (wEndereco[i] in ['0'..'9']) then wNum := wEndereco[i];
    end
    else
    begin
      if (wEndereco[i] in ['0'..'9']) then
        wNum := wEndereco[i] + wNum
      else
        Break;
    end;
    Dec(i);
  end;
  if wNum = '' then
    wNum := '0';
  result := StrToInt(wNum);
end;



//function RemoveNumEndereco(wEndereco, wNumero: String): String;
//var
//  wEnderecoNovo: String;
//  i, j: Integer;
//  wAux: String;
//begin
//  wEnderecoNovo := '';
//  if wEndereco = '' then
//  Begin
//    Result := '';
//    Exit;
//  End;
//  i := ProcuraStr(wNumero, wEndereco);
//  if i < 0 then
//    wEnderecoNovo := wEndereco
//  else
//  begin
//    wEnderecoNovo := Copy(wEndereco, 1, i) + Copy(wEndereco, i + Length(wNumero) + 1, Length(wEndereco));
//    if i = Length(wEnderecoNovo) then
//    begin
//      wEnderecoNovo := Trim(wEnderecoNovo);
//      i := Length(wEnderecoNovo);
//      try
//        while ((wEnderecoNovo[i] = ',')
//          or (wEnderecoNovo[i] = '-')
//          or (wEnderecoNovo[i] = '.')) do
//        begin
//          wEnderecoNovo := Copy(wEnderecoNovo, 1, i - 1);
//          wEnderecoNovo := Trim(wEnderecoNovo);
//          i := Length(wEnderecoNovo);
//        end;
//      except
//      end;
//    end
//    else
//    begin
//      wAux := Copy(wEnderecoNovo, 1, i);
//      j := i;
//      wAux := Trim(wAux);
//      j := Length(wAux);
//      while ((wAux[j] = ',') or (wAux[j] = '-')) do
//      begin
//        wAux := Copy(wAux, 1, j - 1);
//        wAux := Trim(wAux);
//        j := Length(wAux);
//      end;
//      if (wEnderecoNovo[i + 1] = ' ')
//        or (wEnderecoNovo[i + 1] = ',')
//          or (wEnderecoNovo[i + 1] = '.') then
//      begin
//        if (wEnderecoNovo[i + 2] = ',') or (wEnderecoNovo[i + 2] = '.') then
//          wEnderecoNovo := wAux + Copy(wEnderecoNovo, i + 2, Length(wEnderecoNovo))
//        else
//          wEnderecoNovo := wAux + Copy(wEnderecoNovo, i + 1, Length(wEnderecoNovo));
//      end
//      else
//        wEnderecoNovo := wAux + ' ' + Copy(wEnderecoNovo, i + 1, Length(wEnderecoNovo));
//    end;
//  end;
//
//  Result := wEnderecoNovo;
//end;

procedure gravaLinha(var arquivo: TArquivo; var registro: TRegistro);
var clob: TLobLocator;
begin
  Inc(arquivo.cod);
  //clob := TLOBLocator.Create(DMOracle.DBCemapa, otCLOB);
  clob := TLOBLocator.CreateTemporary(DMOracle.DBCemapa, otCLOB, false);

  if Length(registro.linhaNaoGravada) <= 2000 then //Conteúdo padrão
  begin
    DmSped.QInsSped.Close;
    DmSped.QInsSped.SetVariable('COD_REGISTRO', arquivo.cod);
    DmSped.QInsSped.SetVariable('DESC_BLOCO', registro.bloco);
    DmSped.QInsSped.SetVariable('DESC_REGISTRO', registro.registro);
    DmSped.QInsSped.SetVariable('DESC_CONTEUDO', registro.linhaNaoGravada);
    DmSped.QInsSped.SetComplexVariable('DESC_CONTEUDO_LONGO', clob);
    //DmSped.QInsSped.SetVariable('DESC_CONTEUDO_LONGO', null);
  end
  else // Conteúdo Longo
  begin
    DmSped.QInsSped.Close;
    DmSped.QInsSped.SetVariable('COD_REGISTRO', arquivo.cod);
    DmSped.QInsSped.SetVariable('DESC_BLOCO', registro.bloco);
    DmSped.QInsSped.SetVariable('DESC_REGISTRO', registro.registro);
    DmSped.QInsSped.SetVariable('DESC_CONTEUDO', 'LONGO');
    DmSped.QInsSped.SetComplexVariable('DESC_CONTEUDO_LONGO', clob);
    clob.AsString := registro.linhaNaoGravada;
  end;
  try
    DmSped.QInsSped.ExecSQL;
  except
    DMOracle.DBCemapa.Rollback;
    MessageDlg('Erro na gravação. ', mtError, [mbOK], 0);
  end;

//    registro.Destroy;
//    registro := nil;
end;

function executaQuery(var queryBase: TOracleDataSet1; abrir: Boolean = False): TOracleDataSet1;
var query: TOracleDataSet1;
begin
  query := TOracleDataSet1.Create(nil);
  query.Session := DMOracle.DBCemapa;
  query.Variables := queryBase.Variables;
  query.Close;
  query.SQL := queryBase.SQL;
  if abrir then
    query.open;

  Result := query;
end;

function abreQuery(var query: TOracleDataSet1): Boolean;
begin
  query.Open;

  if query.IsEmpty then
  begin
    fechaQuery(query);
    Result := False;
  end
  else
  begin
    query.First;
    Result := True;
  end;
end;

procedure fechaQuery(var query: TOracleDataSet1);
begin
//  if (Assigned(query) and (query = nil)) then
//  Begin
  if ((query = nil) or (not (Assigned(query)))) then
    Exit;
  query.Close;
  query.Free;
//  End;
end;

function pegaValor(var query: TOracleDataSet1; campo: string): Variant;
begin
  //try
    if CampoExiste(query, campo) then
    begin
      if (query.FieldByName(campo).DataType in [ftInteger, ftFloat]) and
        (query.FieldByName(campo).IsNull) then
        Result := 0
      else
      if (query.FieldByName(campo).DataType = ftString) and
        (query.FieldByName(campo).IsNull) then
        Result := ''
      else
      if (query.FieldByName(campo).DataType in [ftInteger, ftFloat]) then
        Result := query.FieldByName(campo).Value
      else
        Result := query.FieldByName(campo).Value;
    //Except
    //  Raise Exception.Create('Campo não encontrado :' + query.Name +' - '+ campo);
    //end;
    end;
end;

function CampoExiste(pQuery: TOracleDataSet1; pCampo: String): Boolean;
var existe: boolean;
  i: Integer;
begin
  existe := false;
  for i := 1 to pQuery.FieldCount do
  begin

    if pQuery.Fields.FieldByNumber(i).DisplayName = pCampo then
    begin
      existe := true;
      break;
    end;
  end;
  result := existe;
end;

function eNulo(var query: TOracleDataSet1; campo: string): Boolean;
begin
  Result := query.FieldByName(campo).IsNull;
end;

function leContaAnterior(conta: Integer): Integer;
var i: Integer;
  super: string;
  query: TOracleDataSet1;
begin
  query := executaQuery(DmSped.QPlanoConta);
  query.SetVariable('COD_PLANO_CONTA', conta);
  query.Open;
  if query.IsEmpty then begin fechaQuery(query); Exit; end;
  if eNulo(query, 'COD_REDUZIDO') then
  begin
    if pegaValor(query, 'NUM_GRAU') = 1 then
    begin
      fechaQuery(query);
      Exit
    end
    else
      super := copy(pegaValor(query, 'NUM_PLANO_CONTA'), 1, Integer((pegaValor(query, 'NUM_GRAU') - 1) * 2 - 1));
  end
  else
    super := copy(pegaValor(query, 'NUM_PLANO_CONTA'), 1, Integer((pegaValor(query, 'NUM_GRAU') - 1) * 2 - 1));
  fechaQuery(query);

  query := executaQuery(DmSped.QPlanoContaNum);
  query.SetVariable('NUM_PLANO_CONTA', super);
  query.Open;
  if query.IsEmpty then begin fechaQuery(query); Exit; end;
  Result := pegaValor(query, 'COD_PLANO_CONTA');
  fechaQuery(query);
end;

function geraStringFiliais(filiais: TStrings; separador: string = ', '): string;
var i: Integer;
  str: string;
begin
  if filiais.Count = 0 then
  begin
    Result := '';
    Exit;
  end;

  str := '';
  for i := 0 to filiais.Count - 1 do
  begin
    try
      StrToInt(filiais[i]);
      str := str + filiais[i];
    except
      str := str + '0';
    end;
    if i < filiais.Count - 1 then
      str := str + separador;
  end;
  str := '(' + str + ')';

  Result := str;
end;

function SomenteNumerosELetras(wString: string): string;
var i: Integer;
  wStringNova: string;
begin
  wStringNova := '';

  for i := 1 to Length(wString) do
    if TiraAcentos(UpperCase(wString[i]))[1] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ',', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'] then
      wStringNova := wStringNova + TiraAcentos(wString[i]);

  Result := wStringNova;
end;

function pegaVersao(pDataFin: TDateTime; pTipo: String): Integer;
begin
  result := 1000;
  if pTipo = 'FISCAL' then
  begin
    if (pDataFin >= (StrToDateTime('01/01/2008'))) and (pDataFin <= (StrToDateTime('31/12/2008'))) then
      result := 1
    else
      if (pDataFin >= (StrToDateTime('01/01/2009'))) and (pDataFin <= (StrToDateTime('31/12/2009'))) then
        result := 2
      else
        if (pDataFin >= (StrToDateTime('01/01/2010'))) and (pDataFin <= (StrToDateTime('31/12/2010'))) then
          result := 3
        else
          if (pDataFin >= (StrToDateTime('01/01/2011'))) and (pDataFin <= (StrToDateTime('31/12/2011'))) then
            result := 4
          else
            if (pDataFin >= (StrToDateTime('01/01/2012'))) and (pDataFin <= (StrToDateTime('30/06/2012'))) then
              result := 5
            else
              if (pDataFin >= (StrToDateTime('01/07/2012'))) and (pDataFin <= (StrToDateTime('31/12/2012'))) then
                result := 6
              else
                if (pDataFin >= (StrToDateTime('01/01/2013'))) and (pDataFin <= (StrToDateTime('31/12/2013')))then
                  result := 7
                else
                  if (pDataFin >= (StrToDateTime('01/01/2014'))) and (pDataFin <= (StrToDateTime('31/12/2014')))then
                    result := 8
                  else
                    if (pDataFin >= (StrToDateTime('01/01/2015'))) and (pDataFin <= (StrToDateTime('31/12/2015'))) then
                      result := 9
                    else
                      if (pDataFin >= (StrToDateTime('01/01/2016'))) and (pDataFin <= (StrToDateTime('31/12/2016'))) then
                        result := 10
                      else
                        if (pDataFin >= (StrToDateTime('01/01/2017'))) and (pDataFin <= (StrToDateTime('31/12/2018'))) then
                          result := 12
                        else
                          if (pDataFin >= (StrToDateTime('01/01/2019'))) and (pDataFin <= (StrToDateTime('31/12/2019'))) then
                            result := 13
                          else
                            if (pDataFin >= (StrToDateTime('01/01/2020'))) and (pDataFin <= (StrToDateTime('31/12/2020'))) then
                              result := 14
                            else
                              if (pDataFin >= (StrToDateTime('01/01/2021'))) and (pDataFin <= (StrToDateTime('31/12/2021'))) then
                                result := 15
                              else
                                if (pDataFin >= (StrToDateTime('01/01/2022'))) and (pDataFin <= (StrToDateTime('31/12/2022'))) then
                                  result := 16
                                else
                                  if (pDataFin >= (StrToDateTime('01/01/2023'))) and (pDataFin <= (StrToDateTime('31/12/2023'))) then
                                    result := 17
                                  else
                                    if (pDataFin >= (StrToDateTime('01/01/2024'))) and (pDataFin <= (StrToDateTime('31/12/2024'))) then
                                      result := 18
                                    else
                                      if (pDataFin >= (StrToDateTime('01/01/2025'))) and (pDataFin <= (StrToDateTime('31/12/2025'))) then
                                        result := 19
                                      else
                                        result := 20;
  end
  else
    if pTipo = 'PISCOFINS' then
    begin
      if (pDataFin >= StrToDateTime('01/01/2012')) and (pDataFin <= StrToDateTime('30/06/2012')) then
        result := 2
      else
        if (pDataFin >= StrToDateTime('01/07/2012')) and (pDataFin <= StrToDateTime('31/05/2018')) then
          result := 3
        else
          if (pDataFin >= StrToDateTime('01/06/2018')) and (pDataFin <= StrToDateTime('31/12/2018')) then
            result := 4
          else
            if (pDataFin >= StrToDateTime('01/06/2019')) and (pDataFin <= StrToDateTime('31/12/2019')) then
              result := 5
            else
               result := 6
    end;
end;

end.
