unit UInventarioMes_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMInventarioMes = class(TDataModule)
    QInventarioMes_Cad: TOracleDataSet1;
    QInventarioMes_CadCOD_FILIAL: TIntegerField;
    QInventarioMes_CadCOD_PRODUTO: TFloatField;
    QInventarioMes_CadCOD_LOTE_TIPO: TIntegerField;
    QInventarioMes_CadVL_CUSTO_MEDIO: TFloatField;
    QInventarioMes_CadNUM_ANO: TIntegerField;
    QInventarioMes_CadNUM_MES: TIntegerField;
    QInventarioMes_Cons: TOracleDataSet1;
    QInventarioMes_ConsCOD_PRODUTO: TFloatField;
    QInventarioMes_ConsCOD_LOTE_TIPO: TIntegerField;
    QInventarioMes_ConsVL_CUSTO_MEDIO: TFloatField;
    QInventarioMes_ConsQT_QUANTIDADE: TFloatField;
    QInventarioMes_ConsNUM_ANO: TIntegerField;
    QInventarioMes_ConsNUM_MES: TIntegerField;
    QInventarioMes_ConsDESC_PRODUTO: TStringField;
    QInventarioMes_ConsCOD_FILIAL: TIntegerField;
    QInventarioMes_ConsCOD_ESTOQUE_INVENTARIO: TIntegerField;
    QRInventarioMes: TOracleDataSet1;
    QRInventarioMesCOD_ESTOQUE_INVENTARIO: TIntegerField;
    QRInventarioMesCOD_FILIAL: TIntegerField;
    QRInventarioMesCOD_LOTE_TIPO: TIntegerField;
    QRInventarioMesVL_CUSTO_MEDIO: TFloatField;
    QRInventarioMesQT_QUANTIDADE: TFloatField;
    QRInventarioMesNUM_ANO: TIntegerField;
    QRInventarioMesNUM_MES: TIntegerField;
    QRInventarioMesDESC_PRODUTO: TStringField;
    QRInventarioMesNUM_GENERO_NCM: TStringField;
    QRInventarioMesCOD_PRODUTO: TStringField;
    QRInventarioMesIND_SITUACAO: TStringField;
    QInventarioMes_ConsIND_TIPO_PRODUTO: TStringField;
    QInventarioMes_CadQT_QUANTIDADE: TFloatField;
    QInventarioMes_CadCOD_ESTOQUE_INVENTARIO: TIntegerField;
    QInventarioMes_CadDT_REGISTRO: TDateTimeField;
    QRInventarioMesDESC_UNIDADE: TStringField;
    QInventarioMes_CadCOD_USUARIO: TIntegerField;
    QInventarioMes_ConsCOD_USUARIO: TIntegerField;
    QRInventarioMesCOD_USUARIO: TIntegerField;
    procedure QInventarioMes_CadBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMInventarioMes: TDMInventarioMes;

implementation

uses UOracle_cl, UUsuario_cl;

{$R *.dfm}

procedure TDMInventarioMes.QInventarioMes_CadBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QInventarioMes_CadCOD_FILIAL.Text);
  QInventarioMes_CadCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

end.
