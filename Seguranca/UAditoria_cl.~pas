unit UAditoria_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMAuditoria = class(TDataModule)
    QRAuditoria: TOracleDataSet1;
    QRAuditoriaCOD_USUARIO: TIntegerField;
    QRAuditoriaDT_AUDIT: TDateTimeField;
    QRAuditoriaNOME_TABELA: TStringField;
    QRAuditoriaIND_OPERACAO: TStringField;
    QRAuditoriaDESC_CAMPO01: TStringField;
    QRAuditoriaDESC_VALOR01: TStringField;
    QRAuditoriaDESC_CAMPO02: TStringField;
    QRAuditoriaDESC_VALOR02: TStringField;
    QRAuditoriaDESC_CAMPO03: TStringField;
    QRAuditoriaDESC_VALOR03: TStringField;
    QRAuditoriaDESC_CAMPO04: TStringField;
    QRAuditoriaDESC_VALOR04: TStringField;
    QRAuditoriaDESC_CAMPO05: TStringField;
    QRAuditoriaDESC_VALOR05: TStringField;
    QRAuditoriaUSUARIO: TStringField;
    QAuditoriaCons: TOracleDataSet1;
    QAuditoriaConsDT_LOG: TDateTimeField;
    QAuditoriaConsDESC_NOME_CAMPO: TStringField;
    QAuditoriaConsDESC_NOME_TABELA: TStringField;
    QAuditoriaConsDESC_VALOR_NOVO: TStringField;
    QAuditoriaConsDESC_VALOR_ANTIGO: TStringField;
    QAuditoriaConsCOD_USUARIO: TIntegerField;
    QAuditoriaConsDESC_OPERACAO: TStringField;
    QAuditoriaConsCOD_CHAVE_PRIMARIA: TIntegerField;
    QAuditoriaConsNOME: TStringField;
    QRConfereBaixaCr: TOracleDataSet1;
    QRConfereBaixaCrCOD_DEPARTAMENTO: TIntegerField;
    QRConfereBaixaCrCOD_USUARIO: TIntegerField;
    QRConfereBaixaCrCOD_FILIAL: TIntegerField;
    QRConfereBaixaCrDT_MOVIMENTO: TDateTimeField;
    QRConfereBaixaCrVAL_MOVIMENTO: TFloatField;
    QRConfereBaixaCrNUMTITULPARCELA: TStringField;
    QRConfereBaixaCrCOD_CADASTRO: TIntegerField;
    QRConfereBaixaCrCOD_NOTA_CAB: TIntegerField;
    QRConfereBaixaCrCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRConfereBaixaCrDT_CAPITALIZACAO: TDateTimeField;
    QRConfereBaixaCrDT_USUARIO: TDateTimeField;
    QRConfereBaixaCrDESC_DEPARTAMENTO: TStringField;
    QRConfereBaixaCrOBSMOV: TStringField;
    QRConfereBaixaCrDESC_OBS: TStringField;
    QRConfereBaixaCrOBSCAB: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAuditoria: TDMAuditoria;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
