unit UApolice_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMApolice = class(TDataModule)
    QApolice: TOracleDataSet1;
    QApoliceCOD_APOLICE: TIntegerField;
    QApoliceCOD_PATRIMONIO_CAB: TIntegerField;
    QApoliceNUM_APOLICE: TFloatField;
    QApoliceDESC_SEGURADORA: TStringField;
    QApoliceDESC_FONE_SEGURADORA: TStringField;
    QApoliceDESC_CORRETORA: TStringField;
    QApoliceDESC_FONE_CORRETORA: TStringField;
    QApoliceDT_VIGENCIA_INICIO: TDateTimeField;
    QApoliceDT_VIGENCIA_FIM: TDateTimeField;
    QApoliceVAL_PREMIO: TFloatField;
    QApoliceDESC_ENDOSSO: TStringField;
    QApoliceRisco: TOracleDataSet1;
    QApoliceRiscoCOD_APOLICE_RISCO: TIntegerField;
    QApoliceRiscoCOD_APOLICE: TIntegerField;
    QApoliceRiscoDESC_RISCO: TStringField;
    QApoliceRiscoVAL_RISCO: TFloatField;
    QApoliceCons: TOracleDataSet1;
    QApoliceConsCOD_APOLICE: TIntegerField;
    QApoliceConsCOD_PATRIMONIO_CAB: TIntegerField;
    QApoliceConsNUM_APOLICE: TFloatField;
    QApoliceConsDESC_SEGURADORA: TStringField;
    QApoliceConsDESC_FONE_SEGURADORA: TStringField;
    QApoliceConsDESC_CORRETORA: TStringField;
    QApoliceConsDESC_FONE_CORRETORA: TStringField;
    QApoliceConsDT_VIGENCIA_INICIO: TDateTimeField;
    QApoliceConsDT_VIGENCIA_FIM: TDateTimeField;
    QApoliceConsVAL_PREMIO: TFloatField;
    QApoliceConsDESC_ENDOSSO: TStringField;
    QRApolice: TOracleDataSet1;
    QRApoliceNUM_APOLICE: TFloatField;
    QRApoliceDESC_SEGURADORA: TStringField;
    QRApoliceDESC_PATRIMONIO: TStringField;
    QRApoliceDESC_RISCO: TStringField;
    QRApoliceVAL_RISCO: TFloatField;
    QRApoliceCOD_APOLICE: TIntegerField;
    QRApoliceDT_VIGENCIA_INICIO: TDateTimeField;
    QRApoliceDT_VIGENCIA_FIM: TDateTimeField;
    QRApoliceVencimento: TOracleDataSet1;
    QRApoliceVencimentoDESC_SEGURADORA: TStringField;
    QRApoliceVencimentoDESC_FONE_SEGURADORA: TStringField;
    QRApoliceVencimentoDT_VIGENCIA_FIM: TDateTimeField;
    QRApoliceVencimentoDESC_PATRIMONIO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMApolice: TDMApolice;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
