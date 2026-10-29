unit UDRE_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, Provider, DBClient;

type

  TValores = class
  private
  protected
    fValor: Double;
    fValorAnterior: Double;
  public
    property Valor: Double read fValor write fValor;
    property ValorAnterior: Double read fValorAnterior write fValorAnterior;
  end;

  TDMDRE = class(TDataModule)
    DsGrupoDre: TDataSource;
    DsGrupoDreConta: TDataSource;
    QRDRE_: TOracleDataSet1;
    QGrupoDreCons: TOracleDataSet1;
    QRDRE_IND_ORDEM: TFloatField;
    QRDRE_IND_TOT: TStringField;
    QRDRE_COD_DRE: TFloatField;
    QRDRE_NUM_GRAU: TFloatField;
    QRDRE_DESC_DRE: TStringField;
    QRDRE_VALOR: TFloatField;
    QGrupoDreConta: TOracleDataSet1;
    QGrupoDre: TOracleDataSet1;
    DsGrupoDreGrupo: TDataSource;
    QGrupoDreGrupo: TOracleDataSet1;
    QGrupoDreGrupoCOD_GRUPO_DRE: TIntegerField;
    QGrupoDreGrupoCOD_GRUPO_DRE_FILHO: TIntegerField;
    QGrupoDreGrupoIND_OPERACAO: TStringField;
    QGrupoDreGrupoDESC_GRUPO_DRE: TStringField;
    QGrupoDreGrupoDESC_GRUPO_DRE_FILHO: TStringField;
    QGrupoDreCOD_GRUPO_DRE: TIntegerField;
    QGrupoDreDESC_GRUPO_DRE: TStringField;
    QGrupoDreIND_TOTALIZADOR: TStringField;
    QGrupoDreConsCOD_GRUPO_DRE: TIntegerField;
    QGrupoDreConsDESC_GRUPO_DRE: TStringField;
    QGrupoDreConsIND_TOTALIZADOR: TStringField;
    QGrupoDreContaCOD_GRUPO_DRE: TIntegerField;
    QGrupoDreContaCOD_PLANO_CONTA: TIntegerField;
    QGrupoDreContaDESC_PLANO_CONTA: TStringField;
    QDreOrdem: TOracleDataSet1;
    DsDreOrdem: TDataSource;
    QGrupoDreNUM_ORDEM: TIntegerField;
    QDreOrdemCOD_GRUPO_DRE: TIntegerField;
    QDreOrdemDESC_GRUPO_DRE: TStringField;
    QDreOrdemIND_TOTALIZADOR: TStringField;
    QDreOrdemNUM_ORDEM: TIntegerField;
    QUltOrdem: TOracleDataSet1;
    QUltOrdemMAX: TFloatField;
    QRGrupo: TOracleDataSet1;
    QRGrupoCOD_GRUPO_DRE: TIntegerField;
    QRGrupoCOD_GRUPO_DRE_FILHO: TIntegerField;
    QRGrupoIND_OPERACAO: TStringField;
    QRConta: TOracleDataSet1;
    QRTodasDre: TOracleDataSet1;
    QRTodasDreCOD_GRUPO_DRE: TIntegerField;
    QRTodasDreDESC_GRUPO_DRE: TStringField;
    QRTodasDreIND_TOTALIZADOR: TStringField;
    QRTodasDreNUM_ORDEM: TIntegerField;
    QRDre: TOracleDataSet1;
    QRDreCOD_GRUPO_DRE: TIntegerField;
    QRDreDESC_GRUPO_DRE: TStringField;
    QRDreIND_TOTALIZADOR: TStringField;
    QRDreNUM_ORDEM: TIntegerField;
    QSaldo: TOracleDataSet1;
    CdDre: TClientDataSet;
    DspDre: TDataSetProvider;
    QCDDre: TOracleDataSet1;
    QCDDreCOD_GRUPO_DRE: TFloatField;
    QCDDreNUM_ORDEM: TFloatField;
    QCDDreNUM_NIVEL_AGLUTINACAO: TFloatField;
    QCDDreCOD_PLANO_CONTA: TIntegerField;
    QCDDreVAL_SALDO: TFloatField;
    CdDreCOD_GRUPO_DRE: TFloatField;
    CdDreNUM_ORDEM: TFloatField;
    CdDreNUM_NIVEL_AGLUTINACAO: TFloatField;
    CdDreCOD_PLANO_CONTA: TIntegerField;
    CdDreVAL_SALDO: TFloatField;
    QCDDreDESC_AGLUTINACAO: TStringField;
    CdDreDESC_AGLUTINACAO: TStringField;
    QCDDreIND_TOTALIZADOR: TStringField;
    CdDreIND_TOTALIZADOR: TStringField;
    QSaldoVAL_ATUAL: TFloatField;
    QCDDreCOD_AGLUTINACAO: TStringField;
    CdDreCOD_AGLUTINACAO: TStringField;
    QRContasInternas: TOracleDataSet1;
    QRContaCOD_GRUPO_DRE: TIntegerField;
    QRContaCOD_PLANO_CONTA: TIntegerField;
    QRContaDESC_PLANO_CONTA: TStringField;
    QRContaCOD_AGLUTINACAO1: TStringField;
    QRContaCOD_AGLUTINACAO: TIntegerField;
    QRContaNUM_PLANO_CONTA: TStringField;
    QRContasInternasCOD_PLANO_CONTA: TIntegerField;
    QRContasInternasDESC_PLANO_CONTA: TStringField;
    QRContasInternasCOD_AGLUTINACAO: TIntegerField;
    QCDDreNUM_AGRUPAMENTO: TFloatField;
    CdDreNUM_AGRUPAMENTO: TFloatField;
    QRGrupoDESC_GRUPO_DRE_FILHO: TStringField;
    QRUltimaDRE: TOracleDataSet1;
    QRUltimaDRECOD_GRUPO_DRE: TIntegerField;
    QRUltimaDREDESC_GRUPO_DRE: TStringField;
    QRUltimaDREIND_TOTALIZADOR: TStringField;
    QRUltimaDRENUM_ORDEM: TIntegerField;
    QRGrupoIND_TOTALIZADOR_FILHO: TStringField;
    QRGrupoNUM_ORDEM_FILHO: TIntegerField;
    QCDDreDESC_ORDEM_AGLUTINACAO: TStringField;
    CdDreDESC_ORDEM_AGLUTINACAO: TStringField;
    QRDreCadastro: TOracleDataSet1;
    QRDreCadastroCOD_GRUPO_DRE: TFloatField;
    QRDreCadastroDESC_GRUPO_DRE: TStringField;
    QRDreCadastroIND_TOTALIZADOR: TStringField;
    QRDreCadastroNUM_ORDEM: TFloatField;
    QRDreCadastroCOD_GRUPO_OU_CONTA: TFloatField;
    QRDreCadastroDESC_GRUPO_OU_CONTA: TStringField;
    QRDreCadastroIND_OPERACAO: TStringField;
    QCDDreVAL_SALDO_MODULO: TFloatField;
    CdDreVAL_SALDO_MODULO: TFloatField;
    QCDDreVAL_SALDO_ANTERIOR: TFloatField;
    CdDreVAL_SALDO_ANTERIOR: TFloatField;
    QCDDreIND_TOTALIZADOR_SPED: TStringField;
    QCDDreCOD_AGLUTINACAO_SPED: TStringField;
    QCDDreCOD_AGLUTINACAO_SUPERIOR: TStringField;
    CdDreIND_TOTALIZADOR_SPED: TStringField;
    CdDreCOD_AGLUTINACAO_SPED: TStringField;
    CdDreCOD_AGLUTINACAO_SUPERIOR: TStringField;
    QIndOperacaoGrupo: TOracleDataSet1;
    QIndOperacaoGrupoCOD_GRUPO_DRE: TIntegerField;
    QIndOperacaoGrupoCOD_GRUPO_DRE_FILHO: TIntegerField;
    QIndOperacaoGrupoIND_OPERACAO: TStringField;
    QIndOperacaoGrupoIND_COD_AGL: TStringField;
    procedure QGrupoDreBeforeEdit(DataSet: TDataSet);
    procedure QGrupoDreBeforeInsert(DataSet: TDataSet);
    procedure QGrupoDreAfterInsert(DataSet: TDataSet);
    procedure QGrupoDreContaBeforeInsert(DataSet: TDataSet);
    procedure QGrupoDreContaBeforeEdit(DataSet: TDataSet);
    procedure QGrupoDreContaAfterPost(DataSet: TDataSet);
    procedure QGrupoDreBeforeDelete(DataSet: TDataSet);
    procedure QGrupoDreGrupoAfterInsert(DataSet: TDataSet);
    procedure QGrupoDreContaAfterInsert(DataSet: TDataSet);
    procedure QGrupoDreGrupoAfterPost(DataSet: TDataSet);
    procedure QGrupoDreGrupoBeforeEdit(DataSet: TDataSet);
    procedure QGrupoDreGrupoBeforeInsert(DataSet: TDataSet);
    procedure QGrupoDreBeforePost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    nivelAglutinacao: Integer;
    ordemAlutinacao: String;
    ordens: array of Integer;
    function AnalisaGrupo(grupo: Integer; ano, mes: Integer; wFiliais: TStrings; impressao: boolean; analitico: Boolean = True): TValores;
    function AnalisaGrupoTrim(grupo: Integer; ano, mes: Integer; wFiliais: TStrings; impressao: boolean; analitico: Boolean = True): TValores;
    function BuscaSaldoConta(conta, ano, mes: Integer; wFiliais: TStrings): Double;
    function executaQuery(var queryBase: TOracleDataSet1;
      abrir: Boolean = False): TOracleDataSet1;
    procedure fechaQuery(var query: TOracleDataSet1);
    function pegaValor(var query: TOracleDataSet1; campo: String): Variant;
    function calculaOrdem(nivel: Integer): String;
    { Private declarations }
  public
    function GeraDRE(mes, ano: Integer; wFiliais: TStrings; impressao: boolean = False; analitico: Boolean = True; isTrimestral: Boolean = False): TDataSet;
    { Public declarations }
  end;

var
  DMDRE: TDMDRE;
  wDreSped: boolean = false;

implementation

uses UOracle_cl, StrUtils, UBiblioteca;//, UFuncoes;

{$R *.DFM}

procedure TDMDRE.QGrupoDreBeforeEdit(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMDRE.QGrupoDreBeforeInsert(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMDRE.QGrupoDreAfterInsert(DataSet: TDataSet);
begin
//  QDREcod_dre.Value:=DMOracle.Sequencia('DRE');
  QGrupoDreIND_TOTALIZADOR.Value := 'N';
end;

procedure TDMDRE.QGrupoDreContaBeforeInsert(DataSet: TDataSet);
begin
  If Not DMOracle.DBCemapa.InTransaction then
    Raise Exception.Create('Não é Possível alterar ou incluir valores. Antes edite o Grupo.')
  else
    If QGrupoDre.State = dsInsert then
    Begin
      QGrupoDre.post;
      QGrupoDre.edit;
    End;
end;

procedure TDMDRE.QGrupoDreContaBeforeEdit(DataSet: TDataSet);
begin
  If Not DMOracle.DBCemapa.InTransaction then
    Raise Exception.Create('Não é Possível alterar ou incluir valores. Antes edite o Grupo.')
  else
    If QGrupoDre.State = dsInsert then
    Begin
      QGrupoDre.post;
      QGrupoDre.edit;
    End;
end;

procedure TDMDRE.QGrupoDreContaAfterPost(DataSet: TDataSet);
begin
  QGrupoDreConta.Close;
  QGrupoDreConta.Open;
end;

procedure TDMDRE.QGrupoDreBeforeDelete(DataSet: TDataSet);
begin
  QGrupoDreConta.First;
  While not(QGrupoDreConta.Eof) do
    QGrupoDreConta.Delete;
end;

procedure TDMDRE.QGrupoDreGrupoAfterInsert(DataSet: TDataSet);
begin
  QGrupoDreGrupoCOD_GRUPO_DRE.Value := QGrupoDreCOD_GRUPO_DRE.Value;
  QGrupoDreGrupoIND_OPERACAO.Value := '+';
end;

procedure TDMDRE.QGrupoDreContaAfterInsert(DataSet: TDataSet);
begin
  QGrupoDreContaCOD_GRUPO_DRE.Value := QGrupoDreCOD_GRUPO_DRE.Value;
end;

procedure TDMDRE.QGrupoDreGrupoAfterPost(DataSet: TDataSet);
begin
  QGrupoDreGrupo.Close;
  QGrupoDreGrupo.Open;
end;

procedure TDMDRE.QGrupoDreGrupoBeforeEdit(DataSet: TDataSet);
begin
  If Not DMOracle.DBCemapa.InTransaction then
    Raise Exception.Create('Não é Possível alterar ou incluir valores. Antes edite o Grupo.')
  else
    If QGrupoDre.State = dsInsert then
    Begin
      QGrupoDre.post;
      QGrupoDre.edit;
    End;
end;

procedure TDMDRE.QGrupoDreGrupoBeforeInsert(DataSet: TDataSet);
begin
  If Not DMOracle.DBCemapa.InTransaction then
    Raise Exception.Create('Não é Possível alterar ou incluir valores. Antes edite o Grupo.')
  else
    If QGrupoDre.State = dsInsert then
    Begin
      QGrupoDre.post;
      QGrupoDre.edit;
    End;
end;

procedure TDMDRE.QGrupoDreBeforePost(DataSet: TDataSet);
begin
  if QGrupoDreNUM_ORDEM.IsNull then
  Begin
    QUltOrdem.Close;
    QUltOrdem.open;

    if ((QUltOrdem.IsEmpty) or (QUltOrdemMAX.IsNull)) then
      QGrupoDreNUM_ORDEM.Value := 0
    else
      QGrupoDreNUM_ORDEM.Value := QUltOrdemMAX.AsInteger + 1;
  End;
end;

function TDMDRE.calculaOrdem(nivel: Integer): String;
var i: Integer;
texto: String;
Begin
  if nivel > Length(ordens) then
  Begin
    SetLength(ordens, nivel);
    ordens[nivel - 1] := 0;
  End;

  ordens[nivel - 1] := ordens[nivel - 1] + 1;

  texto := '';
  for i := 1 to nivel do
  Begin
    texto := texto + FormatFloat('00000', ordens[i - 1]);
  End;

  Result := Bib.AjustaStr(texto, 100);
End;

function TDMDRE.GeraDRE(mes, ano: Integer; wFiliais: TStrings; impressao: boolean = False;
                                        analitico: Boolean = True; isTrimestral: Boolean = False): TDataSet;
var aux: Double;
valores: TValores;
wDre: TOracleDataSet1;
o: string;
Begin
  valores := TValores.Create;
  QRUltimaDRE.Close;
  QRUltimaDRE.Open;     //pega o grupo com a ordem maior
  
  CdDre.Close;
  CdDre.Open;

  if QRUltimaDRE.IsEmpty then
  Begin
    Result := CdDre;
    Exit;
  End;

  nivelAglutinacao := 1;

  o := calculaOrdem(nivelAglutinacao);

  if not isTrimestral then
    valores := AnalisaGrupo(QRUltimaDRECOD_GRUPO_DRE.Value, ano, mes, wfiliais, impressao, analitico)
  else
    valores := AnalisaGrupoTrim(QRUltimaDRECOD_GRUPO_DRE.Value, ano, mes, wfiliais, impressao, analitico);

  CdDre.Append;
  CdDreCOD_GRUPO_DRE.Value := QRUltimaDRECOD_GRUPO_DRE.Value;
  CdDreNUM_ORDEM.Value := QRUltimaDRENUM_ORDEM.Value;
  CdDreVAL_SALDO.Value := valores.Valor;
  CdDreVAL_SALDO_ANTERIOR.Value := valores.ValorAnterior;
  CdDreVAL_SALDO_MODULO.Value := Abs(CdDreVAL_SALDO.Value);
  CdDreNUM_NIVEL_AGLUTINACAO.Value := 1;
  CdDreNUM_AGRUPAMENTO.Value := 1;
  CdDreCOD_PLANO_CONTA.Value := 0;
  CdDreIND_TOTALIZADOR.Value := 'N';
  CdDreIND_TOTALIZADOR_SPED.Value := 'S';
  CdDreCOD_AGLUTINACAO.Value := '';
  CdDreCOD_AGLUTINACAO_SPED.Value := 'DRE_GRUPO' + QRUltimaDRECOD_GRUPO_DRE.Text;
  CdDreDESC_AGLUTINACAO.Value := QRUltimaDREDESC_GRUPO_DRE.Value;
  CdDreDESC_ORDEM_AGLUTINACAO.Value := o;
  CdDre.Post;

  if impressao then
  Begin
    CdDre.IndexName := 'IndiceImpressao';
    CdDre.IndexFieldNames := CdDre.IndexDefs.Items[0].Fields;
  end
  else
  Begin
    //CdDre.IndexName := 'IndiceSPED';
    CdDre.IndexName := 'IndiceImpressao';
    CdDre.IndexFieldNames := CdDre.IndexDefs.Items[0].Fields;
    //CdDre.IndexFieldNames := CdDre.IndexDefs.Items[1].Fields;
  end;
    
  Result := CdDre;
End;

function TDMDRE.AnalisaGrupo(grupo: Integer; ano, mes: Integer; wFiliais: TStrings; impressao: boolean; analitico: Boolean = True): TValores;
var total, totalAnterior: Double;
valores, valoresTotais:TValores;
wDre, wConta, wGrupo, wAnalitica: TOracleDataSet1;
o: String;
Begin
  valores := TValores.Create;
  total := 0;
  totalAnterior := 0;
  wDre := executaQuery(QRDre);
  wDre.SetVariable('COD_GRUPO_DRE', grupo);
  wDre.open;                                            //informações do grupo

  Inc(nivelAglutinacao);

//  if(grupo = 18) then
//    showmessage(pegaValor(wDre, 'DESC_GRUPO_DRE'));

  if pegaValor(wDre, 'IND_TOTALIZADOR') = 'S' then
  Begin
    wGrupo := executaQuery(QRGrupo);
    wGrupo.SetVariable('COD_GRUPO_DRE', grupo);
    wGrupo.open;
    wGrupo.First;                                                //seleciona os grupos filho

    while not wGrupo.Eof do
    Begin
      o := calculaOrdem(nivelAglutinacao);
      valores := AnalisaGrupo(pegaValor(wGrupo, 'COD_GRUPO_DRE_FILHO'), ano, mes, wFiliais, impressao, analitico);

//      if (pegaValor(wGrupo, 'DESC_GRUPO_DRE_FILHO') = '(=) RESULTADO NÃO OPERACIONAL') then
//        Sleep(1);
//      if (pegaValor(wGrupo, 'DESC_GRUPO_DRE_FILHO') = '(-) DESPESAS NÃO OPERACIONAIS') then
//        Sleep(1);

      CdDre.Append;
      CdDreCOD_GRUPO_DRE.Value := grupo;
      CdDreNUM_ORDEM.Value := pegaValor(wGrupo, 'NUM_ORDEM_FILHO');
      if impressao then
      Begin
        if pegaValor(wGrupo, 'IND_TOTALIZADOR_FILHO') = 'S' then
        begin
          CdDreVAL_SALDO.Value := valores.Valor;
          CdDreVAL_SALDO_ANTERIOR.Value := valores.ValorAnterior;
        end
        else
        begin
          CdDreVAL_SALDO.Value := 0;
          CdDreVAL_SALDO_ANTERIOR.Value := 0;
        end;
      End
      else
      begin
          CdDreVAL_SALDO.Value := valores.Valor;
          CdDreVAL_SALDO_ANTERIOR.Value := valores.ValorAnterior;
      end;
      CdDreVAL_SALDO_MODULO.Value := Abs(CdDreVAL_SALDO.Value);
      CdDreCOD_PLANO_CONTA.Value := 0;
      CdDreCOD_AGLUTINACAO.Value := '';
      CdDreCOD_AGLUTINACAO_SPED.Value := 'DRE_GRUPO' + string(pegaValor(wGrupo, 'COD_GRUPO_DRE_FILHO'));
      CdDreCOD_AGLUTINACAO_SUPERIOR.Value := 'DRE_GRUPO' + IntToStr(grupo);
      CdDreNUM_NIVEL_AGLUTINACAO.Value := nivelAglutinacao;
      CdDreNUM_AGRUPAMENTO.Value := 1;
      CdDreDESC_AGLUTINACAO.Value := pegaValor(wGrupo, 'DESC_GRUPO_DRE_FILHO');
      CdDreIND_TOTALIZADOR.Value := 'N';
      CdDreIND_TOTALIZADOR_SPED.Value := 'S';
      CdDreDESC_ORDEM_AGLUTINACAO.Value := o;
      CdDre.Post;

      if (impressao and (pegaValor(wGrupo, 'IND_TOTALIZADOR_FILHO') <> 'S')) then
      Begin
        CdDre.Append;
        CdDreCOD_GRUPO_DRE.Value := grupo;
        CdDreNUM_ORDEM.Value := pegaValor(wGrupo, 'NUM_ORDEM_FILHO');
        CdDreVAL_SALDO.Value := valores.Valor;
        CdDreVAL_SALDO_ANTERIOR.Value := valores.ValorAnterior;
        CdDreVAL_SALDO_MODULO.Value := Abs(CdDreVAL_SALDO.Value);
        CdDreNUM_NIVEL_AGLUTINACAO.Value := nivelAglutinacao;
        CdDreNUM_AGRUPAMENTO.Value := 3;
        CdDreCOD_PLANO_CONTA.Value := 0;
        CdDreIND_TOTALIZADOR.Value := 'S';
        CdDreCOD_AGLUTINACAO.Value := '';
        CdDre.Post;
      End;

//      if aux < 0 Then
//         aux := aux * (-1);
//      aux := Abs(aux);

      if pegaValor(wGrupo, 'IND_OPERACAO') = '+' then
      begin
        Total := Total + valores.Valor;
        totalAnterior := totalAnterior + valores.ValorAnterior;
      end
      else
      begin
        if valores.Valor < 0 Then
          Total := Total + valores.Valor
        else
          Total := Total - valores.Valor;

        if valores.ValorAnterior < 0 Then
          totalAnterior := totalAnterior + valores.ValorAnterior
        else
          totalAnterior := totalAnterior - valores.ValorAnterior;
      end;

      wGrupo.Next;
    End;
    fechaQuery(wGrupo);
  End
  Else
  Begin
    wConta := executaQuery(QRConta);
    wConta.SetVariable('COD_GRUPO_DRE', grupo);
    wConta.open;
    wConta.First;

    while not wConta.Eof do
    Begin
      valores.Valor := BuscaSaldoConta(pegaValor(wConta, 'COD_PLANO_CONTA'), ano, mes, wFiliais);
      valores.ValorAnterior := BuscaSaldoConta(pegaValor(wConta, 'COD_PLANO_CONTA'), ano - 1, mes, wFiliais);
      total := total + valores.Valor;
      totalAnterior := totalAnterior + valores.ValorAnterior;

      ordemAlutinacao := calculaOrdem(nivelAglutinacao);
      if (not (analitico)) then
      Begin
        CdDre.Append;
        CdDreCOD_GRUPO_DRE.Value := grupo;
        CdDreNUM_ORDEM.Value := pegaValor(wDre, 'NUM_ORDEM');
        CdDreVAL_SALDO.Value := valores.Valor;
        CdDreVAL_SALDO_ANTERIOR.Value := valores.ValorAnterior;
        CdDreVAL_SALDO_MODULO.Value := Abs(CdDreVAL_SALDO.Value);
        CdDreCOD_PLANO_CONTA.Value := pegaValor(wConta, 'COD_PLANO_CONTA');
        CdDreCOD_AGLUTINACAO.Value := pegaValor(wConta, 'COD_AGLUTINACAO');
        CdDreNUM_NIVEL_AGLUTINACAO.Value := nivelAglutinacao;
        CdDreNUM_AGRUPAMENTO.Value := 2;
        CdDreDESC_AGLUTINACAO.Value := pegaValor(wConta, 'DESC_PLANO_CONTA');
        CdDreIND_TOTALIZADOR.Value := 'N';
        CdDreDESC_ORDEM_AGLUTINACAO.Value := ordemAlutinacao;
        CdDre.Post;
      End
      Else
      Begin
        wAnalitica := executaQuery(QRContasInternas);
        wAnalitica.SetVariable('NUM_PLANO_CONTA', pegaValor(wConta, 'NUM_PLANO_CONTA'));
        wAnalitica.open;
        wAnalitica.First;
        while not wAnalitica.Eof do
        Begin
          valores.Valor := BuscaSaldoConta(pegaValor(wAnalitica, 'COD_PLANO_CONTA'), ano, mes, wFiliais);
          valores.ValorAnterior := BuscaSaldoConta(pegaValor(wAnalitica, 'COD_PLANO_CONTA'), ano - 1, mes, wFiliais);
          if QRTodasDreIND_TOTALIZADOR.Value <> 'S' then
          Begin
            CdDre.Append;
            CdDreCOD_GRUPO_DRE.Value := grupo;
            CdDreNUM_ORDEM.Value := pegaValor(wDre, 'NUM_ORDEM');
            CdDreVAL_SALDO.Value := valores.Valor;
            CdDreVAL_SALDO_ANTERIOR.Value := valores.ValorAnterior;
            CdDreVAL_SALDO_MODULO.Value := Abs(CdDreVAL_SALDO.Value);
            CdDreCOD_PLANO_CONTA.Value := pegaValor(wAnalitica, 'COD_PLANO_CONTA');
            CdDreCOD_AGLUTINACAO.Value := pegaValor(wAnalitica, 'COD_AGLUTINACAO');
            CdDreCOD_AGLUTINACAO_SPED.Value := pegaValor(wConta, 'COD_PLANO_CONTA');
            CdDreCOD_AGLUTINACAO_SUPERIOR.Value := 'DRE_GRUPO' + string(pegaValor(wConta, 'COD_GRUPO_DRE'));
            CdDreNUM_NIVEL_AGLUTINACAO.Value := nivelAglutinacao;
            CdDreNUM_AGRUPAMENTO.Value := 2;
            CdDreDESC_AGLUTINACAO.Value := pegaValor(wAnalitica, 'DESC_PLANO_CONTA');
            CdDreIND_TOTALIZADOR.Value := 'N';
            CdDreIND_TOTALIZADOR_SPED.Value := 'N';
            CdDreDESC_ORDEM_AGLUTINACAO.Value := ordemAlutinacao;
            CdDre.Post;
          End;

//          Total := Total + aux;

          wAnalitica.Next;
        End;

        fechaQuery(wAnalitica);
      End;

      wConta.Next;
    End;

    fechaQuery(wConta);
  End;

  Dec(nivelAglutinacao);

  fechaQuery(wDre);

  valoresTotais := TValores.Create;
  valoresTotais.ValorAnterior := TotalAnterior;
  valoresTotais.Valor := total;
  Result := valoresTotais;
End;

function TDMDRE.AnalisaGrupoTrim(grupo: Integer; ano, mes: Integer; wFiliais: TStrings; impressao: boolean; analitico: Boolean = True): TValores;
var total, totalAnterior: Double;
valores, valoresTotais:TValores;
wDre, wConta, wGrupo, wAnalitica: TOracleDataSet1;
o: String;
Begin
  valores := TValores.Create;
  total := 0;
  totalAnterior := 0;
  wDre := executaQuery(QRDre);
  wDre.SetVariable('COD_GRUPO_DRE', grupo);
  wDre.open;                                            //informações do grupo

  Inc(nivelAglutinacao);

//  if(grupo = 18) then
//    showmessage(pegaValor(wDre, 'DESC_GRUPO_DRE'));

  if pegaValor(wDre, 'IND_TOTALIZADOR') = 'S' then
  Begin
    wGrupo := executaQuery(QRGrupo);
    wGrupo.SetVariable('COD_GRUPO_DRE', grupo);
    wGrupo.open;
    wGrupo.First;                                                //seleciona os grupos filho

    while not wGrupo.Eof do
    Begin
      o := calculaOrdem(nivelAglutinacao);
      valores := AnalisaGrupoTrim(pegaValor(wGrupo, 'COD_GRUPO_DRE_FILHO'), ano, mes, wFiliais, impressao, analitico);

//      if (pegaValor(wGrupo, 'DESC_GRUPO_DRE_FILHO') = '(=) RESULTADO NÃO OPERACIONAL') then
//        Sleep(1);
//      if (pegaValor(wGrupo, 'DESC_GRUPO_DRE_FILHO') = '(-) DESPESAS NÃO OPERACIONAIS') then
//        Sleep(1);

      CdDre.Append;
      CdDreCOD_GRUPO_DRE.Value := grupo;
      CdDreNUM_ORDEM.Value := pegaValor(wGrupo, 'NUM_ORDEM_FILHO');
      if impressao then
      Begin
        if pegaValor(wGrupo, 'IND_TOTALIZADOR_FILHO') = 'S' then
        begin
          CdDreVAL_SALDO.Value := valores.Valor;
          CdDreVAL_SALDO_ANTERIOR.Value := valores.ValorAnterior;
        end
        else
        begin
          CdDreVAL_SALDO.Value := 0;
          CdDreVAL_SALDO_ANTERIOR.Value := 0;
        end;
      End
      else
      begin
          CdDreVAL_SALDO.Value := valores.Valor;
          CdDreVAL_SALDO_ANTERIOR.Value := valores.ValorAnterior;
      end;
      CdDreVAL_SALDO_MODULO.Value := Abs(CdDreVAL_SALDO.Value);
      CdDreCOD_PLANO_CONTA.Value := 0;
      CdDreCOD_AGLUTINACAO.Value := '';
      CdDreCOD_AGLUTINACAO_SPED.Value := 'DRE_GRUPO' + string(pegaValor(wGrupo, 'COD_GRUPO_DRE_FILHO'));
      CdDreCOD_AGLUTINACAO_SUPERIOR.Value := 'DRE_GRUPO' + IntToStr(grupo);
      CdDreNUM_NIVEL_AGLUTINACAO.Value := nivelAglutinacao;
      CdDreNUM_AGRUPAMENTO.Value := 1;
      CdDreDESC_AGLUTINACAO.Value := pegaValor(wGrupo, 'DESC_GRUPO_DRE_FILHO');
      CdDreIND_TOTALIZADOR.Value := 'N';
      CdDreIND_TOTALIZADOR_SPED.Value := 'S';
      CdDreDESC_ORDEM_AGLUTINACAO.Value := o;
      CdDre.Post;

      if (impressao and (pegaValor(wGrupo, 'IND_TOTALIZADOR_FILHO') <> 'S')) then
      Begin
        CdDre.Append;
        CdDreCOD_GRUPO_DRE.Value := grupo;
        CdDreNUM_ORDEM.Value := pegaValor(wGrupo, 'NUM_ORDEM_FILHO');
        CdDreVAL_SALDO.Value := valores.Valor;
        CdDreVAL_SALDO_ANTERIOR.Value := valores.ValorAnterior;
        CdDreVAL_SALDO_MODULO.Value := Abs(CdDreVAL_SALDO.Value);
        CdDreNUM_NIVEL_AGLUTINACAO.Value := nivelAglutinacao;
        CdDreNUM_AGRUPAMENTO.Value := 3;
        CdDreCOD_PLANO_CONTA.Value := 0;
        CdDreIND_TOTALIZADOR.Value := 'S';
        CdDreCOD_AGLUTINACAO.Value := '';
        CdDre.Post;
      End;

//      if aux < 0 Then
//         aux := aux * (-1);
//      aux := Abs(aux);

      if pegaValor(wGrupo, 'IND_OPERACAO') = '+' then
      begin
        Total := Total + valores.Valor;
        totalAnterior := totalAnterior + valores.ValorAnterior;
      end
      else
      begin
        if valores.Valor < 0 Then
          Total := Total + valores.Valor
        else
          Total := Total - valores.Valor;

        if valores.ValorAnterior < 0 Then
          totalAnterior := totalAnterior + valores.ValorAnterior
        else
          totalAnterior := totalAnterior - valores.ValorAnterior;
      end;

      wGrupo.Next;
    End;
    fechaQuery(wGrupo);
  End
  Else
  Begin
    wConta := executaQuery(QRConta);
    wConta.SetVariable('COD_GRUPO_DRE', grupo);
    wConta.open;
    wConta.First;

    while not wConta.Eof do
    Begin
      valores.Valor := BuscaSaldoConta(pegaValor(wConta, 'COD_PLANO_CONTA'), ano, mes, wFiliais);

      if mes = 3 then
        valores.ValorAnterior := BuscaSaldoConta(pegaValor(wConta, 'COD_PLANO_CONTA'), ano - 1, 12, wFiliais)
      else
        valores.ValorAnterior := BuscaSaldoConta(pegaValor(wConta, 'COD_PLANO_CONTA'), ano, mes - 3, wFiliais);

      total := total + valores.Valor;
      totalAnterior := totalAnterior + valores.ValorAnterior;

      ordemAlutinacao := calculaOrdem(nivelAglutinacao);
      if (not (analitico)) then
      Begin
        CdDre.Append;
        CdDreCOD_GRUPO_DRE.Value := grupo;
        CdDreNUM_ORDEM.Value := pegaValor(wDre, 'NUM_ORDEM');
        CdDreVAL_SALDO.Value := valores.Valor;
        CdDreVAL_SALDO_ANTERIOR.Value := valores.ValorAnterior;
        CdDreVAL_SALDO_MODULO.Value := Abs(CdDreVAL_SALDO.Value);
        CdDreCOD_PLANO_CONTA.Value := pegaValor(wConta, 'COD_PLANO_CONTA');
        CdDreCOD_AGLUTINACAO.Value := pegaValor(wConta, 'COD_AGLUTINACAO');
        CdDreNUM_NIVEL_AGLUTINACAO.Value := nivelAglutinacao;
        CdDreNUM_AGRUPAMENTO.Value := 2;
        CdDreDESC_AGLUTINACAO.Value := pegaValor(wConta, 'DESC_PLANO_CONTA');
        CdDreIND_TOTALIZADOR.Value := 'N';
        CdDreDESC_ORDEM_AGLUTINACAO.Value := ordemAlutinacao;
        CdDre.Post;
      End
      Else
      Begin
        wAnalitica := executaQuery(QRContasInternas);
        wAnalitica.SetVariable('NUM_PLANO_CONTA', pegaValor(wConta, 'NUM_PLANO_CONTA'));
        wAnalitica.open;
        wAnalitica.First;
        while not wAnalitica.Eof do
        Begin
          valores.Valor := BuscaSaldoConta(pegaValor(wAnalitica, 'COD_PLANO_CONTA'), ano, mes, wFiliais);


          if mes = 3 then
            valores.ValorAnterior := BuscaSaldoConta(pegaValor(wConta, 'COD_PLANO_CONTA'), ano - 1, 12, wFiliais)
          else
            valores.ValorAnterior := BuscaSaldoConta(pegaValor(wConta, 'COD_PLANO_CONTA'), ano, mes - 3, wFiliais);


          if QRTodasDreIND_TOTALIZADOR.Value <> 'S' then
          Begin
            CdDre.Append;
            CdDreCOD_GRUPO_DRE.Value := grupo;
            CdDreNUM_ORDEM.Value := pegaValor(wDre, 'NUM_ORDEM');
            CdDreVAL_SALDO.Value := valores.Valor;
            CdDreVAL_SALDO_ANTERIOR.Value := valores.ValorAnterior;
            CdDreVAL_SALDO_MODULO.Value := Abs(CdDreVAL_SALDO.Value);
            CdDreCOD_PLANO_CONTA.Value := pegaValor(wAnalitica, 'COD_PLANO_CONTA');
            CdDreCOD_AGLUTINACAO.Value := pegaValor(wAnalitica, 'COD_AGLUTINACAO');
            CdDreCOD_AGLUTINACAO_SPED.Value := pegaValor(wConta, 'COD_PLANO_CONTA');
            CdDreCOD_AGLUTINACAO_SUPERIOR.Value := 'DRE_GRUPO' + string(pegaValor(wConta, 'COD_GRUPO_DRE'));
            CdDreNUM_NIVEL_AGLUTINACAO.Value := nivelAglutinacao;
            CdDreNUM_AGRUPAMENTO.Value := 2;
            CdDreDESC_AGLUTINACAO.Value := pegaValor(wAnalitica, 'DESC_PLANO_CONTA');
            CdDreIND_TOTALIZADOR.Value := 'N';
            CdDreIND_TOTALIZADOR_SPED.Value := 'N';
            CdDreDESC_ORDEM_AGLUTINACAO.Value := ordemAlutinacao;
            CdDre.Post;
          End;

//          Total := Total + aux;

          wAnalitica.Next;
        End;

        fechaQuery(wAnalitica);
      End;

      wConta.Next;
    End;

    fechaQuery(wConta);
  End;

  Dec(nivelAglutinacao);

  fechaQuery(wDre);

  valoresTotais := TValores.Create;
  valoresTotais.ValorAnterior := TotalAnterior;
  valoresTotais.Valor := total;
  Result := valoresTotais;
End;

function TDMDRE.BuscaSaldoConta(conta: Integer; ano, mes: Integer; wFiliais: TStrings): Double;
Begin
  QSaldo.Close;
  QSaldo.SetVariable('COD_PLANO_CONTA', conta);
  QSaldo.SetVariable('ANOMES',StrToInt(IntToStr(Ano)+FormatFloat('00',Mes)));
  QSaldo.SetVariable('MES',Mes);
  QSaldo.SetVariable('FILIAIS', Bib.geraStringFiliais(wFiliais));
  QSaldo.Open;

  if ((QSaldo.IsEmpty) or (QSaldoVAL_ATUAL.IsNull)) then
    Result := 0
  else
  begin
//    if QSaldoVAL_ATUAL.Value = -2390.00 then
//      Sleep(1);
    Result := QSaldoVAL_ATUAL.Value;
  end;
End;

function TDMDRE.executaQuery(var queryBase: TOracleDataSet1; abrir: Boolean = False): TOracleDataSet1;
var query: TOracleDataSet1;
Begin
  query := TOracleDataSet1.Create(DMDRE);
  query.Session := DMOracle.DBCemapa;
  query.Variables := queryBase.Variables;
  query.Close;
  query.SQL := queryBase.SQL;
  if abrir then
    query.open;

  Result := query;
End;

procedure TDMDRE.fechaQuery(var query: TOracleDataSet1);
Begin
  query.Close;
  query.Free;
End;

function TDMDRE.pegaValor(var query: TOracleDataSet1; campo: String): Variant;
Begin
  if query.FieldByName(campo).IsNull then
    Result := ''
  else
    Result := query.FieldByName(campo).Value;
End;

procedure TDMDRE.DataModuleCreate(Sender: TObject);
begin
  SetLength(ordens, 0);
end;

end.
