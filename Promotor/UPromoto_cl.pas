unit UPromoto_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMPromotor = class(TDataModule)
    QPromotor: TOracleDataSet1;
    QPromotorCOD_PROMOTOR: TIntegerField;
    QPromotorNOME: TStringField;
    QPromotorIND_SITUACAO: TStringField;
    QPromotorCOD_CIDADE: TIntegerField;
    QPromotorCons: TOracleDataSet1;
    QPromotorConsCOD_PROMOTOR: TIntegerField;
    QPromotorConsNOME: TStringField;
    QPromotorConsIND_SITUACAO: TStringField;
    QPromotorConsCOD_CIDADE: TIntegerField;
    QRPromotor: TOracleDataSet1;
    QRPromotorCOD_PROMOTOR: TIntegerField;
    QRPromotorNOME: TStringField;
    QRPromotorIND_SITUACAO: TStringField;
    QRPromotorDESC_CIDADE: TStringField;
    QReposicao: TOracleDataSet1;
    QReposicaoCOD_REPOSICAO: TIntegerField;
    QReposicaoCOD_PROMOTOR: TIntegerField;
    QReposicaoCOD_CADASTRO: TIntegerField;
    QReposicaoDESC_OBS: TStringField;
    QReposicaoDT_REPOSICAO: TDateTimeField;
    QReposicaoCons: TOracleDataSet1;
    QReposicaoConsCOD_REPOSICAO: TIntegerField;
    QReposicaoConsCOD_CADASTRO: TIntegerField;
    QReposicaoConsDT_REPOSICAO: TDateTimeField;
    QReposicaoConsCOD_PROMOTOR: TIntegerField;
    QReposicaoConsNOME_PROMOTOR: TStringField;
    QReposicaoConsNOME: TStringField;
    QRReposicao: TOracleDataSet1;
    QReposicaoQT_REPOSICAO: TIntegerField;
    QReposicaoConsQT_REPOSICAO: TIntegerField;
    QRReposicaoCOD_REPOSICAO: TIntegerField;
    QRReposicaoNOME: TStringField;
    QRReposicaoDESC_CIDADE: TStringField;
    QRReposicaoDT_REPOSICAO: TDateTimeField;
    QRReposicaoCOD_PROMOTOR: TIntegerField;
    QRReposicaoCOD_CADASTRO: TIntegerField;
    QRReposicaoNOME_PROMOTOR: TStringField;
    QRReposicaoQT_REPOSICAO: TIntegerField;
    QReposicaoMov: TOracleDataSet1;
    QReposicaoMovCOD_REPOSICAO_MOV: TIntegerField;
    QReposicaoMovCOD_PROMOTOR: TIntegerField;
    QReposicaoMovCOD_FILIAL: TIntegerField;
    QReposicaoMovCOD_HISTORICO_PROMOTOR: TIntegerField;
    QReposicaoMovVAL_MOVIMENTO: TFloatField;
    QReposicaoMovDT_MOVIMENTO: TDateTimeField;
    QReposicaoMovNUM_TITULO: TIntegerField;
    QReposicaoMovDESC_OBSERVACAO: TStringField;
    QReposicaoMovCons: TOracleDataSet1;
    QReposicaoMovConsCOD_REPOSICAO_MOV: TIntegerField;
    QReposicaoMovConsVAL_MOVIMENTO: TFloatField;
    QReposicaoMovConsDT_MOVIMENTO: TDateTimeField;
    QReposicaoMovConsNUM_TITULO: TIntegerField;
    QReposicaoMovConsDESC_OBSERVACAO: TStringField;
    QReposicaoMovConsDESC_FILIAL: TStringField;
    QReposicaoMovConsNOME: TStringField;
    QReposicaoMovConsDESC_HISTORICO_PROMOTOR: TStringField;
    QRReposicaoMov: TOracleDataSet1;
    QRReposicaoMovCOD_REPOSICAO_MOV: TIntegerField;
    QRReposicaoMovCOD_PROMOTOR: TIntegerField;
    QRReposicaoMovCOD_FILIAL: TIntegerField;
    QRReposicaoMovCOD_HISTORICO_PROMOTOR: TIntegerField;
    QRReposicaoMovVAL_MOVIMENTO: TFloatField;
    QRReposicaoMovDT_MOVIMENTO: TDateTimeField;
    QRReposicaoMovNUM_TITULO: TIntegerField;
    QRReposicaoMovDESC_OBSERVACAO: TStringField;
    QRReposicaoMovDESC_FILIAL: TStringField;
    QRReposicaoMovNOME: TStringField;
    QRReposicaoMovDESC_HISTORICO_PROMOTOR: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPromotor: TDMPromotor;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
