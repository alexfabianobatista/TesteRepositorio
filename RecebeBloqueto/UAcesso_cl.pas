unit UAcesso_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  TDMAcesso = class(TDataModule)
    DBAcesso: TDatabase;
    QExecSql: TQuery;
    QParamSistema: TQuery;
    QParamSistemaCOD_PARAM_SISTEMA: TIntegerField;
    QParamSistemaDT_ULTIMA_REMESSA: TDateTimeField;
    QParamSistemaCOD_CONTA_ATIVA: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    Function ExecutaSql(wstrSql:String):String;
    Function ValorCodigo(wstrCodigo, wstrTabela:String):Integer;
    Function BuscaNome(wstrSql:String):String;
  end;

var
  DMAcesso: TDMAcesso;

implementation

{$R *.DFM}

Function TDMAcesso.ExecutaSql(wstrSql:String):String;
Begin
  QExecSql.Close;
  QExecSql.SQL.Clear;
  QExecSql.SQL.Add(wstrSql);
//  QExecSql.Open;
  QExecSql.ExecSQL;
  QExecSql.Close;
End;


Function TDMAcesso.ValorCodigo(wstrCodigo, wstrTabela:String):Integer;
Var
  wstrSql : String;
  wintAux : Integer;
Begin
  wstrSql := 'SELECT MAX('+wstrCodigo+ ') FROM ' +wstrTabela;
  QExecSql.Close;
  QExecSql.SQL.Clear;
  QExecSql.SQL.Add(wstrSql);
  QExecSql.Open;
  If( QExecSQL.Fields[0].IsNull )Then
    Result := 1
  Else
  Begin
    wintAux := QExecSQL.Fields[0].Value;
    QExecSql.Close;
    Result := (wintAux + 1);
  End;
End;


Function TDMAcesso.BuscaNome(wstrSql:String):String;
Begin
  QExecSql.Close;
  QExecSql.SQL.Clear;
  QExecSql.SQL.Add(wstrSql);
  QExecSql.Open;
  If(NOT QExecSQL.Fields[0].IsNull )Then
    wstrSql := QExecSQL.Fields[0].Text
  Else
    wstrSql := '';
  Result := wstrSql;
End;

end.
