unit UOficinaParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ComCtrls, ExtCtrls, Buttons, Mask, Barcode,
  QuickRpt, Qrctrls, variants, UFmCadastro, UFmDatas, UFmVendedor,
  UFmFilial, UFmVeiculo, UFmMarca, UFmOperacao, UFmMecanico, UFmComissao,
  UFmLote, UFmProduto;

type
  TFOficinaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    EdDESC_MODELO: TEdit;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    MECor: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SBCadastroCons: TSpeedButton;
    MEChassi: TMaskEdit;
    MEPlaca: TMaskEdit;
    MECadastroCod: TMaskEdit;
    MECadastroNome: TMaskEdit;
    TabSheet3: TTabSheet;
    Label6: TLabel;
    EdNumOS: TEdit;
    Label7: TLabel;
    MECadastroCod1: TMaskEdit;
    SBCadastroCons1: TSpeedButton;
    MECadastroNome1: TMaskEdit;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    SBMecanicoCons1: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    SBVendedorCons1: TSpeedButton;
    MEVendedorCod1: TMaskEdit;
    MEVendedorNome1: TMaskEdit;
    GroupBox1: TGroupBox;
    MEEmissaoI: TMaskEdit;
    MEEmissaoF: TMaskEdit;
    Label11: TLabel;
    RadioGroup1: TRadioGroup;
    Label12: TLabel;
    METipoOS1: TMaskEdit;
    SBTipoOSCons1: TSpeedButton;
    METipoOSDesc1: TMaskEdit;
    TabSheet4: TTabSheet;
    MEMecanicoCod1: TMaskEdit;
    MEMecanicoNome1: TMaskEdit;
    Label13: TLabel;
    EdNumOS2: TEdit;
    SBOSCons: TSpeedButton;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    TabSheet5: TTabSheet;
    Label14: TLabel;
    EdNumOS1: TEdit;
    SBConsultaOS: TSpeedButton;
    Label15: TLabel;
    MECadastroCod2: TMaskEdit;
    SBCadastroCons2: TSpeedButton;
    MECadastroNome2: TMaskEdit;
    Label16: TLabel;
    MEServicoCod: TMaskEdit;
    SBServicoCons: TSpeedButton;
    MEServicoDesc: TMaskEdit;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    MEDataServico_I: TMaskEdit;
    MEDataServico_F: TMaskEdit;
    Label18: TLabel;
    MEVendedorCod: TMaskEdit;
    SBVendedorCons: TSpeedButton;
    MEVendedorNome: TMaskEdit;
    TabSheet6: TTabSheet;
    Label19: TLabel;
    MECodFilial: TMaskEdit;
    SBFilialCons: TSpeedButton;
    MEDescFilial: TMaskEdit;
    TabSheet7: TTabSheet;
    Label21: TLabel;
    EdNumOS7: TEdit;
    SBOSCons7: TSpeedButton;
    StaticText3: TStaticText;
    TabSheet8: TTabSheet;
    GroupBox3: TGroupBox;
    Label20: TLabel;
    MEDataI8: TMaskEdit;
    MEDataF8: TMaskEdit;
    Label22: TLabel;
    MECodFilial8: TMaskEdit;
    SpeedButton2: TSpeedButton;
    MEDescFilial8: TMaskEdit;
    SpeedButton4: TSpeedButton;
    TabSheet9: TTabSheet;
    Label23: TLabel;
    MECodFilial9: TMaskEdit;
    SBFilialCons9: TSpeedButton;
    MEDescFilial9: TMaskEdit;
    GroupBox4: TGroupBox;
    Label24: TLabel;
    MEDataI9: TMaskEdit;
    MEDataF9: TMaskEdit;
    Label25: TLabel;
    MECodVendedor9: TMaskEdit;
    SBVendedorCons9: TSpeedButton;
    MENomeVendedor9: TMaskEdit;
    TabSheet10: TTabSheet;
    Label26: TLabel;
    MENrNota: TMaskEdit;
    Memo1: TMemo;
    EdCod_nota_cab: TEdit;
    Label27: TLabel;
    MEFornecedorCod: TMaskEdit;
    EdFornecedorNome: TEdit;
    SBFornecedorCons: TSpeedButton;
    TabSheet11: TTabSheet;
    Label28: TLabel;
    MECodFilial11: TMaskEdit;
    SBFilialCons11: TSpeedButton;
    MEDescFilial11: TMaskEdit;
    GroupBox5: TGroupBox;
    Label29: TLabel;
    MEDtMovimentoI11: TMaskEdit;
    MEDtMovimentoF11: TMaskEdit;
    TabSheet12: TTabSheet;
    ME12CodMecanico: TMaskEdit;
    SpeedButton3: TSpeedButton;
    Label30: TLabel;
    ED12DescMecanico: TEdit;
    GroupBox6: TGroupBox;
    ME12Dt_Emissao_I: TMaskEdit;
    ME12Dt_Emissao_F: TMaskEdit;
    Ed14Chassi: TTabSheet;
    Label31: TLabel;
    ME13CodMecanico: TMaskEdit;
    SpeedButton5: TSpeedButton;
    ED13DescMecanico: TEdit;
    GroupBox7: TGroupBox;
    ME13Dt_Emissao_I: TMaskEdit;
    ME13Dt_Emissao_F: TMaskEdit;
    TabSheet14: TTabSheet;
    GroupBox8: TGroupBox;
    ME14DtInicio: TMaskEdit;
    ME14DtFim: TMaskEdit;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    SpeedButton6: TSpeedButton;
    Label36: TLabel;
    ME14Chassi: TMaskEdit;
    Bt14Chassi: TSpeedButton;
    TabSheet13: TTabSheet;
    Label32: TLabel;
    ME15CodFilial: TMaskEdit;
    SpeedButton7: TSpeedButton;
    ME15DescFilial: TMaskEdit;
    TabSheet15: TTabSheet;
    Label37: TLabel;
    ME16CodFilial: TMaskEdit;
    SpeedButton8: TSpeedButton;
    ME16DescFilial: TMaskEdit;
    TabSheet16: TTabSheet;
    Label38: TLabel;
    ME16CodMecanico: TMaskEdit;
    SpeedButton9: TSpeedButton;
    ED16DescMecanico: TEdit;
    GroupBox9: TGroupBox;
    ME16Dt_Emissao_I: TMaskEdit;
    ME16Dt_Emissao_F: TMaskEdit;
    TabSheet17: TTabSheet;
    Label39: TLabel;
    ME17CodMecanico: TMaskEdit;
    SpeedButton10: TSpeedButton;
    ED17DescMecanico: TEdit;
    GroupBox10: TGroupBox;
    ME17Dt_Emissao_I: TMaskEdit;
    ME17Dt_Emissao_F: TMaskEdit;
    TabSheet18: TTabSheet;
    GB18Periodo: TGroupBox;
    ME18DtInicial: TMaskEdit;
    ME18DtFinal: TMaskEdit;
    Label40: TLabel;
    Label41: TLabel;
    TabSheet19: TTabSheet;
    Label42: TLabel;
    M19Observacao: TMemo;
    RG19TipoValor: TRadioGroup;
    ME19DescPecas: TMaskEdit;
    Label43: TLabel;
    Label44: TLabel;
    ME19DescServicos: TMaskEdit;
    Fm19Cadastro: TFmCadastro;
    TabSheet20: TTabSheet;
    Fm20Filial: TFmFilial;
    Fm20Vendedor: TFmVendedor;
    Fm20Datas: TFmDatas;
    TabSheet21: TTabSheet;
    Fm21Cadastro: TFmCadastro;
    Fm21Datas: TFmDatas;
    Fm21Filial: TFmFilial;
    Fm21Marca: TFmMarca;
    Fm21Veiculo: TFmVeiculo;
    Fm21Vendedor: TFmVendedor;
    Fm21Operacao: TFmOperacao;
    RG21Situacao: TRadioGroup;
    RG21Tipo: TRadioGroup;
    RG20Tipo: TRadioGroup;
    TabSheet22: TTabSheet;
    Fm22Mecanico: TFmMecanico;
    Fm22Datas: TFmDatas;
    Fm22Comissao: TFmComissao;
    Fm22Filial: TFmFilial;
    RG22Situacao: TRadioGroup;
    TabSheet23: TTabSheet;
    RG23Tipo: TRadioGroup;
    ME23NumCopias: TMaskEdit;
    Label45: TLabel;
    SpeedButton11: TSpeedButton;
    Label46: TLabel;
    ME22NumOS: TMaskEdit;
    Fm22Vendedor: TFmVendedor;
    TabSheet24: TTabSheet;
    Fm24Filial: TFmFilial;
    Fm24Lote: TFmLote;
    lbl1: TLabel;
    ME24NumOS: TMaskEdit;
    btn1: TSpeedButton;
    TabSheet25: TTabSheet;
    Fm25Produto: TFmProduto;
    ME25OS: TMaskEdit;
    LbOS25: TLabel;
    SBOSCons25: TSpeedButton;
    procedure SBCadastroConsClick(Sender: TObject);
    procedure MECadastroCodChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBOSConsClick(Sender: TObject);
    procedure MEVendedorCod1Change(Sender: TObject);
    procedure MEMecanicoCod1Change(Sender: TObject);
    procedure MECadastroCod1Change(Sender: TObject);
    procedure METipoOS1Change(Sender: TObject);
    procedure EdNumOS2Exit(Sender: TObject);
    procedure SBConsultaOSClick(Sender: TObject);
    procedure SBCadastroCons2Click(Sender: TObject);
    procedure SBVendedorCons1Click(Sender: TObject);
    procedure SBVendedorConsClick(Sender: TObject);
    procedure MEServicoCodChange(Sender: TObject);
    procedure MECadastroCod2Change(Sender: TObject);
    procedure EdNumOS1Exit(Sender: TObject);
    procedure MEVendedorCodChange(Sender: TObject);
    procedure MECodFilialChange(Sender: TObject);
    procedure SBFilialConsClick(Sender: TObject);
    procedure SBOSCons7Click(Sender: TObject);
    procedure EdNumOS7Exit(Sender: TObject);
    procedure MECodFilial8Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MECodFilial9Change(Sender: TObject);
    procedure SBFilialCons9Click(Sender: TObject);
    procedure MECodVendedor9Change(Sender: TObject);
    procedure SBVendedorCons9Click(Sender: TObject);
    procedure TabSheet9Show(Sender: TObject);
    procedure TabSheet8Show(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
    procedure MENrNotaExit(Sender: TObject);
    procedure SBFornecedorConsClick(Sender: TObject);
    procedure MEFornecedorCodChange(Sender: TObject);
    procedure SBFilialCons11Click(Sender: TObject);
    procedure MECodFilial11Change(Sender: TObject);
    procedure SBTipoOSCons1Click(Sender: TObject);
    procedure SBMecanicoCons1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ME12CodMecanicoExit(Sender: TObject);
    procedure ME13CodMecanicoExit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Bt14ChassiClick(Sender: TObject);
    procedure ME15CodFilialExit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure TabSheet13Show(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure ME16CodFilialExit(Sender: TObject);
    procedure ME16CodMecanicoExit(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure ME17CodMecanicoExit(Sender: TObject);
    procedure ME19DescPecasKeyPress(Sender: TObject; var Key: Char);
    procedure ME19DescServicosKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ME23NumCopiasExit(Sender: TObject);
    procedure ME23NumCopiasKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton11Click(Sender: TObject);
    procedure ME22NumOSKeyPress(Sender: TObject; var Key: Char);
    procedure SBOSCons25Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOficinaParam: TFOficinaParam;

implementation

uses UCadastroCons, UOficina_cl, UCadastro_cl, UOracle_cl, UOSCons,
  UVendedorCons, UVendedor_cl, UServicoCons, UFilialCons, UFilial_cl,
  UOS_TipoCons, UMecanicoCons, UVeiculoCons, UUsuario_cl, UBiblioteca,
  UOs_cl;
  //UFmOperacao;


{$R *.DFM}

procedure TFOficinaParam.SBCadastroConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:= TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    with DMOficina do
    begin
      MECadastroCod1.Text:= IntToStr(DMCadastro.QCadastroConsCOD_CADASTRO.Value);
      MECadastroNome1.Text:= DMCadastro.QCadastroConsNOME.Value;
    end;
  end;
end;

procedure TFOficinaParam.MECadastroCodChange(Sender: TObject);
begin
  inherited;
  if Trim(MECadastroNome.Text) <> '' then
     MECadastroNome.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECadastroCod.text);
end;

procedure TFOficinaParam.FormActivate(Sender: TObject);
begin
  inherited;
  MEEmissaoI.Text:= DateToStr(Date);
  MEEmissaoF.Text:= DateToStr(Date);
  MEDataServico_I.Text:=DateToStr(Date);
  MEDataServico_F.Text:=DateToStr(Date);
  MEDataI8.Text:= DateToStr(Date);
  MEDataF8.Text:= DateToStr(Date);
  MECodFilial8.Text:= '1';
  MEDtMovimentoI11.Text:= DateToStr(Date);
  MEDtMovimentoF11.Text:= DateToStr(Date);
end;

procedure TFOficinaParam.SBOSConsClick(Sender: TObject);
begin
  inherited;
  if FOsCons = nil then
    FOsCons := TFOsCons.Create(Application);
  if FOsCons.ShowModal = mrOk then
    EdNumOS2.Text:= IntToStr(DMOs.QOSConsNUM_OS.Value);
end;

procedure TFOficinaParam.MEVendedorCod1Change(Sender: TObject);
begin
  inherited;
  if Trim(MEVendedorCod1.Text) <> '' then
     MEVendedorNome1.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+MEVendedorCod1.Text)
  else
     MEVendedorNome1.Clear;
end;

procedure TFOficinaParam.MEMecanicoCod1Change(Sender: TObject);
begin
  inherited;
  if Trim(MEMecanicoCod1.Text) <> '' then
     MEMecanicoNome1.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_MECANICO','COD_MECANICO = '+MEMecanicoCod1.text)
  else
     MEMecanicoNome1.Clear;
end;

procedure TFOficinaParam.MECadastroCod1Change(Sender: TObject);
begin
  inherited;
  if Trim(MECadastroCod1.Text) <> '' then
     MECadastroNome1.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECadastroCod1.text)
  else
     MECadastroNome1.Clear;
end;

procedure TFOficinaParam.METipoOS1Change(Sender: TObject);
begin
  inherited;
  if Trim(METipoOS1.Text) <> '' then
     METipoOSDesc1.Text:= DMOracle.BuscaNome('SELECT DESC_OS_TIPO FROM TB_OS_TIPO','COD_OS_TIPO = '+METipoOS1.Text)
  else
     METipoOSDesc1.Clear;
end;

procedure TFOficinaParam.EdNumOS2Exit(Sender: TObject);
begin
  inherited;
  if Trim(EdNumOS2.Text) = '' then
     raise exception.Create('Número da O.S. deve ser informada!');

  with DMOs do
  begin
    QOSCad.Close;
    QOSCad.SetVariable('PK',EdNumOS2.Text);
    QOSCad.Open;
    if (QOSCadCOD_FILIAL.Value <> 1) and (QOSCadIND_SITUACAO.Value = 'F') then
       raise exception.Create('Erro desconhecido!!!');
  end;
end;

procedure TFOficinaParam.SBConsultaOSClick(Sender: TObject);
begin
  inherited;
  if FOsCons = nil then
    FOsCons := TFOsCons.Create(Application);
  if FOsCons.ShowModal = mrOk then
    EdNumOS1.Text:= IntToStr(DMOs.QOSConsNUM_OS.Value);
end;

procedure TFOficinaParam.SBCadastroCons2Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:= TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     MECadastroCod2.Text:= IntToStr(DMCadastro.QCadastroConsCOD_CADASTRO.Value);
end;

procedure TFOficinaParam.SBVendedorCons1Click(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
     FVendedorCons:= TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
  begin
    MEVendedorCod1.Text:= FloatToStr(DMVendedor.QVendedorConsCOD_VENDEDOR.Value);
    MEVendedorNome1.Text:=DMVendedor.QVendedorConsNOME.Value;
  end;
end;

procedure TFOficinaParam.SBVendedorConsClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
     FVendedorCons:= TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
  begin
    MEVendedorCod.Text:= FloatToStr(DMVendedor.QVendedorConsCOD_VENDEDOR.Value);
    MEVendedorNome.Text:=DMVendedor.QVendedorConsNOME.Value;
  end;
end;

procedure TFOficinaParam.MEServicoCodChange(Sender: TObject);
begin
  inherited;
  if Trim(MEServicoCod.Text) <> '' then
     MEServicoDesc.Text:= DMOracle.BuscaNome('SELECT DESC_SERVICO FROM TB_SERVICO','COD_SERVICO ='+MEServicoCod.Text)
  else
     MEServicoDesc.Text := ''
end;

procedure TFOficinaParam.MECadastroCod2Change(Sender: TObject);
begin
  inherited;
  if Trim(MECadastroCod2.Text) <> '' then
     MECadastroNome2.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECadastroCod2.text)
  else
     MECadastroNome2.Clear;
end;

procedure TFOficinaParam.EdNumOS1Exit(Sender: TObject);
var mNumOS: String;
begin
  inherited;
  mNumOS:= '';   // Inicializa valor da variavel.
  if Trim(EdNumOS1.Text) <> '' then
     mNumOS:= DMOracle.BuscaNome('SELECT NUM_OS FROM TB_OS','NUM_OS = '+EdNumOs.Text);
  if Trim(mNumOS) = '' then
     EdNumOS1.Text:= ''
  else
     EdNumOS1.Text:= mNumOS;
end;

procedure TFOficinaParam.MEVendedorCodChange(Sender: TObject);
begin
  inherited;
  if Trim(MEVendedorCod.Text) <> '' then
     MEVendedorNome.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+MEVendedorCod.text)
  else
     MEVendedorNome.Clear;
end;

procedure TFOficinaParam.MECodFilialChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial.Text) <> '' then
     MEDescFilial.Text:= DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.Text)
  else
     MEDescFilial.Text := '';
end;

procedure TFOficinaParam.SBFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons:= TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    MECodFilial.Text:= IntToStr(DMFilial.QFilialConsCOD_FILIAL.Value);
end;

procedure TFOficinaParam.SBOSCons7Click(Sender: TObject);
begin
  inherited;
  if FOsCons = nil then
    FOsCons:= TFOsCons.Create(Application);
  if FOsCons.ShowModal = mrOk then
    EdNumOS7.Text:= IntToStr(DMOs.QOSConsNUM_OS.Value);
end;

procedure TFOficinaParam.EdNumOS7Exit(Sender: TObject);
begin
  inherited;
  EdNumOS7.Text:= DMOracle.BuscaNome('SELECT NUM_OS FROM TB_OS','NUM_OS = '+EdNumOS7.Text);
  if Trim(EdNumOS7.Text) = '' then
     MessageDlg('Número da O.S. informada não foi encontrado!',mtInformation,[mbOk],0);
end;

procedure TFOficinaParam.MECodFilial8Change(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial8.Text) <> '' then
     MEDescFilial8.Text:= DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial8.Text)
  else
     MEDescFilial8.Text := 'TODAS';
end;

procedure TFOficinaParam.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:= TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
     MECodFilial8.Text:= IntToStr(DMFilial.QFilialConsCOD_FILIAL.Value);
end;

procedure TFOficinaParam.MECodFilial9Change(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial9.Text) <> '' then
     MEDescFilial9.Text:= DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial9.Text)
  else
     MEDescFilial9.Text := '';
end;

procedure TFOficinaParam.SBFilialCons9Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:= TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
     MECodFilial9.Text:= IntToStr(DMFilial.QFilialConsCOD_FILIAL.Value);
end;

procedure TFOficinaParam.MECodVendedor9Change(Sender: TObject);
begin
  inherited;
  if Trim(MECodVendedor9.Text) <> '' then
     MENomeVendedor9.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+MECodVendedor9.Text)
  else
     MENomeVendedor9.Text := '';
end;

procedure TFOficinaParam.SBVendedorCons9Click(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
     FVendedorCons:= TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
     MECodVendedor9.Text:= IntToStr(DMVendedor.QVendedorConsCOD_VENDEDOR.Value);
end;

procedure TFOficinaParam.TabSheet9Show(Sender: TObject);
begin
  inherited;
  FOficinaParam.helpcontext:=14;
end;

procedure TFOficinaParam.TabSheet8Show(Sender: TObject);
begin
  inherited;
  FOficinaParam.helpcontext:=13;
end;

procedure TFOficinaParam.TabSheet5Show(Sender: TObject);
begin
  inherited;
  FOficinaParam.helpcontext:=15;
end;

procedure TFOficinaParam.TabSheet6Show(Sender: TObject);
begin
  inherited;
  FOficinaParam.helpcontext:=16;
end;

procedure TFOficinaParam.MENrNotaExit(Sender: TObject);
begin
  inherited;
  if (Trim(MEFornecedorCod.Text) = '') and (Trim(MENrNota.Text) = '') then
     raise exception.Create('Código fornecedor deve ser informado!');

  EdCod_nota_cab.Text:=DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_NOTA_CAB','NUM_NOTA = '+
                        FOficinaParam.MENrNota.Text+' AND COD_CADASTRO = '+MEFornecedorCod.Text);
  if Trim(EdCod_nota_cab.Text) = '' then
  begin
    MessageDlg('Nota fiscal não foi encontrada!',mtInformation,[mbOk],0);
    MENrNota.SetFocus;
  end;
end;

procedure TFOficinaParam.SBFornecedorConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:= TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     MEFornecedorCod.Text:= DMCadastro.QCadastroConsCOD_CADASTRO.Text;
end;

procedure TFOficinaParam.MEFornecedorCodChange(Sender: TObject);
begin
  inherited;
  if Trim(MEFornecedorCod.Text) <> '' then
     EdFornecedorNome.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MEFornecedorCod.Text)
  else
     EdFornecedorNome.Text:= '';
end;

procedure TFOficinaParam.SBFilialCons11Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:= TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
     MECodFilial11.Text:= IntToStr(DMFilial.QFilialConsCOD_FILIAL.Value);
end;

procedure TFOficinaParam.MECodFilial11Change(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial11.Text) <> '' then
     MEDescFilial11.Text:= DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial11.Text)
  else
     MEDescFilial11.Text := '';
end;

procedure TFOficinaParam.SBTipoOSCons1Click(Sender: TObject);
begin
  inherited;
  if FOFI0008 = nil then
     FOFI0008:= TFOFI0008.Create(Application);
  if FOFI0008.ShowModal = mrOk then
  begin
    with DMOficina do
    begin
      METipoOS1.Text := IntToStr(QOS_TipoConsCOD_OS_TIPO.Value);
      METipoOS1Change(Self);
      QOS_TipoCons.close;
    end;
  end;
end;

procedure TFOficinaParam.SBMecanicoCons1Click(Sender: TObject);
begin
  inherited;
  if FMecanicoCons = nil then
    FMecanicoCons:= TFMecanicoCons.Create(Application);
  if FMecanicoCons.ShowModal = mrOk then
  begin
    with DMOficina do
    begin
      MEMecanicoCod1.Text := IntToStr(QMecanicoConsCOD_MECANICO.Value);
      MEMecanicoCod1Change(Self);
      QMecanicoCons.Close;
    end;
  end;
end;

procedure TFOficinaParam.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FMecanicoCons = nil then
     FMecanicoCons:= TFMecanicoCons.Create(Application);
  if FMecanicoCons.ShowModal = mrOk then
     ME12CodMecanico.Text:= IntToStr(DMOficina.QMecanicoConsCOD_Mecanico.Value);
end;

procedure TFOficinaParam.ME12CodMecanicoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME12CodMecanico.Text) <> '' then
     ED12DescMecanico.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_MECANICO','COD_MECANICO = '+Trim(ME12CodMecanico.Text))
  else
     ED12DescMecanico.Text := 'Todos';
end;

procedure TFOficinaParam.ME13CodMecanicoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME13CodMecanico.Text) <> '' then
     ED13DescMecanico.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_MECANICO','COD_MECANICO = '+Trim(ME13CodMecanico.Text))
  else
     ED13DescMecanico.Text := 'Todos';
end;

procedure TFOficinaParam.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if FMecanicoCons = nil then
    FMecanicoCons:= TFMecanicoCons.Create(Application);
  if FMecanicoCons.ShowModal = mrOk then
    ME16CodMecanico.Text:= IntToStr(DMOficina.QMecanicoConsCOD_Mecanico.Value);
end;

procedure TFOficinaParam.Bt14ChassiClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
  begin
    ME14Chassi.Text := DMOficina.QVeiculoConsNUM_CHASSI.Value;
    DMOficina.QVeiculoCons.Close;
  end;

end;

procedure TFOficinaParam.ME15CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME15CodFilial.Text) <> '' then
     ME15DescFilial.Text:= DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME15CodFilial.Text)
  else
     ME15DescFilial.Text := 'Todas';
end;

procedure TFOficinaParam.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:= TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
     ME15CodFilial.Text:= IntToStr(DMFilial.QFilialConsCOD_FILIAL.Value);
end;

procedure TFOficinaParam.TabSheet13Show(Sender: TObject);
begin
  inherited;
  ME15CodFilial.SetFocus;
end;

procedure TFOficinaParam.SpeedButton8Click(Sender: TObject);
begin
  inherited;
    if FFilialCons = nil then
     FFilialCons:= TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
     ME16CodFilial.Text:= IntToStr(DMFilial.QFilialConsCOD_FILIAL.Value);
end;

procedure TFOficinaParam.ME16CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME16CodFilial.Text) <> '' then
     ME16DescFilial.Text:= DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME16CodFilial.Text)
  else
     ME16DescFilial.Text := 'Todas';
end;

procedure TFOficinaParam.ME16CodMecanicoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME16CodMecanico.Text) <> '' then
     ED16DescMecanico.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_MECANICO','COD_MECANICO = '+Trim(ME16CodMecanico.Text))
  else
     ED16DescMecanico.Text := 'Todos';
end;

procedure TFOficinaParam.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if FMecanicoCons = nil then
    FMecanicoCons:= TFMecanicoCons.Create(Application);
  if FMecanicoCons.ShowModal = mrOk then
     ME17CodMecanico.Text:= IntToStr(DMOficina.QMecanicoConsCOD_Mecanico.Value);
end;

procedure TFOficinaParam.ME17CodMecanicoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME17CodMecanico.Text) <> '' then
     ED17DescMecanico.Text:= DMOracle.BuscaNome('SELECT NOME FROM TB_MECANICO','COD_MECANICO = '+Trim(ME17CodMecanico.Text))
  else
     ED17DescMecanico.Text := 'Todos';
end;

procedure TFOficinaParam.ME19DescPecasKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #8, #13, ',']) then
    key := #0;
end;

procedure TFOficinaParam.ME19DescServicosKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #8, #13, ',']) then
    key := #0;
end;

procedure TFOficinaParam.FormCreate(Sender: TObject);
begin
  inherited;
  Bib.PriUltData(Fm20Datas.MeDtInicial, Fm20Datas.MeDtFinal, True);
  Fm21Filial.MeFilial.Text := IntToStr(DMUsuario.CodUsuarioCorrente);
  Fm21Filial.MeFilialExit(Fm21Filial.MeFilial);
  Fm21Datas.MeDtInicial.Text := DateToStr(Date);
  Fm21Datas.MeDtFinal.Text := DateToStr(Date);
end;

procedure TFOficinaParam.ME23NumCopiasExit(Sender: TObject);
begin
  inherited;
  if ME23NumCopias.Text = '' then
    ME23NumCopias.Text := '0';
end;

procedure TFOficinaParam.ME23NumCopiasKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', #8, #13]) then
    Key := #0;
end;

procedure TFOficinaParam.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  if FOsCons = nil then
    FOsCons:= TFOsCons.Create(Application);
  if FOsCons.ShowModal = mrOk then
    ME24NumOS.Text:= IntToStr(DMOs.QOSConsNUM_OS.Value);
end;

procedure TFOficinaParam.ME22NumOSKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', #8, #13]) then
    Key := #0;
end;

procedure TFOficinaParam.SBOSCons25Click(Sender: TObject);
begin
  inherited;
  if FOsCons = nil then
    FOsCons:= TFOsCons.Create(Application);
  if FOsCons.ShowModal = mrOk then
    ME25OS.Text:= IntToStr(DMOs.QOSConsNUM_OS.Value);
end;

end.
