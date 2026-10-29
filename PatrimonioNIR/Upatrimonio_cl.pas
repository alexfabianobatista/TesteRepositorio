unit Upatrimonio_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMPatrimonio = class(TDataModule)
    QPatrimonio: TOracleDataSet1;
    QPatrimonioCOD_PATRIMONIO: TIntegerField;
    QPatrimonioCOD_FILIAL: TIntegerField;
    QPatrimonioCOD_DEPARTAMENTO: TIntegerField;
    QPatrimonioDT_AQUISICAO: TDateTimeField;
    QPatrimonioVL_PAGO: TFloatField;
    QPatrimonioDT_INICIO_ATIVIDADE: TDateTimeField;
    QPatrimonioDESC_GARANTIAS: TStringField;
    QPatrimonioCOD_CADASTRO: TIntegerField;
    QPatrimonioNR_SERIE: TStringField;
    QPatrimonioANO_FABRICACAO: TIntegerField;
    QPatrimonioCOD_USUARIO: TIntegerField;
    QPatrimonioIND_SITUACAO: TStringField;
    QPatrimonioDESC_PATRIMONIO: TStringField;
    QPatrimonio_Item: TOracleDataSet1;
    QPatrimoniodepartamento: TStringField;
    QPatrimoniofilial: TStringField;
    QPatrimoniousuario: TStringField;
    QPatrimoniocadastro: TStringField;
    QPatrimonio_Itemnome_fabricante: TStringField;
    QPatrimonio_Cons: TOracleDataSet1;
    QPatrimonio_ConsCOD_PATRIMONIO: TIntegerField;
    QPatrimonio_ConsCOD_FILIAL: TIntegerField;
    QPatrimonio_ConsCOD_DEPARTAMENTO: TIntegerField;
    QPatrimonio_ConsDT_AQUISICAO: TDateTimeField;
    QPatrimonio_ConsVL_PAGO: TFloatField;
    QPatrimonio_ConsDT_INICIO_ATIVIDADE: TDateTimeField;
    QPatrimonio_ConsDESC_GARANTIAS: TStringField;
    QPatrimonio_ConsCOD_CADASTRO: TIntegerField;
    QPatrimonio_ConsNR_SERIE: TStringField;
    QPatrimonio_ConsANO_FABRICACAO: TIntegerField;
    QPatrimonio_ConsCOD_USUARIO: TIntegerField;
    QPatrimonio_ConsIND_SITUACAO: TStringField;
    QPatrimonio_ConsDESC_PATRIMONIO: TStringField;
    QRPatrimonio: TOracleDataSet1;
    QRPatrimonioCOD_PATRIMONIO: TIntegerField;
    QRPatrimonioDESC_PATRIMONIO: TStringField;
    QRPatrimonioDT_AQUISICAO: TDateTimeField;
    QRPatrimonioCOD_CADASTRO: TIntegerField;
    QRPatrimonioCOD_USUARIO: TIntegerField;
    QRPatrimonioNOME_FABRICANTE: TStringField;
    QRPatrimonioUSUARIO: TStringField;
    QRPatrimonioFicha: TOracleDataSet1;
    QRPatrimonioFichaCOD_PATRIMONIO: TIntegerField;
    QRPatrimonioFichaDESC_PATRIMONIO: TStringField;
    QRPatrimonioFichaDT_AQUISICAO: TDateTimeField;
    QRPatrimonioFichaCOD_CADASTRO: TIntegerField;
    QRPatrimonioFichaCOD_USUARIO: TIntegerField;
    QRPatrimonioFichaNOME_FABRICANTE: TStringField;
    QRPatrimonioFichaUSUARIO: TStringField;
    QRPatrimonioFichaDESC_PATRIMONIO_ITEM: TStringField;
    QPatrimonio_ItemCOD_PATRIMONIO: TIntegerField;
    QPatrimonio_ItemCOD_PATRIMONIO_ITEM: TStringField;
    QPatrimonio_ItemNUM_DIAS_MANUTENCAO: TIntegerField;
    QPatrimonio_ItemDESC_PATRIMONIO_ITEM: TStringField;
    QPatrimonio_ItemCOD_TIPO_EQUIPAMENTO: TStringField;
    QPatrimonio_Itemdesc_tipo_equipamento: TStringField;
    QCaracteristicas_All: TOracleDataSet1;
    QCaracteristicas_AllCOD_TIPO_EQUIPAMENTO: TStringField;
    QCaracteristicas_AllCOD_TIPO_EQUIPAMENTO_CARAC: TIntegerField;
    QCaracteristicas_AllDESC_TIPO_EQUIPAMENTO_CARAC: TStringField;
    DSCaracateristicas_All: TDataSource;
    QPatrimonio_Caracteristicas: TOracleDataSet1;
    DSPatrimonio_Caracteristicas: TDataSource;
    QPatrimonio_CaracteristicasCOD_PATRIMONIO: TIntegerField;
    QPatrimonio_CaracteristicasCOD_PATRIMONIO_ITEM: TStringField;
    QPatrimonio_CaracteristicasCOD_TIPO_EQUIPAMENTO_CARAC: TIntegerField;
    QPatrimonio_Item_Carac: TOracleDataSet1;
    QPatrimonio_Item_CaracCOD_PATRIMONIO: TIntegerField;
    QPatrimonio_Item_CaracCOD_PATRIMONIO_ITEM: TStringField;
    QPatrimonio_Item_CaracCOD_TIPO_EQUIPAMENTO_CARAC: TIntegerField;
    QRPatrimonioFichaCOD_PATRIMONIO_ITEM: TStringField;
    QPatrimonio_CaracteristicasDESC_CONTEUDO: TStringField;
    QPatrimonio_Item_CaracDESC_CONTEUDO: TStringField;
    QPatrimonio_ItemDESC_OBSERVACAO: TStringField;
    QPatrimonio_ItemDESC_COMPLEMENTO: TStringField;
    QPatrimonio_ItemDESC_COMPLEMENTO1: TStringField;
    QPatrimonio_Item_Cons: TOracleDataSet1;
    QPatrimonio_Item_ConsCOD_PATRIMONIO: TIntegerField;
    QPatrimonio_Item_ConsCOD_PATRIMONIO_ITEM: TStringField;
    QPatrimonio_Item_ConsDESC_PATRIMONIO_ITEM: TStringField;
    QPatrimonio_Item_ConsNUM_DIAS_MANUTENCAO: TIntegerField;
    QPatrimonio_Item_ConsCOD_TIPO_EQUIPAMENTO: TStringField;
    QPatrimonio_Item_ConsDESC_OBSERVACAO: TStringField;
    QPatrimonio_Item_ConsDESC_COMPLEMENTO: TStringField;
    QPatrimonio_Item_ConsDESC_COMPLEMENTO1: TStringField;
    QPatrimonioVAL_ATUAL: TFloatField;
    QRPatrimonioFichaDESC_CONTEUDO: TStringField;
    QRPatrimonioFichaDESC_TIPO_EQUIPAMENTO_CARAC: TStringField;
    procedure QPatrimonioCalcFields(DataSet: TDataSet);
    procedure QPatrimonio_ItemAfterInsert(DataSet: TDataSet);
    procedure QPatrimonio_ItemCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPatrimonio: TDMPatrimonio;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMPatrimonio.QPatrimonioCalcFields(DataSet: TDataSet);
begin
  QPatrimoniodepartamento.Value := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+FloatToStr(QPatrimonioCod_Departamento.Value));
  QPatrimoniofilial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QPatrimonioCod_Filial.Value));
  QPatrimoniousuario.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO = '+FloatToStr(QPatrimonioCod_Usuario.Value));
  QPatrimoniocadastro.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QPatrimonioCod_Cadastro.Value));

end;

procedure TDMPatrimonio.QPatrimonio_ItemAfterInsert(DataSet: TDataSet);
begin
  QPatrimonio_ItemCod_Patrimonio.Value := QPatrimonioCod_Patrimonio.Value;
end;

procedure TDMPatrimonio.QPatrimonio_ItemCalcFields(DataSet: TDataSet);
begin
  QPatrimonio_ItemDesc_Tipo_Equipamento.Value := DMOracle.BuscaNome('SELECT DESC_TIPO_EQUIPAMENTO FROM TB_TIPO_EQUIPAMENTO','COD_TIPO_EQUIPAMENTO = '+CHR(39)+QPatrimonio_ItemCod_Tipo_Equipamento.Text+CHR(39));
end;

end.
