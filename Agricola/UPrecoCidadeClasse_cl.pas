unit UPrecoCidadeClasse_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMPrecoCidadeClasse = class(TDataModule)
    QPrecoCidadeClasse: TOracleDataSet1;
    QPrecoCidadeClasseCOD_PRECO_CIDADE_CLASSE: TIntegerField;
    QPrecoCidadeClasseCOD_CIDADE: TIntegerField;
    QPrecoCidadeClasseCOD_CLASSE: TIntegerField;
    QPrecoCidadeClasseDT_REFERENCIA: TDateTimeField;
    QPrecoCidadeClasseVAL_PRECO: TFloatField;
    QPrecoCidadeClasseCons: TOracleDataSet1;
    QPrecoCidadeClasseConsCOD_PRECO_CIDADE_CLASSE: TIntegerField;
    QPrecoCidadeClasseConsDT_REFERENCIA: TDateTimeField;
    QPrecoCidadeClasseConsVAL_PRECO: TFloatField;
    QPrecoCidadeClasseConsDESC_CIDADE: TStringField;
    QPrecoCidadeClasseConsDESC_CLASSE: TStringField;
    QRPrecoCidadeClasse: TOracleDataSet1;
    QRPrecoCidadeClasseCOD_PRECO_CIDADE_CLASSE: TIntegerField;
    QRPrecoCidadeClasseCOD_CIDADE: TIntegerField;
    QRPrecoCidadeClasseCOD_CLASSE: TIntegerField;
    QRPrecoCidadeClasseDT_REFERENCIA: TDateTimeField;
    QRPrecoCidadeClasseVAL_PRECO: TFloatField;
    QRPrecoCidadeClasseDESC_CIDADE: TStringField;
    QRPrecoCidadeClasseDESC_CLASSE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPrecoCidadeClasse: TDMPrecoCidadeClasse;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
