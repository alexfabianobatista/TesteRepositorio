unit UContFisc0_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMContFisc0 = class(TDataModule)
    QReg000: TOracleDataSet1;
    QReg000NOME_ESC: TStringField;
    QReg000COD_VER: TStringField;
    QReg000CNPJ: TStringField;
    QReg000NOME: TStringField;
    QReg000IND_SIT_INI_PER: TFloatField;
    QReg000SIT_ESPECIAL: TFloatField;
    QReg000PAT_REMAN_CIS: TStringField;
    QReg000DT_SIT_ESP: TStringField;
    QReg000COD_SCP: TStringField;
    QReg010: TOracleDataSet1;
    QReg020: TOracleDataSet1;
    QReg030: TOracleDataSet1;
    QReg030COD_NAT: TIntegerField;
    QReg030CNAE_FISCAL: TStringField;
    QReg030ENDERECO: TStringField;
    QReg030NUM: TIntegerField;
    QReg030COMPL: TStringField;
    QReg030BAIRRO: TStringField;
    QReg030UF: TStringField;
    QReg030COD_MUN: TStringField;
    QReg030CEP: TStringField;
    QReg030NUM_TEL: TStringField;
    QReg030EMAIL: TStringField;
    QReg930: TOracleDataSet1;
    QReg930IDENT_NOM: TStringField;
    QReg930IDENT_CPF_CNPJ: TStringField;
    QReg930IND_CRC: TStringField;
    QReg930EMAIL: TStringField;
    QReg930FONE: TStringField;
    QReg020IND_ALIQ_CSLL: TStringField;
    QReg020IND_QTE_SCP: TFloatField;
    QReg020IND_ADM_FUN_CLU: TStringField;
    QReg020IND_PART_CONS: TStringField;
    QReg020IND_OP_EXT: TStringField;
    QReg020IND_OP_VINC: TStringField;
    QReg020IND_PJ_ENQUAD: TStringField;
    QReg020IND_PART_EXT: TStringField;
    QReg020IND_ATIV_RURAL: TStringField;
    QReg020IND_RED_ISEN: TStringField;
    QReg020IND_FIN: TStringField;
    QReg020IND_DOA_ELEIT: TStringField;
    QReg020IND_PART_COLIG: TStringField;
    QReg020IND_VEND_EXP: TStringField;
    QReg020IND_REC_EXT: TStringField;
    QReg020IND_ATIV_EXT: TStringField;
    QReg020IND_PGTO_EXT: TStringField;
    QReg020IND_ECOM_TI: TStringField;
    QReg020IND_ROY_REC: TStringField;
    QReg020IND_ROY_PAG: TStringField;
    QReg020IND_REND_SERV: TStringField;
    QReg020IND_PGTO_REM: TStringField;
    QReg020IND_INOV_TEC: TStringField;
    QReg020IND_CAP_INF: TStringField;
    QReg020IND_PJ_HAB: TStringField;
    QReg020IND_POLO_AM: TStringField;
    QReg020IND_ZON_EXP: TStringField;
    QReg020IND_AREA_COM: TStringField;
    QReg010HASH_ECF_ANTERIOR: TStringField;
    QReg010OPT_REFIS: TStringField;
    QReg010OPT_PAES: TStringField;
    QReg010FORMA_TRIB: TIntegerField;
    QReg010FORMA_APUR: TStringField;
    QReg010COD_QUALIF_PJ: TStringField;
    QReg010TIP_ESC_PRE: TStringField;
    QReg010TIP_ENT: TStringField;
    QReg010FORMA_APUR_I: TStringField;
    QReg010APUR_CSLL: TStringField;
    QReg010FORMA_TRIB_PER: TStringField;
    QReg020IND_LUC_EXP: TStringField;
    QReg020IND_COM_EXP: TStringField;
    QReg930IDENT_QUALIF: TStringField;
    QReg010MES_BAL_RED: TStringField;
    QReg010IND_RECEITA: TStringField;
    QReg020ORDEM: TFloatField;
    QReg020IND_PAIS_A_PAIS: TStringField;
    QReg020IND_DEREX: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContFisc0: TDMContFisc0;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
