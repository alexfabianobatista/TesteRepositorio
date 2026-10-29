unit UGuiaAplicacaoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, Mask, ComCtrls, ExtCtrls, Buttons, DBCtrls;

type
  TFGuiaAplicacaoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    MeAgronomo: TMaskEdit;
    BitBtn4: TBitBtn;
    EdAgronomo: TEdit;
    Label1: TLabel;
    MeCultura: TMaskEdit;
    BitBtn5: TBitBtn;
    EdCultura: TEdit;
    Label5: TLabel;
    EdLocalAplicacao: TEdit;
    Label8: TLabel;
    MeQuantidade: TMaskEdit;
    EdProduto: TEdit;
    EdCadastro: TEdit;
    MeCadastro: TMaskEdit;
    BitBtn2: TBitBtn;
    MeProduto: TMaskEdit;
    BitBtn3: TBitBtn;
    Label9: TLabel;
    BtConsFilial: TBitBtn;
    MeFilial: TMaskEdit;
    EdFilial: TEdit;
    EdPraga: TEdit;
    Label4: TLabel;
    MePraga: TMaskEdit;
    BitBtn1: TBitBtn;
    Label6: TLabel;
    MeNrNota: TMaskEdit;
    procedure MeCadastroExit(Sender: TObject);
    procedure MeProdutoExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure MeAgronomoExit(Sender: TObject);
    procedure MeCulturaExit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure MeFilialExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MePragaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGuiaAplicacaoParam: TFGuiaAplicacaoParam;

implementation

uses UCadastro_cl, UProduto_cl, UCadastroCons, UProdutoCons, UPraga_cl,
  UPragaCons, UAgronomo_cl, UCultura_cl, UAgronomoCons, UCulturaCons,
  URGuiaAplicacao, UGuiaAplicacao_cl, UGuiaAplicacaoCons, UFilial_cl,
  UFilialCons, UUsuario_cl, UOracle_cl, USequencia_cl;

{$R *.DFM}

procedure TFGuiaAplicacaoParam.MeCadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(MECadastro.Text) <> '' Then
  With DMCadastro do
  Begin
    QCadastro.Close;
    QCadastro.SetVariable('PK',MECadastro.Text);
    QCadastro.Open;
    EdCadastro.Text := QCadastroNome.Text;
    EdLocalAplicacao.Text := QCadastroDesc_Endereco.Text
  End
  else
    EdCadastro.Text := 'Informar Cadastro';

end;

procedure TFGuiaAplicacaoParam.MeProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(MEProduto.Text) <> '' Then
  With DMProduto do
  Begin
    QProduto.Close;
    QProduto.SetVariable('PK',MEProduto.Text);
    QProduto.Open;
    EdProduto.Text := QProdutoDesc_Produto.Text
  End
  Else
    EdProduto.Text := 'Informar Produto';

end;

procedure TFGuiaAplicacaoParam.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
  begin
     MeCadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
     MeCadastroExit(Self)
  end;

end;

procedure TFGuiaAplicacaoParam.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
  begin
     MeProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
     MeProdutoExit(Self)
  end;

end;

procedure TFGuiaAplicacaoParam.MeAgronomoExit(Sender: TObject);
begin
  inherited;
  if Trim(MEAgronomo.Text) <> '' Then
  with DMAgronomo do
    begin
      QAgronomo.Close;
      QAgronomo.SetVariable('PK',MEAgronomo.Text);
      QAgronomo.Open;
      EdAgronomo.Text := QAgronomoNome.Text
    end
    else
       EDAgronomo.Text := 'Informar Agrônomo';
end;

procedure TFGuiaAplicacaoParam.MeCulturaExit(Sender: TObject);
begin
  inherited;
  If Trim(MECultura.Text) <> '' Then
  With DMCultura do
  Begin
    QCultura.Close;
    QCultura.SetVariable('PK',MECultura.Text);
    QCultura.Open;
    EdCultura.Text := QCulturaDesc_Cultura.Text
  End
  Else
    EDCultura.Text := 'Informar Cultura';

end;

procedure TFGuiaAplicacaoParam.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FAgronomoCons = nil then
     FAgronomoCons := TFAgronomoCons.Create(Application);
  If FAgronomoCons.ShowModal = mrOK then
  begin
     MeAgronomo.Text := DMAgronomo.QAgronomoConsCod_Agronomo.Text;
     MeAgronomoExit(Self)
  end;

end;

procedure TFGuiaAplicacaoParam.BitBtn5Click(Sender: TObject);
begin
  inherited;
  If FCulturaCons = nil then
     FCulturaCons := TFCulturaCons.Create(Application);
  If FCulturaCons.ShowModal = mrOK then
  begin
     MeCultura.Text := DMCultura.QCulturaConsCod_Cultura.Text;
     MeCulturaExit(Self)
  end;

end;

procedure TFGuiaAplicacaoParam.BtOkClick(Sender: TObject);
var wNumeroGuia: Real;
begin
  inherited;
  if MeCadastro.Text = '' then
     Raise Exception.Create ('Preencher Código Cadastro');
  if MeProduto.Text = '' then
     Raise Exception.Create ('Preencher Código Produto');
  if MeAgronomo.Text = '' then
     Raise Exception.Create ('Preencher Código Agrônomo');
  if MeCultura.Text = '' then
     Raise Exception.Create ('Preencher Código Cultura');
  if MePraga.Text = '' then
     Raise Exception.Create ('Preencher Código Praga');
  If FRGuiaAplicacao = Nil then
       FRGuiaAplicacao := TFRGuiaAplicacao.Create(Application);
  With DMGuiaAplicacao do
  Begin
    QGuiaAplicacao.Close;
    QGuiaAplicacao.SetVariable('PK',MEProduto.Text);
    QGuiaAplicacao.Open;
  End;
  FRGuiaAplicacao.QrQuantidade.Caption :=  DmOracle.BuscaNome('SELECT NUM_DOSE FROM TB_PRAGA_PRODUTO', 'COD_PRODUTO = ' + MeProduto.Text +
               ' AND COD_PRAGA = '+ MePraga.Text);
  FRGuiaAplicacao.QrNome.Caption := DMCadastro.QCadastroNome.Text ;
  FRGuiaAplicacao.QrEndereco.Caption := DmCadastro.QCadastroDesc_Endereco.Text;
  FRGuiaAplicacao.QrCultura.Caption := DMCultura.QCulturaDesc_Cultura.Text;
  FRGuiaAplicacao.QrAreaTratada.Caption := MeQuantidade.Text;
  FRGuiaAplicacao.QrLocalAplicacao.Caption := EdLocalAplicacao.Text;
  FRGuiaAplicacao.QrProduto.Caption := DMProduto.QProdutoDesc_Produto.Text;
  FRGuiaAplicacao.QrFormaAplicacao.Caption := DMGuiaAplicacao.QGuiaAplicacaoDesc_Forma_Aplicacao.Value;
  FRGuiaAplicacao.QrRiscos.Caption := DMGuiaAplicacao.QGuiaAplicacaoDesc_Riscos.Value;
  FRGuiaAplicacao.QrCuidados.Caption := DMGuiaAplicacao.QGuiaAplicacaoDesc_Cuidados.Value;
  FRGuiaAplicacao.QrEngenheiro.Caption := DMAgronomo.QAgronomoNome.Text;
  FRGuiaAplicacao.QrCpf.Caption := DMAgronomo.QAgronomoDesc_Crea.Text;
  FRGuiaAplicacao.QrEmpresa.Caption := DMFilial.QFilialDesc_Filial.Text;
  FRGuiaAplicacao.QrEnderecoLocal.Caption := DMFilial.QFilialDesc_Endereco.Text;
  wNumeroGuia := DMSequencia.Sequencia(StrToInt(Trim(MEFilial.Text)),'GUIA_APLICACAO');
  FRGuiaAplicacao.QrNrGuia.Caption := FloatToStr(wNumeroGuia);
  FRGuiaAplicacao.QrNrNota.Caption := MeNrNota.Text;
  FRGuiaAplicacao.QRPrimario.Preview;

end;

procedure TFGuiaAplicacaoParam.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
  begin
     MeFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
     MeFilialExit(Self)
  end;

end;

procedure TFGuiaAplicacaoParam.MeFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(MEFilial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',MEFilial.Text);
    QFilial.Open;
    EdFilial.Text := QFilialDesc_Filial.Text
  End
  else
    EdFilial.Text := 'Informar Filial';

end;

procedure TFGuiaAplicacaoParam.FormCreate(Sender: TObject);
begin
  inherited;
  MeFilial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  MeFilialExit(Self)
end;

procedure TFGuiaAplicacaoParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FPragaCons = nil then
     FPragaCons := TFPragaCons.Create(Application);
  If FPragaCons.ShowModal = mrOK then
  begin
     MePraga.Text := DMPraga.QPragaConsCod_Praga.Text;
     MePragaExit(Self)
  end;

end;

procedure TFGuiaAplicacaoParam.MePragaExit(Sender: TObject);
begin
  inherited;
  If Trim(MEPraga.Text) <> '' Then
  With DMPraga do
  Begin
    QPraga.Close;
    QPraga.SetVariable('PK',MEPraga.Text);
    QPraga.Open;
    EdPraga.Text := QPragaDesc_Praga.Text
  End
  Else
    EDPraga.Text := 'Informar Praga';

end;

procedure TFGuiaAplicacaoParam.FormActivate(Sender: TObject);
begin
  inherited;
  MeFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
end;

end.
