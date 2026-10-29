unit USiscredi_Cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMSiscredi = class(TDataModule)
    QSiscredi: TOracleDataSet1;
    QSiscrediNUM_CGC: TStringField;
    QSiscrediDESC_INSCRICAO: TStringField;
    QSiscrediNUM_NOTA: TIntegerField;
    QSiscrediCOD_SERIE: TStringField;
    QSiscrediDT_EMISSAO: TDateTimeField;
    QSiscrediNAT_OPERACAO: TFloatField;
    QSiscrediVAL_TOTAL: TFloatField;
    QSiscrediVAL_ICM_BASE: TFloatField;
    QSiscrediCOD_NBM_SH: TStringField;
    QSiscrediDESC_PRODUTO: TStringField;
    QSiscrediNUM_CGC_CPF: TStringField;
    QSiscrediNUM_INSCRICAO: TStringField;
    QSiscrediNOME: TStringField;
    QSiscrediDESC_CIDADE: TStringField;
    QSiscrediCOD_ESTADO: TStringField;
    QSiscrediNUM_DESPACHO_EXPORTACAO: TFloatField;
    QSiscrediDESC_MEMORANDO_EXPORTACAO: TStringField;
    QSiscrediVAL_DESPESAS: TFloatField;
    QSiscrediVAL_DESCONTO: TFloatField;
    QSiscrediVAL_FUNRURAL: TFloatField;
    QSiscrediVAL_IPI: TFloatField;
    QSiscredival_contabil: TFloatField;
    QSiscrediIND_FISICA_JURIDICA: TStringField;
    procedure QSiscrediCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMSiscredi: TDMSiscredi;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMSiscredi.QSiscrediCalcFields(DataSet: TDataSet);
begin
  QSisCrediVal_Contabil.Value := QSisCrediVAl_Total.Value + QSisCrediVal_Despesas.Value - QSisCrediVal_Desconto.Value + QSisCrediVal_IPI.Value + QSisCrediVal_Funrural.Value;
end;

end.
