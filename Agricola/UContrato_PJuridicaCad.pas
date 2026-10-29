unit UContrato_PJuridicaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, ComObj, DBDirceu, Grids, DBGrids, variants,
  OracleNavigator, ActnList, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

type
  TFContrato_PJuridica = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit15: TDBEdit;
    Label15: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    BtFilial: TSpeedButton;
    DBRadioGroup5: TDBRadioGroup;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    BtCadastro: TSpeedButton;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BtProduto: TSpeedButton;
    Label55: TLabel;
    DBEdit37: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    BtBanco: TSpeedButton;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    BtCorretora: TSpeedButton;
    GroupBox1: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    BtOperacao: TSpeedButton;
    BtMensagem: TSpeedButton;
    BtTributacao: TSpeedButton;
    Label47: TLabel;
    BtMsgCorpoNota: TSpeedButton;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit32: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    DBEdit31: TDBEdit;
    DBRadioGroup3: TDBRadioGroup;
    Label19: TLabel;
    DBEdit18: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label20: TLabel;
    DBEdit19: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label53: TLabel;
    DBEdit36: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label31: TLabel;
    DBEdit21: TDBEdit;
    DBRadioGroup4: TDBRadioGroup;
    RelaodeContratos1: TMenuItem;
    Opes1: TMenuItem;
    EmissoContrato1: TMenuItem;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    TabSheet2: TTabSheet;
    DBEdit22: TDBEdit;
    DBEdit26: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    SBContatoFilial: TSpeedButton;
    SBContatoCliente: TSpeedButton;
    DBEdit28: TDBEdit;
    Label18: TLabel;
    Label21: TLabel;
    DBEdit33: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DBDirceu5: TDBDirceu;
    DBDirceu6: TDBDirceu;
    DBDirceu7: TDBDirceu;
    TabSheet3: TTabSheet;
    DBText3: TDBText;
    Label22: TLabel;
    Label65: TLabel;
    SpeedButton7: TSpeedButton;
    Label66: TLabel;
    SpeedButton8: TSpeedButton;
    DBGrid3: TDBGrid;
    BitBtn1: TBitBtn;
    Button1: TButton;
    GroupBox2: TGroupBox;
    SpeedButton1: TSpeedButton;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    SpeedButton3: TSpeedButton;
    Label28: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Bt12Filial: TSpeedButton;
    Label43: TLabel;
    Label52: TLabel;
    Label32: TLabel;
    MECodOperacao: TMaskEdit;
    MEOperacao: TMaskEdit;
    MECodSerie: TMaskEdit;
    MEQtde: TMaskEdit;
    DBEdit20: TDBEdit;
    MECodTribProd: TMaskEdit;
    METribut: TMaskEdit;
    MeDtEmissao: TMaskEdit;
    MeNrNota: TMaskEdit;
    MECodFilial: TMaskEdit;
    RGPagto: TRadioGroup;
    BtConsMensagem: TBitBtn;
    MeCodMens: TMaskEdit;
    MeDtSaida: TMaskEdit;
    MeObs: TMaskEdit;
    MeObs1: TMaskEdit;
    GroupBox3: TGroupBox;
    Label27: TLabel;
    SpeedButton2: TSpeedButton;
    Label30: TLabel;
    Label54: TLabel;
    SpeedButton4: TSpeedButton;
    Label56: TLabel;
    SpeedButton5: TSpeedButton;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    SpeedButton6: TSpeedButton;
    Label63: TLabel;
    Label64: TLabel;
    MECodTransportadora: TMaskEdit;
    METransportadora: TMaskEdit;
    MEPlaca: TMaskEdit;
    MeCodTribFrete: TMaskEdit;
    RgTipoFrete: TRadioGroup;
    MeOperacaoFrete: TMaskEdit;
    MeNumFrete: TMaskEdit;
    MePrecoTon: TMaskEdit;
    MeValFrete: TMaskEdit;
    MeValPedagio: TMaskEdit;
    MeDtEmissaoFrete: TMaskEdit;
    MeOrdemCarregamento: TMaskEdit;
    MeBaseCalculo: TMaskEdit;
    MeValIcm: TMaskEdit;
    MeParceria: TMaskEdit;
    MeMotorista: TMaskEdit;
    DSContratoPJuridicaNota: TDataSource;
    DBRadioGroup6: TDBRadioGroup;
    ConfirmaContrato1: TMenuItem;
    VoltaConfirmao1: TMenuItem;
    Label29: TLabel;
    MeQtChegada: TMaskEdit;
    DBRadioGroup7: TDBRadioGroup;
    EmissodeContrato1: TMenuItem;
    Label33: TLabel;
    DBEdit16: TDBEdit;
    Label37: TLabel;
    DBEdit17: TDBEdit;
    MeValTotal: TMaskEdit;
    Label38: TLabel;
    RelatrioContratoscomMovimentao1: TMenuItem;
    Label79: TLabel;
    MEDCO: TMaskEdit;
    Label39: TLabel;
    DBEdit23: TDBEdit;
    BtConsPadrao: TSpeedButton;
    TabSheet4: TTabSheet;
    Label40: TLabel;
    Label41: TLabel;
    DBText1: TDBText;
    Label42: TLabel;
    Label84: TLabel;
    DBGrid1: TDBGrid;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    OracleNavigator1: TOracleNavigator;
    DBEdit52: TDBEdit;
    MEModelo: TMaskEdit;
    Label44: TLabel;
    TabSheet5: TTabSheet;
    DBGrid2: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox4: TGroupBox;
    Label49: TLabel;
    SpeedButton9: TSpeedButton;
    Label50: TLabel;
    Label51: TLabel;
    MeArquivo: TMaskEdit;
    BitBtn3: TBitBtn;
    DBEdit27: TDBEdit;
    DBEdit34: TDBEdit;
    DsContratoJuridica_Doc: TDataSource;
    OpenDialog: TOpenDialog;
    procedure BtFilialClick(Sender: TObject);
    procedure BtCadastroClick(Sender: TObject);
    procedure BtProdutoClick(Sender: TObject);
    procedure BtCorretoraClick(Sender: TObject);
    procedure BtBancoClick(Sender: TObject);
    procedure BtOperacaoClick(Sender: TObject);
    procedure BtMensagemClick(Sender: TObject);
    procedure BtTributacaoClick(Sender: TObject);
    procedure BtMsgCorpoNotaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaodeContratos1Click(Sender: TObject);
    procedure SBContatoFilialClick(Sender: TObject);
    procedure SBContatoClienteClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure MECodTribProdExit(Sender: TObject);
    procedure MECodOperacaoExit(Sender: TObject);
    procedure Bt12FilialClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BtConsMensagemClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure MeCodTribFreteExit(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure MECodTransportadoraExit(Sender: TObject);
    procedure MePrecoTonExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ConfirmaContrato1Click(Sender: TObject);
    procedure VoltaConfirmao1Click(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure EmissodeContrato1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RelatrioContratoscomMovimentao1Click(Sender: TObject);
    procedure BtConsPadraoClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    procedure AtzTrib_Juridico;
    Procedure Limpa;
    Function Checa :Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContrato_PJuridica: TFContrato_PJuridica;
  WinWord, Docs, Doc: Variant;

implementation

uses UContrato_Pjuridica_cl, UFilialCons, UCadastroCons, UProdutoCons,
  UContaCorrenteCons, UOperacaoCons, UMensagemCons, UTributacaoCons,
  Ucontrato_cl, UProduto_cl, UCadastro_cl, UBancoAgencia_cl, UOperacao_cl,
  UMensagem_cl, UTributacao_cl, UFilial_cl, UContrato_PJuridicaCons,
  UContrato_Param, UUsuario_cl, URContratoPJuridica, UBiblioteca,
  UProdutoAgricola_cl, UOracle_cl, UOrdemCarregamentoCons,
  UOrdemCarregamento_cl, UNotaEntrada_cl, UNotaEntrada_Confirma,
  UParamSistema_cl, UConhecimentoFreteCad, UConhecimentoFrete_cl,
  UContrato_CP, UrContratoPJuridicaNotas, UPadraoDescontoProdutoCons,
  UPadraoProduto_cl, UPDFViewer;

{$R *.DFM}

procedure TFContrato_PJuridica.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.Showmodal = mrOk then
    DMContrato_PJuridica.QContratoPJuridicaCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFContrato_PJuridica.BtCadastroClick(Sender: TObject);
begin
  inherited;
if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMContrato_PJuridica.QContratoPJuridicaCod_Cadastro.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFContrato_PJuridica.BtProdutoClick(Sender: TObject);
begin
  inherited;
if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    DMContrato_PJuridica.QContratoPJuridicaCOD_PRODUTO.Value:=Trunc(DMProduto.QProdutoConsCod_Produto.Value);
end;

procedure TFContrato_PJuridica.BtCorretoraClick(Sender: TObject);
begin
  inherited;
if FCadastroCons  = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMContrato_PJuridica.QContratoPJuridicaCOD_CORRETORA.Value:=DMCadastro.QCadastroConsCOD_CADASTRO.Value;
end;

procedure TFContrato_PJuridica.BtBancoClick(Sender: TObject);
begin
  inherited;
if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOk then
    DMContrato_PJuridica.QContratoPJuridicaCOD_CC.Value:=DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value;
end;

procedure TFContrato_PJuridica.BtOperacaoClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons  = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = mrOk then
    DMContrato_PJuridica.QContratoPJuridicaCOD_OPERACAO.Value:=DMOperacao.QOperacaoConsCOD_OPERACAO.Value;

end;

procedure TFContrato_PJuridica.BtMensagemClick(Sender: TObject);
begin
  inherited;
  if FMensagemCons  = nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  if FMensagemCons.ShowModal = mrOk then
    DMContrato_PJuridica.QContratoPJuridicaCOD_MENSAGEM.Value:=DMMensagem.QMensagemConsCOD_MENSAGEM.Value;

end;

procedure TFContrato_PJuridica.BtTributacaoClick(Sender: TObject);
begin
  inherited;
  if FTributacaoCons  = nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  if FTributacaoCons.ShowModal = mrOk then
    DMContrato_PJuridica.QContratoPJuridicaCOD_TRIBUTACAO.Value:=DMTributacao.QTributacaoConsCOD_TRIBUTACAO.Value;

end;

procedure TFContrato_PJuridica.BtMsgCorpoNotaClick(Sender: TObject);
begin
  inherited;
  if FMensagemCons  = nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  if FMensagemCons.ShowModal = mrOk then
    DMContrato_PJuridica.QContratoPJuridicaCOD_MSG_CORPO_NOTA.Value:=DMMensagem.QMensagemConsCOD_MENSAGEM.Value;

end;

procedure TFContrato_PJuridica.FormActivate(Sender: TObject);
begin
  inherited;
  DMContrato_PJuridica.QContratoPJuridica.Open;
  DMContrato_PJuridica.QContratoPJuridicaNota.Close;
  DMContrato_PJuridica.QContratoPJuridicaNota.Open;
  DMContrato_PJuridica.QContrato_PJuridica_Pagto.Open;
  DMContrato_PJuridica.QContratoPJuridica_Doc.Open;
end;

procedure TFContrato_PJuridica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMContrato_PJuridica.QContratoPJuridica.close;
  DMContrato_PJuridica.QContrato_PJuridica_Pagto.Close;
  DMContrato_PJuridica.QContratoPJuridicaNota.Close;
  DMContrato_PJuridica.QContratoPJuridica_Doc.Close;
  Action := CaFree;
  FContrato_PJuridica := Nil;
end;

procedure TFContrato_PJuridica.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DSInsert, DSEdit] then
    begin
      BtBanco.Enabled:=True;
      BtCorretora.Enabled:=True;
      BtProduto.Enabled:=True;
      BtCadastro.Enabled:=True;
      BtFilial.Enabled:=True;
      BtOperacao.Enabled:=True;
      BtMensagem.Enabled:=True;
      BtTributacao.Enabled:=True;
      BtMsgCorpoNota.Enabled:=True;
      SBContatofilial.Enabled:=True;
      SBContatoCliente.Enabled:=True;
    end
  else
    begin
      BtBanco.Enabled:=False;
      BtCorretora.Enabled:=False;
      BtProduto.Enabled:=False;
      BtCadastro.Enabled:=False;
      BtFilial.Enabled:=False;
      BtOperacao.Enabled:=False;
      BtMensagem.Enabled:=False;
      BtTributacao.Enabled:=False;
      BtMsgCorpoNota.Enabled:=False;
      SBContatofilial.Enabled:=False;
      SBContatoCliente.Enabled:=False;
    end;

end;

procedure TFContrato_PJuridica.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FContrato_PJuridicaCons = nil then
    FContrato_PJuridicaCons := TFContrato_PJuridicaCons.Create(Application);
  if FContrato_PJuridicaCons.ShowModal = mrOk then
    with DMContrato_PJuridica do
     begin
       QContratoPJuridica.Close;
       QContratoPJuridica.SetVariable('PK',QContratoPJuridicaConsCOD_CONTRATO_PJURIDICA.Value);
       QContratoPJuridica.Open;
       QContratoPJuridicaCons.Close;
     end;
end;

procedure TFContrato_PJuridica.RelaodeContratos1Click(Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil then
    FContratoParam:=TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[16].TabVisible:=True;
  if FContratoParam.ShowModal = mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContratoParam.ME16Filial.Text),'AGRICOLA');
      With DMContrato_PJuridica do
        begin
          QRContratoPjuridica.Close;
          if Trim(FContratoParam.ME16Filial.text)<>'' then
            QRContratoPjuridica.SetVariable('COD_FILIAL',FContratoParam.ME16Filial.text)
          else
            QRContratoPjuridica.SetVariable('COD_FILIAL',Null);
          if Trim(FContratoParam.ME16Produto.text)<>'' then
            QRContratoPjuridica.SetVariable('COD_PRODUTO',FContratoParam.ME16Produto.text)
          else
            QRContratoPjuridica.SetVariable('COD_PRODUTO',Null);
          if Trim(FContratoParam.ME16Cadastro.text)<>'' then
            QRContratoPjuridica.SetVariable('COD_CADASTRO',FContratoParam.ME16Cadastro.text)
          else
            QRContratoPjuridica.SetVariable('COD_CADASTRO',Null);
          if Trim(FContratoParam.ME16Corretora.text)<>'' then
            QRContratoPjuridica.SetVariable('COD_CORRETORA',FContratoParam.Me16Corretora.text)
          else
            QRContratoPjuridica.SetVariable('COD_CORRETORA',Null);
          if Trim(FContratoParam.ME16Contrato.Text)<> '' Then
            QRContratoPJuridica.SetVariable('NUM_CONTRATO',FContratoParam.ME16Contrato.Text)
          else
            QRContratoPJuridica.SetVariable('NUM_CONTRATO',Null);
          if (FContratoParam.ME16DtInicial.Text ='') and (FContratoParam.ME16DtFinal.Text ='') Then
            Raise Exception.Create( 'É Preciso informar o período');
          QRContratoPJuridica.SetVariable('DT_INICIAL',FContratoParam.ME16DtInicial.Text);
          QRContratoPJuridica.SetVariable('DT_FINAL', FContratoParam.ME16Dtfinal.Text);
          QRContratoPjuridica.Open;
          if FRContratoPJuridica = nil then
            FRContratoPJuridica := TFRContratoPJuridica.Create(Application);
          FRContratoPJuridica.QrlPeriodo.Caption := 'Periodo:' + FContratoParam.ME16DtInicial.text + ' Até ' + FContratoParam.ME16DtFinal.text;
          if FContratoParam.RGPreview.ItemIndex = 0 then
            FRContratoPJuridica.QRPrimario.Preview
          else
            FRContratoPJuridica.QRPrimario.Print;
          QRContratoPjuridica.Close;
        end;
    end;
end;

procedure TFContrato_PJuridica.SBContatoFilialClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMContrato_PJuridica.QContratoPJuridicaCod_Contato_Filial.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFContrato_PJuridica.SBContatoClienteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMContrato_PJuridica.QContratoPJuridicaCod_Contato_Cliente.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFContrato_PJuridica.PageControl1Change(Sender: TObject);
begin
  inherited;
  if PageControl1.Pages[2].Visible then
    AtzTrib_Juridico;
  MeDtEmissao.Text := DateToStr(DMOracle.DataServ);
  MeDtSaida.Text := DateToStr(DMOracle.DataServ);

end;
procedure TFContrato_PJuridica.AtzTrib_Juridico;
begin
  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK', DMContrato_PJuridica.QContratoPJuridicaCOD_FILIAL.Value);
    QFilial.Open;
  end;
  MECodTribProd.text:=DMContrato_PJuridica.QContratoPJuridicaCod_tributacao.Text;
  MECodTribProdExit(Self);
  MECodFilial.text:=DMContrato_PJuridica.QContratoPJuridicaCod_Filial.Text;
  MeCodOperacao.Text := DMContrato_PJuridica.QContratoPJuridicaCod_Operacao.Text;
  MeCodOperacaoExit(Self);
  MeCodSerie.Text := DMFilial.QFilialCOD_SERIE.Value;
  MEModelo.Text := DMFilial.QFilialCOD_SERIE_MODELO.Value;
  MeCodMens.Text := DMContrato_PJuridica.QContratoPJuridicaCod_Mensagem.Text;
  If DMContrato_PJuridica.QContratoPJuridicaInd_Tipo_Frete.Value = 'CIF' Then
     RgTipoFrete.ItemIndex := 0
  else
     RgTipoFrete.ItemIndex := 1;
  If DMContrato_PJuridica.QContratoPJuridicaInd_Condicao_Pagto.Value = '1' Then
     RGPagto.ItemIndex := 0
  else
     RGPagto.ItemIndex := 1;
  MeTransportadora.Text := '.';
End;

procedure TFContrato_PJuridica.MECodTribProdExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodTribProd.Text)<>'' then
    METribut.Text:=DMOracle.BuscaNome('SELECT DESC_TRIBUTACAO FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+MECodTribProd.text)
  else
    METribut.Clear;
end;

procedure TFContrato_PJuridica.MECodOperacaoExit(Sender: TObject);
begin
  inherited;
  if MECodOperacao.text<>'' then
    MEOperacao.Text:=DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = '+MECodOperacao.text)
  else
    MEOperacao.clear;

end;

procedure TFContrato_PJuridica.Bt12FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
     MECodFilial.text:=DMFilial.QFilialConsCOD_FILIAL.text;
end;

procedure TFContrato_PJuridica.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FTributacaoCons = Nil then
    FTributacaoCons := TFtributacaoCons.Create(Application);
  if FTributacaoCons.ShowModal  = MrOk then
    begin
      MECodTribProd.text:=DMtributacao.QtributacaoConsCod_Tributacao.text;
      MECodTribProdExit(Self);
    end;

end;

procedure TFContrato_PJuridica.BtConsMensagemClick(Sender: TObject);
begin
  inherited;
  If FMensagemCons = Nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  If FMensagemCons.ShowModal = mrOk then
    MeCodMens.Text := FloatToStr(DMMensagem.QMensagemConsCod_Mensagem.Value);

end;

procedure TFContrato_PJuridica.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     MeParceria.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;

end;

procedure TFContrato_PJuridica.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons:=TFOperacaoCons.Create(Application);
  FoperacaoCons.RGTipoOperacao.ItemIndex :=  1;
  if FOperacaoCons.ShowModal = mrOk then
   begin
     MECodOperacao.Text:=DMOperacao.QOperacaoConsCOD_OPERACAO.Text;
     MECodOperacaoExit(Self);
   end;

end;

procedure TFContrato_PJuridica.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  If FOrdemCarregamentoCons = Nil then
    FOrdemCarregamentoCons := TFOrdemCarregamentoCons.Create(Application);
  If FOrdemCarregamentoCons.ShowModal = mrOk then
    If DMOrdemCarregamento.QOrdemCarregamentoConsInd_Situacao.Value = 'B' Then
       Raise Exception.Create('Ordem de Carregamento Já foi Utilizada em Outra Nota Fiscal')
    Else
     Begin
       With DMOrdemCarregamento do
       Begin
         MeOrdemCarregamento.Text := QOrdemCarregamentoConsCod_Ordem_Carregamento_Cab.Text;
         QOrdemCarregamentoCab.Close;
         QOrdemCarregamentoCab.SetVariable('Pk',QOrdemCarregamentoConsCod_Ordem_Carregamento_Cab.Value);
         QOrdemCarregamentoCab.Open;
         QOrdemCarregamentoItem.Close;
         QOrdemCarregamentoItem.Open;
         If QOrdemCarregamentoItemInd_Tipo_Frete.Value = 'CIF' Then
          Begin
            MeValPedagio.Text := FloatToStr(QOrdemCarregamentoItemVal_Pedagio.Value);
            MePrecoTon.Text := FloatToStr(QOrdemCarregamentoItemVal_Frete_Ton.Value);
            MECodTransportadora.Text := IntToStr(QOrdemCarregamentoItemCod_Motorista.Value);
            MECodTransportadoraExit(Self);
            MEPlaca.Text := QOrdemCarregamentoItemDesc_Placa_Veiculo.Value;
            If QOrdemCarregamentoItemInd_Tipo_Pgto.Value = 'C' Then
             Begin
               MeDtEmissaoFrete.Text := DateToStr(QOrdemCarregamentoCabDT_EMISSAO.Value);
               MeNumFrete.Text := '0';
             End;
            MePrecoTonExit(Self);
          End;
       End;
     End;

end;

procedure TFContrato_PJuridica.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
     MeOperacaoFrete.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFContrato_PJuridica.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if FTributacaoCons = Nil then
    FTributacaoCons := TFtributacaoCons.Create(Application);
  if FTributacaoCons.ShowModal  = MrOk then
    begin
      MECodTribFrete.text:=DMtributacao.QtributacaoConsCod_Tributacao.text;
      MECodTribFreteExit(Self);
    end;

end;

procedure TFContrato_PJuridica.MeCodTribFreteExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodTribFrete.Text)<>'' then
   Begin
    DMOracle.BuscaNome('SELECT DESC_TRIBUTACAO FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+MECodTribFrete.text);
    With DMTributacao do
    Begin
      QTributacao.Close;
      QTributacao.SetVariable('Pk',StrToInt(MECodTribFrete.Text));
      QTributacao.Open;
      If QTributacaoPerc_Tributado.Value > 0 Then
      Begin
         MeBaseCalculo.Text := FloatToStr(StrToFloat(MeValFrete.Text) * QTributacaoPerc_Tributado.Value / 100);
         MeValIcm.Text := FloatToStr(StrToFloat(MeBaseCalculo.Text) * QTributacaoPerc_Aliquota.Value / 100);
      End;
    End;
  End;

end;

procedure TFContrato_PJuridica.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     MeMotorista.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;

end;

procedure TFContrato_PJuridica.MECodTransportadoraExit(Sender: TObject);
begin
  inherited;
  if MECodTransportadora.Text<>''  then
    METransportadora.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodTransportadora.Text)
  else
    METransportadora.Clear;
end;

procedure TFContrato_PJuridica.MePrecoTonExit(Sender: TObject);
Var wPeso : Real;
   wEmbalagem,wUnidade,wTipoProduto : String;
begin
  inherited;
  If Trim(MePrecoTon.Text) <> '' Then
  Begin
    wPeso := 0;
    wUnidade := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(DMContrato_PJuridica.QContratoPJuridicaCod_Produto.Value));
    wTipoProduto := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(DMContrato_PJuridica.QContratoPJuridicaCod_Produto.Value));
    If wTipoProduto <> 'AGRICOLA' Then
       wEmbalagem := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(DMContrato_PJuridica.QContratoPJuridicaCod_Produto.Value));
    If wEmbalagem <> '' Then
       wPeso := wPeso + StrToFloat(MEQtde.Text) * StrToFloat(wEmbalagem)
    Else
       wPeso := wPeso + StrToFloat(MEQtde.Text);
    If wPeso <> 0 Then
       MeValFrete.Text := FloatToStr(wPeso * StrToFloat(MePrecoTon.Text));
    If (Trim(wUnidade) <> 'T') And (StrToFloat(MeValFrete.Text) > 0) Then
       MeValFrete.Text := FloatToStr(StrToFloat(MeValFrete.Text)  / 1000);
  End;

end;

procedure TFContrato_PJuridica.BitBtn1Click(Sender: TObject);
Var wPagto,wComando, wMsg : String;
    wNumNota : Integer;
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(MeCodFilial.Text),'AGRICOLA');
  with DMNotaEntrada do
   begin
     if Checa then
      begin
        Try
          DMOracle.DBCemapa.StartTransaction;
          DMNotaEntrada.pTipoNota := 'NORMAL';
          QNotaEntrada.Close;
          QItemNF.Close;
          QNotaEntrada.SetVariable('PK',0);
          QNotaEntrada.Open;
          QItemNF.Open;
          if Trim(MeNrNota.Text) = '' Then
             wNumNota := 0
          else
             wNumNota := StrToInt(Trim(MeNrNota.Text));
          If RGPagto.ItemIndex = 0 Then
             wPagto := '1'
          Else
             wPagto := '2';
          QNotaEntrada.Insert;
          QNotaEntradaCOD_OPERACAO.Value:=StrtoInt(Trim(MeCodOperacao.Text));
          QNotaEntradaCOD_SERIE.Value:=Trim(MeCodSerie.Text);
          QNotaEntradaCOD_SERIE_MODELO.Value:=Trim(MeModelo.Text);
          QNotaEntradaCOD_FILIAL.Value:=StrtoInt(Trim(MeCodFilial.Text));
          QNotaEntradaCOD_CADASTRO.Value:=DMContrato_PJuridica.QContratoPJuridicaCod_Cadastro.Value;
          QNotaEntradaCOD_CONTRATO_PJURIDICA.Value:=DMContrato_PJuridica.QContratoPJuridicaCOD_CONTRATO_PJURIDICA.Value;
          QNotaEntradaDESC_PLACA.Value:=Trim(MePlaca.Text);
          QNotaEntradaOBS.Value:=Trim(MeObs.Text);
          QNotaEntradaOBS_COMPLEMENTO.Value:=Trim(MeObs1.Text);
          QNotaEntradanum_dco.Value := MEDCO.Text;
          QNotaEntradaNum_Nota.Value:=wNumNota;
          If RgPagto.ItemIndex = 0 Then
             QNotaEntradaInd_Condicao_Pagto.Value := '1'
          Else
             QNotaEntradaInd_Condicao_Pagto.Value := '2';
          if Trim(MeCodMens.Text) <> '' Then
             QNotaEntradaCod_Mensagem.Value := StrToInt(Trim(MeCodMens.Text));
          If Trim(MeDtEmissao.Text) <> '' Then
             QNotaEntradaDt_Emissao.Value:=StrToDate(Trim(MeDtEmissao.Text));
          If Trim(MeDtSaida.Text) <> '' Then
             QNotaEntradaDt_Recebimento.Value:=StrToDate(Trim(MeDtSaida.Text));
          if Trim(MECodTransportadora.Text) <> '' then
             QNotaEntradaCOD_TRANSPORTADOR.Value:=StrToInt(Trim(MECodTransportadora.Text))
          else
             QNotaEntradaDESC_TRANSPORTADORA.Value:=Trim(MeTransportadora.Text);
          If RgTipoFrete.ItemIndex = 0 Then
             QNotaEntradaIND_TIPO_FRETE.Value := 'CIF'
          Else
             QNotaEntradaIND_TIPO_FRETE.Value := 'FOB';
          If Trim(MeCodTribFrete.Text) <> '' Then
             QNotaEntradaCOD_TRIBUTACAO_FRETE.Value := StrToInt(Trim(MeCodTribFrete.Text));
          If Trim(MeNumFrete.Text) <> '' Then
             QNotaEntradaNum_Conhecimento_Frete.Value := StrToInt(Trim(MeNumFrete.Text));
          If Trim(MePrecoTon.Text) <> '' Then
             QNotaEntradaVal_Frete_Ton.Value := StrToFloat(Trim(MePrecoTon.Text));
          If Trim(MeValFrete.Text) <> '' Then
             QNotaEntradaVal_Frete.Value := StrToFloat(Trim(MeValFrete.Text));
          If Trim(MeValPedagio.Text) <> '' Then
             QNotaEntradaVal_Pedagio.Value := StrToFloat(Trim(MeValPedagio.Text));
          If Trim(MeDtEmissaoFrete.Text) <> '' Then
             QNotaEntradaDt_Emissao_CF.Value := StrToDate(Trim(MeDtEmissaoFrete.Text));
          If Trim(MeOrdemCarregamento.Text) <> '' Then
             QNotaEntradaCod_Ordem_Carregamento_Cab.Value := StrToInt(Trim(MeOrdemCarregamento.Text));
          If Trim(MeOperacaoFrete.Text) <> '' Then
             QNotaEntradaCod_Operacao_Cf.Value := StrToInt(Trim(MeOperacaoFrete.Text));
          If Trim(MeBaseCalculo.Text) <> '' Then
             QNotaEntradaVal_Icm_Base_Frete.Value := StrToFloat(Trim(MeBaseCalculo.Text));
          If Trim(MeValIcm.Text) <> '' Then
             QNotaEntradaVal_Icm_Frete.Value := StrToFloat(Trim(MeValIcm.Text));
          If (Trim(MeParceria.Text) <> '') And (Trim(MeParceria.Text) <> '0') Then
             QNotaEntradaCod_Cadastro_Parceiro.Value := StrToInt(Trim(MeParceria.Text));
          If Trim(MeMotorista.Text) <> '' Then
             QNotaEntradaCod_Motorista.Value := StrToInt(Trim(MeMotorista.Text));

          if DMContrato_PJuridica.QContratoPJuridicaCOD_MSG_CORPO_NOTA.Text <> '' then
          begin
            wMsg := DMOracle.BuscaNome('SELECT DESC_MENSAGEM || '' '' || DESC_COMPLEMENTO  || '' '' || ' +
                                       'DESC_COMPLEMENTO1    || '' '' || DESC_COMPLEMENTO2 || '' '' || ' +
                                       'DESC_COMPLEMENTO3    || '' '' || DESC_COMPLEMENTO4 || '' '' || ' +
                                       'DESC_COMPLEMENTO5    || '' '' || DESC_COMPLEMENTO6 || '' '' || ' +
                                       'DESC_COMPLEMENTO7 FROM TB_MENSAGEM ', ' COD_MENSAGEM = ' +
                                       DMContrato_PJuridica.QContratoPJuridicaCOD_MSG_CORPO_NOTA.Text);

            QNotaEntradaDESC_OBS_CORPO_NOTA.Value := wMsg;
          end;

          QItemNF.Insert;
          QItemNFQT_QUANTIDADE.Value:=StrToFloat(Trim(MeQtde.Text));
          QItemNFCOD_PRODUTO.Value:=DMContrato_PJuridica.QContratoPJuridicaCOD_PRODUTO.Value;
          QItemNFCOD_TRIBUTACAO.Value:=StrToInt(Trim(MECodTribProd.Text));
//          QItemNFVAL_UNITARIO.Value:=DMContrato_PJuridica.QContratoPJuridicaPRECO.Value;
          If Trim(MeQtChegada.Text) <> '' Then
             QItemNFQt_Chegada.Value := StrToFloat(Trim(MeQtChegada.Text));
          If Trim(MeValTotal.Text) <> '' Then
             QItemNFVal_Total.Value := StrToFloat(Trim(MeValTotal.Text));
          QItemNF.Post;
          DMNotaEntrada.PContabiliza_Extra := 'N';
          If FNotaEntrada_Confirma = Nil then
            FNotaEntrada_Confirma := TFNotaEntrada_Confirma.Create(Application);
          FNotaEntrada_Confirma.ShowModal;
          DMContrato_PJuridica.QContratoPJuridica.Edit;
          DMContrato_PJuridica.QContratoPJuridicaSALDO_NF_EMBARQUE.Value := DMContrato_PJuridica.QContratoPJuridicaSALDO_NF_EMBARQUE.Value - StrToFloat(Trim(MeQtde.Text));
          DMContrato_PJuridica.QContratoPJuridica.Post;
          SBRefreshClick(Self);
          If DMOracle.DBCemapa.InTransaction Then
             DMOracle.DBCemapa.Commit;
          If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB') And
             (DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Value <> 0) Then
          Begin                   //esta incluido os dados do conhecimento na confirmacao da nota fiscal
            if FConhecimentoFreteCad = nil then
               FConhecimentoFreteCad := TFConhecimentoFreteCad.Create(Application);
            FConhecimentoFreteCad.ShowModal;
            DMConhecimentoFrete.QConhecimentoFrete.Close;
          End;
          If DMNotaEntrada.QNotaEntradaCod_Ordem_Carregamento_Cab.Text <> '' then
            With DMOracle do
            Begin
              QExecSQL.Close;
              QExecSQL.SQL.Clear;
              wComando := 'UPDATE TB_ORDEM_CARREGAMENTO_CAB SET IND_SITUACAO=' +Chr(39) + 'B' + Chr(39);
              wComando := wComando + ',COD_NOTA_CAB='+QNotaEntradaCod_Nota_Cab.Text+' WHERE COD_ORDEM_CARREGAMENTO_CAB = '+FloatToStr(DMNotaEntrada.QNotaEntradaCod_Ordem_Carregamento_Cab.Value);
              QExecSQL.SQL.Add(wComando);
              QExecSQL.ExecSQL;
            End;
          AtzTrib_Juridico;
          Limpa;
          If DMOracle.DBCemapa.InTransaction then
             DMOracle.DBCemapa.Commit;
        except
          QItemNF.Cancel;
          QNotaEntrada.Cancel;
          DMOracle.DBCemapa.Rollback;
          Raise;
        end;
      end
    else
      ShowMessage('Erro! Os dados informados são inválidos.'+#13+'Favor corrigí-los antes de tentar gerar a nota.');
  End;
end;

Function TFContrato_PJuridica.Checa : Boolean;
Var num :Real;
Begin
  if (MECodOperacao.text<>'') and (MECodSerie.text <>'')
      and (MEQtde.Text<>'') and (MEOperacao.text<>'')
      and (METransportadora.text<>'') and (MECodTribProd.text<>'') then
    begin
      Try
        num:=StrToFloat(MEQtde.text);
        if num > DMContrato_PJuridica.QContratoPJuridicaSALDO_NF_EMBARQUE.Value then
          begin
            Result:=False;
            Showmessage('Erro! A quantidade a ser aplicada é superior ao Saldo disponível.');
          end
        else
          Result:=True;
      except
        Raise Exception.Create('Erro! Quantidade inválida ou em branco.');
      end;
    end
  else
    Result:=False;
end;


procedure TFContrato_PJuridica.SBConfirmarClick(Sender: TObject);
Var wQtAplicado : String;
begin
  wQtAplicado := DMOracle.Buscanome('SELECT SUM(QT_QUANTIDADE) FROM TB_NOTA_CAB,TB_NOTA_ITEM',
                 'TB_NOTA_CAB.COD_NOTA_CAB=TB_NOTA_ITEM.COD_NOTA_CAB AND IND_SITUACAO='+Chr(39)+'2'+Chr(39)+
                 ' AND COD_CONTRATO_PJURIDICA='+DbEdit1.Text);
  If Trim(wQtAplicado) <> '' Then
     DMContrato_PJuridica.QContratoPJuridicaSALDO_NF_EMBARQUE.Value := DMContrato_PJuridica.QContratoPJuridicaQT_QUANTIDADE.Value - StrToFloat(wQtAplicado)
  Else
     DMContrato_PJuridica.QContratoPJuridicaSALDO_NF_EMBARQUE.Value := DMContrato_PJuridica.QContratoPJuridicaQT_QUANTIDADE.Value;

//  if DMContrato_PJuridica.QContratoPJuridica.State in [Dsinsert,DsEdit]  then
//    DMContrato_PJuridica.QContratoPJuridica.Post;
  inherited;
  if DMOracle.DBCemapa.inTransaction then
     DMOracle.DBCemapa.Commit;
//  inherited;
end;

procedure TFContrato_PJuridica.Button1Click(Sender: TObject);
begin
  inherited;
  if DMContrato_PJuridica.QContratoPJuridicaNotaCOD_NOTA_CAB.Value > 0 then
    begin
      if MessageDlg('Atenção! Este procedimento poderá afetar os dados de outros módulos. '+#13
                   +'Mesmo assim tem certeza em excluir esta nota de embarque ?',mtWarning,[mbYes,mbNo],0) = mrYes then
        begin
          Try
            DMOracle.DBCemapa.StartTransaction;
            with DMNotaEntrada do
              begin
                DmUsuario.Checar_Filial_Usuario( Trim(DMContrato_PJuridica.QContratoPJuridicaNotaCOD_FILIAL.Text),'AGRICOLA');
                QItemNF.Open;
                VoltaConfirmacao(DMContrato_PJuridica.QContratoPJuridicaNotaCod_Nota_Cab.Value,'S', '1');
                QNotaEntrada.Edit;
                QNotaEntradaInd_Situacao.Value := '3';
                QNotaEntrada.Post;
                QItemNF.First;
                SBRefreshClick(Self);
              end;
            DMOracle.DBCemapa.Commit;
            DMContrato_PJuridica.QContratoPJuridica.Edit;
            DMContrato_PJuridica.QContratoPJuridicaSALDO_NF_EMBARQUE.Value := DMContrato_PJuridica.QContratoPJuridicaSALDO_NF_EMBARQUE.Value + DMNotaEntrada.QItemNfQt_Quantidade.Value;
            DMContrato_PJuridica.QContratoPJuridica.Post;
            DMNotaEntrada.QItemNF.Close;
            ShowMessage('Nota de Embarque Cancelada com sucesso.');
          except
            DMOracle.DBCemapa.RollBack;
            Raise Exception.Create('Erro ao tentar voltar a Nota de Embarque');
          end;
        end;
    end
  else
    ShowMessage('Não existem notas de embarque a serem excluídas.');
end;

Procedure TFContrato_PJuridica.Limpa;
Begin
  MeTransportadora.Text := '.';
  MeParceria.Text := '';
  MEQtde.Text := '';
  MeObs.Text := '';
  MeObs1.Text := '';
  MeNumFrete.Text := '';
  MePrecoTon.Text := '';
  MeValFrete.Text := '';
  MeValPedagio.Text := '';
  MeDtEmissaoFrete.Text := '';
  MeOrdemCarregamento.Text := '';
  MeBaseCalculo.Text := '';
  MeValIcm.Text := '';
  MECodTransportadora.Text := '';
  MePlaca.Text := '';
  MeOperacaoFrete.Text := '';
  MeCodTribFrete.Text := '';
  MeMotorista.Text := '';
End;

procedure TFContrato_PJuridica.ConfirmaContrato1Click(Sender: TObject);
var wTotal: Real;
begin
  inherited;
  if (DMContrato_PJuridica.QContratoPJuridicaCOD_CONTRATO_PJURIDICA.Value <> 0) then
    begin
      DmUsuario.Checar_Filial_Usuario(DMContrato_PJuridica.QContratoPJuridicaCOD_FILIAL.Text,'AGRICOLA');
      if (DMContrato_PJuridica.QContratoPJuridicaInd_Situacao.Value = '1') then
        begin
          if FContrato_CP = Nil  then
            FContrato_CP := TFContrato_CP.Create(Application);
          wTotal := (DMContrato_PJuridica.QContratoPJuridicaQt_Quantidade.Value*DMContrato_PJuridica.QContratoPJuridicaPreco.Value)/60;
          FContrato_CP.MeValTotal.Text := FloatToStr(wTotal);
          FContrato_CP.pTipo:='CCJ';
          FContrato_CP.ShowModal;
          DMContrato_PJuridica.QContratoPJuridica.Edit;
          DMContrato_PJuridica.QContratoPJuridicaInd_Situacao.Value := '2';
          DMContrato_PJuridica.QContratoPJuridica.Post;
        end
      else
        ShowMessage('Erro! Contrato já confirmado.');
    end
  else
    ShowMessage('Erro! Nenhum contrato está selecionado.');
end;

procedure TFContrato_PJuridica.VoltaConfirmao1Click(Sender: TObject);
begin
  inherited;
  if DMContrato_PJuridica.QContratoPJuridicaInd_Situacao.Value = '2' then
    begin
        DmUsuario.Checar_Filial_Usuario( Trim(DMContrato_PJuridica.QContratoPJuridicaCOD_FILIAL.Text),'AGRICOLA');
        DMOracle.DBCemapa.StartTransaction;
        Try
          with DMContrato_PJuridica do
            begin
              QContasPagar.Close;
              QContasPagar.Open;
              QContasPagarMov.Close;
              QContasPagarMov.Open;
              While not QContasPagar.Eof do
                Begin
                  If QContasPagarMovInd_Tipo_Movimento.Value <> '' Then
                    Begin
                      If (QContasPagarMovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
                        Raise Exception.Create('Conta a Pagar com baixas!')
                      Else
                        QContasPagarMov.Delete;
                    End;
                  QContasPagar.Delete;
                End;
              DMOracle.DBCemapa.Commit;
              DMContrato_PJuridica.QContratoPJuridica.Edit;
              DMContrato_PJuridica.QContratoPJuridicaInd_Situacao.Value:='1';
              DMContrato_PJuridica.QContratoPJuridica.Post;
           end;
        Except
          DMOracle.DBCemapa.Rollback;
          ShowMessage('Não foi possivel voltar Contas a Pagar!');
          Raise;
        End;
    end;

end;

procedure TFContrato_PJuridica.SBAlterarClick(Sender: TObject);
begin
  inherited;
  if DMContrato_PJuridica.QContratoPJuridicaInd_Situacao.Value = '2' then
     Raise Exception.Create('Contrato Já Confirmado - Não é possível alterar');
end;

procedure TFContrato_PJuridica.EmissodeContrato1Click(Sender: TObject);
var
   Path,campo,rg_contato_cli,cpf_contato_cli,cid_contato_cli,est_contato_cli,rg_contato_fil,cpf_contato_fil,cid_contato_fil,est_contato_fil: String;
   wSacas,PrecoSaca : Real;
begin
  if DMContrato_PJuridica.QContratoPJuridicaCOD_CONTRATO_PJURIDICA.value <> 0 then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(DMContrato_PJuridica.QContratoPJuridicaCOD_FILIAL.Text),'AGRICOLA');
      Path:=ExtractFilePath(ParamStr(0))+'Contratos\';
      DMProdutoAgricola.QProdutoAgricola.Close;
      DMProdutoAgricola.QProdutoAgricola.SetVariable('PK',DMContrato_PJuridica.QContratoPJuridicaCOD_PRODUTO.Value);
      DMProdutoAgricola.QProdutoAgricola.Open;
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK',DMContrato_PJuridica.QContratoPJuridicaCOD_FILIAL.Value);
      DMFilial.QFilial.Open;
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK',DMContrato_PJuridica.QContratoPJuridicaCOD_CADASTRO.Value);
      DMCadastro.QCadastro.Open;
      DMProduto.QProduto.Close;
      DMProduto.QProduto.SetVariable('PK',DMContrato_PJuridica.QContratoPJuridicaCOD_PRODUTO.Value);
      DMProduto.QProduto.Open;

      wSacas := DMContrato_PJuridica.QContratoPJuridicaQT_QUANTIDADE.value / 60;
      PrecoSaca:= DMContrato_PJuridica.QContratoPJuridicaPRECO.Value / wSacas;

      // Cria objeto principal de controle
      WinWord := CreateOleObject('Word.Application');
      // Mostra o Word
      WinWord.Visible := true;
      // Pega uma interface para o objeto que manipula documentos
      Docs := WinWord.Documents;
      // Abre um Documento
      // Doc := Docs.Open(Path+'Contratovenda');
      if DBRadioGroup7.ItemIndex = 0 then
      begin
        Doc := Docs.Open(Path+'ContratoJuridicacompra');
        campo:=DMFilial.QFilialDESC_FILIAL.Value;
        Doc.Content.Find.Execute(FindText := '%desc_filial',ReplaceWith := campo,Replace:=2);
        campo:=DMFilial.QFilialNum_CGC.Value;
        Doc.Content.Find.Execute(FindText := '%cgc_filial',ReplaceWith := campo,Replace:=2);
        campo:=DMFilial.QFilialDESC_ENDERECO.Value;
        Doc.Content.Find.Execute(FindText := '%endereco_filial',ReplaceWith := campo,Replace:=2);
        campo:=DMFilial.QFilialDESC_CIDADE.Value;
        Doc.Content.Find.Execute(FindText := '%cidade_filial',ReplaceWith := campo,Replace:=2);
        campo:=DMFilial.QFilialCod_estado.Value;
        Doc.Content.Find.Execute(FindText := '%estado_filial',ReplaceWith := campo,Replace:=2);

        campo:=DMCadastro.QCadastroNOME.Value;
        Doc.Content.Find.Execute(FindText := '%nome_cadastro',ReplaceWith := campo,Replace:=2);
        campo:=DMCadastro.QCadastroNUM_INSCRICAO.Value;
        Doc.Content.Find.Execute(FindText := '%rg_cadastro',ReplaceWith := campo,Replace:=2);
        campo:=DMCadastro.QCadastroNUM_CGC_CPF.Value;
        Doc.Content.Find.Execute(FindText := '%cgc_cpf_cadastro',ReplaceWith := campo,Replace:=2);
        campo:=DMCadastro.QCadastroDESC_ENDERECO.Value;
        Doc.Content.Find.Execute(FindText := '%endereco_cadastro',ReplaceWith := campo,Replace:=2);
        campo:=DMCadastro.QCadastroDESC_CIDADE.Value;
        Doc.Content.Find.Execute(FindText := '%cidade_cadastro',ReplaceWith := campo,Replace:=2);
        campo:=DMCadastro.QCadastroCOD_ESTADO.value;
        Doc.Content.Find.Execute(FindText := '%uf_cadastro',ReplaceWith := campo,Replace:=2);

        campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_UMIDADE_CONTRATO.Value);
        Doc.Content.Find.Execute(FindText := '%max_umidade',ReplaceWith := campo,Replace:=2);
        campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_IMPUREZA_CONTRATO.Value);
        Doc.Content.Find.Execute(FindText := '%max_impureza',ReplaceWith := campo,Replace:=2);
        campo:=Bib.extenso(DMProdutoAgricola.QProdutoAgricolaPERC_AVARIADO_CONTRATO.Value,'PERC');
        Doc.Content.Find.Execute(FindText := '%avariado_extenso',ReplaceWith := campo,Replace:=2);
        campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_QUEBRADOS_CONTRATO.Value);
        Doc.Content.Find.Execute(FindText := '%max_quebra',ReplaceWith := campo,Replace:=2);
        campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_PH_CONTRATO.Value);
        Doc.Content.Find.Execute(FindText := '%ph_minimo',ReplaceWith := campo,Replace:=2);

        campo:=DateToStr(DMContrato_PJuridica.QContratoPJuridicaDT_CONTRATO.Value);
        Doc.Content.Find.Execute(FindText := '%dt_contrato',ReplaceWith := campo,Replace:=2);
        campo:=DateToStr(DMContrato_PJuridica.QContratoPJuridicaDT_ENTREGA.Value);
        Doc.Content.Find.Execute(FindText := '%dt_entrega',ReplaceWith := campo,Replace:=2);
        campo:=DMOracle.Buscanome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO ='+IntToStr(DMContrato_PJuridica.QContratoPJuridicacod_produto.Value));
        Doc.Content.Find.Execute(FindText := '%desc_produto',ReplaceWith := campo,Replace:=2);
        campo:=DMContrato_PJuridica.QContratoPJuridicaDT_ANO_SAFRA.Value;
        Doc.Content.Find.Execute(FindText := '%ano_safra',ReplaceWith := campo,Replace:=2);
        campo:=FloatToStr(PrecoSaca);
        Doc.Content.Find.Execute(FindText := '%preco_saca',ReplaceWith := campo,Replace:=2);
        campo:=FormatFloat('#,##0.00',DMContrato_PJuridica.QContratoPJuridicaPRECO.value);
        Doc.Content.Find.Execute(FindText := '%valor_total',ReplaceWith := campo,Replace:=2);
        campo:=Bib.extenso(DMContrato_PJuridica.QContratoPJuridicaPRECO.value,'REAL');
        Doc.Content.Find.Execute(FindText := '%Valor_extenso',ReplaceWith := campo,Replace:=2);
        campo:=FormatFloat('#,##0',DMContrato_PJuridica.QContratoPJuridicaNUM_CONTRATO.Value);
        Doc.Content.Find.Execute(FindText := '%nr_contrato',ReplaceWith := campo,Replace:=2);
        campo:=DMContrato_PJuridica.QContratoPJuridicaDESC_PRIM_TESTEMUNHA.Value;
        Doc.Content.Find.Execute(FindText := '%testemunha1',ReplaceWith := campo,Replace:=2);
        campo:=DMContrato_PJuridica.QContratoPJuridicaDESC_SEG_TESTEMUNHA.Value;
        Doc.Content.Find.Execute(FindText := '%testemunha2',ReplaceWith := campo,Replace:=2);


      end
      else
      begin
        Doc := Docs.Open(Path+'ContratoJuridicaGP');
        campo:=DMFilial.QFilialDESC_FILIAL.Value;
        Doc.Content.Find.Execute(FindText := '%desc_filial',ReplaceWith := campo,Replace:=2);
        campo:=DMFilial.QFilialNum_CGC.Value;
        Doc.Content.Find.Execute(FindText := '%cgc_filial',ReplaceWith := campo,Replace:=2);
        campo:=DMFilial.QFilialDESC_ENDERECO.Value;
        Doc.Content.Find.Execute(FindText := '%endereco_filial',ReplaceWith := campo,Replace:=2);
        campo:=DMFilial.QFilialDESC_CIDADE.Value;
        Doc.Content.Find.Execute(FindText := '%cidade_filial',ReplaceWith := campo,Replace:=2);
        campo:=DMFilial.QFilialCod_estado.Value;
        Doc.Content.Find.Execute(FindText := '%estado_filial',ReplaceWith := campo,Replace:=2);
        campo:=DMFilial.QFilialDESC_INSCRICAO.Value;
        Doc.Content.Find.Execute(FindText := '%I.E._filial',ReplaceWith := campo,Replace:=2);
        campo:=DMFilial.QFilialDESC_CEP.Value;
        Doc.Content.Find.Execute(FindText := '%cep_filial',ReplaceWith := campo,Replace:=2);

        campo:=DMCadastro.QCadastroNOME.Value;
        Doc.Content.Find.Execute(FindText := '%nome_cadastro',ReplaceWith := campo,Replace:=2);
        campo:=DMCadastro.QCadastroNUM_INSCRICAO.Value;
        Doc.Content.Find.Execute(FindText := '%rg_cadastro',ReplaceWith := campo,Replace:=2);
        campo:=DMCadastro.QCadastroNUM_CGC_CPF.Value;
        Doc.Content.Find.Execute(FindText := '%cgc_cpf_cadastro',ReplaceWith := campo,Replace:=2);
        campo:=DMCadastro.QCadastroDESC_ENDERECO.Value;
        Doc.Content.Find.Execute(FindText := '%endereco_cadastro',ReplaceWith := campo,Replace:=2);
        campo:=DMCadastro.QCadastroDESC_CIDADE.Value;
        Doc.Content.Find.Execute(FindText := '%cidade_cadastro',ReplaceWith := campo,Replace:=2);
        campo:=DMCadastro.QCadastroCOD_ESTADO.value;
        Doc.Content.Find.Execute(FindText := '%uf_cadastro',ReplaceWith := campo,Replace:=2);
        campo:=DMCadastro.QCadastroNUM_INSCRICAO.Value;
        Doc.Content.Find.Execute(FindText := '%I.E._cadastro',ReplaceWith := campo,Replace:=2);
        campo:=DMCadastro.QCadastroDESC_CEP.Value;
        Doc.Content.Find.Execute(FindText := '%cep_cadastro',ReplaceWith := campo,Replace:=2);
        campo:=DMCadastro.QCadastroDESC_INSCRICAO_MUNICIPAL.Value;
        Doc.Content.Find.Execute(FindText := '%inscricao_municipal_cadastro',ReplaceWith := campo,Replace:=2);

        campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_UMIDADE_CONTRATO.Value);
        Doc.Content.Find.Execute(FindText := '%max_umidade',ReplaceWith := campo,Replace:=2);
        campo:=Bib.extenso(DMProdutoAgricola.QProdutoAgricolaPERC_UMIDADE_CONTRATO.Value,'PERC');
        Doc.Content.Find.Execute(FindText := '%umidade_extenso',ReplaceWith := campo,Replace:=2);
        campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_IMPUREZA_CONTRATO.Value);
        Doc.Content.Find.Execute(FindText := '%max_impureza',ReplaceWith := campo,Replace:=2);
        campo:=Bib.extenso(DMProdutoAgricola.QProdutoAgricolaPERC_IMPUREZA_CONTRATO.Value,'PERC');
        Doc.Content.Find.Execute(FindText := '%impureza_extenso',ReplaceWith := campo,Replace:=2);
        campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_AVARIADO_CONTRATO.Value);
        Doc.Content.Find.Execute(FindText := '%max_avariado',ReplaceWith := campo,Replace:=2);
        campo:=Bib.extenso(DMProdutoAgricola.QProdutoAgricolaPERC_AVARIADO_CONTRATO.Value,'PERC');
        Doc.Content.Find.Execute(FindText := '%avariado_extenso',ReplaceWith := campo,Replace:=2);
        campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_QUEBRADOS_CONTRATO.Value);
        Doc.Content.Find.Execute(FindText := '%max_quebra',ReplaceWith := campo,Replace:=2);
        campo:=Bib.extenso(DMProdutoAgricola.QProdutoAgricolaPERC_QUEBRADOS_CONTRATO.Value,'PERC');
        Doc.Content.Find.Execute(FindText := '%quebrados_extenso',ReplaceWith := campo,Replace:=2);
        campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_ARDIDOS_CONTRATO.Value);
        Doc.Content.Find.Execute(FindText := '%max_ardido',ReplaceWith := campo,Replace:=2);
        campo:=Bib.extenso(DMProdutoAgricola.QProdutoAgricolaPERC_ARDIDOS_CONTRATO.Value,'PERC');
        Doc.Content.Find.Execute(FindText := '%ardido_extenso',ReplaceWith := campo,Replace:=2);
        campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_VERDES_CONTRATO.Value);
        Doc.Content.Find.Execute(FindText := '%max_verdes',ReplaceWith := campo,Replace:=2);
        campo:=Bib.extenso(DMProdutoAgricola.QProdutoAgricolaPERC_VERDES_CONTRATO.Value,'PERC');
        Doc.Content.Find.Execute(FindText := '%verdes_extenso',ReplaceWith := campo,Replace:=2);

        campo:=DateToStr(DMContrato_PJuridica.QContratoPJuridicaDT_ENTREGA.Value);
        Doc.Content.Find.Execute(FindText := '%dt_entrega',ReplaceWith := campo,Replace:=2);
        campo:=FormatDateTime(', dd "de" MMMM "de" yyyy',DMContrato_PJuridica.QContratoPJuridicaDT_CONTRATO.Value);
        Doc.Content.Find.Execute(FindText := '%dt_cont_extenso',ReplaceWith := campo,Replace:=2);
        campo:=DateToStr(DMContrato_PJuridica.QContratoPJuridicaDT_VENCIMENTO.Value);
        Doc.Content.Find.Execute(FindText := '%dt_vencimento',ReplaceWith := campo,Replace:=2);
        campo:=DMOracle.Buscanome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO ='+IntToStr(DMContrato_PJuridica.QContratoPJuridicacod_produto.Value));
        Doc.Content.Find.Execute(FindText := '%desc_produto',ReplaceWith := campo,Replace:=2);
        campo:=FormatFloat('#,##0',DMContrato_PJuridica.QContratoPJuridicaQT_QUANTIDADE.Value);
        Doc.Content.Find.Execute(FindText := '%quantidade',ReplaceWith := campo,Replace:=2);
        campo:=Bib.extenso(DMContrato_PJuridica.QContratoPJuridicaQT_QUANTIDADE.Value,'KG');
        Doc.Content.Find.Execute(FindText := '%quant_extenso',ReplaceWith := campo,Replace:=2);
        campo:=DMContrato_PJuridica.QContratoPJuridicaDT_ANO_SAFRA.Value;
        Doc.Content.Find.Execute(FindText := '%ano_safra',ReplaceWith := campo,Replace:=2);
        campo:=DMContrato_PJuridica.QContratoPJuridicaLOCAL_ENTREGA.Value;
        Doc.Content.Find.Execute(FindText := '%local_entrega',ReplaceWith := campo,Replace:=2);
        campo:=FormatFloat('#,##0.00',DMContrato_PJuridica.QContratoPJuridicaPRECO.value);
        Doc.Content.Find.Execute(FindText := '%valor_total',ReplaceWith := campo,Replace:=2);
        campo:=Bib.extenso(DMContrato_PJuridica.QContratoPJuridicaPRECO.value,'REAL');
        Doc.Content.Find.Execute(FindText := '%Valor_extenso',ReplaceWith := campo,Replace:=2);
        campo:=DMContrato_PJuridica.QContratoPJuridicaDESC_PRIM_TESTEMUNHA.Value;
        Doc.Content.Find.Execute(FindText := '%testemunha1',ReplaceWith := campo,Replace:=2);
        campo:=DMContrato_PJuridica.QContratoPJuridicaDESC_SEG_TESTEMUNHA.Value;
        Doc.Content.Find.Execute(FindText := '%testemunha2',ReplaceWith := campo,Replace:=2);
      end;




      // Grava documento
      Doc.SaveAs(Path+'Contratovenda2');
      // Imprime
      //Doc.PrintOut(false);
      // Fecha o Word
//      WinWord.Quit;
    end
   else
      MessageDlg('Primeiro selecione um CONTRATO para IMPRESSÃO',mtInformation,[mbOk],0);
end;


procedure TFContrato_PJuridica.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      MECodTransportadora.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;
      MECodTransportadoraExit(Self);
    end;

end;

procedure TFContrato_PJuridica.RelatrioContratoscomMovimentao1Click(
  Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil then
    FContratoParam:=TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[19].TabVisible:=True;
  if FContratoParam.ShowModal = mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FContratoParam.Me19Filial.Text),'AGRICOLA');
      With DMContrato_PJuridica do
        begin
          QRContratoPJuridicaNota.Close;
          if Trim(FContratoParam.Me19Filial.text)<>'' then
            QRContratoPJuridicaNota.SetVariable('COD_FILIAL',FContratoParam.Me19Filial.text)
          else
            QRContratoPJuridicaNota.SetVariable('COD_FILIAL',Null);
          if Trim(FContratoParam.ME19Produto.text)<>'' then
            QRContratoPJuridicaNota.SetVariable('COD_PRODUTO',FContratoParam.Me19Produto.text)
          else
            QRContratoPJuridicaNota.SetVariable('COD_PRODUTO',Null);
          if Trim(FContratoParam.Me19Cadastro.text)<>'' then
            QRContratoPJuridicaNota.SetVariable('COD_CADASTRO',FContratoParam.Me19Cadastro.text)
          else
            QRContratoPJuridicaNota.SetVariable('COD_CADASTRO',Null);
          if Trim(FContratoParam.Me19Contrato.Text)<> '' Then
            QRContratoPJuridicaNota.SetVariable('COD_CONTRATO_PJURIDICA',FContratoParam.Me19Contrato.Text)
          else
            QRContratoPJuridicaNota.SetVariable('COD_CONTRATO_PJURIDICA',Null);
          if (FContratoParam.Me19DtInicial.Text ='') and (FContratoParam.Me19DtFinal.Text ='') Then
            Raise Exception.Create( 'É Preciso informar o período');
          QRContratoPJuridicaNota.SetVariable('DT_CONTRATO_INIC',FContratoParam.Me19DtInicial.Text);
          QRContratoPJuridicaNota.SetVariable('DT_CONTRATO_FIM', FContratoParam.Me19Dtfinal.Text);
          QRContratoPJuridicaNota.Open;
          if FRContratoPJuridicaNotas = nil then
            FRContratoPJuridicaNotas := TFRContratoPJuridicaNotas.Create(Application);
          FRContratoPJuridicaNotas.QrlPeriodo.Caption := 'Periodo:' + FContratoParam.Me19DtInicial.text + ' Até ' + FContratoParam.Me19DtFinal.text;
          if FContratoParam.RGPreview.ItemIndex = 0 then
            FRContratoPJuridicaNotas.QRPrimario.Preview
          else
            FRContratoPJuridicaNotas.QRPrimario.Print;
          QRContratoPJuridicaNota.Close;
        end;
    end;
end;

procedure TFContrato_PJuridica.BtConsPadraoClick(Sender: TObject);
begin
  inherited;
  if FPadraoDescontoProdutoCons  = nil then
    FPadraoDescontoProdutoCons := TFPadraoDescontoProdutoCons.Create(Application);
  FPadraoDescontoProdutoCons.MeProduto.Text := DMContrato_PJuridica.QContratoPJuridicaCOD_PRODUTO.Text;
  FPadraoDescontoProdutoCons.MeProduto.Enabled := False;
  FPadraoDescontoProdutoCons.BtProduto.Enabled := False;
  if FPadraoDescontoProdutoCons.ShowModal = mrOk then
    If DMPadraoProduto.QPadraoDescProdConsCod_Produto.Value = DMContrato_PJuridica.QContratoPJuridicaCod_Produto.value Then
       DMContrato_PJuridica.QContratoPJuridicaCOD_PADRAO_DESCONTO_PRODUTO.Value:=DMPadraoProduto.QPadraoDescProdConsCOD_PADRAO_DESCONTO_PRODUTO.Value
    Else
       Raise Exception.Create('Produto do desconto deve ser o mesmo do contrato - Favor verificar');
  FPadraoDescontoProdutoCons.MeProduto.Enabled := True;
  FPadraoDescontoProdutoCons.BtProduto.Enabled := True;
end;

procedure TFContrato_PJuridica.SBCancelarClick(Sender: TObject);
begin
  inherited;
  DMContrato_PJuridica.QContrato_PJuridica_Pagto.Cancel;
  DMOracle.DBCemapa.RollBack;
end;

procedure TFContrato_PJuridica.SBExcluirClick(Sender: TObject);
begin
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;

  inherited;

end;

procedure TFContrato_PJuridica.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  If OpenDialog.Execute Then
     MeArquivo.Text := OpenDialog.FileName;

end;

procedure TFContrato_PJuridica.BitBtn3Click(Sender: TObject);
var
  Stream : TStream;
  FileStream : TFileStream;
  wNomeArquivo : String;
  wPosicaoBarra : Integer;
begin
  inherited;
  DMContrato_PJuridica.QContratoPJuridica_Doc.Insert;
  Stream := DMContrato_PJuridica.QContratoPJuridica_Doc.CreateBlobStream(DMContrato_PJuridica.QContratoPJuridica_DocARQUIVO, bmWrite);
  try
    Stream.Seek(0, soFromBeginning);
    FileStream := TFileStream.Create(MeArquivo.Text, fmOpenRead or fmShareDenyWrite);
    try
      Stream.CopyFrom(FileStream, FileStream.Size);
    finally
      FileStream.Free;
    end;
    wNomeArquivo := MeArquivo.Text;
    wPosicaoBarra := Pos('\', wNomeArquivo);
    while (wPosicaoBarra > 0) do begin
      wNomeArquivo := Copy(wNomeArquivo, (wPosicaoBarra+1), Length(wNomeArquivo));
      wPosicaoBarra := Pos('\', wNomeArquivo);
    end;
    DMContrato_PJuridica.QContratoPJuridica_DocNOME_ARQUIVO.AsString := wNomeArquivo;
    DMContrato_PJuridica.QContratoPJuridica_DocDESCRICAO.AsString := MeArquivo.Text;
    DMContrato_PJuridica.QContratoPJuridica_DocDT_INCLUSAO.AsDateTime := Now;
    DMContrato_PJuridica.QContratoPJuridica_DocCOD_contrato_pjuridica.Value := DMContrato_PJuridica.QContratoPJuridicaCOD_contrato_pjuridica.Value;

    DMContrato_PJuridica.QContratoPJuridica_Doc.Post;
    MessageDlg('Arquivo inserido com sucesso' ,
      MtError, [mbOK], 0);
  finally
    Stream.Free;
  end;

end;

procedure TFContrato_PJuridica.BitBtn2Click(Sender: TObject);
var
  Stream : TStream;
  FileStream : TFileStream;
  PastaTemp : String;
  NomeArquivo : String;
begin
  inherited;
  PastaTemp := GetEnvironmentVariable('TEMP');
  if (PastaTemp = '') then begin
    MessageDlg('É preciso definir a variável TEMP, para armazenamento de arquivos temporários.' ,
      mtError, [mbOK], 0);
    Abort;
  end;
  FileStream.Free;
  Stream.Free;
  NomeArquivo := PastaTemp + '\' + DsContratoJuridica_Doc.DataSet.FieldByName('NOME_ARQUIVO').AsString;
  Stream := DsContratoJuridica_Doc.DataSet.CreateBlobStream(DsContratoJuridica_Doc.DataSet.FieldByName('ARQUIVO'), bmRead);
  try
    Stream.Seek(0, soFromBeginning);
    FileStream := TFileStream.Create(NomeArquivo, fmCreate);
    try
      FileStream.CopyFrom(Stream, Stream.Size);
    finally
      FileStream.Free;
    end;
    If FPDFViewer = Nil Then
       FPDFViewer := TFPDFViewer.Create(Self);
    FPDFViewer.Caption := 'Visualizando arquivo ' + NomeArquivo;
    FPDFViewer.Pdf1.src := NomeArquivo;
    FPDFViewer.ShowModal;
//    FPDFViewer := Nil;
  finally
    Stream.Free;
  end;

end;

procedure TFContrato_PJuridica.BitBtn4Click(Sender: TObject);
begin
  inherited;
  DMContrato_PJuridica.QContratoPJuridica_Doc.Delete;

end;

procedure TFContrato_PJuridica.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit2.Text);
end;

end.
