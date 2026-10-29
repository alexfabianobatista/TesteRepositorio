unit UContratoPremioCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFContratoPremioCons = class(TFTConsulta)
    sbFilial: TSpeedButton;
    edFilial: TEdit;
    Label2: TLabel;
    MECadastro: TMaskEdit;
    SBCadastro: TSpeedButton;
    edCadastro: TEdit;
    Label3: TLabel;
    MEProduto: TMaskEdit;
    SBProduto: TSpeedButton;
    edProduto: TEdit;
    GroupBox1: TGroupBox;
    MEDtEmissaoIni: TMaskEdit;
    MEDtEmissaoFim: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    MEDtEntregaIni: TMaskEdit;
    MEDtEntregaFim: TMaskEdit;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    MEDtVencimentoIni: TMaskEdit;
    MEDtVencimentoFim: TMaskEdit;
    RGMoeda: TRadioGroup;
    RGSituacao: TRadioGroup;
    procedure sbFilialClick(Sender: TObject);
    procedure METextoExit(Sender: TObject);
    procedure MECadastroExit(Sender: TObject);
    procedure SBCadastroClick(Sender: TObject);
    procedure SBProdutoClick(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoPremioCons: TFContratoPremioCons;

implementation

uses UContratoPremio_cl, UFilialCons, UFilial_cl, UOracle_cl, UCadastroCons,
  UCadastro_cl, UProdutoCons, UProduto_cl;

{$R *.DFM}

procedure TFContratoPremioCons.sbFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
  With DMFilial do
  begin
    METexto.Text:=FloatToStr(QFilialConsCod_Filial.Value);
    METextoExit(Self);
  end;
end;

procedure TFContratoPremioCons.METextoExit(Sender: TObject);
begin
  inherited;
  if Trim(METexto.Text)<>'' then
    edFilial.Text:=DMOracle.Buscanome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MEtexto.text)
  else
    edFilial.text := 'Todas';
end;

procedure TFContratoPremioCons.MECadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(MECadastro.Text)<>'' then
    edCadastro.Text:=DMOracle.Buscanome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECadastro.text)
  else
    edCadastro.text := 'Todos';
end;

procedure TFContratoPremioCons.SBCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FcadastroCons.ShowModal = MrOk then
  with DmCadastro do
  begin
    MEcadastro.text := FloatToStr(QCadastroConsCod_Cadastro.Value);
    MEcadastroExit(Self);
  end;
end;

procedure TFContratoPremioCons.SBProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    EdProduto.Text:=DMProduto.QProdutoConsDesc_Produto.Value;
    MEProduto.Text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.Value);
  end; 
end;

procedure TFContratoPremioCons.MEProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(MEProduto.Text) <> '' then
    EdProduto.Text:=DMOracle.Buscanome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+ MEProduto.text)
  else
    EdProduto.Text := 'Todos';
end;

procedure TFContratoPremioCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMContratoPremio.QContratoPremioCons.close;

  if  trim(METexto.Text) <> '' then
    DMContratoPremio.QContratoPremioCons.SetVariable('COD_FILIAL', StrToInt(TRIM(METexto.Text)))
  else
    DMContratoPremio.QContratoPremioCons.SetVariable('COD_FILIAL', null);

  if trim(MECadastro.Text) <> '' then
    DMContratoPremio.QContratoPremioCons.SetVariable('COD_CADASTRO', StrToInt(TRIM(MECadastro.Text)))
  else
    DMContratoPremio.QContratoPremioCons.SetVariable('COD_CADASTRO', null);

  if trim(MEProduto.Text) <> '' then
    DMContratoPremio.QContratoPremioCons.SetVariable('COD_PRODUTO', StrToInt(TRIM(MEProduto.Text)))
  else
    DMContratoPremio.QContratoPremioCons.SetVariable('COD_PRODUTO', null);

  if RGMoeda.ItemIndex = 0 then
    DMContratoPremio.QContratoPremioCons.SetVariable('IND_TIPO_PREMIO', null);    //TODOS
  if RGMoeda.ItemIndex = 1 then
    DMContratoPremio.QContratoPremioCons.SetVariable('IND_TIPO_PREMIO', 'PR');     //PREMIO REAIS
  if RGMoeda.ItemIndex = 2 then
    DMContratoPremio.QContratoPremioCons.SetVariable('IND_TIPO_PREMIO', 'PD');     //PREMIO DOLAR
  if RGMoeda.ItemIndex = 3 then
    DMContratoPremio.QContratoPremioCons.SetVariable('IND_TIPO_PREMIO', 'PP');     //PREMIO PORCENTAGEM
  if RGMoeda.ItemIndex = 4 then
    DMContratoPremio.QContratoPremioCons.SetVariable('IND_TIPO_PREMIO', 'FR');     //FIXO REAL
  if RGMoeda.ItemIndex = 5 then
    DMContratoPremio.QContratoPremioCons.SetVariable('IND_TIPO_PREMIO', 'FD');     //FIXO DOLAR

  if RGSituacao.ItemIndex = 0 then
    DMContratoPremio.QContratoPremioCons.SetVariable('IND_SITUACAO', null);
  if RGSituacao.ItemIndex = 1 then
    DMContratoPremio.QContratoPremioCons.SetVariable('IND_SITUACAO', 'ABERTO');
  if RGSituacao.ItemIndex = 2 then
    DMContratoPremio.QContratoPremioCons.SetVariable('IND_SITUACAO', 'FECHADO');
  if RGSituacao.ItemIndex = 3 then
    DMContratoPremio.QContratoPremioCons.SetVariable('IND_SITUACAO', 'CANCELADO');

  if MEDtEmissaoIni.Text = '' then
    DMContratoPremio.QContratoPremioCons.SetVariable('DT_EMISSAO_INI', null)
  else
    DMContratoPremio.QContratoPremioCons.SetVariable('DT_EMISSAO_INI', strtodate(MEDtEmissaoIni.text));

  if MEDtEmissaoFim.Text = '' then
    DMContratoPremio.QContratoPremioCons.SetVariable('DT_EMISSAO_FIM', null)
  else
    DMContratoPremio.QContratoPremioCons.SetVariable('DT_EMISSAO_FIM', strtodate(MEDtEmissaoFim.text));

  if MEDtEntregaIni.Text = '' then
    DMContratoPremio.QContratoPremioCons.SetVariable('DT_ENTREGA_INI', null)
  else
    DMContratoPremio.QContratoPremioCons.SetVariable('DT_ENTREGA_INI', strtodate(MEDtEntregaIni.text));

  if MEDtEntregaFim.Text = '' then
    DMContratoPremio.QContratoPremioCons.SetVariable('DT_ENTREGA_FIM', null)
  else
    DMContratoPremio.QContratoPremioCons.SetVariable('DT_ENTREGA_FIM', strtodate(MEDtEntregaFim.text));

  if MEDtVencimentoIni.Text = '' then
    DMContratoPremio.QContratoPremioCons.SetVariable('DT_VENCIMENTO_INI', null)
  else
    DMContratoPremio.QContratoPremioCons.SetVariable('DT_VENCIMENTO_INI', strtodate(MEDtVencimentoIni.text));

  if MEDtVencimentoFim.Text = '' then
    DMContratoPremio.QContratoPremioCons.SetVariable('DT_VENCIMENTO_FIM', null)
  else
    DMContratoPremio.QContratoPremioCons.SetVariable('DT_VENCIMENTO_FIM', strtodate(MEDtVencimentoFim.text));


  DMContratoPremio.QContratoPremioCons.OPEN;

end;

end.
