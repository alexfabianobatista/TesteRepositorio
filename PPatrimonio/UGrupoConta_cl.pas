unit UGrupoConta_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMGrupoConta = class(TDataModule)
    QGrupoConta: TOracleDataSet1;
    QGrupoContaCOD_PATRIMONIO_GRUPO_CONTA: TIntegerField;
    QGrupoContaDESC_PATRIMONIO_GRUPO_CONTA: TStringField;
    QGrupoContaCONTA_CONTABIL_BEM: TStringField;
    QGrupoContaHISTORICO_CONTABIL: TIntegerField;
    QGrupoContaCONTA_DEBITO_DEPRECIACAO: TStringField;
    QGrupoContaCONTA_CREDITO_DEPRECIACAO: TStringField;
    QGrupoContaCOD_HISTORICO_DEPRECIACAO: TIntegerField;
    QGrupoContaCONTA_DEBITO_CIAP: TStringField;
    QGrupoContaCONTA_CREDITO_CIAP: TStringField;
    QGrupoContaCOD_HISTORICO_CIAP: TIntegerField;
    QGrupoContaCONTA_DEBITO_DIF_CIAP: TStringField;
    QGrupoContaCONTA_CREDITO_DIF_CIAP: TStringField;
    QGrupoContaCOD_HISTORICO_DIF_CIAP: TIntegerField;
    QGrupoContaCONTA_DEBITO_BAIXA: TStringField;
    QGrupoContaCONTA_CREDITO_BAIXA: TStringField;
    QGrupoContaCOD_HISTORICO_BAIXA: TIntegerField;
    QGrupoContaCONTA_DEBITO_BAIXA_DEP: TStringField;
    QGrupoContaCONTA_CREDITO_BAIXA_DEP: TStringField;
    QGrupoContaCOD_HISTORICO_BAIXA_DEP: TIntegerField;
    QGrupoContaCONTA_DEBITO_ICMS: TStringField;
    QGrupoContaCONTA_CREDITO_ICMS: TStringField;
    QGrupoContaCOD_HISTORICO_ICMS: TIntegerField;
    QGrupoContaCons: TOracleDataSet1;
    QGrupoContaConsCOD_PATRIMONIO_GRUPO_CONTA: TIntegerField;
    QGrupoContaConsDESC_PATRIMONIO_GRUPO_CONTA: TStringField;
    QGrupoContaConsCONTA_CONTABIL_BEM: TStringField;
    QGrupoContaConsHISTORICO_CONTABIL: TIntegerField;
    QGrupoContaConsCONTA_DEBITO_DEPRECIACAO: TStringField;
    QGrupoContaConsCONTA_CREDITO_DEPRECIACAO: TStringField;
    QGrupoContaConsCOD_HISTORICO_DEPRECIACAO: TIntegerField;
    QGrupoContaConsCONTA_DEBITO_CIAP: TStringField;
    QGrupoContaConsCONTA_CREDITO_CIAP: TStringField;
    QGrupoContaConsCOD_HISTORICO_CIAP: TIntegerField;
    QGrupoContaConsCONTA_DEBITO_DIF_CIAP: TStringField;
    QGrupoContaConsCONTA_CREDITO_DIF_CIAP: TStringField;
    QGrupoContaConsCOD_HISTORICO_DIF_CIAP: TIntegerField;
    QGrupoContaConsCONTA_DEBITO_BAIXA: TStringField;
    QGrupoContaConsCONTA_CREDITO_BAIXA: TStringField;
    QGrupoContaConsCOD_HISTORICO_BAIXA: TIntegerField;
    QGrupoContaConsCONTA_DEBITO_BAIXA_DEP: TStringField;
    QGrupoContaConsCONTA_CREDITO_BAIXA_DEP: TStringField;
    QGrupoContaConsCOD_HISTORICO_BAIXA_DEP: TIntegerField;
    QGrupoContaConsCONTA_DEBITO_ICMS: TStringField;
    QGrupoContaConsCONTA_CREDITO_ICMS: TStringField;
    QGrupoContaConsCOD_HISTORICO_ICMS: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMGrupoConta: TDMGrupoConta;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
