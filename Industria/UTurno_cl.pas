unit UTurno_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMTurno = class(TDataModule)
    DSTurno: TDataSource;
    DSTurnoAll: TDataSource;
    DSTurnoControle: TDataSource;
    DSTurnoControleAberto: TDataSource;
    QTurnoControleAberto: TOracleDataSet1;
    QTurnoControleAbertoCOD_TURNO: TIntegerField;
    QTurnoControleAbertoDESC_TURNO: TStringField;
    QTurnoControleAbertoCOD_TURNO_CONTROLE: TIntegerField;
    QTurnoControleAbertoDT_TRABALHO: TDateTimeField;
    QTurnoControleAbertoIND_SITUACAO: TStringField;
    QTurnoControleAbertoDT_INICIO: TDateTimeField;
    QTurnoControleAbertoDT_FINAL: TDateTimeField;
    QRProducaoTurnoProd: TOracleDataSet1;
    QRProducaoTurnoProdCOD_FILIAL: TIntegerField;
    QRProducaoTurnoProdCOD_TURNO: TIntegerField;
    QRProducaoTurnoProdCOD_PRODUTO: TIntegerField;
    QRProducaoTurnoProdDT_LANCAMENTO: TDateTimeField;
    QRProducaoTurnoProdQT_REPROCESSO: TFloatField;
    QRProducaoTurnoProdQT_VARREDURA: TFloatField;
    QRProducaoTurnoProdQT_REFUGO_EMBALAGENS: TFloatField;
    QRProducaoTurnoProdDESC_FILIAL: TStringField;
    QRProducaoTurnoProdDESC_PRODUTO: TStringField;
    QRProducaoTurnoProdDESC_TURNO: TStringField;
    QRAcompanha: TOracleDataSet1;
    QRAcompanhaTR_DT_INICIO: TDateTimeField;
    QRAcompanhaSNUM_TRABALHO: TFloatField;
    QRAcompanhaSQT_KILOS: TFloatField;
    QRAcompanhaQT_FABRICADO: TFloatField;
    QRAcompanhaOBS_CONTROLE: TStringField;
    QRAcompanhaDESC_TURNO: TStringField;
    QRAcompanhaCOD_PRODUTO: TFloatField;
    QRAcompanhaDESC_PRODUTO: TStringField;
    QRAcompanhaSNUM_PARADO: TFloatField;
    QRAcompanhaSNUM_TRABALHADA: TFloatField;
    QRAcompanhaIND_TIPO_BOLETIM: TStringField;
    QRAcompanhahora_trabalhadas: TFloatField;
    QTurnoControleCons: TOracleDataSet1;
    QTurnoControle: TOracleDataSet1;
    QTurnoControleCOD_TURNO_CONTROLE: TIntegerField;
    QTurnoControleCOD_TURNO: TIntegerField;
    QTurnoControleDT_TRABALHO: TDateTimeField;
    QTurnoControleIND_SITUACAO: TStringField;
    QTurnoControleDT_INICIO: TDateTimeField;
    QTurnoControleDT_FINAL: TDateTimeField;
    QTurnoControleQT_HORA_PARADO: TFloatField;
    QTurnoControleDESC_OBS: TStringField;
    QTurnoControleDESC_COMPLEMENTO: TStringField;
    QTurnoControleQT_HORA_TRABALHADA: TFloatField;
    QTurno: TOracleDataSet1;
    QTurnoCOD_TURNO: TIntegerField;
    QTurnoDESC_TURNO: TStringField;
    QTurnoAll: TOracleDataSet1;
    QTurnoAllCOD_TURNO: TIntegerField;
    QTurnoAllDESC_TURNO: TStringField;
    QTurnoControleConsCOD_TURNO_CONTROLE: TIntegerField;
    QTurnoControleConsCOD_TURNO: TIntegerField;
    QTurnoControleConsDT_TRABALHO: TDateTimeField;
    QTurnoControleConsIND_SITUACAO: TStringField;
    QTurnoControleConsDT_INICIO: TDateTimeField;
    QTurnoControleConsDT_FINAL: TDateTimeField;
    procedure QTurnoAfterInsert(DataSet: TDataSet);
    procedure QTurnoControleAfterInsert(DataSet: TDataSet);
    procedure QTurnoControleBeforeInsert(DataSet: TDataSet);
    procedure QTurnoControleAfterPost(DataSet: TDataSet);
    procedure QTurnoControleBeforePost(DataSet: TDataSet);
    procedure QTurnoControleAfterEdit(DataSet: TDataSet);
    procedure QRAcompanhaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Function TurnoControleAberto : Integer;
  end;

var
  DMTurno: TDMTurno;

implementation

uses UOracle_cl, UBoletim_cl;

{$R *.DFM}

procedure TDMTurno.QTurnoAfterInsert(DataSet: TDataSet);
begin
//  QTurnoCod_Turno.Value := DMOracle.Sequencia('TURNO');
end;

procedure TDMTurno.QTurnoControleAfterInsert(DataSet: TDataSet);
begin
//  QTurnoControleCod_Turno_Controle.Value := DMOracle.Sequencia('TURNO_CONTROLE');
  QTurnoControleDt_Trabalho.Value := DMOracle.DataServ;
  QTurnoControleDt_Inicio.Value := DMOracle.DataHoraServ;  
  QTurnoControleInd_Situacao.Value := 'A';
end;

Function TDMTurno.TurnoControleAberto : Integer;
Var wTurno : String;
Begin
  Result := 0;
  wTurno := DMOracle.BuscaNome('SELECT COD_TURNO_CONTROLE FROM TB_TURNO_CONTROLE',
                     'DT_FINAL IS NULL');
  If Trim(wTurno) <> '' Then
     Result := StrToInt(wTurno);
End;

procedure TDMTurno.QTurnoControleBeforeInsert(DataSet: TDataSet);
// Var wCodigo : Real;
begin
{  wCodigo := TurnoControleAberto;
  If wCodigo > 0 Then
  Begin
    QTurnoControle.Close;
    QTurnoControle.ParamByName('PK').AsFloat := wCodigo;
    QTurnoControle.Open;
    Raise Exception.Create('Já existe um turno em Aberto!');
  End; }
end;

procedure TDMTurno.QTurnoControleAfterPost(DataSet: TDataSet);
Var wCodigo : Integer;
begin
  wCodigo := QTurnoControleCod_Turno_Controle.Value;
  QTurnoControle.Close;
  QTurnoControle.SetVariable('PK',wCodigo);
  QTurnoControle.Open;
end;

procedure TDMTurno.QTurnoControleBeforePost(DataSet: TDataSet);
Var
    wTurno : String;
begin
  if QTurnoControle.State = DsInsert Then
  begin
    wTurno := DMOracle.BuscaNome('SELECT COD_TURNO_CONTROLE FROM TB_TURNO_CONTROLE',
                     'DT_FINAL IS NULL AND COD_TURNO =' + QTurnoControleCod_Turno.Text);
    if wTurno <> '' Then
       raise Exception.Create('Já existe um Turno aberto!');
  end;
{  if QTurnoControleDt_Final.Value > 0 Then
  begin
    wAux := QTurnoControleDt_Final.Value - QTurnoControleDt_Inicio.Value;
    wAux := wAux - QTurnoControleQt_Hora_Parado.Value/24;
    if wAux < 0 Then
      Raise Exception.Create('Quantidade de horas trabalhadas inválida!');
  end; }
end;

procedure TDMTurno.QTurnoControleAfterEdit(DataSet: TDataSet);
begin
   DMBoletim.pProducao := True;
end;

procedure TDMTurno.QRAcompanhaCalcFields(DataSet: TDataSet);
Var wHoras,wMinutos_Trab,wMinutos_Parados : Real;
    a:Integer;
begin
  wHoras := 0;
  wMinutos_Trab := 0;
  wMinutos_Parados := 0;
  wHoras := Int(QRAcompanhasNum_Trabalhada.Value);
  wMinutos_Trab := Int(Frac(QRAcompanhasNum_Trabalhada.Value) * 100);
  wMinutos_Trab := wMinutos_Trab + wHoras * 60;
  wHoras := Int(QRAcompanhasNum_Parado.Value);
  wMinutos_Parados := Int(Frac(QRAcompanhasNum_Parado.Value) * 100);
  wMinutos_Parados :=   wMinutos_Parados + wHoras * 60;
  QRAcompanhaHora_Trabalhadas.Value := Int((wMinutos_Trab - wMinutos_Parados) / 60);
  a := ((StrToInt(FloatToStr(wMinutos_Trab)) - StrToInt(FloatToStr(wMinutos_Parados))) Mod 60);
  QRAcompanhaHora_Trabalhadas.Value := QRAcompanhaHora_Trabalhadas.Value + (a / 100);
end;

end.
