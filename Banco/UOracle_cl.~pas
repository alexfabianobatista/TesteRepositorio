unit UOracle_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Oracle, OracleData, OraTeste, OraS, variants;

type
  (**
   * Classe que utiliza o BuscaNomes para efetuar várias consultas ao banco
   * de uma só vez. Para utilizar basta usar a instancia do objeto disponivel
   * aqui no DMOracle:
   *
   *      if Buscador = nil then
   *        Buscador := TBuscador.Create; //Certificando-se de que esteja instanciada
   *
   * Limpar qualquer busca existente toda vez que for utilizá-lo, adicionar
   * nele as buscas necessárias:
   *
   *      Buscador.Limpa;
   *      Buscador.Adiciona('SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = ' + wCadastro);
   *      Buscador.Adiciona('SELECT DESC_FILIAL FROM TB_FILIAL WHERE COD_FILIAL = ' + wFilial);
   *      Buscador.Adiciona('DESC_CIDADE', 'TB_CIDADE', 'COD_CIDADE = ' + wCidade);
   *
   * Ordenar a busca ao banco e receber os dados na sequencia
   * que eles foram adicionados:
   *
   *      Buscador.Buscar;
   *      wNome := Buscador.Proximo;
   *      wDescFilial := Buscador.Proximo;
   *      wDescCidade := Buscador.Proximo;
   *
   * Finalmente é fortemente recomendado fechar o objeto, a fim de uma busca em lote
   * não interferir em outra feita pelo mesmo objeto:
   *
   *      Buscador.Fecha;
   *
   *)
  TBuscador = class
  private
  protected
    FIndex: Integer;
    FBuscas: array of string;
    FResultados: array of string;
  public
    constructor Create; overload;
    constructor Create(Sqls: array of string; RodarAgora: Boolean = True); overload;
    procedure Adiciona(Sql: string); overload;
    procedure Adiciona(Campo, Tabela: string; Condicao: string = ''); overload;
    procedure Buscar(LimparSqls: Boolean = False);
    procedure Fecha;
    procedure Limpa;
    procedure SetBuscas(Sqls: array of string; RodarAgora: Boolean = True);
    function Proximo: string;
    function TemProximo: Boolean;
    function Resultado(Index: Integer): string;
  end;

  
  (**
   * Classe para efetuar várias atualizações no banco de dados em apenas 1
   * acesso a ele, para usar basta seguir os passos:
   *
   * 1-Criar:
   *    var
   *      Executador: TExecutador;
   *    begin
   *      Executador := TExecutador.Create;
   *
   * 2-Limpar qualquer sql existente toda vez que for utilizá-lo:
   *      Executador.Limpa;
   *
   * 3-Adicionar nele as execuções desejadas:
   *      Executador.Adiciona('UPDATE TB_ESTADO SET DESC_ESTADO = ' + wDescEstado + ' WHERE COD_ESTADO = ' + wCodUf);
   *      Executador.Adiciona('DESC_CIDADE = ' + wDescCidade, 'TB_CIDADE', 'COD_CIDADE = ' + wCodCidade);
   *
   * 4-Ordenar a execução no banco, passando parametros para Limpar execucoes e efetuar Commit se desejado:
   *      Executador.Executar; // Sem limpar, sem efetuar commit;
   *
   *      OU
   *
   *      Executador.Executar(True, True); // Limpar sqls do cache, efetuar commit;
   *
   *)
  TExecutador = class(TBuscador)
  private
  protected
  public
    function Proximo: string;
    function Resultado(Index: Integer): string;
    procedure Adiciona(Campo, Tabela, Condicao: string); overload;
    procedure Buscar(LimparSqls: Boolean = False);
    procedure Executar(LimparSqls: Boolean = False; EfetuarCommit: Boolean = False);
  end;

  TDMOracle = class(TDataModule)
    QErroOcorrencia: TOracleDataSet1;
    QErroMsg: TOracleDataSet1;
    QErroMsgCOD_ERRO: TStringField;
    QErroMsgDESC_MENSAGEM: TStringField;
    QExecSQL: TOracleDataSet1;
    QDataServ: TOracleDataSet1;
    QDataServDTSERVIDOR: TDateTimeField;
    QSequencia: TOracleDataSet1;
    QErroConstraint: TOracleDataSet1;
    QErroOcorrenciaCOD_ERRO: TStringField;
    QErroOcorrenciaDESC_ERRO: TStringField;
    QErroOcorrenciaNOME_TELA: TStringField;
    QErroOcorrenciaDT_ERRO: TDateTimeField;
    QSequenciaPROX_NUMERO: TFloatField;
    QErroConstraintDESC_CONSTRAINT: TStringField;
    QErroConstraintDESC_TRADUCAO: TStringField;
    DBCemapa: TOraS;
    QAudit: TOracleDataSet1;
    QAuditCOD_USUARIO: TIntegerField;
    QAuditDT_AUDIT: TDateTimeField;
    QAuditNOME_TABELA: TStringField;
    QAuditDESC_CAMPO01: TStringField;
    QAuditDESC_CAMPO02: TStringField;
    QAuditDESC_VALOR02: TStringField;
    QAuditDESC_CAMPO03: TStringField;
    QAuditDESC_VALOR03: TStringField;
    QAuditDESC_CAMPO04: TStringField;
    QAuditDESC_VALOR04: TStringField;
    QAuditDESC_CAMPO05: TStringField;
    QAuditDESC_VALOR05: TStringField;
    QAuditDESC_VALOR01: TStringField;
    QAuditIND_OPERACAO: TStringField;
    OPCemapa: TOraclePackage;
    QKillSession: TOracleDataSet1;
    QSession: TOracleDataSet1;
    QSessionSERIAL: TFloatField;
    QSessionSID: TFloatField;
    QDataServFUSO_HORARIO: TStringField;
    procedure DMOracleCreate(Sender: TObject);
    procedure DMOracleDestroy(Sender: TObject);
    procedure DBCemapaAfterLogOn(Sender: TOracleSession);
  private
    FBanco: string;
    FSerial: string;
    FSid: string;
    fDuplicando: Boolean;
    function TrataErroConstraint(wMensOriginal: string): string;
    procedure InsereErroLista(vCodErro, vMsgOriginal: string);
    function resultadoLista(cmd: string): string;

  public
    { Public declarations }
    // esta propriedade serve para poder verificar se esta duplicando um registro - nos modulos somente testar se esta verdadeiro - muda no click do botao na tela modelo
    property pDuplicando: Boolean read fDuplicando write fDuplicando default False;
    function DataServ: TDateTime;
    function DataHoraServ: TDateTime;
    function HoraServ: TDateTime;
    function FusoHorarioServ: String;
    procedure TrataErro(Sender: TObject; E: Exception);
    function Sequencia(NomeSeq: string): Integer;
    function BuscaNome(pSQL, pCriterio: string; pCache: boolean = False): string;
    function FastSelect(field, table: string; where: string = ''; cache: Boolean = False): string;
    //    Function BuscaNome(pSQL, pCriterio : String):String;
    procedure BuscaNomes(pSql: array of string; var pRes: array of string);
    procedure ExecutaSql(wSql: string; wCommit: boolean = true);
    function BuscaParametro(campo, tabela, campoCondicao, valorCondicao, resPadrao: string): string;
    function NomeFilial: string;
    function DiasNoMes(Mes: TDateTime): Integer;
    function UltimoDiaMes(Mes: TDateTime): TDateTime;
    procedure Audit(wQuery: TOracleDataSet1; wOperacao: string);
    function NomedoMes(dData: TDatetime): string;
    procedure KillSession(Sid, Serial: string);
    procedure ValidaFilial(wFilial: string);
  end;

  TComando = record
    pResultado: string;
    pSql: string;
  end;
  PComando = ^TComando;

var
  DMOracle: TDMOracle;
  wvErros: array[1..100, 1..4] of string;
  wErroLista: Byte;
  lstComandos: TList;
  Buscador: TBuscador; // Instancia de TBuscador para ser usada em todos os
                       // locais necessários e que utilizam o DMOracle.
  Executador: TExecutador;

function MontaSelect(Campo, Tabela, Condicao: string): string;
function MontaUpdate(Campo, Valor, Tabela, Condicao: string): string;
function MontaDelete(Tabela, Condicao: string): string;

implementation

uses UUsuario_cl, StrUtils, UConexao, DateUtils;

{$R *.DFM}

function MontaSelect(Campo, Tabela, Condicao: string): string;
begin
  Result := 'SELECT ' + Campo + ' FROM ' + Tabela + IfThen(Condicao <> '', ' WHERE ' + Condicao, '');
end;

function MontaUpdate(Campo, Valor, Tabela, Condicao: string): string;
begin
  Result := 'UPDATE ' + Tabela + ' SET ' + Campo + ' = ' + Valor + IfThen(Condicao <> '', ' WHERE ' + Condicao, '');
end;

function MontaDelete(Tabela, Condicao: string): string;
begin
  Result := 'DELETE FROM ' + Tabela + IfThen(Condicao <> '', ' WHERE ' + Condicao, '');
end;

function TDMOracle.DataServ: TDateTime;
begin
  QDataServ.Close;
  QDataServ.Open;
  Result := Trunc(QDataServDtServidor.Value);
end;

function TDMOracle.DataHoraServ: TDateTime;
begin
  QDataServ.Close;
  QDataServ.Open;
  Result := QDataServDtServidor.Value;
end;
function TDMOracle.HoraServ: TDateTime;
begin
  QDataServ.Close;
  QDataServ.Open;
  Result := StrToDateTime(FormatDateTime('hh:nn:ss',QDataServDtServidor.Value));
end;

function TDMOracle.FusoHorarioServ: String;
begin
  QDataServ.Close;
  QDataServ.Open;
  Result := QDataServFUSO_HORARIO.Value;
end;

function TDMOracle.Sequencia(NomeSeq: string): Integer;
begin
  QSequencia.Close;
  QSequencia.SetVariable('NOME_SEQ', NomeSeq);
  QSequencia.Open;
  if QSequenciaProx_Numero.Value >= 0 then
    Result := Trunc(QSequenciaProx_Numero.Value)
  else
    raise Exception.Create('Sequencia inválida!');
end;

procedure TDMOracle.TrataErro(Sender: TObject; E: Exception);
var
  vCodErro, vMsgOriginal, wMsgTraduzida: string;
  vPosicao, i: Integer;
begin
  // Tratamento de Erro
  try // Evitar erro recursivo
    if DBCemapa.CheckConnection(False) = ccError then //Se foi perdida a conexao com o banco de dados.
    begin
      if FConexao = nil then
        FConexao := TFConexao.Create(Application);
      FConexao.Reconectar;
      i := 0;
      while i < Length(QExecSQL.OpenedDatasets) do
      begin
        if QExecSQL.OpenedDatasets[i] <> nil then
        try
          (TOracleDataset1(QExecSQL.OpenedDatasets[i])).Open;
        except
        end;
        Inc(i);
      end;
      Abort;
    end;

    vMsgOriginal := E.Message;
    vPosicao := Pos('ORA', vMsgOriginal); // Erro do Oracle
    if vPosicao > 0 then
    begin
      vCodErro := Copy(vMsgOriginal, vPosicao, 9);
      QErroOcorrencia.Open;
      InsereErroLista(vCodErro, vMsgOriginal);
      QErroMsg.Close;
      QErroMsg.SetVariable('COD_ERRO', vCodErro);
      QErroMsg.Open;
      if QErroMsgCod_Erro.Text <> '' then
        wMsgTraduzida := QErroMsgDesc_Mensagem.Value
      else
        wMsgTraduzida := '';
      wMsgTraduzida := wMsgTraduzida + TrataErroConstraint(vMsgOriginal);
      if wMsgTraduzida <> '' then
        E.Message := wMsgTraduzida;
    end;
    Application.ShowException(E); // Erro Traduzido
  except
    //ShowMessage('Erro sem tratamento!');
  end;
end;

function TDMOracle.TrataErroConstraint(wMensOriginal: string): string;
var wPos1, wPos2: Integer;
  wConst: string;
begin
  Result := '';
  wPos1 := Pos('PK_', wMensOriginal);
  if wPos1 = 0 then
    wPos1 := Pos('FK_', wMensOriginal);
  if wPos1 = 0 then
    wPos1 := Pos('UK_', wMensOriginal);
  wPos2 := Pos(')', wMensOriginal);
  if (wPos1 > 0) and (wPos2 > wPos1) then
  begin
    wConst := Copy(wMensOriginal, wPos1, wPos2 - wPos1);
    QErroConstraint.Close;
    QErroConstraint.SetVariable('DESC_CONSTRAINT', UpperCase(wConst));
    QErroConstraint.Open;
    if QErroConstraintDesc_Constraint.Text <> '' then
      Result := Chr(13) + Chr(13) + QErroConstraintDesc_Traducao.Value;
  end;
end;

procedure TDMOracle.BuscaNomes(pSql: array of string; var pRes: array of string);
{ exemplo de uso
var
 x, y: array of string;
begin
  setLength(x, 4); //4 sql diferentes
  setLength(y, 4);

  x[0] := 'SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA ';
  x[1] := 'SELECT SYSDATE FROM DUAL';
  x[2] := 'SELECT DESC_FILIAL FROM TB_FILIAL WHERE COD_FILIAL = 1';
  x[3] := 'SELECT NOME FROM TB_USUARIO WHERE COD_USUARIO = 58';

  DMOracle.BuscaNomes(x, y);

  showmessage(y[0]); //aqui mostra o COD_EMPRESA
  showmessage(y[1]); //aqui mostra o SYSDATE
  showmessage(y[2]); //aqui mostra o DESC_FILIAL
  showmessage(y[3]); //aqui mostra o NOME
end;
}
var
  wSql: string;
  i: integer;
  wVirg: string;
begin
  wSql := ' SELECT ';
  wVirg := '';

  for i := 0 to length(pSql) - 1 do
  begin
    wSql := wSql + wVirg + '( ' + pSql[i] + ' )';
    wVirg := ', '
  end;
  wSql := wSql + ' FROM DUAL ';

  QExecSQL.Close;
  QExecSQL.SQL.Clear;
  QExecSQL.SQL.Add(wSQL);
  QExecSQL.Open;

  for i := 0 to length(pSql) - 1 do
    pRes[i] := QExecSQL.fields[i].text;
end;

function TDMOracle.resultadoLista(cmd: string): string;
var i: integer;
begin
  result := '';
  for i := 0 to lstComandos.Count - 1 do
  begin
    if trim(stringReplace(Pcomando(lstComandos[i])^.pSql, '''', '', [rfReplaceAll])) = trim(stringReplace(cmd, '''', '', [rfReplaceAll])) then
    begin
      result := Pcomando(lstComandos[i])^.pResultado;
      lstComandos.Move(i, 0); //move para a primeira posição, assim os mais acessados serão os primeiros da lista e mais rapidamente serao encontrados
      break;
    end;
  end;
end;

{Function TDMOracle.BuscaNome(pSQL, pCriterio : String):String;
Begin
  QExecSQL.Close;
  QExecSQL.SQL.Clear;
  QExecSQL.SQL.Add(pSQL);
  If pCriterio <> '' Then
  Begin
    QExecSQL.SQL.Add('WHERE ');
    QExecSQL.SQL.Add(pCriterio);
  End;
  QExecSQL.Open;
  If QExecSQL.Fields[0].Value = Null then
    Result := ''
  Else
    Result := QExecSQL.Fields[0].Value;
End;
}

function TDMOracle.BuscaNome(pSQL, pCriterio: string; pCache: boolean = False): string;
var
  aux: string;
  cmd: PComando;
  res: string;
begin
  aux := pSql;
  if pCriterio <> '' then
    aux := aux + ' WHERE ' + pCriterio;

  res := '';
  if pCache then
    res := resultadoLista(aux); //procura o resultado na lista de comandos

  if res = '' then //se nao encontrou nada na lista, busca do banco de dados
  begin
    QExecSQL.Close;
    QExecSQL.SQL.Clear;
    qexecSQL.Sql.add(aux);

    Result := '';
    try
      QExecSQL.Open;
      if QExecSQL.Fields[0].Value <> Null then
        Result := QExecSQL.Fields[0].Value;
    except on e: Exception do
//      case MessageDlgCustom('Erro na execução de SQL no banco (DMOracle.BuscaNome).' + chr(13) + chr(10) +
//          'Certifique-se de que não foi informado algum valor inválido em algum campo de busca.' +
//          chr(13) + chr(10) + 'SQL: ' + QuotedStr(aux) + chr(13) + chr(10) +
//          'Erro: ' + e.Message, mtError, [mbYes, mbNo], ['Continuar mesmo assim', 'Cancelar'], nil) of
//        mrYes:
//        begin
//          QExecSQL.Close; //Fechando a query
//          Exit;
//        end
//        else
//        begin
//          QExecSQL.Close; //Fechando a query
//          Abort;
//        end;
//      end;
        raise Exception.Create('Erro na execução de SQL no banco (DMOracle.BuscaNome).' + chr(13) + chr(10) +
          'Certifique-se de que não foi informado algum valor inválido em algum campo de busca.' +
          chr(13) + chr(10) + 'SQL: ' + QuotedStr(aux) + chr(13) + chr(10) +
          'Erro: ' + e.Message);
    end;
    QExecSQL.Close; //Fechando a query

    if (Result <> '') and pCache then //se encontrou algum resultado no banco de dados, joga para a lista
    begin
      new(cmd);
      cmd.pResultado := Result;
      cmd.pSql := aux;
      lstComandos.Insert(0, cmd); //insere o comando na primeira posicao
    end;
  end
  else
    result := res;
end;

function TDMOracle.NomeFilial: string;
begin
  QExecSQL.Close;
  QExecSQL.SQL.Clear;
  QExecSQL.SQL.Add('SELECT DESC_FILIAL FROM TB_FILIAL, TB_PARAM_SISTEMA');
  QExecSQL.SQL.Add('WHERE TB_FILIAL.COD_FILIAL = TB_PARAM_SISTEMA.COD_FILIAL');
  QExecSQL.Open;
  if QExecSQL.Fields[0].Value = Null then
    raise Exception.Create('Arquivo de Parametros com Filial Inválida!')
  else
    Result := QExecSQL.Fields[0].Value;
end;

procedure TDMOracle.InsereErroLista(vCodErro, vMsgOriginal: string);
begin
  if wErroLista < 100 then
  begin
    Inc(wErroLista);
    wvErros[wErroLista, 1] := vCodErro;
    wvErros[wErroLista, 2] := vMsgOriginal;
    wvErros[wErroLista, 3] := DateTimeToStr(DMOracle.DataHoraServ);
    wvErros[wErroLista, 4] := Screen.ActiveForm.Name;
  end;
end;

procedure TDMOracle.DMOracleCreate(Sender: TObject);
begin
  wErroLista := 0;
  lstComandos := TList.Create;
  if Buscador = nil then
    Buscador := TBuscador.Create;
  if Executador = nil then
    Executador := TExecutador.Create;
end;

procedure TDMOracle.DMOracleDestroy(Sender: TObject);
begin
  while wErroLista > 0 do
  begin
    QErroOcorrencia.Open;
    QErroOcorrencia.Insert;
    QErroOcorrenciaCod_Erro.Value := wvErros[wErroLista, 1];
    QErroOcorrenciaDesc_Erro.Value := wvErros[wErroLista, 2];
    QErroOcorrenciaDt_Erro.Value := StrToDateTime(wvErros[wErroLista, 3]);
    QErroOcorrenciaNome_Tela.Value := wvErros[wErroLista, 4];
    QErroOcorrencia.Post;
    Dec(wErroLista);
  end;
end;

function TDMOracle.DiasNoMes(Mes: TDateTime): Integer;
//var
//   wData:String;
//   Day,Month,Year:Word;
//begin
//  wData:=DateToStr(Mes);
//  QExecSQL.Close;
//  QExecSQL.SQL.Clear;
//  QExecSQL.SQL.Add('SELECT TRUNC(LAST_DAY(TO_DATE('+CHR(39)+wData+CHR(39)+','+CHR(39)+'DD-MM-YY'+CHR(39)+'))) FROM DUAL');
//  QExecSQL.Open;
//  wData:=QExecSQL.Fields[0].Value;
//  DecodeDate(StrToDate(wData),Year,Month,Day);
//  Result:=Day;
//end;
var
  a, m, d: word;
  mDtTemp: TDateTime;
begin
  Mes := Trunc(Mes);
  Decodedate(Mes, a, m, d);
  mDtTemp := (Mes - d) + 33;
  Decodedate(mDtTemp, a, m, d);
  Decodedate(mDtTemp - d, a, m, d);
  Result := d;
end;

function TDMOracle.UltimoDiaMes(Mes: TDateTime): TDateTime;
//var
   //wData:String;
//begin
  //wData:=DateToStr(Mes);
  //QExecSQL.Close;
  //QExecSQL.SQL.Clear;
  //QExecSQL.SQL.Add('SELECT TRUNC(LAST_DAY(TO_DATE('+CHR(39)+wData+CHR(39)+','+CHR(39)+'DD-MM-YY'+CHR(39)+'))) FROM DUAL');
  //QExecSQL.Open;
  //Result:=QExecSQL.Fields[0].Value;
//end;
var
  a, m, d: word;
  mDtTemp: TDateTime;
begin
  Mes := Trunc(Mes);
  Decodedate(Mes, a, m, d);
  mDtTemp := (Mes - d) + 33;
  Decodedate(mDtTemp, a, m, d);
  Result := mDtTemp - d;
end;


procedure TDMOracle.Audit(wQuery: TOracleDataSet1; wOperacao: string);
var wSQL: string;
  wPos: Integer;
begin
  try
    wSQL := UpperCase(wQuery.SQL.Text);
    QAudit.CommitOnPost := not DMOracle.DBCemapa.InTransaction;
    QAudit.Open;
    QAudit.Insert;

    QAuditCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
    QAuditDt_Audit.Value := Now;
    wPos := Pos('FROM', wSQL);
    wSQL := Copy(wSQL, wPos, 40);
    wPos := Pos('TB_', wSQL);
    wSQL := Copy(wSQL, wPos, 35);
    wPos := Pos('WHERE', wSQL);
    wSQL := Copy(wSQL, 1, wPos - 3);
    QAuditNome_Tabela.Value := wSQL;
    QAuditInd_Operacao.Value := wOperacao;
    for wPos := 0 to wQuery.FieldCount - 1 do
    begin
      case wPos of
        0: begin
            QAuditDesc_Campo01.Value := wQuery.Fields[wPos].FieldName;
            QAuditDesc_Valor01.Value := wQuery.Fields[wPos].Text;
          end;
        1: begin
            QAuditDesc_Campo02.Value := wQuery.Fields[wPos].FieldName;
            QAuditDesc_Valor02.Value := wQuery.Fields[wPos].Text;
          end;
        2: begin
            QAuditDesc_Campo03.Value := wQuery.Fields[wPos].FieldName;
            QAuditDesc_Valor03.Value := wQuery.Fields[wPos].Text;
          end;
        3: begin
            QAuditDesc_Campo04.Value := wQuery.Fields[wPos].FieldName;
            QAuditDesc_Valor04.Value := wQuery.Fields[wPos].Text;
          end;
        4: begin
            QAuditDesc_Campo05.Value := wQuery.Fields[wPos].FieldName;
            QAuditDesc_Valor05.Value := wQuery.Fields[wPos].Text;
          end;
      end; // case
    end;
    QAudit.Post;
  except
  end;
end;

function TDMOracle.BuscaParametro(campo, tabela, campoCondicao, valorCondicao, resPadrao: string): string;
var wSql: string;
begin
  if (trim(valorCondicao) <> '') and (trim(valorCondicao) <> (chr(39) + chr(39))) then
  begin
    wSql := 'SELECT ' + campo + ' FROM ' + tabela + ' WHERE ' + campoCondicao + ' = ' + valorCondicao;

    QExecSQL.Close;
    QExecSQL.SQL.Clear;
    QExecSQL.SQL.Add(wSQL);
    QExecSQL.Open;

    if QExecSQL.Fields[0].Value = Null then
      Result := ''
    else
      Result := QExecSQL.Fields[0].Value;
  end
  else
    if trim(resPadrao) = '' then
      result := 'Todos'
    else
      result := resPadrao;
end;


procedure TDMOracle.ExecutaSql(wSql: string; wCommit: boolean = true);
begin
  if QExecSQL.Active then
    QExecSQL.Close;
  QExecSQL.SQL.Clear;
  QExecSQL.SQL.Add(wSql);
  QExecSQL.ExecSQL;
  if (DBCemapa.InTransaction) and
    (wCommit) then
    DBCemapa.Commit;
end;

procedure TDMOracle.ValidaFilial(wFilial: String);
begin
  if BuscaNome('SELECT IND_SITUACAO FROM TB_FILIAL','COD_FILIAL = ' + wFilial) = 'C' then
    raise Exception.Create('Filial não habilitada para esta operação!');
end;

function TDMOracle.NomedoMes(dData: TDatetime): string;
{Retorna o nome do mes, em extenso, de uma determinada data}
var
  nAno, nMes, nDia: word;
  cMes: array[1..12] of string;
begin
  cMes[01] := 'Janeiro';
  cMes[02] := 'Fevereiro';
  cMes[03] := 'Marco';
  cMes[04] := 'Abril';
  cMes[05] := 'Maio';
  cMes[06] := 'Junho';
  cMes[07] := 'Julho';
  cMes[08] := 'Agosto';
  cMes[09] := 'Setembro';
  cMes[10] := 'Outubro';
  cMes[11] := 'Novembro';
  cMes[12] := 'Dezembro';
  decodedate(dData, nAno, nMes, nDia);
  if (nMes >= 1) and (nMes <= 13) then
  begin
    Result := cMes[nMes];
  end
  else
  begin
    Result := '';
  end;
end;

function TDMOracle.FastSelect(field, table: string; where: string = ''; cache: Boolean = False): string;
begin
  Result := BuscaNome('SELECT ' + field + ' FROM ' + table, where, cache);
end;

{ TBuscador }

(**
 * Adiciona uma consulta a ser realizada no banco.
 *)

procedure TBuscador.Adiciona(Sql: string);
var
  i: Integer;
begin
  if TemProximo then
    raise Exception.Create('Há uma chamada de busca em lote em andamento.' + #13 + #10 +
      'Por favor, use outro objeto ou finalize a primeira busca em lotes.');
  i := Length(FBuscas);
  SetLength(FBuscas, i + 1);
  FBuscas[i] := Sql;
end;

(**
 * Adiciona uma consulta a ser realizada no banco.
 *)

procedure TBuscador.Adiciona(Campo, Tabela: string; Condicao: string = '');
begin
  Adiciona(MontaSelect(Campo, Tabela, Condicao));
end;

(**
 * Efetua as buscas ao banco, preenchendo o campo FResultados que conterá
 * os retornos e será usado na procedure Proximo.
 *)

procedure TBuscador.Buscar(LimparSqls: Boolean = False);
begin
  SetLength(FResultados, Length(FBuscas));
  if Length(FBuscas) > 0 then
    DMOracle.BuscaNomes(FBuscas, FResultados);
  FIndex := 0;
  if LimparSqls then
    Limpa;
end;

(**
 * Cria uma nova instancia de TBuscador.
 * Parametro Buscas pode ser passado para não ser necessário adicionar
 * as buscas posteriormente.
 * Parametro BuscarAgora pode ser passado como True se é desejado que
 * as buscas sejam efetuadas imediatamente.
 *)

constructor TBuscador.Create(Sqls: array of string; RodarAgora: Boolean = True);
begin
  SetBuscas(Sqls, RodarAgora);
end;

(**
 * Cria sem nenhum parametro
 *)

constructor TBuscador.Create;
begin
  Create([''], False);
end;

(**
 * Fecha o objeto buscador. Se não fechar e não foram lidos todos os resultados,
 * este objeto disparará uma excessão dizendo que existe uma chamada em andamento.
 * Este método deve ser usado toda vez que uma consulta em lotes já tiver sido
 * lida, ou seja, depois de usar todos os 'Proximo' desejados.
 *)

procedure TBuscador.Fecha;
begin
  SetLength(FResultados, 0);
end;

(**
 * Limpa as Buscas adicionadas.
 *)

procedure TBuscador.Limpa;
begin
  SetLength(FBuscas, 0);
end;

(**
 * Retorna o proximo resultado contido em FResultados.
 *)

function TBuscador.Proximo: string;
begin
  Result := '';
  if FIndex < Length(FResultados) then
  begin
    Result := FResultados[FIndex];
    Inc(FIndex);
  end;
end;

(**
 * Retorna o resultado de determinado Index de FResultados.
 *)

function TBuscador.Resultado(Index: Integer): string;
begin
  Result := '';
  if Index < Length(FResultados) then
    Result := FResultados[Index];
end;

(**
 * Setter para o campo FBuscas, podendo passar um True para o parametro BuscarAgora
 * para que a busca seja efetuada imediatamente.
 *)

procedure TBuscador.SetBuscas(Sqls: array of string; RodarAgora: Boolean = True);
var
  i: Integer;
begin
  if Length(Sqls) > 0 then
  begin
    SetLength(FBuscas, Length(Sqls));
    for i := 0 to Length(Sqls) - 1 do
      FBuscas[i] := Sqls[i];
    FIndex := 0;
    if RodarAgora then
      Buscar;
  end;
end;

function TBuscador.TemProximo: Boolean;
begin
  Result := (FIndex < Length(FResultados));
end;

{ TExecutador }

procedure TExecutador.Adiciona(Campo, Tabela, Condicao: string);
begin
  inherited Adiciona('UPDATE ' + Tabela + ' SET ' + Campo + ' WHERE ' + Condicao);
end;

procedure TExecutador.Buscar(LimparSqls: Boolean);
begin
  //inherited;
  //nao busca
end;

procedure TExecutador.Executar(LimparSqls, EfetuarCommit: Boolean);
var
  sql: string;
  i: Integer;
begin
  inherited;
  if Length(FBuscas) > 0 then
  begin
    sql := 'DECLARE BEGIN ';
    for i := 0 to Length(FBuscas) - 1 do
      if FBuscas[i] <> '' then
        sql := sql + FBuscas[i] + '; ';
    sql := sql + 'END; ';
    DMOracle.ExecutaSql(sql, EfetuarCommit);
  end;
  if LimparSqls then
    Limpa;
end;

function TExecutador.Proximo: string;
begin
  Result := '';
end;

function TExecutador.Resultado(Index: Integer): string;
begin
  Result := '';
end;

procedure TDMOracle.DBCemapaAfterLogOn(Sender: TOracleSession);
begin
  try
    if DBCemapa.Connected then
    begin
      QSession.Close;
      QSession.Open;
      QSession.First;
      try
        if (FSid <> '') and (FSerial <> '') and
          ((FSid <> QSessionSID.Text) or (FSerial <> QSessionSERIAL.Text)) and
          (UpperCase(FBanco) = UpperCase(DBCemapa.LogonDatabase)) then
          KillSession(FSid, FSerial); //Se tiver alguma conexao anterior, mata ela para soltar locks.
      except
      end;
      FBanco := DBCemapa.LogonDatabase;
      FSid := QSessionSID.Text;
      FSerial := QSessionSERIAL.Text;
      QSession.Close;
    end;
  except
  end;
end;

procedure TDMOracle.KillSession(Sid, Serial: string);
begin
//  if FastSelect('COUNT(*)', 'GV$SESSION', 'SID = ' + Sid + ' AND SERIAL# = ' + Serial +
//      ' AND STATUS <> ' + QuotedStr('KILLED')) > '0' then
//    ExecutaSql('ALTER SYSTEM KILL SESSION ' + QuotedStr(Sid + ',' + Serial), False);
  QKillSession.Close;
  QKillSession.SQL.Text := 'ALTER SYSTEM KILL SESSION ' + QuotedStr(Sid + ',' + Serial);
  QKillSession.ExecSQL;
end;    
end.

