unit UFuncoes;

interface

uses IBQuery, Dialogs, Windows, Forms, StdCtrls, Grids, Buttons, Messages, Controls;

var
  RetornoConsulta: Integer;
  VendedorLogado: Integer;
  function BuscaString(Campo, Tabela: String; CampoChave: String = ''; Valorchave: Integer = 0): String;
  function DataValida(data: String): Boolean;
  function InicioMes(data: TDate = 0): TDate;
  function FimMes(data: TDate = 0): TDate;

implementation

uses UDmSistema, DB, SysUtils;

function BuscaString(Campo, Tabela: String; CampoChave: String = ''; Valorchave: Integer = 0): String;
var q: TIBQuery;
retornar, Condicao: String;
begin
  if ((CampoChave = '') or (Valorchave = 0)) then
    Condicao := 'WHERE (1 = 0)'
  else
    Condicao := 'WHERE ' + CampoChave + ' = ' + IntToStr(Valorchave);

  try
    q := TIBQuery.Create(q);
    q.Database := DmSistema.DbSistema;
    q.SQL.Clear;
    q.SQL.Add('SELECT ' + Campo + ' FROM ' + Tabela + ' ' + Condicao);
    q.Close;
    q.Open;

    if q.IsEmpty then
      retornar := ''
    else
      retornar := q.Fields[0].Value;
  except
//    ShowMessage(q.SQL.Text);
    retornar := '';
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

function InicioMes(data: TDate = 0): TDate;
var dia, mes, ano: Word;
datausar: TDate;
Begin
  if data = 0 then
    datausar := Date
  else
    datausar := data;
  DecodeDate(datausar, ano, mes, dia);

  Result := StrToDate('01/' + IntToStr(mes) + '/' + IntToStr(ano));
End;

function FimMes(data: TDate = 0): TDate;
var dia, mes, ano: Word;
datausar: TDate;
dias: Integer;
Begin
  if data = 0 then
    datausar := Date
  else
    datausar := data;
  DecodeDate(datausar, ano, mes, dia);
  case mes of
    1, 3, 5, 7, 8, 10, 12: dias := 31;
    4, 6, 9, 11: dias := 30;
    2: if IsLeapYear(ano) then dias := 29 else dias := 28;
    else dias := 28;
  end;

  Result := StrToDate(IntToStr(dias) + '/' + IntToStr(mes) + '/' + IntToStr(ano));
End;

end.
