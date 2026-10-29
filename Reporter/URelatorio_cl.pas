unit URelatorio_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMRelatorio = class(TDataModule)
    QRelatorio: TOracleDataSet1;
    QTabAll: TOracleDataSet1;
    DSReporter: TDataSource;
    DSTabDisponivel: TDataSource;
    QFrom: TOracleDataSet1;
    DSFrom: TDataSource;
    QRelatorioCOD_RELATORIO: TIntegerField;
    QRelatorioNOME_RELATORIO: TStringField;
    QRelatorioDESC_TITULO: TStringField;
    QFromCOD_RELATORIO: TIntegerField;
    QTabAllTABLE_NAME: TStringField;
    QCamposDisp: TOracleDataSet1;
    DSCamposDisp: TDataSource;
    QSelect: TOracleDataSet1;
    DSSelect: TDataSource;
    QWhere: TOracleDataSet1;
    DSWhere: TDataSource;
    QWhereCOD_RELATORIO: TIntegerField;
    QWhereNOME_CAMPO: TStringField;
    QWhereNOME_FILTRO: TStringField;
    QWhereIND_VARIAVEL: TStringField;
    QWhereIND_TIPO_VARIAVEL: TStringField;
    QExecRel: TOracleDataSet1;
    QTabDisp: TOracleDataSet1;
    QTabDispTABLE_NAME: TStringField;
    QColRelacao: TOracleDataSet1;
    QRelacao: TOracleDataSet1;
    QColRelacaoTABLE_NAME: TStringField;
    QColRelacaoCOLUMN_NAME: TStringField;
    QColRelacaoTABLE_NAME_1: TStringField;
    QColRelacaoCOLUMN_NAME_1: TStringField;
    QRelacaoNOME_CAMPO1: TStringField;
    QRelacaoNOME_CAMPO2: TStringField;
    QRelacaoCOD_RELATORIO: TIntegerField;
    DSColRelacao: TDataSource;
    QWhereDESC_CONDICAO: TStringField;
    QSelectCOD_RELATORIO: TFloatField;
    QSelectNOME_CAMPO: TStringField;
    QSelectNUM_TAMANHO: TIntegerField;
    QSelectNUM_POS_X: TIntegerField;
    QSelectNUM_POS_Y: TIntegerField;
    QSelectNUM_ORDEM: TFloatField;
    QSelectNOME_ALIAS: TStringField;
    QFromCOD_FROM: TIntegerField;
    QSelectCOD_SELECT: TIntegerField;
    QWhereCOD_WHERE: TIntegerField;
    QRelacaoCOD_RELACAO: TIntegerField;
    QSelectDESC_CALCULO: TStringField;
    QSelectDESC_TIPO_DADO: TStringField;
    QGroupBy: TOracleDataSet1;
    DSGroupBy: TDataSource;
    QGroupByCOD_RELATORIO: TFloatField;
    QGroupByNOME_CAMPO: TStringField;
    QGroupByNUM_TAMANHO: TIntegerField;
    QGroupByNUM_POS_X: TIntegerField;
    QGroupByNUM_POS_Y: TIntegerField;
    QGroupByNUM_ORDEM: TFloatField;
    QGroupByNOME_ALIAS: TStringField;
    QGroupByCOD_SELECT: TIntegerField;
    QGroupByDESC_CALCULO: TStringField;
    QGroupByDESC_TIPO_DADO: TStringField;
    QRelatorioCons: TOracleDataSet1;
    QRelatorioConsCOD_RELATORIO: TIntegerField;
    QRelatorioConsNOME_RELATORIO: TStringField;
    QRelatorioConsDESC_TITULO: TStringField;
    QSelectCOD_FROM: TIntegerField;
    QSelectIND_SUMARY: TStringField;
    QSumary: TOracleDataSet1;
    DSSumary: TDataSource;
    QNotSumary: TOracleDataSet1;
    DSNotSumary: TDataSource;
    QSumaryCOD_RELATORIO: TFloatField;
    QSumaryNOME_ALIAS: TStringField;
    QSumaryIND_SUMARY: TStringField;
    QNotSumaryCOD_RELATORIO: TFloatField;
    QNotSumaryNOME_ALIAS: TStringField;
    QNotSumaryIND_SUMARY: TStringField;
    QSumaryNOME_CAMPO: TStringField;
    QSumaryNUM_TAMANHO: TIntegerField;
    QSumaryNUM_POS_X: TIntegerField;
    QSumaryNUM_POS_Y: TIntegerField;
    QSelectDESC_MASCARA: TStringField;
    QSelectDESC_ALINHAMENTO: TStringField;
    QSelectIND_GRUPO: TFloatField;
    QGrupo: TOracleDataSet1;
    QGrupoIND_GRUPO: TFloatField;
    DSGrupo: TDataSource;
    QSumaryDESC_MASCARA: TStringField;
    QSumaryDESC_ALINHAMENTO: TStringField;
    QRelatorioNOME_FONTE: TStringField;
    QRelatorioNUM_TAMANHO_FONTE: TFloatField;
    QRelatorioDESC_ORIENTACAO: TStringField;
    QCamposDispNOME_CAMPO: TStringField;
    QCamposDispDESC_ALIAS: TStringField;
    QCamposDispDATA_TYPE: TStringField;
    QCamposDispDATA_LENGTH: TFloatField;
    QCamposDispDATA_PRECISION: TFloatField;
    QFromNOME_TABELA: TStringField;
    QSelectNOME_TABELA: TStringField;
    QGroupByNOME_TABELA: TStringField;
    QWhereNOME_TABELA: TStringField;
    QRelacaoNOME_TABELA1: TStringField;
    QRelacaoNOME_TABELA2: TStringField;
    procedure QFromAfterInsert(DataSet: TDataSet);
    procedure QFromAfterScroll(DataSet: TDataSet);
    procedure QSelectAfterInsert(DataSet: TDataSet);
    procedure QWhereAfterInsert(DataSet: TDataSet);
    procedure QFromAfterOpen(DataSet: TDataSet);
    procedure QFromAfterPost(DataSet: TDataSet);
    procedure QFromAfterDelete(DataSet: TDataSet);
    procedure QFromBeforeDelete(DataSet: TDataSet);
    procedure QRelatorioAfterInsert(DataSet: TDataSet);
    procedure QRelacaoAfterInsert(DataSet: TDataSet);
    procedure QRelatorioBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    Procedure AtualizaCampos;
    Procedure GeraOrderby;
    Procedure GeraGroupBy;
  public
    { Public declarations }
    Procedure GeraSQL( wCondicao : TStrings );
  end;

var
  DMRelatorio: TDMRelatorio;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMRelatorio.QFromAfterInsert(DataSet: TDataSet);
begin
  QFromCod_From.Value := DMOracle.Sequencia('FROM');
  QFromCod_Relatorio.Value := QRelatorioCod_Relatorio.Value;
  If UpperCase(DSTabDisponivel.Dataset.Name) = 'QTABDISP' then
    QFromNome_Tabela.Value := QTabDispTable_Name.Value
  Else
    QFromNome_Tabela.Value := QTabAllTable_Name.Value;
end;

procedure TDMRelatorio.QFromAfterScroll(DataSet: TDataSet);
begin
  AtualizaCampos;
  If UpperCase(Screen.ActiveForm.Name) = 'FREPORTERWIZ' then
  Begin
    QTabDisp.Close;
    QTabDisp.SetVariable('TABLE_NAME',QFromNome_Tabela.Value);
    QTabDisp.Open;
  End;
end;

Procedure TDMRelatorio.AtualizaCampos;
Begin
  QCamposDisp.Close;
  QCamposDisp.SetVariable('TABLE_NAME',QFromNome_Tabela.Value);
  QCamposDisp.Open;
End;

procedure TDMRelatorio.QSelectAfterInsert(DataSet: TDataSet);
begin
  QSelectCod_Select.Value := DMOracle.Sequencia('SELECT');
  QSelectCod_Relatorio.Value := QRelatorioCod_Relatorio.Value;
  QSelectCod_From.Value := QFromCod_From.Value;
  QSelectNome_Tabela.Value := QFromNome_Tabela.Value;
  QSelectNome_Campo.Value := QCamposDispNome_Campo.Value;
  QSelectNome_Alias.Value := QCamposDispDesc_Alias.Value;
  QSelectDesc_Tipo_Dado.Value := QCamposDispData_Type.Value;
  QSelectDesc_Calculo.Value := 'NAO';
  QSelectInd_Sumary.Value := 'NAO';
  QSelectInd_Grupo.Value := 0;
  QSelectNum_Ordem.Value := QSelect.RecordCount;
  If QSelectDesc_Tipo_Dado.Value = 'NUMBER' Then
  Begin
    QSelectNum_Tamanho.Value := Round(QCamposDispData_Precision.Value)*9;
    QSelectDesc_Mascara.Value := '###,###,##0.##';
    QSelectDesc_Alinhamento.Value := 'DIREITA';
  End
  Else
  Begin
    QSelectNum_Tamanho.Value := Trunc(QCamposDispData_Length.Value)*9;
    QSelectDesc_Mascara.Value := '';
    QSelectDesc_Alinhamento.Value := 'ESQUERDA';
  End;
end;

procedure TDMRelatorio.QWhereAfterInsert(DataSet: TDataSet);
begin
  QWhereCod_where.Value := DMOracle.Sequencia('WHERE');
  QWhereCod_Relatorio.Value := QRelatorioCod_Relatorio.Value;
  QWhereNome_Tabela.Value := QFromNome_Tabela.Value;
  QWhereNome_Campo.Value := QCamposDispNome_Campo.Value;
  QWhereInd_Variavel.Value := 'SIM';
  QWhereInd_Tipo_Variavel.Value := QCamposDispData_Type.Value;
end;

procedure TDMRelatorio.GeraSQL(wCondicao: TStrings);
Var wAux : String;
    wCont : Integer;
    wGroupBy : Boolean;
begin
  wGroupBy := False;
  // FAZER O SELECT
  QExecRel.Close;
  QExecRel.SQL.Clear;
  QExecRel.SQL.Add('SELECT');
  QSelect.Open;
  QSelect.First;
  While not QSelect.Eof do
  Begin
    wAux :=  QSelectNome_Tabela.Value
            + '.'
            + QSelectNome_Campo.Value;
    If QSelectDesc_Calculo.Value <> 'NAO' Then
    Begin
      wAux := QSelectDesc_Calculo.Value +'(' + wAux + ') ' + QSelectNome_Campo.Value;
      wGroupby := True;
    End;
    QSelect.Next;
    If not QSelect.Eof then
      wAux := wAux + ',';
    QExecRel.SQL.Add(wAux);
  End;
  // FAZER O FROM
  QExecRel.SQL.Add( 'FROM');
  QFrom.Open;
  QFrom.First;
  While not QFrom.Eof do
  Begin
    wAux := QFromNome_Tabela.Value;
    QFrom.Next;
    If not QFrom.Eof then
      wAux := wAux + ',';
    QExecRel.SQL.Add(wAux);
  End;
  // FAZER O WHERE
  QRelacao.open;
  If (QRelacaoCod_Relatorio.Value = QRelatorioCod_Relatorio.Value)
    or (wCondicao.Count > 0) then
  Begin
    QExecRel.SQL.Add('WHERE');
  End;
  For wCont := 0 to wCondicao.Count - 1 do
  Begin
    QExecRel.SQL.Add(wCondicao.Strings[wCont]);
    If wCont < wCondicao.Count - 1 then
      QExecRel.SQL.Add('AND');
  End;
  If (wCondicao.Count > 0) and
    (QRelacaoCod_Relatorio.Value = QRelatorioCod_Relatorio.Value)  then
  Begin
    QExecRel.SQL.Add('AND');
  End;

  QRelacao.First;
  While not QRelacao.Eof do
  Begin
    QExecRel.SQL.Add(QRelacaoNome_Tabela1.Value
                       + '.'
                       + QRelacaoNome_Campo1.Value
                       + '='
                       + QRelacaoNome_Tabela2.Value
                       + '.'
                       + QRelacaoNome_Campo2.Value);
    QRelacao.Next;
    If not QRelacao.Eof then
      QExecRel.SQL.Add('AND');
  End;

  If wGroupBy then
    GeraGroupBy;

  GeraOrderBy;


  // Preparar para imprimir

  Try
    QExecRel.Open;
  Except
    ShowMessage('Ocorreu um erro. Seu relatório não foi gerado corretamente!');
  End;

  QSelect.Close;
  QFrom.Close;
  QRelacao.Close;

end;

procedure TDMRelatorio.QFromAfterOpen(DataSet: TDataSet);
begin
  If UpperCase(Screen.ActiveForm.Name) = 'FREPORTERWIZ' then
  Begin
    If QFromCod_Relatorio.Value = 0 then
    Begin
      QTabAll.Close;
      QTabAll.Open;
      DSTabDisponivel.Dataset := QTabAll;
    End
    Else
    Begin
      QTabDisp.Close;
      QTabDisp.SetVariable('TABLE_NAME',QFromNome_Tabela.Value);
      QTabDisp.Open;
      DSTabDisponivel.Dataset := QTabDisp;
    End;
  End;
end;

procedure TDMRelatorio.QFromAfterPost(DataSet: TDataSet);
begin
  QFrom.Close;
  QFrom.Open;
end;

procedure TDMRelatorio.QFromAfterDelete(DataSet: TDataSet);
begin
  QFrom.Close;
  QFrom.Open;
end;

procedure TDMRelatorio.QFromBeforeDelete(DataSet: TDataSet);
begin
  QSelect.First;
  While not QSelect.Eof do
  Begin
    If QSelectNome_Tabela.Value = QFromNome_Tabela.Value then
      QSelect.Delete
    Else
      QSelect.Next;
  End;
  QRelacao.First;
  While not QRelacao.Eof do
  Begin
    If (QRelacaoNome_Tabela1.Value = QFromNome_Tabela.Value)
      or (QRelacaoNome_Tabela2.Value = QFromNome_Tabela.Value) then
        QRelacao.Delete
    Else
      QRelacao.Next;
  End;
end;

procedure TDMRelatorio.QRelatorioAfterInsert(DataSet: TDataSet);
begin
  QRelatorioCod_Relatorio.Value := DMOracle.Sequencia('RELATORIO');
  QRelatorioNome_Fonte.Value := 'Courier New';
  QRelatorioNum_Tamanho_Fonte.Value := 10;
  QRelatorioDesc_Orientacao.Value := 'RETRATO';

end;

procedure TDMRelatorio.QRelacaoAfterInsert(DataSet: TDataSet);
begin
  QRelacaoCod_Relacao.Value := DMOracle.Sequencia('RELACAO');
end;

Procedure TDMRelatorio.GeraOrderby;
Var wAux : String;
Begin
  QExecRel.SQL.Add('ORDER BY');
  QSelect.First;
  While not QSelect.Eof do
  Begin
    If QSelectDesc_Calculo.Value = 'NAO' Then
      wAux := QSelectNome_Tabela.Value + '.'
    Else
      wAux := '';
    wAux := wAux + QSelectNome_Campo.Value;
    QSelect.Next;
    If Not QSelect.Eof Then
      wAux := wAux + ',';
    QExecRel.SQL.Add(wAux);
  End;

End;

procedure TDMRelatorio.GeraGroupBy;
Var wAux : String;
begin
  QExecRel.SQL.Add('GROUP BY');
  QGroupBy.Open;
  QGroupBy.First;
  While not QGroupBy.Eof do
  Begin
    wAux := QGroupByNome_Tabela.Value + '.' +QGroupByNome_Campo.Value;
    // wAux := QGroupByNome_Campo.Value;
    QGroupBy.Next;
    If Not QGroupBy.Eof Then
      wAux := wAux + ',';
    QExecRel.SQL.Add(wAux);
  End;
  QGroupBy.Close;
end;

procedure TDMRelatorio.QRelatorioBeforeDelete(DataSet: TDataSet);
begin
  QWhere.Open;
  QFrom.Open;
  QSelect.Open;
  QRelacao.Open;

  While not QWhere.Eof do
  Begin
    QWhere.Delete;
  End;
  While not QFrom.Eof do
  Begin
    QFrom.Delete;
  End;

  QWhere.Close;
  QFrom.Close;
  QSelect.Close;
  QRelacao.Close;

end;

end.
