unit UFuncao_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMFuncao = class(TDataModule)
    DSFuncao: TDataSource;
    DSModulo: TDataSource;
    QModulo: TOracleDataSet1;
    QTela: TOracleDataSet1;
    QFuncao: TOracleDataSet1;
    QFuncaoTela: TOracleDataSet1;
    QModuloCOD_MODULO: TIntegerField;
    QModuloNOME_MODULO: TStringField;
    QTelaDESC_TELA: TStringField;
    QFuncaoCOD_FUNCAO: TIntegerField;
    QFuncaoNUM_ITEM_MENU1: TIntegerField;
    QFuncaoNUM_ITEM_MENU2: TIntegerField;
    QFuncaoNOME_BOTAO: TStringField;
    QTelaNOME_TELA: TStringField;
    QFuncaoNOME_TELA: TStringField;
    DSTela: TDataSource;
    QModuloCons: TOracleDataSet1;
    QModuloConsCOD_MODULO: TIntegerField;
    QModuloConsNOME_MODULO: TStringField;
    QTelaCOD_MODULO: TIntegerField;
    QTelaDT_CADASTRO: TDateTimeField;
    QTelaIND_SITUACAO: TStringField;
    QTelaCOD_TELA: TIntegerField;
    QFuncaoNOME_FUNCAO: TStringField;
    QFuncaoTelaCOD_FUNCAO: TIntegerField;
    QFuncaoTelaNUM_ITEM_MENU2: TIntegerField;
    QFuncaoTelaNOME_FUNCAO: TStringField;
    QFuncaoTelaNUM_ITEM_MENU1: TIntegerField;
    QFuncaoTelaNOME_BOTAO: TStringField;
    QFuncaoTelaNOME_TELA: TStringField;
    QFuncaoCons: TOracleDataSet1;
    QFuncaoConsCOD_FUNCAO: TIntegerField;
    QFuncaoConsNOME_FUNCAO: TStringField;
    QFuncaoConsNUM_ITEM_MENU1: TIntegerField;
    QFuncaoConsNUM_ITEM_MENU2: TIntegerField;
    QFuncaoConsNOME_BOTAO: TStringField;
    QFuncaoConsNOME_TELA: TStringField;
    QFuncaoConsNOME_MODULO: TStringField;
    procedure QFuncaoAfterInsert(DataSet: TDataSet);
    procedure QFuncaoAfterPost(DataSet: TDataSet);
    procedure QTelaAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    fModulo : String;
  public
    { Public declarations }
    Property pModulo : String Read fModulo Write fModulo;
  end;

var
  DMFuncao: TDMFuncao;

implementation

uses UOracle_cl;

{$R *.DFM}


procedure TDMFuncao.QFuncaoAfterInsert(DataSet: TDataSet);
begin
  QFuncaoCod_Funcao.Value := DMOracle.Sequencia('FUNCAO');
  QFuncaoNome_Tela.Value := QTelaNome_Tela.Value;
end;

procedure TDMFuncao.QFuncaoAfterPost(DataSet: TDataSet);
begin
  QFuncao.Close;
  QFuncao.Open;
end;

procedure TDMFuncao.QTelaAfterPost(DataSet: TDataSet);
begin
  QTela.Close;
  QTela.Open;
end;

end.
