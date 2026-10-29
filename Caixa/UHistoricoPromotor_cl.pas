unit UHistoricoPromotor_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMHistoricoPromotor = class(TDataModule)
    QHistoricoPromotor: TOracleDataSet1;
    QHistoricoPromotorCOD_HISTORICO_PROMOTOR: TIntegerField;
    QHistoricoPromotorDESC_HISTORICO_PROMOTOR: TStringField;
    QHistoricoPromotorIND_OPERACAO: TStringField;
    QHistoricoPromotorIND_SITUACAO: TStringField;
    QHistoricoPromotorCons: TOracleDataSet1;
    QHistoricoPromotorConsCOD_HISTORICO_PROMOTOR: TIntegerField;
    QHistoricoPromotorConsDESC_HISTORICO_PROMOTOR: TStringField;
    QHistoricoPromotorConsIND_OPERACAO: TStringField;
    QHistoricoPromotorConsIND_SITUACAO: TStringField;
    QRHistoricoPromotor: TOracleDataSet1;
    QRHistoricoPromotorCOD_HISTORICO_PROMOTOR: TIntegerField;
    QRHistoricoPromotorDESC_HISTORICO_PROMOTOR: TStringField;
    QRHistoricoPromotorIND_OPERACAO: TStringField;
    QRHistoricoPromotorIND_SITUACAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMHistoricoPromotor: TDMHistoricoPromotor;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
