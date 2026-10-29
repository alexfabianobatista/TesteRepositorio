unit URomaneioParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask, UFmProduto,
  UFmFilial, UFmBalanca, UFmDepartamento, UFmCadastro, UFmContrato,
  UFmOperacao, UFmClasse, UFmDatas, UFmCidade;

type
  TFRomaneioParam = class(TFTParametro)
    Label1: TLabel;
    Label2: TLabel;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    Me0Filial: TMaskEdit;
    Bt0ConsFilial: TBitBtn;
    Ed0Filial: TEdit;
    Label4: TLabel;
    Me0Cadastro: TMaskEdit;
    Bt0ConsCadastro: TBitBtn;
    Ed0Cadastro: TEdit;
    Label5: TLabel;
    Me0Produto: TMaskEdit;
    Bt0ConsProduto: TBitBtn;
    Ed0Produto: TEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Me0DataI: TMaskEdit;
    Me0DataF: TMaskEdit;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    ME1Filial: TMaskEdit;
    Bt1ConsFilial: TBitBtn;
    Ed1Filial: TEdit;
    Label9: TLabel;
    ME1Cadastro: TMaskEdit;
    Bt1ConsCadastro: TBitBtn;
    Ed1Cadastro: TEdit;
    Label10: TLabel;
    ME1Produto: TMaskEdit;
    Bt1ConsProduto: TBitBtn;
    Ed1Produto: TEdit;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    ME1DataI: TMaskEdit;
    ME1DataF: TMaskEdit;
    TabSheet3: TTabSheet;
    ME2CodFilial: TMaskEdit;
    ME2Filial: TMaskEdit;
    SpeedButton1: TSpeedButton;
    ME2CodCliente: TMaskEdit;
    ME2Cliente: TMaskEdit;
    SpeedButton2: TSpeedButton;
    ME2RomInicial: TMaskEdit;
    ME2RomFinal: TMaskEdit;
    ME2DtEmissaoInicial: TMaskEdit;
    ME2DtEmissaoFinal: TMaskEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Me0Armazem: TMaskEdit;
    Label19: TLabel;
    Me1Armazem: TMaskEdit;
    Label20: TLabel;
    TabSheet4: TTabSheet;
    ME3_Filial: TMaskEdit;
    Label21: TLabel;
    BT3_Filial: TBitBtn;
    ED3_Filial: TEdit;
    Label22: TLabel;
    ME3_Cadastro: TMaskEdit;
    BT3_Cadastro: TBitBtn;
    ED3_Cadastro: TEdit;
    Label23: TLabel;
    ME3_Produto: TMaskEdit;
    BT3_Produto: TBitBtn;
    ED3_Produto: TEdit;
    GroupBox3: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    ME3_DtInicial: TMaskEdit;
    ME3_DtFinal: TMaskEdit;
    TabSheet5: TTabSheet;
    Label26: TLabel;
    ME4_Filial: TMaskEdit;
    BT4_Filial: TBitBtn;
    ED4_Filial: TEdit;
    ME4_Cadastro: TMaskEdit;
    Label27: TLabel;
    ED4_Cadastro: TEdit;
    BT4_Cadastro: TBitBtn;
    ME4_Produto: TMaskEdit;
    Label28: TLabel;
    BT4_Produto: TBitBtn;
    ED4_Produto: TEdit;
    GroupBox4: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    ME4_DtInicial: TMaskEdit;
    ME4_DtFinal: TMaskEdit;
    ME4_Armazem: TMaskEdit;
    Label31: TLabel;
    TabSheet6: TTabSheet;
    Label32: TLabel;
    ME5FilialCod: TMaskEdit;
    Bt5FilialCons: TBitBtn;
    Ed5FilialDesc: TEdit;
    Label33: TLabel;
    ME5CadastroCod: TMaskEdit;
    Btn5CadastroCons: TBitBtn;
    Ed5CadastroNome: TEdit;
    Label34: TLabel;
    ME5ProdutoCod: TMaskEdit;
    Btn5ProdutoCons: TBitBtn;
    Ed5ProdutoDesc: TEdit;
    GroupBox5: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    ME5DtInicial: TMaskEdit;
    ME5DtFinal: TMaskEdit;
    Cb0Ordem: TComboBox;
    Label37: TLabel;
    Rg5Pesagem: TRadioGroup;
    Cb5Ordem: TComboBox;
    Label38: TLabel;
    Label39: TLabel;
    Me5Armazem: TMaskEdit;
    Rg0TipoRomaneio: TRadioGroup;
    Rg1TipoRomaneio: TRadioGroup;
    Rg4TipoRomaneio: TRadioGroup;
    Me0CadastroParceiro: TMaskEdit;
    Label40: TLabel;
    Bt0CadastroParceiro: TBitBtn;
    Label41: TLabel;
    Me1CadastroParceiro: TMaskEdit;
    Bt1CadastroParceiro: TBitBtn;
    Label42: TLabel;
    Me4CadastroParceiro: TMaskEdit;
    Bt4CadastroParceiro: TBitBtn;
    TabSheet7: TTabSheet;
    Label43: TLabel;
    Label44: TLabel;
    Me6CodFilial: TMaskEdit;
    Bt6ConsFilial: TBitBtn;
    Ed6Filial: TEdit;
    Me6CodCadastro: TMaskEdit;
    Bt6ConsCadastro: TBitBtn;
    Ed6Cadastro: TEdit;
    GroupBox6: TGroupBox;
    Label48: TLabel;
    Label49: TLabel;
    Me6DtInicial: TMaskEdit;
    Me6DtFinal: TMaskEdit;
    Rg6Tipo: TRadioGroup;
    Rg6TipoNota: TRadioGroup;
    Label45: TLabel;
    Cb0Situacao: TComboBox;
    TabSheet8: TTabSheet;
    Label46: TLabel;
    ME8Filial: TMaskEdit;
    SB8Filial: TSpeedButton;
    Ed8Filial: TEdit;
    Label47: TLabel;
    ME8Cadastro: TMaskEdit;
    SB8Cadastro: TSpeedButton;
    Ed8Cadastro: TEdit;
    Label50: TLabel;
    ME8Parceria: TMaskEdit;
    SB8Parceria: TSpeedButton;
    Ed8Parceria: TEdit;
    Label51: TLabel;
    ME8Armazem: TMaskEdit;
    Label52: TLabel;
    CB8Ordem: TComboBox;
    GroupBox7: TGroupBox;
    Label53: TLabel;
    ME8Inicio: TMaskEdit;
    Label54: TLabel;
    ME8Fim: TMaskEdit;
    Label55: TLabel;
    ME8Produto: TMaskEdit;
    SB8Produto: TSpeedButton;
    Ed8Produto: TEdit;
    RG8Tipo: TRadioGroup;
    Label56: TLabel;
    cb1Situacao: TComboBox;
    TabSheet9: TTabSheet;
    Label57: TLabel;
    ME9Filial: TMaskEdit;
    SB9Filial: TSpeedButton;
    Ed9Filial: TEdit;
    ME9Cadastro: TMaskEdit;
    Label58: TLabel;
    Ed9Cadastro: TEdit;
    SB9Cadastro: TSpeedButton;
    Label59: TLabel;
    ME9Produto: TMaskEdit;
    SB9Produto: TSpeedButton;
    Ed9Produto: TEdit;
    GroupBox8: TGroupBox;
    Label60: TLabel;
    Label61: TLabel;
    ME9Inicio: TMaskEdit;
    ME9Fim: TMaskEdit;
    RG9Tipo: TRadioGroup;
    TabSheet10: TTabSheet;
    Label62: TLabel;
    ME10Filial: TMaskEdit;
    SB10Filial: TSpeedButton;
    Ed10Filial: TEdit;
    Label63: TLabel;
    ME10Cadastro: TMaskEdit;
    SB10Cadastro: TSpeedButton;
    Ed10Cadastro: TEdit;
    GroupBox9: TGroupBox;
    Label64: TLabel;
    Label65: TLabel;
    ME10Inicio: TMaskEdit;
    ME10Fim: TMaskEdit;
    cb8Situacao: TComboBox;
    Label66: TLabel;
    TabSheet11: TTabSheet;
    Label67: TLabel;
    Sb11Filial: TSpeedButton;
    Me11Filial: TMaskEdit;
    Ed11Filial: TEdit;
    Label68: TLabel;
    Sb11Produto: TSpeedButton;
    Me11Produto: TMaskEdit;
    Ed11Produto: TEdit;
    GroupBox10: TGroupBox;
    Label69: TLabel;
    Label70: TLabel;
    Me11Inicio: TMaskEdit;
    Me11Fim: TMaskEdit;
    Label71: TLabel;
    Sb11Contrato: TSpeedButton;
    Me11Contrato: TMaskEdit;
    Ed11Contrato: TEdit;
    TabSheet12: TTabSheet;
    Label72: TLabel;
    Sb12Filial: TSpeedButton;
    Label73: TLabel;
    Sb12Produto: TSpeedButton;
    Label74: TLabel;
    Sb12Contrato: TSpeedButton;
    Me12Filial: TMaskEdit;
    Ed12Filial: TEdit;
    Me12Produto: TMaskEdit;
    Ed12Produto: TEdit;
    GroupBox11: TGroupBox;
    Label75: TLabel;
    Label76: TLabel;
    Me12Inicio: TMaskEdit;
    Me12Fim: TMaskEdit;
    Me12Contrato: TMaskEdit;
    Ed12Contrato: TEdit;
    TabSheet13: TTabSheet;
    GroupBox12: TGroupBox;
    Label80: TLabel;
    Label81: TLabel;
    Me13DtInicial: TMaskEdit;
    Me13DtFinal: TMaskEdit;
    Fm13Filial: TFmFilial;
    Fm13Produto: TFmProduto;
    TabSheet14: TTabSheet;
    FmFilial14: TFmFilial;
    FmBalanca14: TFmBalanca;
    Rg14situacao: TRadioGroup;
    Label77: TLabel;
    Cb14TipoPesagem: TComboBox;
    GroupBox13: TGroupBox;
    Label78: TLabel;
    Label79: TLabel;
    Me14Data_I: TMaskEdit;
    Me14Data_F: TMaskEdit;
    TabSheet15: TTabSheet;
    GroupBox14: TGroupBox;
    Label82: TLabel;
    Label83: TLabel;
    Me15DataI: TMaskEdit;
    Me15DataF: TMaskEdit;
    Fm15Filial: TFmFilial;
    Fm15Produto: TFmProduto;
    Fm15Departamento: TFmDepartamento;
    ME15Classe: TMaskEdit;
    Label84: TLabel;
    ME15SubClasse: TMaskEdit;
    Label85: TLabel;
    Bt15ConsClasse: TBitBtn;
    Ed15Classe: TEdit;
    Label86: TLabel;
    Label87: TLabel;
    Me5Classe: TMaskEdit;
    Me5SubClasse: TMaskEdit;
    Bt5ConsClasse: TBitBtn;
    Ed5Classe: TEdit;
    FmCadastro14: TFmCadastro;
    TabSheet16: TTabSheet;
    Fm16Filial: TFmFilial;
    Fm16Produto: TFmProduto;
    Fm16Cadastro: TFmCadastro;
    Fm16Contrato: TFmContrato;
    GroupBox16: TGroupBox;
    Label88: TLabel;
    Label89: TLabel;
    ME16DataI: TMaskEdit;
    ME16DataF: TMaskEdit;
    Fm13Cadastro: TFmCadastro;
    TabSheet17: TTabSheet;
    FmFilial17: TFmFilial;
    FmCadastro17: TFmCadastro;
    FmProduto17: TFmProduto;
    FmClasse17: TFmClasse;
    FmOperacao17: TFmOperacao;
    FmDatas17: TFmDatas;
    Rg17Tipo: TRadioGroup;
    Fm13Departamento: TFmDepartamento;
    RG0Pessoa: TRadioGroup;
    TabSheet18: TTabSheet;
    FmCadastro18: TFmCadastro;
    FmData18: TFmDatas;
    FmFilial18: TFmFilial;
    FmCidade1: TFmCidade;
    cb9Ordem: TComboBox;
    Label90: TLabel;
    TabSheet19: TTabSheet;
    FmBalanca19: TFmBalanca;
    FmDatas19: TFmDatas;
    FmProduto19: TFmProduto;
    RGAgrupado19: TRadioGroup;
    Label91: TLabel;
    Me0Placa: TMaskEdit;
    procedure Bt0ConsProdutoClick(Sender: TObject);
    procedure Bt0ConsFilialClick(Sender: TObject);
    procedure Bt0ConsCadastroClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure Me0FilialExit(Sender: TObject);
    procedure Me0CadastroExit(Sender: TObject);
    procedure Me0ProdutoExit(Sender: TObject);
    procedure ME1FilialExit(Sender: TObject);
    procedure ME1CadastroExit(Sender: TObject);
    procedure ME1ProdutoExit(Sender: TObject);
    procedure Bt1ConsProdutoClick(Sender: TObject);
    procedure Bt1ConsCadastroClick(Sender: TObject);
    procedure Bt1ConsFilialClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ME2CodFilialExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ME2CodClienteExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ME3_FilialExit(Sender: TObject);
    procedure BT3_FilialClick(Sender: TObject);
    procedure ME3_CadastroExit(Sender: TObject);
    procedure BT3_CadastroClick(Sender: TObject);
    procedure ME3_ProdutoExit(Sender: TObject);
    procedure BT3_ProdutoClick(Sender: TObject);
    procedure ME4_FilialExit(Sender: TObject);
    procedure BT4_FilialClick(Sender: TObject);
    procedure ME4_CadastroExit(Sender: TObject);
    procedure BT4_CadastroClick(Sender: TObject);
    procedure ME4_ProdutoExit(Sender: TObject);
    procedure BT4_ProdutoClick(Sender: TObject);
    procedure ME5CadastroCodExit(Sender: TObject);
    procedure ME5ProdutoCodExit(Sender: TObject);
    procedure Bt5FilialConsClick(Sender: TObject);
    procedure ME5FilialCodExit(Sender: TObject);
    procedure Btn5CadastroConsClick(Sender: TObject);
    procedure Btn5ProdutoConsClick(Sender: TObject);
    procedure Bt0CadastroParceiroClick(Sender: TObject);
    procedure Bt1CadastroParceiroClick(Sender: TObject);
    procedure Bt4CadastroParceiroClick(Sender: TObject);
    procedure Me6CodFilialExit(Sender: TObject);
    procedure Bt6ConsFilialClick(Sender: TObject);
    procedure Me6CodCadastroExit(Sender: TObject);
    procedure Bt6ConsCadastroClick(Sender: TObject);
    procedure ME8FilialExit(Sender: TObject);
    procedure ME8CadastroExit(Sender: TObject);
    procedure ME8ParceriaExit(Sender: TObject);
    procedure ME8ProdutoExit(Sender: TObject);
    procedure SB8FilialClick(Sender: TObject);
    procedure SB8CadastroClick(Sender: TObject);
    procedure SB8ParceriaClick(Sender: TObject);
    procedure SB8ProdutoClick(Sender: TObject);
    procedure ME9FilialExit(Sender: TObject);
    procedure SB9FilialClick(Sender: TObject);
    procedure ME9CadastroExit(Sender: TObject);
    procedure SB9CadastroClick(Sender: TObject);
    procedure ME9ProdutoExit(Sender: TObject);
    procedure SB9ProdutoClick(Sender: TObject);
    procedure ME10FilialExit(Sender: TObject);
    procedure SB10FilialClick(Sender: TObject);
    procedure ME10CadastroExit(Sender: TObject);
    procedure SB10CadastroClick(Sender: TObject);
    procedure Me11FilialExit(Sender: TObject);
    procedure Sb11FilialClick(Sender: TObject);
    procedure Me11ProdutoExit(Sender: TObject);
    procedure Sb11ProdutoClick(Sender: TObject);
    procedure Sb11ContratoClick(Sender: TObject);
    procedure Me11ContratoExit(Sender: TObject);
    procedure Me12ContratoExit(Sender: TObject);
    procedure Sb12ContratoClick(Sender: TObject);
    procedure FmFilial13BtFilialClick(Sender: TObject);
    procedure ME15SubClasseExit(Sender: TObject);
    procedure Bt15ConsClasseClick(Sender: TObject);
    procedure Me5ClasseExit(Sender: TObject);
    procedure Me5SubClasseExit(Sender: TObject);
    procedure Bt5ConsClasseClick(Sender: TObject);
    procedure FmClasse1BtClasseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRomaneioParam: TFRomaneioParam;

implementation

uses UProdutoCons, UProduto_cl, UFilialCons, UFilial_cl, UCadastroCons,
  UCadastro_cl, UUsuario_cl, UOracle_cl, Ucontrato_cl,
  UContratoVenda_Cons, UContrato_PJuridicaCons, UContrato_Pjuridica_cl,
  UClasseCons, UClasse_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRomaneioParam.Bt0ConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
  begin
     Me0Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
     Ed0Produto.Text := DmProduto.QProdutoConsDesc_Produto.Text
  end;
end;

procedure TFRomaneioParam.Bt0ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
  begin
     Me0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
     Ed0Filial.Text := DmFilial.QFilialConsDesc_Filial.Text;
  end;
end;

procedure TFRomaneioParam.Bt0ConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
  begin
     Me0Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
     Ed0Cadastro.Text := DmCadastro.QCadastroConsNome.Text
  end;
end;

procedure TFRomaneioParam.BtOkClick(Sender: TObject);
begin
  inherited;
  If PGRelatorio.ActivePage.PageIndex = 0 Then
  Begin
    If trim(ME0DataI.Text) = '' then
    begin
      ShowMessage('Informar Data Inicial');
      ModalResult:=mrNone;
    end;
    If trim(ME0DataF.Text) = '' then
    begin
      ShowMessage('Informar Data Final');
      ModalResult:=mrNone;
    end;
    If StrToDate(ME0DataF.Text) < StrToDate(ME0DataI.Text) then
    begin
      showMessage('Data Final Menor Data Inicial');
      ModalResult:=mrNone;
    end;
  End;
  If PGRelatorio.ActivePage.PageIndex in [10,11] Then
  Begin
    If trim(TMaskEdit(FindComponent('Me'+INtToStr(PGRelatorio.ActivePageIndex+1)+'Inicio')).Text) = '' then
    begin
      ShowMessage('Informar Data Inicial');
      ModalResult:=mrNone;
    end
    else If trim(TMaskEdit(FindComponent('Me'+INtToStr(PGRelatorio.ActivePageIndex+1)+'Fim')).Text) = '' then
    begin
      ShowMessage('Informar Data Final');
      ModalResult:=mrNone;
    end
    else If StrToDate(TMaskEdit(FindComponent('Me'+INtToStr(PGRelatorio.ActivePageIndex+1)+'Fim')).Text) <
            StrToDate(TMaskEdit(FindComponent('Me'+INtToStr(PGRelatorio.ActivePageIndex+1)+'Inicio')).Text) then
    begin
      showMessage('Data Final Menor Data Inicial');
      ModalResult:=mrNone;
    end;
  End;
end;

procedure TFRomaneioParam.Me0FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Filial.Text) <> '' Then
    Ed0Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME0Filial.Text)
  Else
    Ed0Filial.Text := 'Todos';
end;

procedure TFRomaneioParam.Me0CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Cadastro.Text) <> '' Then
    Ed0Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME0Cadastro.Text)
  Else
    Ed0Cadastro.Text := 'Todos';

end;

procedure TFRomaneioParam.Me0ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Produto.Text) <> '' Then
    Ed0Produto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME0Produto.Text)
  Else
    Ed0Produto.Text := 'Todos';
end;

procedure TFRomaneioParam.ME1FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Filial.Text) <> '' Then
    Ed1Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Me1Filial.Text)
  Else
    Ed1Filial.Text := 'Todos';
end;

procedure TFRomaneioParam.ME1CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Cadastro.Text) <> '' Then
    Ed1Cadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME1Cadastro.Text)
  Else
    Ed1Cadastro.Text := 'Todos';
end;

procedure TFRomaneioParam.ME1ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Produto.Text) <> '' Then
    Ed1Produto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME1Produto.Text)
  Else
    Ed1Produto.Text := 'Todos';
end;

procedure TFRomaneioParam.Bt1ConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
  begin
     ME1Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
     Ed1Produto.Text := DmProduto.QProdutoConsDesc_Produto.Text
  end;
end;

procedure TFRomaneioParam.Bt1ConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
  begin
     ME1Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
     Ed1Cadastro.Text := DmCadastro.QCadastroConsNome.Text
  end;
end;

procedure TFRomaneioParam.Bt1ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
  begin
     ME1Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
     Ed1Filial.Text := DmFilial.QFilialConsDesc_Filial.Text;
  end;
end;

procedure TFRomaneioParam.FormCreate(Sender: TObject);
begin
  inherited;
  Me1Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  Me1FilialExit(Self);
  Me0Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  Me0FilialExit(Self);
  ME5FilialCod.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME5FilialCodExit(Self);
  ME5DtInicial.Text := DateToStr(Date);
  ME5DtFinal.Text := DateToStr(Date);
end;

procedure TFRomaneioParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      ME2CodFilial.Text:=DmFilial.QFilialConsCod_Filial.text;
      ME2CodFilialExit(Self);
    end;
end;

procedure TFRomaneioParam.ME2CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME2CodFilial.text) <>'' then
    ME2Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME2CodFilial.Text)
  else
    ME2Filial.Clear;
end;

procedure TFRomaneioParam.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      ME2CodCliente.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.text;
      ME2CodClienteExit(Self);
    end;
end;

procedure TFRomaneioParam.ME2CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME2CodCliente.text)<>'' then
    ME2Cliente.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME2CodCliente.text)
  else
    ME2Cliente.Clear;
end;

procedure TFRomaneioParam.FormActivate(Sender: TObject);
begin
  inherited;
  Me0Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  Me0DataI.Text := DateToStr(Date);
  Me0DataF.Text := DateToStr(Date);
  CB0Ordem.ItemIndex := 0;
//  CB0Situacao.ItemIndex := 5;
//  CB8Situacao.ItemIndex := 5;
  CB5Ordem.ItemIndex := 0;
  CB8Ordem.ItemIndex := 0;  //Adicionado o campo Ordem para o Relatorio de Romaneio/freteiro - 10/01/2012 - Junior.
//  ME1Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME2CodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME3_Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  ME4_Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
//  ME5FilialCod.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  Me2DtEmissaoInicial.Text := DateToStr(Date);
  Me2DtEmissaoFinal.Text := DateToStr(Date);
  ME3_DtInicial.Text := DateToStr(Date);
  ME3_DtFinal.Text := DateToStr(Date);
  ME4_DtInicial.Text := DateToStr(Date);
  ME4_DtFinal.Text := DateToStr(Date);
//  ME5DtInicial.Text := DateToStr(Date);
//  ME5DtFinal.Text := DateToStr(Date);
  Me0CadastroParceiro.Text := DMUsuario.pCodParceria;
  Me1CadastroParceiro.Text := DMUsuario.pCodParceria;
  Me4CadastroParceiro.Text := DMUsuario.pCodParceria;
  Me8Parceria.Text := DMUsuario.pCodParceria;
  Me0CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  Me1CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  Me4CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  Me8Parceria.Enabled := DMUsuario.pCodParceria = '';
  Bt0CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  Bt1CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  Bt4CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  Sb8Parceria.Enabled := DMUsuario.pCodParceria = '';
  if DMParamSistema.CodEmpresa = 'ALIANCA' then
  begin
    Rg0TipoRomaneio.ItemIndex := 4;
    Cb0Ordem.ItemIndex := 2;
  end;

end;

procedure TFRomaneioParam.ME3_FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME3_Filial.Text) <> '' Then
    ED3_Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME3_Filial.Text)
  Else
    ED3_Filial.Text := 'Todos';

end;

procedure TFRomaneioParam.BT3_FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
  begin
     ME3_Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
     ED3_Filial.Text := DmFilial.QFilialConsDesc_Filial.Text;
  end;

end;

procedure TFRomaneioParam.ME3_CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME3_Cadastro.Text) <> '' Then
    ED3_Cadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME3_Cadastro.text)
  Else
    ED3_Cadastro.Text := 'Todos';

end;

procedure TFRomaneioParam.BT3_CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
  begin
     ME3_Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
     ED3_Cadastro.Text := DmCadastro.QCadastroConsNome.Text
  end;

end;

procedure TFRomaneioParam.ME3_ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME3_Produto.Text) <> '' Then
    ED3_Produto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME3_Produto.Text)
  Else
    ED3_Produto.Text := 'Todos';
end;

procedure TFRomaneioParam.BT3_ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
  begin
     ME3_Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
     ED3_Produto.Text := DMProduto.QProdutoConsDesc_Produto.Text
  end;

end;

procedure TFRomaneioParam.ME4_FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME4_Filial.Text) <> '' Then
    ED4_Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME4_Filial.Text)
  Else
    ED4_Filial.Text := 'Todos';

end;

procedure TFRomaneioParam.BT4_FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
  begin
     ME4_Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
     ED4_Filial.Text := DMFilial.QFilialConsDesc_Filial.Text;
  end;

end;

procedure TFRomaneioParam.ME4_CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME4_Cadastro.Text) <> '' Then
    ED4_Cadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME4_Cadastro.text)
  Else
    ED4_Cadastro.Text := 'Todos';

end;

procedure TFRomaneioParam.BT4_CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
  begin
     ME4_Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
     ED4_Cadastro.Text := DmCadastro.QCadastroConsNome.Text
  end;
end;

procedure TFRomaneioParam.ME4_ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME4_Produto.Text) <> '' Then
    ED4_Produto.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME4_Produto.Text)
  Else
    ED4_Produto.Text := 'Todos';

end;

procedure TFRomaneioParam.BT4_ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
  begin
     ME4_Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
     ED4_Produto.Text := DMProduto.QProdutoConsDesc_Produto.Text
  end;
end;

procedure TFRomaneioParam.ME5CadastroCodExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5CadastroCod.Text) <> '' Then
    ED5CadastroNome.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME5CadastroCod.text)
  Else
    ED5CadastroNome.Text := 'Todos';
end;

procedure TFRomaneioParam.ME5ProdutoCodExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5ProdutoCod.Text) <> '' Then
    ED5ProdutoDesc.text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME5ProdutoCod.Text)
  else
    ED5ProdutoDesc.Text := 'Todos';

end;

procedure TFRomaneioParam.Bt5FilialConsClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
  begin
     ME5FilialCod.Text := DMFilial.QFilialConsCod_Filial.Text;
     ED5FilialDesc.Text := DMFilial.QFilialConsDesc_Filial.Text;
  end;

end;

procedure TFRomaneioParam.ME5FilialCodExit(Sender: TObject);
begin
  inherited;
  if Trim(ME5FilialCod.Text) <> '' Then
    ED5FilialDesc.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME5FilialCod.Text)
  else
    ED5FilialDesc.Text := 'Todos';

end;

procedure TFRomaneioParam.Btn5CadastroConsClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
  begin
     ME5CadastroCod.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
     ED5CadastroNome.Text := DmCadastro.QCadastroConsNome.Text
  end;

end;

procedure TFRomaneioParam.Btn5ProdutoConsClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
  begin
     ME5ProdutoCod.Text := DMProduto.QProdutoConsCod_Produto.Text;
     ED5ProdutoDesc.Text := DMProduto.QProdutoConsDesc_Produto.Text
  end;
end;

procedure TFRomaneioParam.Bt0CadastroParceiroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     Me0CadastroParceiro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFRomaneioParam.Bt1CadastroParceiroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     Me1CadastroParceiro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFRomaneioParam.Bt4CadastroParceiroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     Me4CadastroParceiro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFRomaneioParam.Me6CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me6CodFilial.Text) <> '' Then
    Ed6Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Me6CodFilial.Text)
  else
    Ed6Filial.Text := 'Todos';
end;

procedure TFRomaneioParam.Bt6ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
  begin
     Me6CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
     Ed6Filial.Text := DMFilial.QFilialConsDesc_Filial.Text;
  end;

end;

procedure TFRomaneioParam.Me6CodCadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(Me6CodCadastro.Text) <> '' Then
    Ed6Cadastro.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Me6CodCadastro.text)
  Else
    Ed6Cadastro.Text := 'Todos';
end;

procedure TFRomaneioParam.Bt6ConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
  begin
     Me6CodCadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
     Ed6Cadastro.Text := DmCadastro.QCadastroConsNome.Text
  end;

end;

procedure TFRomaneioParam.ME8FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8Filial.Text) <> '' then
    Ed8Filial.Text:= DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME8Filial.Text)
  else
    Ed8Filial.Text := 'Todas';
end;

procedure TFRomaneioParam.ME8CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8Cadastro.Text) <> '' then
    Ed8Cadastro.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME8Cadastro.Text)
  else
    Ed8Cadastro.Text := 'Todos';
end;

procedure TFRomaneioParam.ME8ParceriaExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8Parceria.Text) <> '' then
    Ed8Parceria.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME8Parceria.Text)
  else
    Ed8Parceria.Text := 'Todas';
end;

procedure TFRomaneioParam.ME8ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME8Produto.Text) <> '' then
    Ed8Produto.Text:= DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME8Produto.Text)
  else
    Ed8Produto.Text := 'Todos';
end;

procedure TFRomaneioParam.SB8FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.showModal = mrOk then
    ME8Filial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME8FilialExit(Self);
end;

procedure TFRomaneioParam.SB8CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.showModal = mrOk then
    ME8Cadastro.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
  ME8CadastroExit(Self);
end;

procedure TFRomaneioParam.SB8ParceriaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.showModal = mrOk then
    ME8Parceria.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
  ME8ParceriaExit(Self);
end;

procedure TFRomaneioParam.SB8ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.showModal = mrOk then
    ME8Produto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
  ME8ProdutoExit(Self);
end;

procedure TFRomaneioParam.ME9FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME9Filial.Text) <> '' then
    Ed9Filial.Text:= DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME9Filial.Text)
  else
    Ed9Filial.Text := 'Todas';
end;

procedure TFRomaneioParam.SB9FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.showModal = mrOk then
  begin
    ME9Filial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
    ME9FilialExit(Self);
  end;
end;

procedure TFRomaneioParam.ME9CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME9Cadastro.Text) <> '' then
    Ed9Cadastro.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME9Cadastro.Text)
  else
    Ed9Cadastro.Text := 'Todos';
end;

procedure TFRomaneioParam.SB9CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.showModal = mrOk then
  begin
    ME9Cadastro.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    ME9CadastroExit(Self);
  end;
end;

procedure TFRomaneioParam.ME9ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME9Produto.Text) <> '' then
    Ed9Produto.Text:= DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ME9Produto.Text)
  else
    Ed9Produto.Text := 'Todos';
end;

procedure TFRomaneioParam.SB9ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.showModal = mrOk then
  begin
    ME9Produto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
    ME9ProdutoExit(Self);
  end;
end;

procedure TFRomaneioParam.ME10FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10Filial.Text) <> '' then
    Ed10Filial.Text:= DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME10Filial.Text)
  else
    Ed10Filial.Text := 'Todas';
end;

procedure TFRomaneioParam.SB10FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.showModal = mrOk then
  begin
    ME10Filial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
    ME10FilialExit(Self);
  end;
end;

procedure TFRomaneioParam.ME10CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME10Cadastro.Text) <> '' then
    Ed10Cadastro.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME10Cadastro.Text)
  else
    Ed10Cadastro.Text := 'Todos';
end;

procedure TFRomaneioParam.SB10CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.showModal = mrOk then
  begin
    ME10Cadastro.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    ME10CadastroExit(Self);
  end;
end;

procedure TFRomaneioParam.Me11FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(TMaskEdit(FindComponent('Me'+IntToStr(PGRelatorio.ActivePageIndex+1)+'Filial')).Text) <> '' then
    TEdit(FindComponent('Ed'+IntToStr(PGRelatorio.ActivePageIndex+1)+'Filial')).Text :=
               DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+
               TMaskEdit(FindComponent('Me'+IntToStr(PGRelatorio.ActivePageIndex+1)+'Filial')).Text)
  else
    TEdit(FindComponent('Ed'+IntToStr(PGRelatorio.ActivePageIndex+1)+'Filial')).Text := 'Todas';
end;

procedure TFRomaneioParam.Sb11FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.showModal = mrOk then
  begin
    TMaskEdit(FindComponent('ME'+IntToStr(PGRelatorio.ActivePageIndex+1)+'Filial')).Text := DMFilial.QFilialConsCOD_FILIAL.Text;
    ME11FilialExit(Self);
  end;
end;

procedure TFRomaneioParam.Me11ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(TMaskEdit(FindComponent('Me'+IntToStr(PGRelatorio.ActivePageIndex+1)+'Produto')).Text) <> '' then
    TEdit(FindComponent('Ed'+IntToStr(PGRelatorio.ActivePageIndex+1)+'Produto')).Text:=
               DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+
               TMaskEdit(FindComponent('Me'+IntToStr(PGRelatorio.ActivePageIndex+1)+'Produto')).Text)
  else
    TEdit(FindComponent('Ed'+IntToStr(PGRelatorio.ActivePageIndex+1)+'Produto')).Text := 'Todos';
end;

procedure TFRomaneioParam.Sb11ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.showModal = mrOk then
  begin
    TMaskEdit(FindComponent('ME'+IntToStr(PGRelatorio.ActivePageIndex+1)+'Produto')).Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
    ME11ProdutoExit(Self);
  end;
end;

procedure TFRomaneioParam.Sb11ContratoClick(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  if FContrato_VendaCons.showModal = mrOk then
  begin
    Me11Contrato.Text := DMContrato.QContrato_VendConsNUM_CONTRATO.Text;
    Me11ContratoExit(Self);   
  end;
end;

procedure TFRomaneioParam.Me11ContratoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me11Contrato.Text) <> '' then
    Ed11Contrato.Text:= DMOracle.BuscaNome('SELECT TB_CADASTRO.NOME FROM TB_CONTRATO_VEND, TB_CADASTRO ',
         'Tb_contrato_vend.COD_CADASTRO = Tb_cadastro.COD_CADASTRO and NUM_CONTRATO = '+Me11Contrato.Text)
  else
    Ed11Contrato.Text := 'Todos';
end;

procedure TFRomaneioParam.Me12ContratoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me11Contrato.Text) <> '' then
    Ed12Contrato.Text:= DMOracle.BuscaNome('SELECT TB_CADASTRO.NOME FROM TB_CONTRATO_VEND, TB_CADASTRO ',
         'Tb_contrato_PJuridica.COD_CADASTRO = Tb_cadastro.COD_CADASTRO and NUM_CONTRATO = '+Me12Contrato.Text)
  else
    Ed12Contrato.Text := 'Todos';
end;

procedure TFRomaneioParam.Sb12ContratoClick(Sender: TObject);
begin
  inherited;
  if FContrato_PJuridicaCons = nil then
    FContrato_PJuridicaCons := TFContrato_PJuridicaCons.Create(Application);
  if FContrato_PJuridicaCons.showModal = mrOk then
  begin
    Me12Contrato.Text := DMContrato_Pjuridica.QContratoPJuridicaConsNUM_CONTRATO.Text;
    Me12ContratoExit(Self);
  end;
end;

procedure TFRomaneioParam.FmFilial13BtFilialClick(Sender: TObject);
begin
  inherited;
  Fm13Filial.BtFilialClick(Sender);

end;

procedure TFRomaneioParam.ME15SubClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(ME15Classe.Text) = '' Then
  Begin
    Ed15Classe.Text := 'Todos';
    ME15SubClasse.Text := '';
  End
  Else
    If Trim(ME15SubClasse.Text) = '' then
    Begin
      Ed15Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME15Classe.Text+
                                           'AND NUM_SUBCLASSE = 0');
      ME15SubClasse.Text := '0';
    End
    Else
      Ed15Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+ME15Classe.Text+
                                           'AND NUM_SUBCLASSE = '+ME15SubClasse.Text);
end;

procedure TFRomaneioParam.Bt15ConsClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME15Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
    ME15SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    ME15SubClasseExit(Self);
  End;
end;

procedure TFRomaneioParam.Me5ClasseExit(Sender: TObject);
begin
  inherited;
  Me5SubClasseExit(Self);

end;

procedure TFRomaneioParam.Me5SubClasseExit(Sender: TObject);
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

procedure TFRomaneioParam.Bt5ConsClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    Me5Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
    Me5SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    Me5SubClasseExit(Self);
  End;

end;

procedure TFRomaneioParam.FmClasse1BtClasseClick(Sender: TObject);
begin
  inherited;
  FmClasse17.BtClasseClick(Sender);

end;

end.
