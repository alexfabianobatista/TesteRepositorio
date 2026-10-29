unit USuino_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDmSuino = class(TDataModule)
    QSuinoDespesa: TOracleDataSet1;
    QSuinoDespesaCons: TOracleDataSet1;
    QSuinoDespesaConsCOD_SUINO_DESPESA: TIntegerField;
    QSuinoDespesaConsCOD_CADASTRO: TIntegerField;
    QSuinoDespesaConsCOD_HISTORICO: TIntegerField;
    QSuinoDespesaConsDT_DESPESA: TDateTimeField;
    QSuinoDespesaConsVAL_DESPESA: TFloatField;
    QSuinoDespesaConsDESC_OBS: TStringField;
    QSuinoDespesaConsNOME: TStringField;
    QSuinoDespesaConsDESC_HISTORICO: TStringField;
    QSuinoDespesaCOD_SUINO_DESPESA: TIntegerField;
    QSuinoDespesaCOD_CADASTRO: TIntegerField;
    QSuinoDespesaCOD_HISTORICO: TIntegerField;
    QSuinoDespesaDT_DESPESA: TDateTimeField;
    QSuinoDespesaVAL_DESPESA: TFloatField;
    QSuinoDespesaDESC_OBS: TStringField;
    QSobra: TOracleDataSet1;
    QSobraCons: TOracleDataSet1;
    QSobraCOD_SUINO_SOBRA_PRODUTO: TIntegerField;
    QSobraCOD_CADASTRO: TIntegerField;
    QSobraCOD_PRODUTO: TFloatField;
    QSobraQT_SOBRA: TFloatField;
    QSobraVAL_CUSTO: TFloatField;
    QSobraDT_SOBRA: TDateTimeField;
    QSobraIND_TIPO: TStringField;
    QSobraConsCOD_SUINO_SOBRA_PRODUTO: TIntegerField;
    QSobraConsCOD_CADASTRO: TIntegerField;
    QSobraConsCOD_PRODUTO: TFloatField;
    QSobraConsQT_SOBRA: TFloatField;
    QSobraConsVAL_CUSTO: TFloatField;
    QSobraConsDT_SOBRA: TDateTimeField;
    QSobraConsIND_TIPO: TStringField;
    QSobraConsNOME: TStringField;
    QSobraConsDESC_PRODUTO: TStringField;
    QRReceitaDespesa: TOracleDataSet1;
    QRReceitaDespesaNUM_NOTA: TFloatField;
    QRReceitaDespesaDT_RECEBIMENTO: TDateTimeField;
    QRReceitaDespesaCOD_PRODUTO: TFloatField;
    QRReceitaDespesaDESC_PRODUTO: TStringField;
    QRReceitaDespesaCOD_CADASTRO: TFloatField;
    QRReceitaDespesaNOME: TStringField;
    QRReceitaDespesaQT_QUANTIDADE: TFloatField;
    QRReceitaDespesaNUM_CABECAS: TFloatField;
    QRReceitaDespesaVAL_UNITARIO: TFloatField;
    QRReceitaDespesaVAL_TOTAL: TFloatField;
    QRReceitaDespesaDESC_TIPO: TStringField;
    QRReceitaDespesaIND_TIPO_PRODUTO: TStringField;
    procedure QSobraAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmSuino: TDmSuino;

implementation

{$R *.dfm}

procedure TDmSuino.QSobraAfterInsert(DataSet: TDataSet);
begin
  QSobraIND_TIPO.Value := 'E';
end;

end.
