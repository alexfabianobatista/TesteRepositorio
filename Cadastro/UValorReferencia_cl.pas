unit UValorReferencia_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMValorReferencia = class(TDataModule)
    QValorReferenciaCad: TOracleDataSet1;
    QValorReferenciaCadCOD_VALOR_REFERENCIA: TIntegerField;
    QValorReferenciaCadQT_PRODUCAO_MEDIA: TIntegerField;
    QValorReferenciaCadQT_CUSTO_PRODUCAO: TIntegerField;
    QValorReferenciaCadQT_MANUTENCAO: TIntegerField;
    QValorReferenciaCadVAL_PRODUTO: TFloatField;
    QAtualiza_Limite: TOracleDataSet1;
    QAtualiza_LimiteCOD_CADASTRO: TIntegerField;
    QAtualiza_LimitePERC_EQUIPAMENTO: TFloatField;
    QAtualiza_LimiteQT_ARRENDAMENTO: TFloatField;
    QAtualiza_LimiteQT_AREATOTAL: TFloatField;
    QValorReferenciaCadQT_COLHEITA: TIntegerField;
    QAtualiza_LimiteQT_ARRENDADA: TFloatField;
    QAtualiza_LimiteQT_PROPRIA: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMValorReferencia: TDMValorReferencia;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
