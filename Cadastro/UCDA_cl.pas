unit UCDA_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMCDA = class(TDataModule)
    QCDA: TOracleDataSet1;
    QCDACOD_CDA: TIntegerField;
    QCDANUM_CDA: TStringField;
    QCDACOD_CIDADE: TIntegerField;
    QCDADESC_BAIRRO: TStringField;
    QCDADESC_MATRICULA: TStringField;
    QCDADESC_CARTORIO: TStringField;
    QCDADESC_ENDERECO: TStringField;
    QCDACons: TOracleDataSet1;
    QCDAConsCOD_CDA: TIntegerField;
    QCDAConsNUM_CDA: TStringField;
    QCDAConsDESC_BAIRRO: TStringField;
    QCDAConsDESC_MATRICULA: TStringField;
    QCDAConsDESC_CARTORIO: TStringField;
    QCDAConsDESC_ENDERECO: TStringField;
    QCDAConsDESC_CIDADE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCDA: TDMCDA;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
