unit UContrato_Param;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls, UFmProduto,
  UFmFilial, UFmCidade, UFmCadastro;

type
  TFContratoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    ME0CodFilial: TMaskEdit;
    ME0Filial: TMaskEdit;
    SpeedButton1: TSpeedButton;
    ME0CodProduto: TMaskEdit;
    SpeedButton2: TSpeedButton;
    ME0Produto: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    ME0CodCliente: TMaskEdit;
    ME0Cliente: TMaskEdit;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    ME0DtInicial: TMaskEdit;
    ME0DtFinal: TMaskEdit;
    SpeedButton3: TSpeedButton;
    TabSheet2: TTabSheet;
    ME1CodFilial: TMaskEdit;
    ME1Filial: TMaskEdit;
    SpeedButton4: TSpeedButton;
    ME1CodContrato: TMaskEdit;
    SpeedButton5: TSpeedButton;
    ME1Contrato: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    TabSheet3: TTabSheet;
    ME2CodContrato: TMaskEdit;
    SpeedButton6: TSpeedButton;
    ME2Contrato: TMaskEdit;
    ME2Qtde: TMaskEdit;
    ME2Valor: TMaskEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    RG0Situacao: TRadioGroup;
    ME0DtAnoMes: TMaskEdit;
    Label11: TLabel;
    RG0TipoSafra: TRadioGroup;
    TabSheet4: TTabSheet;
    ME3CodFilial: TMaskEdit;
    ME3Filial: TMaskEdit;
    ME3CodCliente: TMaskEdit;
    ME3Cliente: TMaskEdit;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    ME3CodProduto: TMaskEdit;
    SpeedButton9: TSpeedButton;
    ME3Produto: TMaskEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    RG3Situacao: TRadioGroup;
    GroupBox2: TGroupBox;
    ME3DtInicial: TMaskEdit;
    ME3DtFinal: TMaskEdit;
    Label15: TLabel;
    Label16: TLabel;
    TabSheet5: TTabSheet;
    ME4NrContrato: TMaskEdit;
    Label17: TLabel;
    ME4CodFilial: TMaskEdit;
    ME4Filial: TMaskEdit;
    Label18: TLabel;
    SpeedButton10: TSpeedButton;
    TabSheet6: TTabSheet;
    SpeedButton11: TSpeedButton;
    Label19: TLabel;
    ME5CodContrato: TMaskEdit;
    ME5Contrato: TMaskEdit;
    TabSheet7: TTabSheet;
    ME6CodFilial: TMaskEdit;
    ME6Filial: TMaskEdit;
    ME6CodProduto: TMaskEdit;
    ME6Produto: TMaskEdit;
    ME6CodCliente: TMaskEdit;
    ME6Cliente: TMaskEdit;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    TabSheet8: TTabSheet;
    ME7CodFilial: TMaskEdit;
    ME7Filial: TMaskEdit;
    ME7CodCliente: TMaskEdit;
    ME7Cliente: TMaskEdit;
    ME7CodProduto: TMaskEdit;
    ME7Produto: TMaskEdit;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    TabSheet9: TTabSheet;
    ME8CodFilial: TMaskEdit;
    ME8Filial: TMaskEdit;
    SpeedButton18: TSpeedButton;
    ME8CodCliente: TMaskEdit;
    SpeedButton19: TSpeedButton;
    ME8Cliente: TMaskEdit;
    ME8CodProduto: TMaskEdit;
    SpeedButton20: TSpeedButton;
    ME8Produto: TMaskEdit;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    TabSheet10: TTabSheet;
    ME9CodFilial: TMaskEdit;
    SpeedButton21: TSpeedButton;
    ME9Filial: TMaskEdit;
    ME9CodCliente: TMaskEdit;
    SpeedButton22: TSpeedButton;
    ME9Cliente: TMaskEdit;
    ME9CodProduto: TMaskEdit;
    ME9Produto: TMaskEdit;
    SpeedButton23: TSpeedButton;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    TabSheet11: TTabSheet;
    ME10CodFilial: TMaskEdit;
    ME10CodCliente: TMaskEdit;
    ME10CodProduto: TMaskEdit;
    ME10Filial: TMaskEdit;
    ME10Cliente: TMaskEdit;
    ME10Produto: TMaskEdit;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    TabSheet12: TTabSheet;
    ME11CodFilial: TMaskEdit;
    SpeedButton27: TSpeedButton;
    ME11Filial: TMaskEdit;
    ME11CodCadastro: TMaskEdit;
    SpeedButton28: TSpeedButton;
    ME11Cadastro: TMaskEdit;
    ME11CodProduto: TMaskEdit;
    SpeedButton29: TSpeedButton;
    ME11Produto: TMaskEdit;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Me10Contrato: TMaskEdit;
    Label40: TLabel;
    SpeedButton30: TSpeedButton;
    TabSheet13: TTabSheet;
    ME12CodFilial: TMaskEdit;
    Bt12Filial: TSpeedButton;
    ME12Filial: TMaskEdit;
    Label35: TLabel;
    ME12CodCliente: TMaskEdit;
    Label36: TLabel;
    Bt12Cliente: TSpeedButton;
    ME12Cliente: TMaskEdit;
    Label41: TLabel;
    ME12CodProduto: TMaskEdit;
    Bt12Produto: TSpeedButton;
    ME12Produto: TMaskEdit;
    GroupBox3: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    ME12DtInicial: TMaskEdit;
    ME12DtFinal: TMaskEdit;
    Label42: TLabel;
    ME12CodContrato: TMaskEdit;
    Bt12Contrato: TSpeedButton;
    Label45: TLabel;
    Me0CodVendedor: TMaskEdit;
    Me0Vendedor: TMaskEdit;
    SpeedButton31: TSpeedButton;
    Label46: TLabel;
    Me3CodVendedor: TMaskEdit;
    SpeedButton32: TSpeedButton;
    Me3Vendedor: TMaskEdit;
    Label47: TLabel;
    Me2DtBaixa: TMaskEdit;
    TabSheet14: TTabSheet;
    Me13CodFilial: TMaskEdit;
    Label48: TLabel;
    Bt13Filial: TSpeedButton;
    Me13Filial: TMaskEdit;
    RG6TipoValor: TRadioGroup;
    GroupBox4: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    Me8DataI: TMaskEdit;
    Me8DataF: TMaskEdit;
    TabSheet15: TTabSheet;
    Label51: TLabel;
    Me14Contrato: TMaskEdit;
    Bt14Contrato: TSpeedButton;
    Label52: TLabel;
    Me14CodFilial: TMaskEdit;
    Bt14Filial: TSpeedButton;
    ME14Filial: TMaskEdit;
    Label53: TLabel;
    Ed1Observacao: TEdit;
    Ed1Observacao1: TEdit;
    Label54: TLabel;
    Me1Quantidade: TMaskEdit;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Me13CodCliente: TMaskEdit;
    SpeedButton33: TSpeedButton;
    Me13Cliente: TMaskEdit;
    Me13Contrato: TMaskEdit;
    Label58: TLabel;
    SpeedButton34: TSpeedButton;
    TabSheet16: TTabSheet;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    SpeedButton37: TSpeedButton;
    Label62: TLabel;
    Me15CodFilial: TMaskEdit;
    Me15Filial: TMaskEdit;
    Me15CodProduto: TMaskEdit;
    Me15Produto: TMaskEdit;
    Me15CodCliente: TMaskEdit;
    Me15Cliente: TMaskEdit;
    GroupBox5: TGroupBox;
    Label64: TLabel;
    Label65: TLabel;
    Me15DtInicial: TMaskEdit;
    Me15DtFinal: TMaskEdit;
    RG15Situacao: TRadioGroup;
    ME15DtAnoMes: TMaskEdit;
    RG15TipoSafra: TRadioGroup;
    Rg3TipoPreco: TRadioGroup;
    Rg3Ordem: TRadioGroup;
    Label63: TLabel;
    Me1CodCliente: TMaskEdit;
    SpeedButton38: TSpeedButton;
    Me1Cliente: TMaskEdit;
    Rg7TipoPreco: TRadioGroup;
    Gb6DtEntrega: TGroupBox;
    Label66: TLabel;
    Label67: TLabel;
    Me6DtInicial: TMaskEdit;
    Me6DtFinal: TMaskEdit;
    Rg6Ordem: TRadioGroup;
    Label68: TLabel;
    Ed5Observacao: TEdit;
    Label69: TLabel;
    Me1ValorTitulos: TMaskEdit;
    GroupBox6: TGroupBox;
    Label70: TLabel;
    Label71: TLabel;
    Me3DtContrato_Inic: TMaskEdit;
    Me3DtContrato_Fim: TMaskEdit;
    Label72: TLabel;
    Me5CodCliente: TMaskEdit;
    SpeedButton39: TSpeedButton;
    Me5Cliente: TMaskEdit;
    GroupBox7: TGroupBox;
    Label73: TLabel;
    Label74: TLabel;
    Me3DtPagto_Inic: TMaskEdit;
    Me3DtPagto_Fim: TMaskEdit;
    GroupBox8: TGroupBox;
    Label75: TLabel;
    Label76: TLabel;
    Me7DtInicial: TMaskEdit;
    Me7DtFinal: TMaskEdit;
    Label77: TLabel;
    Me8CadastroParceiro: TMaskEdit;
    Sb8CadastroParceiro: TSpeedButton;
    GroupBox9: TGroupBox;
    Label78: TLabel;
    Label79: TLabel;
    Me11DtInicial: TMaskEdit;
    Me11DtFinal: TMaskEdit;
    Label80: TLabel;
    Ed2Observacao: TEdit;
    Label81: TLabel;
    Me5Quantidade: TMaskEdit;
    Label82: TLabel;
    Me5ValorDesconto: TMaskEdit;
    Label83: TLabel;
    Label84: TLabel;
    Rg0Tipo: TRadioGroup;
    Label85: TLabel;
    Me5DtPagto: TMaskEdit;
    Label86: TLabel;
    Me5Preco: TMaskEdit;
    TabSheet17: TTabSheet;
    Label87: TLabel;
    ME16Contrato: TMaskEdit;
    Label88: TLabel;
    ME16Filial: TMaskEdit;
    SB16Filial: TSpeedButton;
    Ed16Filial: TEdit;
    Me16Produto: TMaskEdit;
    SB16Produto: TSpeedButton;
    Ed16Produto: TEdit;
    Label89: TLabel;
    ME16Cadastro: TMaskEdit;
    SB16Cadastro: TSpeedButton;
    Ed16Cadastro: TEdit;
    Label90: TLabel;
    GroupBox10: TGroupBox;
    Label91: TLabel;
    Label92: TLabel;
    ME16DtInicial: TMaskEdit;
    ME16DtFinal: TMaskEdit;
    SB16Contrato: TSpeedButton;
    GroupBox11: TGroupBox;
    Label93: TLabel;
    Label94: TLabel;
    Me0DtEmissaoInic: TMaskEdit;
    Me0DtEmissaoFim: TMaskEdit;
    RG0TipoProducao: TRadioGroup;
    RG3Tipo: TRadioGroup;
    RG9TipoMercado: TRadioGroup;
    Label95: TLabel;
    Me1LoteTipo: TMaskEdit;
    Bt1ConsLote: TBitBtn;
    Ed1LoteTipo: TEdit;
    TabSheet18: TTabSheet;
    ME17Filial: TMaskEdit;
    SB17Filial: TSpeedButton;
    Ed17Filial: TEdit;
    Label96: TLabel;
    Sb17Produto: TSpeedButton;
    Label97: TLabel;
    Me17Produto: TMaskEdit;
    Ed17Produto: TEdit;
    Sb16Corretora: TSpeedButton;
    Label98: TLabel;
    Me16Corretora: TMaskEdit;
    Ed16Corretora: TEdit;
    GroupBox12: TGroupBox;
    Label101: TLabel;
    Label102: TLabel;
    Me9DtContrato_Inic: TMaskEdit;
    Me9DtContrato_Fim: TMaskEdit;
    GroupBox13: TGroupBox;
    Label99: TLabel;
    Label100: TLabel;
    Me9DtEntrega_Inic: TMaskEdit;
    Me9DtEntrega_Fim: TMaskEdit;
    TabSheet19: TTabSheet;
    Label103: TLabel;
    ME18Filial: TMaskEdit;
    SB18Filial: TSpeedButton;
    Ed18Filial: TEdit;
    Label104: TLabel;
    ME18Produto: TMaskEdit;
    SB18Produto: TSpeedButton;
    Ed18Produto: TEdit;
    Label105: TLabel;
    ME18Cadastro: TMaskEdit;
    SB18Cadastro: TSpeedButton;
    Ed18Cadastro: TEdit;
    GroupBox14: TGroupBox;
    Label106: TLabel;
    Label107: TLabel;
    ME18DtInicial: TMaskEdit;
    ME18DtFinal: TMaskEdit;
    RG18Situacao: TRadioGroup;
    GroupBox15: TGroupBox;
    Label108: TLabel;
    Label109: TLabel;
    ME18DtInicialE: TMaskEdit;
    ME18DtFinalE: TMaskEdit;
    TabSheet20: TTabSheet;
    Label110: TLabel;
    Label111: TLabel;
    Sb19Filial: TSpeedButton;
    Sb19Produto: TSpeedButton;
    Label112: TLabel;
    Sb19Cadastro: TSpeedButton;
    Label113: TLabel;
    Sb19Contrato: TSpeedButton;
    Me19Contrato: TMaskEdit;
    Me19Filial: TMaskEdit;
    Ed19Filial: TEdit;
    Me19Produto: TMaskEdit;
    Ed19Produto: TEdit;
    Me19Cadastro: TMaskEdit;
    Ed19Cadastro: TEdit;
    GroupBox16: TGroupBox;
    Label115: TLabel;
    Label116: TLabel;
    Me19DtInicial: TMaskEdit;
    Me19DtFinal: TMaskEdit;
    Label114: TLabel;
    Me13DtBase: TMaskEdit;
    SpeedButton41: TSpeedButton;
    Label117: TLabel;
    ME9Operacao: TMaskEdit;
    ME9DescOperacao: TMaskEdit;
    RG0TipoPagto: TRadioGroup;
    RG6TipoPagto: TRadioGroup;
    RG15TipoPagto: TRadioGroup;
    Label118: TLabel;
    ME10FilialNota: TMaskEdit;
    SpeedButton42: TSpeedButton;
    ED10FilialNota: TMaskEdit;
    RG7Ordem: TRadioGroup;
    RadioGroup1: TRadioGroup;
    Label119: TLabel;
    Me1Parceiro: TMaskEdit;
    Ed1Parceiro: TMaskEdit;
    Label120: TLabel;
    Me5Parceiro: TMaskEdit;
    Ed5Parceiro: TMaskEdit;
    TabSheet21: TTabSheet;
    Sb20Filial: TSpeedButton;
    Sb20Cadastro: TSpeedButton;
    Sb20Produto: TSpeedButton;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Me20CodFilial: TMaskEdit;
    Me20Filial: TMaskEdit;
    Me20CodCadastro: TMaskEdit;
    Me20Cadastro: TMaskEdit;
    Me20CodProduto: TMaskEdit;
    Me20Produto: TMaskEdit;
    GroupBox17: TGroupBox;
    Label124: TLabel;
    Label125: TLabel;
    Me20DtInicio: TMaskEdit;
    Me20DtFim: TMaskEdit;
    Label126: TLabel;
    SpeedButton45: TSpeedButton;
    Me20Contrato: TMaskEdit;
    Rg20TipoMercado: TRadioGroup;
    Rg20Embarque: TRadioGroup;
    Rg20Compra: TRadioGroup;
    Label127: TLabel;
    Me1PercDPI: TMaskEdit;
    Me1CreditoSemente: TMaskEdit;
    Label128: TLabel;
    Label129: TLabel;
    Me1Cobrado: TMaskEdit;
    Rg2TipoBaixa: TRadioGroup;
    SpeedButton43: TSpeedButton;
    Label130: TLabel;
    Me2ContaCorrente: TMaskEdit;
    EdContaCorrente: TMaskEdit;
    Rg0TipoFixar: TRadioGroup;
    Me5PercDpi: TMaskEdit;
    Label131: TLabel;
    Me5QtCredito: TMaskEdit;
    Label132: TLabel;
    Me5QtCobrado: TMaskEdit;
    Label133: TLabel;
    TabSheet22: TTabSheet;
    FmFilial22: TFmFilial;
    FmProduto22: TFmProduto;
    GroupBox18: TGroupBox;
    Label134: TLabel;
    Label135: TLabel;
    ME22Dt_Pagto_I: TMaskEdit;
    ME22Dt_Pagto_F: TMaskEdit;
    GroupBox19: TGroupBox;
    Label136: TLabel;
    Label137: TLabel;
    ME22Dt_Entrega_I: TMaskEdit;
    ME22Dt_Entrega_F: TMaskEdit;
    Rg11TipoMercado: TRadioGroup;
    GroupBox20: TGroupBox;
    Label138: TLabel;
    Label139: TLabel;
    ME20DtEmissaoI: TMaskEdit;
    ME20DtEmissaoF: TMaskEdit;
    FmCadastro3: TFmCadastro;
    FmCidade3: TFmCidade;
    Label140: TLabel;
    Me5ContaCorrente: TMaskEdit;
    Label141: TLabel;
    Bt5ConsContaCorrente: TBitBtn;
    Label142: TLabel;
    Me8Classe: TMaskEdit;
    Sb8Classe: TSpeedButton;
    Ed8Classe: TMaskEdit;
    Label143: TLabel;
    Me8SubClasse: TMaskEdit;
    Rg8Ordem: TRadioGroup;
    Ed5ObsDesconto: TEdit;
    Label144: TLabel;
    Rg20Custos: TRadioGroup;
    GroupBox21: TGroupBox;
    Label145: TLabel;
    Label146: TLabel;
    Me10DtInicial: TMaskEdit;
    Me10DtFinal: TMaskEdit;
    TabSheet23: TTabSheet;
    FmFilial23: TFmFilial;
    FmProduto23: TFmProduto;
    GroupBox22: TGroupBox;
    Label147: TLabel;
    Label148: TLabel;
    ME23DtPagamentoI: TMaskEdit;
    ME23DtPagamentoF: TMaskEdit;
    GroupBox23: TGroupBox;
    Label149: TLabel;
    Label150: TLabel;
    ME23DtEntregaI: TMaskEdit;
    ME23DtEntregaF: TMaskEdit;
    RGAgruparFilial: TRadioGroup;
    Rg20Ordem: TRadioGroup;
    Label151: TLabel;
    Me2Finalidade: TMaskEdit;
    Sb2Historico: TSpeedButton;
    Ed2Finalidade: TMaskEdit;
    TabSheet24: TTabSheet;
    Fm24Filial: TFmFilial;
    Label152: TLabel;
    Me24DtBase: TMaskEdit;
    Rg24TipoMercado: TRadioGroup;
    Label153: TLabel;
    Me24Contrato: TMaskEdit;
    Sb24Contrato: TSpeedButton;
    Label154: TLabel;
    Me3DtBase: TMaskEdit;
    Label155: TLabel;
    Me0DtBase: TMaskEdit;
    Rg11TipoPreco: TRadioGroup;
    Rg20TipoPreco: TRadioGroup;
    Label156: TLabel;
    Me1NotaProdutor: TMaskEdit;
    TabSheet25: TTabSheet;
    GBDtEmissao25: TGroupBox;
    Label159: TLabel;
    Label160: TLabel;
    Me25DataIniEmi: TMaskEdit;
    Me25DataFinEmi: TMaskEdit;
    RgSituacaoContratoCpr25: TRadioGroup;
    Label161: TLabel;
    MeCodContratoCpr25: TMaskEdit;
    BtBuscaContratoCpr25: TSpeedButton;
    MeDescContratoCpr25: TMaskEdit;
    GBDtRecebimento25: TGroupBox;
    Label158: TLabel;
    Label162: TLabel;
    Me25DataIniRec: TMaskEdit;
    Me25DataFinRec: TMaskEdit;
    Cb25SomaFreteCpr: TCheckBox;
    FmFilial25: TFmFilial;
    Cb25ItensNota: TCheckBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ME0CodFilialExit(Sender: TObject);
    procedure ME0CodProdutoExit(Sender: TObject);
    procedure ME0CodClienteExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ME1CodFilialExit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ME1CodContratoExit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure ME2CodContratoExit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure ME3CodFilialExit(Sender: TObject);
    procedure ME3CodClienteExit(Sender: TObject);
    procedure ME3CodProdutoExit(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure ME4CodFilialExit(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure ME5CodContratoExit(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure ME6CodFilialExit(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure ME6CodProdutoExit(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure ME6CodClienteExit(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure ME7CodFilialExit(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure ME7CodClienteExit(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure ME7CodProdutoExit(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure ME8CodFilialExit(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure ME8CodProdutoExit(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure ME9CodFilialExit(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure ME9CodClienteExit(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure ME9CodProdutoExit(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure ME10CodFilialExit(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure ME10CodClienteExit(Sender: TObject);
    procedure ME10CodProdutoExit(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure ME11CodFilialExit(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure ME11CodCadastroExit(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure ME11CodProdutoExit(Sender: TObject);
    procedure SpeedButton30Click(Sender: TObject);
    procedure ME12CodFilialExit(Sender: TObject);
    procedure Bt12FilialClick(Sender: TObject);
    procedure ME12CodClienteExit(Sender: TObject);
    procedure Bt12ClienteClick(Sender: TObject);
    procedure ME12CodProdutoExit(Sender: TObject);
    procedure Bt12ProdutoClick(Sender: TObject);
    procedure Bt12ContratoClick(Sender: TObject);
    procedure Me0CodVendedorExit(Sender: TObject);
    procedure SpeedButton31Click(Sender: TObject);
    procedure Me3CodVendedorExit(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Me13CodFilialExit(Sender: TObject);
    procedure Bt13FilialClick(Sender: TObject);
    procedure Bt14ContratoClick(Sender: TObject);
    procedure Me14CodFilialExit(Sender: TObject);
    procedure Bt14FilialClick(Sender: TObject);
    procedure Me13CodClienteExit(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure SpeedButton34Click(Sender: TObject);
    procedure Me15CodFilialExit(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure Me15CodProdutoExit(Sender: TObject);
    procedure SpeedButton36Click(Sender: TObject);
    procedure Me15CodClienteExit(Sender: TObject);
    procedure SpeedButton37Click(Sender: TObject);
    procedure Me1CodClienteExit(Sender: TObject);
    procedure SpeedButton38Click(Sender: TObject);
    procedure Me5CodClienteExit(Sender: TObject);
    procedure Sb8CadastroParceiroClick(Sender: TObject);
    procedure ME8CodClienteExit(Sender: TObject);
    procedure ME16FilialExit(Sender: TObject);
    procedure SpeedButton10Click2(Sender: TObject);
    procedure SpeedButton10Click3(Sender: TObject);
    procedure Me16ProdutoExit(Sender: TObject);
    procedure ME16CadastroExit(Sender: TObject);
    procedure SB16FilialClick(Sender: TObject);
    procedure SB16ProdutoClick(Sender: TObject);
    procedure SB16CadastroClick(Sender: TObject);
    procedure SB16ContratoClick(Sender: TObject);
    procedure Me1LoteTipoExit(Sender: TObject);
    procedure Bt1ConsLoteClick(Sender: TObject);
    procedure ME17FilialExit(Sender: TObject);
    procedure SB17FilialClick(Sender: TObject);
    procedure Me17ProdutoExit(Sender: TObject);
    procedure Sb17ProdutoClick(Sender: TObject);
    procedure Me16CorretoraExit(Sender: TObject);
    procedure Sb16CorretoraClick(Sender: TObject);
    procedure SB18FilialClick(Sender: TObject);
    procedure SB18ProdutoClick(Sender: TObject);
    procedure SB18CadastroClick(Sender: TObject);
    procedure ME18FilialExit(Sender: TObject);
    procedure ME18ProdutoExit(Sender: TObject);
    procedure ME18CadastroExit(Sender: TObject);
    procedure Me19FilialExit(Sender: TObject);
    procedure Sb19FilialClick(Sender: TObject);
    procedure Me19ProdutoExit(Sender: TObject);
    procedure Sb19ProdutoClick(Sender: TObject);
    procedure Me19CadastroExit(Sender: TObject);
    procedure Sb19CadastroClick(Sender: TObject);
    procedure ME9OperacaoExit(Sender: TObject);
    procedure SpeedButton41Click(Sender: TObject);
    procedure SpeedButton42Click(Sender: TObject);
    procedure ME10FilialNotaExit(Sender: TObject);
    procedure Me20CodCadastroExit(Sender: TObject);
    procedure Me20CodFilialExit(Sender: TObject);
    procedure Sb20FilialClick(Sender: TObject);
    procedure Sb20CadastroClick(Sender: TObject);
    procedure Me20CodProdutoExit(Sender: TObject);
    procedure SpeedButton45Click(Sender: TObject);
    procedure Sb20ProdutoClick(Sender: TObject);
    procedure Me1CreditoSementeChange(Sender: TObject);
    procedure Me2ContaCorrenteExit(Sender: TObject);
    procedure SpeedButton43Click(Sender: TObject);
    procedure Me5QtCreditoChange(Sender: TObject);
    procedure Bt5ConsContaCorrenteClick(Sender: TObject);
    procedure Sb8ClasseClick(Sender: TObject);
    procedure Me5ParceiroChange(Sender: TObject);
    procedure Me1ParceiroChange(Sender: TObject);
    procedure Me2FinalidadeExit(Sender: TObject);
    procedure Sb2HistoricoClick(Sender: TObject);
    procedure Rg2TipoBaixaExit(Sender: TObject);
    procedure Sb24ContratoClick(Sender: TObject);
    procedure BtBuscaContratoCpr25Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoParam: TFContratoParam;

implementation

uses UFilialCons, UFilial_cl, UProdutoCons, UProduto_cl, UCadastroCons,
  UCadastro_cl, UOracle_cl, UContratoCons, Ucontrato_cl, UContrato_GPCons,
  UContratoVenda_Cons, UVendedorCons, UVendedor_cl, UUsuario_cl,
  UContrato_PJuridicaCons, UContrato_Pjuridica_cl, UTipoLoteCons,
  UTipoLote_cl, UParamSistema_cl, UOperacaoCons, UOperacao_cl,
  UContaCorrenteCons, UBancoAgencia_cl, UClasseCons, UClasse_cl,
  UFinalidadeCons, UFinalidade_cl, UContratoCPR_cl, UContratoCPRCons, DB;

{$R *.DFM}

procedure TFContratoParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil  then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal  = mrOK then
    begin
      ME0CodFilial.text := DMfilial.QFilialConsCod_filial.text;
      ME0CodFilialExit(Self);
    end;
end;

procedure TFContratoParam.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons:= TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    begin
      ME0CodProduto.text:=DMProduto.QProdutoConsCod_produto.text;
      ME0CodProdutoExit(Self);
    end;
end;

procedure TFContratoParam.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      ME0CodCliente.text:=DMCadastro.QCadastroConsCod_Cadastro.text;
      ME0CodClienteExit(Self);
    end;
end;

procedure TFContratoParam.ME0CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodFilial.text) <> '' then
    ME0Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME0CodFilial.text, True)
  else
    ME0Filial.text:='Todos';
end;

procedure TFContratoParam.ME0CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodProduto.Text) <> '' then
    ME0Produto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME0CodProduto.text, True)
  else
    ME0Produto.text:='Todos';
end;

procedure TFContratoParam.ME0CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodCliente.text) <> '' then
    ME0Cliente.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO ='+ME0CodCliente.text,True)
  else
    ME0Cliente.Text:='Todos';
end;

procedure TFContratoParam.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME1CodFilial.Text:=DMFilial.QFilialConsCOD_FILIAL.Text;
      ME1CodFilialExit(Self);
    end;
end;

procedure TFContratoParam.ME1CodFilialExit(Sender: TObject);
begin
  inherited;
  if ME1CodFilial.text  <> '' then
    ME1Filial.text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME1CodFilial.text,True)
  else
    ME1Filial.Clear;
end;

procedure TFContratoParam.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if FContratoCons = Nil then
    FContratoCons  := TFContratoCons.Create(Application);
  if FContratoCons.ShowModal=mrOk then
    begin
      ME1CodContrato.text:=DMContrato.QContratoConsCod_Contrato.text;
      ME1CodContratoExit(Self);
      ME1CodCliente.Text:=DMContrato.QContratoConsCod_Cadastro.Text;
      ME1CodClienteExit(Self);
      ME1Parceiro.Text:=DMContrato.QContratoConsCod_Cadastro_Parceiro.Text;
      Me1PercDpi.Text := DMOracle.BuscaNome('SELECT PERC_DPI_TRANSGENICOS FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO='+Trim(DMContrato.QContratoConsCod_Produto.Text));
      Me1CreditoSemente.Clear;
      If DMContrato.QContratoConsIND_BAIXA_CREDITO_MONSANTO.Value = 'SIM' Then
         Me1CreditoSemente.Text := DMContrato.QContratoConsQT_CREDITO_TRANSGENICOS.Text;
    end;
end;

procedure TFContratoParam.ME1CodContratoExit(Sender: TObject);
var
  wtemp1,Wtemp2 :String;
begin
  inherited;
  if ME1CodContrato.text <> '' then
    begin
      wtemp1:=DMOracle.BuscaNome('SELECT NUM_CONTRATO FROM TB_CONTRATO','COD_CONTRATO ='+ME1CodContrato.text);
      wtemp2:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO T1, TB_CONTRATO T2','T1.COD_CADASTRO = T2.COD_CADASTRO AND T2.COD_CONTRATO ='+ME1CodContrato.text);
      ME1Contrato.text := 'Nr.:'+wTemp1+' Cliente:'+wTemp2;
      Ed1Observacao1.Text := 'Referente Contrato Compra Futura Nr.:'+wTemp1;
    end
  else
    ME1Contrato.Clear;
end;

procedure TFContratoParam.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if FContratoCons = Nil then
    FContratoCons  := TFContratoCons.Create(Application);
  if FContratoCons.ShowModal=mrOk then
    begin
      ME2CodContrato.text:=DMContrato.QContratoConsCod_Contrato.text;
      ME2CodContratoExit(Self);
    end;
end;

procedure TFContratoParam.ME2CodContratoExit(Sender: TObject);
var
  wtemp1,Wtemp2 :String;
begin
  inherited;
  if ME2CodContrato.text<>'' then
    begin
      wtemp1:=DMOracle.BuscaNome('SELECT NUM_CONTRATO FROM TB_CONTRATO','COD_CONTRATO = '+ME2CodContrato.text);
      wtemp2:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO T1, TB_CONTRATO T2','T1.COD_CADASTRO = T2.COD_CADASTRO AND T2.COD_CONTRATO ='+ME2CodContrato.text);
      ME2Contrato.text := 'Nr.:'+wtemp1+' Cliente:'+wtemp2;
    end
  else
    ME2Contrato.Clear;
end;

procedure TFContratoParam.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME3CodFilial.Text:=DMFilial.QFilialConsCOD_FILIAL.Text;
      ME3CodFilialExit(Self);
    end;
end;

procedure TFContratoParam.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      ME3CodCliente.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;
      ME3CodClienteExit(Self);
    end;
end;

procedure TFContratoParam.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    begin
      ME3CodProduto.Text:=DMProduto.QProdutoConsCOD_PRODUTO.Text;
      ME3CodProdutoExit(Self);
    end;
end;

procedure TFContratoParam.ME3CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME3CodFilial.Text)<>'' then
    ME3Filial.text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME3CodFilial.Text,True)
  else
    ME3Filial.Clear;
end;

procedure TFContratoParam.ME3CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME3CodCliente.text)<>'' then
    ME3Cliente.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME3CodCliente.text,True)
  else
    ME3Cliente.Clear;
end;

procedure TFContratoParam.ME3CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME3CodProduto.text)<>'' then
    ME3Produto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME3CodProduto.text,True)
  else
    ME3Produto.Clear;
end;

procedure TFContratoParam.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME4CodFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;
      ME4CodFilialExit(Self);
    end;
end;

procedure TFContratoParam.ME4CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME4CodFilial.text)<>'' then
    ME4Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME4CodFilial.text,True)
  else
    ME4Filial.Clear;
end;

procedure TFContratoParam.SpeedButton11Click(Sender: TObject);
Var wDolar : String;
begin
  inherited;
  if FContrato_GPCons = Nil then
    FContrato_GPCons  := TFContrato_GPCons.Create(Application);
  if FContrato_GPCons.ShowModal=mrOk then
  begin
    ME5CodContrato.text:=DMContrato.QContrato_GPConsCod_Contrato_GP.text;
    Me5Cliente.Text := DMContrato.QContrato_GPConsNome.Text;
    Me5CodCliente.Text := DMContrato.QContrato_GPConsCod_Cadastro.Text;
    Me5DtPagto.Text := DMContrato.QContrato_GPConsDt_Pagto.Text;
    Me5Parceiro.Text := DMContrato.QContrato_GPConsCod_Cadastro_Parceiro.Text;
    If DMContrato.QContrato_GPConsDesc_Tipo_Preco.Value = 'REAL' Then
      Me5Preco.Text := FloatToStr(DMContrato.QContrato_GPConsPRECO.Value)
    Else
     Begin
       wDolar := DmOracle.BuscaNome('SELECT VLR_COTACAO FROM TB_COTACAO', 'COD_MOEDA = 2 AND DT_COTACAO =' + chr(39) + DateToStr(Date) + chr(39));
       If wDolar = '' Then
         Raise Exception.Create ('Dolar Não Cadastrado Para Esta Data');
       Me5Preco.Text := FloatToStr(Trunc(DMContrato.QContrato_GPConsPreco.Value * StrToFloat(wDolar)*100) / 100);
     End;
    ME5CodContratoExit(Self);
    Me5PercDpi.Text := DMOracle.BuscaNome('SELECT PERC_DPI_TRANSGENICOS FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO = '+Trim(DMContrato.QContrato_GpConsCod_Produto.Text), True);
  end;
end;

procedure TFContratoParam.ME5CodContratoExit(Sender: TObject);
var
  wtemp1,Wtemp2 :String;
begin
  inherited;
  if ME5CodContrato.text<>'' then
    begin
      wtemp1:=DMOracle.BuscaNome('SELECT NUM_CONTRATO FROM TB_CONTRATO_GP','COD_CONTRATO_GP = '+ME5CodContrato.text,True);
      wtemp2:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO T1, TB_CONTRATO_GP T2','T1.COD_CADASTRO = T2.COD_CADASTRO AND T2.COD_CONTRATO_GP ='+ME5CodContrato.text);
      ME5Contrato.text := 'Nr.:'+wtemp1+' Cliente:'+wtemp2;
    end
  else
    ME5Contrato.Clear;
end;

procedure TFContratoParam.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons :=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk  then
    begin
      ME6CodFilial.text:=DMfilial.QFilialConsCod_Filial.text;
      ME6CodFilialExit(Self);
    end;
end;

procedure TFContratoParam.ME6CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME6CodFilial.text)<>'' then
    ME6Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME6CodFilial.text,True)
  else
    ME6Filial.Clear;
end;

procedure TFContratoParam.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    begin
      ME6CodProduto.text:=DMProduto.QProdutoConsCod_Produto.text;
      ME6CodProdutoExit(Self);
    end;
end;

procedure TFContratoParam.ME6CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME6CodProduto.text)<>'' then
    ME6Produto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME6CodProduto.text,True)
  else
    ME6Produto.Clear;
end;

procedure TFContratoParam.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons  = nil then
    FCadastroCons :=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal =  mrOk then
    begin
      ME6CodCliente.text:=DMCadastro.QCadastroConsCOD_CADASTRO.text;
      ME6CodClienteExit(Self);
    end;
end;

procedure TFContratoParam.ME6CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME6CodCliente.text)<>'' then
    ME6Cliente.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME6CodCliente.text,True)
  else
    ME6Cliente.Clear;
end;

procedure TFContratoParam.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME7CodFilial.text:=DMFilial.QFilialConsCod_Filial.text;
      ME7CodFilialExit(Self);
    end;
end;

procedure TFContratoParam.ME7CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME7CodFilial.text)<> '' then
    ME7Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME7CodFilial.text,True)
  else
    ME7Filial.Clear;
end;

procedure TFContratoParam.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.Showmodal  = mrOK then
    begin
      ME7CodCliente.text:=DMCadastro.QCadastroConsCOD_CADASTRO.text;
      ME7CodClienteExit(Self);
    end;
end;

procedure TFContratoParam.ME7CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME7CodCliente.text)<>'' then
    ME7Cliente.text:=DMOracle.BuscaNome('SELECT NOME FROM  TB_CADASTRO','COD_CADASTRO = '+ME7CodCliente.text,True)
  else
    ME7Cliente.Clear;
end;

procedure TFContratoParam.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOK then
    begin
      ME7CodProduto.text:=DMProduto.QProdutoConsCOD_PRODUTO.text;
      ME7CodProdutoExit(Self);
    end;
end;

procedure TFContratoParam.ME7CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME7CodProduto.text)<>'' then
    ME7Produto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME7CodProduto.text,True)
  else
    ME7Produto.clear;
end;

procedure TFContratoParam.SpeedButton18Click(Sender: TObject);
begin
  inherited;
  if FFilialcons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrok then
    begin
      ME8CodFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;
      ME8CodFilialExit(self);
    end;
end;

procedure TFContratoParam.ME8CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8CodFilial.text)<>'' then
    ME8Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME8CodFilial.text,True)
  else
    ME8Filial.Clear;
end;

procedure TFContratoParam.SpeedButton19Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      ME8CodCliente.text:=DMCadastro.QCadastroConsCod_Cadastro.Text;
      ME8CodClienteExit(Self);
    end;
end;

procedure TFContratoParam.SpeedButton20Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOK then
    begin
      ME8CodProduto.text:=DMProduto.QProdutoConsCod_Produto.text;
      ME8CodProdutoExit(Self);
    end;
end;

procedure TFContratoParam.ME8CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8CodProduto.text)<>'' then
    ME8Produto.text:=DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME8CodProduto.text,True)
  else
    ME8Produto.Clear;
end;

procedure TFContratoParam.SpeedButton21Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrok then
    begin
      ME9CodFilial.text:=DMFilial.QFilialConsCOD_FILIAL.text;
      ME9CodFilialExit(Self);
    end;
end;

procedure TFContratoParam.ME9CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME9CodFilial.text)<>'' then
    ME9Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME9CodFilial.text,True)
  else
    ME9Filial.clear;
end;

procedure TFContratoParam.SpeedButton22Click(Sender: TObject);
begin
  inherited;
  if  FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      ME9CodCliente.text:=DMCadastro.QCadastroConsCod_cadastro.text;
      ME9CodClienteExit(Self);
    end;
end;

procedure TFContratoParam.ME9CodClienteExit(Sender: TObject);
begin
  inherited;
  if trim(ME9CodCliente.text) <> '' then
    ME9Cliente.text:=DMOracle.Buscanome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME9CodCliente.text,True)
  else
    ME9Cliente.Clear;
end;

procedure TFContratoParam.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  if fProdutoCons= nil then
    FProdutoCons:=TFProdutoCons.create(Application);
  if FProdutoCons.ShowModal = mrOk then
    begin
      ME9CodProduto.text:=DMProduto.QProdutoConsCOD_PRODUTO.text;
      ME9CodProdutoExit(Self);
    end;
end;

procedure TFContratoParam.ME9CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME9CodProduto.text) <> '' then
    ME9Produto.text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME9Codproduto.text,True)
  else
    ME9Produto.Clear;
end;

procedure TFContratoParam.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME10CodFilial.text:=DMFilial.QFilialConsCOD_FILIAL.text;
      ME10CodFilialExit(Self);
    end;
end;

procedure TFContratoParam.ME10CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10CodFilial.text)<>'' then
    ME10Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME10CodFilial.text,True)
  else
    ME10Filial.Clear;
end;

procedure TFContratoParam.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      ME10CodCliente.text:=DMCadastro.QCadastroConsCOD_CADASTRO.text;
      ME10CodClienteExit(Self);
    end;
end;

procedure TFContratoParam.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk  then
    begin
      ME10CodProduto.text:=DMProduto.QProdutoConsCOD_PRODUTO.Text;
      ME10CodProdutoExit(Self);
    end;
end;

procedure TFContratoParam.ME10CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10CodCliente.text)<>'' then
    ME10Cliente.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME10CodCliente.text,True)
  else
    ME10Cliente.Clear;
end;

procedure TFContratoParam.ME10CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10CodProduto.text)<>'' then
    ME10Produto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME10CodProduto.text,True)
  else
    ME10Produto.Clear;
end;

procedure TFContratoParam.SpeedButton27Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk then
    begin
      ME11CodFilial.text:=DMFilial.QFilialConsCod_Filial.Text;
      ME11CodFilialExit(Self);
    end;
end;

procedure TFContratoParam.ME11CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME11CodFilial.text)<>'' then
    ME11Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME11CodFilial.text,True)
  else
    ME11Filial.Clear;
end;

procedure TFContratoParam.SpeedButton28Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      ME11CodCadastro.text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;
      ME11CodCadastroExit(Self);
    end;
end;

procedure TFContratoParam.ME11CodCadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME11CodCadastro.text)<>'' then
    ME11Cadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME11CodCadastro.text,True)
  else
    ME11Cadastro.Clear;
end;

procedure TFContratoParam.SpeedButton29Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons=nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    begin
      ME11CodProduto.text:=DMProduto.QProdutoConsCOD_PRODUTO.text;
      ME11CodProdutoExit(Self);
    end;
end;

procedure TFContratoParam.ME11CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME11CodProduto.text)<>'' then
    ME11Produto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME11CodProduto.text,True)
  else
    ME11Produto.Clear;
end;

procedure TFContratoParam.SpeedButton30Click(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  if FContrato_VendaCons.ShowModal = mrOk then
     Me10Contrato.Text := DMContrato.QContrato_VendConsNum_Contrato.Text;
end;

procedure TFContratoParam.ME12CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME12CodFilial.text)<>'' then
    ME12Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME12CodFilial.text,True)
  else
    ME12Filial.Clear;
end;

procedure TFContratoParam.Bt12FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME12CodFilial.text:=DMFilial.QFilialConsCOD_FILIAL.text;
      ME12CodFilialExit(Self);
    end;

end;

procedure TFContratoParam.ME12CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME12CodCliente.text)<>'' then
    ME12Cliente.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME12CodCliente.text,True)
  else
    ME12Cliente.Clear;

end;

procedure TFContratoParam.Bt12ClienteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      ME12CodCliente.text:=DMCadastro.QCadastroConsCOD_CADASTRO.text;
      ME12CodClienteExit(Self);
    end;
end;

procedure TFContratoParam.ME12CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME12CodProduto.text)<>'' then
    ME12Produto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME12CodProduto.text,True)
  else
    ME12Produto.Clear;

end;

procedure TFContratoParam.Bt12ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk  then
    begin
      ME12CodProduto.text:=DMProduto.QProdutoConsCOD_PRODUTO.Text;
      ME12CodProdutoExit(Self);
    end;

end;

procedure TFContratoParam.Bt12ContratoClick(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  if FContrato_VendaCons.ShowModal = mrOk then
     ME12CodContrato.Text := DMContrato.QContrato_VendConsNum_Contrato.Text;
end;

procedure TFContratoParam.Me0CodVendedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodVendedor.text) <> '' then
    ME0Vendedor.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+ME0CodVendedor.text,True)
  else
    ME0Vendedor.text:='Todos';

end;

procedure TFContratoParam.SpeedButton31Click(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons:=TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    begin
      ME0CodVendedor.text:=DMVendedor.QVendedorConsCod_Vendedor.text;
      ME0CodVendedorExit(Self);
    end;

end;

procedure TFContratoParam.Me3CodVendedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME3CodVendedor.text) <> '' then
    ME3Vendedor.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+ME3CodVendedor.text,True)
  else
    ME3Vendedor.text:='Todos';

end;

procedure TFContratoParam.SpeedButton32Click(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons:=TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    begin
      ME3CodVendedor.text:=DMVendedor.QVendedorConsCod_Vendedor.text;
      ME3CodVendedorExit(Self);
    end;

end;

procedure TFContratoParam.FormActivate(Sender: TObject);
begin
  inherited;
  ME0CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME1CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME3CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME4CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME6CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME7CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME8CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME9CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME10CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME11CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME12CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME1Quantidade.Text:='';
  Me1ValorTitulos.Visible := DmParamSistema.QparamSistemaCod_Empresa.Value <> 'MOINHO';
  Label69.Visible := DmParamSistema.QparamSistemaCod_Empresa.Value <> 'MOINHO';
  Me8CadastroParceiro.Text := DMUsuario.pCodParceria;
  Me8CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  Sb8CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  If DmParamSistema.QparamSistemaCod_Empresa.Value = 'MOINHO' Then
     Me2Finalidade.Text := '417';

end;

procedure TFContratoParam.Me13CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME13CodFilial.text)<>'' then
    ME13Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME13CodFilial.text,True)
  else
    ME13Filial.Clear;

end;

procedure TFContratoParam.Bt13FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME13CodFilial.text:=DMFilial.QFilialConsCOD_FILIAL.text;
      ME13CodFilialExit(Self);
    end;

end;

procedure TFContratoParam.Bt14ContratoClick(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  if FContrato_VendaCons.ShowModal = mrOk then
     ME14Contrato.Text := DMContrato.QContrato_VendConsNum_Contrato.Text;

end;

procedure TFContratoParam.Me14CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME14CodFilial.text)<>'' then
    ME14Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME14CodFilial.text,True)
  else
    ME14Filial.Clear;

end;

procedure TFContratoParam.Bt14FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME14CodFilial.text:=DMFilial.QFilialConsCOD_FILIAL.text;
      ME14CodFilialExit(Self);
    end;

end;

procedure TFContratoParam.Me13CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME13CodCliente.text)<>'' then
    ME13Cliente.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME13CodCliente.text,True)
  else
    ME13Cliente.Clear;

end;

procedure TFContratoParam.SpeedButton33Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      ME13CodCliente.text:=DMCadastro.QCadastroConsCOD_CADASTRO.text;
      ME13CodClienteExit(Self);
    end;

end;

procedure TFContratoParam.SpeedButton34Click(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  if FContrato_VendaCons.ShowModal = mrOk then
     ME13Contrato.Text := DMContrato.QContrato_VendConsNum_Contrato.Text;

end;

procedure TFContratoParam.Me15CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME15CodFilial.text) <> '' then
    ME15Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME15CodFilial.text,True)
  else
    ME15Filial.text:='Todos';

end;

procedure TFContratoParam.SpeedButton35Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil  then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal  = mrOK then
    begin
      ME15CodFilial.text := DMfilial.QFilialConsCod_filial.text;
      ME15CodFilialExit(Self);
    end;

end;

procedure TFContratoParam.Me15CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME15CodProduto.Text) <> '' then
    ME15Produto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME15CodProduto.text,True)
  else
    ME15Produto.text:='Todos';

end;

procedure TFContratoParam.SpeedButton36Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons:= TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    begin
      ME15CodProduto.text:=DMProduto.QProdutoConsCod_produto.text;
      ME15CodProdutoExit(Self);
    end;

end;

procedure TFContratoParam.Me15CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME15CodCliente.text) <> '' then
    ME15Cliente.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME15CodCliente.text,True)
  else
    ME15Cliente.Text:='Todos';

end;

procedure TFContratoParam.SpeedButton37Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      ME15CodCliente.text:=DMCadastro.QCadastroConsCod_Cadastro.text;
      ME15CodClienteExit(Self);
    end;

end;

procedure TFContratoParam.Me1CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodCliente.text)<>'' then
    ME1Cliente.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME1CodCliente.text,True)
  else
    ME1Cliente.Clear;

end;

procedure TFContratoParam.SpeedButton38Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    ME1CodCliente.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    ME1CodClienteExit(Self);
  end;
end;

procedure TFContratoParam.Me5CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(Me5CodCliente.text)<>'' then
    Me5Cliente.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(Me5CodCliente.Text),True)
  else
    Me5Cliente.Clear;

end;

procedure TFContratoParam.Sb8CadastroParceiroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     Me8CadastroParceiro.text:=DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFContratoParam.ME8CodClienteExit(Sender: TObject);
begin
  inherited;
  if trim(ME8CodCliente.text) <> '' then
    ME8Cliente.text:=DMOracle.Buscanome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME8CodCliente.text,True)
  else
    ME8Cliente.Clear;

end;

procedure TFContratoParam.ME16FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME16Filial.text)<>'' then
    Ed16Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME16Filial.text,True)
  else
    Ed16Filial.Text :='Todos';
end;

procedure TFContratoParam.SpeedButton10Click2(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME4CodFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;
      ME4CodFilialExit(Self);
    end;
end;

procedure TFContratoParam.SpeedButton10Click3(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME4CodFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;
      ME4CodFilialExit(Self);
    end;
end;

procedure TFContratoParam.Me16ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME16Produto.Text) <> '' then
    Ed16Produto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME16Produto.text,True)
  else
    ED16Produto.text:='Todos';

end;

procedure TFContratoParam.ME16CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME16Cadastro.text) <> '' then
    Ed16Cadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME16Cadastro.text,True)
  else
    Ed16Cadastro.Text:='Todos';
end;

procedure TFContratoParam.SB16FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil  then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal  = mrOK then
    begin
      ME16Filial.text := DMfilial.QFilialConsCod_filial.text;
      ME16FilialExit(Self);
    end;
end;

procedure TFContratoParam.SB16ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons:= TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    begin
      ME16Produto.text:=DMProduto.QProdutoConsCod_produto.text;
      ME16ProdutoExit(Self);
    end;

end;

procedure TFContratoParam.SB16CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      ME16Cadastro.text:=DMCadastro.QCadastroConsCod_Cadastro.text;
      ME16CadastroExit(Self);
    end;
end;

procedure TFContratoParam.SB16ContratoClick(Sender: TObject);
begin
  inherited;
  if FContrato_PJuridicaCons = nil then
    FContrato_PJuridicaCons := TFContrato_PJuridicaCons.Create(Application);
  if FContrato_PJuridicaCons.ShowModal = mrOk then
     ME19Contrato.Text := DMContrato_PJuridica.QContratoPJuridicaConsCod_Contrato_PJuridica.Text;
end;

procedure TFContratoParam.Me1LoteTipoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me1LoteTipo.Text) <> '' Then
    Ed1LoteTipo.Text := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+Me1LoteTipo.text,True)
  Else
    Ed1LoteTipo.Text := 'Todos';

end;

procedure TFContratoParam.Bt1ConsLoteClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = nil then
     FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOK then
  begin
     Me1LoteTipo.Text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
     Me1LoteTipoExit(Self);
  end;

end;

procedure TFContratoParam.ME17FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME17Filial.text)<>'' then
    Ed17Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME17Filial.text,True)
  else
    Ed17Filial.Text :='Todos';
end;

procedure TFContratoParam.SB17FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil  then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal  = mrOK then
    begin
      ME17Filial.text := DMfilial.QFilialConsCod_filial.text;
      ME17FilialExit(Self);
    end;
end;

procedure TFContratoParam.Me17ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME17Produto.Text) <> '' then
    Ed17Produto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME17Produto.text,True)
  else
    ED17Produto.text:='Todos';
end;

procedure TFContratoParam.Sb17ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons:= TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    begin
      ME17Produto.text:=DMProduto.QProdutoConsCod_produto.text;
      ME17ProdutoExit(Self);
    end;

end;

procedure TFContratoParam.Me16CorretoraExit(Sender: TObject);
begin
  inherited;
  if Trim(ME16Corretora.text) <> '' then
    Ed16Corretora.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME16Corretora.text,True)
  else
    Ed16Corretora.Text:='Todos';

end;

procedure TFContratoParam.Sb16CorretoraClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      ME16Corretora.text:=DMCadastro.QCadastroConsCod_Cadastro.text;
      ME16CorretoraExit(Self);
    end;
end;

procedure TFContratoParam.SB18FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil  then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal  = mrOK then
    ME18Filial.text := DMfilial.QFilialConsCod_filial.text;
    ME18FilialExit(Self);
end;

procedure TFContratoParam.SB18ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons:= TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    ME18Produto.text:=DMProduto.QProdutoConsCod_produto.text;
    ME18ProdutoExit(Self);
end;

procedure TFContratoParam.SB18CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    ME18Cadastro.text:=DMCadastro.QCadastroConsCod_Cadastro.text;
    ME18CadastroExit(Self);  
end;

procedure TFContratoParam.ME18FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME18Filial.text)<>'' then
    Ed18Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME18Filial.text,True)
  else
    Ed18Filial.Text :='Todos';
end;

procedure TFContratoParam.ME18ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME18Produto.Text) <> '' then
    Ed18Produto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME18Produto.text,True)
  else
    ED18Produto.text:='Todos';

end;

procedure TFContratoParam.ME18CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME18Cadastro.text) <> '' then
    Ed18Cadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME18Cadastro.text,True)
  else
    Ed18Cadastro.Text:='Todos';

end;

procedure TFContratoParam.Me19FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME19Filial.text)<>'' then
    Ed19Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME19Filial.text,True)
  else
    Ed19Filial.Text :='Todos';

end;

procedure TFContratoParam.Sb19FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil  then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal  = mrOK then
   begin
     ME19Filial.text := DMfilial.QFilialConsCod_filial.text;
     ME19FilialExit(Self);
   End;

end;

procedure TFContratoParam.Me19ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME19Produto.Text) <> '' then
    Ed19Produto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Me19Produto.text,True)
  else
    Ed19Produto.text:='Todos';

end;

procedure TFContratoParam.Sb19ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons:= TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    begin
      Me19Produto.text:=DMProduto.QProdutoConsCod_produto.text;
      Me19ProdutoExit(Self);
    end;

end;

procedure TFContratoParam.Me19CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(Me19Cadastro.text) <> '' then
    Ed19Cadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Me19Cadastro.text,True)
  else
    Ed19Cadastro.Text:='Todos';

end;

procedure TFContratoParam.Sb19CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      Me19Cadastro.text:=DMCadastro.QCadastroConsCod_Cadastro.text;
      Me19CadastroExit(Self);
    end;

end;

procedure TFContratoParam.ME9OperacaoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME9Operacao.text) <> '' then
    ME9DescOperacao.text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = '+ME9Operacao.text,True)
  else
    ME9DescOperacao.Clear;
end;

procedure TFContratoParam.SpeedButton41Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCons= nil then
    FOperacaoCons:=TFOperacaoCons.create(Application);
  if FOperacaoCons.ShowModal = mrOk then
    begin
      ME9Operacao.text:=DMOperacao.QOperacaoConsCOD_OPERACAO.text;
      ME9OperacaoExit(Self);
    end;
end;

procedure TFContratoParam.SpeedButton42Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME10FilialNota.text:=DMFilial.QFilialConsCOD_FILIAL.text;
      ME10FilialNotaExit(Self);
    end;
end;

procedure TFContratoParam.ME10FilialNotaExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10FilialNota.text)<>'' then
    ED10FilialNota.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME10FilialNota.text),True)
  else
    ED10FilialNota.Text:='Todas';
end;

procedure TFContratoParam.Me20CodCadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME20CodCadastro.text)<>'' then
    ME20Cadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME20CodCadastro.text,True)
  else
    ME20Cadastro.Clear;

end;

procedure TFContratoParam.Me20CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME20CodFilial.text)<>'' then
    ME20Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME20CodFilial.text,True)
  else
    ME20Filial.Clear;

end;

procedure TFContratoParam.Sb20FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk then
    begin
      ME20CodFilial.text:=DMFilial.QFilialConsCod_Filial.Text;
      ME20CodFilialExit(Self);
    end;
end;

procedure TFContratoParam.Sb20CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      Me20CodCadastro.text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;
      Me20CodCadastroExit(Self);
    end;

end;

procedure TFContratoParam.Me20CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me20CodProduto.text)<>'' then
    Me20Produto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Me20CodProduto.text,True)
  else
    Me20Produto.Clear;

end;

procedure TFContratoParam.SpeedButton45Click(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  if FContrato_VendaCons.ShowModal = mrOk then
     Me20Contrato.Text := DMContrato.QContrato_VendConsNum_Contrato.Text;
end;

procedure TFContratoParam.Sb20ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons=nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    begin
      Me20CodProduto.text:=DMProduto.QProdutoConsCOD_PRODUTO.text;
      Me20CodProdutoExit(Self);
    end;
end;

procedure TFContratoParam.Me1CreditoSementeChange(Sender: TObject);
begin
  inherited;
  If Trim(Me1CreditoSemente.Text) <> '' Then
    If StrToFloat(Trim(Me1CreditoSemente.Text)) > DMContrato.QContratoConsQt_Quantidade.Value Then
       Me1Cobrado.Text := '0'
    Else
       Me1Cobrado.Text := FloatToStr(DMContrato.QContratoConsQt_Quantidade.Value - StrToFloat(Trim(Me1CreditoSemente.Text)));

end;

procedure TFContratoParam.Me2ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(Me2ContaCorrente.text)  <> '' then
    EdContaCorrente.text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+trim(Me2ContaCorrente.text),True)
  else
    EdContaCorrente.Clear;

end;

procedure TFContratoParam.SpeedButton43Click(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOk then
    begin
      Me2ContaCorrente.Text:=DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Text;
      Me2ContaCorrenteExit(Self);
    end;
end;

procedure TFContratoParam.Me5QtCreditoChange(Sender: TObject);
begin
  inherited;
  If Trim(Me5QtCredito.Text) <> '' Then
    If StrToFloat(Trim(Me5QtCredito.Text)) > DMContrato.QContrato_GpConsQt_Quantidade.Value Then
       Me1Cobrado.Text := '0'
    Else
       Me1Cobrado.Text := FloatToStr(DMContrato.QContrato_GPConsQt_Quantidade.Value - StrToFloat(Trim(Me5QtCredito.Text)));
end;

procedure TFContratoParam.Bt5ConsContaCorrenteClick(Sender: TObject);
Var wBanco : String;
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
   Begin
     If DMCadastro.QCadastroConsCod_Banco_Agencia.Text <> '' Then
        wBanco := DMOracle.BuscaNome('SELECT COD_BANCO FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+DMCadastro.QCadastroConsCod_Banco_Agencia.Text);
     Me5ContaCorrente.Text := 'Titular:'+DMCadastro.QCadastroConsNome_Titular.Value +' Cpf:'+DMCadastro.QCadastroConsDesc_Complemento.Value +
                          ' Banco.:' + wBanco + ' Agencia:'+DMCadastro.QCadastroConsDesc_Agencia.Text +
                          ' Conta.:' + DMCadastro.QCadastroConsDesc_Conta_Corrente.Text;
   End;

end;

procedure TFContratoParam.Sb8ClasseClick(Sender: TObject);
begin
  inherited;
  if FClasseCons = nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = mrOK then
   Begin
      Me8Classe.text:=DMClasse.QClasseConsNum_Classe.Text;
      Me8SubClasse.text:=DMClasse.QClasseConsNum_SubClasse.Text;
      Ed8Classe.Text:=DMClasse.QClasseConsDesc_Classe.Text;
   End;

end;

procedure TFContratoParam.Me5ParceiroChange(Sender: TObject);
begin
  inherited;
  if Trim(Me5Parceiro.text)<>'' then
    Ed5Parceiro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Me5Parceiro.text,True)
  else
    Ed5Parceiro.Clear;
end;

procedure TFContratoParam.Me1ParceiroChange(Sender: TObject);
begin
  inherited;
  if Trim(Me1Parceiro.text) <> '' then
    Ed1Parceiro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Me1Parceiro.text,True)
  else
    Ed1Parceiro.Clear;

end;

procedure TFContratoParam.Me2FinalidadeExit(Sender: TObject);
begin
  inherited;
  if trim(Me2Finalidade.text)  <> '' then
    Ed2Finalidade.text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+trim(Me2Finalidade.text),True)
  else
    Ed2Finalidade.Clear;

end;

procedure TFContratoParam.Sb2HistoricoClick(Sender: TObject);
begin
  inherited;
  if FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal = mrOk then
    begin
      Me2Finalidade.Text:=DMFinalidade.QFinalidadeConsCOD_FINALIDADE.Text;
      Me2FinalidadeExit(Self);
    end;

end;

procedure TFContratoParam.Rg2TipoBaixaExit(Sender: TObject);
begin
  inherited;
    If DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'GONZATTI' Then
    If Rg2TipoBaixa.ItemIndex = 2 Then
       Me2Finalidade.Text := '418'
    Else
       Me2Finalidade.Text := '417';
end;

procedure TFContratoParam.Sb24ContratoClick(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  if FContrato_VendaCons.ShowModal = mrOk then
     Me24Contrato.Text := DMContrato.QContrato_VendConsCod_Contrato_Vend.Text;

end;

procedure TFContratoParam.BtBuscaContratoCpr25Click(Sender: TObject);
begin
  inherited;
  if FContratoCPRCons = nil then
    FContratoCPRCons := TFContratoCPRCons.Create(Application);

  if FContratoCPRCons.ShowModal = mrOk then
  begin
    MeCodContratoCpr25.Text := DMContrato_CPR.QContrato_CPRConsCOD_CONTRATO_CPR.Text;
    MeDescContratoCpr25.Text := DMContrato_CPR.QContrato_CPRConsNOME.Value;
  end;

end;

end.
