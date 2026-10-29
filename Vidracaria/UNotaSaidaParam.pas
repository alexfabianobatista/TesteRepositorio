unit UNotaSaidaParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask, Grids, DBGrids,
  Db, UFmCadastro, UFmVendedor, UFmFinalidade, UFmEstado, UFmOperacao,
  UFmClasse, UFmFilial, UFmProduto, UFmCultura, UFmClassificacao,
  UFmTipoCadastro, UFmCidade, UFmSerie, UFmDepartamento, UFmLote, UFmRamo,
  UFmRegiao, UFmHistorico, UFmDatas;

type
  TFNotaSaidaParam = class(TFTParametro)
    TSComissao: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ME0DataI: TMaskEdit;
    ME0DataF: TMaskEdit;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    ME1DataI: TMaskEdit;
    ME1DataF: TMaskEdit;
    RGTipo: TRadioGroup;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    ME2DataI: TMaskEdit;
    ME2DataF: TMaskEdit;
    TabSheet3: TTabSheet;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    ME3DataI: TMaskEdit;
    ME3DataF: TMaskEdit;
    TabSheet4: TTabSheet;
    ME4Dias: TMaskEdit;
    Label19: TLabel;
    TabSheet5: TTabSheet;
    GroupBox5: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    ME5DataI: TMaskEdit;
    ME5DataF: TMaskEdit;
    TabSheet6: TTabSheet;
    GroupBox6: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    ME6DataI: TMaskEdit;
    ME6DataF: TMaskEdit;
    TabSheet7: TTabSheet;
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
    Label36: TLabel;
    Label37: TLabel;
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
    GroupBox9: TGroupBox;
    Label41: TLabel;
    Label42: TLabel;
    ME9DataI: TMaskEdit;
    ME9DataF: TMaskEdit;
    TabSheet10: TTabSheet;
    GroupBox10: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    ME10DataI: TMaskEdit;
    ME10DataF: TMaskEdit;
    TabSheet11: TTabSheet;
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
    GroupBox12: TGroupBox;
    Label59: TLabel;
    Label60: TLabel;
    ME12DataI: TMaskEdit;
    ME12DataF: TMaskEdit;
    TabSheet13: TTabSheet;
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
    GroupBox14: TGroupBox;
    Label76: TLabel;
    Label77: TLabel;
    ME15DataI: TMaskEdit;
    ME15DataF: TMaskEdit;
    TabSheet16: TTabSheet;
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
    RGTipoPagto: TRadioGroup;
    TabSheet18: TTabSheet;
    GroupBox16: TGroupBox;
    Label86: TLabel;
    Label87: TLabel;
    ME18DataI: TMaskEdit;
    ME18DataF: TMaskEdit;
    TabSheet19: TTabSheet;
    ME19CodCadastro: TMaskEdit;
    GroupBox17: TGroupBox;
    ME19DtInicial: TMaskEdit;
    ME19DtFinal: TMaskEdit;
    Label88: TLabel;
    Label89: TLabel;
    Label91: TLabel;
    ME19Cadastro: TMaskEdit;
    BitBtn4: TBitBtn;
    TabSheet20: TTabSheet;
    ME20Historico: TMaskEdit;
    GroupBox18: TGroupBox;
    ME20DtInicial: TMaskEdit;
    ME20DtFinal: TMaskEdit;
    Historico: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    TabSheet21: TTabSheet;
    GroupBox19: TGroupBox;
    Label98: TLabel;
    Label99: TLabel;
    Me21DataI: TMaskEdit;
    Me21DataF: TMaskEdit;
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
    TabSheet23: TTabSheet;
    Me23Cadastro: TMaskEdit;
    Bt23Cadastro: TBitBtn;
    Ed23Cadastro: TEdit;
    Label108: TLabel;
    GroupBox22: TGroupBox;
    Label110: TLabel;
    Label111: TLabel;
    Me23DataI: TMaskEdit;
    Me23DataF: TMaskEdit;
    RG21Tipo: TRadioGroup;
    Label113: TLabel;
    GroupBox23: TGroupBox;
    Me22Desdobramento: TMaskEdit;
    TabSheet24: TTabSheet;
    Label117: TLabel;
    Me24Cadastro: TMaskEdit;
    Bt24Cadastro: TBitBtn;
    Ed24Cadastro: TEdit;
    GroupBox24: TGroupBox;
    Label118: TLabel;
    Label119: TLabel;
    Me24DataI: TMaskEdit;
    Me24DataF: TMaskEdit;
    TabSheet25: TTabSheet;
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
    GroupBox26: TGroupBox;
    Label128: TLabel;
    Label129: TLabel;
    ME26DataI: TMaskEdit;
    ME26DataF: TMaskEdit;
    TabSheet27: TTabSheet;
    GroupBox27: TGroupBox;
    Label132: TLabel;
    Label133: TLabel;
    ME27DataI: TMaskEdit;
    ME27DataF: TMaskEdit;
    RG27CompraVenda: TRadioGroup;
    TabSheet28: TTabSheet;
    ME28Percentual: TMaskEdit;
    Label139: TLabel;
    Label136: TLabel;
    Ed0Serie: TEdit;
    Label137: TLabel;
    Label138: TLabel;
    Ed10Serie: TEdit;
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
    Rg3TipoNota: TRadioGroup;
    Rg1TipoPagto: TRadioGroup;
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
    Label180: TLabel;
    ME29VendedorPreposto: TMaskEdit;
    BT29VendedorPreposto: TBitBtn;
    ED29VendedorPreposto: TEdit;
    Label175: TLabel;
    ME31VendedorPreposto: TMaskEdit;
    Bt31VendedorPreposto: TBitBtn;
    Ed31VendedorPreposto: TEdit;
    Label185: TLabel;
    Cb10Ordem: TComboBox;
    Label186: TLabel;
    Rg15Ordem: TRadioGroup;
    Label188: TLabel;
    CB21TipoProduto: TComboBox;
    Ed10Serie1: TEdit;
    Label189: TLabel;
    Ed0Serie1: TEdit;
    Label190: TLabel;
    Rg9Ordem: TRadioGroup;
    RGCondicaoPagto: TRadioGroup;
    RG10CondicaoPagto: TRadioGroup;
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
    Rg10Comissao: TRadioGroup;
    Label219: TLabel;
    Label220: TLabel;
    Me11Prazo5: TMaskEdit;
    Me11Prazo6: TMaskEdit;
    Rg3Ordem: TRadioGroup;
    Rg15Situacao: TRadioGroup;
    TabSheet37: TTabSheet;
    Label221: TLabel;
    ME37Filial: TMaskEdit;
    SB37FilialCons: TSpeedButton;
    ED37Filial: TEdit;
    GroupBox36: TGroupBox;
    Label222: TLabel;
    Label223: TLabel;
    ME37Dt_Inicial: TMaskEdit;
    ME37Dt_Final: TMaskEdit;
    Label224: TLabel;
    Me16Serie: TMaskEdit;
    Bt16Serie: TBitBtn;
    Me12Serie: TEdit;
    Label225: TLabel;
    Label227: TLabel;
    Me19ValorMaior: TMaskEdit;
    RB19ValorMaior: TRadioButton;
    Rg19TipoNota: TRadioGroup;
    Gb37TipoNotas: TGroupBox;
    Cb37Venda: TCheckBox;
    Cb37Bonificacao: TCheckBox;
    Cb37Brinde: TCheckBox;
    Cb37Troca: TCheckBox;
    TabSheet38: TTabSheet;
    ME38Vendedor: TMaskEdit;
    Bt38ConsVendedor: TSpeedButton;
    Ed38Vendedor: TEdit;
    ME38AnoBase: TMaskEdit;
    Label228: TLabel;
    Label229: TLabel;
    GroupBox37: TGroupBox;
    ME38DtInicial: TMaskEdit;
    Label230: TLabel;
    Label231: TLabel;
    ME38DtFinal: TMaskEdit;
    Rg7TipoCusto: TRadioGroup;
    Label234: TLabel;
    Me35Supervisor: TMaskEdit;
    Bt35Supervisor: TBitBtn;
    Ed35Supervisor: TEdit;
    RG35Tipo: TRadioGroup;
    TabSheet39: TTabSheet;
    GroupBox38: TGroupBox;
    Label236: TLabel;
    Label237: TLabel;
    ME39DtInicial: TMaskEdit;
    ME39DtFinal: TMaskEdit;
    Label238: TLabel;
    SpeedButton2: TSpeedButton;
    SB39Ramo: TSpeedButton;
    Label239: TLabel;
    ME39Ramo: TMaskEdit;
    Ed39Ramo: TEdit;
    GroupBox39: TGroupBox;
    ME12PrecoIni: TMaskEdit;
    ME12PrecoFim: TMaskEdit;
    Label235: TLabel;
    Label240: TLabel;
    Label245: TLabel;
    ME3Serie: TMaskEdit;
    SB3Serie: TBitBtn;
    Cb37Zero: TCheckBox;
    TabSheet40: TTabSheet;
    Label246: TLabel;
    ME40Filial: TMaskEdit;
    SB40Filial: TSpeedButton;
    Ed40Filial: TEdit;
    GroupBox40: TGroupBox;
    Label247: TLabel;
    Label248: TLabel;
    ME40DtInicial: TMaskEdit;
    ME40DtFinal: TMaskEdit;
    Label249: TLabel;
    Me3Lote: TMaskEdit;
    Bt3Lote: TBitBtn;
    Label250: TLabel;
    ME40Cadastro: TMaskEdit;
    SB40Cadastro: TBitBtn;
    Ed40Cadastro: TEdit;
    Label251: TLabel;
    ME40Cultura: TMaskEdit;
    SB40Cultura: TBitBtn;
    Ed40Cultura: TEdit;
    Me1Serie: TMaskEdit;
    Label252: TLabel;
    Bt1Serie: TBitBtn;
    Label255: TLabel;
    ME38Supervisor: TMaskEdit;
    Bt38Supervisor: TSpeedButton;
    ED38Supervisor: TEdit;
    TabSheet41: TTabSheet;
    Label256: TLabel;
    Sb41Filial: TSpeedButton;
    Label257: TLabel;
    Label258: TLabel;
    Me41Filial: TMaskEdit;
    Ed41Filial: TEdit;
    GroupBox41: TGroupBox;
    Label259: TLabel;
    Label260: TLabel;
    Me41DtInicial: TMaskEdit;
    Me41DtFinal: TMaskEdit;
    Me41Cadastro: TMaskEdit;
    Sb41Cadastro: TBitBtn;
    Ed41Cadastro: TEdit;
    Me41Departamento: TMaskEdit;
    Sb41Departamento: TBitBtn;
    Ed41Departamento: TEdit;
    Label261: TLabel;
    ME38Filial: TMaskEdit;
    SpeedButton3: TSpeedButton;
    ED38Filial: TEdit;
    Sb40Vendedor: TSpeedButton;
    Label263: TLabel;
    Me40Vendedor: TMaskEdit;
    Ed40Vendedor: TEdit;
    Label265: TLabel;
    Cb4Ordem: TComboBox;
    Label266: TLabel;
    Bt1Classe: TBitBtn;
    Me1Classe: TMaskEdit;
    TabSheet42: TTabSheet;
    ME42Filial: TMaskEdit;
    ME42Vendedor: TMaskEdit;
    SB42Filial: TSpeedButton;
    Bt42ConsVendedor: TSpeedButton;
    Ed42Filial: TEdit;
    Ed42Vendedor: TEdit;
    Label268: TLabel;
    Label269: TLabel;
    GroupBox42: TGroupBox;
    ME42DtInicial: TMaskEdit;
    ME42DtFinal: TMaskEdit;
    Label270: TLabel;
    Label271: TLabel;
    RG42Pagto: TRadioGroup;
    TabSheet43: TTabSheet;
    Label272: TLabel;
    Label273: TLabel;
    Label274: TLabel;
    Label275: TLabel;
    Label276: TLabel;
    Label277: TLabel;
    Label278: TLabel;
    Label279: TLabel;
    SB43Estado: TSpeedButton;
    GroupBox43: TGroupBox;
    Label280: TLabel;
    Label281: TLabel;
    ME43DataI: TMaskEdit;
    ME43DataF: TMaskEdit;
    ME43Filial: TMaskEdit;
    Bt43ConsFilial: TBitBtn;
    Ed43Filial: TEdit;
    ME43Vendedor: TMaskEdit;
    Bt43ConsVendedor: TBitBtn;
    Ed43Vendedor: TEdit;
    Me43Operacao: TMaskEdit;
    Bt43Operacao: TBitBtn;
    Ed43Operacao: TEdit;
    Me43Cadastro: TMaskEdit;
    Bt43ConsCadastro: TBitBtn;
    Ed43Cadastro: TEdit;
    Me43Serie: TEdit;
    Me43Departamento: TMaskEdit;
    Bt43Departamento: TBitBtn;
    Ed43Departamento: TEdit;
    Me43Supervisor: TMaskEdit;
    Bt43Supervisor: TBitBtn;
    Ed43Supervisor: TEdit;
    GroupBox44: TGroupBox;
    Label282: TLabel;
    Label283: TLabel;
    ME43PrecoIni: TMaskEdit;
    ME43PrecoFim: TMaskEdit;
    Me43Estado: TMaskEdit;
    Ed43Estado: TEdit;
    Label286: TLabel;
    Me36Supervisor: TMaskEdit;
    Bt36Supervisor: TBitBtn;
    Ed36Supervisor: TEdit;
    Rg10Opcao: TRadioGroup;
    Label267: TLabel;
    Label287: TLabel;
    Me3Classe: TMaskEdit;
    Bt3ConsClasse: TBitBtn;
    Ed3Classe: TEdit;
    Me3SubClasse: TMaskEdit;
    ME39Supervisor: TMaskEdit;
    SB39Supervisor: TSpeedButton;
    Ed39Supervisor: TEdit;
    Label290: TLabel;
    Ed42Supervisor: TEdit;
    Label291: TLabel;
    SB42Supervisor: TSpeedButton;
    ME42Supervisor: TMaskEdit;
    Label292: TLabel;
    Label293: TLabel;
    Me5Classe: TMaskEdit;
    Bt5ConsClasse: TBitBtn;
    Ed5Classe: TEdit;
    Me5SubClasse: TMaskEdit;
    TabSheet44: TTabSheet;
    Label295: TLabel;
    ME44Filial: TMaskEdit;
    Bt44Filial: TBitBtn;
    Ed44Filial: TEdit;
    Label296: TLabel;
    ME44Vendedor: TMaskEdit;
    Bt44Vendedor: TBitBtn;
    Ed44Vendedor: TEdit;
    Label297: TLabel;
    ME44Operacao: TMaskEdit;
    Bt44Operacao: TBitBtn;
    Ed44Operacao: TEdit;
    Label298: TLabel;
    ME44Cadastro: TMaskEdit;
    Bt44Cadastro: TBitBtn;
    Ed44Cadastro: TEdit;
    GB44Periodo: TGroupBox;
    Label299: TLabel;
    Label300: TLabel;
    Me44DtInicial: TMaskEdit;
    ME44DtFinal: TMaskEdit;
    Label301: TLabel;
    ME44Cultura: TMaskEdit;
    Bt44Cultura: TBitBtn;
    Ed44Cultura: TEdit;
    Label303: TLabel;
    ME44Produto: TMaskEdit;
    Bt44Produto: TBitBtn;
    Ed44Produto: TEdit;
    RG44TipoPagto: TRadioGroup;
    Rg44TipoNota: TRadioGroup;
    Label304: TLabel;
    ME44Fornecedor: TMaskEdit;
    Bt44Fornecedor: TBitBtn;
    Ed44Fornecedor: TEdit;
    Label305: TLabel;
    ME44Classe: TMaskEdit;
    Me44Subclasse: TMaskEdit;
    Label306: TLabel;
    Bt44Classe: TBitBtn;
    Ed44Classe: TEdit;
    Label302: TLabel;
    Me44Classificacao: TMaskEdit;
    Bt44Classificacao: TBitBtn;
    Ed44Classificacao: TEdit;
    Label307: TLabel;
    Cb1Ordem: TComboBox;
    Label308: TLabel;
    ME9Classe: TMaskEdit;
    ME9Subclasse: TMaskEdit;
    Label309: TLabel;
    Bt9Classe: TBitBtn;
    Ed9Classe: TEdit;
    ME9numclasse: TMaskEdit;
    Label310: TLabel;
    Me21Serie: TEdit;
    TabSheet45: TTabSheet;
    GroupBox45: TGroupBox;
    Label313: TLabel;
    Label314: TLabel;
    Me45DtInicio: TMaskEdit;
    Me45DtFim: TMaskEdit;
    GroupBox46: TGroupBox;
    Label315: TLabel;
    Label316: TLabel;
    Me45NotaInicio: TMaskEdit;
    Me45NotaFim: TMaskEdit;
    RG25Valor: TRadioGroup;
    Label317: TLabel;
    Me38CodEstado: TMaskEdit;
    Sb38ConsEstado: TSpeedButton;
    Ed38DescEstado: TEdit;
    Me31Ramo: TMaskEdit;
    Bt31Ramo: TBitBtn;
    Ed31DescRamo: TEdit;
    Label320: TLabel;
    Me34Ramo: TMaskEdit;
    Bt34Ramo: TBitBtn;
    Ed34DescRamo: TEdit;
    Label321: TLabel;
    Rg29Quebra: TRadioGroup;
    Label323: TLabel;
    Me29Operacao: TMaskEdit;
    Bt29Operacao: TBitBtn;
    Ed29Operacao: TEdit;
    FmFilial16: TFmFilial;
    FmCadastro16: TFmCadastro;
    FmVendedorPreposto16: TFmVendedor;
    FmSupervisor16: TFmVendedor;
    FmFinalidade16: TFmFinalidade;
    FmEstado16: TFmEstado;
    FmFilial2: TFmFilial;
    FmVendedor2: TFmVendedor;
    FmVendedorPreposto2: TFmVendedor;
    FmOperacao2: TFmOperacao;
    FmProduto2: TFmProduto;
    FmFornecedor2: TFmCadastro;
    FmCadastro2: TFmCadastro;
    FmCultura2: TFmCultura;
    FmEstado2: TFmEstado;
    FmFilial5: TFmFilial;
    FmProduto5: TFmProduto;
    FmClassificacao5: TFmClassificacao;
    FmVendedor5: TFmVendedor;
    FmClasse5: TFmClasse;
    FmTipoCadastro5: TFmTipoCadastro;
    FmCidade5: TFmCidade;
    FmSupervisor5: TFmVendedor;
    FmFilial6: TFmFilial;
    FmVendedor6: TFmVendedor;
    FmOperacao6: TFmOperacao;
    FmVendedorPreposto6: TFmVendedor;
    FmFilial8: TFmFilial;
    FmOperacao8: TFmOperacao;
    FmVendedor8: TFmVendedor;
    FmFabricante8: TFmCadastro;
    FmFilial9: TFmFilial;
    FmVendedor9: TFmVendedor;
    FmVendedorPreposto9: TFmVendedor;
    FmFilial7: TFmFilial;
    FmSerie7: TFmSerie;
    FmFilial4: TFmFilial;
    FmCadastro4: TFmCadastro;
    FmOperacao4: TFmOperacao;
    FmProduto4: TFmProduto;
    FmFornecedor4: TFmCadastro;
    FmVendedor4: TFmVendedor;
    FmCultura4: TFmCultura;
    FmDepartamento4: TFmDepartamento;
    FmFilial10: TFmFilial;
    FmProduto10: TFmProduto;
    FmLote10: TFmLote;
    FmOperacao10: TFmOperacao;
    Fm2Operacao10: TFmOperacao;
    FmFilial12: TFmFilial;
    FmFilial3: TFmFilial;
    FmVendedor3: TFmVendedor;
    FmVendedorPreposto3: TFmVendedor;
    FmFilial11: TFmFilial;
    FmVendedor11: TFmVendedor;
    FmVendedorPreposto11: TFmVendedor;
    FmFilial1: TFmFilial;
    FmVendedor1: TFmVendedor;
    FmVendedorPreposto1: TFmVendedor;
    FmSupervisor1: TFmVendedor;
    FmFilial13: TFmFilial;
    FmVendedor13: TFmVendedor;
    FmOperacao13: TFmOperacao;
    FmDepartamento13: TFmDepartamento;
    FmSupervisor13: TFmVendedor;
    FmEstado13: TFmEstado;
    FmClasse13: TFmClasse;
    FmRamo13: TFmRamo;
    FmFilial15: TFmFilial;
    FmVendedor15: TFmVendedor;
    FmVendedorPreposto15: TFmVendedor;
    FmFilial19: TFmFilial;
    FmVendedor19: TFmVendedor;
    FmVendedorPreposto19: TFmVendedor;
    FmSupervisor19: TFmVendedor;
    FmOperacao19: TFmOperacao;
    FmFilial26: TFmFilial;
    FmVendedor26: TFmVendedor;
    FmVendedorPreposto26: TFmVendedor;
    FmVendedor27: TFmVendedor;
    FmVendedorPreposto27: TFmVendedor;
    FmRegiao27: TFmRegiao;
    FmProduto27: TFmProduto;
    FmFilial14: TFmFilial;
    FmFilial17: TFmFilial;
    FmVendedor17: TFmVendedor;
    FmHistorico17: TFmHistorico;
    FmDepartamento17: TFmDepartamento;
    FmClassificacao17: TFmClassificacao;
    FmFilial20: TFmFilial;
    FmFilial21: TFmFilial;
    FmVendedor21: TFmVendedor;
    FmVendedorPreposto21: TFmVendedor;
    FmFilial22: TFmFilial;
    FmVendedor22: TFmVendedor;
    FmVendedorPreposto22: TFmVendedor;
    FmTipoCadastro22: TFmTipoCadastro;
    FmSupervisor22: TFmVendedor;
    FmDepartamento22: TFmDepartamento;
    FmFilial25: TFmFilial;
    FmFilial24: TFmFilial;
    FmVendedor24: TFmVendedor;
    FmOperacao24: TFmOperacao;
    FmProduto24: TFmProduto;
    FmRamo24: TFmRamo;
    FmFilial28: TFmFilial;
    FmClasseI28: TFmClasse;
    FmClasseF28: TFmClasse;
    FmProduto28: TFmProduto;
    FmVendedor28: TFmVendedor;
    FmCadastro17: TFmCadastro;
    FmDepartamento1: TFmDepartamento;
    Rg3TipoPessoa: TRadioGroup;
    MeTipoQuebra: TRadioGroup;
    Label58: TLabel;
    Me3CadastroParceiro: TMaskEdit;
    Bt3CadastroParceiro: TBitBtn;
    FmEstado5: TFmEstado;
    Me42Produto: TMaskEdit;
    Label3: TLabel;
    SB42Produto: TSpeedButton;
    Ed42Produto: TEdit;
    FmProduto17: TFmProduto;
    TabSheet46: TTabSheet;
    FmFilial47: TFmFilial;
    FmCadastro47: TFmCadastro;
    FmProduto47: TFmProduto;
    FmDatas47: TFmDatas;
    RgICMS47: TRadioGroup;
    Label4: TLabel;
    Me47Operacao: TMaskEdit;
    Bt47Operacao: TBitBtn;
    TabSheet47: TTabSheet;
    Label5: TLabel;
    Label8: TLabel;
    GroupBox47: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    ME48DataI: TMaskEdit;
    ME48DataF: TMaskEdit;
    ME48Classe: TMaskEdit;
    Bt48ConsClasse: TBitBtn;
    Ed48Classe: TEdit;
    ME48SubClasse: TMaskEdit;
    FmFilial48: TFmFilial;
    FmVendedor48: TFmVendedor;
    TabSheet48: TTabSheet;
    GroupBox49: TGroupBox;
    Label9: TLabel;
    Label14: TLabel;
    Me49Data_I: TMaskEdit;
    Me49Data_F: TMaskEdit;
    Label17: TLabel;
    CB0TipoProduto: TComboBox;
    Label18: TLabel;
    TabSheet49: TTabSheet;
    FmFilial50: TFmFilial;
    FmCadastro50: TFmCadastro;
    FmProduto50: TFmProduto;
    FmLote50: TFmLote;
    GroupBox48: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Me50DtI: TMaskEdit;
    Me50DtF: TMaskEdit;
    Label22: TLabel;
    CB50TipoFutura: TComboBox;
    cbOrdem: TComboBox;
    Label23: TLabel;
    Label26: TLabel;
    Me3Armazem: TMaskEdit;
    Bt3Armazem: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure Bt7ConsClasseClick(Sender: TObject);
    procedure ME7ClasseExit(Sender: TObject);
    procedure ME7SubClasseExit(Sender: TObject);
    procedure Bt8SubClasseClick(Sender: TObject);
    procedure ME8ClasseExit(Sender: TObject);
    procedure ME8SubClasseExit(Sender: TObject);
    procedure ME13ClasseIExit(Sender: TObject);
    procedure ME13SubClasseIExit(Sender: TObject);
    procedure Bt13ConsClasseIClick(Sender: TObject);
    procedure ME13ClasseFExit(Sender: TObject);
    procedure ME13SubClasseFExit(Sender: TObject);
    procedure Bt13ConsClasseFClick(Sender: TObject);
    procedure ME14ClasseExit(Sender: TObject);
    procedure ME14SubClasseExit(Sender: TObject);
    procedure Bt14ConsClasseClick(Sender: TObject);
    procedure Bt17ConsLoteClick(Sender: TObject);
    procedure ME17LoteExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ME19CodCadastroExit(Sender: TObject);
    procedure ME7FilialChange(Sender: TObject);
    procedure BT22ConsFilialClick(Sender: TObject);
    procedure Me23CadastroExit(Sender: TObject);
    procedure Bt23CadastroClick(Sender: TObject);
    procedure Me24CadastroExit(Sender: TObject);
    procedure Bt24CadastroClick(Sender: TObject);
    procedure RB19TodosClick(Sender: TObject);
    procedure Me19ValorChange(Sender: TObject);
    procedure ME26FilialExit(Sender: TObject);
    procedure Btn26FilialClick(Sender: TObject);
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
    procedure BtnFilialConsClick(Sender: TObject);
    procedure BtnVendedorConsClick(Sender: TObject);
    procedure BtnRegiaoConsClick(Sender: TObject);
    procedure BtnFilialCons31Click(Sender: TObject);
    procedure BtnVendedorCons31Click(Sender: TObject);
    procedure TabSheet33Show(Sender: TObject);
    procedure BtnClasseCons31Click(Sender: TObject);
    procedure MECodClasse31Exit(Sender: TObject);
    procedure Me12CadastroExit(Sender: TObject);
    procedure Bt12ConsCadastroClick(Sender: TObject);
    procedure BT29VendedorPrepostoClick(Sender: TObject);
    procedure ME29VendedorPrepostoExit(Sender: TObject);
    procedure Bt31VendedorPrepostoClick(Sender: TObject);
    procedure ME31VendedorPrepostoExit(Sender: TObject);
    procedure BT34FilialClick(Sender: TObject);
    procedure BT34VendedorClick(Sender: TObject);
    procedure ME34FilialExit(Sender: TObject);
    procedure Bt31TipoCadastroClick(Sender: TObject);
    procedure ME31TipoCadastroExit(Sender: TObject);
    procedure ME34CodFilialExit(Sender: TObject);
    procedure Btn34FilialConsClick(Sender: TObject);
    procedure ME34CodVendedorExit(Sender: TObject);
    procedure Btn34VendedorConsClick(Sender: TObject);
    procedure ME34CodClasseExit(Sender: TObject);
    procedure Btn34ClasseConsClick(Sender: TObject);
    procedure ME35FilialExit(Sender: TObject);
    procedure ME35VendedorExit(Sender: TObject);
    procedure ME35ClasseExit(Sender: TObject);
    procedure ME36FilialExit(Sender: TObject);
    procedure SB36FilialClick(Sender: TObject);
    procedure ME37FilialExit(Sender: TObject);
    procedure SB37FilialConsClick(Sender: TObject);
    procedure Bt16SerieClick(Sender: TObject);
    procedure RB19ValorMaiorClick(Sender: TObject);
    procedure Me19ValorMaiorChange(Sender: TObject);
    procedure Bt38ConsVendedorClick(Sender: TObject);
    procedure ME38VendedorExit(Sender: TObject);
    procedure Bt35SupervisorClick(Sender: TObject);
    procedure Me35SupervisorExit(Sender: TObject);
    procedure BT35FilialClick(Sender: TObject);
    procedure BT35VendedorClick(Sender: TObject);
    procedure BT35ClasseClick(Sender: TObject);
    procedure SB39RamoClick(Sender: TObject);
    procedure ME39RamoExit(Sender: TObject);
    procedure Me22FilialExit(Sender: TObject);
    procedure MEFilialCodExit(Sender: TObject);
    procedure MEVendedorCodExit(Sender: TObject);
    procedure MERegiaoCodExit(Sender: TObject);
    procedure MECodFilial31Exit(Sender: TObject);
    procedure MECodVendedor31Exit(Sender: TObject);
    procedure SB3SerieClick(Sender: TObject);
    procedure SB40FilialClick(Sender: TObject);
    procedure ME40FilialExit(Sender: TObject);
    procedure Bt3LoteClick(Sender: TObject);
    procedure ME40CadastroExit(Sender: TObject);
    procedure SB40CadastroClick(Sender: TObject);
    procedure SB40CulturaClick(Sender: TObject);
    procedure ME40CulturaExit(Sender: TObject);
    procedure Bt1SerieClick(Sender: TObject);
    procedure ME38SupervisorExit(Sender: TObject);
    procedure Bt38SupervisorClick(Sender: TObject);
    procedure Me41FilialExit(Sender: TObject);
    procedure Sb41FilialClick(Sender: TObject);
    procedure Me41CadastroExit(Sender: TObject);
    procedure Sb41CadastroClick(Sender: TObject);
    procedure Me41DepartamentoExit(Sender: TObject);
    procedure Sb41DepartamentoClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ME38FilialExit(Sender: TObject);
    procedure Me40VendedorExit(Sender: TObject);
    procedure Sb40VendedorClick(Sender: TObject);
    procedure Bt1ClasseClick(Sender: TObject);
    procedure Me3ClasseExit(Sender: TObject);
    procedure SB42FilialClick(Sender: TObject);
    procedure Bt42ConsVendedorClick(Sender: TObject);
    procedure ME42VendedorExit(Sender: TObject);
    procedure ME42FilialExit(Sender: TObject);
    procedure ME43FilialExit(Sender: TObject);
    procedure ME43VendedorExit(Sender: TObject);
    procedure Me43OperacaoExit(Sender: TObject);
    procedure Me43CadastroExit(Sender: TObject);
    procedure Me43DepartamentoExit(Sender: TObject);
    procedure Me43SupervisorExit(Sender: TObject);
    procedure Me43EstadoExit(Sender: TObject);
    procedure Bt43ConsFilialClick(Sender: TObject);
    procedure Bt43ConsVendedorClick(Sender: TObject);
    procedure Bt43OperacaoClick(Sender: TObject);
    procedure Bt43ConsCadastroClick(Sender: TObject);
    procedure Bt43DepartamentoClick(Sender: TObject);
    procedure Bt43SupervisorClick(Sender: TObject);
    procedure SB43EstadoClick(Sender: TObject);
    procedure Me36SupervisorExit(Sender: TObject);
    procedure Bt36SupervisorClick(Sender: TObject);
    procedure Me3SubClasseExit(Sender: TObject);
    procedure Bt3ConsClasseClick(Sender: TObject);
    procedure SB39SupervisorClick(Sender: TObject);
    procedure ME39SupervisorExit(Sender: TObject);
    procedure SB42SupervisorClick(Sender: TObject);
    procedure ME42SupervisorExit(Sender: TObject);
    procedure Bt5ConsClasseClick(Sender: TObject);
    procedure Me5SubClasseExit(Sender: TObject);
    procedure Me5ClasseExit(Sender: TObject);
    procedure Bt44FilialClick(Sender: TObject);
    procedure ME44FilialExit(Sender: TObject);
    procedure Bt44CadastroClick(Sender: TObject);
    procedure ME44CadastroExit(Sender: TObject);
    procedure Bt44VendedorClick(Sender: TObject);
    procedure ME44VendedorExit(Sender: TObject);
    procedure Bt44OperacaoClick(Sender: TObject);
    procedure ME44OperacaoExit(Sender: TObject);
    procedure Bt44CulturaClick(Sender: TObject);
    procedure ME44CulturaExit(Sender: TObject);
    procedure Bt44ProdutoClick(Sender: TObject);
    procedure ME44ProdutoExit(Sender: TObject);
    procedure Bt44FornecedorClick(Sender: TObject);
    procedure ME44FornecedorExit(Sender: TObject);
    procedure ME44ClasseExit(Sender: TObject);
    procedure Me44SubclasseExit(Sender: TObject);
    procedure Bt44ClasseClick(Sender: TObject);
    procedure Bt44ClassificacaoClick(Sender: TObject);
    procedure Me44ClassificacaoExit(Sender: TObject);
    procedure Bt9ClasseClick(Sender: TObject);
    procedure ME9SubclasseExit(Sender: TObject);
    procedure ME9ClasseExit(Sender: TObject);
    procedure Me38CodEstadoExit(Sender: TObject);
    procedure Sb38ConsEstadoClick(Sender: TObject);
    procedure Me31RamoExit(Sender: TObject);
    procedure Bt31RamoClick(Sender: TObject);
    procedure Me34RamoExit(Sender: TObject);
    procedure Bt34RamoClick(Sender: TObject);
    procedure Me29OperacaoExit(Sender: TObject);
    procedure Bt29OperacaoClick(Sender: TObject);
    procedure FmFilial12BtFilialClick(Sender: TObject);
    procedure FmDepartamento1BtDepartamentoClick(Sender: TObject);
    procedure Bt3CadastroParceiroClick(Sender: TObject);
    procedure Me42ProdutoExit(Sender: TObject);
    procedure SB42ProdutoClick(Sender: TObject);
    procedure TabSheet46Show(Sender: TObject);
    procedure Bt47OperacaoClick(Sender: TObject);
    procedure Bt3ArmazemClick(Sender: TObject);
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
     URegiaoCons       ,UNotaSaida_cl,UUsuario_cl,
     UDepartamentoCons, UDepartamento_cl, UTipoCadastroCons, UTipoCadastro_cl,
     UCidade_cl, UCidadeCons, UPedidoParam, URamoCons, URamo_cl,
  UCulturaCons, UCultura_cl, UEstadoCons, UEstado_cl, UFinalidadeCons,
  UFinalidade_cl;

{$R *.DFM}

procedure TFNotaSaidaParam.FormCreate(Sender: TObject);
begin
  inherited;
  If FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
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

procedure TFNotaSaidaParam.Bt8SubClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    ME8Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME8SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME8SubClasseExit(Self); 
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
    ME13ClasseI.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME13SubClasseI.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME13SubClasseIExit(Self); 
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
    ME13ClasseF.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME13SubClasseF.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME13SubClasseFExit(Self);
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

procedure TFNotaSaidaParam.Bt14ConsClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    ME14Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME14SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME14SubClasseExit(Self);
end;

procedure TFNotaSaidaParam.Bt17ConsLoteClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOk then
    ME17Lote.Text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
    ME17LoteExit(Self);
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

procedure TFNotaSaidaParam.FormActivate(Sender: TObject);
begin
  inherited;
{  ME0Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
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
}
  CB7Ordem.ItemIndex:=0;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' Then
  Begin
    RGPreview.ItemIndex := 1;
    ME42DtInicial.Text := DateToStr(Date);
    ME42DtFinal.Text := DateToStr(Date);
    RG42Pagto.ItemIndex := 1;
  End;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then //Pedido de Vilson Possamai
  Begin
    FMFilial4.MeFilial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
    Me3CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
    Bt3CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  End;
end;

procedure TFNotaSaidaParam.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    ME19CodCadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME19CodCadastroExit(Self);   
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

procedure TFNotaSaidaParam.ME7FilialChange(Sender: TObject);
begin
  inherited;
  FmFilial8.MeFilialExit(Self);
end;

procedure TFNotaSaidaParam.BT22ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME22Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME22FilialExit(self);
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
    ME23Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME23CadastroExit(Self);
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
    ME24Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME24CadastroExit(Self);
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

procedure TFNotaSaidaParam.Btn26FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME26Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME26FilialExit(Self); 
end;

procedure TFNotaSaidaParam.Btn29FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME29Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME29FilialExit(Self);
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
    ME29ClasseI.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME29ClasseIExit(self);
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
    ME29Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME29VendedorExit(Self);
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
   ME29SubClasse.Text := DMClasse.QClasseConsNum_Classe.Text;
   ME29SubClasseExit(self);
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
    ME29Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME29ProdutoExit(Self);
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

procedure TFNotaSaidaParam.BtnFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
     MEFilialCod.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
     MEFilialCodExit(self);
end;

procedure TFNotaSaidaParam.BtnVendedorConsClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
     FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
      MEVendedorCod.Text := DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
      MEVendedorCodExit(self);
end;

procedure TFNotaSaidaParam.BtnRegiaoConsClick(Sender: TObject);
begin
  inherited;
  if FRegiaoCons = nil then
     FRegiaoCons := TFRegiaoCons.Create(Application);
  if FRegiaoCons.ShowModal = mrOk then
      MERegiaoCod.Text := DMRegiao.QRegiaoConsCOD_REGIAO.Text;
      MERegiaoCodExit(self);
end;

procedure TFNotaSaidaParam.BtnFilialCons31Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    MECodFilial31.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
    MECodFilial31Exit(self);
end;

procedure TFNotaSaidaParam.BtnVendedorCons31Click(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
     FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
     MECodVendedor31.Text := DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
     MECodVendedor31Exit(self);
end;

procedure TFNotaSaidaParam.TabSheet33Show(Sender: TObject);
begin
  inherited;
  MEDT_Recebimento_I.text := DateToStr(date-30);
  MEDT_Recebimento_F.text := DateToStr(date);
end;

procedure TFNotaSaidaParam.BtnClasseCons31Click(Sender: TObject);
begin
  inherited;
  if FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = mrOk then
     MeCodClasse31.Text := DMClasse.QClasseConsCod_Classe.Text;
     MECodClasse31Exit(self);
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
    ME12Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME12CadastroExit(Self);
end;

procedure TFNotaSaidaParam.BT29VendedorPrepostoClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    ME29VendedorPreposto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME29VendedorPrepostoExit(Self);
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

procedure TFNotaSaidaParam.Bt31VendedorPrepostoClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    ME31VendedorPreposto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME31VendedorPrepostoExit(self);
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

procedure TFNotaSaidaParam.Bt31TipoCadastroClick(Sender: TObject);
begin
  inherited;
  If FTipoCadastroCons = Nil then
    FTipoCadastroCons := TFTipoCadastroCons.Create(Application);
  If FTipoCadastroCons.ShowModal = mrOk then
    ME31TipoCadastro.Text := DMTipoCadastro.QTipoCadastroConsCOD_TIPO_CADASTRO.Text;
    ME31TipoCadastroExit(self);
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
    ME34CodFilialExit(self);
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
    ME36Filial.Text:=DMFilial.QFilialConsCod_Filial.Text;
    ME36FilialExit(Self);  
end;

procedure TFNotaSaidaParam.ME37FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME37Filial.text)<>'' then
    Ed37Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME37Filial.text)
  else
    Ed37Filial.Text:='Todos';
end;

procedure TFNotaSaidaParam.SB37FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME37Filial.Text:=DMFilial.QFilialConsCod_Filial.Text;
    ME37FilialExit(Self);
end;

procedure TFNotaSaidaParam.Bt16SerieClick(Sender: TObject);
begin
  inherited;
  If FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
  If FSerieCons.ShowModal = mrOk then
    Me16Serie.Text := DMSerie.QSerieConsCod_Serie.Text;
end;

procedure TFNotaSaidaParam.RB19ValorMaiorClick(Sender: TObject);
begin
  inherited;
  If RB19ValorMaior.Checked then
     ME19ValorMaior.Clear;
end;

procedure TFNotaSaidaParam.Me19ValorMaiorChange(Sender: TObject);
begin
  inherited;
  if Trim(ME19ValorMaior.Text) <> '' Then
     RB19ValorMaior.Checked  := False;
end;

procedure TFNotaSaidaParam.Bt38ConsVendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    ME38Vendedor.Text:=DMVendedor.QVendedorConsCod_Vendedor.Text;
  ME38VendedorExit(Self);
end;

procedure TFNotaSaidaParam.ME38VendedorExit(Sender: TObject);
begin
  inherited;
   if Trim(ME38Vendedor.text)<>'' then
    Ed38Vendedor.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+ME38Vendedor.text)
   else
    Ed38Vendedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt35SupervisorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    Me35Supervisor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
  Me35SupervisorExit(Self);
end;

procedure TFNotaSaidaParam.Me35SupervisorExit(Sender: TObject);
begin
  inherited;
  If Trim(Me35Supervisor.Text) <> '' Then
    Ed35Supervisor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(Me35Supervisor.Text))
   Else
    Ed35Supervisor.Text := 'Todos';

end;

procedure TFNotaSaidaParam.BT35FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    Me35Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me35FilialExit(Self); 
end;

procedure TFNotaSaidaParam.BT35VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    Me35Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    Me35VendedorExit(Self); 
end;

procedure TFNotaSaidaParam.BT35ClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Me35Classe.Text := DMClasse.QClasseConsCod_Classe.Text;
    Me35ClasseExit(Self); 
end;

procedure TFNotaSaidaParam.SB39RamoClick(Sender: TObject);
begin
  inherited;
  if FRamoCons = Nil then
    FRamoCons := TFRamoCons.Create(Application);
  if FRamoCons.ShowModal = mrOk then
    ME39Ramo.Text:=DMRamo.QRamoConsCod_Ramo.Text;
    ME39RamoExit(Self);   
end;

procedure TFNotaSaidaParam.ME39RamoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME39Ramo.text)<>'' then
    Ed39Ramo.text:=DMOracle.BuscaNome('SELECT DESC_RAMO FROM TB_RAMO','COD_RAMO = '+ME39Ramo.text)
  else
    Ed39Ramo.Text:='Todos';
end;

procedure TFNotaSaidaParam.Me22FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME22Filial.Text) <> '' Then
    Ed22Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME22Filial.Text))
  Else
    Ed22Filial.Text := 'Todos';
end;

procedure TFNotaSaidaParam.MEFilialCodExit(Sender: TObject);
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

procedure TFNotaSaidaParam.MEVendedorCodExit(Sender: TObject);
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

procedure TFNotaSaidaParam.MERegiaoCodExit(Sender: TObject);
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

procedure TFNotaSaidaParam.MECodFilial31Exit(Sender: TObject);
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

procedure TFNotaSaidaParam.MECodVendedor31Exit(Sender: TObject);
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

procedure TFNotaSaidaParam.SB3SerieClick(Sender: TObject);
begin
  inherited;
  If FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
  If FSerieCons.ShowModal = mrOk then
    ME3Serie.Text := DMSerie.QSerieConsCod_Serie.Text;
end;

procedure TFNotaSaidaParam.SB40FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
     ME40Filial.Text:=DMFilial.QFilialConsCod_Filial.Text;
  ME40FilialExit(Self);
end;

procedure TFNotaSaidaParam.ME40FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME40Filial.text)<>'' then
    Ed40Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME40Filial.text)
  else
    Ed40Filial.Text:='Todos';
end;

procedure TFNotaSaidaParam.Bt3LoteClick(Sender: TObject);
begin
  inherited;
  if FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  if FTipoLoteCons.ShowModal = mrOk then
    Me3Lote.Text:=DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
end;

procedure TFNotaSaidaParam.ME40CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME40Cadastro.Text) <> '' Then
    Ed40Cadastro.text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                          'COD_CADASTRO = '+Trim(ME40Cadastro.Text))
  Else
    Ed40Cadastro.Text := 'Todos';
end;

procedure TFNotaSaidaParam.SB40CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME40Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME40CadastroExit(Self);
  End;
end;

procedure TFNotaSaidaParam.SB40CulturaClick(Sender: TObject);
begin
  inherited;
  If FCulturaCons = Nil then
    FCulturaCons := TFCulturaCons.Create(Application);
  If FCulturaCons.ShowModal = mrOk then
  Begin
    Me40Cultura.Text := DMCultura.QCulturaConsCOD_CULTURA.Text;
    ME40CulturaExit(self);
  End;
end;

procedure TFNotaSaidaParam.ME40CulturaExit(Sender: TObject);
begin
  inherited;
  If Trim(Me40Cultura.Text) <> '' Then
    Ed40Cultura.text:=DMOracle.BuscaNome('SELECT DESC_CULTURA FROM TB_CULTURA',
                    'COD_CULTURA = '+Me40Cultura.text)
  Else
    Ed40Cultura.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt1SerieClick(Sender: TObject);
begin
  inherited;
  If FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
  If FSerieCons.ShowModal = mrOk then
    Me1Serie.Text := DMSerie.QSerieConsCod_Serie.Text;

end;

procedure TFNotaSaidaParam.ME38SupervisorExit(Sender: TObject);
begin
  inherited;
   if Trim(ME38Supervisor.text)<>'' then
    Ed38SuperVisor.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+ME38Supervisor.text)
   else
    Ed38SuperVisor.text:='Todos';
end;

procedure TFNotaSaidaParam.Bt38SupervisorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    ME38Supervisor.Text:=DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME38SupervisorExit(Self);
end;

procedure TFNotaSaidaParam.Me41FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me41Filial.text)<>'' then
    Ed41Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Me41Filial.text)
  else
    Ed41Filial.Text:='Todos';

end;

procedure TFNotaSaidaParam.Sb41FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    Me41Filial.Text:=DMFilial.QFilialConsCod_Filial.Text;
    Me41FilialExit(Self);
end;

procedure TFNotaSaidaParam.Me41CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(Me41Cadastro.Text) <> '' Then
    Ed41Cadastro.text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                          'COD_CADASTRO = '+Trim(Me41Cadastro.Text))
  Else
    Ed41Cadastro.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Sb41CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
   Begin
    ME41Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME41CadastroExit(Self);
   End;
end;

procedure TFNotaSaidaParam.Me41DepartamentoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me41Departamento.Text) <> '' Then
    Ed41Departamento.text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO',
                                          'COD_DEPARTAMENTO = '+Trim(Me41Departamento.Text))
  Else
    Ed41Departamento.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Sb41DepartamentoClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk then
   Begin
    ME41Departamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    ME41DepartamentoExit(Self);
   End;

end;

procedure TFNotaSaidaParam.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME38Filial.Text:=DMFilial.QFilialConsCod_Filial.Text;
    ME38FilialExit(Self);
end;

procedure TFNotaSaidaParam.ME38FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME38Filial.text)<>'' then
    Ed38Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME38Filial.text)
  else
    Ed38Filial.Text:='Todas';
end;

procedure TFNotaSaidaParam.Me40VendedorExit(Sender: TObject);
begin
  inherited;
   if Trim(Me40Vendedor.text)<>'' then
    Ed40Vendedor.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Me40Vendedor.text)
   else
    Ed40Vendedor.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Sb40VendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    Me40Vendedor.Text:=DMVendedor.QVendedorConsCod_Vendedor.Text;
  Me40VendedorExit(Self);

end;

procedure TFNotaSaidaParam.Bt1ClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Me1Classe.Text := DMClasse.QClasseConsCod_Classe.Text;
end;

procedure TFNotaSaidaParam.Me3ClasseExit(Sender: TObject);
begin
  inherited;
  Me3SubClasseExit(Self);
end;

procedure TFNotaSaidaParam.SB42FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    Me42Filial.Text:=DMFilial.QFilialConsCod_Filial.Text;
    Me42FilialExit(Self); 
end;

procedure TFNotaSaidaParam.Bt42ConsVendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    Me42Vendedor.Text:=DMVendedor.QVendedorConsCod_Vendedor.Text;
    Me42VendedorExit(Self);
end;

procedure TFNotaSaidaParam.ME42VendedorExit(Sender: TObject);
begin
  inherited;
   if Trim(Me42Vendedor.text)<>'' then
    Ed42Vendedor.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Me42Vendedor.text)
   else
    Ed42Vendedor.Text := 'Todos';  
end;

procedure TFNotaSaidaParam.ME42FilialExit(Sender: TObject);
begin
  inherited;
 if Trim(Me42Filial.text)<>'' then
    Ed42Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Me42Filial.text)
  else
    Ed42Filial.Text:='Todos';
end;

procedure TFNotaSaidaParam.ME43FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME43Filial.Text) <> '' Then
    Ed43Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME43Filial.Text))
  Else
    Ed43Filial.Text := 'Todos';

end;

procedure TFNotaSaidaParam.ME43VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME43Vendedor.Text) <> '' Then
    Ed43Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME43Vendedor.Text))
  Else
    Ed43Vendedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Me43OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME43Operacao.Text) <> '' Then
    Ed43Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO',
                                           'COD_OPERACAO = '+Trim(ME43Operacao.Text))
  Else
    Ed43Operacao.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Me43CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME43Cadastro.Text) <> '' Then
   Begin
    Ed43Cadastro.text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                           'COD_CADASTRO = '+Trim(ME43Cadastro.Text));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(ME43Cadastro.Text)));
   End
  Else
    Ed43Cadastro.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Me43DepartamentoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me43Departamento.Text) <> '' Then
    Ed43Departamento.Text := DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento',
                                           'COD_Departamento = '+Trim(Me43Departamento.Text))
  Else
    Ed43Departamento.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Me43SupervisorExit(Sender: TObject);
begin
  inherited;
  If Trim(Me43Supervisor.Text) <> '' Then
    Ed43Supervisor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(Me43Supervisor.Text))
   Else
    Ed43Supervisor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Me43EstadoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me43Estado.Text) <> '' Then
    Ed43Estado.text:=DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO',
                    'COD_ESTADO = '+Chr(39)+Me43Estado.text+Chr(39))
  Else
    Ed43Estado.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt43ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  begin
    ME43Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME43FilialExit(Self);
  end;
end;

procedure TFNotaSaidaParam.Bt43ConsVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  begin
    ME43Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME43VendedorExit(Self);
  end;
end;

procedure TFNotaSaidaParam.Bt43OperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  begin
    ME43Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME43OperacaoExit(Self);
  end;
end;

procedure TFNotaSaidaParam.Bt43ConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  begin
    ME43Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME43CadastroExit(Self);
  end;
end;

procedure TFNotaSaidaParam.Bt43DepartamentoClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk then
  begin
    ME43Departamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    ME43DepartamentoExit(Self);
  end;

end;

procedure TFNotaSaidaParam.Bt43SupervisorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  begin
    ME43Supervisor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME43SupervisorExit(Self);
  end;
end;

procedure TFNotaSaidaParam.SB43EstadoClick(Sender: TObject);
begin
  inherited;
 If FEstadoCons = Nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  If FEstadoCons.ShowModal = MrOk then
  begin
    ME43Estado.Text := DMEstado.QEstadoConsCod_Estado.Text;
    ME43EstadoExit(self);
  end;

end;

procedure TFNotaSaidaParam.Me36SupervisorExit(Sender: TObject);
begin
  inherited;
  If Trim(Me36Supervisor.Text) <> '' Then
    Ed36Supervisor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(Me36Supervisor.Text))
   Else
    Ed36Supervisor.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt36SupervisorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    Me36Supervisor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
  Me36SupervisorExit(Self);

end;

procedure TFNotaSaidaParam.Me3SubClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(Me3Classe.Text) = '' Then
  Begin
    Ed3Classe.Text := 'Todos';
    Me3SubClasse.Text := '';
  End
  Else
    If Trim(Me3SubClasse.Text) = '' then
    Begin
      Ed3Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+Me3Classe.Text+
                                           'AND NUM_SUBCLASSE = 0');
      ME3SubClasse.Text := '0';
    End
    Else
      Ed3Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+Me3Classe.Text+
                                           'AND NUM_SUBCLASSE = '+Me3SubClasse.Text);

end;

procedure TFNotaSaidaParam.Bt3ConsClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    Me3Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
    Me3SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    Me3SubClasseExit(Self);
  End;
end;

procedure TFNotaSaidaParam.SB39SupervisorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    ME39Supervisor.Text:=DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME39SupervisorExit(Self);
end;

procedure TFNotaSaidaParam.ME39SupervisorExit(Sender: TObject);
begin
  inherited;
  If Trim(Me39Supervisor.Text) <> '' Then
    Ed39Supervisor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(Me39Supervisor.Text))
   Else
    Ed39Supervisor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.SB42SupervisorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    ME42Supervisor.Text:=DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME42SupervisorExit(Self);
end;

procedure TFNotaSaidaParam.ME42SupervisorExit(Sender: TObject);
begin
  inherited;
  If Trim(Me42Supervisor.Text) <> '' Then
    Ed42Supervisor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(Me42Supervisor.Text))
   Else
    Ed42Supervisor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt5ConsClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME5Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME5SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME5SubClasseExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Me5SubClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(Me5Classe.Text) = '' Then
  Begin
    Ed5Classe.Text := 'Todos';
    Me5SubClasse.Text := '';
  End
  Else
    If Trim(Me5SubClasse.Text) = '' then
    Begin
      Ed5Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+Me5Classe.Text+
                                           'AND NUM_SUBCLASSE = 0');
      Me5SubClasse.Text := '0';
    End
    Else
      Ed5Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+Me5Classe.Text+
                                           'AND NUM_SUBCLASSE = '+Me5SubClasse.Text);

end;

procedure TFNotaSaidaParam.Me5ClasseExit(Sender: TObject);
begin
  inherited;
    Me5SubClasseExit(Self);
end;

procedure TFNotaSaidaParam.Bt44FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  begin
    ME44Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME44FilialExit(Self);
  end;

end;

procedure TFNotaSaidaParam.ME44FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME44Filial.Text) <> '' Then
    Ed44Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME44Filial.Text))
  Else
    Ed44Filial.Text := 'Todos';  
end;

procedure TFNotaSaidaParam.Bt44CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  begin
    ME44Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME44CadastroExit(Self);
  end;

end;

procedure TFNotaSaidaParam.ME44CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME44Cadastro.Text) <> '' Then
  Begin
    Ed44Cadastro.text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(ME44Cadastro.Text));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
      DMNotaSaida.MostraMsg(StrToInt(Trim(ME44Fornecedor.Text)));
  end
  Else
    Ed44Cadastro.Text := 'Todos';  
end;

procedure TFNotaSaidaParam.Bt44VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  begin
    ME44Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME44VendedorExit(Self);
  end;

end;

procedure TFNotaSaidaParam.ME44VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME44Vendedor.Text) <> '' Then
    Ed44Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(ME44Vendedor.Text))
  Else
    Ed44Vendedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt44OperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  begin
    ME44Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    ME44OperacaoExit(Self);
  end;

end;

procedure TFNotaSaidaParam.ME44OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME44Operacao.Text) <> '' Then
    Ed44Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = '+Trim(ME44Operacao.Text))
  Else
    Ed44Operacao.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt44CulturaClick(Sender: TObject);
begin
  inherited;
  If FCulturaCons = Nil then
    FCulturaCons := TFCulturaCons.Create(Application);
  If FCulturaCons.ShowModal = mrOk then
  Begin
    Me44Cultura.Text := DMCultura.QCulturaConsCOD_CULTURA.Text;
    ME44CulturaExit(self);
  End;

end;

procedure TFNotaSaidaParam.ME44CulturaExit(Sender: TObject);
begin
  inherited;
  If Trim(Me44Cultura.Text) <> '' Then
    Ed44Cultura.text:=DMOracle.BuscaNome('SELECT DESC_CULTURA FROM TB_CULTURA','COD_CULTURA = '+Me44Cultura.text)
  Else
    Ed44Cultura.Text := 'Todos'; 
end;

procedure TFNotaSaidaParam.Bt44ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    ME44Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME44ProdutoExit(Self);
end;

procedure TFNotaSaidaParam.ME44ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME44Produto.Text) <> '' Then
     Ed44Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(ME44Produto.Text))
  Else
    Ed44Produto.Text := 'Todos';   
end;

procedure TFNotaSaidaParam.Bt44FornecedorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    ME44Fornecedor.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    ME44FornecedorExit(self);
end;

procedure TFNotaSaidaParam.ME44FornecedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME44Fornecedor.Text) <> '' Then
   Begin
    ED44Fornecedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(ME44Fornecedor.Text));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
       DMNotaSaida.MostraMsg(StrToInt(Trim(ME44Fornecedor.Text)));
   End
  Else
    ED44Fornecedor.Text := 'Todos';
end;

procedure TFNotaSaidaParam.ME44ClasseExit(Sender: TObject);
begin
  inherited;
  Me44SubClasseExit(Self);
end;

procedure TFNotaSaidaParam.Me44SubclasseExit(Sender: TObject);
begin
  inherited;
  If Trim(Me44Classe.Text) = '' Then
  Begin
    Ed44Classe.Text := 'Todos';
    Me44SubClasse.Text := '';
  End
  Else
    If Trim(Me44SubClasse.Text) = '' then
    Begin
      Ed44Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+Me44Classe.Text+
                                           'AND NUM_SUBCLASSE = 0');
      ME44SubClasse.Text := '0';
    End
    Else
      Ed44Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+Me44Classe.Text+
                                           'AND NUM_SUBCLASSE = '+Me44SubClasse.Text);


end;

procedure TFNotaSaidaParam.Bt44ClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    Me44Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
    Me44SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    Me44SubClasseExit(Self);
  End;

end;

procedure TFNotaSaidaParam.Bt44ClassificacaoClick(Sender: TObject);
begin
  inherited;
  If FClassCadastroCons = Nil then
    FClassCadastroCons := TFClassCadastroCons.Create(Application);
  If FClassCadastroCons.ShowModal = mrOk then
    ME44Classificacao.Text := DMClassCadastro.QClassCadastroConsCod_Class_Cadastro.Text;
    ME44ClassificacaoExit(Self);

end;

procedure TFNotaSaidaParam.Me44ClassificacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me44Classificacao.Text) <> '' Then
    Ed44Classificacao.Text := DMOracle.BuscaNome('SELECT DESC_CLASSIFICACAO FROM TB_CLASS_CADASTRO',
                                           'COD_CLASS_CADASTRO = '+Trim(Me44Classificacao.Text))
  Else
    Ed44Classificacao.Text := 'Todos';  
end;

procedure TFNotaSaidaParam.Bt9ClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    ME9Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME9SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME9SubClasseExit(Self); 
end;

procedure TFNotaSaidaParam.ME9SubclasseExit(Sender: TObject);
begin
  inherited;
  If Trim(ME9Classe.Text) = '' Then
  Begin
    Ed9Classe.Text := 'Todos';
    ME9SubClasse.Text := '';
    ME9NumClasse.Text := '';
  End
  Else
    If Trim(ME9SubClasse.Text) = '' then
    Begin
      Ed9Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME9Classe.Text+
                                           'AND NUM_SUBCLASSE = 0');
      ME9SubClasse.Text := '0';
      ME9NumClasse.Text := DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME9Classe.Text+
                                           'AND NUM_SUBCLASSE = 0');
    End
    Else
    Begin
      Ed9Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME9Classe.Text+
                                           'AND NUM_SUBCLASSE = '+ME9SubClasse.Text);
      ME9NumClasse.Text := DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME9Classe.Text+
                                           'AND NUM_SUBCLASSE = '+ME9SubClasse.Text);
    End;


end;

procedure TFNotaSaidaParam.ME9ClasseExit(Sender: TObject);
begin
  inherited;
  ME9SubClasseExit(Self);
end;

procedure TFNotaSaidaParam.Me38CodEstadoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me38CodEstado.Text) <> '' Then
    Ed38DescEstado.text:=DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO',
                    'COD_ESTADO = '+Chr(39)+Me38CodEstado.text+Chr(39))
  Else
    Ed38DescEstado.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Sb38ConsEstadoClick(Sender: TObject);
begin
  inherited;
  If FEstadoCons = Nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  If FEstadoCons.ShowModal = MrOk then
    ME38CodEstado.Text := DMEstado.QEstadoConsCod_Estado.Text;
    ME38CodEstadoExit(self);
end;

procedure TFNotaSaidaParam.Me31RamoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me31Ramo.Text) <> '' Then
    Ed31DescRamo.Text := DMOracle.BuscaNome('SELECT DESC_RAMO FROM TB_RAMO',
                                            'COD_RAMO = '+Trim(Me31Ramo.Text))
   Else
    Ed31DescRamo.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt31RamoClick(Sender: TObject);
begin
  inherited;
  If FRamoCons = Nil then
    FRamoCons := TFRamoCons.Create(Application);
  If FRamoCons.ShowModal = mrOk then
    ME31Ramo.Text := DMRamo.QRamoConsCod_Ramo.Text;
    ME31RamoExit(Self);
end;

procedure TFNotaSaidaParam.Me34RamoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me34Ramo.Text) <> '' Then
    Ed34DescRamo.Text := DMOracle.BuscaNome('SELECT DESC_RAMO FROM TB_RAMO',
                                            'COD_RAMO = '+Trim(Me34Ramo.Text))
   Else
    Ed34DescRamo.Text := 'Todos';
end;

procedure TFNotaSaidaParam.Bt34RamoClick(Sender: TObject);
begin
  inherited;
   If FRamoCons = Nil then
    FRamoCons := TFRamoCons.Create(Application);
  If FRamoCons.ShowModal = mrOk then
    ME34Ramo.Text := DMRamo.QRamoConsCod_Ramo.Text;
    ME34RamoExit(Self);
end;

procedure TFNotaSaidaParam.Me29OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me29Operacao.Text) <> '' Then
    Ed29Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO',
                                           'COD_OPERACAO = '+Trim(Me29Operacao.Text), True)
  Else
    Ed29Operacao.Text := 'Todos';

end;

procedure TFNotaSaidaParam.Bt29OperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    Me29Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
  Me29OperacaoExit(Self);

end;

procedure TFNotaSaidaParam.FmFilial12BtFilialClick(Sender: TObject);
begin
  inherited;
  FmFilial12.BtFilialClick(Sender);

end;

procedure TFNotaSaidaParam.FmDepartamento1BtDepartamentoClick(
  Sender: TObject);
begin
  inherited;
  FmDepartamento1.BtDepartamentoClick(Sender);

end;

procedure TFNotaSaidaParam.Bt3CadastroParceiroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    Me3CadastroParceiro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFNotaSaidaParam.Me42ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me42Produto.Text) <> '' Then
    Ed42Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                            'COD_PRODUTO = '+Trim(Me42Produto.Text))
   Else
    Ed42Produto.Text := 'Todos';
end;

procedure TFNotaSaidaParam.SB42ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    ME42Produto.Text:=DMProduto.QProdutoConsCod_Produto.Text;
    ME42ProdutoExit(Self);
end;

procedure TFNotaSaidaParam.TabSheet46Show(Sender: TObject);
begin
  inherited;
  FmDatas47.MeDtInicial.Text := DateToStr(Date - 30);
  FmDatas47.MeDtFinal.Text   := DateToStr(Date);
end;

procedure TFNotaSaidaParam.Bt47OperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
    If Trim(Me47Operacao.Text) = '' Then
       Me47Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text
    Else
       Me47Operacao.Text := Me47Operacao.Text + ',' + DMOperacao.QOperacaoConsCod_Operacao.Text;
end;

procedure TFNotaSaidaParam.Bt3ArmazemClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    Me3Armazem.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

End.
