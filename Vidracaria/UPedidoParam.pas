unit UPedidoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, DBCtrls, Mask,
  UFmProduto, UFmClasse, Grids, DBGrids, ImgList, UFmDatas, UFmRegiao,
  UFmCadastro;

type
  TFPedidoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Fornecedor: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bt0Fornecedor: TBitBtn;
    ME0Cadastro: TMaskEdit;
    BtConsProduto: TBitBtn;
    ME0Produto: TMaskEdit;
    CB0Ordem: TComboBox;
    Bt0ConsFilial: TBitBtn;
    ME0Filial: TMaskEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    ME0DataI: TMaskEdit;
    ME0DataF: TMaskEdit;
    Ed0Filial: TEdit;
    Ed0Cadastro: TEdit;
    Ed0Produto: TEdit;
    Label6: TLabel;
    Bt0Vendedor: TBitBtn;
    ME0Vendedor: TMaskEdit;
    Ed0Vendedor: TEdit;
    TabSheet2: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Bt1Cadastro: TBitBtn;
    ME1Cadastro: TMaskEdit;
    Bt1Produto: TBitBtn;
    ME1Produto: TMaskEdit;
    Bt1Filial: TBitBtn;
    ME1Filial: TMaskEdit;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    ME1DataI: TMaskEdit;
    ME1DataF: TMaskEdit;
    Ed1Filial: TEdit;
    Ed1Cadastro: TEdit;
    Ed1produto: TEdit;
    Bt1Vendedor: TBitBtn;
    ME1Vendedor: TMaskEdit;
    Ed1Vendedor: TEdit;
    TabSheet3: TTabSheet;
    Label9: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Bt2Cadastro: TBitBtn;
    ME2Cadastro: TMaskEdit;
    Bt2Produto: TBitBtn;
    ME2Produto: TMaskEdit;
    Bt2Filial: TBitBtn;
    ME2Filial: TMaskEdit;
    GroupBox3: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    ME2DataI: TMaskEdit;
    ME2DataF: TMaskEdit;
    Ed2Filial: TEdit;
    Ed2Cadastro: TEdit;
    Ed2Produto: TEdit;
    Bt2Vendedor: TBitBtn;
    ME2Vendedor: TMaskEdit;
    Ed2Vendedor: TEdit;
    TabSheet4: TTabSheet;
    Label19: TLabel;
    ME4Filial: TMaskEdit;
    BtnFilialCons: TBitBtn;
    Ed4Filial: TEdit;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    ME4Data_I: TMaskEdit;
    ME4Data_F: TMaskEdit;
    TabSheet5: TTabSheet;
    Label22: TLabel;
    ME5Filial: TMaskEdit;
    Btn5Filial: TBitBtn;
    Ed5Filial: TEdit;
    Label25: TLabel;
    ME5Vendedor: TMaskEdit;
    Btn5Vendedor: TBitBtn;
    Ed5Vendedor: TEdit;
    GroupBox5: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    ME5Data_I: TMaskEdit;
    ME5Data_F: TMaskEdit;
    TabSheet6: TTabSheet;
    ME6Filial: TMaskEdit;
    Label26: TLabel;
    Ed6Filial: TEdit;
    Label27: TLabel;
    ME6Produto: TMaskEdit;
    Bt6Produto: TBitBtn;
    Ed6Produto: TEdit;
    Label28: TLabel;
    ME6Vendedor: TMaskEdit;
    Bt6Vendedor: TBitBtn;
    Ed6Vendedor: TEdit;
    GroupBox6: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    ME6DataI: TMaskEdit;
    ME6DataF: TMaskEdit;
    Bt6Filial: TBitBtn;
    TabSheet7: TTabSheet;
    ME7Filial: TMaskEdit;
    Label31: TLabel;
    BT7Filial: TBitBtn;
    ED7Filial: TEdit;
    Label32: TLabel;
    ME7Cadastro: TMaskEdit;
    BT7Cadastro: TBitBtn;
    ED7Cadastro: TEdit;
    Label33: TLabel;
    ME7Produto: TMaskEdit;
    BT7Produto: TBitBtn;
    ED7Produto: TEdit;
    GroupBox7: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    ME7DataI: TMaskEdit;
    ME7DataF: TMaskEdit;
    TabSheet8: TTabSheet;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    BitBtn1: TBitBtn;
    Me8Cadastro: TMaskEdit;
    BitBtn2: TBitBtn;
    Me8Produto: TMaskEdit;
    BitBtn3: TBitBtn;
    Me8Filial: TMaskEdit;
    GroupBox8: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    Me8Data_I: TMaskEdit;
    Me8Data_f: TMaskEdit;
    Ed8Filial: TEdit;
    Ed8Cadastro: TEdit;
    Ed8Produto: TEdit;
    BitBtn4: TBitBtn;
    Me8Vendedor: TMaskEdit;
    Ed8Vendedor: TEdit;
    Label42: TLabel;
    Me8Classe: TMaskEdit;
    ME8SubClasse: TMaskEdit;
    Label43: TLabel;
    Bt8Classe: TBitBtn;
    Ed8Classe: TEdit;
    Rg0TipoPagto: TRadioGroup;
    Label44: TLabel;
    Label45: TLabel;
    Me0Classe: TMaskEdit;
    Me0SubClasse: TMaskEdit;
    Bt0Classe: TBitBtn;
    Ed0Classe: TEdit;
    Label46: TLabel;
    Rg1TipoPagto: TRadioGroup;
    RGOrdem: TRadioGroup;
    TabSheet9: TTabSheet;
    Label186: TLabel;
    ME34Filial: TMaskEdit;
    BT34Filial: TBitBtn;
    Ed34Filial: TEdit;
    Ed34Cadastro: TEdit;
    BT34Cadastro: TBitBtn;
    ME34Cadastro: TMaskEdit;
    Cadastro: TLabel;
    Label187: TLabel;
    ME34Vendedor: TMaskEdit;
    BT34Vendedor: TBitBtn;
    Ed34Vendedor: TEdit;
    GroupBox33: TGroupBox;
    ME34DT_Emissao_F: TMaskEdit;
    ME34DT_Emissao_I: TMaskEdit;
    Label48: TLabel;
    Me4Cadastro: TMaskEdit;
    Bt4ConsCadastro: TBitBtn;
    Ed4Cadastro: TEdit;
    Label49: TLabel;
    Me5Cadastro: TMaskEdit;
    Bt5ConsCadastro: TBitBtn;
    Ed5Cadastro: TEdit;
    Label51: TLabel;
    Label54: TLabel;
    Me8Cultura: TMaskEdit;
    Bt8Cultura: TBitBtn;
    Ed8Cultura: TEdit;
    Label55: TLabel;
    Me1Cultura: TMaskEdit;
    Bt1Cultura: TBitBtn;
    Ed1Cultura: TEdit;
    Rg8Ordem: TRadioGroup;
    TabSheet10: TTabSheet;
    ME9Filial: TMaskEdit;
    ME9Cadastro: TMaskEdit;
    SB9Filial: TSpeedButton;
    SB9Cadastro: TSpeedButton;
    Ed9Filial: TEdit;
    Ed9Cadastro: TEdit;
    Label58: TLabel;
    Label59: TLabel;
    GroupBox9: TGroupBox;
    ME9DtInicial: TMaskEdit;
    ME9DtFinal: TMaskEdit;
    Label60: TLabel;
    Label61: TLabel;
    TabSheet11: TTabSheet;
    Label62: TLabel;
    ME10Filial: TMaskEdit;
    SB10Filial: TSpeedButton;
    Ed10Filial: TEdit;
    GroupBox10: TGroupBox;
    Label63: TLabel;
    Label64: TLabel;
    ME10Dt_inicial: TMaskEdit;
    ME10Dt_Final: TMaskEdit;
    TabSheet12: TTabSheet;
    Label65: TLabel;
    ME11Filial: TMaskEdit;
    SB11Filial: TBitBtn;
    Ed11Filial: TEdit;
    Label66: TLabel;
    ME11Vendedor: TMaskEdit;
    SB11Vendedor: TBitBtn;
    Ed11Vendedor: TEdit;
    GroupBox11: TGroupBox;
    Label67: TLabel;
    Label68: TLabel;
    ME11Data_I: TMaskEdit;
    ME11Data_F: TMaskEdit;
    RG11TipoRelatorio: TRadioGroup;
    RG11TipoPagamento: TRadioGroup;
    TabSheet13: TTabSheet;
    Label69: TLabel;
    ME12Filial: TMaskEdit;
    SB12Filial: TBitBtn;
    Ed12Filial: TEdit;
    Label70: TLabel;
    ME12Vendedor: TMaskEdit;
    SB12Vendedor: TBitBtn;
    Ed12Vendedor: TEdit;
    GroupBox12: TGroupBox;
    Label71: TLabel;
    Label72: TLabel;
    ME12DtInicial: TMaskEdit;
    ME12DtFinal: TMaskEdit;
    TabSheet14: TTabSheet;
    Label74: TLabel;
    Label75: TLabel;
    Me13Filial: TMaskEdit;
    Sb13Filial: TBitBtn;
    Ed13Filial: TEdit;
    Me13Vendedor: TMaskEdit;
    Sb13Vendedor: TBitBtn;
    Ed13Vendedor: TEdit;
    GroupBox13: TGroupBox;
    Label76: TLabel;
    Label77: TLabel;
    Me13DtInicial: TMaskEdit;
    Me13DtFinal: TMaskEdit;
    Label78: TLabel;
    Me13Classe: TMaskEdit;
    Sb13Classe: TBitBtn;
    Ed13Classe: TEdit;
    Ed12Supervisor: TEdit;
    SB12Supervisor: TSpeedButton;
    ME12Supervisor: TMaskEdit;
    Label79: TLabel;
    Rg9Situacao: TRadioGroup;
    SB4Origem: TSpeedButton;
    ME4Origem: TMaskEdit;
    Label81: TLabel;
    ME0Operacao1: TMaskEdit;
    SB0Operacao1: TSpeedButton;
    Label84: TLabel;
    Label87: TLabel;
    ME34Motivo: TMaskEdit;
    SB34Motivo: TSpeedButton;
    Ed34Motivo: TEdit;
    Label88: TLabel;
    ME34Operacao1: TMaskEdit;
    SB34Operacao1: TSpeedButton;
    ME34Operacao2: TMaskEdit;
    Label89: TLabel;
    SB34Operacao2: TSpeedButton;
    ME34Operacao3: TMaskEdit;
    Label90: TLabel;
    SB34Operacao3: TSpeedButton;
    ME34Operacao4: TMaskEdit;
    Label91: TLabel;
    SB34Operacao4: TSpeedButton;
    Label92: TLabel;
    Me12Classe: TMaskEdit;
    Bt12Classe: TBitBtn;
    Ed12Classe: TEdit;
    Label93: TLabel;
    Me12SubClasse: TMaskEdit;
    Bt12SubClasse: TBitBtn;
    Ed12SubClasse: TEdit;
    Label94: TLabel;
    ME1Classe: TMaskEdit;
    SB1Classe: TBitBtn;
    Ed1Classe: TEdit;
    TabSheet15: TTabSheet;
    Label95: TLabel;
    Me14CodFilial: TMaskEdit;
    Bt14ConsFilial: TBitBtn;
    Ed14DescFilial: TEdit;
    Label96: TLabel;
    Me14CodClasse: TMaskEdit;
    Ed14DescClasse: TEdit;
    Bt14ConsClasse: TBitBtn;
    Label97: TLabel;
    Me14SubClasse: TMaskEdit;
    Bt14SubClasse: TBitBtn;
    Ed14SubClasse: TEdit;
    GroupBox14: TGroupBox;
    Label98: TLabel;
    Label99: TLabel;
    Me14Data_I: TMaskEdit;
    Me14Data_F: TMaskEdit;
    Label100: TLabel;
    ME1Lote: TMaskEdit;
    Bt1Lote: TBitBtn;
    Ed1Lote: TEdit;
    RGSituacao: TRadioGroup;
    Me1SubClasse: TMaskEdit;
    Label101: TLabel;
    Rg6TipoPagamento: TRadioGroup;
    Rg4TipoPagamento: TRadioGroup;
    Rg5TipoPagamento: TRadioGroup;
    Fm5Produto: TFmProduto;
    GroupBox15: TGroupBox;
    Label102: TLabel;
    Label103: TLabel;
    ME4Entrega_I: TMaskEdit;
    ME4Entrega_F: TMaskEdit;
    ME0Regiao: TMaskEdit;
    Ed0Regiao: TEdit;
    SB0Regiao: TSpeedButton;
    Label47: TLabel;
    GroupBox16: TGroupBox;
    Label50: TLabel;
    Label52: TLabel;
    ME0DtEntregaI: TMaskEdit;
    ME0DtEntregaF: TMaskEdit;
    TabSheet16: TTabSheet;
    FmCadastro15: TFmCadastro;
    FmRegiao15: TFmRegiao;
    FmDatas15: TFmDatas;
    TabSheet17: TTabSheet;
    FmCadastro16: TFmCadastro;
    FmRegiao16: TFmRegiao;
    GB16Periodo: TGroupBox;
    Label53: TLabel;
    Label56: TLabel;
    ME16DtInicial: TMaskEdit;
    ME16DtFinal: TMaskEdit;
    Rg15Ponto: TRadioGroup;
    procedure ME0FilialExit(Sender: TObject);
    procedure ME0CadastroExit(Sender: TObject);
    procedure ME0ProdutoExit(Sender: TObject);
    procedure Bt0ConsFilialClick(Sender: TObject);
    procedure Bt0FornecedorClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ME0VendedorExit(Sender: TObject);
    procedure Bt0VendedorClick(Sender: TObject);
    procedure ME1FilialExit(Sender: TObject);
    procedure ME1CadastroExit(Sender: TObject);
    procedure ME1ProdutoExit(Sender: TObject);
    procedure ME1VendedorExit(Sender: TObject);
    procedure Bt1FilialClick(Sender: TObject);
    procedure Bt1CadastroClick(Sender: TObject);
    procedure Bt1ProdutoClick(Sender: TObject);
    procedure Bt1VendedorClick(Sender: TObject);
    procedure Bt2FilialClick(Sender: TObject);
    procedure Bt2CadastroClick(Sender: TObject);
    procedure Bt2ProdutoClick(Sender: TObject);
    procedure Bt2VendedorClick(Sender: TObject);
    procedure ME2FilialExit(Sender: TObject);
    procedure ME2CadastroExit(Sender: TObject);
    procedure ME2ProdutoExit(Sender: TObject);
    procedure ME2VendedorExit(Sender: TObject);
    procedure ME4FilialExit(Sender: TObject);
    procedure BtnFilialConsClick(Sender: TObject);
    procedure ME5FilialExit(Sender: TObject);
    procedure Btn5FilialClick(Sender: TObject);
    procedure ME5VendedorExit(Sender: TObject);
    procedure Btn5VendedorClick(Sender: TObject);
    procedure ME6FilialExit(Sender: TObject);
    procedure Bt6FilialClick(Sender: TObject);
    procedure ME6ProdutoExit(Sender: TObject);
    procedure Bt6ProdutoClick(Sender: TObject);
    procedure ME6VendedorExit(Sender: TObject);
    procedure Bt6VendedorClick(Sender: TObject);
    procedure BT7FilialClick(Sender: TObject);
    procedure BT7CadastroClick(Sender: TObject);
    procedure BT7ProdutoClick(Sender: TObject);
    procedure ME7ProdutoExit(Sender: TObject);
    procedure ME7FilialChange(Sender: TObject);
    procedure ME7ProdutoChange(Sender: TObject);
    procedure Me8FilialExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Me8CadastroExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Me8ProdutoExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Me8VendedorExit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Me8ClasseExit(Sender: TObject);
    procedure ME8SubClasseExit(Sender: TObject);
    procedure Bt8ClasseClick(Sender: TObject);
    procedure Bt0ClasseClick(Sender: TObject);
    procedure Me0ClasseExit(Sender: TObject);
    procedure Me0SubClasseExit(Sender: TObject);
    procedure BT34FilialClick(Sender: TObject);
    procedure BT34CadastroClick(Sender: TObject);
    procedure BT34VendedorClick(Sender: TObject);
    procedure ME34FilialExit(Sender: TObject);
    procedure ME34CadastroExit(Sender: TObject);
    procedure ME34VendedorExit(Sender: TObject);
    procedure Bt4ConsCadastroClick(Sender: TObject);
    procedure Bt5ConsCadastroClick(Sender: TObject);
    procedure Bt8CulturaClick(Sender: TObject);
    procedure Me8CulturaExit(Sender: TObject);
    procedure Me1CulturaExit(Sender: TObject);
    procedure Bt1CulturaClick(Sender: TObject);
    procedure Me4CadastroExit(Sender: TObject);
    procedure Me5CadastroExit(Sender: TObject);
    procedure ME7CadastroExit(Sender: TObject);
    procedure SB9CadastroClick(Sender: TObject);
    procedure SB9FilialClick(Sender: TObject);
    procedure ME9FilialExit(Sender: TObject);
    procedure ME9CadastroExit(Sender: TObject);
    procedure ME10FilialExit(Sender: TObject);
    procedure SB10FilialClick(Sender: TObject);
    procedure ME11FilialExit(Sender: TObject);
    procedure SB11FilialClick(Sender: TObject);
    procedure SB11VendedorClick(Sender: TObject);
    procedure ME11VendedorExit(Sender: TObject);
    procedure SB12FilialClick(Sender: TObject);
    procedure SB12VendedorClick(Sender: TObject);
    procedure ME12FilialExit(Sender: TObject);
    procedure ME12VendedorExit(Sender: TObject);
    procedure Me13FilialExit(Sender: TObject);
    procedure Sb13FilialClick(Sender: TObject);
    procedure Me13VendedorExit(Sender: TObject);
    procedure Sb13VendedorClick(Sender: TObject);
    procedure Me13ClasseExit(Sender: TObject);
    procedure Sb13ClasseClick(Sender: TObject);
    procedure SB12SupervisorClick(Sender: TObject);
    procedure ME12SupervisorExit(Sender: TObject);
    procedure SB4OrigemClick(Sender: TObject);
    procedure SB0Operacao1Click(Sender: TObject);
    procedure ME34CadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ME9CadastroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Me12ClasseExit(Sender: TObject);
    procedure Bt12ClasseClick(Sender: TObject);
    procedure Me12SubClasseExit(Sender: TObject);
    procedure Bt12SubClasseClick(Sender: TObject);
    procedure ME1ClasseExit(Sender: TObject);
    procedure SB1ClasseClick(Sender: TObject);
    procedure Me14CodFilialExit(Sender: TObject);
    procedure Bt14ConsFilialClick(Sender: TObject);
    procedure Me14CodClasseExit(Sender: TObject);
    procedure Bt14ConsClasseClick(Sender: TObject);
    procedure Me14SubClasseExit(Sender: TObject);
    procedure Bt14SubClasseClick(Sender: TObject);
    procedure SB34MotivoClick(Sender: TObject);
    procedure ME34MotivoExit(Sender: TObject);
    procedure ME1LoteExit(Sender: TObject);
    procedure Bt1LoteClick(Sender: TObject);
    procedure Me1SubClasseExit(Sender: TObject);
    procedure SB0RegiaoClick(Sender: TObject);
    procedure ME0RegiaoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPedidoParam: TFPedidoParam;

implementation

uses UFilial_cl, UCadastro_cl, UProduto_cl, UFilialCons, UCadastroCons,
  UProdutoCons, UVendedor_cl, UVendedorCons, UUsuario_cl, UPedido_cl,
   UOracle_cl, UClasseCons, UClasse_cl, UTipoLote_cl,
  UTipoLoteCons, UCulturaCons, UCultura_cl, UEstadoCons, UEstado_cl,
  UParamSistema_cl, UNotaSaida_cl, UDepartamentoCons, UDepartamento_cl,
  UMotivoCons, UMotivo_cl, UOperacaoCons, UOperacao_cl, URegiaoCons,
  URegiao_cl;

{$R *.DFM}

procedure TFPedidoParam.ME0FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Filial.Text) <> '' then
    Ed0Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                         'COD_FILIAL = '+Trim(Me0Filial.Text))
  Else
    Ed0Filial.Text := 'Todos';
end;

procedure TFPedidoParam.ME0CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Cadastro.Text) <> '' then
   Begin
    Ed0Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                           'COD_CADASTRO = '+Trim(ME0Cadastro.Text));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
      DMNotaSaida.MostraMsg(StrToInt(Trim(ME0Cadastro.Text)));
   End
  Else
    Ed0Cadastro.Text := 'Todos';
end;

procedure TFPedidoParam.ME0ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Produto.Text) <> '' then
    Ed0Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                          'COD_PRODUTO = '+Trim(ME0Produto.Text))
  Else
    Ed0Produto.Text := 'Todos';
end;

procedure TFPedidoParam.Bt0ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME0FilialExit(Self);
  End;
end;

procedure TFPedidoParam.Bt0FornecedorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME0Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME0CadastroExit(Self);
  End;
end;

procedure TFPedidoParam.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    ME0Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME0ProdutoExit(Self);
  End;
end;

procedure TFPedidoParam.FormCreate(Sender: TObject);
begin
  inherited;
  ME0DataI.Text := DateToStr(Date-60);
  ME0DataF.Text := DateToStr(Date);
  CB0Ordem.ItemIndex := 0;
  ME0Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME0FilialExit(Self);
  ME1Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME1FilialExit(Self);
  ME1DataI.Text := DateToStr(Date-30);
  ME1DataF.Text := DateToStr(Date);
  ME2Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME2FilialExit(Self);
  ME2DataI.Text := DateToStr(Date-30);
  ME2DataF.Text := DateToStr(Date);
end;

procedure TFPedidoParam.ME0VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Vendedor.Text) <> '' then
    Ed0Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME0Vendedor.Text))
  Else
    Ed0Vendedor.Text := 'Todos';
end;

procedure TFPedidoParam.Bt0VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME0Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME0VendedorExit(Self);
  End;
end;

procedure TFPedidoParam.ME1FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Filial.Text) <> '' then
    Ed1Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                         'COD_FILIAL = '+Trim(Me1Filial.Text))
  Else
    Ed1Filial.Text := 'Todos';
end;

procedure TFPedidoParam.ME1CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Cadastro.Text) <> '' then
   Begin
    Ed1Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                           'COD_CADASTRO = '+Trim(Me1Cadastro.Text));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
      DMNotaSaida.MostraMsg(StrToInt(Trim(ME1Cadastro.Text)));
   End
  Else
    Ed1Cadastro.Text := 'Todos';
end;

procedure TFPedidoParam.ME1ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Produto.Text) <> '' then
   Ed1Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                         'COD_PRODUTO = '+Trim(ME1Produto.Text))
  Else
    Ed1Produto.Text := 'Todos';
end;

procedure TFPedidoParam.ME1VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Vendedor.Text) <> '' then
    Ed1Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME1Vendedor.Text))
  Else
    Ed1Vendedor.Text := 'Todos';
end;

procedure TFPedidoParam.Bt1FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME1Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME1FilialExit(Self);
  End;
end;

procedure TFPedidoParam.Bt1CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME1Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME1CadastroExit(Self);
  End;
end;

procedure TFPedidoParam.Bt1ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    ME1Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME1ProdutoExit(Self);
  End;
end;

procedure TFPedidoParam.Bt1VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME1Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME1VendedorExit(Self);
  End;
end;

procedure TFPedidoParam.Bt2FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME2Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME2FilialExit(Self);
  End;
end;

procedure TFPedidoParam.Bt2CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME2Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME2CadastroExit(Self);
  End;
end;

procedure TFPedidoParam.Bt2ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    ME2Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME2ProdutoExit(Self);
  End;
end;

procedure TFPedidoParam.Bt2VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME2Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME2VendedorExit(Self);
  End;
end;

procedure TFPedidoParam.ME2FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Filial.Text) <> '' then
    Ed2Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                         'COD_FILIAL = '+Trim(Me2Filial.Text))
  Else
    Ed2Filial.Text := 'Todos';
end;

procedure TFPedidoParam.ME2CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Cadastro.Text) <> '' then
   Begin
    Ed2Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                           'COD_CADASTRO = '+Trim(Me2Cadastro.Text));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
      DMNotaSaida.MostraMsg(StrToInt(Trim(ME2Cadastro.Text)));
   End
  Else
    Ed2Cadastro.Text := 'Todos';
end;

procedure TFPedidoParam.ME2ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Produto.Text) <> '' then
    Ed2Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                          'COD_PRODUTO = '+Trim(ME2Produto.Text))
  Else
    Ed2Produto.Text := 'Todos';
end;

procedure TFPedidoParam.ME2VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Vendedor.Text) <> '' then
    Ed2Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME2Vendedor.Text))
  Else
    Ed2Vendedor.Text := 'Todos';
end;

procedure TFPedidoParam.ME4FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME4Filial.Text) <> '' then
    Ed4Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                         'COD_FILIAL = '+Trim(Me4Filial.Text))
  Else
    Ed4Filial.Text := 'Todos';
end;

procedure TFPedidoParam.BtnFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME4Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME4FilialExit(Self);
  end;
end;

procedure TFPedidoParam.ME5FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME5Filial.Text) <> '' then
    Ed5Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                         'COD_FILIAL = '+Trim(Me5Filial.Text))
  Else
    Ed5Filial.Text := 'Todos';
end;

procedure TFPedidoParam.Btn5FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME5Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME5FilialExit(Self);
  end;
end;

procedure TFPedidoParam.ME5VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME5Vendedor.Text) <> '' then
    Ed5Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME5Vendedor.Text))
  Else
    Ed5Vendedor.Text := 'Todos';
end;

procedure TFPedidoParam.Btn5VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME5Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME5VendedorExit(Self);
  End;
end;

procedure TFPedidoParam.ME6FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME6Filial.Text) <> '' then
    Ed6Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                         'COD_FILIAL = '+Trim(ME6Filial.Text))
  Else
    Ed6Filial.Text := 'Todos';
end;

procedure TFPedidoParam.Bt6FilialClick(Sender: TObject);
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

procedure TFPedidoParam.ME6ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME6Produto.Text) <> '' then
    Ed6Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                          'COD_PRODUTO = '+Trim(ME6Produto.Text))
  Else
    Ed6Produto.Text := 'Todos';
end;

procedure TFPedidoParam.Bt6ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    ME6Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME6ProdutoExit(Self);
  End;
end;

procedure TFPedidoParam.ME6VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME6Vendedor.Text) <> '' then
    Ed6Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                           'COD_VENDEDOR = '+Trim(ME6Vendedor.Text))
  Else
    Ed6Vendedor.Text := 'Todos';
end;

procedure TFPedidoParam.Bt6VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME6Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME6VendedorExit(Self);
  End;
end;

procedure TFPedidoParam.BT7FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    ME7Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFPedidoParam.BT7CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    ME7Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFPedidoParam.BT7ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    ME7Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
end;

procedure TFPedidoParam.ME7ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME7Produto.Text) <> '' then
    Ed7Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                          'COD_PRODUTO = '+Trim(ME7Produto.Text))
  Else
    ED7Produto.Text := 'Todos';
end;

procedure TFPedidoParam.ME7FilialChange(Sender: TObject);
begin
  inherited;
  If Trim(ME7Filial.Text) <> '' then
   Ed7Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                        'COD_FILIAL = '+Trim(ME7Filial.Text))
  Else
    ED7Filial.Text := 'Todos';
end;

procedure TFPedidoParam.ME7ProdutoChange(Sender: TObject);
begin
  inherited;
  If Trim(ME7Produto.Text) <> '' then
    Ed7Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                          'COD_PRODUTO = '+Trim(ME7Produto.Text))
  Else
    ED7Produto.Text := 'Todos';
end;

procedure TFPedidoParam.Me8FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME8Filial.Text) <> '' then
    Ed8Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                         'COD_FILIAL = '+Trim(ME8Filial.Text))
  Else
    Ed8Filial.Text := 'Todos';
end;

procedure TFPedidoParam.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME8Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME8FilialExit(Self);
    DMFilial.QFilialCons.Close;
  End;
end;

procedure TFPedidoParam.Me8CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME8Cadastro.Text) <> '' then
   Begin
    Ed8Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                           'COD_CADASTRO = '+Trim(ME8Cadastro.Text));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
      DMNotaSaida.MostraMsg(StrToInt(Trim(ME8Cadastro.Text)));
   End
  Else
    Ed8Cadastro.Text := 'Todos';
end;

procedure TFPedidoParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME8Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME8CadastroExit(Self);
    DMCadastro.QCadastroCons.Close;
  End;
end;

procedure TFPedidoParam.Me8ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME8Produto.Text) <> '' then
    Ed8Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                          'COD_PRODUTO = '+Trim(ME8Produto.Text))
  Else
    Ed8Produto.Text := 'Todos';
end;

procedure TFPedidoParam.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    ME8Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    ME8ProdutoExit(Self);
    DMProduto.QProdutoCons.Close;
  End;
end;

procedure TFPedidoParam.Me8VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME8Vendedor.Text) <> '' then
   Ed8Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                          'COD_VENDEDOR = '+Trim(ME8Vendedor.Text))
  Else
    Ed8Vendedor.Text := 'Todos';
end;

procedure TFPedidoParam.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME8Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME8VendedorExit(Self);
    DMVendedor.QVendedorCons.Close;
  End;
end;

procedure TFPedidoParam.Me8ClasseExit(Sender: TObject);
begin
  inherited;
  ME8SubClasseExit(Self);
end;

procedure TFPedidoParam.ME8SubClasseExit(Sender: TObject);
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

procedure TFPedidoParam.Bt8ClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME8Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME8SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME8SubClasseExit(Self);
    DMClasse.QClasseCons.Close;
  End;
end;

procedure TFPedidoParam.Bt0ClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME0Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME0SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME0SubClasseExit(Self);
    DMClasse.QClasseCons.Close;
  End;
end;

procedure TFPedidoParam.Me0ClasseExit(Sender: TObject);
begin
  inherited;
  ME0SubClasseExit(Self);
end;

procedure TFPedidoParam.Me0SubClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Classe.Text) = '' Then
  Begin
    Ed0Classe.Text := 'Todos';
    ME0SubClasse.Text := '';
  End
  Else
    If Trim(ME0SubClasse.Text) = '' then
    Begin
      Ed0Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME0Classe.Text+
                                           'AND NUM_SUBCLASSE = 0');
      ME0SubClasse.Text := '0';
    End
    Else
      Ed0Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME0Classe.Text+
                                           'AND NUM_SUBCLASSE = '+ME0SubClasse.Text);
end;

procedure TFPedidoParam.BT34FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME34Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME34FilialExit(Self);
    DMFilial.QFilialCons.Close;
  End;
end;

procedure TFPedidoParam.BT34CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME34Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME34CadastroExit(Self);
    DMCadastro.QCadastroCons.Close;
  End;
end;

procedure TFPedidoParam.BT34VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME34Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME34VendedorExit(Self);
    DMVendedor.QVendedorCons.Close;
  End;
end;

procedure TFPedidoParam.ME34FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(FPedidoParam.ME34Filial.Text) <> '' Then
    Ed34Filial.Text := DMOracle.BuscaNome('SELECT Desc_Filial FROM TB_Filial',
                                          'COD_Filial = '+Trim(ME34Filial.Text))
  Else
    Ed34Filial.Text := 'Todos';

end;

procedure TFPedidoParam.ME34CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME34Cadastro.Text) <> '' Then
   Begin
    Ed34Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                            'COD_CADASTRO = '+Trim(ME34Cadastro.Text));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
      DMNotaSaida.MostraMsg(StrToInt(Trim(ME34Cadastro.Text)));
   End
  Else
    Ed34Cadastro.Text := 'Todos';
end;

procedure TFPedidoParam.ME34VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(FPedidoParam.ME34Vendedor.Text) <> '' Then
    Ed34Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME34Vendedor.Text))
  Else
    Ed34Vendedor.Text := 'Todos';
end;

procedure TFPedidoParam.Bt4ConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
     Me4Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFPedidoParam.Bt5ConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
     Me5Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFPedidoParam.Bt8CulturaClick(Sender: TObject);
begin
  inherited;
  If FCulturaCons = Nil then
    FCulturaCons := TFCulturaCons.Create(Application);
  If FCulturaCons.ShowModal = mrOk then
  Begin
    ME8Cultura.Text := DMCultura.QCulturaConsCod_Cultura.Text;
    ME8CulturaExit(Self);
  End;

end;

procedure TFPedidoParam.Me8CulturaExit(Sender: TObject);
begin
  inherited;
  If Trim(ME8Cultura.Text) <> '' then
    Ed8Cultura.Text := DMOracle.BuscaNome('SELECT DESC_CULTURA FROM TB_CULTURA',
                                         'COD_CULTURA = '+Trim(Me8Cultura.Text))
  Else
    Ed8Cultura.Text := 'Todos';

end;

procedure TFPedidoParam.Me1CulturaExit(Sender: TObject);
begin
  inherited;
  If Trim(Me1Cultura.Text) <> '' then
    Ed1Cultura.Text := DMOracle.BuscaNome('SELECT DESC_CULTURA FROM TB_CULTURA',
                                         'COD_CULTURA = '+Trim(Me1Cultura.Text))
  Else
    Ed1Cultura.Text := 'Todos';
end;

procedure TFPedidoParam.Bt1CulturaClick(Sender: TObject);
begin
  inherited;
  If FCulturaCons = Nil then
    FCulturaCons := TFCulturaCons.Create(Application);
  If FCulturaCons.ShowModal = mrOk then
  Begin
    Me1Cultura.Text := DMCultura.QCulturaConsCod_Cultura.Text;
    Me1CulturaExit(Self);
  End;

end;

procedure TFPedidoParam.Me4CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(Me4Cadastro.Text) <> '' then
   Begin
    Ed4Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                        'COD_CADASTRO = '+Me4Cadastro.Text);
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
      DMNotaSaida.MostraMsg(StrToInt(Trim(Me4Cadastro.Text)));
   End
  Else
    Ed4Cadastro.Text := 'Todos';

end;

procedure TFPedidoParam.Me5CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(Me5Cadastro.Text) <> '' then
   Begin
    Ed5Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                        'COD_CADASTRO = '+Me5Cadastro.Text);
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
      DMNotaSaida.MostraMsg(StrToInt(Trim(Me5Cadastro.Text)));
   End
  Else
    Ed5Cadastro.Text := 'Todos';

end;

procedure TFPedidoParam.ME7CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME7Cadastro.Text) <> '' then
   Begin
    Ed7Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                           'COD_CADASTRO = '+Trim(Me7Cadastro.Text));
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
      DMNotaSaida.MostraMsg(StrToInt(Trim(ME7Cadastro.Text)));
   End
  Else
    ED7Cadastro.Text := 'Todos';

end;

procedure TFPedidoParam.SB9CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    Me9Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    Ed9Cadastro.Text := DMCadastro.QCadastroConsNome.Value;
  End;
end;

procedure TFPedidoParam.SB9FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me9Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Ed9Filial.Text := DMFilial.QFilialConsDesc_Filial.Value;
  End;
end;

procedure TFPedidoParam.ME9FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(FPedidoParam.ME9Filial.Text) <> '' Then
    Ed9Filial.Text := DMOracle.BuscaNome('SELECT Desc_Filial FROM TB_Filial',
                                          'COD_Filial = '+Trim(ME9Filial.Text))
  Else
    Ed9Filial.Text := 'Todas';
end;

procedure TFPedidoParam.ME9CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME9Cadastro.Text) <> '' Then
    Ed9Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                            'COD_CADASTRO = '+Trim(ME9Cadastro.Text))
  Else
    Ed9Cadastro.Text := 'Todos';
end;

procedure TFPedidoParam.ME10FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(FPedidoParam.ME10Filial.Text) <> '' Then
    Ed10Filial.Text := DMOracle.BuscaNome('SELECT Desc_Filial FROM TB_Filial',
                                          'COD_Filial = '+Trim(ME10Filial.Text))
  Else
    Ed10Filial.Text := 'Todas';
end;

procedure TFPedidoParam.SB10FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me10Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Ed10Filial.Text := DMFilial.QFilialConsDesc_Filial.Value;
  End;
end;

procedure TFPedidoParam.ME11FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(FPedidoParam.ME11Filial.Text) <> '' then
    Ed11Filial.Text := DMOracle.BuscaNome('SELECT Desc_Filial FROM TB_Filial',
                                          'COD_Filial = '+Trim(ME11Filial.Text))
  else
    Ed11Filial.Text := 'Todas';
end;

procedure TFPedidoParam.SB11FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    Me11Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Ed11Filial.Text := DMFilial.QFilialConsDesc_Filial.Value;
  end;
end;

procedure TFPedidoParam.SB11VendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
  begin
    Me11Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    Ed11Vendedor.Text := DMVendedor.QVendedorConsNome.Value;
  end;
end;

procedure TFPedidoParam.ME11VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME11Vendedor.Text) <> '' then
    Ed11Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME11Vendedor.Text))
  Else
    Ed11Vendedor.Text := 'Todos';
end;

procedure TFPedidoParam.SB12FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    Me12Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFPedidoParam.SB12VendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    Me12Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFPedidoParam.ME12FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(FPedidoParam.ME12Filial.Text) <> '' then
    Ed12Filial.Text := DMOracle.BuscaNome('SELECT Desc_Filial FROM TB_Filial',
                                          'COD_Filial = '+Trim(ME12Filial.Text))
  else
    Ed12Filial.Text := 'Todas';
end;

procedure TFPedidoParam.ME12VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(FPedidoParam.ME12Vendedor.Text) <> '' then
    Ed12Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME12Vendedor.Text))
  Else
    Ed12Vendedor.Text := 'Todos';
end;

procedure TFPedidoParam.Me13FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(FPedidoParam.ME13Filial.Text) <> '' then
    Ed13Filial.Text := DMOracle.BuscaNome('SELECT Desc_Filial FROM TB_Filial',
                                          'COD_Filial = '+Trim(ME13Filial.Text))
  else
    Ed13Filial.Text := 'Todas';
end;

procedure TFPedidoParam.Sb13FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    Me13Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  Me13FilialExit(Self);
end;

procedure TFPedidoParam.Me13VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(Me13Vendedor.Text) <> '' then
    Ed13Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(Me13Vendedor.Text))
  Else
    Ed13Vendedor.Text := 'Todos';

end;

procedure TFPedidoParam.Sb13VendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    Me13Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
  Me13VendedorExit(self);
end;

procedure TFPedidoParam.Me13ClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(ME13Classe.Text) <> '' Then
     Ed13Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME13Classe.Text+
                                           'AND NUM_SUBCLASSE = 0')
  Else
     Ed13Classe.Text := 'Todos';
end;

procedure TFPedidoParam.Sb13ClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    ME13Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
  ME13ClasseExit(Self);
end;

procedure TFPedidoParam.SB12SupervisorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    Me12Supervisor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    Me12supervisorExit(self);
end;

procedure TFPedidoParam.ME12SupervisorExit(Sender: TObject);
begin
  inherited;
  If Trim(FPedidoParam.ME12Supervisor.Text) <> '' then
    Ed12Supervisor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                            'COD_VENDEDOR = '+Trim(ME12Supervisor.Text))
  Else
    Ed12Supervisor.Text := 'Todos';

end;

procedure TFPedidoParam.SB4OrigemClick(Sender: TObject);
begin
  inherited;
  If FEstadoCons = Nil then
     FEstadoCons := TFEstadoCons.Create(Application);
  If FEstadoCons.ShowModal = mrOk then
     ME4Origem.Text := DMEstado.QEstadoConsCod_Estado.Text;

end;

procedure TFPedidoParam.SB0Operacao1Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
     ME0Operacao1.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
end;

procedure TFPedidoParam.ME34CadastroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then // 123 = F12
     BT34Cadastro.Click;
end;

procedure TFPedidoParam.ME9CadastroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then // 123 = F12
     SB9Cadastro.Click;
end;

procedure TFPedidoParam.Me12ClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(Me12Classe.Text) <> '' Then
     Ed12Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+Me12Classe.Text+
                                           'AND NUM_SUBCLASSE = 0')
  Else
     Ed12Classe.Text := 'Todos';

end;

procedure TFPedidoParam.Bt12ClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Me12Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
  Me12ClasseExit(Self);

end;

procedure TFPedidoParam.Me12SubClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(Me12SubClasse.Text) <> '' Then
     Ed12SubClasse.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+Me12Classe.Text+
                                           'AND NUM_SUBCLASSE = '+Me12SubClasse.Text)
  Else
     Ed12SubClasse.Text := 'Todos';

end;

procedure TFPedidoParam.Bt12SubClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Me12SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
  Me12SubClasseExit(Self);

end;

procedure TFPedidoParam.ME1ClasseExit(Sender: TObject);
begin
  inherited;
  {If Trim(Me1Classe.Text) <> '' Then
     Ed1Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+Me1Classe.Text+
                                           'AND NUM_SUBCLASSE = 0')
  Else
     Ed1Classe.Text := 'Todos'; }
  ME1SubClasseExit(Self);
end;

procedure TFPedidoParam.SB1ClasseClick(Sender: TObject);
begin
  inherited;

  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME1Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME1SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME1SubClasseExit(Self);
    DMClasse.QClasseCons.Close;
  End;

end;

procedure TFPedidoParam.Me14CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(FPedidoParam.ME14CodFilial.Text) <> '' then
    Ed14DescFilial.Text := DMOracle.BuscaNome('SELECT Desc_Filial FROM TB_Filial',
                                          'COD_Filial = '+Trim(ME14CodFilial.Text))
  else
    Ed14DescFilial.Text := 'Todas';
end;

procedure TFPedidoParam.Bt14ConsFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    Me14CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
  Me14CodFilialExit(Self);
end;

procedure TFPedidoParam.Me14CodClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(Me14CodClasse.Text) <> '' Then
     Ed14DescClasse.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+Me14CodClasse.Text+
                                           'AND NUM_SUBCLASSE = 0')
  Else
     Ed12Classe.Text := 'Todos';
end;

procedure TFPedidoParam.Bt14ConsClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Me14CodClasse.Text := DMClasse.QClasseConsNum_Classe.Text;
  Me14CodClasseExit(Self);
end;

procedure TFPedidoParam.Me14SubClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(Me14SubClasse.Text) <> '' Then
     Ed14SubClasse.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+Me14CodClasse.Text+
                                           'AND NUM_SUBCLASSE = '+Me14SubClasse.Text)
  Else
     Ed12SubClasse.Text := 'Todos';

end;

procedure TFPedidoParam.Bt14SubClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Me14SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
  Me14SubClasseExit(Self);
end;

procedure TFPedidoParam.SB34MotivoClick(Sender: TObject);
begin
  inherited;
  If FMotivoCons = Nil then
     FMotivoCons := TFMotivoCons.Create(Application);
  If FMotivoCons.ShowModal = mrOk then
     ME34Motivo.Text := DMMotivo.QMotivoConsCod_Motivo.Text;
     ME34MotivoExit(self);
end;

procedure TFPedidoParam.ME34MotivoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me34Motivo.Text) <> '' Then
    Ed34Motivo.Text := DMOracle.BuscaNome('SELECT DESC_MOTIVO FROM TB_MOTIVO',
                                           'COD_MOTIVO = '+Trim(Me34Motivo.Text))
  Else
    Ed34Motivo.Text := 'Todos';
end;

procedure TFPedidoParam.ME1LoteExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Lote.Text) <> '' then
    Ed1Lote.Text := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO',
                                         'COD_LOTE_TIPO = '+Trim(Me1Lote.Text))
  Else
    Ed1Lote.Text := 'Todos';
end;

procedure TFPedidoParam.Bt1LoteClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOk then
  Begin
    ME1Lote.Text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
    ME1LoteExit(Self);
  End;
end;

procedure TFPedidoParam.Me1SubClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Classe.Text) = '' Then
  Begin
    Ed1Classe.Text := 'Todos';
    ME1SubClasse.Text := '';
  End
  Else
    If Trim(ME1SubClasse.Text) = '' then
    Begin
      Ed1Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME1Classe.Text+
                                           'AND NUM_SUBCLASSE = 0');
      ME1SubClasse.Text := '0';
    End
    Else
      Ed1Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME1Classe.Text+
                                           'AND NUM_SUBCLASSE = '+ME1SubClasse.Text);
end;

procedure TFPedidoParam.SB0RegiaoClick(Sender: TObject);
begin
  inherited;
  If FRegiaoCons = Nil then
    FRegiaoCons := TFRegiaoCons.Create(Application);
  If FRegiaoCons.ShowModal = mrOk then
  Begin
    ME0Regiao.Text := DMRegiao.QRegiaoConsCOD_REGIAO.Text;
    ME0RegiaoExit(Self); 
  End;

end;

procedure TFPedidoParam.ME0RegiaoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Regiao.Text) <> '' then
    Ed0Regiao.Text := DMOracle.BuscaNome('SELECT DESC_REGIAO FROM TB_REGIAO',
                                           'COD_REGIAO = '+Trim(ME0Regiao.Text))
  Else
    Ed0Regiao.Text := 'Todas';

end;

end.
