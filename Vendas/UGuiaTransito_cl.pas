unit UGuiaTransito_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMGuiaTransito = class(TDataModule)
    QGuiaTransito_Cad: TOracleDataSet1;
    QGuiaTransito_CadCOD_GUIA_TRANSITO: TIntegerField;
    QGuiaTransito_CadCOD_NOTA_CAB: TIntegerField;
    QGuiaTransito_CadDESC_CONSIGNATARIO: TStringField;
    QGuiaTransito_CadDESC_HORA: TStringField;
    QGuiaTransito_CadDESC_DESTINO: TStringField;
    QGuiaTransito_CadDESC_LACRE: TStringField;
    QGuiaTransito_CadDESC_TEMPERATURA: TStringField;
    QGuiaTransito_CadNUM_GUIA_TRANSITO: TIntegerField;
    QGuiaTransito_CadCOD_SERIE: TStringField;
    QGuiaTransito_Itens: TOracleDataSet1;
    QGuiaTransito_ItensDESC_CLASSE: TStringField;
    QGuiaTransito_ItensSQT_PESO: TFloatField;
    QGuiaTransito_ItensSNUM_VOLUMES: TFloatField;
    QGuiaTransito_CadDT_EMISSAO: TDateTimeField;
    QGuiaTransito_Cons: TOracleDataSet1;
    QGuiaTransito_ConsCOD_GUIA_TRANSITO: TIntegerField;
    QGuiaTransito_ConsCOD_NOTA_CAB: TIntegerField;
    QGuiaTransito_ConsDESC_CONSIGNATARIO: TStringField;
    QGuiaTransito_ConsDESC_HORA: TStringField;
    QGuiaTransito_ConsDESC_DESTINO: TStringField;
    QGuiaTransito_ConsDESC_LACRE: TStringField;
    QGuiaTransito_ConsDESC_TEMPERATURA: TStringField;
    QGuiaTransito_ConsNUM_GUIA_TRANSITO: TIntegerField;
    QGuiaTransito_ConsCOD_SERIE: TStringField;
    QGuiaTransito_ConsDT_EMISSAO: TDateTimeField;
    QGuiaTransito_ItensDESC_UNIDADE: TStringField;
    QGuiaTransito_CadDESC_OBS1: TStringField;
    QGuiaTransito_CadDESC_OBS2: TStringField;
    QGuiaTransito_CadDESC_OBS3: TStringField;
    QGuiaTransito_Itens2: TOracleDataSet1;
    QGuiaTransito_Itens2DESC_PRODUTO: TStringField;
    QGuiaTransito_Itens2DESC_UNIDADE: TStringField;
    QGuiaTransito_Itens2QT_PESO: TFloatField;
    QGuiaTransito_Itens2NUM_VOLUMES: TIntegerField;
    procedure QGuiaTransito_CadAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMGuiaTransito: TDMGuiaTransito;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TDMGuiaTransito.QGuiaTransito_CadAfterInsert(DataSet: TDataSet);
begin
  QGuiaTransito_CadDt_Emissao.Value := Date;
  QGuiaTransito_CadCod_Serie.Value := '1';
end;

end.
