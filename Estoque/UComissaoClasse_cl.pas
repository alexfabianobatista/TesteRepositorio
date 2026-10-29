unit UComissaoClasse_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMComissaoClasse = class(TDataModule)
    QComissaoClasseCons: TOracleDataSet1;
    QComissaoClasseConsCOD_COMISSAO_CLASSE: TIntegerField;
    QComissaoClasseConsCOD_CLASSE: TIntegerField;
    QComissaoClasseConsCOD_VENDEDOR: TIntegerField;
    QComissaoClasseConsPERC_COMISSAO: TFloatField;
    QComissaoClasseConsNOME: TStringField;
    QComissaoClasseConsDESC_CLASSE: TStringField;
    QComissaoClasse: TOracleDataSet1;
    QComissaoClasseCOD_COMISSAO_CLASSE: TIntegerField;
    QComissaoClasseCOD_CLASSE: TIntegerField;
    QComissaoClasseCOD_VENDEDOR: TIntegerField;
    QComissaoClassePERC_COMISSAO: TFloatField;
    QComissaoClassedesc_classe: TStringField;
    QComissaoClassedesc_vendedor: TStringField;
    QRComissaoClasse: TOracleDataSet1;
    QRComissaoClasseCOD_COMISSAO_CLASSE: TIntegerField;
    QRComissaoClasseCOD_CLASSE: TIntegerField;
    QRComissaoClasseCOD_VENDEDOR: TIntegerField;
    QRComissaoClassePERC_COMISSAO: TFloatField;
    QRComissaoClasseNOME: TStringField;
    QRComissaoClasseDESC_CLASSE: TStringField;
    QComissaoClasseQT_ATE: TIntegerField;
    QComissaoClassePERC_COMISSAO1: TFloatField;
    QComissaoClasseQT_ATE1: TIntegerField;
    QComissaoClassePERC_COMISSAO2: TFloatField;
    QComissaoClasseQT_ATE2: TIntegerField;
    QComissaoClasseConsQT_ATE: TIntegerField;
    QComissaoClasseConsPERC_COMISSAO1: TFloatField;
    QComissaoClasseConsQT_ATE1: TIntegerField;
    QComissaoClasseConsPERC_COMISSAO2: TFloatField;
    QComissaoClasseConsQT_ATE2: TIntegerField;
    procedure QComissaoClasseCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMComissaoClasse: TDMComissaoClasse;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMComissaoClasse.QComissaoClasseCalcFields(DataSet: TDataSet);
begin
  QComissaoClassedesc_classe.value:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','COD_CLASSE='+FloattoStr(QComissaoClasseCod_Classe.value));
  QComissaoClassedesc_vendedor.value:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR='+FloattoStr(QComissaoClasseCod_Vendedor.value));
end;

end.
