unit UPatrimonioParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFPatrimonioParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    ME0CodFilial: TMaskEdit;
    Label68: TLabel;
    SB0Filial: TSpeedButton;
    ME0Filial: TMaskEdit;
    GroupBox10: TGroupBox;
    Label72: TLabel;
    Label73: TLabel;
    ME0DtAquisicaoInicial: TMaskEdit;
    ME0DtAquisicaoFinal: TMaskEdit;
    ME0CodProduto: TMaskEdit;
    Produto: TLabel;
    SB0Produto: TSpeedButton;
    ME0Produto: TMaskEdit;
    RG0Situacao: TRadioGroup;
    Label2: TLabel;
    ME0CodPatrimonio: TMaskEdit;
    SB0Patrimonio: TSpeedButton;
    ME0Patrimonio: TMaskEdit;
    Ed0Localizacao: TMaskEdit;
    SB0LocalizacaoCons: TSpeedButton;
    ME0CodLocalizacao: TMaskEdit;
    Label3: TLabel;
    SBNotaEntradaCons: TSpeedButton;
    ME0CodNotaEntrada: TMaskEdit;
    Label1: TLabel;
    Label4: TLabel;
    ME0CodNotaSaida: TMaskEdit;
    SBNotaSaidaCons: TSpeedButton;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    ME1DtInicio: TMaskEdit;
    ME1DtFim: TMaskEdit;
    TabSheet3: TTabSheet;
    Label7: TLabel;
    ME2CodFilial: TMaskEdit;
    SB2Filial: TSpeedButton;
    ME2Filial: TMaskEdit;
    Label8: TLabel;
    ME2CodPatrimonio: TMaskEdit;
    SB2Patrimonio: TSpeedButton;
    ME2Patrimonio: TMaskEdit;
    Label9: TLabel;
    ME2CodProduto: TMaskEdit;
    SB2Produto: TSpeedButton;
    ME2Produto: TMaskEdit;
    TabSheet4: TTabSheet;
    Label10: TLabel;
    ME3CodFilial: TMaskEdit;
    SB3Filial: TSpeedButton;
    ME3Filial: TMaskEdit;
    ME3Ano: TMaskEdit;
    Label11: TLabel;
    TabSheet5: TTabSheet;
    Label12: TLabel;
    ME4CodFilial: TMaskEdit;
    SB4Filial: TSpeedButton;
    ME4Filial: TMaskEdit;
    Label13: TLabel;
    ME4Ano: TMaskEdit;
    TabSheet6: TTabSheet;
    ME5Ano: TMaskEdit;
    Label14: TLabel;
    Label15: TLabel;
    ME5CodFilial: TMaskEdit;
    SB5Filial: TSpeedButton;
    ME5Filial: TMaskEdit;
    TabSheet7: TTabSheet;
    Label16: TLabel;
    ME6Ano: TMaskEdit;
    Label17: TLabel;
    ME6CodFilial: TMaskEdit;
    SB6Filial: TSpeedButton;
    ME6Filial: TMaskEdit;
    TabSheet8: TTabSheet;
    ME7CodPatrimonioItem: TMaskEdit;
    Label18: TLabel;
    SB7PatrimonioItem: TSpeedButton;
    ME7PatrimonioItem: TMaskEdit;
    GroupBox2: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    ME7DtInicio: TMaskEdit;
    ME7DtFim: TMaskEdit;
    TabSheet9: TTabSheet;
    Label21: TLabel;
    ME8CodFilial: TMaskEdit;
    SpeedButton1: TSpeedButton;
    ME8Filial: TMaskEdit;
    Label22: TLabel;
    ME8CodProduto: TMaskEdit;
    SB8Produto: TSpeedButton;
    ME8Produto: TMaskEdit;
    RG0CIAP: TRadioGroup;
    ME6DtBase: TMaskEdit;
    Label23: TLabel;
    Label24: TLabel;
    ME2NumOrdem: TMaskEdit;
    Label25: TLabel;
    ME5DtBase: TMaskEdit;
    procedure ME0CodFilialExit(Sender: TObject);
    procedure ME0CodProdutoExit(Sender: TObject);
    procedure ME0CodPatrimonioExit(Sender: TObject);
    procedure SB0PatrimonioClick(Sender: TObject);
    procedure SB0FilialClick(Sender: TObject);
    procedure SB0ProdutoClick(Sender: TObject);
    procedure ME0CodLocalizacaoExit(Sender: TObject);
    procedure SB0LocalizacaoConsClick(Sender: TObject);
    procedure SBNotaEntradaConsClick(Sender: TObject);
    procedure SBNotaSaidaConsClick(Sender: TObject);
    procedure SB2FilialClick(Sender: TObject);
    procedure ME2CodFilialExit(Sender: TObject);
    procedure ME2CodPatrimonioExit(Sender: TObject);
    procedure SB2PatrimonioClick(Sender: TObject);
    procedure ME2CodProdutoExit(Sender: TObject);
    procedure SB2ProdutoClick(Sender: TObject);
    procedure ME3CodFilialExit(Sender: TObject);
    procedure SB3FilialClick(Sender: TObject);
    procedure ME4CodFilialExit(Sender: TObject);
    procedure SB4FilialClick(Sender: TObject);
    procedure ME5CodFilialExit(Sender: TObject);
    procedure SB5FilialClick(Sender: TObject);
    procedure ME6CodFilialExit(Sender: TObject);
    procedure SB6FilialClick(Sender: TObject);
    procedure SB7PatrimonioItemClick(Sender: TObject);
    procedure ME7CodPatrimonioItemExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPatrimonioParam: TFPatrimonioParam;

implementation

uses UOracle_cl, UPatrimonioCons, UPatrimonio_cl, UFilialCons, UProdutoCons,
  UFilial_cl, UProduto_cl, ULocalizacaoCons, UNotaEntradaCons,
  UNotaSaidaCons, UNotaEntrada_cl, UNotaSaida_cl, ULocalizacao_cl,
  UPatrimonioItensCons;

{$R *.DFM}

procedure TFPatrimonioParam.ME0CodFilialExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME0CodFilial.Text) <> '')Then
    ME0Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME0CodFilial.Text))
  Else
    ME0Filial.Text := 'Todas';
end;

procedure TFPatrimonioParam.ME0CodProdutoExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME0CodProduto.Text) <> '')Then
    ME0Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + Trim(ME0CodProduto.Text))
  Else
    ME0Produto.Text := 'Todos';
end;

procedure TFPatrimonioParam.ME0CodPatrimonioExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME0CodPatrimonio.Text) <> '')Then
    ME0Patrimonio.Text := DMOracle.BuscaNome('SELECT DESC_PATRIMONIO FROM TB_PATRIMONIO_CAB','COD_PATRIMONIO_CAB = ' + Trim(ME0CodPatrimonio.Text))
  Else
    ME0Patrimonio.Text := 'Todos';
end;

procedure TFPatrimonioParam.SB0PatrimonioClick(Sender: TObject);
begin
  inherited;
  If FPatrimonioCons = nil Then
    FPatrimonioCons := TFPatrimonioCons.Create(Application);
  If FPatrimonioCons.ShowModal = mrOk Then
  Begin
    ME0CodPatrimonio.Text := DMPatrimonio.QPatrimonioConsCOD_PATRIMONIO_CAB.Text;
    ME0CodPatrimonioExit(self);
  End;
end;

procedure TFPatrimonioParam.SB0FilialClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    ME0CodFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME0CodFilialExit(self);
end;

procedure TFPatrimonioParam.SB0ProdutoClick(Sender: TObject);
begin
  inherited;
  If (FProdutoCons = nil) Then
    FProdutoCons := TFProdutoCons.Create(Application);
  If (FProdutoCons.ShowModal = mrOk) Then
    ME0CodProduto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
  ME0CodProdutoExit(self);
end;

procedure TFPatrimonioParam.ME0CodLocalizacaoExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME0CodLocalizacao.Text) <> '')Then
    Ed0Localizacao.Text := DMOracle.BuscaNome('SELECT DESC_LOCALIZACAO FROM TB_LOCALIZACAO','COD_LOCALIZACAO = ' + Trim(ME0CodLocalizacao.Text))
  Else
    Ed0Localizacao.Text := 'Todos';
end;

procedure TFPatrimonioParam.SB0LocalizacaoConsClick(Sender: TObject);
begin
  inherited;
  If FLocalizacaoCons = nil Then
    FLocalizacaoCons := TFLocalizacaoCons.Create(Application);
  If FLocalizacaoCons.ShowModal = mrOk Then
  Begin
    ME0CodLocalizacao.Text := DMLocalizacao.QLocalizacaoConsCOD_LOCALIZACAO.Text;
    ME0CodLocalizacaoExit(self);
  End;
end;

procedure TFPatrimonioParam.SBNotaEntradaConsClick(Sender: TObject);
begin
  inherited;
  If(FNotaEntradaCons = nil)Then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  If(FNotaEntradaCons.showmodal = mrOk)Then
    ME0CodNotaEntrada.Text := DMNotaEntrada.QNotaEntradaConsCOD_NOTA_CAB.Text;
end;

procedure TFPatrimonioParam.SBNotaSaidaConsClick(Sender: TObject);
begin
  inherited;
  If(FNotaSaidaCons = nil)Then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  If(FNotaSaidaCons.showmodal = mrOk)Then
    ME0CodNotaSaida.Text := DMNotaSaida.QNotaSaidaConsCOD_NOTA_CAB.Text;
end;

procedure TFPatrimonioParam.SB2FilialClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    ME2CodFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME2CodFilialExit(self);
end;

procedure TFPatrimonioParam.ME2CodFilialExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME2CodFilial.Text) <> '')Then
    ME2Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME2CodFilial.Text))
  Else
    ME2Filial.Text := 'Todas';
end;

procedure TFPatrimonioParam.ME2CodPatrimonioExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME2CodPatrimonio.Text) <> '')Then
    ME2Patrimonio.Text := DMOracle.BuscaNome('SELECT DESC_PATRIMONIO FROM TB_PATRIMONIO_CAB','COD_PATRIMONIO_CAB = ' + Trim(ME2CodPatrimonio.Text))
  Else
    ME2Patrimonio.Text := 'Todos';
end;

procedure TFPatrimonioParam.SB2PatrimonioClick(Sender: TObject);
begin
  inherited;
  If FPatrimonioCons = nil Then
    FPatrimonioCons := TFPatrimonioCons.Create(Application);
  If FPatrimonioCons.ShowModal = mrOk Then
  Begin
    ME2CodPatrimonio.Text := DMPatrimonio.QPatrimonioConsCOD_PATRIMONIO_CAB.Text;
    ME2CodPatrimonioExit(self);
  End;
end;

procedure TFPatrimonioParam.ME2CodProdutoExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME2CodProduto.Text) <> '')Then
    ME2Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + Trim(ME2CodProduto.Text))
  Else
    ME2Produto.Text := 'Todos';
end;

procedure TFPatrimonioParam.SB2ProdutoClick(Sender: TObject);
begin
  inherited;
  If (FProdutoCons = nil) Then
    FProdutoCons := TFProdutoCons.Create(Application);
  If (FProdutoCons.ShowModal = mrOk) Then
    ME2CodProduto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
  ME2CodProdutoExit(self);
end;

procedure TFPatrimonioParam.ME3CodFilialExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME3CodFilial.Text) <> '')Then
    ME3Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME3CodFilial.Text))
  Else
    ME3Filial.Text := 'Todas';
end;

procedure TFPatrimonioParam.SB3FilialClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    ME3CodFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME3CodFilialExit(self);
end;

procedure TFPatrimonioParam.ME4CodFilialExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME4CodFilial.Text) <> '')Then
    ME4Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME4CodFilial.Text))
  Else
    ME4Filial.Text := 'Todas';
end;

procedure TFPatrimonioParam.SB4FilialClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    ME4CodFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME4CodFilialExit(self);
end;

procedure TFPatrimonioParam.ME5CodFilialExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME5CodFilial.Text) <> '')Then
    ME5Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME5CodFilial.Text))
  Else
    ME5Filial.Text := 'Todas';
end;

procedure TFPatrimonioParam.SB5FilialClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    ME5CodFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME5CodFilialExit(self);
end;

procedure TFPatrimonioParam.ME6CodFilialExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME6CodFilial.Text) <> '')Then
    ME6Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + Trim(ME6CodFilial.Text))
  Else
    ME6Filial.Text := 'Todas';
end;

procedure TFPatrimonioParam.SB6FilialClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    ME6CodFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  ME6CodFilialExit(self);
end;

procedure TFPatrimonioParam.SB7PatrimonioItemClick(Sender: TObject);
begin
  inherited;
  if FPatrimonioItensCons = nil then
    FPatrimonioItensCons := TFPatrimonioItensCons.create(application);

  if FPatrimonioItensCons.showmodal = mrok then
  begin
    ME7CodPatrimonioItem.Text := inttostr(DMPatrimonio.QPatrimonioItemConsCOD_PATRIMONIO_ITEM.Value);
    ME7CodPatrimonioItemExit(sender);
  end;
end;

procedure TFPatrimonioParam.ME7CodPatrimonioItemExit(Sender: TObject);
begin
  inherited;
  If(Trim(ME7CodPatrimonioItem.Text) <> '')Then
    ME7PatrimonioItem.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PATRIMONIO_ITEM,TB_PRODUTO','TB_PATRIMONIO_ITEM.COD_PRODUTO=TB_PRODUTO.COD_PRODUTO AND COD_PATRIMONIO_ITEM = ' + Trim(ME7CodPatrimonioItem.Text))
  Else
    ME7PatrimonioItem.Text := 'Todas';
end;

procedure TFPatrimonioParam.FormCreate(Sender: TObject);
begin
  inherited;
  ME5DtBase.text := DateToStr(date);
  ME6DtBase.text := DateToStr(date);
end;

end.
