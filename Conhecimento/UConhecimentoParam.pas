unit UConhecimentoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ComCtrls, ExtCtrls, Buttons, Mask, UFmFilial,
  UFmContrato, UFmProduto, UFmCadastro, UFmProprietario, UFmFinalidade,
  UFmDatas, UFmConhecimento, UFmCidade;

type
  TFConhecimentoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    EDCidade: TEdit;
    Label1: TLabel;
    CBMes: TComboBox;
    Label2: TLabel;
    MEAliquota: TMaskEdit;
    Label3: TLabel;
    EDFilial: TEdit;
    SBFilial: TSpeedButton;
    EDDesc_filial: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    TabSheet2: TTabSheet;
    ME2RPA: TMaskEdit;
    ME2Motorista: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    ME2DT_EMISSAO_I: TMaskEdit;
    ME2DT_EMISSAO_F: TMaskEdit;
    ME2Filial: TMaskEdit;
    Label9: TLabel;
    BitBtn4: TBitBtn;
    TabSheet3: TTabSheet;
    ME3Filial: TMaskEdit;
    SBFilial3: TSpeedButton;
    ED3DescFilial: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    CB3Mes: TComboBox;
    Label12: TLabel;
    RGOrdem3: TRadioGroup;
    TabSheet4: TTabSheet;
    Label13: TLabel;
    ME4Filial: TMaskEdit;
    SpeedButton1: TSpeedButton;
    ED4DescFilial: TEdit;
    CB4Mes: TComboBox;
    Label15: TLabel;
    RGOrdem4: TRadioGroup;
    ED2RPA: TEdit;
    ED2Filial: TEdit;
    ED2Motorista: TEdit;
    ME4Ano: TMaskEdit;
    Label8: TLabel;
    ME3Ano: TMaskEdit;
    Label16: TLabel;
    ME1Ano: TMaskEdit;
    Label17: TLabel;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    GroupBox3: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    ME6DtInicial: TMaskEdit;
    ME6DtFinal: TMaskEdit;
    GroupBox2: TGroupBox;
    Label19: TLabel;
    ME5DtInicial: TMaskEdit;
    ME5DtFinal: TMaskEdit;
    TabSheet7: TTabSheet;
    GroupBox4: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Me7Data_I: TMaskEdit;
    Me7Data_F: TMaskEdit;
    Rg2Tipo: TRadioGroup;
    TabSheet8: TTabSheet;
    GroupBox5: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    ME8Data_I: TMaskEdit;
    ME8Data_F: TMaskEdit;
    RG8Conhecimento: TRadioGroup;
    TabSheet9: TTabSheet;
    Label28: TLabel;
    ME9CodFilial: TMaskEdit;
    ED9DescFilial: TEdit;
    SpeedButton6: TSpeedButton;
    Label29: TLabel;
    ME9CodProprietario: TMaskEdit;
    SpeedButton7: TSpeedButton;
    ME9DescProprietario: TMaskEdit;
    GroupBox6: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    ME9DT_I: TMaskEdit;
    ME9DT_F: TMaskEdit;
    Rg3Tipo: TRadioGroup;
    Label38: TLabel;
    Label39: TLabel;
    TabSheet10: TTabSheet;
    Label40: TLabel;
    ME10CodFilial: TMaskEdit;
    SpeedButton13: TSpeedButton;
    ED10DescFilial: TEdit;
    Label41: TLabel;
    ME10CodProprietario: TMaskEdit;
    SpeedButton14: TSpeedButton;
    ED10DescProprietario: TMaskEdit;
    GroupBox7: TGroupBox;
    Label42: TLabel;
    Label45: TLabel;
    ME10DT_I: TMaskEdit;
    ME10DT_F: TMaskEdit;
    Label48: TLabel;
    Me8CodParceiro: TMaskEdit;
    SpeedButton15: TSpeedButton;
    TabSheet11: TTabSheet;
    GroupBox8: TGroupBox;
    Label51: TLabel;
    Label52: TLabel;
    ME11DtInicio: TMaskEdit;
    ME11DtFim: TMaskEdit;
    Label53: TLabel;
    SpeedButton18: TSpeedButton;
    ME11CodConhecimento: TMaskEdit;
    TabSheet12: TTabSheet;
    Label54: TLabel;
    SB12FilialCons: TSpeedButton;
    Label55: TLabel;
    SB12MotoristaCons: TSpeedButton;
    Label56: TLabel;
    SB12RPACons: TSpeedButton;
    ME12CodFilial: TMaskEdit;
    Ed12DescFilial: TEdit;
    ME12CodMotorista: TMaskEdit;
    Ed12DescMotorista: TMaskEdit;
    GB12DtEmissao: TGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    ME12Dt_Inicial: TMaskEdit;
    ME12Dt_Final: TMaskEdit;
    ME12CodRPA: TMaskEdit;
    TabSheet13: TTabSheet;
    Label59: TLabel;
    ME13CodDestino: TMaskEdit;
    Sb13DestinoCons: TSpeedButton;
    Ed13Destino: TEdit;
    GB13DtEmissao: TGroupBox;
    Label60: TLabel;
    Label61: TLabel;
    ME13EmissaoInicial: TMaskEdit;
    ME13EmissaoFinal: TMaskEdit;
    Label62: TLabel;
    Me13CodOrigem: TMaskEdit;
    Sb13OrigemCons: TSpeedButton;
    Ed13Origem: TEdit;
    RG13IndSituacao: TRadioGroup;
    Label63: TLabel;
    Sb13MotoristaCons: TSpeedButton;
    Me13CodMotorista: TMaskEdit;
    Ed13Motorista: TEdit;
    Ed13Produto: TEdit;
    Sb13ProdutoCons: TSpeedButton;
    Me13CodProduto: TMaskEdit;
    Label64: TLabel;
    Label65: TLabel;
    Sb13FilialCons: TSpeedButton;
    Me13CodFilial: TMaskEdit;
    Ed13Filial: TEdit;
    TabSheet14: TTabSheet;
    Label66: TLabel;
    Sb14FilialCons: TSpeedButton;
    Me14CodFilial: TMaskEdit;
    Ed14Filial: TEdit;
    Label67: TLabel;
    Sb14ProdutoCons: TSpeedButton;
    Me14CodProduto: TMaskEdit;
    Ed14Produto: TEdit;
    GroupBox9: TGroupBox;
    Label68: TLabel;
    Label69: TLabel;
    Me14DtInicio: TMaskEdit;
    Me14DtFim: TMaskEdit;
    Rg14Situacao: TRadioGroup;
    TabSheet15: TTabSheet;
    GroupBox10: TGroupBox;
    Label72: TLabel;
    Label73: TLabel;
    Me15DtInicial: TMaskEdit;
    Me15DtFinal: TMaskEdit;
    Label74: TLabel;
    Me14Placa: TMaskEdit;
    Label77: TLabel;
    Sb14Motorista: TSpeedButton;
    Me14Motorista: TMaskEdit;
    Ed14Motorista: TEdit;
    Label75: TLabel;
    Sb14CadastroNf: TSpeedButton;
    Me14CadastroNF: TMaskEdit;
    Ed14CadastroNF: TEdit;
    RG8TipoNota: TRadioGroup;
    Rg7Tipo: TRadioGroup;
    TabSheet16: TTabSheet;
    Label79: TLabel;
    Me16CodFilial: TMaskEdit;
    Sb16FilialCons: TSpeedButton;
    Ed16DescFilial: TEdit;
    Me16CodContrato: TMaskEdit;
    Label81: TLabel;
    Ed16DescContrato: TEdit;
    Bt16ConsContrato: TBitBtn;
    Label82: TLabel;
    Me16CodProduto: TMaskEdit;
    Sb16ConsProduto: TSpeedButton;
    Ed16DescProduto: TEdit;
    Label80: TLabel;
    Me16CodParceiro: TMaskEdit;
    Ed16DescParceiro: TEdit;
    Sb16ConsParceiro: TSpeedButton;
    GroupBox11: TGroupBox;
    Label83: TLabel;
    Label84: TLabel;
    Me16DTInicial: TMaskEdit;
    Me16DTFinal: TMaskEdit;
    TabSheet17: TTabSheet;
    Label85: TLabel;
    Me17CodFilial: TMaskEdit;
    Sb17ConsFilial: TSpeedButton;
    Ed17DescFilial: TEdit;
    Label86: TLabel;
    Me17CodCadastro: TMaskEdit;
    Sb17ConsCadastro: TSpeedButton;
    Label87: TLabel;
    Me17CodProduto: TMaskEdit;
    Sb17ConsProduto: TSpeedButton;
    Label88: TLabel;
    Me17CodParceiro: TMaskEdit;
    Sb17ConsParceiro: TSpeedButton;
    GroupBox12: TGroupBox;
    Label89: TLabel;
    Label90: TLabel;
    Me17DTInicial: TMaskEdit;
    Me17DTFinal: TMaskEdit;
    Ed17DescCadastro: TEdit;
    Ed17DescProduto: TEdit;
    Ed17DescParceiro: TEdit;
    FmFilial5: TFmFilial;
    Label20: TLabel;
    FmContrato5: TFmContrato;
    FmProduto5: TFmProduto;
    FmCadastroParceiro5: TFmCadastro;
    FmFilialDestino5: TFmFilial;
    FmFilial6: TFmFilial;
    FmCadastro6: TFmCadastro;
    FmProduto6: TFmProduto;
    FmCadastroParceiro6: TFmCadastro;
    FmFilialDestino6: TFmFilial;
    FmFilial7: TFmFilial;
    FmProprietario7: TFmProprietario;
    FmFilialDestino7: TFmFilial;
    FmFilial8: TFmFilial;
    FmCadastro8: TFmCadastro;
    FmProduto8: TFmProduto;
    FmFinalidade8: TFmFinalidade;
    FmFilialDestino8: TFmFilial;
    FmFilial11: TFmFilial;
    FmFilialDestino11: TFmFilial;
    FmFilialDestino15: TFmFilial;
    FmFilial15: TFmFilial;
    FmProprietario15: TFmProprietario;
    FmFinalidade15: TFmFinalidade;
    FmProprietario11: TFmProprietario;
    TabSheet18: TTabSheet;
    Fm17Filial: TFmFilial;
    Fm17Parceiro: TFmCadastro;
    Fm17Finalidade: TFmFinalidade;
    Fm17Contrato: TFmContrato;
    Fm17Datas: TFmDatas;
    Fm17Cadastro: TFmCadastro;
    Fm17Produto: TFmProduto;
    TabSheet19: TTabSheet;
    FmFilial18: TFmFilial;
    FmDatas18: TFmDatas;
    RGTipoCTE18: TRadioGroup;
    RGOrdem18: TRadioGroup;
    FmRemetente18: TFmCadastro;
    FmDestinatario18: TFmCadastro;
    TabSheet20: TTabSheet;
    FmFilial19: TFmFilial;
    FmDataEmissao19: TFmDatas;
    FmRemetente19: TFmCadastro;
    FmDestinatario19: TFmCadastro;
    FmConhecimento19: TFmConhecimento;
    FmCidade19: TFmCidade;
    FmDataEntrega19: TFmDatas;
    FmTomador18: TFmCadastro;
    MEPlaca: TMaskEdit;
    SBVeiculo: TSpeedButton;
    EdModelo: TEdit;
    Label14: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    FmProduto18: TFmProduto;
    TabSheet21: TTabSheet;
    FmFilial20: TFmFilial;
    FmDatas20: TFmDatas;
    Label24: TLabel;
    MePlaca20: TMaskEdit;
    SpeedButton2: TSpeedButton;
    EdModelo20: TEdit;
    RGSituacaoMDFe20: TRadioGroup;
    RGOrdem20: TRadioGroup;
    procedure SBFilialClick(Sender: TObject);
    procedure EDFilialChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SBFilial3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ME4FilialExit(Sender: TObject);
    procedure ME3FilialExit(Sender: TObject);
    procedure ME2FilialExit(Sender: TObject);
    procedure ME2MotoristaExit(Sender: TObject);
    procedure ME2RPAExit(Sender: TObject);
    procedure ME9CodFilialExit(Sender: TObject);
    procedure ME9CodProprietarioExit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure ME10CodFilialExit(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure ME10CodProprietarioExit(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure ME12CodFilialExit(Sender: TObject);
    procedure ME12CodMotoristaExit(Sender: TObject);
    procedure SB12RPAConsClick(Sender: TObject);
    procedure SB12MotoristaConsClick(Sender: TObject);
    procedure SB12FilialConsClick(Sender: TObject);
    procedure ME13CodDestinoExit(Sender: TObject);
    procedure Me13CodOrigemExit(Sender: TObject);
    procedure Sb13OrigemConsClick(Sender: TObject);
    procedure Sb13DestinoConsClick(Sender: TObject);
    procedure Me13CodFilialExit(Sender: TObject);
    procedure Sb13FilialConsClick(Sender: TObject);
    procedure Me13CodMotoristaExit(Sender: TObject);
    procedure Sb13MotoristaConsClick(Sender: TObject);
    procedure Me13CodProdutoExit(Sender: TObject);
    procedure Sb13ProdutoConsClick(Sender: TObject);
    procedure Me14CodFilialExit(Sender: TObject);
    procedure Me14CodProdutoExit(Sender: TObject);
    procedure Sb14FilialConsClick(Sender: TObject);
    procedure Sb14ProdutoConsClick(Sender: TObject);
    procedure Me14MotoristaExit(Sender: TObject);
    procedure Sb14MotoristaClick(Sender: TObject);
    procedure Me14CadastroNFExit(Sender: TObject);
    procedure Sb14CadastroNfClick(Sender: TObject);
    procedure Me16CodFilialExit(Sender: TObject);
    procedure Sb16FilialConsClick(Sender: TObject);
    procedure Me16CodContratoExit(Sender: TObject);
    procedure Bt16ConsContratoClick(Sender: TObject);
    procedure Me16CodProdutoExit(Sender: TObject);
    procedure Sb16ConsProdutoClick(Sender: TObject);
    procedure Me16CodParceiroExit(Sender: TObject);
    procedure Sb16ConsParceiroClick(Sender: TObject);
    procedure Me17CodFilialExit(Sender: TObject);
    procedure Sb17ConsFilialClick(Sender: TObject);
    procedure Me17CodCadastroExit(Sender: TObject);
    procedure Sb17ConsCadastroClick(Sender: TObject);
    procedure Me17CodProdutoExit(Sender: TObject);
    procedure Sb17ConsProdutoClick(Sender: TObject);
    procedure Me17CodParceiroExit(Sender: TObject);
    procedure Sb17ConsParceiroClick(Sender: TObject);
    procedure FmContrato1BtContratoClick(Sender: TObject);
    procedure Fm17FinalidadeBtFinalidadeClick(Sender: TObject);
    procedure Fm17ParceiroBtCadastroClick(Sender: TObject);
    procedure Fm17FilialBtFilialClick(Sender: TObject);
    procedure FmTomador18BtCadastroClick(Sender: TObject);
    procedure SBVeiculoClick(Sender: TObject);
    procedure FmRemetente18BtCadastroClick(Sender: TObject);
    procedure MEPlacaExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MePlaca20Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConhecimentoParam: TFConhecimentoParam;

implementation

uses UFilialCons, URPA_cl, UFilial_cl, UOracle_cl, UCadastroCons,
  UNotaSaidaCons, URPACons, UCadastro_cl, UNotaSaida_cl,
  UContratoVenda_Cons, Ucontrato_cl, UProprietarioCons, UProprietario_cl,
  UProdutoCons, UProduto_cl, UConhecimentoCons, UConhecimento_cl,
  UVeiculoConhecimentoCons, UVeiculoConhecimento_cl, UOrdemCompraCons, UOrdemCompra_cl,
  UOrdemCarregamentoCons, UOrdemCarregamento_cl, UNotaEntradaCons,
  UNotaEntrada_cl, UFinalidadeCons, UFinalidade_cl, UVeiculoCons,
  UVeiculo_cl;

{$R *.DFM}

procedure TFConhecimentoParam.SBFilialClick(Sender: TObject);
begin
  inherited;
   if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
     FConhecimentoParam.EDFilial.text:=IntToStr(DMFilial.QFilialConsCod_Filial.value);
end;

procedure TFConhecimentoParam.EDFilialChange(Sender: TObject);
begin
  inherited;
   if Trim(EdFilial.text)<>'' then
    EDDesc_Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+EDFilial.text)
  else
    EDDesc_Filial.Text:='Todos';
end;

procedure TFConhecimentoParam.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
  begin
    ME2Motorista.text:=IntToStr(DMCadastro.QCadastroConsCod_cadastro.value);
    ME2MotoristaExit(self);
  end;
end;

procedure TFConhecimentoParam.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
   begin
     ME2Filial.text:=IntToStr(DMFilial.QFilialConsCod_Filial.value);
     ME2FilialExit(self);
   end;
end;

procedure TFConhecimentoParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FRPACons = nil then
     FRPACons:=TFRPACons.create(application);
   if FRPACons.showmodal = mrOk then
     ME2RPA.text:=IntToStr(DMRPA.QRPAConsNUM_RPA.value);
end;

procedure TFConhecimentoParam.SBFilial3Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
   Begin
     FConhecimentoParam.ME3Filial.text:=IntToStr(DMFilial.QFilialConsCod_Filial.value);
     ME3FilialExit(self);
   end;
end;

procedure TFConhecimentoParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
   begin
     FConhecimentoParam.ME4Filial.text:=IntToStr(DMFilial.QFilialConsCod_Filial.value);
     ME4FilialExit(self);
   end;
end;

procedure TFConhecimentoParam.ME4FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME4Filial.text) <> '' then
    ED4DescFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME4Filial.text)
  else
    ED4DescFilial.Text:='Todas';
end;

procedure TFConhecimentoParam.ME3FilialExit(Sender: TObject);
begin
  inherited;
   if Trim(ME3Filial.text) <> '' then
    ED3DescFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME3Filial.text)
  else
    ED3DescFilial.Text:='Todas';
end;

procedure TFConhecimentoParam.ME2FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME2Filial.text) <> '' then
    ED2Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME2Filial.text)
  else
    ED2Filial.Text:='Todas';
end;

procedure TFConhecimentoParam.ME2MotoristaExit(Sender: TObject);
begin
  inherited;
  if Trim(ME2Motorista.text) <> '' then
    ED2Motorista.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME2Motorista.text)
  else
    ED2Motorista.Text:='Todas';
end;

procedure TFConhecimentoParam.ME2RPAExit(Sender: TObject);
begin
  inherited;
  if Trim(ME2RPA.text) <> '' then
    ED2RPA.Text:=DMOracle.BuscaNome('SELECT DESC_OBSERVACAO FROM TB_RPA','COD_RPA = '+ME2RPA.text)
  else
    ED2RPA.Text:='Todas';
end;

procedure TFConhecimentoParam.ME9CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me9CodFilial.text) <> '' then
    Ed9DescFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Me9CodFilial.text)
  else
    Ed9DescFilial.Text:='Todas';
end;

procedure TFConhecimentoParam.ME9CodProprietarioExit(Sender: TObject);
begin
  inherited;
   if Trim(ME9CodProprietario.text)<>'' then
    ME9DescProprietario.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME9CodProprietario.text)
  else
    ME9DescProprietario.Clear;
end;

procedure TFConhecimentoParam.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      Me9CodProprietario.text:=DMCadastro.QCadastroConsCOD_CADASTRO.text;
      Me9CodProprietarioExit(Self);
    end;
end;

procedure TFConhecimentoParam.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
   begin
     FConhecimentoParam.Me10CodFilial.text:=IntToStr(DMFilial.QFilialConsCod_Filial.value);
     Me10CodFilialExit(self);
   end;
end;

procedure TFConhecimentoParam.ME10CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me10CodFilial.text) <> '' then
    Ed10DescFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Me10CodFilial.text)
  else
    Ed10DescFilial.Text:='Todas';
end;

procedure TFConhecimentoParam.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      Me10CodProprietario.text:=DMCadastro.QCadastroConsCOD_CADASTRO.text;
      Me10CodProprietarioExit(Self);
    end;
end;

procedure TFConhecimentoParam.ME10CodProprietarioExit(Sender: TObject);
begin
  inherited;
   if Trim(ME10CodProprietario.text)<>'' then
    ED10DescProprietario.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME10CodProprietario.text)
  else
    ED10DescProprietario.Text:='Todos';
end;

procedure TFConhecimentoParam.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
      ME8CodParceiro.text:=DMCadastro.QCadastroConsCOD_CADASTRO.text;

end;

procedure TFConhecimentoParam.SpeedButton18Click(Sender: TObject);
begin
  inherited;
  if FConhecimentoCons = nil then
     FConhecimentoCons:= TFConhecimentoCons.Create(Application);
  if FConhecimentoCons.ShowModal = mrOk then
    ME11CodConhecimento.Text := DMConhecimento.QConhecimentoConsCod_Conhecimento.Text;
end;

procedure TFConhecimentoParam.ME12CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me12CodFilial.text) <> '' then
    Ed12DescFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Me12CodFilial.text)
  else
    Ed12DescFilial.Text:='Todas';
end;

procedure TFConhecimentoParam.ME12CodMotoristaExit(Sender: TObject);
begin
  inherited;
  if Trim(ME12CodMotorista.text)<>'' then
    Ed12DescMotorista.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME12CodMotorista.text)
  else
    Ed12DescMotorista.Text := 'Todos';
end;

procedure TFConhecimentoParam.SB12RPAConsClick(Sender: TObject);
begin
  inherited;
  if FRPACons = nil then
    FRPACons := TFRPACons.create(application);
  If FRPACons.showmodal = mrOk then
  begin
    ME12CodRPA.Text := DMRPA.QRPAConsCOD_RPA.Text;
  end;
end;

procedure TFConhecimentoParam.SB12MotoristaConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
    ME12CodMotorista.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME12CodMotoristaExit(self);    
end;

procedure TFConhecimentoParam.SB12FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
   begin
     FConhecimentoParam.Me12CodFilial.text:=IntToStr(DMFilial.QFilialConsCOD_FILIAL.value);
     Me12CodFilialExit(self);
   end;
end;

procedure TFConhecimentoParam.ME13CodDestinoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME13CodDestino.text) <> '' then
    Ed13Destino.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME13CodDestino.text)
  else
    Ed13Destino.Text:='Todos';
end;

procedure TFConhecimentoParam.Me13CodOrigemExit(Sender: TObject);
begin
  inherited;
  if Trim(Me13CodOrigem.text) <> '' then
    Ed13Origem.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Me13CodOrigem.text)
  else
    Ed13Origem.Text:='Todas';
end;

procedure TFConhecimentoParam.Sb13OrigemConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
   if FCadastroCons.showmodal = mrOk then
   begin
     FConhecimentoParam.Me13CodOrigem.text:= DMCadastro.QCadastroConsCOD_CADASTRO.Text;
     Me13CodOrigemExit(self);
   end;
end;

procedure TFConhecimentoParam.Sb13DestinoConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
   if FCadastroCons.showmodal = mrOk then
   begin
     FConhecimentoParam.Me13CodDestino.text:= DMCadastro.QCadastroConsCOD_CADASTRO.Text;
     Me13CodDestinoExit(self);
   end;
end;

procedure TFConhecimentoParam.Me13CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me13CodFilial.text) <> '' then
    Ed13Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Me13CodFilial.text)
  else
    Ed13Filial.Text:='Todas';
end;

procedure TFConhecimentoParam.Sb13FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
   begin
     FConhecimentoParam.Me13CodFilial.text := DMFilial.QFilialConsCOD_FILIAL.Text;
     Me13CodFilialExit(self);
   end;
end;

procedure TFConhecimentoParam.Me13CodMotoristaExit(Sender: TObject);
begin
  inherited;
  if Trim(Me13CodMotorista.text) <> '' then
    Ed13Motorista.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Me13CodMotorista.text)
  else
    Ed13Motorista.Text:='Todos';
end;

procedure TFConhecimentoParam.Sb13MotoristaConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
   if FCadastroCons.showmodal = mrOk then
   begin
     FConhecimentoParam.Me13CodMotorista.text:= DMCadastro.QCadastroConsCOD_CADASTRO.Text;
     Me13CodMotoristaExit(self);
   end;
end;

procedure TFConhecimentoParam.Me13CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me13CodProduto.text) <> '' then
    Ed13Produto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Me13CodProduto.text)
  else
    Ed13Produto.Text:='Todos';
end;

procedure TFConhecimentoParam.Sb13ProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
     FProdutoCons:=TFProdutoCons.create(application);
   if FProdutoCons.showmodal = mrOk then
   begin
     FConhecimentoParam.Me13CodProduto.text:= DMProduto.QProdutoConsCOD_PRODUTO.Text;
     Me13CodProdutoExit(self);
   end;
end;

procedure TFConhecimentoParam.Me14CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me14CodFilial.text) <> '' then
    Ed14Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Me14CodFilial.text)
  else
    Ed14Filial.Text:='Todas';
end;

procedure TFConhecimentoParam.Me14CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me14CodProduto.text) <> '' then
    Ed14Produto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Me14CodProduto.text)
  else
    Ed14Produto.Text:='Todos';
end;

procedure TFConhecimentoParam.Sb14FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
   begin
     FConhecimentoParam.Me14CodFilial.text := DMFilial.QFilialConsCOD_FILIAL.Text;
     FConhecimentoParam.Ed14Filial.text := DMFilial.QFilialConsDESC_FILIAL.Text;
   end;
end;

procedure TFConhecimentoParam.Sb14ProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
     FProdutoCons:=TFProdutoCons.create(application);
   if FProdutoCons.showmodal = mrOk then
   begin
     FConhecimentoParam.Me14CodProduto.text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
     FConhecimentoParam.Ed14Produto.text := DMProduto.QProdutoConsDESC_PRODUTO.Text;
   end;
end;

procedure TFConhecimentoParam.Me14MotoristaExit(Sender: TObject);
begin
  inherited;
  if Trim(Me14Motorista.text) <> '' then
    Ed14Motorista.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Me14Motorista.text)
  else
    Ed14Motorista.Text:='Todos';

end;

procedure TFConhecimentoParam.Sb14MotoristaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
  begin
     FConhecimentoParam.Me14Motorista.text:= DMCadastro.QCadastroConsCOD_CADASTRO.Text;
     Me14MotoristaExit(self);
  end;

end;

procedure TFConhecimentoParam.Me14CadastroNFExit(Sender: TObject);
begin
  inherited;
  if Trim(Me14CadastroNf.text) <> '' then
    Ed14CadastroNF.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Me14CadastroNf.text)
  else
    Ed14CadastroNF.Text:='Todos';
end;

procedure TFConhecimentoParam.Sb14CadastroNfClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
  begin
     FConhecimentoParam.Me14CadastroNF.text:= DMCadastro.QCadastroConsCOD_CADASTRO.Text;
     Me14CadastroNFExit(self);
  end;

end;

procedure TFConhecimentoParam.Me16CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me16CodFilial.text) <> '' then
    Ed16DescFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Me16CodFilial.text)
  else
    Ed16DescFilial.Text:='Todas';
end;

procedure TFConhecimentoParam.Sb16FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
   begin
     FConhecimentoParam.Me16CodFilial.text:=IntToStr(DMFilial.QFilialConsCod_Filial.value);
     Me16CodFilialExit(self);
   end;
end;

procedure TFConhecimentoParam.Me16CodContratoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me16CodContrato.Text) <> '' then
    Ed16DescContrato.text:=DMOracle.BuscaNome('SELECT TB_CONTRATO_VEND.OBS FROM TB_CONTRATO_VEND','COD_CONTRATO_VEND = '+Trim(ME16CodContrato.text))
  else
    Ed16DescContrato.Text:='Todos';
end;

procedure TFConhecimentoParam.Bt16ConsContratoClick(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = Nil then
    FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  if FContrato_VendaCons.ShowModal=mrOk then
    ME16CodContrato.Text:=DMContrato.QContrato_VendConsCod_Contrato_Vend.text;
end;

procedure TFConhecimentoParam.Me16CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me16CodProduto.text)<>'' then
    Ed16DescProduto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(Me16CodProduto.text))
  else
    Ed16DescProduto.Text := 'Todos';
end;

procedure TFConhecimentoParam.Sb16ConsProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    begin
      Me16CodProduto.text:=DMProduto.QProdutoConsCOD_PRODUTO.text;
      Me16CodProdutoExit(Self);
    end;
end;

procedure TFConhecimentoParam.Me16CodParceiroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME16CodParceiro.text)<>'' then
    Ed16DescParceiro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME16CodParceiro.text)
  else
    Ed16DescParceiro.Text := 'Todos';
end;

procedure TFConhecimentoParam.Sb16ConsParceiroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      ME16CodParceiro.text:=DMCadastro.QCadastroConsCOD_CADASTRO.text;
      ME16CodParceiroExit(Self);
    end;
end;

procedure TFConhecimentoParam.Me17CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me17CodFilial.text) <> '' then
    Ed17DescFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Me17CodFilial.text)
  else
    Ed17DescFilial.Text:='Todas';
end;

procedure TFConhecimentoParam.Sb17ConsFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
   begin
     FConhecimentoParam.Me17CodFilial.text:=IntToStr(DMFilial.QFilialConsCod_Filial.value);
     Me17CodFilialExit(self);
   end;
end;

procedure TFConhecimentoParam.Me17CodCadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME17CodCadastro.text)<>'' then
    Ed17DescCadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME17CodCadastro.text)
  else
    Ed17DescCadastro.Text := 'Todos';
end;

procedure TFConhecimentoParam.Sb17ConsCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      ME17CodCadastro.text:=DMCadastro.QCadastroConsCOD_CADASTRO.text;
      ME17CodCadastroExit(Self);
    end;
end;

procedure TFConhecimentoParam.Me17CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me17CodProduto.text)<>'' then
    Ed17DescProduto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(Me17CodProduto.text))
  else
    Ed17DescProduto.Text := 'Todos';
end;

procedure TFConhecimentoParam.Sb17ConsProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    begin
      Me17CodProduto.text:=DMProduto.QProdutoConsCOD_PRODUTO.text;
      Me17CodProdutoExit(Self);
    end;
end;

procedure TFConhecimentoParam.Me17CodParceiroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME17CodParceiro.text)<>'' then
    Ed17DescParceiro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME17CodParceiro.text)
  else
    Ed17DescParceiro.Text := 'Todos';
end;

procedure TFConhecimentoParam.Sb17ConsParceiroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      ME17CodParceiro.text:=DMCadastro.QCadastroConsCOD_CADASTRO.text;
      ME17CodParceiroExit(Self);
    end;
end;

procedure TFConhecimentoParam.FmContrato1BtContratoClick(Sender: TObject);
begin
  inherited;
  Fm17Contrato.BtContratoClick(Sender);

end;

procedure TFConhecimentoParam.Fm17FinalidadeBtFinalidadeClick(
  Sender: TObject);
begin
  inherited;
  Fm17Finalidade.BtFinalidadeClick(Sender);

end;

procedure TFConhecimentoParam.Fm17ParceiroBtCadastroClick(Sender: TObject);
begin
  inherited;
  Fm17Parceiro.BtCadastroClick(Sender);

end;

procedure TFConhecimentoParam.Fm17FilialBtFilialClick(Sender: TObject);
begin
  inherited;
  Fm17Filial.BtFilialClick(Sender);

end;

procedure TFConhecimentoParam.FmTomador18BtCadastroClick(Sender: TObject);
begin
  inherited;
  FmTomador18.BtCadastroClick(Sender);

end;

procedure TFConhecimentoParam.SBVeiculoClick(Sender: TObject);
begin
  inherited;
  if FVeiculoConhecimentoCons = nil then
    FVeiculoConhecimentoCons := TFVeiculoConhecimentoCons.Create(Application);
  if FVeiculoConhecimentoCons.ShowModal = mrOk then
  begin
    MEPlaca.Text :=  DMVeiculoConhecimento.QVeiculoConsDESC_PLACA.Value;
    MEPlacaExit(Sender);
  end;
end;

procedure TFConhecimentoParam.FmRemetente18BtCadastroClick(
  Sender: TObject);
begin
  inherited;
  FmRemetente18.BtCadastroClick(Sender);

end;

procedure TFConhecimentoParam.MEPlacaExit(Sender: TObject);
begin
  inherited;
  if Trim(MEPlaca.Text) <> '' then
    EdModelo.Text := DMOracle.BuscaNome('SELECT DESC_VEICULO FROM TB_VEICULO_CONHECIMENTO','DESC_PLACA = ' + QuotedStr(MEPlaca.Text), true)
  else
    EdModelo.Text := 'Todos';
end;

procedure TFConhecimentoParam.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FVeiculoConhecimentoCons = nil then
    FVeiculoConhecimentoCons := TFVeiculoConhecimentoCons.Create(Application);
  if FVeiculoConhecimentoCons.ShowModal = mrOk then
  begin
    MEPlaca20.Text :=  DMVeiculoConhecimento.QVeiculoConsDESC_PLACA.Value;
    MePlaca20Exit(Sender);
  end;
end;

procedure TFConhecimentoParam.MePlaca20Exit(Sender: TObject);
begin
  inherited;
  if Trim(MEPlaca20.Text) <> '' then
    EdModelo20.Text := DMOracle.BuscaNome('SELECT DESC_VEICULO FROM TB_VEICULO_CONHECIMENTO','DESC_PLACA = ' + QuotedStr(MEPlaca20.Text), true)
  else
    EdModelo20.Text := 'Todos';
end;

end.
