unit UPesquisa_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMPesquisa = class(TDataModule)
    QPesquisa: TOracleDataSet1;
    QRPesquisa: TOracleDataSet1;
    QPesquisaCOD_PESQUISA: TIntegerField;
    QPesquisaCOD_CADASTRO: TIntegerField;
    QPesquisaDESC_OBS_1: TStringField;
    QPesquisaDESC_OBS_3: TStringField;
    QPesquisaDESC_OBS_4: TStringField;
    QPesquisaDESC_OBS_5: TStringField;
    QPesquisaDESC_OBS_6: TStringField;
    QPesquisaDESC_OBS_7: TStringField;
    QPesquisaDESC_OBS_10: TStringField;
    QPesquisaDESC_OBS_11: TStringField;
    QPesquisaDESC_OBS_12: TStringField;
    QPesquisaDESC_OBS_13: TStringField;
    QPesquisaDESC_OBS_14: TStringField;
    QPesquisaDESC_OBS_15: TStringField;
    QPesquisaDESC_OBS_16: TStringField;
    QPesquisaDT_PESQUISA: TDateTimeField;
    QPesquisaCons: TOracleDataSet1;
    QPesquisaConsCOD_PESQUISA: TIntegerField;
    QPesquisaConsCOD_CADASTRO: TIntegerField;
    QPesquisaConsNOME: TStringField;
    QPesquisaDESC_RESPOSTA1: TStringField;
    QPesquisaDESC_RESPOSTA2: TStringField;
    QPesquisaDESC_RESPOSTA3: TStringField;
    QPesquisaDESC_RESPOSTA4: TStringField;
    QPesquisaDESC_RESPOSTA5: TStringField;
    QPesquisaDESC_RESPOSTA6: TStringField;
    QPesquisaDESC_RESPOSTA7: TStringField;
    QPesquisaDESC_RESPOSTA8: TStringField;
    QPesquisaDESC_RESPOSTA9: TStringField;
    QPesquisaDESC_RESPOSTA10: TStringField;
    QPesquisaDESC_RESPOSTA11: TStringField;
    QPesquisaDESC_RESPOSTA12: TStringField;
    QPesquisaDESC_RESPOSTA13: TStringField;
    QPesquisaDESC_RESPOSTA14: TStringField;
    QPesquisaDESC_RESPOSTA15: TStringField;
    QPesquisaDESC_RESPOSTA16: TStringField;
    QPesquisaDESC_RESPOSTA17: TStringField;
    QRPesquisaAtivo: TOracleDataSet1;
    QRPesquisaInativo: TOracleDataSet1;
    QRTotalAtivo: TOracleDataSet1;
    QRTotalAtivoNUM_PESQUISA: TFloatField;
    QRTotalAtivoSIM1: TFloatField;
    QRTotalAtivoNAO1: TFloatField;
    QRTotalAtivoMAISOUMENOS1: TFloatField;
    QRTotalAtivoSIM2: TFloatField;
    QRTotalAtivoNAO2: TFloatField;
    QRTotalAtivoMAISOUMENOS2: TFloatField;
    QRTotalAtivoSATISFATORIO3: TFloatField;
    QRTotalAtivoMUITO_RUIM3: TFloatField;
    QRTotalAtivoINSATISFATORIO3: TFloatField;
    QRTotalAtivoREGULAR3: TFloatField;
    QRTotalAtivoEXCELENTE3: TFloatField;
    QRTotalAtivoSIM4: TFloatField;
    QRTotalAtivoNAO4: TFloatField;
    QRTotalAtivoNAOSABEINFORMAR4: TFloatField;
    QRTotalAtivoSIM5: TFloatField;
    QRTotalAtivoNAO5: TFloatField;
    QRTotalAtivoMAISOUMENOS5: TFloatField;
    QRTotalAtivoSIM6: TFloatField;
    QRTotalAtivoNAO6: TFloatField;
    QRTotalAtivoSIM7: TFloatField;
    QRTotalAtivoNAO7: TFloatField;
    QRPesquisaAtivoCOD_PESQUISA: TIntegerField;
    QRPesquisaAtivoCOD_CADASTRO: TIntegerField;
    QRPesquisaAtivoNOME: TStringField;
    QRPesquisaAtivoDT_PESQUISA: TDateTimeField;
    QRPesquisaAtivoDESC_RESPOSTA1: TStringField;
    QRPesquisaAtivoDESC_RESPOSTA2: TStringField;
    QRPesquisaAtivoDESC_RESPOSTA3: TStringField;
    QRPesquisaAtivoDESC_RESPOSTA4: TStringField;
    QRPesquisaAtivoDESC_RESPOSTA5: TStringField;
    QRPesquisaAtivoDESC_RESPOSTA6: TStringField;
    QRPesquisaAtivoDESC_RESPOSTA7: TStringField;
    QRPesquisaInativoCOD_PESQUISA: TIntegerField;
    QRPesquisaInativoCOD_CADASTRO: TIntegerField;
    QRPesquisaInativoNOME: TStringField;
    QRPesquisaInativoDT_PESQUISA: TDateTimeField;
    QRPesquisaInativoDESC_RESPOSTA10: TStringField;
    QRPesquisaInativoDESC_RESPOSTA11: TStringField;
    QRPesquisaInativoDESC_RESPOSTA12: TStringField;
    QRPesquisaInativoDESC_RESPOSTA13: TStringField;
    QRPesquisaInativoDESC_RESPOSTA14: TStringField;
    QRPesquisaInativoDESC_RESPOSTA15: TStringField;
    QRPesquisaInativoDESC_RESPOSTA16: TStringField;
    QRTotalInativo: TOracleDataSet1;
    QRTotalInativoNUM_PESQUISA: TFloatField;
    QRTotalInativoSIM10: TFloatField;
    QRTotalInativoNAO10: TFloatField;
    QRTotalInativoSIM11: TFloatField;
    QRTotalInativoNAO11: TFloatField;
    QRTotalInativoSATISFATORIO13: TFloatField;
    QRTotalInativoMUITO_RUIM13: TFloatField;
    QRTotalInativoINSATISFATORIO13: TFloatField;
    QRTotalInativoREGULAR13: TFloatField;
    QRTotalInativoEXCELENTE13: TFloatField;
    QRTotalInativoSIM12: TFloatField;
    QRTotalInativoNAO12: TFloatField;
    QRTotalInativoMAISOUMENOS12: TFloatField;
    QRTotalInativoSIM14: TFloatField;
    QRTotalInativoNAO14: TFloatField;
    QRTotalInativoNAOSABEINFORMAR14: TFloatField;
    QRTotalInativoSIM15: TFloatField;
    QRTotalInativoNAO15: TFloatField;
    QRTotalInativoQUALID_ATEND16: TFloatField;
    QRTotalInativoQUALID_PRODUTO16: TFloatField;
    QRTotalInativoPRECOS16: TFloatField;
    QRTotalInativoPRAZO_PAGTO16: TFloatField;
    QRTotalInativoVARIED_PRODUTO16: TFloatField;
    QRTotalInativoENTREGA16: TFloatField;
    QRTotalInativoPROBL_PEDIDO16: TFloatField;
    QRTotalInativoOUTRO16: TFloatField;
    QPesquisaIND_SITUACAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPesquisa: TDMPesquisa;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
