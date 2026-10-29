unit UTipoServico_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMTipoServico = class(TDataModule)
    QTipoServico: TOracleDataSet1;
    QTipoServicoCons: TOracleDataSet1;
    QRTipoServico: TOracleDataSet1;
    QTipoServicoCOD_TIPO_SERVICO: TStringField;
    QTipoServicoDESC_TIPO_SERVICO: TStringField;
    QTipoServicoConsCOD_TIPO_SERVICO: TStringField;
    QTipoServicoConsDESC_TIPO_SERVICO: TStringField;
    QRTipoServicoCOD_TIPO_SERVICO: TStringField;
    QRTipoServicoDESC_TIPO_SERVICO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTipoServico: TDMTipoServico;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
