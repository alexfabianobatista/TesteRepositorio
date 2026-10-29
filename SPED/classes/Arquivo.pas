unit Arquivo;

interface

uses Classes, Controls, OraTeste;

type
  TArquivo = Class
    private
      linhaNaoGravada: String;
    public
      registros: array of TObject;
      cod: Integer;
      caminho: String;
      arquivoTemp: TStringList;
      constructor Create(caminho: String);
//      procedure gravaLinha(registro: TObject);
      procedure geraArquivo;
      function procuraRegistrobanco(Bloco: String; Registro: String): String;
      function contaBloco(Bloco: String): Integer;
      function contaRegistro(Bloco, Registro: String): Integer;
      function conta: Integer;
    end;

implementation

uses SysUtils, UFuncoes, Dialogs, USped_cl, UOracle_cl, DB, Registro;

constructor TArquivo.Create(caminho: String);
begin
  inherited Create;

  Self.caminho := caminho;
  linhaNaoGravada := '';

  cod := 0;

  arquivoTemp := TStringList.Create;

  DMOracle.DBCemapa.StartTransaction;

  DmSped.QDelSped.Close;
  try
    DmSped.QDelSped.ExecSQL;
//    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
    MessageDlg('Erro na gravação.', mtError, [mbOK], 0);
  end;

  DMOracle.DBCemapa.StartTransaction;
end;

//procedure TArquivo.gravaLinha(registro: TObject);
//begin
//  if usaBanco then
//  Begin
//    Inc(cod);
//
//    DmSped.QInsSped.Close;
//    DmSped.QInsSped.SetVariable('COD_REGISTRO', cod);
//    DmSped.QInsSped.SetVariable('DESC_BLOCO', TRegistro(registro).bloco);
//    DmSped.QInsSped.SetVariable('DESC_REGISTRO', TRegistro(registro).registro);
//    DmSped.QInsSped.SetVariable('DESC_CONTEUDO', TRegistro(registro).linhaNaoGravada);
//    try
//      DmSped.QInsSped.ExecSQL;
//    except
//      DMOracle.DBCemapa.Rollback;
//      MessageDlg('Erro na gravação.', mtError, [mbOK], 0);
//    end;
//
//    registro.Free;
//    registro := nil;
//  End;
//end;

procedure TArquivo.geraArquivo;
var i, total, qtdlinhas: Integer;
query: TOracleDataSet1;
begin
  query := executaQuery(DmSped.QConta, True);
  total := pegaValor(query, 'TOTAL');
  qtdlinhas := 60000;

  for i := 0 to ((total div qtdlinhas) + 1) do
  Begin
    query := executaQuery(DmSped.QBuscaTodos);
    query.SetVariable('LINHA_INI', i * qtdlinhas);
    query.SetVariable('LINHA_FIN', i * qtdlinhas + qtdlinhas - 1);
    query.Open;
    query.First;
    while not query.Eof do
    Begin
      if pegaValor(query, 'DESC_CONTEUDO') = 'LONGO' then
        arquivoTemp.Append(query.FieldValues['DESC_CONTEUDO_LONGO'])
      else
        arquivoTemp.Append(pegaValor(query, 'DESC_CONTEUDO'));
      query.Next;
    End;
    fechaQuery(query);
  end;

  DMOracle.DBCemapa.Rollback;

//==============================================================================

  arquivoTemp.SaveToFile(caminho);
end;

//procedure TArquivo.geraArquivo;
//var arq: TextFile;
//    query: TOracleDataSet1;
//    i, cont: Integer;
//begin
//    query := executaQuery(DmSped.QBuscaTodos, True);
//    query.First;
//    i := 0;
//    cont := 1;
//    while not query.Eof do
//    begin
//      if i >= 50000 then
//      Begin
//        i := 0;
//        Inc(cont);
//      End;
//      if i = 0 then
//      Begin
//        if cont > 1 then
//          CloseFile(arq);
//        
//        AssignFile(arq, caminho + 'parte' + IntToStr(cont));
//        Rewrite(arq);
//      End;
//
//      Write(arq, pegaValor(query, 'DESC_CONTEUDO'));
//      WriteLn(arq);
//
//      query.Next;
//    end;
//    CloseFile(arq);
//end;

//procedure TArquivo.geraArquivo;
//var i: Integer;
//query: TOracleDataSet1;
//begin
//  query := executaQuery(DmSped.QBuscaTodos, True);
////    DmSped.QBuscaTodos.Close;
////    DmSped.QBuscaTodos.open;
////    DmSped.QBuscaTodos.First;
//  query.First;
//  while not query.Eof do
//  Begin
//    arquivoTemp.Append(pegaValor(query, 'DESC_CONTEUDO'));
//    query.Next;
//  End;
//  fechaQuery(query);
//
//  DMOracle.DBCemapa.Rollback;
//
////==============================================================================
//
//  arquivoTemp.SaveToFile(caminho);
//end;

function TArquivo.procuraRegistroBanco(Bloco: String; Registro: String): String;
var i: Integer;
Begin
  DmSped.QBuscaTodos.Close;
  DmSped.QBuscaTodos.SetVariable('DESC_BLOCO', Bloco);
  DmSped.QBuscaTodos.SetVariable('DESC_REGISTRO', Registro);
  DmSped.QBuscaTodos.open;
  
  DmSped.QBuscaTodos.First;
  Result := DmSped.QBuscaTodosDESC_CONTEUDO.Value;
End;

function TArquivo.contaBloco(Bloco: String): Integer;
var i, cont: Integer;
Begin
  cont := 0;

    DmSped.QContaBloco.Close;
    DmSped.QContaBloco.SetVariable('DESC_BLOCO', Bloco);
    DmSped.QContaBloco.open;

    cont := DmSped.QContaBlocoTOTAL.AsInteger;

  Result := cont;
End;

function TArquivo.contaRegistro(Bloco: String; Registro: String): Integer;
var i, cont: Integer;
Begin
  cont := 0;

    DmSped.QContaRegistro.Close;
    DmSped.QContaRegistro.SetVariable('DESC_BLOCO', Bloco);
    DmSped.QContaRegistro.SetVariable('DESC_REGISTRO', Registro);
    DmSped.QContaRegistro.open;

    cont := DmSped.QContaRegistroTOTAL.AsInteger;

  Result := cont;
End;

function TArquivo.conta: Integer;
Begin
    DmSped.QConta.Close;
    DmSped.QConta.open;

    Result := DmSped.QContaTOTAL.AsInteger;
End;

end.
