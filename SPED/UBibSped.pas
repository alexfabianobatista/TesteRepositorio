unit UBibSped;

interface

uses Windows, SysUtils, Variants, DateUtils, Types, OraTeste, ShlObj, Controls;


type tBibSped = class
  private
    function ICMSSTMaricota(pValor: double; pIndEntradaSaida: string): double;
    function BcPisCofinsMaricota(pValor, pICMSST: double; pIndEntradaSaida: string): double;
    function ValTotalItemMaricota(pValor: double; pCodNotaItem: integer; pIndEntradaSaida: string): double;
    function ValMercadoriaMaricota(pValor: double; pCodNota: integer; pIndEntradaSaida: string): double;
    function ValPisCofinsMaricota(pValBase: double; pAliquota: double): double;
    function PersonalizaE111Grasel(codigo: string): string;
    function PersonalizaE111Vosser(codigo: string): string;
  public
    function dataInventario(pDataRef: tdatetime): tdatetime;
    function ICMSST(pValor: double; pIndEntradaSaida: string): double;
    function BcPisCofins(pValor, pICMSST: double; pIndEntradaSaida: string; pIndDescontaST: string): double;
    function ValTotalItem(pValor: double; pCodNotaItem: integer; pIndEntradaSaida: string): double;
    function ValMercadoria(pValor: double; pCodNota: integer; pIndEntradaSaida: string): double;
    function ValPisCofins(pValor: double; pIndEntradaSaida: string; pValBase: double; pAliquota: double): double;
    function PersonalizaE111(codigo: string): string;
    function GeraBlocoK: boolean;
    function ArrumaAjustesGIA(pValorAjuste, pValorImobilizado: double
      ; pOperacao: string = 'SOMA'): double;
    function GeraCaminhoPastaSistema(CSIDLfolder: integer): string;
    function GetDateInDateTime(Data : TDateTime) : TDate;
    function GetStartOfPreviousMonth(Data : TDateTime) : TDate;
    function GetStartOfPreviousMonthLess(Data : TDateTime) : TDate;
    function GetEndOfPreviousMonth(Data : TDateTime) : TDate;

end;

implementation

uses UParamSistema_cl, UOracle_cl;

{ tBibSped }

function tBibSped.ArrumaAjustesGIA(pValorAjuste,
  pValorImobilizado: double; pOperacao: string = 'SOMA'): double;
begin
  // Os registros 66 - ATIVO IMOBILIZADO, podem ser lançados por nota ou por ajustes
  // Quando são lançados por nota, o sistema faz uma busca pelo CFOP e joga no
  // registro 66. Quando isso acontece, não pode sair no campo VL_TOT_AJ_CREDITOS,
  // pois não se trata de um ajuste.
  // É feito um controle por COD_EMPRESA e retirado este campo dos ajustes.
  result := pValorAjuste;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VOSSER' then
  begin
    if pOperacao = 'SOMA' then
      result := pValorAjuste + pValorImobilizado
    else
      result := pValorAjuste - pValorImobilizado;
  end;
end;

function tBibSped.BcPisCofins(pValor, pICMSST: double;
  pIndEntradaSaida: string; pIndDescontaST: string): double;
begin
  result := pValor;
  if pIndEntradaSaida = 'E' then
    if pIndDescontaST = 'SIM' then
      result := pValor - pICMSST

  {if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARICOTA' then
    result := BcPisCofinsMaricota(pValor, pICMSST, pIndEntradaSaida);}
end;

function tBibSped.BcPisCofinsMaricota(pValor, pICMSST: double;
  pIndEntradaSaida: string): double;
begin
  result := pValor;
  if pIndEntradaSaida = 'E' then
    result := pValor - pICMSST;
end;

function tBibSped.dataInventario(pDataRef: tdatetime): tdatetime;
var wDataAux: tdatetime;
  wDia, wMes, wAno: word;
begin
  result := pDataRef;
  decodeDate(pDataRef, wAno, wMes, wDia);
  with DMParamSistema do
  begin
    if QParamSistemaCOD_EMPRESA.Value = 'CGS' then
    begin
      wDataAux := incMonth(pDataRef, -1);
      wDataAux := strToDate(DMOracle.FastSelect('LAST_DAY('
        + quotedStr(datetostr(wDataAux)) + ')'
        , 'DUAL'
        , '1 = 1'));
      result := wDataAux;
    end;

    // Retorna último dia do ano anterior
    if (wMes = 2)
      and ((QParamSistemaCOD_EMPRESA.Value = 'VOSSER')
        or (QParamSistemaCOD_EMPRESA.Value = 'MULTAGRO')
        or (QParamSistemaCOD_EMPRESA.Value = 'BRAGA')
        or (QParamSistemaCOD_EMPRESA.Value = 'ARZ')
        or (QParamSistemaCOD_EMPRESA.Value = 'COZER')
        or (QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES')) then
    begin
      wDataAux := strToDate('31/12/'+ intToStr(wAno-1));
      result := wDataAux;
    end;

       // Retorna último dia do ano anterior
    if ((wMes = 1) or (wMes = 2)
      and (QParamSistemaCOD_EMPRESA.Value = 'CONKRETA')) then
    begin
      wDataAux := strToDate('31/12/'+ intToStr(wAno-1));
      result := wDataAux;
    end;

    wDataAux := strToDate('31/12/'+ intToStr(wAno-1));
    result := wDataAux;

  end;
end;

function tBibSped.GeraBlocoK: boolean;
begin
  // Não gera para nenhuma empresa
  Result := ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS')
    or (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZORZINCO'));
end;

function tBibSped.ICMSST(pValor: double; pIndEntradaSaida: string): double;
begin
  result := pValor;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARICOTA' then
    result := ICMSSTMaricota(pValor, pIndEntradaSaida);
end;

function tBibSped.ICMSSTMaricota(pValor: double; pIndEntradaSaida: string): double;
begin
  if pIndEntradaSaida = 'E' then
    result := 0
  else
    result := pValor;
end;

function tBibSped.PersonalizaE111(codigo: string): string;
begin
  result := codigo;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' then
    result := PersonalizaE111Grasel(codigo);
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VOSSER' then
    result := PersonalizaE111Vosser(codigo);
end;

function tBibSped.PersonalizaE111Grasel(
  codigo: string): string;
begin
  result := codigo;
  if codigo = 'PR000072' then
    result := 'PR000062';
  if codigo = 'PR029999' then
    result := 'PR020061';
end;

function tBibSped.PersonalizaE111Vosser(codigo: string): string;
begin
  result := codigo;
  if codigo = 'PR029999' then
    result := 'PR020207';
end;

function tBibSped.ValMercadoria(pValor: double; pCodNota: integer;
  pIndEntradaSaida: string): double;
begin
  result := pValor;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARICOTA' then
    result := ValMercadoriaMaricota(pValor, pCodNota, pIndEntradaSaida);
end;

function tBibSped.ValMercadoriaMaricota(pValor: double; pCodNota: integer;
  pIndEntradaSaida: string): double;
var icmsst: string;
begin
  icmsst := '';
  result := pValor;

  if pIndEntradaSaida = 'E' then
  begin
    icmsst := DMOracle.FastSelect('SUM(NVL(VAL_ICMS_SUBST,0))'
      , 'TB_NOTA_ITEM'
      , 'COD_NOTA_CAB = ' + IntToStr(pCodNota));
    result := pValor + StrToFloat(icmsst);
  end;
end;

function tBibSped.ValPisCofins(pValor: double; pIndEntradaSaida: string;
  pValBase, pAliquota: double): double;
begin
  result := pValor;
  if (pIndEntradaSaida = 'E') and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARICOTA')
    and (pValor > 0) then
    result := ValPisCofinsMaricota(pValBase, pAliquota);
end;

function tBibSped.ValPisCofinsMaricota(pValBase,
  pAliquota: double): double;
begin
  result := (pValBase * pAliquota) / 100;
end;

function tBibSped.ValTotalItem(pValor: double; pCodNotaItem: integer
  ; pIndEntradaSaida: string): double;
begin
  result := pValor;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARICOTA' then
    result := ValTotalItemMaricota(pValor, pCodNotaItem, pIndEntradaSaida);
end;

function tBibSped.ValTotalItemMaricota(pValor: double; pCodNotaItem: integer
  ; pIndEntradaSaida: string): double;
var icmsst: string;
begin
  icmsst := '';
  result := pValor;
  if pIndEntradaSaida = 'E' then
  begin
    icmsst := DMOracle.FastSelect('NVL(VAL_ICMS_SUBST,0)'
      , 'TB_NOTA_ITEM'
      , 'COD_NOTA_ITEM = ' + IntToStr(pCodNotaItem));
    result := pValor + StrToFloat(icmsst);
  end;
end;

function TBibSped.GeraCaminhoPastaSistema(CSIDLfolder: integer): string;
var
  buf: array[0..255] of char;
  pidList: PItemIDList;
  hWnd: THandle;
  pt : TPoint;
begin
  Result := '';
  GetCursorPos(pt); // pega a posição do mouse
  hWnd := WindowFromPoint(pt); // pega o Handle
  SHGetSpecialFolderLocation(hWnd, CSIDL_DESKTOP, pidList);
  if pidList = nil then
    exit; //
  if SHGetPathFromIDList(pidList, buf) then
    Result := buf;
end;

function TBibSped.GetDateInDateTime(Data : TDateTime) : TDate;
begin
  result := EncodeDate(YearOf(Data), MonthOf(Data), DayOf(Data));
end;

function TBibSped.GetStartOfPreviousMonth(Data : TDateTime) : TDate;
var
  wDia, wMes, wAno: Word;
begin
  DecodeDate(Data, wAno, wMes, wDia);
  if wMes <> 1 then
    result := StartOfaMonth(wAno, wMes-1)
  else
    result := StartOfaMonth(wAno-1, 12);

end;

function TBibSped.GetStartOfPreviousMonthLess(Data : TDateTime) : TDate;
var
  wDia, wMes, wAno: Word;
begin
  DecodeDate(Data, wAno, wMes, wDia);
  if wMes > 2 then
    result := StartOfaMonth(wAno, wMes-2)
  else if wMes = 1 then
    result := StartOfaMonth(wAno-1, 11)
  else if wMes = 2 then
    result := StartOfaMonth(wAno-1, 12);

end;

function TBibSped.GetEndOfPreviousMonth(Data : TDateTime) : TDate;
var
  wDia, wMes, wAno: Word;
begin
  DecodeDate(Data, wAno, wMes, wDia);
  if wMes <> 1 then
    result := EndOFaMonth(wAno, wMes-1)
  else
    result := EndOFaMonth(wAno-1, 12);
end;

end.
