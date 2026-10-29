unit UContasReceberParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, Mask, Buttons, ComCtrls, ExtCtrls, UFmDepartamento,
  UFmVendedor, UFmFilial, UFmCadastro, UFmContrato, UFmFinalidade;

type
  TFContasReceberParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    ME0DataInicial: TMaskEdit;
    ME0DataFinal: TMaskEdit;
    Label7: TLabel;
    SpeedButton3: TSpeedButton;
    ME1Filial: TMaskEdit;
    Label3: TLabel;
    ME1Codigo: TMaskEdit;
    SpeedButton1: TSpeedButton;
    ME1Cliente: TMaskEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    ME1Inicial: TMaskEdit;
    ME1Final: TMaskEdit;
    Label8: TLabel;
    SpeedButton4: TSpeedButton;
    ME2Filial: TMaskEdit;
    ME2CodCliente: TMaskEdit;
    Label9: TLabel;
    SpeedButton6: TSpeedButton;
    ME2Cliente: TMaskEdit;
    ME1CodFilial: TMaskEdit;
    ME2CodFilial: TMaskEdit;
    ME1CGCCPF: TMaskEdit;
    Label12: TLabel;
    RGSituacao: TRadioGroup;
    CB1TodosFilial: TCheckBox;
    CB1TodosCliente: TCheckBox;
    CB2TodosFilial: TCheckBox;
    CB2TodosCliente: TCheckBox;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    ME2Inicial: TMaskEdit;
    Label10: TLabel;
    ME2Final: TMaskEdit;
    RGIndTipoMov: TRadioGroup;
    TabSheet4: TTabSheet;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label13: TLabel;
    Label14: TLabel;
    ME3CodFilial: TMaskEdit;
    ME3CodCliente: TMaskEdit;
    ME3Filial: TMaskEdit;
    ME3Cliente: TMaskEdit;
    GroupBox5: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    ME3Inicial: TMaskEdit;
    ME3Final: TMaskEdit;
    TabSheet5: TTabSheet;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label17: TLabel;
    Label18: TLabel;
    ME4CodFilial: TMaskEdit;
    ME4CodCliente: TMaskEdit;
    CB4TodosFilial: TCheckBox;
    CB4TodosCliente: TCheckBox;
    ME4Cliente: TMaskEdit;
    GroupBox4: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    ME4Inicial: TMaskEdit;
    ME4Final: TMaskEdit;
    ME4Filial: TMaskEdit;
    SpeedButton2: TSpeedButton;
    Label6: TLabel;
    ME0CodFilial: TMaskEdit;
    ME0Filial: TMaskEdit;
    CB0Todos: TCheckBox;
    Label21: TLabel;
    ME0CodCliente: TMaskEdit;
    SpeedButton10: TSpeedButton;
    ME0Cliente: TMaskEdit;
    CB0TodosCliente: TCheckBox;
    Label22: TLabel;
    ME0CodBanco: TMaskEdit;
    SpeedButton11: TSpeedButton;
    ME0Banco: TMaskEdit;
    CB0TodosBanco: TCheckBox;
    Label23: TLabel;
    ME0CodFinalidade: TMaskEdit;
    SpeedButton12: TSpeedButton;
    ME0Finalidade: TMaskEdit;
    CB0TodosFinalidade: TCheckBox;
    RGTipo: TRadioGroup;
    TabSheet6: TTabSheet;
    SpeedButton13: TSpeedButton;
    Label24: TLabel;
    ME5CodFilial: TMaskEdit;
    ME5Filial: TMaskEdit;
    CB5TodosFilial: TCheckBox;
    GroupBox6: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    ME5DataInicial: TMaskEdit;
    ME5DataFinal: TMaskEdit;
    SpeedButton14: TSpeedButton;
    Label27: TLabel;
    ME5CodRegiao: TMaskEdit;
    ME5Regiao: TMaskEdit;
    CB5TodosRegiao: TCheckBox;
    RGOrdem: TRadioGroup;
    Label28: TLabel;
    ME4CodBanco: TMaskEdit;
    SpeedButton15: TSpeedButton;
    ME4Banco: TMaskEdit;
    CB4TodosBanco: TCheckBox;
    Label29: TLabel;
    ME4CodRegiao: TMaskEdit;
    SpeedButton16: TSpeedButton;
    ME4Regiao: TMaskEdit;
    CB4TodosRegiao: TCheckBox;
    RG4Ordem: TRadioGroup;
    SpeedButton17: TSpeedButton;
    Label30: TLabel;
    ME5CodCliente: TMaskEdit;
    ME5Cliente: TMaskEdit;
    CB5TodosCliente: TCheckBox;
    TabSheet7: TTabSheet;
    Label31: TLabel;
    Label32: TLabel;
    ME6Banco: TMaskEdit;
    GroupBox7: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    ME6Inicial: TMaskEdit;
    ME6Final: TMaskEdit;
    ME6CodBanco: TMaskEdit;
    ME6NrNota: TMaskEdit;
    Label35: TLabel;
    TabSheet8: TTabSheet;
    ME7CodFilial: TMaskEdit;
    ME7Filial: TMaskEdit;
    SpeedButton19: TSpeedButton;
    Label36: TLabel;
    CB7TodosFilial: TCheckBox;
    TabSheet9: TTabSheet;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    SpeedButton22: TSpeedButton;
    ME8CodFilial: TMaskEdit;
    ME8CodCliente: TMaskEdit;
    ME8Filial: TMaskEdit;
    CB8TodosFilial: TCheckBox;
    CB8TodosCliente: TCheckBox;
    ME8Cliente: TMaskEdit;
    ME8CodBanco: TMaskEdit;
    ME8Banco: TMaskEdit;
    CB8TodosBanco: TCheckBox;
    ME0CodDepto: TMaskEdit;
    SpeedButton23: TSpeedButton;
    ME0Departamento: TMaskEdit;
    CB0TodosDepto: TCheckBox;
    Label41: TLabel;
    Label42: TLabel;
    ME1CodDepto: TMaskEdit;
    SpeedButton24: TSpeedButton;
    ME1Departamento: TMaskEdit;
    CB1TodosDepto: TCheckBox;
    Label44: TLabel;
    ME2CodDepto: TMaskEdit;
    SpeedButton25: TSpeedButton;
    ME2Departamento: TMaskEdit;
    CB2TodosDepto: TCheckBox;
    Label43: TLabel;
    SpeedButton26: TSpeedButton;
    ME3CodDepto: TMaskEdit;
    ME3Departamento: TMaskEdit;
    Label45: TLabel;
    SpeedButton27: TSpeedButton;
    ME4CodDepto: TMaskEdit;
    ME4Departamento: TMaskEdit;
    CB4TodosDepto: TCheckBox;
    Label46: TLabel;
    SpeedButton28: TSpeedButton;
    ME5CodDepto: TMaskEdit;
    ME5Departamento: TMaskEdit;
    CB5TodosDepto: TCheckBox;
    Label47: TLabel;
    SpeedButton29: TSpeedButton;
    ME7CodDepto: TMaskEdit;
    ME7Departamento: TMaskEdit;
    CB7TodosDepto: TCheckBox;
    Label48: TLabel;
    SpeedButton30: TSpeedButton;
    ME8CodDepto: TMaskEdit;
    ME8Departamento: TMaskEdit;
    CB8TodosDepto: TCheckBox;
    TabSheet10: TTabSheet;
    ME9CodFilial: TMaskEdit;
    ME9CodCliente: TMaskEdit;
    ME9Filial: TMaskEdit;
    ME9Cliente: TMaskEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label49: TLabel;
    Label51: TLabel;
    GroupBox8: TGroupBox;
    ME9DtVencInicial: TMaskEdit;
    ME9DtVencFinal: TMaskEdit;
    Label52: TLabel;
    Label53: TLabel;
    CB9TodosFilial: TCheckBox;
    CB9TodosCliente: TCheckBox;
    Label50: TLabel;
    SpeedButton31: TSpeedButton;
    ME6CodNota: TMaskEdit;
    Button1: TButton;
    TabSheet11: TTabSheet;
    RG10Tipo: TRadioGroup;
    GroupBox9: TGroupBox;
    ME10DtInicial: TMaskEdit;
    ME10DtFinal: TMaskEdit;
    Label54: TLabel;
    Label55: TLabel;
    ME10CodFilial: TMaskEdit;
    SpeedButton32: TSpeedButton;
    ME10Filial: TMaskEdit;
    Label56: TLabel;
    ME4CodVendedor: TMaskEdit;
    SpeedButton33: TSpeedButton;
    ME4Vendedor: TMaskEdit;
    Label57: TLabel;
    CB4TodosVendedor: TCheckBox;
    Label58: TLabel;
    Me6NrTitulo: TMaskEdit;
    SpeedButton34: TSpeedButton;
    Me6CodContaReceberCab: TMaskEdit;
    Button2: TButton;
    Label59: TLabel;
    SpeedButton35: TSpeedButton;
    Label60: TLabel;
    SpeedButton36: TSpeedButton;
    Me7NrNota: TMaskEdit;
    Me7CodNota: TMaskEdit;
    Button3: TButton;
    Me7NrTitulo: TMaskEdit;
    Me7CodTitulo: TMaskEdit;
    Button4: TButton;
    TabSheet12: TTabSheet;
    ME11CodFilial: TMaskEdit;
    ME11Filial: TMaskEdit;
    ME11Vendedor: TMaskEdit;
    ME11CodVendedor: TMaskEdit;
    SpeedButton37: TSpeedButton;
    SpeedButton38: TSpeedButton;
    ME11DTInicial: TMaskEdit;
    ME11DtFinal: TMaskEdit;
    Label37: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Rg11Ordem: TRadioGroup;
    Label64: TLabel;
    ME4CodFinalidade: TMaskEdit;
    SpeedButton39: TSpeedButton;
    ME4DescDocumento: TMaskEdit;
    Label65: TLabel;
    Label66: TLabel;
    Me11CodDepto: TMaskEdit;
    SpeedButton40: TSpeedButton;
    Me11Departamento: TMaskEdit;
    Label67: TLabel;
    Me6NrNotaF: TMaskEdit;
    SpeedButton41: TSpeedButton;
    Button5: TButton;
    ME6CodNotaF: TMaskEdit;
    TabSheet13: TTabSheet;
    Label68: TLabel;
    ME12CodFilial: TMaskEdit;
    ME12Filial: TMaskEdit;
    SpeedButton42: TSpeedButton;
    Label69: TLabel;
    ME12CodVendedor: TMaskEdit;
    SpeedButton43: TSpeedButton;
    ME12Vendedor: TMaskEdit;
    GroupBox10: TGroupBox;
    Label72: TLabel;
    Label73: TLabel;
    ME12DtInicial: TMaskEdit;
    ME12DtFinal: TMaskEdit;
    Label70: TLabel;
    Me11DtReferencia: TMaskEdit;
    TabSheet14: TTabSheet;
    SpeedButton44: TSpeedButton;
    Label71: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    SpeedButton46: TSpeedButton;
    Me13Filial: TMaskEdit;
    Ed13Filial: TMaskEdit;
    Me13DtInicial: TMaskEdit;
    Me13DtFinal: TMaskEdit;
    Me13Departamento: TMaskEdit;
    Ed13Departamento: TMaskEdit;
    TabSheet15: TTabSheet;
    SpeedButton45: TSpeedButton;
    Label74: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    SpeedButton47: TSpeedButton;
    Me14Filial: TMaskEdit;
    Ed14Filial: TMaskEdit;
    Me14DtInicial: TMaskEdit;
    Me14DtFinal: TMaskEdit;
    Me14Banco: TMaskEdit;
    Ed14Banco: TMaskEdit;
    Label81: TLabel;
    Me14Departamento: TMaskEdit;
    SpeedButton48: TSpeedButton;
    Ed14Departamento: TMaskEdit;
    Label82: TLabel;
    Me1DtReferencia: TMaskEdit;
    Me4DtReferencia: TMaskEdit;
    Label83: TLabel;
    ME6NrBloqueto: TMaskEdit;
    Label88: TLabel;
    SDlg_Remessa: TSaveDialog;
    Me6CodFilial: TMaskEdit;
    Label89: TLabel;
    SpeedButton51: TSpeedButton;
    Ed6Filial: TMaskEdit;
    TabSheet17: TTabSheet;
    ME17CodFilial: TMaskEdit;
    ME17CodContaCorrente: TMaskEdit;
    ME17DtInicial: TMaskEdit;
    ME17DtFinal: TMaskEdit;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    SB17FilialCons: TSpeedButton;
    SB17ContaCorrenteCons: TSpeedButton;
    ME17ContaCorrente: TMaskEdit;
    ME17Filial: TMaskEdit;
    Rg6Vencimento: TRadioGroup;
    Label84: TLabel;
    Me4DtRefEmissao: TMaskEdit;
    ME0DtBase: TMaskEdit;
    Label85: TLabel;
    MEDigito: TMaskEdit;
    GbContas: TGroupBox;
    Me4ContaNao5: TMaskEdit;
    Me4ContaNao1: TMaskEdit;
    Me4ContaNao2: TMaskEdit;
    Me4ContaNao3: TMaskEdit;
    Me4ContaNao4: TMaskEdit;
    Me4ContaNao6: TMaskEdit;
    Me4ContaNao7: TMaskEdit;
    Me4ContaNao8: TMaskEdit;
    Me4ContaNao9: TMaskEdit;
    Me4ContaNao10: TMaskEdit;
    Label86: TLabel;
    TabSheet16: TTabSheet;
    Label87: TLabel;
    Me18CodFilial: TMaskEdit;
    SpeedButton49: TSpeedButton;
    Me18Filial: TMaskEdit;
    Me18CodDepto: TMaskEdit;
    Label94: TLabel;
    SpeedButton50: TSpeedButton;
    Me18Departamento: TMaskEdit;
    Me18CodCliente: TMaskEdit;
    Label95: TLabel;
    SpeedButton52: TSpeedButton;
    Me18Cliente: TMaskEdit;
    Label96: TLabel;
    Me18CodBanco: TMaskEdit;
    SpeedButton53: TSpeedButton;
    Me18Banco: TMaskEdit;
    Label97: TLabel;
    Me18CodFinalidade: TMaskEdit;
    SpeedButton54: TSpeedButton;
    Me18Finalidade: TMaskEdit;
    GroupBox11: TGroupBox;
    Label98: TLabel;
    Label99: TLabel;
    Me18DtInicial: TMaskEdit;
    Me18DtFinal: TMaskEdit;
    TabSheet18: TTabSheet;
    Label100: TLabel;
    ME19CodFilial: TMaskEdit;
    SBFilialCons19: TSpeedButton;
    MEDescFilial19: TMaskEdit;
    Label101: TLabel;
    Label103: TLabel;
    Me19NrNota: TMaskEdit;
    SBNotaConsI19: TSpeedButton;
    Label104: TLabel;
    Me19NrNotaF: TMaskEdit;
    SBNotaConsF19: TSpeedButton;
    Label105: TLabel;
    Me19NrTitulo: TMaskEdit;
    SBTituloCons19: TSpeedButton;
    GroupBox12: TGroupBox;
    Label106: TLabel;
    Label107: TLabel;
    ME19Inicial: TMaskEdit;
    ME19Final: TMaskEdit;
    RG19Vencimento: TRadioGroup;
    BntLimpa1: TButton;
    BtnLimpa2: TButton;
    BtnLimpa3: TButton;
    Me19CodContaReceberCab: TMaskEdit;
    ME19CodNotaF: TMaskEdit;
    ME19CodNota: TMaskEdit;
    RG2Ordem: TRadioGroup;
    Label109: TLabel;
    ME19CodContaCorrente: TMaskEdit;
    SB19ContaCorrenteCons: TSpeedButton;
    ME19DescContaCorrente: TMaskEdit;
    Label102: TLabel;
    ME19CodBanco: TMaskEdit;
    ME19DescBanco: TMaskEdit;
    Label110: TLabel;
    ME6CodContaCorrente: TMaskEdit;
    SB6ContaCorrenteCons: TSpeedButton;
    ME6DescContaCorrente: TMaskEdit;
    Rg1Ordem: TRadioGroup;
    TabSheet19: TTabSheet;
    Label108: TLabel;
    MECodFilial18: TMaskEdit;
    SBCodFilial18: TSpeedButton;
    MEDescFilial18: TMaskEdit;
    GroupBox13: TGroupBox;
    Label111: TLabel;
    Label112: TLabel;
    MEEmissaoI18: TMaskEdit;
    MEEmissaoF18: TMaskEdit;
    Label113: TLabel;
    Me17NrTitulo: TMaskEdit;
    SpeedButton18: TSpeedButton;
    TabSheet20: TTabSheet;
    GroupBox14: TGroupBox;
    ME20NrTitulo: TMaskEdit;
    SpeedButton55: TSpeedButton;
    Label116: TLabel;
    ME20Val_Juro: TMaskEdit;
    Label115: TLabel;
    ME20DT_Vencimento: TMaskEdit;
    Label114: TLabel;
    GroupBox15: TGroupBox;
    Label117: TLabel;
    Label118: TLabel;
    Me8DtInicial: TMaskEdit;
    Me8DtFinal: TMaskEdit;
    GroupBox16: TGroupBox;
    Label119: TLabel;
    Label120: TLabel;
    Me1DtBaixa_Inic: TMaskEdit;
    Me1DtBaixa_Fim: TMaskEdit;
    TabSheet21: TTabSheet;
    Label121: TLabel;
    SB20CodCliente: TSpeedButton;
    ME20CodCliente: TMaskEdit;
    ME20DescCliente: TMaskEdit;
    GroupBox17: TGroupBox;
    Label122: TLabel;
    Label123: TLabel;
    ME20DtIni: TMaskEdit;
    ME20DtFin: TMaskEdit;
    Label124: TLabel;
    SB20CodFilial: TSpeedButton;
    ME20CodFilial: TMaskEdit;
    ME20DescFilial: TMaskEdit;
    RG3Ordem: TRadioGroup;
    Label125: TLabel;
    Label126: TLabel;
    GroupBox18: TGroupBox;
    Label127: TLabel;
    ME12DtEmissao: TMaskEdit;
    Label129: TLabel;
    Me3CodVendedor: TMaskEdit;
    Sb3Vendedor: TSpeedButton;
    Me3Vendedor: TMaskEdit;
    TabSheet22: TTabSheet;
    Me21CodFinalidade: TMaskEdit;
    Label130: TLabel;
    Sb21FinalidadeCons: TSpeedButton;
    Me21Finalidade: TMaskEdit;
    Me21DtBase: TMaskEdit;
    Label131: TLabel;
    GroupBox19: TGroupBox;
    Label132: TLabel;
    Label133: TLabel;
    Me21DtInicio: TMaskEdit;
    Me21DtFim: TMaskEdit;
    Label134: TLabel;
    Sb21FilialCons: TSpeedButton;
    Me21CodFilial: TMaskEdit;
    Me21Filial: TMaskEdit;
    Label135: TLabel;
    Me12TipoDocumento: TMaskEdit;
    Me2CodVendedor: TMaskEdit;
    Label136: TLabel;
    SpeedButton56: TSpeedButton;
    Me2Vendedor: TMaskEdit;
    CB2TodosVendedor: TCheckBox;
    Cb4SituacaoVendedor: TComboBox;
    Label137: TLabel;
    TabSheet23: TTabSheet;
    Label138: TLabel;
    ME22CodFilial: TMaskEdit;
    SB22FilialCons: TSpeedButton;
    ME22Filial: TMaskEdit;
    Label139: TLabel;
    ME22CodFinalidade: TMaskEdit;
    SB22FinalidadeCons: TSpeedButton;
    ME22Finalidade: TMaskEdit;
    GroupBox20: TGroupBox;
    Label140: TLabel;
    Label141: TLabel;
    ME22DtInicio: TMaskEdit;
    ME22DtFim: TMaskEdit;
    RG22Situacao: TRadioGroup;
    GroupBox21: TGroupBox;
    Label142: TLabel;
    Me12DtVencto: TMaskEdit;
    Label128: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    SB7Representante: TSpeedButton;
    ME7Representante: TMaskEdit;
    Ed7Representante: TEdit;
    GroupBox22: TGroupBox;
    Label146: TLabel;
    Label147: TLabel;
    MeDtVctoInicial: TMaskEdit;
    MeDtVctoFinal: TMaskEdit;
    RG11Vendedor: TRadioGroup;
    GroupBox23: TGroupBox;
    Label148: TLabel;
    ME0DtEmissaoInicial: TMaskEdit;
    Label149: TLabel;
    ME0DtEmissaoFinal: TMaskEdit;
    Rg12TipoRelatorio: TRadioGroup;
    Label153: TLabel;
    Me17Titulo: TMaskEdit;
    Label154: TLabel;
    Label155: TLabel;
    RG12Ordem: TRadioGroup;
    Label150: TLabel;
    ME2CC: TMaskEdit;
    SB2CC: TSpeedButton;
    Ed2CC: TEdit;
    ME3Finalidade: TMaskEdit;
    SB3Finalidade: TSpeedButton;
    Ed3Finalidade: TEdit;
    Label151: TLabel;
    Label152: TLabel;
    Me11Mensagem: TMaskEdit;
    TabSheet24: TTabSheet;
    ME23Filial: TMaskEdit;
    ME23Cliente: TMaskEdit;
    ME23Titulo: TMaskEdit;
    ME23Parcela: TMaskEdit;
    SB23Filial: TSpeedButton;
    SB23Cliente: TSpeedButton;
    SB23Titulo: TSpeedButton;
    Ed23Filial: TEdit;
    Ed23Cliente: TEdit;
    Label156: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    SpeedButton57: TSpeedButton;
    Label160: TLabel;
    Me1Finalidade: TMaskEdit;
    Sb1Finalidade: TSpeedButton;
    Ed1Finalidade: TMaskEdit;
    CB1TodosFinalidade: TCheckBox;
    ME5TipoDocumento: TMaskEdit;
    Label161: TLabel;
    CB5TipoDocumento: TCheckBox;
    RG17Ordem: TRadioGroup;
    Rg2FormaPagamento: TRadioGroup;
    RG20Modelo: TRadioGroup;
    RG20Cartas: TRadioGroup;
    ME20DtCarta: TMaskEdit;
    Label162: TLabel;
    Rg13FormaPagamento: TRadioGroup;
    Label163: TLabel;
    ME22CodBanco: TMaskEdit;
    SB22Banco: TSpeedButton;
    ME22Banco: TMaskEdit;
    TabSheet25: TTabSheet;
    Label164: TLabel;
    ME24CodFilial: TMaskEdit;
    SB24FilialCons: TSpeedButton;
    ME24Filial: TMaskEdit;
    Label165: TLabel;
    ME24CodContaCorrente: TMaskEdit;
    SB24ContaCorrenteCons: TSpeedButton;
    ME24ContaCorrente: TMaskEdit;
    Label166: TLabel;
    ME24DtInicial: TMaskEdit;
    ME24DtFinal: TMaskEdit;
    Label167: TLabel;
    Label168: TLabel;
    Me24NrTitulo: TMaskEdit;
    SpeedButton58: TSpeedButton;
    Label169: TLabel;
    Me24Titulo: TMaskEdit;
    RG24Ordem: TRadioGroup;
    Label170: TLabel;
    ME3Banco: TMaskEdit;
    SpeedButton59: TSpeedButton;
    ED3Banco: TEdit;
    Label171: TLabel;
    ME2Finalidade: TMaskEdit;
    SpeedButton60: TSpeedButton;
    ED2Finalidade: TMaskEdit;
    TabSheet26: TTabSheet;
    Label172: TLabel;
    SpeedButton61: TSpeedButton;
    MEDescContrato: TMaskEdit;
    MEContrato: TMaskEdit;
    Label173: TLabel;
    Bt13Cliente: TSpeedButton;
    Me13CodCliente: TMaskEdit;
    Me13Cliente: TMaskEdit;
    Label174: TLabel;
    Bt14Cliente: TSpeedButton;
    Me14CodCliente: TMaskEdit;
    Me14Cliente: TMaskEdit;
    Label1: TLabel;
    TabSheet27: TTabSheet;
    Label175: TLabel;
    ME26Cadastro: TMaskEdit;
    SpeedButton62: TSpeedButton;
    Ed26Cadastro: TEdit;
    ME26PercDescAntecipacao: TMaskEdit;
    Label176: TLabel;
    Label177: TLabel;
    ME26PercDescPontualidade: TMaskEdit;
    GroupBox24: TGroupBox;
    ME26DtVencimentoInicio: TMaskEdit;
    Label178: TLabel;
    ME26DtVencimentoFim: TMaskEdit;
    Label179: TLabel;
    ME26DtPagamento: TMaskEdit;
    Label180: TLabel;
    TabSheet28: TTabSheet;
    Label181: TLabel;
    ME27Filial: TMaskEdit;
    SpeedButton63: TSpeedButton;
    ED27Filial: TMaskEdit;
    GroupBox25: TGroupBox;
    Label182: TLabel;
    Label183: TLabel;
    ME27Data_I: TMaskEdit;
    ME27Data_F: TMaskEdit;
    Label184: TLabel;
    Me12DtEmissaoFinal: TMaskEdit;
    TabSheet29: TTabSheet;
    ME28Filial: TMaskEdit;
    ME28Class: TMaskEdit;
    SB28Filial: TSpeedButton;
    SB28Class: TSpeedButton;
    Ed28Filial: TEdit;
    Ed28Class: TEdit;
    GroupBox26: TGroupBox;
    ME28DtInicial: TMaskEdit;
    ME28DtFinal: TMaskEdit;
    Label185: TLabel;
    Label186: TLabel;
    Inicial: TLabel;
    Final: TLabel;
    Label187: TLabel;
    Me0Serie: TMaskEdit;
    Bt11Supervisor: TSpeedButton;
    Label188: TLabel;
    ME11Supervisor: TMaskEdit;
    Me11CodSupervisor: TMaskEdit;
    Label189: TLabel;
    SpeedButton64: TSpeedButton;
    Me4Classificacao: TMaskEdit;
    Ed4Classificacao: TMaskEdit;
    CB4TodosClassificacao: TCheckBox;
    TabSheet30: TTabSheet;
    ME29NomeAvalista: TMaskEdit;
    Label190: TLabel;
    RG29RegistroIntercambio: TRadioGroup;
    ME29DtEmissaoSCPC: TMaskEdit;
    Label191: TLabel;
    RG29MotivoRegistro: TRadioGroup;
    Rg3Tipo: TRadioGroup;
    TabSheet31: TTabSheet;
    Label192: TLabel;
    SpeedButton65: TSpeedButton;
    Label193: TLabel;
    SpeedButton66: TSpeedButton;
    Label194: TLabel;
    SpeedButton67: TSpeedButton;
    Label195: TLabel;
    SpeedButton68: TSpeedButton;
    Label196: TLabel;
    SpeedButton69: TSpeedButton;
    Label197: TLabel;
    SpeedButton70: TSpeedButton;
    ME30CodFilial: TMaskEdit;
    ME30Filial: TMaskEdit;
    ME30CodCliente: TMaskEdit;
    ME30Cliente: TMaskEdit;
    GroupBox27: TGroupBox;
    Label198: TLabel;
    Label199: TLabel;
    ME30Inicial: TMaskEdit;
    ME30Final: TMaskEdit;
    ME30CodDepto: TMaskEdit;
    ME30Departamento: TMaskEdit;
    Me30CodVendedor: TMaskEdit;
    Me30Vendedor: TMaskEdit;
    ME30CC: TMaskEdit;
    Ed30CC: TEdit;
    Rg30FormaPagamento: TRadioGroup;
    ME30Finalidade: TMaskEdit;
    ED30Finalidade: TMaskEdit;
    Rg4Notas: TRadioGroup;
    Label200: TLabel;
    Sb14ContaCorrente: TSpeedButton;
    Me14ContaCorrente: TMaskEdit;
    Ed14ContaCorrente: TMaskEdit;
    Rg27Periodicidade: TRadioGroup;
    TabSheet32: TTabSheet;
    Label201: TLabel;
    Label202: TLabel;
    GB31Periodo: TGroupBox;
    Label203: TLabel;
    Label204: TLabel;
    Ed31Filial: TEdit;
    Ed31Departamento: TEdit;
    ME31Filial: TMaskEdit;
    ME31departamento: TMaskEdit;
    ME31DtInicial: TMaskEdit;
    ME31DtFinal: TMaskEdit;
    SB31Filial: TSpeedButton;
    SB31Departamento: TSpeedButton;
    Rg27Tipo: TRadioGroup;
    Rg27TipoMov: TRadioGroup;
    TabSheet33: TTabSheet;
    Label205: TLabel;
    ME32Filial: TMaskEdit;
    SpeedButton71: TSpeedButton;
    ED32Filial: TEdit;
    GroupBox28: TGroupBox;
    Label206: TLabel;
    Label207: TLabel;
    ME32Data_I: TMaskEdit;
    ME32Data_F: TMaskEdit;
    Label208: TLabel;
    ME32Cadastro: TMaskEdit;
    SpeedButton72: TSpeedButton;
    ED32Cadastro: TEdit;
    RG32Ordem: TRadioGroup;
    Rg11Tipo: TRadioGroup;
    Label209: TLabel;
    Me11DtBase: TMaskEdit;
    TabSheet34: TTabSheet;
    Me34CodFilial: TMaskEdit;
    SB34FilialCons: TSpeedButton;
    Ed34DescFilial: TEdit;
    ME34CodBanco: TMaskEdit;
    Label210: TLabel;
    SB34BancoCons: TSpeedButton;
    Label211: TLabel;
    ME34DescBanco: TMaskEdit;
    GroupBox29: TGroupBox;
    Label212: TLabel;
    Label213: TLabel;
    ME34DataI: TMaskEdit;
    ME34DataF: TMaskEdit;
    Label214: TLabel;
    ME19Instrucoes: TMaskEdit;
    SpeedButton73: TSpeedButton;
    Label215: TLabel;
    Me4Valor: TMaskEdit;
    Label216: TLabel;
    Sb17Mensagem: TSpeedButton;
    ME17Instrucoes: TMaskEdit;
    Rg13Troca: TRadioGroup;
    Label217: TLabel;
    SpeedButton74: TSpeedButton;
    Me5ClassCadastro: TMaskEdit;
    Ed5Classificacao: TMaskEdit;
    CB5TodosClassificacao: TCheckBox;
    Rg12Abertos: TRadioGroup;
    Fm26Departamento: TFmDepartamento;
    Label218: TLabel;
    ME13NumTitulo: TMaskEdit;
    SB13NumTitulo: TSpeedButton;
    Label219: TLabel;
    ME14NumTitulo: TMaskEdit;
    SB14NumTitulo: TSpeedButton;
    TabSheet35: TTabSheet;
    GroupBox30: TGroupBox;
    Label222: TLabel;
    Label223: TLabel;
    Me35MovimentoData_I: TMaskEdit;
    Me35MovimentoData_F: TMaskEdit;
    Label224: TLabel;
    Me35TipoDocumento: TMaskEdit;
    RG35TipoRelatorio: TRadioGroup;
    GroupBox31: TGroupBox;
    Label225: TLabel;
    Label226: TLabel;
    Me35EmissaoData_I: TMaskEdit;
    Me35EmissaoData_F: TMaskEdit;
    Label227: TLabel;
    Label228: TLabel;
    Label229: TLabel;
    GroupBox32: TGroupBox;
    Label230: TLabel;
    Me35Data_Vencimento: TMaskEdit;
    Label231: TLabel;
    Label232: TLabel;
    Label233: TLabel;
    Label234: TLabel;
    Rg35Abertos: TRadioGroup;
    FmFilial35: TFmFilial;
    Fm1Vendedor35: TFmVendedor;
    Label220: TLabel;
    Ed6Desconto: TEdit;
    TabSheet36: TTabSheet;
    Label221: TLabel;
    Label235: TLabel;
    ME36Filial: TMaskEdit;
    SB36Filial: TSpeedButton;
    Ed36Filial: TMaskEdit;
    ME36ContaCorrente: TMaskEdit;
    Label236: TLabel;
    SB36ContaCorrente: TSpeedButton;
    Ed36ContaCorrente: TMaskEdit;
    Label237: TLabel;
    ME36Banco: TMaskEdit;
    Ed36Banco: TMaskEdit;
    GB36Periodo: TGroupBox;
    Label238: TLabel;
    Label239: TLabel;
    ME36DtInicial: TMaskEdit;
    ME36DtFinal: TMaskEdit;
    ME36Vencimento: TMaskEdit;
    Label240: TLabel;
    FmCadastro36: TFmCadastro;
    Me7NumParcela: TMaskEdit;
    Label241: TLabel;
    Rg13Devolucao: TRadioGroup;
    Fm22Departamento: TFmDepartamento;
    Fm3Contrato: TFmContrato;
    TabSheet37: TTabSheet;
    Label242: TLabel;
    Fm37Filial: TFmFilial;
    Fm37Departamento: TFmDepartamento;
    Fm37Finalidade: TFmFinalidade;
    GroupBox33: TGroupBox;
    Label243: TLabel;
    Label244: TLabel;
    ME37DtFinal: TMaskEdit;
    ME37DtInicial: TMaskEdit;
    ME37DtBase: TMaskEdit;
    TabSheet38: TTabSheet;
    Label245: TLabel;
    Fm38Filial: TFmFilial;
    Fm38Departamento: TFmDepartamento;
    Fm38Finalidade: TFmFinalidade;
    GroupBox34: TGroupBox;
    Label246: TLabel;
    Label247: TLabel;
    Me38DtFinal: TMaskEdit;
    Me38DtInicial: TMaskEdit;
    Me38DtBase: TMaskEdit;
    Fm38Cadastro: TFmCadastro;
    Fm38Contrato: TFmContrato;
    Rg17Remessa: TRadioGroup;
    cbTitulo: TComboBox;
    Label248: TLabel;
    Label249: TLabel;
    Me4ContratoVenda: TMaskEdit;
    Sb4ContratoVenda: TSpeedButton;
    TabSheet39: TTabSheet;
    Label250: TLabel;
    Label251: TLabel;
    Label252: TLabel;
    Me39DtLancamento: TMaskEdit;
    Me39VlJiuros: TMaskEdit;
    Me39Observacao: TMaskEdit;
    procedure SpeedButton2Click(Sender: TObject);
    procedure ME0CodFilialChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ME1CodigoChange(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ME2CodFilialChange(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure ME2CodClienteChange(Sender: TObject);
    procedure ME1CodFilialChange(Sender: TObject);
    procedure CB0TodosClick(Sender: TObject);
    procedure CB1TodosFilialClick(Sender: TObject);
    procedure CB1TodosClienteClick(Sender: TObject);
    procedure CB2TodosFilialClick(Sender: TObject);
    procedure CB2TodosClienteClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure ME4CodFilialChange(Sender: TObject);
    procedure ME4CodClienteChange(Sender: TObject);
    procedure CB4TodosFilialClick(Sender: TObject);
    procedure CB4TodosClienteClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure ME0CodClienteChange(Sender: TObject);
    procedure CB0TodosClienteClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure ME0CodBancoChange(Sender: TObject);
    procedure CB0TodosBancoClick(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure ME0CodFinalidadeChange(Sender: TObject);
    procedure CB0TodosFinalidadeClick(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure ME5CodFilialChange(Sender: TObject);
    procedure CB5TodosFilialClick(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure ME5CodRegiaoChange(Sender: TObject);
    procedure CB5TodosRegiaoClick(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure ME4CodBancoChange(Sender: TObject);
    procedure CB4TodosBancoClick(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure ME4CodRegiaoChange(Sender: TObject);
    procedure CB4TodosRegiaoClick(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure ME5CodClienteChange(Sender: TObject);
    procedure CB5TodosClienteClick(Sender: TObject);
    procedure ME6NrNotaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure ME6CodFilialChange(Sender: TObject);
    procedure CB7TodosFilialClick(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure ME8CodFilialChange(Sender: TObject);
    procedure CB8TodosFilialClick(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure ME8CodClienteChange(Sender: TObject);
    procedure CB8TodosClienteClick(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure ME8CodBancoChange(Sender: TObject);
    procedure CB8TodosBancoClick(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure ME0CodDeptoChange(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure ME1CodDeptoChange(Sender: TObject);
    procedure CB1TodosDeptoClick(Sender: TObject);
    procedure CB0TodosDeptoClick(Sender: TObject);
    procedure CB2TodosDeptoClick(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure ME2CodDeptoChange(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure ME4CodDeptoChange(Sender: TObject);
    procedure CB4TodosDeptoClick(Sender: TObject);
    procedure CB5TodosDeptoClick(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure ME5CodDeptoChange(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure ME7CodDeptoChange(Sender: TObject);
    procedure CB7TodosDeptoClick(Sender: TObject);
    procedure SpeedButton30Click(Sender: TObject);
    procedure ME8CodDeptoChange(Sender: TObject);
    procedure CB8TodosDeptoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ME9CodFilialChange(Sender: TObject);
    procedure CB9TodosFilialClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ME9CodClienteChange(Sender: TObject);
    procedure CB9TodosClienteClick(Sender: TObject);
    procedure SpeedButton31Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure ME10CodFilialExit(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure ME4CodVendedorChange(Sender: TObject);
    procedure CB4TodosVendedorClick(Sender: TObject);
    procedure SpeedButton34Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure SpeedButton36Click(Sender: TObject);
    procedure SpeedButton37Click(Sender: TObject);
    procedure SpeedButton38Click(Sender: TObject);
    procedure ME11CodVendedorExit(Sender: TObject);
    procedure ME11CodFilialChange(Sender: TObject);
    procedure SpeedButton39Click(Sender: TObject);
    procedure Me11CodDeptoChange(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure Me6NrNotaFExit(Sender: TObject);
    procedure SpeedButton41Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ME12CodFilialChange(Sender: TObject);
    procedure SpeedButton42Click(Sender: TObject);
    procedure ME12CodVendedorExit(Sender: TObject);
    procedure SpeedButton43Click(Sender: TObject);
    procedure Me13FilialChange(Sender: TObject);
    procedure SpeedButton44Click(Sender: TObject);
    procedure Me13DepartamentoChange(Sender: TObject);
    procedure SpeedButton46Click(Sender: TObject);
    procedure Me14FilialChange(Sender: TObject);
    procedure SpeedButton45Click(Sender: TObject);
    procedure Me14BancoChange(Sender: TObject);
    procedure SpeedButton47Click(Sender: TObject);
    procedure Me14DepartamentoChange(Sender: TObject);
    procedure SpeedButton48Click(Sender: TObject);
    procedure ME7CodFilialChange(Sender: TObject);
    procedure SpeedButton51Click(Sender: TObject);
    procedure ME17CodFilialExit(Sender: TObject);
    procedure Bt17FilialCons(Sender: TObject);
    procedure MEDigitoExit(Sender: TObject);
    procedure Me18CodFilialExit(Sender: TObject);
    procedure SpeedButton49Click(Sender: TObject);
    procedure Me18CodDeptoExit(Sender: TObject);
    procedure SpeedButton50Click(Sender: TObject);
    procedure SpeedButton52Click(Sender: TObject);
    procedure Me18CodBancoExit(Sender: TObject);
    procedure SpeedButton53Click(Sender: TObject);
    procedure Me18CodFinalidadeExit(Sender: TObject);
    procedure SpeedButton54Click(Sender: TObject);
    procedure Me18CodClienteExit(Sender: TObject);
    procedure SBFilialCons19Click(Sender: TObject);
    procedure SBNotaConsI19Click(Sender: TObject);
    procedure SBNotaConsF19Click(Sender: TObject);
    procedure SBTituloCons19Click(Sender: TObject);
    procedure BntLimpa1Click(Sender: TObject);
    procedure BtnLimpa2Click(Sender: TObject);
    procedure BtnLimpa3Click(Sender: TObject);
    procedure SB19ContaCorrenteConsClick(Sender: TObject);
    procedure ME19CodBancoChange(Sender: TObject);
    procedure ME6CodContaCorrenteChange(Sender: TObject);
    procedure SB6ContaCorrenteConsClick(Sender: TObject);
    procedure ME6CodBancoChange(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
    procedure TabSheet7Show(Sender: TObject);
    procedure TabSheet8Show(Sender: TObject);
    procedure TabSheet9Show(Sender: TObject);
    procedure TabSheet10Show(Sender: TObject);
    procedure TabSheet11Show(Sender: TObject);
    procedure TabSheet13Show(Sender: TObject);
    procedure TabSheet14Show(Sender: TObject);
    procedure TabSheet15Show(Sender: TObject);
    procedure TabSheet17Show(Sender: TObject);
    procedure TabSheet18Show(Sender: TObject);
    procedure SB17ContaCorrenteConsClick(Sender: TObject);
    procedure ME17CodContaCorrenteChange(Sender: TObject);
    procedure MECodFilial18Change(Sender: TObject);
    procedure SBCodFilial18Click(Sender: TObject);
    procedure SpeedButton55Click(Sender: TObject);
    procedure SB20CodClienteClick(Sender: TObject);
    procedure SB20CodFilialClick(Sender: TObject);
    procedure Sb3VendedorClick(Sender: TObject);
    procedure ME3CodFilialExit(Sender: TObject);
    procedure ME3CodDeptoExit(Sender: TObject);
    procedure ME3CodClienteExit(Sender: TObject);
    procedure Me3CodVendedorExit(Sender: TObject);
    procedure Me21CodFinalidadeExit(Sender: TObject);
    procedure ME20CodClienteExit(Sender: TObject);
    procedure ME20CodFilialExit(Sender: TObject);
    procedure Me21CodFilialExit(Sender: TObject);
    procedure Sb21FilialConsClick(Sender: TObject);
    procedure Sb21FinalidadeConsClick(Sender: TObject);
    procedure SpeedButton56Click(Sender: TObject);
    procedure CB2TodosVendedorClick(Sender: TObject);
    procedure Me2CodVendedorChange(Sender: TObject);
    procedure SB22FilialConsClick(Sender: TObject);
    procedure SB22FinalidadeConsClick(Sender: TObject);
    procedure ME22CodFilialExit(Sender: TObject);
    procedure ME22CodFinalidadeExit(Sender: TObject);
    procedure TabSheet23Show(Sender: TObject);
    procedure SB7RepresentanteClick(Sender: TObject);
    procedure ME7RepresentanteExit(Sender: TObject);
    procedure SB2CCClick(Sender: TObject);
    procedure ME2CCExit(Sender: TObject);
    procedure ME3FinalidadeExit(Sender: TObject);
    procedure SB3FinalidadeClick(Sender: TObject);
    procedure SB23FilialClick(Sender: TObject);
    procedure ME23FilialExit(Sender: TObject);
    procedure SB23ClienteClick(Sender: TObject);
    procedure ME23ClienteExit(Sender: TObject);
    procedure SB23TituloClick(Sender: TObject);
    procedure SpeedButton57Click(Sender: TObject);
    procedure Me1FinalidadeChange(Sender: TObject);
    procedure Sb1FinalidadeClick(Sender: TObject);
    procedure CB1TodosFinalidadeClick(Sender: TObject);
    procedure ME5TipoDocumentoChange(Sender: TObject);
    procedure CB5TipoDocumentoClick(Sender: TObject);
    procedure ME22CodBancoExit(Sender: TObject);
    procedure SB22BancoClick(Sender: TObject);
    procedure ME24CodFilialExit(Sender: TObject);
    procedure SB24FilialConsClick(Sender: TObject);
    procedure SpeedButton58Click(Sender: TObject);
    procedure SB24ContaCorrenteConsClick(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure ME3BancoExit(Sender: TObject);
    procedure SpeedButton60Click(Sender: TObject);
    procedure ME2FinalidadeChange(Sender: TObject);
    procedure SpeedButton61Click(Sender: TObject);
    procedure MEContratoExit(Sender: TObject);
    procedure ME24CodContaCorrenteExit(Sender: TObject);
    procedure Me13CodClienteExit(Sender: TObject);
    procedure Bt13ClienteClick(Sender: TObject);
    procedure Me14CodClienteExit(Sender: TObject);
    procedure Bt14ClienteClick(Sender: TObject);
    procedure ME26CadastroExit(Sender: TObject);
    procedure SpeedButton62Click(Sender: TObject);
    procedure SpeedButton63Click(Sender: TObject);
    procedure ME27FilialExit(Sender: TObject);
    procedure SB28FilialClick(Sender: TObject);
    procedure ME28FilialExit(Sender: TObject);
    procedure SB28ClassClick(Sender: TObject);
    procedure ME28ClassExit(Sender: TObject);
    procedure Me11CodSupervisorExit(Sender: TObject);
    procedure Bt11SupervisorClick(Sender: TObject);
    procedure Me4ClassificacaoChange(Sender: TObject);
    procedure SpeedButton64Click(Sender: TObject);
    procedure CB4TodosClassificacaoClick(Sender: TObject);
    procedure ME30CodFilialExit(Sender: TObject);
    procedure SpeedButton65Click(Sender: TObject);
    procedure ME30CodDeptoExit(Sender: TObject);
    procedure SpeedButton67Click(Sender: TObject);
    procedure ME30CodClienteExit(Sender: TObject);
    procedure SpeedButton66Click(Sender: TObject);
    procedure Me30CodVendedorExit(Sender: TObject);
    procedure SpeedButton68Click(Sender: TObject);
    procedure ME30CCExit(Sender: TObject);
    procedure SpeedButton69Click(Sender: TObject);
    procedure ME30FinalidadeExit(Sender: TObject);
    procedure SpeedButton70Click(Sender: TObject);
    procedure Me14ContaCorrenteExit(Sender: TObject);
    procedure Sb14ContaCorrenteClick(Sender: TObject);
    procedure SB31FilialClick(Sender: TObject);
    procedure ME31FilialExit(Sender: TObject);
    procedure SB31DepartamentoClick(Sender: TObject);
    procedure ME31departamentoExit(Sender: TObject);
    procedure SpeedButton71Click(Sender: TObject);
    procedure SpeedButton72Click(Sender: TObject);
    procedure ME32FilialExit(Sender: TObject);
    procedure ME32CadastroExit(Sender: TObject);
    procedure Me18CodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ME20CodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ME23ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ME30CodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ME32CadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ME9CodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ME8CodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ME5CodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ME4CodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ME3CodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ME2CodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ME1CodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ME0CodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Me34CodFilialExit(Sender: TObject);
    procedure ME34CodBancoExit(Sender: TObject);
    procedure SB34FilialConsClick(Sender: TObject);
    procedure SB34BancoConsClick(Sender: TObject);
    procedure ME19CodFilialExit(Sender: TObject);
    procedure ME19CodContaCorrenteExit(Sender: TObject);
    procedure SpeedButton73Click(Sender: TObject);
    procedure Me4ValorKeyPress(Sender: TObject; var Key: Char);
    procedure Sb17MensagemClick(Sender: TObject);
    procedure Me5ClassCadastroChange(Sender: TObject);
    procedure CB5TodosClassificacaoClick(Sender: TObject);
    procedure SpeedButton74Click(Sender: TObject);
    procedure SB13NumTituloClick(Sender: TObject);
    procedure SB14NumTituloClick(Sender: TObject);
    procedure Ed6DescontoExit(Sender: TObject);
    procedure ME36FilialExit(Sender: TObject);
    procedure SB36FilialClick(Sender: TObject);
    procedure ME36ContaCorrenteExit(Sender: TObject);
    procedure SB36ContaCorrenteClick(Sender: TObject);
    procedure ME36BancoChange(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Sb4ContratoVendaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
 

  end;

var
  FContasReceberParam: TFContasReceberParam;


implementation

uses UFilialCons, UOracle_cl, UFilial_cl, UCadastroCons, UCadastro_cl,
  UBancosCons, UBancoAgencia_cl, UFinalidadeCons, UFinalidade_cl,
  URegiaoCons, URegiao_cl, UContasReceber_cl, UParamSistema_cl,
  UDepartamentoCons, UDepartamento_cl, UVendedorCons, UBiblioteca,
  UVendedor_cl, UContasReceberCons, UContaCorrenteCons,
  UUsuario_cl, USequencia_cl, UNotaSaidaCons, UObraContrato_Cons,
  UObraContrato_cl, UClassCadastroCons, UClassCadastro_cl, UMensagemCons,
  UMensagem_cl, UContratoVenda_Cons, Ucontrato_cl;

{$R *.DFM}

procedure TFContasReceberParam.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    ME0CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFContasReceberParam.ME0CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodFilial.Text)<>'' then
    Begin
      ME0Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME0COdFilial.Text);
      CB0Todos.Checked:=False;
    End
  else
    Begin
      ME0Filial.Clear;
      CB0Todos.Checked:=True;
    End;
end;

procedure TFContasReceberParam.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    ME1CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFContasReceberParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    Begin
      ME1Codigo.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
      ME1Cliente.Text:=DMCadastro.QCadastroConsNome.Value;
    End;
end;

procedure TFContasReceberParam.ME1CodigoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME1Codigo.Text)<>'' then
    Begin
      ME1Cliente.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME1Codigo.Text);
      CB1TodosCliente.Checked:=False;
    End
  else
    Begin
      ME1Cliente.Clear;
      CB1TodosCliente.Checked:=True;
    End;
end;

procedure TFContasReceberParam.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    ME2CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFContasReceberParam.ME2CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME2CodFilial.Text)<>'' then
    begin
      ME2Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME2CodFilial.Text);
      CB2TodosFilial.Checked:=False;
    end
  else
    begin
      ME2Filial.Clear;
      CB2TodosFilial.Checked:=True;
    end;
end;

procedure TFContasReceberParam.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    Begin
      ME2CodCliente.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    End;
end;

procedure TFContasReceberParam.ME2CodClienteChange(Sender: TObject);
begin
  inherited;
  if Trim(ME2CodCliente.Text)<>'' then
    begin
      ME2Cliente.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME2CodCliente.Text);
      CB2TodosCliente.Checked:=False;
    end
  else
    begin
      ME2Cliente.Clear;
      CB2TodosCliente.Checked:=True;
    end;
end;

procedure TFContasReceberParam.ME1CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodFilial.Text)<>'' then
    Begin
      ME1Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME1CodFilial.Text);
      CB1TodosFilial.Checked:=False;
    End
  else
    Begin
      ME1Filial.Clear;
      CB1TodosFilial.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB0TodosClick(Sender: TObject);
begin
  inherited;
  if CB0Todos.Checked then
    ME0CodFilial.Clear;
end;

procedure TFContasReceberParam.CB1TodosFilialClick(Sender: TObject);
begin
  inherited;
  If CB1TodosFilial.Checked Then
    ME1CodFilial.Clear;
end;

procedure TFContasReceberParam.CB1TodosClienteClick(Sender: TObject);
begin
  inherited;
  if CB1TodosCliente.Checked then
    ME1Codigo.Clear;
end;

procedure TFContasReceberParam.CB2TodosFilialClick(Sender: TObject);
begin
  inherited;
  if CB2TodosFilial.Checked then
    ME2CodFilial.Clear;
end;

procedure TFContasReceberParam.CB2TodosClienteClick(Sender: TObject);
begin
  inherited;
  if CB2TodosCliente.Checked then
    ME2CodCliente.Clear;
end;

procedure TFContasReceberParam.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    ME3CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFContasReceberParam.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
     ME3CodCliente.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
end;

procedure TFContasReceberParam.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    ME4CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFContasReceberParam.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    Begin
      ME4CodCliente.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    End;
end;

procedure TFContasReceberParam.ME4CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME4CodFilial.Text)<>'' then
    Begin
      ME4Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME4CodFilial.Text);
      CB4TodosFilial.Checked:=False;
    End
  else
    Begin
      ME4Filial.Clear;
      CB4TodosFilial.Checked:=True;
    End;
end;

procedure TFContasReceberParam.ME4CodClienteChange(Sender: TObject);
begin
  inherited;
  if Trim(ME4CodCliente.Text)<>'' then
    Begin
      ME4Cliente.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME4CodCliente.Text);
      CB4TodosCliente.Checked:=False;
    End
  else
    Begin
      ME4Cliente.Clear;
      CB4TodosCliente.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB4TodosFilialClick(Sender: TObject);
begin
  inherited;
  If CB4TodosFilial.Checked then
    ME4CodFilial.Clear;
end;

procedure TFContasReceberParam.CB4TodosClienteClick(Sender: TObject);
begin
  inherited;
  If CB4TodosCliente.Checked then
    ME4CodCliente.Clear;
end;

procedure TFContasReceberParam.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
     ME0CodCliente.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
end;

procedure TFContasReceberParam.ME0CodClienteChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodCliente.Text)<>'' then
    Begin
      ME0Cliente.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME0CodCliente.Text);
      CB0TodosCliente.Checked:=False;
    End
  else
    Begin
      ME0Cliente.Clear;
      CB0TodosCliente.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB0TodosClienteClick(Sender: TObject);
begin
  inherited;
  if CB0TodosCliente.Checked then
    ME0CodCliente.Clear;
end;

procedure TFContasReceberParam.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  If FBancosCons=Nil then
    FBancosCons:=TFBancosCons.Create(Application);
  If FBancosCons.ShowModal=mrOk then
     ME0CodBanco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value);
end;

procedure TFContasReceberParam.ME0CodBancoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodBanco.Text)<>'' then
    Begin
      ME0Banco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME0CodBanco.Text);
      CB0TodosBanco.Checked:=False;
    End
  else
    Begin
      ME0Banco.Clear;
      CB0TodosBanco.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB0TodosBancoClick(Sender: TObject);
begin
  inherited;
  if CB0TodosBanco.Checked then
    ME0CodBanco.Clear;
end;

procedure TFContasReceberParam.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  If FFinalidadeCons=Nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal=mrOk then
    ME0CodFinalidade.Text:=FloatToStr(DMFinalidade.QFinalidadeConsCod_Finalidade.Value);
end;

procedure TFContasReceberParam.ME0CodFinalidadeChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodFinalidade.Text)<>'' then
    Begin
      ME0Finalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+ME0CodFinalidade.Text);
      CB0TodosFinalidade.Checked:=False;
    End
  else
    Begin
      ME0Finalidade.Clear;
      CB0TodosFinalidade.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB0TodosFinalidadeClick(Sender: TObject);
begin
  inherited;
  if CB0TodosFinalidade.Checked then
    ME0CodFinalidade.Clear;
end;

procedure TFContasReceberParam.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    ME5CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFContasReceberParam.ME5CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME5CodFilial.Text)<>'' then
    Begin
      ME5Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME5CodFilial.Text);
      CB5TodosFilial.Checked:=False;
    End
  else
    Begin
      ME5Filial.Clear;
      CB5TodosFilial.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB5TodosFilialClick(Sender: TObject);
begin
  inherited;
  If CB5TodosFilial.Checked then
    ME5CodFilial.Clear;
end;

procedure TFContasReceberParam.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  If FRegiaoCons=Nil then
    FRegiaoCons:=TFRegiaoCons.Create(Application);
  If FRegiaoCons.ShowModal=mrOk then
    ME5CodRegiao.Text:=FloatToStr(DMRegiao.QRegiaoConsCod_Regiao.Value);
end;

procedure TFContasReceberParam.ME5CodRegiaoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME5CodRegiao.Text)<>'' then
    Begin
      ME5Regiao.Text:=DMOracle.BuscaNome('SELECT DESC_REGIAO FROM TB_REGIAO','COD_REGIAO = '+ME5CodRegiao.Text);
      CB5TodosRegiao.Checked:=False;
    End
  else
    Begin
      ME5Regiao.Clear;
      CB5TodosRegiao.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB5TodosRegiaoClick(Sender: TObject);
begin
  inherited;
  If CB5TodosRegiao.Checked then
    ME5CodRegiao.Clear;
end;

procedure TFContasReceberParam.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  If FBancosCons=Nil then
    FBancosCons:=TFBancosCons.Create(Application);
  If FBancosCons.ShowModal=mrOk then
    begin
      ME4CodBanco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value);
    end;
end;

procedure TFContasReceberParam.ME4CodBancoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME4CodBanco.Text)<>'' then
    Begin
      ME4Banco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME4CodBanco.Text);
      CB4TodosBanco.Checked:=False;
    End
  else
    Begin
      ME4Banco.Clear;
      CB4TodosBanco.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB4TodosBancoClick(Sender: TObject);
begin
  inherited;
  if CB4TodosBanco.Checked then
    ME4CodBanco.Clear;
end;

procedure TFContasReceberParam.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  If FRegiaoCons=Nil then
    FRegiaoCons:=TFRegiaoCons.Create(Application);
  If FRegiaoCons.ShowModal=mrOk then
    ME4CodRegiao.Text:=FloatToStr(DMRegiao.QRegiaoConsCod_Regiao.Value);
end;

procedure TFContasReceberParam.ME4CodRegiaoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME4CodRegiao.Text)<>'' then
    Begin
      ME4Regiao.Text:=DMOracle.BuscaNome('SELECT DESC_REGIAO FROM TB_REGIAO','COD_REGIAO = '+ME4CodRegiao.Text);
      CB4TodosRegiao.Checked:=False;
    End
  else
    Begin
      ME4Regiao.Clear;
      CB4TodosRegiao.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB4TodosRegiaoClick(Sender: TObject);
begin
  inherited;
  If CB4TodosRegiao.Checked then
    ME4CodRegiao.Clear;
end;

procedure TFContasReceberParam.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    Begin
      ME5CodCliente.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    End;
end;

procedure TFContasReceberParam.ME5CodClienteChange(Sender: TObject);
begin
  inherited;
  if Trim(ME5CodCliente.Text)<>'' then
    Begin
      ME5Cliente.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME5CodCliente.Text);
      CB5TodosCliente.Checked:=False;
    End
  else
    Begin
      ME5Cliente.Clear;
      CB5TodosCliente.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB5TodosClienteClick(Sender: TObject);
begin
  inherited;
  If CB5TodosCliente.Checked then
    ME5CodCliente.Clear;
end;

procedure TFContasReceberParam.ME6NrNotaExit(Sender: TObject);
begin
  inherited;
  If Trim(ME6NrNota.Text)<>'' then
    ME6CodBanco.Text:=DMOracle.BuscaNome('SELECT DISTINCT COD_BANCO_AGENCIA FROM TB_CONTA_RECEBER_CAB','COD_NOTA_CAB = '+ME6NrNota.Text);
end;

procedure TFContasReceberParam.FormActivate(Sender: TObject);
begin
  inherited;
//  ME0CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
//  ME1CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
//  ME2CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
//  ME3CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
//  ME4CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
//  ME5CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  //ME6CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  //ME7CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
//  ME8CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
//  ME9CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
//  ME10CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
//  ME11CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
//  ME12CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
//  Me13Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
//  Me14Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
//  ME17CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME4DtRefEmissao.Text := DateToStr(Date);
  ME4DtReferencia.Text := DateToStr(Date);
  ME1DtReferencia.Text := DateToStr(Date);
  ME0DtBase.Text := DateToStr(Date);
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' Then
   Begin
     Label29.Caption := 'Ligar';
     Label27.Caption := 'Ligar';
   End;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE' Then
   Begin
     Label220.Visible := True;
     Ed6Desconto.Visible := True;
     If (DMUsuario.pTipoFuncionario = 'VENDEDOR') Then
      Begin
        Me4CodVendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
        SpeedButton33.Enabled := False;
        Me4CodVendedor.Enabled := False;
        Me12CodVendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
        Me12CodVendedor.Enabled := False;
        SpeedButton43.Enabled := False;
     End;
   end;
   if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ' then
   begin
     ME7CodFilial.Visible    := false;
     ME7Filial.Visible       := false;
     SpeedButton19.Visible   := false;
     CB7TodosFilial.Visible  := false;
     Label36.Visible         := false;
     Label47.Visible         := false;
     Me7CodDepto.Visible     := false;
     SpeedButton29.Visible   := false;
     ME7Departamento.Visible := false;
     CB7TodosDepto.Visible   := false;
     Label59.Visible         := false;
     Me7NrNota.Visible       := false;
     SPeedButton35.Visible   := false;
     Button3.Visible         := false;
     Me7CodNota.Visible      := false;
     Label241.Visible        := true;
     Me7NumParcela.Visible   := true;
   end;
end;

procedure TFContasReceberParam.SpeedButton19Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    ME7CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFContasReceberParam.ME6CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME6CodFilial.Text)<>'' then
    Begin
      Ed6Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME6CodFilial.Text);
    End
  else
    Begin
      ME6CodFilial.Clear;
      Ed6Filial.Text := 'Todas';
    End;
end;

procedure TFContasReceberParam.CB7TodosFilialClick(Sender: TObject);
begin
  inherited;
  If CB7TodosFilial.Checked then
    ME7CodFilial.Clear;
end;

procedure TFContasReceberParam.SpeedButton20Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    ME8CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFContasReceberParam.ME8CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME8CodFilial.Text)<>'' then
    Begin
      ME8Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME8CodFilial.Text);
      CB8TodosFilial.Checked:=False;
    End
  else
    Begin
      ME8Filial.Clear;
      CB8TodosFilial.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB8TodosFilialClick(Sender: TObject);
begin
  inherited;
  If CB8TodosFilial.Checked then
    ME8CodFilial.Clear;
end;

procedure TFContasReceberParam.SpeedButton21Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    Begin
      ME8CodCliente.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    End;
end;

procedure TFContasReceberParam.ME8CodClienteChange(Sender: TObject);
begin
  inherited;
  if Trim(ME8CodCliente.Text)<>'' then
    Begin
      ME8Cliente.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME8CodCliente.Text);
      CB8TodosCliente.Checked:=False;
    End
  else
    Begin
      ME8Cliente.Clear;
      CB8TodosCliente.Checked:=True;
    End;

end;

procedure TFContasReceberParam.CB8TodosClienteClick(Sender: TObject);
begin
  inherited;
  If CB8TodosCliente.Checked then
    ME8CodCliente.Clear;
end;

procedure TFContasReceberParam.SpeedButton22Click(Sender: TObject);
begin
  inherited;
  If FBancosCons=Nil then
    FBancosCons:=TFBancosCons.Create(Application);
  If FBancosCons.ShowModal=mrOk then
    begin
      ME8CodBanco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value);
    end;
end;

procedure TFContasReceberParam.ME8CodBancoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME8CodBanco.Text)<>'' then
    Begin
      ME8Banco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME8CodBanco.Text);
      CB8TodosBanco.Checked:=False;
    End
  else
    Begin
      ME8Banco.Clear;
      CB8TodosBanco.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB8TodosBancoClick(Sender: TObject);
begin
  inherited;
  if CB8TodosBanco.Checked then
    ME8CodBanco.Clear;
end;

procedure TFContasReceberParam.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
    ME0CodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
end;

procedure TFContasReceberParam.ME0CodDeptoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodDepto.Text)<>'' then
    Begin
      ME0Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+ME0COdDepto.Text);
      CB0TodosDepto.Checked:=False;
    End
  else
    Begin
      ME0Departamento.Clear;
      CB0TodosDepto.Checked:=True;
    End;
end;

procedure TFContasReceberParam.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
    ME1CodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
end;

procedure TFContasReceberParam.ME1CodDeptoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodDepto.Text)<>'' then
    Begin
      ME1Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+ME1COdDepto.Text);
      CB1TodosDepto.Checked:=False;
    End
  else
    Begin
      ME1Departamento.Clear;
      CB1TodosDepto.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB1TodosDeptoClick(Sender: TObject);
begin
  inherited;
  if CB1TodosDepto.Checked then
    ME1CodDepto.Clear;
end;

procedure TFContasReceberParam.CB0TodosDeptoClick(Sender: TObject);
begin
  inherited;
  if CB0TodosDepto.Checked then
    ME0CodDepto.Clear;
end;

procedure TFContasReceberParam.CB2TodosDeptoClick(Sender: TObject);
begin
  inherited;
  if CB2TodosDepto.Checked then
    ME2CodDepto.Clear;

end;

procedure TFContasReceberParam.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
    ME2CodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
end;

procedure TFContasReceberParam.ME2CodDeptoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME2CodDepto.Text)<>'' then
    Begin
      ME2Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+ME2COdDepto.Text);
      CB2TodosDepto.Checked:=False;
    End
  else
    Begin
      ME2Departamento.Clear;
      CB2TodosDepto.Checked:=True;
    End;
end;

procedure TFContasReceberParam.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
    ME3CodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
end;

procedure TFContasReceberParam.SpeedButton27Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
    ME4CodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
end;

procedure TFContasReceberParam.ME4CodDeptoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME4CodDepto.Text)<>'' then
    Begin
      ME4Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+ME4COdDepto.Text);
      CB4TodosDepto.Checked:=False;
    End
  else
    Begin
      ME4Departamento.Clear;
      CB4TodosDepto.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB4TodosDeptoClick(Sender: TObject);
begin
  inherited;
  if CB4TodosDepto.Checked then
    ME4CodDepto.Clear;
end;

procedure TFContasReceberParam.CB5TodosDeptoClick(Sender: TObject);
begin
  inherited;
  if CB5TodosDepto.Checked then
    ME5CodDepto.Clear;
end;

procedure TFContasReceberParam.SpeedButton28Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
    ME5CodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
end;

procedure TFContasReceberParam.ME5CodDeptoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME5CodDepto.Text)<>'' then
    Begin
      ME5Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+ME5COdDepto.Text);
      CB5TodosDepto.Checked:=False;
    End
  else
    Begin
      ME5Departamento.Clear;
      CB5TodosDepto.Checked:=True;
    End;
end;

procedure TFContasReceberParam.SpeedButton29Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
    ME7CodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
end;

procedure TFContasReceberParam.ME7CodDeptoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME7CodDepto.Text)<>'' then
    Begin
      ME7Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+ME7COdDepto.Text);
      CB7TodosDepto.Checked:=False;
    End
  else
    Begin
      ME7Departamento.Clear;
      CB7TodosDepto.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB7TodosDeptoClick(Sender: TObject);
begin
  inherited;
  if CB7TodosDepto.Checked then
    ME7CodDepto.Clear;
end;

procedure TFContasReceberParam.SpeedButton30Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
    ME8CodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
end;

procedure TFContasReceberParam.ME8CodDeptoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME8CodDepto.Text)<>'' then
    Begin
      ME8Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+ME8COdDepto.Text);
      CB8TodosDepto.Checked:=False;
    End
  else
    Begin
      ME8Departamento.Clear;
      CB8TodosDepto.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB8TodosDeptoClick(Sender: TObject);
begin
  inherited;
  if CB8TodosDepto.Checked then
    ME8CodDepto.Clear;
end;

procedure TFContasReceberParam.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    ME9CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFContasReceberParam.ME9CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME9CodFilial.Text)<>'' then
    Begin
      ME9Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME9CodFilial.Text);
      CB9TodosFilial.Checked:=False;
    End
  else
    Begin
      ME9Filial.Clear;
      CB9TodosFilial.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB9TodosFilialClick(Sender: TObject);
begin
  inherited;
  If CB9TodosFilial.Checked then
    ME9CodFilial.Clear;
end;

procedure TFContasReceberParam.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    Begin
      ME9CodCliente.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    End;
end;

procedure TFContasReceberParam.ME9CodClienteChange(Sender: TObject);
begin
  inherited;
  if Trim(ME9CodCliente.Text)<>'' then
    Begin
      ME9Cliente.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME9CodCliente.Text);
      CB9TodosCliente.Checked:=False;
    End
  else
    Begin
      ME9Cliente.Clear;
      CB9TodosCliente.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB9TodosClienteClick(Sender: TObject);
begin
  inherited;
  If CB9TodosCliente.Checked then
    ME9CodCliente.Clear;
end;

procedure TFContasReceberParam.SpeedButton31Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  if FNotaSaidaCons.ShowModal = MrOk  then
  begin
    Me6NrNota.Text:=FloatToStr(DMContasReceber.QNotaSaidaConsNum_Nota.Value);
    Me6CodNota.Text:=FloatToStr(DMContasReceber.QNotaSaidaConsCod_Nota_Cab.Value);
  end;
end;

procedure TFContasReceberParam.Button1Click(Sender: TObject);
begin
  inherited;
  Me6CodNota.Text := '';
  Me6NrNota.Text := '';
end;

procedure TFContasReceberParam.SpeedButton32Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME10CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
      ME10CodFilialExit(Self);
    end;
end;

procedure TFContasReceberParam.ME10CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10CodFilial.Text)<>'' then
    ME10Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME10CodFilial.Text)
  else
    ME10Filial.Clear;
end;

procedure TFContasReceberParam.SpeedButton33Click(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons:=TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk  then
    begin
    ME4CodVendedor.Text:=DMVendedor.QVendedorConsCod_Vendedor.Text;
  end
end;

procedure TFContasReceberParam.ME4CodVendedorChange(Sender: TObject);
begin
  inherited;
  if Trim(ME4CodVendedor.Text)<>'' then
    Begin
      ME4Vendedor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+ME4CodVendedor.Text);
      CB4TodosVendedor.Checked:=False;
    End
  else
    Begin
      ME4Vendedor.Clear;
      CB4TodosVendedor.Checked:=True;
    End;
end;

procedure TFContasReceberParam.CB4TodosVendedorClick(Sender: TObject);
begin
  inherited;
  If CB4TodosVendedor.Checked then
    ME4CodVendedor.Clear;
end;

procedure TFContasReceberParam.SpeedButton34Click(Sender: TObject);
begin
  inherited;
  If FContasReceberCons = Nil then
    FContasReceberCons:=TFContasReceberCons.Create(Application);
  If FContasReceberCons.ShowModal=mrOK then
  Begin
    ME6NrTitulo.Text:=FloatToStr(DmContasReceber.QContasReceber_CabConsNum_Titulo.Value);
    ME6CodContaReceberCab.Text:=FloatToStr(DmContasReceber.QContasReceber_CabConsCod_Conta_Receber_Cab.Value);
  end;
end;

procedure TFContasReceberParam.Button2Click(Sender: TObject);
begin
  inherited;
  Me6CodContaReceberCab.Text := '';
  Me6NrTitulo.Text := '';
end;

procedure TFContasReceberParam.Button3Click(Sender: TObject);
begin
  inherited;
  Me7CodNota.Text := '';
  Me7NrNota.Text := '';

end;

procedure TFContasReceberParam.Button4Click(Sender: TObject);
begin
  inherited;
  Me7CodTitulo.Text := '';
  Me7NrTitulo.Text := '';

end;

procedure TFContasReceberParam.SpeedButton35Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = Nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  if FNotaSaidaCons.ShowModal = MrOk  then
  begin
    ME7NrNota.Text:=FloatToStr(DMContasReceber.QNotaSaidaConsNum_Nota.Value);
    ME7CodNota.Text:=FloatToStr(DMContasReceber.QNotaSaidaConsCod_Nota_Cab.Value);
  end;

end;

procedure TFContasReceberParam.SpeedButton36Click(Sender: TObject);
begin
  inherited;
  If FContasReceberCons = Nil then
    FContasReceberCons:=TFContasReceberCons.Create(Application);
  If FContasReceberCons.ShowModal=mrOK then
  Begin
    ME7NrTitulo.Text:=FloatToStr(DmContasReceber.QContasReceber_CabConsNum_Titulo.Value);
    ME7CodTitulo.Text:=FloatToStr(DmContasReceber.QContasReceber_CabConsCod_Conta_Receber_Cab.Value);
  end;

end;

procedure TFContasReceberParam.SpeedButton37Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:= TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk  then
    begin
      ME11CodFilial.text:=DMFilial.QFilialConsCOD_FILIAL.Text;
      ME11CodFilialChange(Self);
    end;
end;

procedure TFContasReceberParam.SpeedButton38Click(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    begin
      ME11CodVendedor.text:= DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
      ME11CodVendedorExit(Self);
    end;
end;

procedure TFContasReceberParam.ME11CodVendedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME11CodVendedor.text)<>'' then
    ME11Vendedor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+ME11CodVendedor.text)
  else
    ME11Vendedor.Text:='Todos';
end;

procedure TFContasReceberParam.ME11CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME11CodFilial.text)<>'' then
    ME11Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME11COdFilial.text)
  else
    ME11Filial.Text:='Todos';

end;

procedure TFContasReceberParam.SpeedButton39Click(Sender: TObject);
begin
  inherited;
  if FFinalidadeCons = nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal = mrOk  then
   Begin
     If Trim(ME4CodFinalidade.Text) <> '' Then
        ME4CodFinalidade.Text := ME4CodFinalidade.Text + ',';
     ME4CodFinalidade.Text := ME4CodFinalidade.Text + DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
   End;
end;

procedure TFContasReceberParam.Me11CodDeptoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME11CodDepto.Text)<>'' then
      ME11Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+ME11COdDepto.Text)
  else
      ME11Departamento.Text := 'Todos';

end;

procedure TFContasReceberParam.SpeedButton40Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
    ME11CodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);

end;

procedure TFContasReceberParam.Me6NrNotaFExit(Sender: TObject);
begin
  inherited;
  If Trim(ME6NrNotaF.Text)<>'' then
    ME6CodBanco.Text:=DMOracle.BuscaNome('SELECT DISTINCT COD_BANCO_AGENCIA FROM TB_CONTA_RECEBER_CAB','COD_NOTA_CAB = '+ME6NrNotaF.Text);

end;

procedure TFContasReceberParam.SpeedButton41Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = Nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  if FNotaSaidaCons.ShowModal = MrOk  then
  begin
    ME6NrNotaF.Text:=FloatToStr(DMContasReceber.QNotaSaidaConsNum_Nota.Value);
    ME6CodNotaF.Text:=FloatToStr(DMContasReceber.QNotaSaidaConsCod_Nota_Cab.Value);
  end;

end;

procedure TFContasReceberParam.Button5Click(Sender: TObject);
begin
  inherited;
  Me6CodNotaF.Text := '';
  Me6NrNotaF.Text := '';

end;

procedure TFContasReceberParam.ME12CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME12CodFilial.text)<>'' then
    ME12Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME12COdFilial.text)
  else
    ME12Filial.Text:='Todos';

end;

procedure TFContasReceberParam.SpeedButton42Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:= TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk  then
    begin
      ME12CodFilial.text:=DMFilial.QFilialConsCOD_FILIAL.Text;
      ME12CodFilialChange(Self);
    end;

end;

procedure TFContasReceberParam.ME12CodVendedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME12CodVendedor.text)<>'' then
    ME12Vendedor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+ME12CodVendedor.text)
  else
    ME12Vendedor.Text:='Todos';

end;

procedure TFContasReceberParam.SpeedButton43Click(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
     FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    begin
      ME12CodVendedor.text:= DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
      ME12CodVendedorExit(Self);
    end;

end;

procedure TFContasReceberParam.Me13FilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME13Filial.text)<>'' then
    Ed13Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME13Filial.text)
  else
    Ed13Filial.Text:='Todos';

end;

procedure TFContasReceberParam.SpeedButton44Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:= TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk  then
    begin
      ME13Filial.text:=DMFilial.QFilialConsCOD_FILIAL.Text;
      ME13FilialChange(Self);
    end;

end;

procedure TFContasReceberParam.Me13DepartamentoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME13Departamento.Text)<>'' then
      Ed13Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+ME13Departamento.Text)
  else
      Ed13Departamento.Text := 'Todos';

end;

procedure TFContasReceberParam.SpeedButton46Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
    ME13Departamento.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);

end;

procedure TFContasReceberParam.Me14FilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME14Filial.text)<>'' then
    Ed14Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME14Filial.text)
  else
    Ed14Filial.Text:='Todos';

end;

procedure TFContasReceberParam.SpeedButton45Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:= TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk  then
    begin
      ME14Filial.text:=DMFilial.QFilialConsCOD_FILIAL.Text;
      ME14FilialChange(Self);
    end;

end;

procedure TFContasReceberParam.Me14BancoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME14Banco.Text)<>'' then
      Ed14Banco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_banco_agencia','COD_BANCO = '+ME14Banco.Text)
  else
      Ed14Banco.Text := 'Todos';

end;

procedure TFContasReceberParam.SpeedButton47Click(Sender: TObject);
begin
  inherited;
  If FBancosCons=Nil then
    FBancosCons:=TFBancosCons.Create(Application);
  If FBancosCons.ShowModal=mrOk then
    ME14Banco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value);

end;

procedure TFContasReceberParam.Me14DepartamentoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME14Departamento.Text)<>'' then
      Ed14Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+ME14Departamento.Text)
  else
      Ed14Departamento.Text := 'Todos';

end;

procedure TFContasReceberParam.SpeedButton48Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
    ME14Departamento.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);

end;

procedure TFContasReceberParam.ME7CodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(ME7CodFilial.Text)<>'' then
    Begin
      ME7Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME7CodFilial.Text);
      CB7TodosFilial.Checked:=False;
    End
  else
    Begin
      ME7Filial.Clear;
      CB7TodosFilial.Checked:=True;
    End;

end;

procedure TFContasReceberParam.SpeedButton51Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME6CodFilial.Text:=DMFilial.QFilialConsCod_filial.Text;
      ME6CodFilialChange(Self);
    end;

end;

procedure TFContasReceberParam.ME17CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME17CodFilial.text)<>'' then
    ME17Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME17CodFilial.text)
  else
    ME17Filial.Clear;
end;

procedure TFContasReceberParam.Bt17FilialCons(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME17CodFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;
      ME17CodFilialExit(Self);
    end;
end;

procedure TFContasReceberParam.MEDigitoExit(Sender: TObject);
var wCodBanco: String;
begin
  inherited;
  if Trim(MEDigito.Text) <> '' then
  begin
    // Verifica se banco é igual 399 ou seja HSBC
    wCodBanco:=DMOracle.BuscaNome('SELECT COD_BANCO FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME6CodBanco.Text);
    //Sergio modificado 17/07/2003 - motivo nao apresentar erro qdo for Bradesco
    //rotina original abaixo
    Case StrToInt(wCodBanco) Of
      399 :Begin
             if Trim(MEDigito.Text) <> Bib.DigitoVerificadorHSBC(Copy(Trim(ME6NrBloqueto.Text),2,10)) then
             begin
               MessageDlg('Digito verificador HSBC invalido! Tente novamente!',mtWarning,[mbOk],0);
               MEDigito.SetFocus;
             end;
           End;
      237 :Begin
           End;
      Else
      begin
        if Trim(MEDigito.Text) <> Bib.DigitoVerificador(Copy(Trim(ME6NrBloqueto.Text),1,12)) then
        begin
          MessageDlg('Digito verificador invalido! Tente novamente!',mtWarning,[mbOk],0);
          ME6NrBloqueto.SetFocus;
        end;
      end;
    End;
{    if  Trim(wCodBanco) = '399' then
    begin
      if Trim(MEDigito.Text) <> Bib.DigitoVerificadorHSBC(Copy(Trim(ME6NrBloqueto.Text),2,10)) then
      begin
        MessageDlg('Digito verificador HSBC invalido! Tente novamente!',mtWarning,[mbOk],0);
        MEDigito.SetFocus;
      end;
    end
    else
    begin
      if Trim(MEDigito.Text) <> Bib.DigitoVerificador(Copy(Trim(ME6NrBloqueto.Text),1,12)) then
      begin
        MessageDlg('Digito verificador invalido! Tente novamente!',mtWarning,[mbOk],0);
        ME6NrBloqueto.SetFocus;
      end;
    end;}
  end;
end;

procedure TFContasReceberParam.Me18CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME18CodFilial.Text)<>'' then
     ME18Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME18CodFilial.Text)
  else
     ME4Filial.Text := 'Todos';
end;

procedure TFContasReceberParam.SpeedButton49Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
   Begin
    ME18CodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    Me18CodFilialExit(Self);
   End;
end;

procedure TFContasReceberParam.Me18CodDeptoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME18CodDepto.Text)<>'' then
      ME18Departamento.Text:=DMOracle.BuscaNome('SELECT Desc_Departamento FROM Tb_Departamento','Cod_Departamento = '+ME18CodDepto.Text)
  else
      ME18Departamento.Text := 'Todos';

end;

procedure TFContasReceberParam.SpeedButton50Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
   Begin
    ME18CodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
    ME18CodDeptoExit(Self);
   End; 
end;

procedure TFContasReceberParam.SpeedButton52Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    Begin
      ME18CodCliente.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
      Me18CodClienteExit(Self);
    End;

end;

procedure TFContasReceberParam.Me18CodBancoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME18CodBanco.Text)<>'' then
     ME8Banco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME18CodBanco.Text)
  else
     ME8Banco.Text:='Todos';
end;

procedure TFContasReceberParam.SpeedButton53Click(Sender: TObject);
begin
  inherited;
  If FBancosCons=Nil then
    FBancosCons:=TFBancosCons.Create(Application);
  If FBancosCons.ShowModal=mrOk then
    begin
      ME18CodBanco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value);
      ME18CodBancoExit(Self);
    end;

end;

procedure TFContasReceberParam.Me18CodFinalidadeExit(Sender: TObject);
begin
  inherited;
  if Trim(ME18CodFinalidade.Text)<>'' then
     ME18Finalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+ME18CodFinalidade.Text)
  else
     ME18Finalidade.Text := 'Todos';

end;

procedure TFContasReceberParam.SpeedButton54Click(Sender: TObject);
begin
  inherited;
  if FFinalidadeCons = nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal = mrOk  then
  begin
    ME18CodFinalidade.Text:=DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    ME18CodFinalidadeExit(Self);
  end
end;

procedure TFContasReceberParam.Me18CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME18CodCliente.Text)<>'' then
     ME18Cliente.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME18CodCliente.Text)
  else
     ME18Cliente.Text:='Todos';
end;

procedure TFContasReceberParam.SBFilialCons19Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME19CodFilial.Text:=DMFilial.QFilialConsCod_filial.Text;
      ME19CodFilialExit(Self);
    end;
end;

procedure TFContasReceberParam.SBNotaConsI19Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = nil then
     FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  if FNotaSaidaCons.ShowModal = MrOk  then
  begin
    Me19NrNota.Text:=FloatToStr(DMContasReceber.QNotaSaidaConsNum_Nota.Value);
    ME19CodNota.Text:=FloatToStr(DMContasReceber.QNotaSaidaConsCod_Nota_Cab.Value);
  end;
end;

procedure TFContasReceberParam.SBNotaConsF19Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaCons = nil then
     FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  If FNotaSaidaCons.ShowModal = MrOk  Then
  Begin
    Me19NrNotaF.Text :=FloatToStr(DMContasReceber.QNotaSaidaConsNum_Nota.Value);
    ME19CodNotaF.Text:=FloatToStr(DMContasReceber.QNotaSaidaConsCod_Nota_Cab.Value);
  End;
end;

procedure TFContasReceberParam.SBTituloCons19Click(Sender: TObject);
begin
  inherited;
  if FContasReceberCons = Nil then
     FContasReceberCons:=TFContasReceberCons.Create(Application);
  if FContasReceberCons.ShowModal=mrOK then
  Begin
    Me19NrTitulo.Text:=FloatToStr(DmContasReceber.QContasReceber_CabConsNum_Titulo.Value);
    Me19CodContaReceberCab.Text :=FloatToStr(DmContasReceber.QContasReceber_CabConsCod_Conta_Receber_Cab.Value);
  End;
end;

procedure TFContasReceberParam.BntLimpa1Click(Sender: TObject);
begin
  inherited;
  Me19CodNota.Text := '';
  Me19NrNota.Text := '';
end;

procedure TFContasReceberParam.BtnLimpa2Click(Sender: TObject);
begin
  inherited;
  Me19CodNotaF.Text := '';
  Me19NrNotaF.Text := '';
end;

procedure TFContasReceberParam.BtnLimpa3Click(Sender: TObject);
begin
  inherited;
  Me19CodContaReceberCab.Text := '';
  Me19NrTitulo.Text := '';
end;

procedure TFContasReceberParam.SB19ContaCorrenteConsClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
     FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOk then
     ME19CodContaCorrente.Text:= DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.AsString;
  ME19CodContaCorrenteExit(Self);   
end;

procedure TFContasReceberParam.ME19CodBancoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME19CodBanco.Text)<>'' then
     ME19DescBanco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME19CodBanco.Text)
  else
     ME19DescBanco.Clear;
end;

procedure TFContasReceberParam.ME6CodContaCorrenteChange(Sender: TObject);
begin
  inherited;
  if Trim(ME6CodContaCorrente.Text) <> '' then
  begin
    ME6DescContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME6CodContaCorrente.Text);
    ME6CodBanco.Text:= DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME6CodContaCorrente.Text);
  end
  else
     ME6DescContaCorrente.Text:= 'Conta corrente não informada';
end;

procedure TFContasReceberParam.SB6ContaCorrenteConsClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
     FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOk then
     ME6CodContaCorrente.Text:= DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.AsString;
end;

procedure TFContasReceberParam.ME6CodBancoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME6CodBanco.Text) <> '' then
     ME6Banco.Text:= DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME6CodBanco.Text);
end;

procedure TFContasReceberParam.TabSheet1Show(Sender: TObject);
begin
  inherited;
  FContasReceberParam.HelpContext:=9;
end;

procedure TFContasReceberParam.TabSheet2Show(Sender: TObject);
begin
  inherited;
  FContasReceberParam.HelpContext:=11;
end;

procedure TFContasReceberParam.TabSheet3Show(Sender: TObject);
begin
  inherited;
  FContasReceberParam.HelpContext:=10;
end;

procedure TFContasReceberParam.TabSheet4Show(Sender: TObject);
begin
  inherited;
  FContasReceberParam.HelpContext:=22;
end;

procedure TFContasReceberParam.TabSheet5Show(Sender: TObject);
begin
  inherited;
  FContasReceberParam.HelpContext:=23;
end;

procedure TFContasReceberParam.TabSheet6Show(Sender: TObject);
begin
  inherited;
  FContasReceberParam.HelpContext:=24;
end;

procedure TFContasReceberParam.TabSheet7Show(Sender: TObject);
begin
  inherited;
  FContasReceberParam.HelpContext:=25;
end;

procedure TFContasReceberParam.TabSheet8Show(Sender: TObject);
begin
  inherited;
  FContasReceberParam.HelpContext:=27;
end;

procedure TFContasReceberParam.TabSheet9Show(Sender: TObject);
begin
  inherited;
  FContasReceberParam.HelpContext:=2;
end;

procedure TFContasReceberParam.TabSheet10Show(Sender: TObject);
begin
  inherited;
  FContasReceberParam.HelpContext:=20;
end;

procedure TFContasReceberParam.TabSheet11Show(Sender: TObject);
begin
  inherited;
  FContasReceberParam.HelpContext:=14;
end;

procedure TFContasReceberParam.TabSheet13Show(Sender: TObject);
begin
  inherited;
  FContasReceberParam.HelpContext:=18;
end;

procedure TFContasReceberParam.TabSheet14Show(Sender: TObject);
begin
  inherited;
  FContasReceberParam.HelpContext:=17;
end;

procedure TFContasReceberParam.TabSheet15Show(Sender: TObject);
begin
  inherited;
  FContasReceberParam.HelpContext:=16;
end;

procedure TFContasReceberParam.TabSheet17Show(Sender: TObject);
begin
  inherited;
  FContasReceberParam.HelpContext:=33;
end;

procedure TFContasReceberParam.TabSheet18Show(Sender: TObject);
begin
  inherited;
  FContasReceberParam.HelpContext:=25;
end;

procedure TFContasReceberParam.SB17ContaCorrenteConsClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
     FContaCorrenteCons := TFContaCorrenteCons.Create(Self);
  if FContaCorrenteCons.ShowModal = mrOk then
     ME17CodContaCorrente.Text:= DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Text;
end;

procedure TFContasReceberParam.ME17CodContaCorrenteChange(Sender: TObject);
begin
  inherited;
  if Trim(ME17CodContaCorrente.Text) <> '' then
     ME17ContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME17CodContaCorrente.text)
  else
     ME17ContaCorrente.Clear;
end;

procedure TFContasReceberParam.MECodFilial18Change(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial18.text)<>'' then
    MEDescFilial18.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial18.text)
  else
    MEDescFilial18.Text:='Todos';
end;

procedure TFContasReceberParam.SBCodFilial18Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
     MECodFilial18.Text:=DMFilial.QFilialConsCod_filial.Text;
end;

procedure TFContasReceberParam.SpeedButton55Click(Sender: TObject);
begin
  inherited;
   If FContasReceberCons = Nil then
    FContasReceberCons:=TFContasReceberCons.Create(Application);
  If FContasReceberCons.ShowModal=mrOK then
  Begin
    ME20NrTitulo.Text:=FloatToStr(DmContasReceber.QContasReceber_CabConsNum_Titulo.Value);
  end;
end;

procedure TFContasReceberParam.SB20CodClienteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
     ME20CodCliente.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;
     ME20CodClienteExit(sender);
  end;
end;

procedure TFContasReceberParam.SB20CodFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
     ME20CodFilial.Text:=DMFilial.QFilialConsCod_filial.Text;
     ME20CodFilialExit(sender);
  end;
end;

procedure TFContasReceberParam.Sb3VendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons:=TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk  then
     ME3CodVendedor.Text:=DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFContasReceberParam.ME3CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME3CodFilial.Text)<>'' then
      ME3Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME3CodFilial.Text)
  else
      ME3Filial.Text := 'Todos';
end;

procedure TFContasReceberParam.ME3CodDeptoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME3CodDepto.Text)<>'' then
      ME3Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+ME3COdDepto.Text)
  else
      ME3Departamento.Text := 'Todos';

end;

procedure TFContasReceberParam.ME3CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME3CodCliente.Text)<>'' then
      ME3Cliente.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME3CodCliente.Text)
  else
      ME3Cliente.Text := 'Todos';

end;

procedure TFContasReceberParam.Me3CodVendedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME3CodVendedor.Text)<>'' then
     ME3Vendedor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+ME3CodVendedor.Text)
  else
     ME3Vendedor.Text := 'Todos';
end;

procedure TFContasReceberParam.Me21CodFinalidadeExit(Sender: TObject);
begin
  inherited;
  If Trim(ME21CodFinalidade.Text)<>'' then
    ME21Finalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+ME21CodFinalidade.Text)
  Else
    ME21Finalidade.Clear;
end;

procedure TFContasReceberParam.ME20CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME20CodCliente.text)<>'' then
    ME20DescCliente.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME20CodCliente.text)
  else
    ME20DescCliente.Text:='Todos';
end;

procedure TFContasReceberParam.ME20CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME20CodFilial.text)<>'' then
    ME20DescFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME20CodFilial.text)
  else
    ME20DescFilial.Text:='Todas';
end;

procedure TFContasReceberParam.Me21CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME21CodFilial.text)<>'' then
    ME21Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME21CodFilial.text)
  else
    ME21Filial.Text:='Todas';
end;

procedure TFContasReceberParam.Sb21FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME21CodFilial.Text := DMFilial.QFilialConsCod_filial.Text;
    Me21CodFilialExit(sender);
  end;
end;

procedure TFContasReceberParam.Sb21FinalidadeConsClick(Sender: TObject);
begin
  inherited;
  if FFinalidadeCons = nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal = mrOk  then
  begin
    ME21CodFinalidade.Text:=DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    Me21CodFinalidadeExit(sender);
  end;
end;

procedure TFContasReceberParam.SpeedButton56Click(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons:=TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk  then
    Me2CodVendedor.Text:=DMVendedor.QVendedorConsCod_Vendedor.Text;

end;

procedure TFContasReceberParam.CB2TodosVendedorClick(Sender: TObject);
begin
  inherited;
  if CB2TodosVendedor.Checked then
    Me2CodVendedor.Clear;

end;

procedure TFContasReceberParam.Me2CodVendedorChange(Sender: TObject);
begin
  inherited;
  if Trim(Me2CodVendedor.Text) <> '' then
    Begin
      Me2Vendedor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Me2CodVendedor.Text);
      CB2TodosVendedor.Checked:=False;
    End
  else
    Begin
      ME2Vendedor.Clear;
      CB2TodosVendedor.Checked:=True;
    End;

end;

procedure TFContasReceberParam.SB22FilialConsClick(Sender: TObject);
begin
  inherited;
   if FFilialCons = nil then
     FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
     ME22CodFilial.Text := DMFilial.QFilialConsCod_filial.Text;
     ME22CodFilialExit(sender);
  end;
end;

procedure TFContasReceberParam.SB22FinalidadeConsClick(Sender: TObject);
begin
  inherited;
  if FFinalidadeCons = nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal = mrOk  then
  begin
    ME22CodFinalidade.Text:=DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    ME22CodFinalidadeExit(sender);
  end
end;

procedure TFContasReceberParam.ME22CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME22CodFilial.text)<>'' then
    ME22Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME22CodFilial.text)
  else
    ME22Filial.Text:='Todas';
end;

procedure TFContasReceberParam.ME22CodFinalidadeExit(Sender: TObject);
begin
  inherited;
  If Trim(ME22CodFinalidade.Text)<>'' then
    ME22Finalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+ME22CodFinalidade.Text)
  Else
    ME22Finalidade.Text:='Todas';
end;

procedure TFContasReceberParam.TabSheet23Show(Sender: TObject);
begin
  inherited;
  RG22Situacao.ItemIndex:=3;
end;

procedure TFContasReceberParam.SB7RepresentanteClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
     FVendedorCons:=TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
     ME7Representante.Text:=DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
     ED7Representante.text:=DmVendedor.QVendedorConsNOME.Text;
end;

procedure TFContasReceberParam.ME7RepresentanteExit(Sender: TObject);
begin
  inherited;
  If Trim(ME7Representante.Text)<>'' then
    ED7Representante.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+ME7Representante.Text)
  Else
    ED7Representante.Text:='Todas';
end;

procedure TFContasReceberParam.SB2CCClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
     FContaCorrenteCons:=TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOk then
     ME2CC.Text:=DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Text;
     ME2CCExit(self);
end;

procedure TFContasReceberParam.ME2CCExit(Sender: TObject);
begin
  inherited;
  if Trim(ME2CC.Text)<>'' then
      Ed2CC.Text:=DMOracle.BuscaNome('SELECT NUM_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME2CC.Text)
  else
      Ed2CC.Text := 'Todos';
end;

procedure TFContasReceberParam.ME3FinalidadeExit(Sender: TObject);
begin
  inherited;
  if Trim(ME3Finalidade.Text)<>'' then
     Ed3Finalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+ME3Finalidade.Text)
  else
     Ed3Finalidade.Text := 'Todos';    
end;

procedure TFContasReceberParam.SB3FinalidadeClick(Sender: TObject);
begin
  inherited;
  if FFinalidadeCons = nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal = mrOk  then
     ME3Finalidade.Text:=DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
     ME3FinalidadeExit(Self);
end;

procedure TFContasReceberParam.SB23FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME23Filial.Text := DMFilial.QFilialConsCod_filial.Text;
    ME23FilialExit(self);
  end;
end;

procedure TFContasReceberParam.ME23FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME23Filial.text)<>'' then
    Ed23Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME23Filial.text)
  else
    Ed23Filial.Text:='Todas';
end;

procedure TFContasReceberParam.SB23ClienteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    ME23Cliente.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    ME23ClienteExit(self);
  end;
end;

procedure TFContasReceberParam.ME23ClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME23Cliente.text)<>'' then
    Ed23Cliente.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME23Cliente.text)
  else
    Ed23Cliente.Text:='Todos';
end;

procedure TFContasReceberParam.SB23TituloClick(Sender: TObject);
begin
  inherited;
   If FContasReceberCons = Nil then
    FContasReceberCons:=TFContasReceberCons.Create(Application);
  If FContasReceberCons.ShowModal=mrOK then
  Begin
    ME23Titulo.Text:=FloatToStr(DmContasReceber.QContasReceber_CabConsNum_Titulo.Value);
    ME23Cliente.Text:=FloatToStr(DmContasReceber.QContasReceber_CabConsCod_Cadastro.Value);
    ME23ClienteExit(self);
    ME23Filial.Text := FloatToStr(DmContasReceber.QContasReceber_CabConsCod_Filial.Value);
    ME23FilialExit(self);
  end;
end;
procedure TFContasReceberParam.SpeedButton57Click(Sender: TObject);
begin
  inherited;
   If FContasReceberCons = Nil then
    FContasReceberCons:=TFContasReceberCons.Create(Application);
  If FContasReceberCons.ShowModal=mrOK then
  Begin
    ME23Parcela.Text:=FloatToStr(DmContasReceber.QContasReceber_CabConsNum_Parcela.Value);
    ME23Titulo.Text:=FloatToStr(DmContasReceber.QContasReceber_CabConsNum_Titulo.Value);
    ME23Cliente.Text:=FloatToStr(DmContasReceber.QContasReceber_CabConsCod_Cadastro.Value);
    ME23ClienteExit(self);
    ME23Filial.Text := FloatToStr(DmContasReceber.QContasReceber_CabConsCod_Filial.Value);
    ME23FilialExit(self);
  end;

end;

procedure TFContasReceberParam.Me1FinalidadeChange(Sender: TObject);
begin
  inherited;
  if Trim(ME1Finalidade.Text)<>'' then
    Begin
      Ed1Finalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+Me1Finalidade.Text);
      CB1TodosFinalidade.Checked:=False;
    End
  else
    Begin
      Ed1Finalidade.Clear;
      CB1TodosFinalidade.Checked:=True;
    End;

end;

procedure TFContasReceberParam.Sb1FinalidadeClick(Sender: TObject);
begin
  inherited;
  If FFinalidadeCons=Nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal=mrOk then
    ME1Finalidade.Text:=FloatToStr(DMFinalidade.QFinalidadeConsCod_Finalidade.Value);
end;

procedure TFContasReceberParam.CB1TodosFinalidadeClick(Sender: TObject);
begin
  inherited;
  if CB1TodosFinalidade.Checked then
    ME1Finalidade.Clear;

end;

procedure TFContasReceberParam.ME5TipoDocumentoChange(Sender: TObject);
begin
  inherited;
  if ME5TipoDocumento.Text = '' then
  begin
    ME5TipoDocumento.Clear;
    CB5TipoDocumento.Checked := true;
  end
  else
  begin
    CB5TipoDocumento.Checked := false;
  end;
end;

procedure TFContasReceberParam.CB5TipoDocumentoClick(Sender: TObject);
begin
  inherited;
  If CB5TipoDocumento.Checked then
    ME5TipoDocumento.Clear;
end;

procedure TFContasReceberParam.ME22CodBancoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME22CodBanco.Text)<>'' then
    ME22Banco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME22CodBanco.Text)
  Else
    ME22Banco.Text:='Todos';
end;

procedure TFContasReceberParam.SB22BancoClick(Sender: TObject);
begin
  inherited;
  if FBancosCons = nil then
    FBancosCons:=TFBancosCons.Create(Application);
  if FBancosCons.ShowModal = mrOk  then
  begin
    ME22CodBanco.Text := DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Text;
    ME22CodBancoExit(sender);
  end;
end;

procedure TFContasReceberParam.ME24CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME24CodFilial.text)<>'' then
    ME24Filial.text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + ME24CodFilial.text)
  else
    ME24Filial.text := 'Todos';
end;

procedure TFContasReceberParam.SB24FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME24CodFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;
      ME24CodFilialExit(Self);
    end;
end;

procedure TFContasReceberParam.SpeedButton58Click(Sender: TObject);
begin
  inherited;
  if FContasReceberCons = Nil then
     FContasReceberCons:=TFContasReceberCons.Create(Application);
  if FContasReceberCons.ShowModal=mrOK then
    Me24NrTitulo.Text:=FloatToStr(DmContasReceber.QContasReceber_CabConsNum_Titulo.Value);
end;

procedure TFContasReceberParam.SB24ContaCorrenteConsClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
     FContaCorrenteCons := TFContaCorrenteCons.Create(Self);
  if FContaCorrenteCons.ShowModal = mrOk then
  begin
     ME24CodContaCorrente.Text:= DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Text;
     ME24CodContaCorrenteExit(sender);
  end;
end;

procedure TFContasReceberParam.SpeedButton59Click(Sender: TObject);
begin
  inherited;
  if FBancosCons = nil then
    FBancosCons:=TFBancosCons.Create(Application);
  if FBancosCons.ShowModal = mrOk  then
     ME3Banco.Text:=DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Text;
     ME3BancoExit(Self);
end;

procedure TFContasReceberParam.ME3BancoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME3Banco.Text)<>'' then
     Ed3Banco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME3Banco.Text)
  else
     Ed3Banco.Text := 'Todos';
end;

procedure TFContasReceberParam.SpeedButton60Click(Sender: TObject);
begin
  inherited;
  If FFinalidadeCons=Nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal=mrOk then
    ME2Finalidade.Text:=FloatToStr(DMFinalidade.QFinalidadeConsCod_Finalidade.Value);
end;

procedure TFContasReceberParam.ME2FinalidadeChange(Sender: TObject);
begin
  inherited;
  if Trim(ME2Finalidade.Text)<>'' then
    ED2Finalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+trim(ME2Finalidade.Text))
  else
    ED2Finalidade.Text:='Todas';
end;

procedure TFContasReceberParam.SpeedButton61Click(Sender: TObject);
begin
  inherited;
  if FObraContrato_Cons = nil then
     FObraContrato_Cons := TFObraContrato_Cons.Create(Self);
  if FObraContrato_Cons.ShowModal = mrOk then
  begin
     MEContrato.Text:= DMObraContrato.QObraContrato_ConsCod_Obra_Contrato.Text;
     MEContratoExit(sender);
  end;
end;

procedure TFContasReceberParam.MEContratoExit(Sender: TObject);
begin
  inherited;
  if Trim(MEContrato.Text) <> '' then
     MEDescContrato.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_OBRA_CONTRATO,TB_CADASTRO','TB_OBRA_CONTRATO.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO AND COD_OBRA_CONTRATO = '+MEContrato.text)
  else
     MEDescContrato.text := 'Necessário escolher o Contrato';
end;

procedure TFContasReceberParam.ME24CodContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME24CodContaCorrente.Text) <> '' then
  begin
    ME24ContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME24CodContaCorrente.Text);
  end
  else
    ME24ContaCorrente.Text:= 'Conta corrente não informada';
end;

procedure TFContasReceberParam.Me13CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME13CodCliente.Text)<>'' then
     ME13Cliente.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME13CodCliente.Text)
  else
     ME13Cliente.Text:='Todos';

end;

procedure TFContasReceberParam.Bt13ClienteClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    Begin
      ME13CodCliente.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
      Me13CodClienteExit(Self);
    End;

end;

procedure TFContasReceberParam.Me14CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(Me14CodCliente.Text)<>'' then
     Me14Cliente.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Me14CodCliente.Text)
  else
     Me14Cliente.Text:='Todos';

end;

procedure TFContasReceberParam.Bt14ClienteClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    Begin
      Me14CodCliente.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
      Me14CodClienteExit(Self);
    End;

end;

procedure TFContasReceberParam.ME26CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME26Cadastro.text)<>'' then
    ed26Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME26Cadastro.text)
  else
    ed26Cadastro.Text := '';
end;

procedure TFContasReceberParam.SpeedButton62Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    ME26Cadastro.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    ME26CadastroExit(self);
  end;
end;

procedure TFContasReceberParam.SpeedButton63Click(Sender: TObject);
begin
  inherited;
    if FFilialCons = nil then
     FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
     ME27Filial.Text := DMFilial.QFilialConsCod_filial.Text;
     ME27FilialExit(sender);
  end;
end;

procedure TFContasReceberParam.ME27FilialExit(Sender: TObject);
begin
  inherited;
   if Trim(ME27Filial.text)<>'' then
    Ed27Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME27Filial.text)
  else
    ED27Filial.Text:='Todas';
end;

procedure TFContasReceberParam.SB28FilialClick(Sender: TObject);
begin
  inherited;
    if FFilialCons = nil then
     FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
     ME28Filial.Text := DMFilial.QFilialConsCod_filial.Text;
     ME28FilialExit(self);
  end; 
end;

procedure TFContasReceberParam.ME28FilialExit(Sender: TObject);
begin
  inherited;
   if Trim(ME28Filial.text)<>'' then
    Ed28Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME28Filial.text)
  else
    ED28Filial.Text:='Todas';
end;

procedure TFContasReceberParam.SB28ClassClick(Sender: TObject);
begin
  inherited;
  If FClassCadastroCons = Nil then
    FClassCadastroCons := TFClassCadastroCons.Create(Application);
  If FClassCadastroCons.ShowModal = mrOk then
  Begin
    ME28Class.Text := DMCadastro.QCadastroCod_Class_Cadastro.Text;
    ME28ClassExit(self);
  end;
end;

procedure TFContasReceberParam.ME28ClassExit(Sender: TObject);
begin
  inherited;
   if Trim(ME28Class.text)<>'' then
    Ed28Class.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSIFICACAO FROM TB_CLASS_CADASTRO','COD_CLASS_CADASTRO = '+ME28Class.text)
  else
    ED28Class.Text:='Todas';
end;

procedure TFContasReceberParam.Me11CodSupervisorExit(Sender: TObject);
begin
  inherited;
  if Trim(Me11CodSupervisor.text)<>'' then
    ME11Supervisor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Me11CodSupervisor.text)
  else
    ME11Supervisor.Text:='Todos';

end;

procedure TFContasReceberParam.Bt11SupervisorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
     ME11CodSupervisor.text:= DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
  ME11CodSupervisorExit(Self);
end;

procedure TFContasReceberParam.Me4ClassificacaoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME4Classificacao.Text)<>'' then
    Begin
      Ed4Classificacao.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSIFICACAO FROM TB_CLASS_CADASTRO','COD_CLASS_CADASTRO = '+ME4Classificacao.Text);
      CB4TodosClassificacao.Checked := False;
    End
  else
    Begin
      Ed4Classificacao.Clear;
      CB4TodosClassificacao.Checked:=True;
    End;

end;

procedure TFContasReceberParam.SpeedButton64Click(Sender: TObject);
begin
  inherited;
  if FClassCadastroCons = nil then
    FClassCadastroCons:=TFClassCadastroCons.Create(Application);
  if FClassCadastroCons.ShowModal = mrOk  then
    Me4Classificacao.Text:=DMClassCadastro.QClassCadastroConsCod_Class_Cadastro.Text;

end;

procedure TFContasReceberParam.CB4TodosClassificacaoClick(Sender: TObject);
begin
  inherited;
  If CB4TodosClassificacao.Checked then
    Me4Classificacao.Clear;

end;

procedure TFContasReceberParam.ME30CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME30CodFilial.Text)<>'' then
    ME30Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME30CodFilial.Text)
  else
    ME30Filial.Text := 'Todas';
end;

procedure TFContasReceberParam.SpeedButton65Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  begin
    ME30CodFilial.Text := FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    ME30CodFilialexit(sender);
  end;
end;

procedure TFContasReceberParam.ME30CodDeptoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME30CodDepto.Text) <> '' then
    ME30Departamento.Text := DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+ME30COdDepto.Text)
  else
    ME30Departamento.Text := 'Todos';
end;

procedure TFContasReceberParam.SpeedButton67Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk then
  begin
    ME30CodDepto.Text := FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
    ME30CodDeptoExit(sender);
  end
end;

procedure TFContasReceberParam.ME30CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME30CodCliente.Text) <> '' then
    ME30Cliente.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + ME30CodCliente.Text)
  else
    ME30Cliente.Text := 'Todos';
end;

procedure TFContasReceberParam.SpeedButton66Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME30CodCliente.Text := FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    ME30CodClienteexit(sender);
  End;
end;

procedure TFContasReceberParam.Me30CodVendedorExit(Sender: TObject);
begin
  inherited;
  if Trim(Me30CodVendedor.Text) <> '' then
    Me30Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + Me30CodVendedor.Text)
  else
    ME30Vendedor.Text := 'Todos';
end;

procedure TFContasReceberParam.SpeedButton68Click(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk  then
  begin
    Me30CodVendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    Me30CodVendedorExit(sender);
  end;
end;

procedure TFContasReceberParam.ME30CCExit(Sender: TObject);
begin
  inherited;
  if Trim(ME30CC.Text)<>'' then
      Ed30CC.Text:=DMOracle.BuscaNome('SELECT NUM_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME30CC.Text)
  else
      Ed30CC.Text := 'Todos';
end;

procedure TFContasReceberParam.SpeedButton69Click(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);

  if FContaCorrenteCons.ShowModal = mrOk then
  begin
    ME30CC.Text := DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Text;
    ME30CCExit(self);
  end;
end;

procedure TFContasReceberParam.ME30FinalidadeExit(Sender: TObject);
begin
  inherited;
  if Trim(ME30Finalidade.Text) <> '' then
    ED30Finalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = ' + trim(ME30Finalidade.Text))
  else
    ED30Finalidade.Text := 'Todas';
end;

procedure TFContasReceberParam.SpeedButton70Click(Sender: TObject);
begin
  inherited;
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal = mrOk then
  begin
    ME30Finalidade.Text := FloatToStr(DMFinalidade.QFinalidadeConsCod_Finalidade.Value);
    ME30FinalidadeExit(sender);
  end
end;

procedure TFContasReceberParam.Me14ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if Trim(Me14ContaCorrente.Text) <> '' then
     Ed14ContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+Me14ContaCorrente.text)
  else
     Ed14ContaCorrente.Clear;
end;

procedure TFContasReceberParam.Sb14ContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
     FContaCorrenteCons := TFContaCorrenteCons.Create(Self);
  if FContaCorrenteCons.ShowModal = mrOk then
     Me14ContaCorrente.Text:= DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Text;
  Me14ContaCorrenteExit(Self)
end;

procedure TFContasReceberParam.SB31FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  begin
    ME31Filial.Text := FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    ME31Filialexit(sender);
  end;

end;

procedure TFContasReceberParam.ME31FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME31Filial.Text)<>'' then
    Ed31Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME31Filial.Text)
  else
    Ed31Filial.Text := 'Todas';
end;

procedure TFContasReceberParam.SB31DepartamentoClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk then
  begin
    ME31Departamento.Text := FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
    ME31DepartamentoExit(sender);
  end;
end;

procedure TFContasReceberParam.ME31departamentoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME31Departamento.Text) <> '' then
    Ed31Departamento.Text := DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento','COD_Departamento = '+ME31Departamento.Text)
  else
    Ed31Departamento.Text := 'Todos';
end;

procedure TFContasReceberParam.SpeedButton71Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  begin
    ME32Filial.Text := FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    ME32Filialexit(sender);
  end;
end;

procedure TFContasReceberParam.SpeedButton72Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME32Cadastro.Text := FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    ME32Cadastroexit(sender);
  End;
end;

procedure TFContasReceberParam.ME32FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME32Filial.Text)<>'' then
    Ed32Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME32Filial.Text)
  else
    Ed32Filial.Text := 'Todas';
end;

procedure TFContasReceberParam.ME32CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME32Cadastro.Text) <> '' then
    ED32Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + ME32Cadastro.Text)
  else
    ED32Cadastro.Text := 'Todos';
end;

procedure TFContasReceberParam.Me18CodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then  //123 = F12
     SpeedButton52.Click;
end;

procedure TFContasReceberParam.ME20CodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then //123 = F12
     SB20CodCliente.Click;
end;

procedure TFContasReceberParam.ME23ClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then //123 = F12
     SB23Cliente.Click;
end;

procedure TFContasReceberParam.ME30CodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then //123 = F12
     SpeedButton66.Click;
end;

procedure TFContasReceberParam.ME32CadastroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then //123 = F12
     SpeedButton72.Click;
end;

procedure TFContasReceberParam.ME9CodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then //123 = F12
     BitBtn3.Click;
end;

procedure TFContasReceberParam.ME8CodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then //123 = F12
     SpeedButton21.Click;
end;

procedure TFContasReceberParam.ME5CodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then //123 = F12
     SpeedButton17.Click;
end;

procedure TFContasReceberParam.ME4CodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then //123 = F12
     SpeedButton9.Click;
end;

procedure TFContasReceberParam.ME3CodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then //123 = F12
     SpeedButton7.Click;
end;

procedure TFContasReceberParam.ME2CodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then //123 = F12
     SpeedButton6.Click;
end;

procedure TFContasReceberParam.ME1CodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then //123 = F12
     SpeedButton1.Click;
end;

procedure TFContasReceberParam.ME0CodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then //123 = F12
     SpeedButton10.Click;
end;

procedure TFContasReceberParam.Me34CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME34CodFilial.Text)<>'' then
    Ed34DescFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME34CodFilial.Text)
  else
    Ed34DescFilial.Text := 'Todas';
end;

procedure TFContasReceberParam.ME34CodBancoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME34CodBanco.Text)<>'' then
    ME34DescBanco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME34CodBanco.Text)
  Else
    ME34DescBanco.Text:='Todos';
end;

procedure TFContasReceberParam.SB34FilialConsClick(Sender: TObject);
begin
  inherited;
   If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  begin
    ME34CodFilial.Text := FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    ME34CodFilialexit(sender);
  end;
end;

procedure TFContasReceberParam.SB34BancoConsClick(Sender: TObject);
begin
  inherited;
  if FBancosCons = nil then
    FBancosCons:=TFBancosCons.Create(Application);
  if FBancosCons.ShowModal = mrOk  then
  begin
    ME34CodBanco.Text := DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Text;
    ME34CodBancoExit(sender);
  end;
end;

procedure TFContasReceberParam.ME19CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME19CodFilial.text) <>'' then
    MEDescFilial19.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME19CodFilial.text)
  else
    MEDescFilial19.Text:='Todos';
end;

procedure TFContasReceberParam.ME19CodContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME19CodContaCorrente.Text) <> '' then
  begin
    ME19DescContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME19CodContaCorrente.Text);
    ME19CodBanco.Text:= DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME19CodContaCorrente.Text);
  end
  else
     ME19DescContaCorrente.Text:= 'Conta corrente não informada';
end;

procedure TFContasReceberParam.SpeedButton73Click(Sender: TObject);
begin
  inherited;
  if FMensagemCons = nil then
    FMensagemCons := TFMensagemCons.create(application);

  if FMensagemCons.ShowModal = mrok then
    ME19Instrucoes.Text := DMMensagem.QMensagemConsCOD_MENSAGEM.Text;
end;

procedure TFContasReceberParam.Me4ValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  If Key = ',' Then
     Key := '.';

end;

procedure TFContasReceberParam.Sb17MensagemClick(Sender: TObject);
begin
  inherited;
  if FMensagemCons = nil then
    FMensagemCons := TFMensagemCons.create(application);

  if FMensagemCons.ShowModal = mrok then
    Me17Instrucoes.Text := DMMensagem.QMensagemConsCOD_MENSAGEM.Text;

end;

procedure TFContasReceberParam.Me5ClassCadastroChange(Sender: TObject);
begin
  inherited;
  if Trim(Me5ClassCadastro.Text)<>'' then
    Begin
      Ed5Classificacao.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSIFICACAO FROM TB_CLASS_CADASTRO','COD_CLASS_CADASTRO = '+Me5ClassCadastro.Text);
      CB5TodosClassificacao.Checked := False;
    End
  else
    Begin
      Ed5Classificacao.Clear;
      CB5TodosClassificacao.Checked:=True;
    End;

end;

procedure TFContasReceberParam.CB5TodosClassificacaoClick(Sender: TObject);
begin
  inherited;
  If CB5TodosClassificacao.Checked then
    Me5ClassCadastro.Clear;

end;

procedure TFContasReceberParam.SpeedButton74Click(Sender: TObject);
begin
  inherited;
  if FClassCadastroCons = nil then
    FClassCadastroCons:=TFClassCadastroCons.Create(Application);
  if FClassCadastroCons.ShowModal = mrOk  then
    Me5ClassCadastro.Text:=DMClassCadastro.QClassCadastroConsCod_Class_Cadastro.Text;

end;

procedure TFContasReceberParam.SB13NumTituloClick(Sender: TObject);
begin
  inherited;
  if FContasReceberCons = Nil then
     FContasReceberCons:=TFContasReceberCons.Create(Application);
  if FContasReceberCons.ShowModal=mrOK then
    Me13NumTitulo.Text:=FloatToStr(DmContasReceber.QContasReceber_CabConsCOD_CONTA_RECEBER_CAB.Value);
end;

procedure TFContasReceberParam.SB14NumTituloClick(Sender: TObject);
begin
  inherited;
  if FContasReceberCons = Nil then
     FContasReceberCons:=TFContasReceberCons.Create(Application);
  if FContasReceberCons.ShowModal=mrOK then
    Me14NumTitulo.Text:=FloatToStr(DmContasReceber.QContasReceber_CabConsCOD_CONTA_RECEBER_CAB.Value);
end;

procedure TFContasReceberParam.Ed6DescontoExit(Sender: TObject);
begin
  inherited;
  wDescontoBloqueto := Ed6Desconto.Text;
end;

procedure TFContasReceberParam.ME36FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME36Filial.text) <>'' then
    Ed36Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME36Filial.text)
  else
    Ed36Filial.Text:='Todos'; 
end;

procedure TFContasReceberParam.SB36FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME36Filial.Text:=DMFilial.QFilialConsCod_filial.Text;
    ME36FilialExit(Self);
  end;
end;

procedure TFContasReceberParam.ME36ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME36ContaCorrente.Text) <> '' then
  begin
    Ed36ContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME36ContaCorrente.Text);
    ME36Banco.Text:= DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+ME36ContaCorrente.Text);
  end
  else
     Ed36ContaCorrente.Text:= 'Conta corrente não informada';
end;

procedure TFContasReceberParam.SB36ContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
     FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOk then
     ME36ContaCorrente.Text:= DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.AsString; 
end;

procedure TFContasReceberParam.ME36BancoChange(Sender: TObject);
begin
  inherited;
  if Trim(ME36Banco.Text)<>'' then
     Ed36Banco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+ME36Banco.Text)
  else
     Ed36Banco.Clear; 
end;

procedure TFContasReceberParam.FormDeactivate(Sender: TObject);
begin
  inherited;
    FContasReceberParam.Rg17Remessa.Visible := false;
end;

procedure TFContasReceberParam.Sb4ContratoVendaClick(Sender: TObject);
begin
  inherited;
  If FContrato_VendaCons=Nil then
    FContrato_VendaCons:=TFContrato_VendaCons.Create(Application);
  If FContrato_VendaCons.ShowModal=mrOk then
    Me4ContratoVenda.Text:=DMContrato.QContrato_VendConsCOD_CONTRATO_VEND.Text;

end;

end.
