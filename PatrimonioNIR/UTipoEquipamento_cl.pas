unit UTipoEquipamento_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMTipoEquipamento = class(TDataModule)
    QTipoEquipamento: TOracleDataSet1;
    QTipoEquipamentoCOD_TIPO_EQUIPAMENTO: TStringField;
    QTipoEquipamentoDESC_TIPO_EQUIPAMENTO: TStringField;
    QTipoEquipamentoCons: TOracleDataSet1;
    QTipoEquipamentoConsCOD_TIPO_EQUIPAMENTO: TStringField;
    QTipoEquipamentoConsDESC_TIPO_EQUIPAMENTO: TStringField;
    QRTipoEQuipamento: TOracleDataSet1;
    QRTipoEQuipamentoCOD_TIPO_EQUIPAMENTO: TStringField;
    QRTipoEQuipamentoDESC_TIPO_EQUIPAMENTO: TStringField;
    QTipoEquipamentoCarac: TOracleDataSet1;
    QTipoEquipamentoCaracCOD_TIPO_EQUIPAMENTO: TStringField;
    QTipoEquipamentoCaracCOD_TIPO_EQUIPAMENTO_CARAC: TIntegerField;
    QTipoEquipamentoCaracDESC_TIPO_EQUIPAMENTO_CARAC: TStringField;
    QTipoEquipamentoCaracdesc_tipo_equipamento: TStringField;
    QTipoEquipamentoCarac_Grid: TOracleDataSet1;
    QTipoEquipamentoCarac_GridCOD_TIPO_EQUIPAMENTO: TStringField;
    QTipoEquipamentoCarac_GridCOD_TIPO_EQUIPAMENTO_CARAC: TIntegerField;
    QTipoEquipamentoCarac_GridDESC_TIPO_EQUIPAMENTO_CARAC: TStringField;
    DSTipoEquipamentoCarac_Grid: TDataSource;
    QTipoEquipamentoCarac_Cons: TOracleDataSet1;
    QTipoEquipamentoCarac_ConsCOD_TIPO_EQUIPAMENTO: TStringField;
    QTipoEquipamentoCarac_ConsCOD_TIPO_EQUIPAMENTO_CARAC: TIntegerField;
    QTipoEquipamentoCarac_ConsDESC_TIPO_EQUIPAMENTO_CARAC: TStringField;
    QRTipoEquipamentoCarac: TOracleDataSet1;
    QRTipoEquipamentoCaracDESC_TIPO_EQUIPAMENTO: TStringField;
    QRTipoEquipamentoCaracCOD_TIPO_EQUIPAMENTO: TStringField;
    QRTipoEquipamentoCaracCOD_TIPO_EQUIPAMENTO_CARAC: TIntegerField;
    QRTipoEquipamentoCaracDESC_TIPO_EQUIPAMENTO_CARAC: TStringField;
    procedure QTipoEquipamentoCaracCalcFields(DataSet: TDataSet);
    procedure QTipoEquipamentoCaracBeforePost(DataSet: TDataSet);
    procedure QTipoEquipamentoCaracAfterPost(DataSet: TDataSet);
    procedure QTipoEquipamentoCaracAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTipoEquipamento: TDMTipoEquipamento;
  wTipo_Equipamento : String;
implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMTipoEquipamento.QTipoEquipamentoCaracCalcFields(
  DataSet: TDataSet);
begin
  QTipoEquipamentoCaracDesc_Tipo_Equipamento.Value := DMOracle.BuscaNome('SELECT DESC_TIPO_EQUIPAMENTO FROM TB_TIPO_EQUIPAMENTO','COD_TIPO_EQUIPAMENTO = '+CHR(39)+QTipoEquipamentoCaracCod_Tipo_Equipamento.Text+CHR(39));
end;

procedure TDMTipoEquipamento.QTipoEquipamentoCaracBeforePost(
  DataSet: TDataSet);
Var wNada : String;
begin
  If QTipoEquipamentoCaracCod_Tipo_equipamento_Carac.Text = '' Then
  Begin
     wNada := DMOracle.BuscaNome('SELECT MAX(Cod_Tipo_equipamento_Carac) FROM TB_TIPO_EQUIPAMENTO_CARAC','COD_TIPO_EQUIPAMENTO = '+CHR(39)+QTipoEquipamentoCaracCod_Tipo_Equipamento.Text+CHR(39));
     If wNada <> '' Then
        QTipoEquipamentoCaracCod_Tipo_equipamento_Carac.Value := StrToInt(wNada) + 1
     Else
        QTipoEquipamentoCaracCod_Tipo_equipamento_Carac.Value := 1;
  End;
end;

procedure TDMTipoEquipamento.QTipoEquipamentoCaracAfterPost(
  DataSet: TDataSet);
Var wCodigo : Integer;
    wTipo : String;
begin
  wCodigo := QTipoEquipamentoCaracCod_Tipo_Equipamento_Carac.Value;
  wTipo := QTipoEquipamentoCaracCod_Tipo_Equipamento.Value;
  QTipoEquipamentoCarac.Close;
  QTipoEquipamentoCarac.SetVariable('COD_TIPO_EQUIPAMENTO_CARAC',wCodigo);
  QTipoEquipamentoCarac.SetVariable('COD_TIPO_EQUIPAMENTO',wTipo);
  QTipoEquipamentoCarac.Open;
  wTipo_Equipamento := QTipoEquipamentoCaracCod_Tipo_Equipamento.Value;
end;

procedure TDMTipoEquipamento.QTipoEquipamentoCaracAfterInsert(
  DataSet: TDataSet);
begin
  QTipoEquipamentoCaracCod_Tipo_Equipamento.Value := wTipo_Equipamento;

end;

end.
