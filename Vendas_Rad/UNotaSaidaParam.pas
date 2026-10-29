unit UNotaSaidaParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask, Grids, DBGrids,
  Db;

type
  TFNotaSaidaParam = class(TFTParametro)
    TSComissao: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ME0DataI: TMaskEdit;
    ME0DataF: TMaskEdit;
    Label12: TLabel;
    ME0Filial: TMaskEdit;
    Bt0Filial: TBitBtn;
    Ed0Filial: TEdit;
    Label3: TLabel;
    ME0Vendedor: TMaskEdit;
    Bt0ConsVendedor: TBitBtn;
    Ed0Vendedor: TEdit;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    ME1DataI: TMaskEdit;
    ME1DataF: TMaskEdit;
    ME1Filial: TMaskEdit;
    Bt1ConsFilial: TBitBtn;
    Ed1Filial: TEdit;
    ME1Vendedor: TMaskEdit;
    Bt1ConsVendedor: TBitBtn;
    Ed1Vendedor: TEdit;
    RGTipo: TRadioGroup;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    ME2DataI: TMaskEdit;
    ME2DataF: TMaskEdit;
    ME2Filial: TMaskEdit;
    Bt2Filial: TBitBtn;
    Ed2Filial: TEdit;
    ME2Vendedor: TMaskEdit;
    Bt2Vendedor: TBitBtn;
    Ed2Vendedor: TEdit;
    TabSheet3: TTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    ME3DataI: TMaskEdit;
    ME3DataF: TMaskEdit;
    ME3Filial: TMaskEdit;
    Bt3ConsFilial: TBitBtn;
    Ed3Filial: TEdit;
    ME3Cadastro: TMaskEdit;
    Bt3Cadastro: TBitBtn;
    Ed3Cadastro: TEdit;
    Label17: TLabel;
    ME3Operacao: TMaskEdit;
    BtOperacao: TBitBtn;
    Ed3Operacao: TEdit;
    TabSheet4: TTabSheet;
    Label18: TLabel;
    ME4Filial: TMaskEdit;
    Bt4ConsFilial: TBitBtn;
    Ed4Filial: TEdit;
    ME4Dias: TMaskEdit;
    Label19: TLabel;
    UpDown1: TUpDown;
    Label20: TLabel;
    ME4ClassCadastro: TMaskEdit;
    Bt4Classificacao: TBitBtn;
    Ed4ClassCadastro: TEdit;
    TabSheet5: TTabSheet;
    Label21: TLabel;
    Label23: TLabel;
    GroupBox5: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    ME5DataI: TMaskEdit;
    ME5DataF: TMaskEdit;
    ME5Filial: TMaskEdit;
    Bt5ConsFilial: TBitBtn;
    Ed5Filial: TEdit;
    ME5Operacao: TMaskEdit;
    Bt5ConsOperacao: TBitBtn;
    Ed5Operacao: TEdit;
    Label22: TLabel;
    ME5Vendedor: TMaskEdit;
    Bt5ConsVendedor: TBitBtn;
    Ed5Vendedor: TEdit;
    TabSheet6: TTabSheet;
    Label26: TLabel;
    ME6Filial: TMaskEdit;
    Bt6ConsFilial: TBitBtn;
    Ed6Filial: TEdit;
    GroupBox6: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    ME6DataI: TMaskEdit;
    ME6DataF: TMaskEdit;
    Ed6Serie: TEdit;
    Bt6ConsSerie: TBitBtn;
    ME6Serie: TMaskEdit;
    Label29: TLabel;
    TabSheet7: TTabSheet;
    Label30: TLabel;
    ME7Filial: TMaskEdit;
    Bt7ConsFilial: TBitBtn;
    Ed7Filial: TEdit;
    GroupBox7: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    ME7DataI: TMaskEdit;
    ME7DataF: TMaskEdit;
    Label31: TLabel;
    ME7Classe: TMaskEdit;
    Bt7ConsClasse: TBitBtn;
    Ed7Classe: TEdit;
    Label34: TLabel;
    ME7SubClasse: TMaskEdit;
    TabSheet8: TTabSheet;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    ME8Filial: TMaskEdit;
    Bt8ConsFilial: TBitBtn;
    Ed8Filial: TEdit;
    GroupBox8: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    ME8DataI: TMaskEdit;
    ME8DataF: TMaskEdit;
    ME8Classe: TMaskEdit;
    Bt8SubClasse: TBitBtn;
    Ed8Classe: TEdit;
    ME8SubClasse: TMaskEdit;
    TabSheet9: TTabSheet;
    Label40: TLabel;
    ME9Filial: TMaskEdit;
    Bt9Filial: TBitBtn;
    Ed9Filial: TEdit;
    GroupBox9: TGroupBox;
    Label41: TLabel;
    Label42: TLabel;
    ME9DataI: TMaskEdit;
    ME9DataF: TMaskEdit;
    Label43: TLabel;
    ME9Produto: TMaskEdit;
    Bt9ConsProduto: TBitBtn;
    Ed9Produto: TEdit;
    Label44: TLabel;
    ME9Lote: TMaskEdit;
    Bt9Lote: TBitBtn;
    Ed9Lote: TEdit;
    TabSheet10: TTabSheet;
    GroupBox10: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    ME10DataI: TMaskEdit;
    ME10DataF: TMaskEdit;
    Label47: TLabel;
    ME10Filial: TMaskEdit;
    Bt10ConsFilial: TBitBtn;
    Ed10Filial: TEdit;
    Label48: TLabel;
    ME10Vendedor: TMaskEdit;
    Bt10Vendedor: TBitBtn;
    Ed10Vendedor: TEdit;
    TabSheet11: TTabSheet;
    Label49: TLabel;
    ME11Filial: TMaskEdit;
    ME11ConsFilial: TBitBtn;
    Ed11Filial: TEdit;
    ME11Prazo1: TMaskEdit;
    ME11Prazo2: TMaskEdit;
    ME11Prazo3: TMaskEdit;
    ME11Prazo4: TMaskEdit;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    GroupBox11: TGroupBox;
    Label55: TLabel;
    Label56: TLabel;
    ME11DataI: TMaskEdit;
    ME11DataF: TMaskEdit;
    TabSheet12: TTabSheet;
    Label57: TLabel;
    Label58: TLabel;
    GroupBox12: TGroupBox;
    Label59: TLabel;
    Label60: TLabel;
    ME12DataI: TMaskEdit;
    ME12DataF: TMaskEdit;
    ME12Filial: TMaskEdit;
    Bt12ConsFilial: TBitBtn;
    Ed12Filial: TEdit;
    ME12Vendedor: TMaskEdit;
    Bt12ConsVendedor: TBitBtn;
    Ed12Vendedor: TEdit;
    TabSheet13: TTabSheet;
    Label61: TLabel;
    ME13Filial: TMaskEdit;
    Bt13ConsFilial: TBitBtn;
    Ed13Filial: TEdit;
    GroupBox13: TGroupBox;
    ME13Ano: TMaskEdit;
    Label64: TLabel;
    Label65: TLabel;
    ME13ClasseI: TMaskEdit;
    Bt13ConsClasseI: TBitBtn;
    Ed13ClasseI: TEdit;
    ME13SubClasseI: TMaskEdit;
    Label66: TLabel;
    Label67: TLabel;
    ME13ClasseF: TMaskEdit;
    Bt13ConsClasseF: TBitBtn;
    Ed13ClasseF: TEdit;
    ME13SubClasseF: TMaskEdit;
    Ed13NomeResponsavel: TEdit;
    Label68: TLabel;
    TabSheet14: TTabSheet;
    Label69: TLabel;
    ME14Filial: TMaskEdit;
    Bt14ConsFilial: TBitBtn;
    Ed14Filial: TEdit;
    Label70: TLabel;
    ME14Vendedor: TMaskEdit;
    Bt14ConsVendedor: TBitBtn;
    Ed14Vendedor: TEdit;
    Label73: TLabel;
    Label74: TLabel;
    ME14Classe: TMaskEdit;
    Bt14ConsClasse: TBitBtn;
    Ed14Classe: TEdit;
    ME14SubClasse: TMaskEdit;
    Label71: TLabel;
    ME14Ano: TMaskEdit;
    ME14NumClasse: TMaskEdit;
    TabSheet15: TTabSheet;
    Label72: TLabel;
    ME15Filial: TMaskEdit;
    Bt15ConsFilial: TBitBtn;
    Ed15Filial: TEdit;
    Label75: TLabel;
    ME15Vendedor: TMaskEdit;
    Bt15ConVendedor: TBitBtn;
    Ed15Vendedor: TEdit;
    GroupBox14: TGroupBox;
    Label76: TLabel;
    Label77: TLabel;
    ME15DataI: TMaskEdit;
    ME15DataF: TMaskEdit;
    TabSheet16: TTabSheet;
    Label78: TLabel;
    ME16Filial: TMaskEdit;
    ME16ConsFilial: TBitBtn;
    Ed16Filial: TEdit;
    Label79: TLabel;
    ME16Cadastro: TMaskEdit;
    ME16ConsCadastro: TBitBtn;
    Ed16Cadastro: TEdit;
    GroupBox15: TGroupBox;
    Label80: TLabel;
    Label81: TLabel;
    ME16DataI: TMaskEdit;
    ME16DataF: TMaskEdit;
    TabSheet17: TTabSheet;
    Label82: TLabel;
    ME17Lote: TMaskEdit;
    Bt17ConsLote: TBitBtn;
    Ed17Lote: TEdit;
    RG0TipoRelatorio: TRadioGroup;
    Label83: TLabel;
    ME16Vendedor: TMaskEdit;
    Bt16ConsVendedor: TBitBtn;
    Ed16Vendedor: TEdit;
    RGTipoPagto: TRadioGroup;
    TabSheet18: TTabSheet;
    Label84: TLabel;
    ME18Filial: TMaskEdit;
    BitBtn1: TBitBtn;
    ED18Filial: TEdit;
    ME18Vendedor: TMaskEdit;
    Label85: TLabel;
    BitBtn2: TBitBtn;
    Ed18Vendedor: TEdit;
    GroupBox16: TGroupBox;
    Label86: TLabel;
    Label87: TLabel;
    ME18DataI: TMaskEdit;
    ME18DataF: TMaskEdit;
    TabSheet19: TTabSheet;
    ME19CodFilial: TMaskEdit;
    ME19CodCadastro: TMaskEdit;
    GroupBox17: TGroupBox;
    ME19DtInicial: TMaskEdit;
    ME19DtFinal: TMaskEdit;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    ME19Filial: TMaskEdit;
    ME19Cadastro: TMaskEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    TabSheet20: TTabSheet;
    ME20CodFilial: TMaskEdit;
    ME20CodVendedor: TMaskEdit;
    ME20Historico: TMaskEdit;
    GroupBox18: TGroupBox;
    ME20DtInicial: TMaskEdit;
    ME20DtFinal: TMaskEdit;
    ME20Filial: TMaskEdit;
    ME20Vendedor: TMaskEdit;
    Label92: TLabel;
    Vendedor: TLabel;
    Historico: TLabel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Label95: TLabel;
    Label96: TLabel;
    TabSheet21: TTabSheet;
    Label93: TLabel;
    Label97: TLabel;
    GroupBox19: TGroupBox;
    Label98: TLabel;
    Label99: TLabel;
    Me21DataI: TMaskEdit;
    Me21DataF: TMaskEdit;
    Me21Filial: TMaskEdit;
    BT21ConsFilial: TBitBtn;
    Ed21Filial: TEdit;
    Me21Vendedor: TMaskEdit;
    Bt21Vendedor: TBitBtn;
    Ed21Vendedor: TEdit;
    Label94: TLabel;
    Me8Vendedor: TMaskEdit;
    Bt8Vendedor: TBitBtn;
    Ed8Vendedor: TEdit;
    CB7Ordem: TComboBox;
    Label100: TLabel;
    TabSheet22: TTabSheet;
    Label101: TLabel;
    Me22Filial: TMaskEdit;
    BT22ConsFilial: TBitBtn;
    Ed22Filial: TEdit;
    GroupBox20: TGroupBox;
    Label102: TLabel;
    Label103: TLabel;
    Me22DataI: TMaskEdit;
    Me22DataF: TMaskEdit;
    GroupBox21: TGroupBox;
    Label104: TLabel;
    Label105: TLabel;
    Me22NumeroI: TMaskEdit;
    Me22NumeroF: TMaskEdit;
    Label106: TLabel;
    ME9Operacao: TMaskEdit;
    Bt9ConsOperacao: TBitBtn;
    Ed9Operacao: TEdit;
    TabSheet23: TTabSheet;
    Label107: TLabel;
    Me23Filial: TMaskEdit;
    Bt23Filial: TBitBtn;
    Ed23Filial: TEdit;
    Me23Cadastro: TMaskEdit;
    Bt23Cadastro: TBitBtn;
    Ed23Cadastro: TEdit;
    Label108: TLabel;
    Me23Vendedor: TMaskEdit;
    Label109: TLabel;
    Bt23Vendedor: TBitBtn;
    Ed23Vendedor: TEdit;
    GroupBox22: TGroupBox;
    Label110: TLabel;
    Label111: TLabel;
    Me23DataI: TMaskEdit;
    Me23DataF: TMaskEdit;
    Label112: TLabel;
    Me23Operacao: TMaskEdit;
    Bt23Operacao: TBitBtn;
    Ed23Operacao: TEdit;
    RG21Tipo: TRadioGroup;
    Label113: TLabel;
    GroupBox23: TGroupBox;
    Me22Desdobramento: TMaskEdit;
    Label114: TLabel;
    ME4Cod_Vendedor: TMaskEdit;
    Bt4Vendedor: TBitBtn;
    Ed4Vendedor: TEdit;
    Me16Historico: TMaskEdit;
    Label115: TLabel;
    BitBtn7: TBitBtn;
    Ed16Historico: TEdit;
    TabSheet24: TTabSheet;
    Label116: TLabel;
    Label117: TLabel;
    Me24Filial: TMaskEdit;
    Bt24Filial: TBitBtn;
    Ed24Filial: TEdit;
    Me24Cadastro: TMaskEdit;
    Bt24Cadastro: TBitBtn;
    Ed24Cadastro: TEdit;
    GroupBox24: TGroupBox;
    Label118: TLabel;
    Label119: TLabel;
    Me24DataI: TMaskEdit;
    Me24DataF: TMaskEdit;
    Label120: TLabel;
    Me7Operacao: TMaskEdit;
    BitBtn9: TBitBtn;
    Ed7Operacao: TEdit;
    TabSheet25: TTabSheet;
    Label121: TLabel;
    ME25Filial: TMaskEdit;
    BitBtn10: TBitBtn;
    Ed25Filial: TEdit;
    Label122: TLabel;
    ME25Vendedor: TMaskEdit;
    BitBtn11: TBitBtn;
    Ed25Vendedor: TEdit;
    GroupBox25: TGroupBox;
    Label123: TLabel;
    Label124: TLabel;
    ME25DataI: TMaskEdit;
    ME25DataF: TMaskEdit;
    Label125: TLabel;
    Me19Valor: TMaskEdit;
    RB19Todos: TRadioButton;
    TabSheet26: TTabSheet;
    Label126: TLabel;
    ME26Filial: TMaskEdit;
    Btn26Filial: TBitBtn;
    Ed26Filial: TEdit;
    Label127: TLabel;
    ME26Vendedor: TMaskEdit;
    Btn26Vendedor: TBitBtn;
    Ed26Vendedor: TEdit;
    GroupBox26: TGroupBox;
    Label128: TLabel;
    Label129: TLabel;
    ME26DataI: TMaskEdit;
    ME26DataF: TMaskEdit;
    Label130: TLabel;
    ME26Regiao: TMaskEdit;
    Btn26Regiao: TBitBtn;
    Ed26Regiao: TEdit;
    TabSheet27: TTabSheet;
    Label131: TLabel;
    ME27Filial: TMaskEdit;
    Btn27Filial: TBitBtn;
    Ed27Filial: TEdit;
    GroupBox27: TGroupBox;
    Label132: TLabel;
    Label133: TLabel;
    ME27DataI: TMaskEdit;
    ME27DataF: TMaskEdit;
    RG27CompraVenda: TRadioGroup;
    Label134: TLabel;
    ME27ClasseI: TMaskEdit;
    Btn27ClasseI: TBitBtn;
    Ed27ClasseI: TEdit;
    ME27ClasseF: TMaskEdit;
    Label135: TLabel;
    Btn27ClasseF: TBitBtn;
    Ed27ClasseF: TEdit;
    TabSheet28: TTabSheet;
    ME28Percentual: TMaskEdit;
    Label139: TLabel;
    Label136: TLabel;
    Ed0Serie: TEdit;
    Label137: TLabel;
    Label138: TLabel;
    Ed10Serie: TEdit;
    Label141: TLabel;
    Me23Produto: TMaskEdit;
    Ed23Produto: TEdit;
    Bt23Produto: TBitBtn;
    Label142: TLabel;
    Me27Produto: TMaskEdit;
    Bt27Produto: TBitBtn;
    Ed27Produto: TEdit;
    Label143: TLabel;
    Me1Operacao: TMaskEdit;
    BitBtn12: TBitBtn;
    Ed1Operacao: TEdit;
    Label144: TLabel;
    Me12Operacao: TMaskEdit;
    Bt12Operacao: TBitBtn;
    Ed12Operacao: TEdit;
    TabSheet29: TTabSheet;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Me29Filial: TMaskEdit;
    Btn29Filial: TBitBtn;
    Ed29Filial: TEdit;
    GroupBox28: TGroupBox;
    Label149: TLabel;
    Label150: TLabel;
    Me29DataI: TMaskEdit;
    Me29DataF: TMaskEdit;
    Me29ClasseI: TMaskEdit;
    Btn29ClasseI: TBitBtn;
    Ed29ClasseI: TEdit;
    Me29SubClasse: TMaskEdit;
    Bt29SubClasse: TBitBtn;
    Ed29SubClasse: TEdit;
    Me29Vendedor: TMaskEdit;
    Bt29Vendedor: TBitBtn;
    Ed29Vendedor: TEdit;
    Label151: TLabel;
    Me29Produto: TMaskEdit;
    Bt29Produto: TBitBtn;
    Ed29Produto: TEdit;
    TabSheet30: TTabSheet;
    Label152: TLabel;
    MEFilialCod: TMaskEdit;
    BtnFilialCons: TBitBtn;
    EdFilialDesc: TEdit;
    Label153: TLabel;
    MEVendedorCod: TMaskEdit;
    BtnVendedorCons: TBitBtn;
    EdVendedorDesc: TEdit;
    Label154: TLabel;
    MERegiaoCod: TMaskEdit;
    BtnRegiaoCons: TBitBtn;
    EdRegiaoDesc: TEdit;
    GroupBox29: TGroupBox;
    Label155: TLabel;
    Label156: TLabel;
    MEDataI: TMaskEdit;
    MEDataF: TMaskEdit;
    Label157: TLabel;
    Me3Produto: TMaskEdit;
    Bt3ConsProduto: TBitBtn;
    Ed3Produto: TEdit;
    Rg3TipoNota: TRadioGroup;
    Rg1TipoPagto: TRadioGroup;
    Label62: TLabel;
    Me1Produto: TMaskEdit;
    Bt1Produto: TBitBtn;
    Ed1Produto: TEdit;
    RG3CondicaoPagto: TRadioGroup;
    TabSheet31: TTabSheet;
    Label63: TLabel;
    MECodFilial31: TMaskEdit;
    BtnFilialCons31: TBitBtn;
    EdFilialDesc31: TEdit;
    Label158: TLabel;
    MECodVendedor31: TMaskEdit;
    BtnVendedorCons31: TBitBtn;
    EdVendedorNome31: TEdit;
    GroupBox30: TGroupBox;
    Label159: TLabel;
    Label160: TLabel;
    MEDataI31: TMaskEdit;
    MEDataF31: TMaskEdit;
    TabSheet32: TTabSheet;
    GroupBox31: TGroupBox;
    Label161: TLabel;
    EdNF32I: TEdit;
    Label162: TLabel;
    EdNF32F: TEdit;
    Memo1: TMemo;
    TabSheet33: TTabSheet;
    GroupBox32: TGroupBox;
    Label163: TLabel;
    MEDT_Recebimento_I: TMaskEdit;
    MEDT_Recebimento_F: TMaskEdit;
    Label165: TLabel;
    EDNumNota: TEdit;
    Label164: TLabel;
    Label167: TLabel;
    MECodClasse31: TMaskEdit;
    BtnClasseCons31: TBitBtn;
    EDDescricaoClasse31: TEdit;
    Label168: TLabel;
    Me12Cadastro: TMaskEdit;
    Bt12ConsCadastro: TBitBtn;
    Ed12Cadastro: TEdit;
    Label169: TLabel;
    Ed1VendedorPreposto: TEdit;
    Bt1VendedorPreposto: TBitBtn;
    Me1VendedorPreposto: TMaskEdit;
    Label170: TLabel;
    Label171: TLabel;
    Me2VendedorPreposto: TMaskEdit;
    Bt2VendedorPreposto: TBitBtn;
    Ed2VendedorPreposto: TEdit;
    Label172: TLabel;
    Me10VendedorPreposto: TMaskEdit;
    Bt10VendedorPreposto: TBitBtn;
    Ed10VendedorPreposto: TEdit;
    ME15VendedorPreposto: TMaskEdit;
    Label174: TLabel;
    Bt15ConVendedorPreposto: TBitBtn;
    Ed15VendedorPreposto: TEdit;
    Me4Classe: TMaskEdit;
    Label166: TLabel;
    Bt4Classe: TBitBtn;
    Ed4Classe: TEdit;
    ME5VendedorPreposto: TMaskEdit;
    Label176: TLabel;
    BT5ConsVendedorPreposto: TBitBtn;
    ED5VendedorPreposto: TEdit;
    ME8VendedorPreposto: TMaskEdit;
    Label177: TLabel;
    BT8ConsVendedor: TBitBtn;
    ED8VendedorPreposto: TEdit;
    Label178: TLabel;
    ME14VendedorPreposto: TMaskEdit;
    BT14VendedorPreposto: TBitBtn;
    ED14VendedorPreposto: TEdit;
    Me21VendedorPreposto: TMaskEdit;
    BT21VendedorPreposto: TBitBtn;
    ED21VendedorPreposto: TEdit;
    Label179: TLabel;
    Label180: TLabel;
    ME29VendedorPreposto: TMaskEdit;
    BT29VendedorPreposto: TBitBtn;
    ED29VendedorPreposto: TEdit;
    Label181: TLabel;
    ME25VendedorPreposto: TMaskEdit;
    BT25VendedorPreposto: TBitBtn;
    ED25VendedorPreposto: TEdit;
    Label182: TLabel;
    ME26VendedorPreposto: TMaskEdit;
    BT26VendedorPreposto: TBitBtn;
    ED26VendedorPreposto: TEdit;
    Label175: TLabel;
    ME31VendedorPreposto: TMaskEdit;
    Bt31VendedorPreposto: TBitBtn;
    Ed31VendedorPreposto: TEdit;
    Label183: TLabel;
    ME18VendedorPreposto: TMaskEdit;
    BT18VendedorPreposto: TBitBtn;
    ED18VendedorPreposto: TEdit;
    Label184: TLabel;
    ME20VendedorPreposto: TMaskEdit;
    BT20VendedorPreposto: TBitBtn;
    Ed20VendedorPreposto: TEdit;
    Label185: TLabel;
    ME9Operacao1: TMaskEdit;
    BitBtn8: TBitBtn;
    Ed9Operacao1: TEdit;
    Cb10Ordem: TComboBox;
    Label186: TLabel;
    Rg15Ordem: TRadioGroup;
    Label187: TLabel;
    Me26Produto: TMaskEdit;
    BitBtn13: TBitBtn;
    Ed26Produto: TEdit;
    Label188: TLabel;
    CB21TipoProduto: TComboBox;
    Ed10Serie1: TEdit;
    Label189: TLabel;
    Ed0Serie1: TEdit;
    Label190: TLabel;
    Rg9Ordem: TRadioGroup;
    Me16Departamento: TMaskEdit;
    Label191: TLabel;
    Bt16Departamento: TBitBtn;
    Ed16Departamento: TEdit;
    Label192: TLabel;
    ME1Fornecedor: TMaskEdit;
    Bt1Fornecedor: TBitBtn;
    ED1Fornecedor: TEdit;
    ME3Fornecedor: TMaskEdit;
    Label193: TLabel;
    Bt3Fornecedor: TBitBtn;
    Ed3Fornecedor: TEdit;
    RG10CondicaoPagto: TRadioGroup;
    ME4TipoCadastro: TMaskEdit;
    Label140: TLabel;
    Bt4TipoCadastro: TBitBtn;
    Ed4TipoCadastro: TEdit;
    ME31TipoCadastro: TMaskEdit;
    Label202: TLabel;
    Bt31TipoCadastro: TBitBtn;
    Ed31TipoCadastro: TEdit;
    Label194: TLabel;
    Me10Observacao: TMaskEdit;
    Ed20Serie: TEdit;
    Label195: TLabel;
    Label196: TLabel;
    Ed20Serie1: TEdit;
    Me10Observacao1: TMaskEdit;
    TabSheet34: TTabSheet;
    Label197: TLabel;
    Label198: TLabel;
    ME34CodFilial: TMaskEdit;
    Btn34FilialCons: TBitBtn;
    Ed34Filial: TEdit;
    ME34CodVendedor: TMaskEdit;
    Btn34VendedorCons: TBitBtn;
    Ed34Vendedor: TEdit;
    GroupBox33: TGroupBox;
    Label199: TLabel;
    Label200: TLabel;
    ME34DtInicio: TMaskEdit;
    ME34DtFinal: TMaskEdit;
    Label201: TLabel;
    ME34CodClasse: TMaskEdit;
    Btn34ClasseCons: TBitBtn;
    Ed34Classe: TEdit;
    ME3Vendedor: TMaskEdit;
    Label203: TLabel;
    Bt3Vendedor: TBitBtn;
    Ed3Vendedor: TEdit;
    Label204: TLabel;
    Me21TipoCadastro: TMaskEdit;
    Bt21TipoCadastro: TBitBtn;
    Ed21TipoCadastro: TEdit;
    Rg34Cancelado_Sim_Nao: TRadioGroup;
    TabSheet35: TTabSheet;
    Label205: TLabel;
    ME35Filial: TMaskEdit;
    BT35Filial: TBitBtn;
    Ed35Filial: TEdit;
    Label206: TLabel;
    ME35Vendedor: TMaskEdit;
    BT35Vendedor: TBitBtn;
    Ed35Vendedor: TEdit;
    Label207: TLabel;
    ME35Classe: TMaskEdit;
    BT35Classe: TBitBtn;
    Ed35Classe: TEdit;
    GroupBox34: TGroupBox;
    Label208: TLabel;
    Label209: TLabel;
    ME35DtInicial: TMaskEdit;
    ME35DtFinal: TMaskEdit;
    Label210: TLabel;
    ME35TribFederal: TMaskEdit;
    RG4Cadastro: TRadioGroup;
    Rg16Ordem: TRadioGroup;
    RGProducao: TRadioGroup;
    ME4Cidade: TMaskEdit;
    Label211: TLabel;
    SB4Cidade: TSpeedButton;
    Ed4Cidade: TEdit;
    TabSheet36: TTabSheet;
    GroupBox35: TGroupBox;
    Label212: TLabel;
    Label213: TLabel;
    ME36Dt_Inicial: TMaskEdit;
    ME36Dt_Final: TMaskEdit;
    ME36Filial: TMaskEdit;
    SB36Filial: TSpeedButton;
    Ed36Filial: TEdit;
    Label214: TLabel;
    ME36Meta: TMaskEdit;
    Label215: TLabel;
    Label216: TLabel;
    Me27Vendedor: TMaskEdit;
    Bt27Vendedor: TBitBtn;
    Ed27Vendedor: TEdit;
    Label217: TLabel;
    ME7Vendedor: TMaskEdit;
    SB7Vendedor: TBitBtn;
    Ed7Vendedor: TEdit;
    Label218: TLabel;
    ME7Fabricante: TMaskEdit;
    SB7Fabricante: TBitBtn;
    Ed7Fabricante: TEdit;
    Rg10Comissao: TRadioGroup;
    Label219: TLabel;
    Label220: TLabel;
    Me11Prazo5: TMaskEdit;
    Me11Prazo6: TMaskEdit;
    Rg3Ordem: TRadioGroup;
    Rg15Situacao: TRadioGroup;
    TabSheet37: TTabSheet;
    GroupBox36: TGroupBox;
    Label173: TLabel;
    Label221: TLabel;
    Label222: TLabel;
    Label223: TLabel;
    Ed37Filial: TEdit;
    Ed37Vendedor: TEdit;
    ME37Filial: TMaskEdit;
    ME37Vendedor: TMaskEdit;
    SB37Filial: TSpeedButton;
    SB37Vendedor: TSpeedButton;
    ME37DtInicial: TMaskEdit;
    ME37DtFinal: TMaskEdit;
    RG7Tipo: TRadioGroup;
    procedure Bt1ConsFilialClick(Sender: TObject);
    procedure Bt1ConsVendedorClick(Sender: TObject);
    procedure Bt2FilialClick(Sender: TObject);
    procedure Bt2VendedorClick(Sender: TObject);
    procedure Bt3ConsFilialClick(Sender: TObject);
    procedure Bt3CadastroClick(Sender: TObject);
    procedure BtOperacaoClick(Sender: TObject);
    procedure Bt5ConsFilialClick(Sender: TObject);
    procedure Bt5ConsVendedorClick(Sender: TObject);
    procedure Bt5ConsOperacaoClick(Sender: TObject);
    procedure ME6FilialExit(Sender: TObject);
    procedure ME6SerieExit(Sender: TObject);
    procedure Bt6ConsFilialClick(Sender: TObject);
    procedure Bt6ConsSerieClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bt7ConsFilialClick(Sender: TObject);
    procedure ME7FilialExit(Sender: TObject);
    procedure Bt7ConsClasseClick(Sender: TObject);
    procedure ME7ClasseExit(Sender: TObject);
    procedure ME7SubClasseExit(Sender: TObject);
    procedure Bt8ConsFilialClick(Sender: TObject);
    procedure Bt8SubClasseClick(Sender: TObject);
    procedure ME8FilialExit(Sender: TObject);
    procedure ME8ClasseExit(Sender: TObject);
    procedure ME8SubClasseExit(Sender: TObject);
    procedure ME9FilialExit(Sender: TObject);
    procedure Bt9FilialClick(Sender: TObject);
    procedure ME9ProdutoExit(Sender: TObject);
    procedure Bt9ConsProdutoClick(Sender: TObject);
    procedure ME9LoteExit(Sender: TObject);
    procedure Bt9LoteClick(Sender: TObject);
    procedure ME10FilialExit(Sender: TObject);
    procedure ME10VendedorExit(Sender: TObject);
    procedure Bt10VendedorClick(Sender: TObject);
    procedure ME11FilialExit(Sender: TObject);
    procedure ME11ConsFilialClick(Sender: TObject);
    procedure Bt10ConsFilialClick(Sender: TObject);
    procedure ME12FilialExit(Sender: TObject);
    procedure ME12VendedorExit(Sender: TObject);
    procedure Bt12ConsFilialClick(Sender: TObject);
    procedure Bt12ConsVendedorClick(Sender: TObject);
    procedure ME13FilialExit(Sender: TObject);
    procedure Bt13ConsFilialClick(Sender: TObject);
    procedure ME13ClasseIExit(Sender: TObject);
    procedure ME13SubClasseIExit(Sender: TObject);
    procedure Bt13ConsClasseIClick(Sender: TObject);
    procedure ME13ClasseFExit(Sender: TObject);
    procedure ME13SubClasseFExit(Sender: TObject);
    procedure Bt13ConsClasseFClick(Sender: TObject);
    procedure ME14FilialExit(Sender: TObject);
    procedure ME14VendedorExit(Sender: TObject);
    procedure Bt14ConsVendedorClick(Sender: TObject);
    procedure ME14ClasseExit(Sender: TObject);
    procedure ME14SubClasseExit(Sender: TObject);
    procedure Bt14ConsFilialClick(Sender: TObject);
    procedure Bt14ConsClasseClick(Sender: TObject);
    procedure Bt15ConsFilialClick(Sender: TObject);
    procedure Bt15ConVendedorClick(Sender: TObject);
    procedure ME16CadastroExit(Sender: TObject);
    procedure Bt17ConsLoteClick(Sender: TObject);
    procedure ME16ConsFilialClick(Sender: TObject);
    procedure ME17LoteExit(Sender: TObject);
    procedure ME16VendedorExit(Sender: TObject);
    procedure Bt16ConsVendedorClick(Sender: TObject);
    procedure ME16ConsCadastroClick(Sender: TObject);
    procedure ME18FilialExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ME18VendedorExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ME19CodFilialExit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ME19CodCadastroExit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ME20CodFilialExit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure ME20CodVendedorExit(Sender: TObject);
    procedure Bt0ConsVendedorClick(Sender: TObject);
    procedure ME7FilialChange(Sender: TObject);
    procedure BT21ConsFilialClick(Sender: TObject);
    procedure Bt21VendedorClick(Sender: TObject);
    procedure Me21VendedorChange(Sender: TObject);
    procedure Me21FilialChange(Sender: TObject);
    procedure Me8VendedorExit(Sender: TObject);
    procedure Bt8VendedorClick(Sender: TObject);
    procedure Me22FilialChange(Sender: TObject);
    procedure BT22ConsFilialClick(Sender: TObject);
    procedure Bt9ConsOperacaoClick(Sender: TObject);
    procedure ME9OperacaoExit(Sender: TObject);
    procedure Me23FilialExit(Sender: TObject);
    procedure Bt23FilialClick(Sender: TObject);
    procedure Me23CadastroExit(Sender: TObject);
    procedure Bt23CadastroClick(Sender: TObject);
    procedure Me23VendedorExit(Sender: TObject);
    procedure Bt23VendedorClick(Sender: TObject);
    procedure Me23OperacaoExit(Sender: TObject);
    procedure Bt23OperacaoClick(Sender: TObject);
    procedure Bt4ClassificacaoClick(Sender: TObject);
    procedure Bt4VendedorClick(Sender: TObject);
    procedure Me16HistoricoExit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Me24FilialExit(Sender: TObject);
    procedure Bt24FilialClick(Sender: TObject);
    procedure Me24CadastroExit(Sender: TObject);
    procedure Bt24CadastroClick(Sender: TObject);
    procedure ME16FilialChange(Sender: TObject);
    procedure Me9Operacao1Exit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Me7OperacaoExit(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure ME25FilialExit(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure ME25VendedorExit(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure RB19TodosClick(Sender: TObject);
    procedure Me19ValorChange(Sender: TObject);
    procedure ME26FilialExit(Sender: TObject);
    procedure ME26VendedorExit(Sender: TObject);
    procedure Btn26FilialClick(Sender: TObject);
    procedure Btn26VendedorClick(Sender: TObject);
    procedure ME26RegiaoExit(Sender: TObject);
    procedure Btn26RegiaoClick(Sender: TObject);
    procedure ME27FilialExit(Sender: TObject);
    procedure Btn27FilialClick(Sender: TObject);
    procedure Btn27ClasseIClick(Sender: TObject);
    procedure Btn27ClasseFClick(Sender: TObject);
    procedure ME27ClasseFExit(Sender: TObject);
    procedure ME27ClasseIExit(Sender: TObject);
    procedure Me23ProdutoExit(Sender: TObject);
    procedure Bt23ProdutoClick(Sender: TObject);
    procedure Me27ProdutoExit(Sender: TObject);
    procedure Bt27ProdutoClick(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure Bt12OperacaoClick(Sender: TObject);
    procedure Me12OperacaoExit(Sender: TObject);
    procedure Me29ClasseIExit(Sender: TObject);
    procedure Btn29ClasseIClick(Sender: TObject);
    procedure Me29SubClasseExit(Sender: TObject);
    procedure Bt29SubClasseClick(Sender: TObject);
    procedure Me29VendedorExit(Sender: TObject);
    procedure Bt29VendedorClick(Sender: TObject);
    procedure Me29ProdutoExit(Sender: TObject);
    procedure Bt29ProdutoClick(Sender: TObject);
    procedure Me29FilialExit(Sender: TObject);
    procedure Btn29FilialClick(Sender: TObject);
    procedure MEFilialCodChange(Sender: TObject);
    procedure MEVendedorCodChange(Sender: TObject);
    procedure MERegiaoCodChange(Sender: TObject);
    procedure BtnFilialConsClick(Sender: TObject);
    procedure BtnVendedorConsClick(Sender: TObject);
    procedure BtnRegiaoConsClick(Sender: TObject);
    procedure Bt1ProdutoClick(Sender: TObject);
    procedure Bt3ConsProdutoClick(Sender: TObject);
    procedure MECodFilial31Change(Sender: TObject);
    procedure BtnFilialCons31Click(Sender: TObject);
    procedure MECodVendedor31Change(Sender: TObject);
    procedure BtnVendedorCons31Click(Sender: TObject);
    procedure TabSheet33Show(Sender: TObject);
    procedure Bt4ClasseClick(Sender: TObject);
    procedure BtnClasseCons31Click(Sender: TObject);
    procedure MECodClasse31Exit(Sender: TObject);
    procedure Me12CadastroExit(Sender: TObject);
    procedure Bt12ConsCadastroClick(Sender: TObject);
    procedure Bt1VendedorPrepostoClick(Sender: TObject);
    procedure Bt2VendedorPrepostoClick(Sender: TObject);
    procedure Me10VendedorPrepostoExit(Sender: TObject);
    procedure Bt10VendedorPrepostoClick(Sender: TObject);
    procedure Bt15ConVendedorPrepostoClick(Sender: TObject);
    procedure Bt4VendedorPrepostoClick(Sender: TObject);
    procedure ME8VendedorPrepostoExit(Sender: TObject);
    procedure BT8ConsVendedorClick(Sender: TObject);
    procedure ME14VendedorPrepostoExit(Sender: TObject);
    procedure BT14VendedorPrepostoClick(Sender: TObject);
    procedure BT29VendedorPrepostoClick(Sender: TObject);
    procedure ME29VendedorPrepostoExit(Sender: TObject);
    procedure BT25VendedorPrepostoClick(Sender: TObject);
    procedure ME25VendedorPrepostoExit(Sender: TObject);
    procedure BT26VendedorPrepostoClick(Sender: TObject);
    procedure ME26VendedorPrepostoExit(Sender: TObject);
    procedure BT21VendedorPrepostoClick(Sender: TObject);
    procedure Me21VendedorPrepostoExit(Sender: TObject);
    procedure Bt31VendedorPrepostoClick(Sender: TObject);
    procedure ME31VendedorPrepostoExit(Sender: TObject);
    procedure ME18VendedorPrepostoExit(Sender: TObject);
    procedure BT18VendedorPrepostoClick(Sender: TObject);
    procedure ME20VendedorPrepostoExit(Sender: TObject);
    procedure BT20VendedorPrepostoClick(Sender: TObject);
    procedure Bt0FilialClick(Sender: TObject);
    procedure BT34FilialClick(Sender: TObject);
    procedure BT34VendedorClick(Sender: TObject);
    procedure ME34FilialExit(Sender: TObject);
    procedure Me26ProdutoExit(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure Me16DepartamentoExit(Sender: TObject);
    procedure Bt16DepartamentoClick(Sender: TObject);
    procedure Bt1FornecedorClick(Sender: TObject);
    procedure Bt3FornecedorClick(Sender: TObject);
    procedure Bt31TipoCadastroClick(Sender: TObject);
    procedure ME31TipoCadastroExit(Sender: TObject);
    procedure Bt4TipoCadastroClick(Sender: TObject);
    procedure Bt4ConsFilialClick(Sender: TObject);
    procedure ME34CodFilialExit(Sender: TObject);
    procedure Btn34FilialConsClick(Sender: TObject);
    procedure ME34CodVendedorExit(Sender: TObject);
    procedure Btn34VendedorConsClick(Sender: TObject);
    procedure ME34CodClasseExit(Sender: TObject);
    procedure Btn34ClasseConsClick(Sender: TObject);
    procedure Bt3VendedorClick(Sender: TObject);
    procedure Bt21TipoCadastroClick(Sender: TObject);
    procedure Me21TipoCadastroExit(Sender: TObject);
    procedure ME35FilialExit(Sender: TObject);
    procedure ME35VendedorExit(Sender: TObject);
    procedure ME35ClasseExit(Sender: TObject);
    procedure SB4CidadeClick(Sender: TObject);
    procedure ME36FilialExit(Sender: TObject);
    procedure SB36FilialClick(Sender: TObject);
    procedure Me27VendedorExit(Sender: TObject);
    procedure Bt27VendedorClick(Sender: TObject);
    procedure SB7VendedorClick(Sender: TObject);
    procedure ME7VendedorExit(Sender: TObject);
    procedure SB7FabricanteClick(Sender: TObject);
    procedure ME7FabricanteExit(Sender: TObject);
    procedure ME0FilialChange(Sender: TObject);
    procedure ME0VendedorChange(Sender: TObject);
    procedure ME15FilialChange(Sender: TObject);
    procedure ME15VendedorChange(Sender: TObject);
    procedure ME15VendedorPrepostoChange(Sender: TObject);
    procedure ME1FilialChange(Sender: TObject);
    procedure ME1VendedorChange(Sender: TObject);
    procedure Me1VendedorPrepostoChange(Sender: TObject);
    procedure Me1OperacaoChange(Sender: TObject);
    procedure Me1ProdutoChange(Sender: TObject);
    procedure ME1FornecedorChange(Sender: TObject);
    procedure ME4FilialChange(Sender: TObject);
    procedure ME4ClassCadastroChange(Sender: TObject);
    procedure ME4Cod_VendedorChange(Sender: TObject);
    procedure Me4ClasseChange(Sender: TObject);
    procedure ME4TipoCadastroChange(Sender: TObject);
    procedure ME4CidadeChange(Sender: TObject);
    procedure ME5FilialChange(Sender: TObject);
    procedure ME5VendedorChange(Sender: TObject);
    procedure ME5OperacaoChange(Sender: TObject);
    procedure ME5VendedorPrepostoChange(Sender: TObject);
    procedure ME2FilialChange(Sender: TObject);
    procedure ME2VendedorChange(Sender: TObject);
    procedure Me2VendedorPrepostoChange(Sender: TObject);
    procedure ME3FilialChange(Sender: TObject);
    procedure ME3CadastroChange(Sender: TObject);
    procedure ME3OperacaoChange(Sender: TObject);
    procedure Me3ProdutoChange(Sender: TObject);
    procedure ME3FornecedorChange(Sender: TObject);
    procedure ME3VendedorChange(Sender: TObject);
    procedure SB37FilialClick(Sender: TObject);
    procedure SB37VendedorClick(Sender: TObject);
    procedure ME37FilialExit(Sender: TObject);
    procedure ME37VendedorExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaSaidaParam: TFNotaSaidaParam;

implementation

uses UFilialCons       ,UFilial_cl   ,UVendedorCons ,UVendedor_cl     ,UCadastro_cl,
     UCadastroCons     ,UOperacao_cl ,UOperacaoCons ,UClassCadastro_cl,USerie_cl   ,
     USerieCons        ,UClasseCons  ,UClasse_cl    ,UOracle_cl       ,UProduto_cl ,
     UProdutoCons      ,UTipoLote_cl ,UTipoLoteCons ,UParamSistema_cl ,
     UClassCadastroCons,UHistorico_cl,UHistoricoCons, URegiao_cl,
     URegiaoCons       ,UNotaSaida_cl,UUsuario_cl, UPedidoParam,
  UDepartamentoCons, UDepartamento_cl, UTipoCadastroCons, UTipoCadastro_cl,
  UCidade_cl, UCidadeCons;

{$R *.DFM}

procedure TFNotaSaidaParam.Bt1ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME1Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFNotaSaidaParam.Bt1ConsVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    ME1Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFNotaSaidaParam.Bt2FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME2Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFNotaSaidaParam.Bt2VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    ME2Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFNotaSaidaParam.Bt3ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME3Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFNotaSaidaParam.Bt3CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    ME3Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFNotaSaidaParam.BtOperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    ME3Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
end;

procedure TFNotaSaidaParam.Bt5ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME5Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFNotaSaidaParam.Bt5ConsVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    ME5Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFNotaSaidaParam.Bt5ConsOperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    ME5Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
end;

procedure TFNotaSaidaParam.ME6FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME6Filial.Text) <> '' Then
    Ed6Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                         'COD_FILIAL = '+Trim(ME6Filial.Text))
  Else
    Ed6Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME6SerieExit(Sender: TObject);
begin
  inherited;
  If Trim(ME6Serie.Text) <> '' Then
  With DMSerie do
    Ed6Serie.Text := ME6Serie.Text
  Else
    Ed6Serie.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt6ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME6Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME6FilialExit(Self);
  End;
end;

procedure TFNotaSaidaParam.Bt6ConsSerieClick(Sender: TObject);
begin
  inherited;
  If FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
  If FSerieCons.ShowModal = mrOk then
  Begin
    ME6Serie.Text := DMSerie.QSerieConsCod_Serie.Text;
    ME6SerieExit(Self);
  End;
end;

procedure TFNotaSaidaParam.FormCreate(Sender: TObject);
begin
  inherited;
  If FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
end;

procedure TFNotaSaidaParam.Bt7ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME7Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME7FilialExit(Self);
  End;

end;

procedure TFNotaSaidaParam.ME7FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME7Filial.Text) <> '' Then
  With DMFilial do
    Ed7Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME7Filial.Text))
  Else
    Ed7Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt7ConsClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME7Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME7SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;    
    ME7SubClasseExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME7ClasseExit(Sender: TObject);
begin
  inherited;
  ME7SubClasseExit(Self);
end;

procedure TFNotaSaidaParam.ME7SubClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(ME7Classe.Text) = '' Then
  Begin
    Ed7Classe.Text := 'Todos';
    ME7SubClasse.Text := '';
  End
  Else
    If Trim(ME7SubClasse.Text) = '' then
    Begin
      Ed7Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME7Classe.Text+
                                           'AND NUM_SUBCLASSE = 0');
      ME7SubClasse.Text := '0';
    End
    Else
      Ed7Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME7Classe.Text+
                                           'AND NUM_SUBCLASSE = '+ME7SubClasse.Text);
end;

procedure TFNotaSaidaParam.Bt8ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME8Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME8FilialExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Bt8SubClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME8Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME8SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME8SubClasseExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME8FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME8Filial.Text) <> '' Then
    Ed8Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME8Filial.Text))
  Else
    Ed8Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME8ClasseExit(Sender: TObject);
begin
  inherited;
  ME8SubClasseExit(Self);
end;

procedure TFNotaSaidaParam.ME8SubClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(ME8Classe.Text) = '' Then
  Begin
    Ed8Classe.Text := 'Todos';
    ME8SubClasse.Text := '';
  End
  Else
    If Trim(ME8SubClasse.Text) = '' then
    Begin
      Ed8Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME8Classe.Text+
                                           'AND NUM_SUBCLASSE = 0');
      ME8SubClasse.Text := '0';
    End
    Else
      Ed8Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME8Classe.Text+
                                           'AND NUM_SUBCLASSE = '+ME8SubClasse.Text);
end;

procedure TFNotaSaidaParam.ME9FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME9Filial.Text) <> '' Then
    Ed9Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME9Filial.Text))
  else
    Ed9Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt9FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME9Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME9FilialExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME9ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME9Produto.Text) <> '' Then
    Ed9Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                      'COD_PRODUTO = '+Trim(ME9Produto.Text))
  Else
    Ed9Produto.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt9ConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    ME9Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME9ProdutoExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME9LoteExit(Sender: TObject);
begin
  inherited;
  If Trim(ME9Lote.Text) <> '' Then
    Ed9Lote.Text := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO',
                                           'COD_LOTE_TIPO = '+Trim(ME9Lote.Text))
  Else
    Ed9Lote.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt9LoteClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOk then
  Begin
    ME9Lote.Text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
    ME9LoteExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME10FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME10Filial.Text) <> '' Then
    Ed10Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME10Filial.Text))
  Else
    Ed10Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME10VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME10Vendedor.Text) <> '' Then
    Ed10Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME10Vendedor.Text))
  Else
    Ed10Vendedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt10VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME10Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME10VendedorExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME11FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME11Filial.Text) <> '' Then
    Ed11Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME11Filial.Text))
  Else
    Ed11Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME11ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME11Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME11FilialExit(Self);
  End;
end;

procedure TFNotaSaidaParam.Bt10ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME10Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME10FilialExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME12FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME12Filial.Text) <> '' Then
    Ed12Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME12Filial.Text))
  Else
    Ed12Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME12VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME12Vendedor.Text) <> '' Then
    Ed12Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME12Vendedor.Text))
  Else
    Ed12Vendedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt12ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME12Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME12FilialExit(Self);
  End;
end;

procedure TFNotaSaidaParam.Bt12ConsVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME12Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME12VendedorExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME13FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME13Filial.Text) <> '' Then
    Ed13Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME13Filial.Text))
  Else
    Ed13Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt13ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME13Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME13FilialExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME13ClasseIExit(Sender: TObject);
begin
  inherited;
  ME13SubClasseIExit(Self);
end;

procedure TFNotaSaidaParam.ME13SubClasseIExit(Sender: TObject);
begin
  inherited;
  If Trim(ME13ClasseI.Text) = '' Then
  Begin
    Ed13ClasseI.Text := 'Todos';
    ME13SubClasseI.Text := '';
  End
  Else
    If Trim(ME13SubClasseI.Text) = '' then
    Begin
      Ed13ClasseI.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME13ClasseI.Text+
                                           'AND NUM_SUBCLASSE = 0');
      ME13SubClasseI.Text := '0';
    End
    Else
      Ed13ClasseI.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME13ClasseI.Text+
                                           'AND NUM_SUBCLASSE = '+ME13SubClasseI.Text);
end;

procedure TFNotaSaidaParam.Bt13ConsClasseIClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME13ClasseI.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME13SubClasseI.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME13SubClasseIExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME13ClasseFExit(Sender: TObject);
begin
  inherited;
  ME13SubClasseFExit(Self);
end;

procedure TFNotaSaidaParam.ME13SubClasseFExit(Sender: TObject);
begin
  inherited;
  If Trim(ME13ClasseF.Text) = '' Then
  Begin
    Ed13ClasseF.Text := 'Todos';
    ME13SubClasseF.Text := '';
  End
  Else
    If Trim(ME13SubClasseF.Text) = '' then
    Begin
      Ed13ClasseF.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME13ClasseF.Text+
                                           'AND NUM_SUBCLASSE = 0');
      ME13SubClasseF.Text := '0';
    End
    Else
      Ed13ClasseF.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME13ClasseF.Text+
                                           'AND NUM_SUBCLASSE = '+ME13SubClasseF.Text);
end;

procedure TFNotaSaidaParam.Bt13ConsClasseFClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME13ClasseF.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME13SubClasseF.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME13SubClasseFExit(Self);
  End;

end;

procedure TFNotaSaidaParam.ME14FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME14Filial.Text) <> '' Then
    Ed14Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME14Filial.Text))
  Else
    Ed14Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME14VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME14Vendedor.Text) <> '' Then
    Ed14Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME14Vendedor.Text))
  Else
    Ed14Vendedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt14ConsVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME14Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME14VendedorExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME14ClasseExit(Sender: TObject);
begin
  inherited;
  ME14SubClasseExit(Self);
end;

procedure TFNotaSaidaParam.ME14SubClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(ME14Classe.Text) = '' Then
  Begin
    Ed14Classe.Text := 'Todos';
    ME14SubClasse.Text := '';
    ME14NumClasse.Text := '';
  End
  Else
    If Trim(ME14SubClasse.Text) = '' then
    Begin
      Ed14Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME14Classe.Text+
                                           'AND NUM_SUBCLASSE = 0');
      ME14SubClasse.Text := '0';
      ME14NumClasse.Text := DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME14Classe.Text+
                                           'AND NUM_SUBCLASSE = 0');
    End
    Else
    Begin
      Ed14Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME14Classe.Text+
                                           'AND NUM_SUBCLASSE = '+ME14SubClasse.Text);
      ME14NumClasse.Text := DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME14Classe.Text+
                                           'AND NUM_SUBCLASSE = '+ME14SubClasse.Text);
    End;

end;

procedure TFNotaSaidaParam.Bt14ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME14Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME14FilialExit(Self);
  End;
end;

procedure TFNotaSaidaParam.Bt14ConsClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME14Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME14SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME14SubClasseExit(Self);
  End;
end;

procedure TFNotaSaidaParam.Bt15ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME15Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFNotaSaidaParam.Bt15ConVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    ME15Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFNotaSaidaParam.ME16CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME16Cadastro.Text) <> '' Then
   Begin
    Ed16Cadastro.text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                           'COD_CADASTRO = '+Trim(ME16Cadastro.Text));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(ME16Cadastro.Text)));
   End
  Else
    Ed16Cadastro.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt17ConsLoteClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOk then
  Begin
    ME17Lote.Text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
    ME17LoteExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME16ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME16Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFNotaSaidaParam.ME17LoteExit(Sender: TObject);
begin
  inherited;
  If Trim(ME17Lote.Text) <> '' Then
    Ed17Lote.Text := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO',
                                           'COD_LOTE_TIPO = '+Trim(ME17Lote.Text))
  Else
    Ed17Lote.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME16VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME16Vendedor.Text) <> '' Then
    Ed16Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME16Vendedor.Text))
  Else
    Ed16Vendedor.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt16ConsVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME16Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME16VendedorExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME16ConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME16Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME16CadastroExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME18FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME18Filial.Text) <> '' Then
    Ed18Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME18Filial.Text))
  Else
    Ed18Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME18Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME18FilialExit(Self);
  End;

end;

procedure TFNotaSaidaParam.ME18VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME18Vendedor.Text) <> '' Then
    Ed18Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME18Vendedor.Text))
  Else
    Ed18Vendedor.Text := 'Todos';

end;

procedure TFNotaSaidaParam.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME18Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME18VendedorExit(Self);
  End;

end;

procedure TFNotaSaidaParam.FormActivate(Sender: TObject);
begin
  inherited;
  ME0Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME1Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME2Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME3Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME4Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME5Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME6Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME7Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME8Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME9Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME10Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME11Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME12Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME13Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME14Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME15Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME16Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME18Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME19CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME20CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME21Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME22Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME23Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME24Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME25Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME26Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME27Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  MECodFilial31.Text:= FloatToStr(DMUsuario.CodFilialUsuario);
  CB7Ordem.ItemIndex:=0;

end;

procedure TFNotaSaidaParam.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME19CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME19CodFilialExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME19CodFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME19CodFilial.Text) <> '' Then
    ME19Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME19CODFilial.Text))
  Else
    ME19Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME19CodCadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME19CodCadastroExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME19CodCadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME19CodCadastro.Text) <> '' Then
   Begin
    Me19Cadastro.text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                           'COD_CADASTRO = '+Trim(ME19CodCadastro.Text));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(ME19CodCadastro.Text)));
   End
  Else
    Me19Cadastro.Text := 'Todos';
end;

procedure TFNotaSaidaParam.BitBtn5Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME20CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME20CodFilialExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME20CodFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME20CodFilial.Text) <> '' Then
    ME20Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME20CodFilial.Text))
  Else
    ME20Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.BitBtn6Click(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME20CodVendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME20CodVendedorExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME20CodVendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME20CodVendedor.Text) <> '' Then
    ME20Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME20CodVendedor.Text))
  Else
    ME20Vendedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt0ConsVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    ME0Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFNotaSaidaParam.ME7FilialChange(Sender: TObject);
begin
  inherited;
  ME7FilialExit(Self);
end;

procedure TFNotaSaidaParam.BT21ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME21Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFNotaSaidaParam.Bt21VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    ME21Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFNotaSaidaParam.Me21VendedorChange(Sender: TObject);
begin
  inherited;
  If Trim(ME21Vendedor.Text) <> '' Then
    Ed21Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME21Vendedor.Text))
  Else
    Ed21Vendedor.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Me21FilialChange(Sender: TObject);
begin
  inherited;
  If Trim(ME21Filial.Text) <> '' Then
    Ed21Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME21Filial.Text))
  Else
    Ed21Filial.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Me8VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME8Vendedor.Text) <> '' Then
    Ed8Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME8Vendedor.Text))
  Else
    Ed8Vendedor.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt8VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME8Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME8VendedorExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Me22FilialChange(Sender: TObject);
begin
  inherited;
  If Trim(ME22Filial.Text) <> '' Then
    Ed22Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME22Filial.Text))
  Else
    Ed22Filial.Text := 'Todos';

end;

procedure TFNotaSaidaParam.BT22ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME22Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFNotaSaidaParam.Bt9ConsOperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME9Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME9OperacaoExit(Self);
  End;

end;

procedure TFNotaSaidaParam.ME9OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME9Operacao.Text) <> '' Then
    Ed9Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO',
                                           'COD_OPERACAO = '+Trim(ME9Operacao.Text))
  Else
    Ed9Operacao.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Me23FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME23Filial.Text) <> '' Then
    Ed23Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME23Filial.Text))
  Else
    Ed23Filial.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt23FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME23Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME23FilialExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Me23CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME23Cadastro.Text) <> '' Then
   Begin
    Ed23Cadastro.text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                           'COD_CADASTRO = '+Trim(ME23Cadastro.Text));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(ME23Cadastro.Text)));
   End
  Else
    Ed23Cadastro.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt23CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME23Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME23CadastroExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Me23VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME23Vendedor.Text) <> '' Then
    Ed23Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME23Vendedor.Text))
  Else
    Ed23Vendedor.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt23VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME23Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME23VendedorExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Me23OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME23Operacao.Text) <> '' Then
    Ed23Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO',
                                           'COD_OPERACAO = '+Trim(ME23Operacao.Text))
  Else
    Ed23Operacao.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt23OperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME23Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME23OperacaoExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Bt4ClassificacaoClick(Sender: TObject);
begin
  inherited;
  If FClassCadastroCons = Nil then
    FClassCadastroCons := TFClassCadastroCons.Create(Application);
  If FClassCadastroCons.ShowModal = mrOk then
    ME4ClassCadastro.Text := DMClassCadastro.QClassCadastroConsCod_Class_Cadastro.Text;
end;

procedure TFNotaSaidaParam.Bt4VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    ME4Cod_Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFNotaSaidaParam.Me16HistoricoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME16Historico.Text) <> '' Then
    Ed16Historico.Text := DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO',
                                           'COD_HISTORICO = '+Trim(ME16Historico.Text))
  Else
    Ed16Historico.Text := 'Todos';


end;

procedure TFNotaSaidaParam.BitBtn7Click(Sender: TObject);
begin
  inherited;
  If FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal = mrOk then
  Begin
    ME16Historico.Text := DMHistorico.QHistoricoConsCod_Historico.Text;
    ME16HistoricoExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Me24FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME24Filial.Text) <> '' Then
    Ed24Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME24Filial.Text))
  Else
    Ed24Filial.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt24FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME24Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME24FilialExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Me24CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME24Cadastro.Text) <> '' Then
   Begin
    Ed24Cadastro.text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                           'COD_CADASTRO = '+Trim(ME24Cadastro.Text));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(ME24Cadastro.Text)));
   End
  Else
    Ed24Cadastro.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt24CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME24Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME24CadastroExit(Self);
  End;

end;

procedure TFNotaSaidaParam.ME16FilialChange(Sender: TObject);
begin
  inherited;
  If Trim(ME16Filial.Text) <> '' Then
  With DMFilial do
    Ed16Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME16Filial.Text))
  Else
    Ed16Filial.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Me9Operacao1Exit(Sender: TObject);
begin
  inherited;
  If Trim(ME9Operacao1.Text) <> '' Then
    Ed9Operacao1.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO',
                                           'COD_OPERACAO = '+Trim(ME9Operacao1.Text))
  Else
    Ed9Operacao1.Text := 'Todos';

end;

procedure TFNotaSaidaParam.BitBtn8Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME9Operacao1.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME9Operacao1Exit(Self);
  End;

end;

procedure TFNotaSaidaParam.Me7OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME7Operacao.Text) <> '' Then
    Ed7Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO',
                                           'COD_OPERACAO = '+Trim(ME7Operacao.Text))
  Else
    Ed7Operacao.Text := 'Todos';

end;

procedure TFNotaSaidaParam.BitBtn9Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME7Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME7OperacaoExit(Self);
  End;

end;

procedure TFNotaSaidaParam.ME25FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME25Filial.Text) <> '' Then
    Ed25Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME25Filial.Text))
  Else
    Ed25Filial.Text := 'Todos';

end;

procedure TFNotaSaidaParam.BitBtn10Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME25Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME25FilialExit(Self);
  End;

end;

procedure TFNotaSaidaParam.ME25VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME25Vendedor.Text) <> '' Then
    Ed25Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME25Vendedor.Text))
  Else
    Ed25Vendedor.Text := 'Todos';

end;

procedure TFNotaSaidaParam.BitBtn11Click(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME25Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME25VendedorExit(Self);
  End;

end;

procedure TFNotaSaidaParam.RB19TodosClick(Sender: TObject);
begin
  inherited;
  If RB19Todos.Checked then
     ME19Valor.Clear;

end;

procedure TFNotaSaidaParam.Me19ValorChange(Sender: TObject);
begin
  inherited;
  if Trim(ME19Valor.Text) <> '' Then
     RB19Todos.Checked  := False;
end;

procedure TFNotaSaidaParam.ME26FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME26Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME26Filial.Text);
    QFilial.Open;
    Ed26Filial.Text := QFilialDesc_Filial.Value;
    QFilial.Close;
  End
  Else
    Ed26Filial.Text := 'Todos';

end;

procedure TFNotaSaidaParam.ME26VendedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME26Vendedor.Text) <> '' Then
    Ed26Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME26Vendedor.Text))
  else
    Ed26Vendedor.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Btn26FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME26Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME26FilialExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Btn26VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
     FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME26Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME26VendedorExit(Self);
  End;

end;

procedure TFNotaSaidaParam.ME26RegiaoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME26Regiao.Text) <> '' Then
    Ed26Regiao.Text := DMOracle.BuscaNome('SELECT DESC_REGIAO FROM TB_REGIAO',
                                           'COD_REGIAO = '+Trim(ME26Regiao.Text))
  else
    Ed26Regiao.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Btn26RegiaoClick(Sender: TObject);
begin
  inherited;
  if FRegiaoCons = Nil then
     FRegiaoCons := TFRegiaoCons.Create(Application);
  if FRegiaoCons.ShowModal = mrOk then
  begin
    ME26Regiao.Text := DMRegiao.QRegiaoConsCOD_REGIAO.Text;
    ME26RegiaoExit(Self);
  end;
end;

procedure TFNotaSaidaParam.ME27FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME27Filial.Text) <> '' Then
    Ed27Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                            'COD_FILIAL = '+Trim(ME27Filial.Text))
  else
    Ed27Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Btn27FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME27Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME27FilialExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Btn27ClasseIClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = mrOk then
  begin
    ME27ClasseI.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME27ClasseIExit(self);
  end;

end;

procedure TFNotaSaidaParam.Btn27ClasseFClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = mrOk then
  begin
    ME27ClasseF.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME27ClasseFExit(self);
  end;

end;

procedure TFNotaSaidaParam.ME27ClasseFExit(Sender: TObject);
begin
  inherited;
  if Trim(ME27ClasseF.Text) = '' Then
  begin
    Ed27ClasseF.Text := 'Todos';
    ME27ClasseF.Text := '';
  end
  else
    Ed27ClasseF.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                        'NUM_CLASSE = '+ME27ClasseF.Text+
                        'AND NUM_SUBCLASSE = 0');

end;

procedure TFNotaSaidaParam.ME27ClasseIExit(Sender: TObject);
begin
  inherited;
  if Trim(ME27ClasseI.Text) = '' Then
  begin
    Ed27ClasseI.Text := 'Todos';
    ME27ClasseI.Text := '';
  end
  else
     Ed27ClasseI.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                         'NUM_CLASSE = '+ME27ClasseI.Text+
                         'AND NUM_SUBCLASSE = 0');

end;

procedure TFNotaSaidaParam.Me23ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME23Produto.Text) <> '' Then
    Ed23Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                      'COD_PRODUTO = '+Trim(ME23Produto.Text))
  Else
    Ed23Produto.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt23ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    ME23Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME23ProdutoExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Me27ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME27Produto.Text) <> '' Then
    Ed27Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                      'COD_PRODUTO = '+Trim(ME27Produto.Text))
  Else
    Ed27Produto.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt27ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    ME27Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME27ProdutoExit(Self);
  End;

end;

procedure TFNotaSaidaParam.BitBtn12Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    ME1Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
end;

procedure TFNotaSaidaParam.Bt12OperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    ME12Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME12OperacaoExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Me12OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME12Operacao.Text) <> '' Then
    Ed12Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO',
                                           'COD_OPERACAO = '+Trim(ME12Operacao.Text))
  Else
    Ed12Operacao.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Btn29FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME29Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME29FilialExit(Self);
  end;
end;

procedure TFNotaSaidaParam.Me29ClasseIExit(Sender: TObject);
begin
  inherited;
  if Trim(ME29ClasseI.Text) = '' Then
  begin
    Ed29ClasseI.Text := 'Todos';
    ME29ClasseI.Text := '';
  end
  else
     Ed29ClasseI.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                         'NUM_CLASSE = '+ME29ClasseI.Text+
                         'AND NUM_SUBCLASSE = 0');

end;

procedure TFNotaSaidaParam.Btn29ClasseIClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = mrOk then
  begin
    ME29ClasseI.Text := DMClasse.QClasseConsNum_Classe.Text;
  end;

end;

procedure TFNotaSaidaParam.Me29VendedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME29Vendedor.Text) <> '' Then
    Ed29Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME29Vendedor.Text))
  else
    Ed29Vendedor.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt29VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
     FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME29Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME29VendedorExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Me29SubClasseExit(Sender: TObject);
begin
  inherited;
  if Trim(ME29SubClasse.Text) = '' Then
  begin
    Ed29SubClasse.Text := 'Todos';
    ME29SubClasse.Text := '';
  end
  else
    Ed29SubClasse.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                        'NUM_CLASSE = '+Trim(ME29ClasseI.Text)+
                        'AND NUM_SUBCLASSE = '+Trim(ME29SubClasse.Text));

end;

procedure TFNotaSaidaParam.Bt29SubClasseClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = mrOk then
  begin
    ME29SubClasse.Text := DMClasse.QClasseConsNum_Classe.Text;
  end;

end;

procedure TFNotaSaidaParam.Me29ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME29Produto.Text) <> '' Then
     Ed29Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                            'COD_PRODUTO = '+Trim(ME29Produto.Text))
  Else
    Ed29Produto.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt29ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    ME29Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME29ProdutoExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Me29FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME29Filial.Text) <> '' Then
    Ed29Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                            'COD_FILIAL = '+Trim(ME29Filial.Text))
  else
    Ed29Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.MEFilialCodChange(Sender: TObject);
begin
  inherited;
  if Trim(MEFilialCod.Text) <> '' then
  begin
    EdFilialDesc.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
          'TB_FILIAL.COD_FILIAL = '+MEFilialCod.Text);
  end
  else
     EdFilialDesc.Text := 'Todas';
end;

procedure TFNotaSaidaParam.MEVendedorCodChange(Sender: TObject);
begin
  inherited;
  if Trim(MEVendedorCod.Text) <> '' then
  begin
    EdVendedorDesc.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
          'TB_VENDEDOR.COD_VENDEDOR = '+MEVendedorCod.Text);
  end
  else
     EdVendedorDesc.Text := 'Todos';
end;

procedure TFNotaSaidaParam.MERegiaoCodChange(Sender: TObject);
begin
  inherited;
  if Trim(MERegiaoCod.Text) <> '' then
  begin
    EdRegiaoDesc.Text := DMOracle.BuscaNome('SELECT DESC_REGIAO FROM TB_REGIAO',
          'TB_REGIAO.COD_REGIAO = '+MERegiaoCod.Text);
  end
  else
     EdRegiaoDesc.Text := 'Todas';
end;

procedure TFNotaSaidaParam.BtnFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
     MEFilialCod.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
end;

procedure TFNotaSaidaParam.BtnVendedorConsClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
     FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
      MEVendedorCod.Text := DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
end;

procedure TFNotaSaidaParam.BtnRegiaoConsClick(Sender: TObject);
begin
  inherited;
  if FRegiaoCons = nil then
     FRegiaoCons := TFRegiaoCons.Create(Application);
  if FRegiaoCons.ShowModal = mrOk then
      MERegiaoCod.Text := DMRegiao.QRegiaoConsCOD_REGIAO.Text;
end;

procedure TFNotaSaidaParam.Bt1ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    ME1Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
end;

procedure TFNotaSaidaParam.Bt3ConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    ME3Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
end;

procedure TFNotaSaidaParam.MECodFilial31Change(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial31.Text) <> '' then
  begin
    EdFilialDesc31.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
          'TB_FILIAL.COD_FILIAL = '+MECodFilial31.Text);
  end
  else
     EdFilialDesc31.Text := '';
end;

procedure TFNotaSaidaParam.BtnFilialCons31Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
      MECodFilial31.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
end;

procedure TFNotaSaidaParam.MECodVendedor31Change(Sender: TObject);
begin
  inherited;
  if Trim(MECodVendedor31.Text) <> '' then
  begin
    EdVendedorNome31.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
          'TB_VENDEDOR.COD_VENDEDOR = '+MECodVendedor31.Text);
  end
  else
     EdVendedorNome31.Text := '';
end;

procedure TFNotaSaidaParam.BtnVendedorCons31Click(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
     FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
     MECodVendedor31.Text := DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
end;

procedure TFNotaSaidaParam.TabSheet33Show(Sender: TObject);
begin
  inherited;
  MEDT_Recebimento_I.text := DateToStr(date-30);
  MEDT_Recebimento_F.text := DateToStr(date);
end;

procedure TFNotaSaidaParam.Bt4ClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Me4Classe.Text := DMClasse.QClasseConsCOD_CLASSE.Text;
end;

procedure TFNotaSaidaParam.BtnClasseCons31Click(Sender: TObject);
begin
  inherited;
  if FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = mrOk then
     MeCodClasse31.Text := DMClasse.QClasseConsCod_Classe.Text;
end;

procedure TFNotaSaidaParam.MECodClasse31Exit(Sender: TObject);
begin
  inherited;
  if Trim(MECodClasse31.Text) = '' Then
    EdDescricaoClasse31.Text := 'Todos'
  else
    EdDescricaoClasse31.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                        'COD_CLASSE = '+Trim(MECodClasse31.Text));
end;

procedure TFNotaSaidaParam.Me12CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME12Cadastro.Text) <> '' Then
   Begin
    Ed12Cadastro.text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                           'COD_CADASTRO = '+Trim(ME12Cadastro.Text));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(ME12Cadastro.Text)));
   End
  Else
    Ed12Cadastro.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt12ConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME12Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME12CadastroExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Bt1VendedorPrepostoClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
     ME1VendedorPreposto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFNotaSaidaParam.Bt2VendedorPrepostoClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    ME2VendedorPreposto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFNotaSaidaParam.Me10VendedorPrepostoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME10VendedorPreposto.Text) <> '' Then
    Ed10VendedorPreposto.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME10VendedorPreposto.Text))
  Else
    Ed10VendedorPreposto.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt10VendedorPrepostoClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME10VendedorPreposto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME10VendedorPrepostoExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Bt15ConVendedorPrepostoClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    ME15VendedorPreposto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFNotaSaidaParam.Bt4VendedorPrepostoClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    ME5VendedorPreposto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFNotaSaidaParam.ME8VendedorPrepostoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME8VendedorPreposto.Text) <> '' Then
    Ed8VendedorPreposto.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR= '+Trim(ME8VendedorPreposto.Text))
  Else
    Ed8VendedorPreposto.Text := 'Todos';
end;

procedure TFNotaSaidaParam.BT8ConsVendedorClick(Sender: TObject);
begin
  inherited;
   If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME8VendedorPreposto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME8VendedorPrepostoExit(Self);
  end;
end;

procedure TFNotaSaidaParam.ME14VendedorPrepostoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME14VendedorPreposto.Text) <> '' Then
    Ed14VendedorPreposto.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME14VendedorPreposto.Text))
  Else
    Ed14VendedorPreposto.Text := 'Todos';
end;

procedure TFNotaSaidaParam.BT14VendedorPrepostoClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME14VendedorPreposto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME14VendedorPrepostoExit(Self);
  end;
end;

procedure TFNotaSaidaParam.BT29VendedorPrepostoClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME29VendedorPreposto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME29VendedorPrepostoExit(Self);
  end;
end;

procedure TFNotaSaidaParam.ME29VendedorPrepostoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME29VendedorPreposto.Text) <> '' Then
    Ed29VendedorPreposto.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME29VendedorPreposto.Text))
  Else
    Ed29VendedorPreposto.Text := 'Todos';
end;

procedure TFNotaSaidaParam.BT25VendedorPrepostoClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME25VendedorPreposto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME25VendedorPrepostoExit(Self);
  end;
end;

procedure TFNotaSaidaParam.ME25VendedorPrepostoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME25VendedorPreposto.Text) <> '' Then
    Ed25VendedorPreposto.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME25VendedorPreposto.Text))
  Else
    Ed25VendedorPreposto.Text := 'Todos';
end;

procedure TFNotaSaidaParam.BT26VendedorPrepostoClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME26VendedorPreposto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME26VendedorPrepostoExit(Self);
  end;
end;

procedure TFNotaSaidaParam.ME26VendedorPrepostoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME26VendedorPreposto.Text) <> '' Then
    Ed26VendedorPreposto.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME26VendedorPreposto.Text))
  Else
    Ed26VendedorPreposto.Text := 'Todos';
end;

procedure TFNotaSaidaParam.BT21VendedorPrepostoClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    ME21VendedorPreposto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFNotaSaidaParam.Me21VendedorPrepostoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME21VendedorPreposto.Text) <> '' Then
    Ed21VendedorPreposto.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME21VendedorPreposto.Text))
  Else
    Ed21VendedorPreposto.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt31VendedorPrepostoClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    ME31VendedorPreposto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFNotaSaidaParam.ME31VendedorPrepostoExit(Sender: TObject);
begin
  inherited;
   If Trim(ME31VendedorPreposto.Text) <> '' Then
     Ed31VendedorPreposto.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME31VendedorPreposto.Text))
   Else
    Ed31VendedorPreposto.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME18VendedorPrepostoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME18VendedorPreposto.Text) <> '' Then
   Ed18VendedorPreposto.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME18VendedorPreposto.Text))
   Else
    Ed18VendedorPreposto.Text := 'Todos';
end;

procedure TFNotaSaidaParam.BT18VendedorPrepostoClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME18VendedorPreposto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME18VendedorPrepostoExit(Self);
  end;
end;

procedure TFNotaSaidaParam.ME20VendedorPrepostoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME20VendedorPreposto.Text) <> '' Then
    Ed20VendedorPreposto.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME20VendedorPreposto.Text))
  Else
    Ed20VendedorPreposto.Text := 'Todos';

end;

procedure TFNotaSaidaParam.BT20VendedorPrepostoClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME20VendedorPreposto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME20VendedorPrepostoExit(Self);
  end;
end;

procedure TFNotaSaidaParam.Bt0FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFNotaSaidaParam.BT34FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  Begin
    FPedidoParam.ME34Filial.Text := DMFILIAL.QFilialConsCOD_FILIAL.Text;
    ME34FilialExit(Self);
  end;
end;

procedure TFNotaSaidaParam.BT34VendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
     FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
  begin
    FPedidoParam.ME34Vendedor.Text := DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
    ME34FilialExit(Self);
  end;
end;

procedure TFNotaSaidaParam.ME34FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(FPedidoParam.ME34Filial.Text) <> '' Then
    FPedidoParam.Ed34Filial.Text := DMOracle.BuscaNome('SELECT Desc_Filial FROM TB_Filial',
                                            'COD_Filial = '+Trim(FPedidoParam.ME34Filial.Text))
  Else
    FPedidoParam.Ed34Filial.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Me26ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME26Produto.Text) <> '' Then
    Ed26Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                      'COD_PRODUTO = '+Trim(ME26Produto.Text))
  Else
    Ed26Produto.Text := 'Todos';

end;

procedure TFNotaSaidaParam.BitBtn13Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    ME26Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME26ProdutoExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Me16DepartamentoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me16Departamento.Text) <> '' Then
    Ed16Departamento.Text := DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento',
                                           'COD_Departamento = '+Trim(Me16Departamento.Text))
  Else
    Ed16Departamento.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt16DepartamentoClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk then
  Begin
    ME16Departamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    ME16DepartamentoExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Bt1FornecedorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    ME1Fornecedor.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
end;

procedure TFNotaSaidaParam.Bt3FornecedorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    ME3Fornecedor.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
end;

procedure TFNotaSaidaParam.Bt31TipoCadastroClick(Sender: TObject);
begin
  inherited;
  If FTipoCadastroCons = Nil then
    FTipoCadastroCons := TFTipoCadastroCons.Create(Application);
  If FTipoCadastroCons.ShowModal = mrOk then
    ME31TipoCadastro.Text := DMTipoCadastro.QTipoCadastroConsCOD_TIPO_CADASTRO.Text;
end;

procedure TFNotaSaidaParam.ME31TipoCadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME31TipoCadastro.Text) = '' Then
    Ed31TipoCadastro.Text := 'Todos'
  else
    Ed31TipoCadastro.Text := DMOracle.BuscaNome('SELECT DESC_TIPO_CADASTRO FROM TB_TIPO_CADASTRO',
                        'COD_TIPO_CADASTRO = '+Trim(ME31TipoCadastro.Text));

end;

procedure TFNotaSaidaParam.Bt4TipoCadastroClick(Sender: TObject);
begin
  inherited;
  If FTipoCadastroCons = Nil then
    FTipoCadastroCons := TFTipoCadastroCons.Create(Application);
  If FTipoCadastroCons.ShowModal = mrOk then
    ME4TipoCadastro.Text := DMTipoCadastro.QTipoCadastroConsCOD_TIPO_CADASTRO.Text;
end;

procedure TFNotaSaidaParam.Bt4ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME4Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFNotaSaidaParam.ME34CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME34CodFilial.Text) <> '' then
    Ed34Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
          'TB_FILIAL.COD_FILIAL = '+ME34CodFilial.Text)
  else
     Ed34Filial.Text := 'Todas';
end;

procedure TFNotaSaidaParam.Btn34FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME34CodFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;

end;

procedure TFNotaSaidaParam.ME34CodVendedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME34CodVendedor.Text) <> '' then
  begin
    Ed34Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
          'TB_VENDEDOR.COD_VENDEDOR = '+ME34CodVendedor.Text);
  end
  else
     Ed34Vendedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Btn34VendedorConsClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
     FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
  begin
    ME34CodVendedor.Text := DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
    Ed34Vendedor.Text := DMVendedor.QVendedorConsNOME.Value;
  end;
end;

procedure TFNotaSaidaParam.ME34CodClasseExit(Sender: TObject);
begin
  inherited;
    If(Trim(ME34CodClasse.Text) <> '')Then
      Ed34Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','COD_CLASSE = '+ME34CodClasse.Text)
    Else
      Ed34Classe.Text := 'Todas';
end;

procedure TFNotaSaidaParam.Btn34ClasseConsClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = nil then
     FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = mrOk then
  begin
    ME34CodClasse.Text := DMClasse.QClasseConsCOD_CLASSE.Text;
    Ed34Classe.Text := DMClasse.QClasseConsDESC_CLASSE.Value;
  end;
end;

procedure TFNotaSaidaParam.Bt3VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    Me3Vendedor.Text := DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
end;

procedure TFNotaSaidaParam.Bt21TipoCadastroClick(Sender: TObject);
begin
  inherited;
  If FTipoCadastroCons = Nil then
    FTipoCadastroCons := TFTipoCadastroCons.Create(Application);
  If FTipoCadastroCons.ShowModal = mrOk then
    ME21TipoCadastro.Text := DMTipoCadastro.QTipoCadastroConsCOD_TIPO_CADASTRO.Text;
end;

procedure TFNotaSaidaParam.Me21TipoCadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(Me21TipoCadastro.Text) = '' Then
    Ed21TipoCadastro.Text := 'Todos'
  else
    Ed21TipoCadastro.Text := DMOracle.BuscaNome('SELECT DESC_TIPO_CADASTRO FROM TB_TIPO_CADASTRO',
                        'COD_TIPO_CADASTRO = '+Trim(Me21TipoCadastro.Text));


end;

procedure TFNotaSaidaParam.ME35FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME35Filial.Text) <> '' then
    Ed35Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
          'TB_FILIAL.COD_FILIAL = '+ME35Filial.Text)
  else
     Ed35Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME35VendedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME35Vendedor.Text) <> '' then
    Ed35Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
          'TB_VENDEDOR.COD_VENDEDOR = '+ME35Vendedor.Text)
  else
     Ed35Vendedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME35ClasseExit(Sender: TObject);
begin
  inherited;
  if(Trim(ME35Classe.Text) <> '')Then
    Ed35Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
        'TB_CLASSE.COD_CLASSE = '+ME35Classe.Text)
  else
    Ed35Classe.Text := 'Todos';
end;

procedure TFNotaSaidaParam.SB4CidadeClick(Sender: TObject);
begin
  inherited;
  If FCidadeCons = Nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  If FCidadeCons.ShowModal = mrOk then
    ME4Cidade.Text := DMCidade.QCidadeConsCOD_CIDADE.Text;
end;

procedure TFNotaSaidaParam.ME36FilialExit(Sender: TObject);
begin
  inherited;
   if Trim(ME36Filial.text)<>'' then
    Ed36Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME36Filial.text)
  else
    Ed36Filial.Text:='Todos';
end;

procedure TFNotaSaidaParam.SB36FilialClick(Sender: TObject);
begin
  inherited;
    if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME36Filial.Text:=DMFilial.QFilialConsCod_Filial.Text;
      ME36FilialExit(Self);
    end;
end;

procedure TFNotaSaidaParam.Me27VendedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME27Vendedor.Text) <> '' Then
    Ed27Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME27Vendedor.Text))
  else
    Ed27Vendedor.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt27VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
     FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME27Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME27VendedorExit(Self);
  End;

end;

procedure TFNotaSaidaParam.SB7VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME7Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME7VendedorExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME7VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME7Vendedor.Text) <> '' Then
    Ed7Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME7Vendedor.Text))
  Else
    Ed7Vendedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.SB7FabricanteClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME7Fabricante.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME7FabricanteExit(Self);
  End;
end;

procedure TFNotaSaidaParam.ME7FabricanteExit(Sender: TObject);
begin
  inherited;
  If Trim(ME7Fabricante.Text) <> '' Then
    Ed7Fabricante.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                             'COD_CADASTRO = '+Trim(ME7Fabricante.Text))
  Else
    Ed7Fabricante.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME0FilialChange(Sender: TObject);
begin
  inherited;
  If Trim(ME0Filial.Text) <> '' Then
   Ed0Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+trim(ME0Filial.Text))
  Else
    Ed0Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME0VendedorChange(Sender: TObject);
begin
  inherited;
  if Trim(ME0Vendedor.Text) <> '' then
    Ed0Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(ME0Vendedor.Text))
  else
    Ed0Vendedor.Text := 'Todos';

end;

procedure TFNotaSaidaParam.ME15FilialChange(Sender: TObject);
begin
  inherited;
  If Trim(ME15Filial.Text) <> '' Then
    Ed15Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME15Filial.Text))
  Else
    Ed15Filial.Text := 'Todos';

end;

procedure TFNotaSaidaParam.ME15VendedorChange(Sender: TObject);
begin
  inherited;
 If Trim(ME15Vendedor.Text) <> '' Then
    Ed15Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME15Vendedor.Text))
  Else
    Ed15Vendedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME15VendedorPrepostoChange(Sender: TObject);
begin
  inherited;
 If Trim(ME1VendedorPreposto.Text) <> '' Then
    Ed15VendedorPreposto.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME1VendedorPreposto.Text))
  Else
    Ed15VendedorPreposto.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME1FilialChange(Sender: TObject);
begin
  inherited;
If Trim(ME1Filial.Text) <> '' Then
    Ed1Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+trim(ME1Filial.Text))
  Else
    Ed1Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME1VendedorChange(Sender: TObject);
begin
  inherited;
 If Trim(ME1Vendedor.Text) <> '' Then
    Ed1Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(ME1Vendedor.Text))
  Else
    Ed1Vendedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Me1VendedorPrepostoChange(Sender: TObject);
begin
  inherited;
 If Trim(ME1VendedorPreposto.Text) <> '' Then
    Ed1VendedorPreposto.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(ME1VendedorPreposto.Text))
  Else
    Ed1VendedorPreposto.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Me1OperacaoChange(Sender: TObject);
begin
  inherited;
 If Trim(ME1Operacao.Text) <> '' Then
    Ed1Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = '+Trim(ME1Operacao.Text))
  Else
    Ed1Operacao.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Me1ProdutoChange(Sender: TObject);
begin
  inherited;
  If Trim(ME1Produto.Text) <> '' Then
    Ed1Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(ME1Produto.Text))
  Else
    Ed1Produto.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME1FornecedorChange(Sender: TObject);
begin
  inherited;
  If Trim(ME1Fornecedor.Text) <> '' Then
   Begin
    ED1Fornecedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(ME1Fornecedor.Text));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(ME1Fornecedor.Text)));
   End
  Else
    ED1Fornecedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME4FilialChange(Sender: TObject);
begin
  inherited;
 If Trim(ME4Filial.Text) <> '' Then
    Ed4Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME4Filial.Text))
  Else
    Ed4Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME4ClassCadastroChange(Sender: TObject);
begin
  inherited;
 If Trim(ME4ClassCadastro.Text) <> '' Then
    Ed4ClassCadastro.Text := DMOracle.BuscaNome('SELECT DESC_CLASSIFICACAO FROM TB_CLASS_CADASTRO',
                                                'COD_CLASS_CADASTRO = '+Trim(ME4ClassCadastro.Text))
  Else
    Ed4ClassCadastro.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME4Cod_VendedorChange(Sender: TObject);
begin
  inherited;
 If Trim(ME4Cod_Vendedor.Text) <> '' Then
    Ed4Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME4Cod_Vendedor.Text))
  Else
    Ed4Vendedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Me4ClasseChange(Sender: TObject);
begin
  inherited;
 if Trim(ME4Classe.Text) = '' Then
    Ed4Classe.Text := 'Todos'
  else
    Ed4Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                        'COD_CLASSE = '+Trim(ME4Classe.Text));
end;

procedure TFNotaSaidaParam.ME4TipoCadastroChange(Sender: TObject);
begin
  inherited;
  if Trim(ME4TipoCadastro.Text) = '' Then
    Ed4TipoCadastro.Text := 'Todos'
  else
    Ed4TipoCadastro.Text := DMOracle.BuscaNome('SELECT DESC_TIPO_CADASTRO FROM TB_TIPO_CADASTRO',
                        'COD_TIPO_CADASTRO = '+Trim(ME4TipoCadastro.Text));

end;

procedure TFNotaSaidaParam.ME4CidadeChange(Sender: TObject);
begin
  inherited;
 if Trim(ME4Cidade.Text) = '' Then
    Ed4Cidade.Text := 'Todas'
  else
    Ed4Cidade.Text := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CADASTRO',
                        'COD_CIDADE = '+Trim(ME4Cidade.Text));
end;

procedure TFNotaSaidaParam.ME5FilialChange(Sender: TObject);
begin
  inherited;
 If Trim(ME5Filial.Text) <> '' Then
    Ed5Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME5Filial.Text))
  Else
    Ed5Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME5VendedorChange(Sender: TObject);
begin
  inherited;
If Trim(ME5Vendedor.Text) <> '' Then
    Ed5Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(ME5Vendedor.Text))
  Else
    Ed5Vendedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME5OperacaoChange(Sender: TObject);
begin
  inherited;
If Trim(ME5Operacao.Text) <> '' Then
    Ed5Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO',
                                           'COD_OPERACAO = '+Trim(ME5Operacao.Text))
  Else
    Ed5Operacao.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME5VendedorPrepostoChange(Sender: TObject);
begin
  inherited;
If Trim(ME5VendedorPreposto.Text) <> '' Then
    Ed5VendedorPreposto.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(ME5VendedorPreposto.Text))
  Else
    Ed5VendedorPreposto.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME2FilialChange(Sender: TObject);
begin
  inherited;
  If Trim(ME2Filial.Text) <> '' Then
    Ed2Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME2Filial.Text))
  Else
    Ed2Filial.Text := 'Todos';

end;

procedure TFNotaSaidaParam.ME2VendedorChange(Sender: TObject);
begin
  inherited;
  If Trim(ME2Vendedor.Text) <> '' Then
    Ed2Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(ME2Vendedor.Text))
  Else
    Ed2Vendedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Me2VendedorPrepostoChange(Sender: TObject);
begin
  inherited;
   If Trim(ME2VendedorPreposto.Text) <> '' Then
  Ed2VendedorPreposto.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(ME2VendedorPreposto.Text))
  Else
    Ed2VendedorPreposto.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME3FilialChange(Sender: TObject);
begin
  inherited;
  If Trim(ME3Filial.Text) <> '' Then
    Ed3Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME3Filial.Text))
  Else
    Ed3Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME3CadastroChange(Sender: TObject);
begin
  inherited;
  If Trim(ME3Cadastro.Text) <> '' Then
   Begin
    Ed3Cadastro.text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                           'COD_CADASTRO = '+Trim(ME3Cadastro.Text));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(ME3Cadastro.Text)));
   End
  Else
    Ed3Cadastro.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME3OperacaoChange(Sender: TObject);
begin
  inherited;
  If Trim(ME3Operacao.Text) <> '' Then
    Ed3Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO',
                                           'COD_OPERACAO = '+Trim(ME3Operacao.Text))
  Else
    Ed3Operacao.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Me3ProdutoChange(Sender: TObject);
begin
  inherited;
  If Trim(ME3Produto.Text) <> '' Then
    Ed3Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(ME3Produto.Text))
  Else
    Ed3Produto.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME3FornecedorChange(Sender: TObject);
begin
  inherited;
  If Trim(ME3Fornecedor.Text) <> '' Then
   Begin
    ED3Fornecedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(ME3Fornecedor.Text));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(ME3Fornecedor.Text)));
   End
  Else
    ED3Fornecedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME3VendedorChange(Sender: TObject);
begin
  inherited;
  If Trim(Me3Vendedor.Text) <> '' Then
    Ed3Vendedor.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                    'COD_VENDEDOR = '+Me3Vendedor.text)
  Else
    Ed3Vendedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.SB37FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME37Filial.Text:=DMFilial.QFilialConsCod_Filial.Text;
      ME37FilialExit(Self);
    end;
end;

procedure TFNotaSaidaParam.SB37VendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
     FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
  begin
    ME37Vendedor.Text := DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
    ME37VendedorExit(self);
  end; 
end;

procedure TFNotaSaidaParam.ME37FilialExit(Sender: TObject);
begin
  inherited;
   if Trim(ME37Filial.text)<>'' then
    Ed37Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME37Filial.text)
  else
    Ed37Filial.Text:='Todos';
end;

procedure TFNotaSaidaParam.ME37VendedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME37Vendedor.Text) <> '' then
   Ed37Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','TB_VENDEDOR.COD_VENDEDOR = '+ME37Vendedor.Text)
  else
     Ed37Vendedor.Text := 'Todos';
end;

end.
