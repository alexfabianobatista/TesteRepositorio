unit UContratoPremioParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFContratoPremioParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    ME0Filial: TMaskEdit;
    sb0Filial: TSpeedButton;
    Label2: TLabel;
    SB0Cadastro: TSpeedButton;
    Label3: TLabel;
    SB0Produto: TSpeedButton;
    ed0Filial: TEdit;
    ME0Cadastro: TMaskEdit;
    ed0Cadastro: TEdit;
    ME0Produto: TMaskEdit;
    ed0Produto: TEdit;
    RG0Moeda: TRadioGroup;
    RG0Situacao: TRadioGroup;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    ME0DtEmissaoIni: TMaskEdit;
    ME0DtEmissaoFim: TMaskEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    ME0DtEntregaIni: TMaskEdit;
    ME0DtEntregaFim: TMaskEdit;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    ME0DtVencimentoIni: TMaskEdit;
    ME0DtVencimentoFim: TMaskEdit;
    ME0ValSaca: TMaskEdit;
    Label10: TLabel;
    ME0ValTaxa: TMaskEdit;
    Label11: TLabel;
    TabSheet2: TTabSheet;
    Label12: TLabel;
    ME1Filial: TMaskEdit;
    sb1Filial: TSpeedButton;
    ed1Filial: TEdit;
    Label13: TLabel;
    ME1Cadastro: TMaskEdit;
    SB1Cadastro: TSpeedButton;
    ed1Cadastro: TEdit;
    Label14: TLabel;
    ME1Produto: TMaskEdit;
    SB1Produto: TSpeedButton;
    Ed1Produto: TEdit;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    ME1DtEmissaoIni: TMaskEdit;
    ME1DtEmissaoFim: TMaskEdit;
    GroupBox5: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    ME1DtEntregaIni: TMaskEdit;
    ME1DtEntregaFim: TMaskEdit;
    RG1Moeda: TRadioGroup;
    RG1Situacao: TRadioGroup;
    GroupBox6: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    ME1DtVencimentoIni: TMaskEdit;
    ME1DtVencimentoFim: TMaskEdit;
    ME1ValTaxa: TMaskEdit;
    Label22: TLabel;
    TabSheet3: TTabSheet;
    Label68: TLabel;
    Ed2Observacao: TEdit;
    Label81: TLabel;
    Me2Quantidade: TMaskEdit;
    Me2DtPagto: TMaskEdit;
    Label85: TLabel;
    Label72: TLabel;
    Me2CodCliente: TMaskEdit;
    SpeedButton39: TSpeedButton;
    Me2Cliente: TMaskEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Me2PercDPI: TMaskEdit;
    Me2CreditoSemente: TMaskEdit;
    Me2Cobrado: TMaskEdit;
    procedure sb0FilialClick(Sender: TObject);
    procedure ME0FilialExit(Sender: TObject);
    procedure ME0CadastroExit(Sender: TObject);
    procedure SB0CadastroClick(Sender: TObject);
    procedure ME0ProdutoExit(Sender: TObject);
    procedure SB0ProdutoClick(Sender: TObject);
    procedure ME1FilialExit(Sender: TObject);
    procedure ME1CadastroExit(Sender: TObject);
    procedure ME1ProdutoExit(Sender: TObject);
    procedure sb1FilialClick(Sender: TObject);
    procedure SB1CadastroClick(Sender: TObject);
    procedure SB1ProdutoClick(Sender: TObject);
    procedure Me2CodClienteExit(Sender: TObject);
    procedure SpeedButton39Click(Sender: TObject);
    procedure Me2CreditoSementeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoPremioParam: TFContratoPremioParam;

implementation

uses UFilialCons, UFilial_cl, UOracle_cl, UCadastroCons, UCadastro_cl,
  UProdutoCons, UProduto_cl, UContratoPremioCons, UContratoPremio_cl;

{$R *.DFM}

procedure TFContratoPremioParam.sb0FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
  With DMFilial do
  begin
    ME0filial.Text:=FloatToStr(QFilialConsCod_Filial.Value);
    ME0filialExit(Self);
  end;
end;

procedure TFContratoPremioParam.ME0FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0filial.Text)<>'' then
    ed0Filial.Text:=DMOracle.Buscanome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + trim(ME0filial.text))
  else
    ed0Filial.text := 'Todas';
end;

procedure TFContratoPremioParam.ME0CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0Cadastro.Text)<>'' then
    ed0Cadastro.Text:=DMOracle.Buscanome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + trim(ME0Cadastro.text))
  else
    ed0Cadastro.text := 'Todos';
end;

procedure TFContratoPremioParam.SB0CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FcadastroCons.ShowModal = MrOk then
  with DmCadastro do
  begin
    ME0cadastro.text := FloatToStr(QCadastroConsCod_Cadastro.Value);
    ME0cadastroExit(Self);
  end;
end;

procedure TFContratoPremioParam.ME0ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0Produto.Text) <> '' then
    Ed0Produto.Text:=DMOracle.Buscanome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + trim(ME0Produto.text))
  else
    Ed0Produto.Text := '';
end;

procedure TFContratoPremioParam.SB0ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    Ed0Produto.Text:=DMProduto.QProdutoConsDesc_Produto.Value;
    ME0Produto.Text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.Value);
  end;
end;

procedure TFContratoPremioParam.ME1FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1filial.Text)<>'' then
    ed1Filial.Text:=DMOracle.Buscanome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + trim(ME1filial.text))
  else
    ed1Filial.text := 'Todas';
end;

procedure TFContratoPremioParam.ME1CadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Cadastro.Text)<>'' then
    ed1Cadastro.Text:=DMOracle.Buscanome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+trim(ME1Cadastro.text))
  else
    ed1Cadastro.text := 'Todos';
end;

procedure TFContratoPremioParam.ME1ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Produto.Text) <> '' then
    Ed1Produto.Text:=DMOracle.Buscanome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + trim(ME1Produto.text))
  else
    Ed1Produto.Text := 'Todos';
end;

procedure TFContratoPremioParam.sb1FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
  With DMFilial do
  begin
    ME1filial.Text:=FloatToStr(QFilialConsCod_Filial.Value);
    ME1filialExit(Self);
  end;
end;

procedure TFContratoPremioParam.SB1CadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FcadastroCons.ShowModal = MrOk then
  with DmCadastro do
  begin
    ME1cadastro.text := FloatToStr(QCadastroConsCod_Cadastro.Value);
    ME1cadastroExit(Self);
  end;
end;

procedure TFContratoPremioParam.SB1ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    Ed1Produto.Text := DMProduto.QProdutoConsDesc_Produto.Value;
    ME1Produto.Text := FloatToStr(DMProduto.QProdutoConsCod_Produto.Value);
  end;
end;

procedure TFContratoPremioParam.Me2CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(Me2CodCliente.text)<>'' then
    Me2Cliente.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(Me2CodCliente.Text))
  else
    Me2Cliente.Clear;
end;

procedure TFContratoPremioParam.SpeedButton39Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    ME2CodCliente.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    ME2CodClienteExit(Self);
  end;
end;

procedure TFContratoPremioParam.Me2CreditoSementeExit(Sender: TObject);
begin
  inherited;
  If Trim(Me2CreditoSemente.Text) <> '' Then
    If StrToFloat(Trim(Me2CreditoSemente.Text)) > StrToFloat(Trim(Me2Quantidade.Text)) Then
       Me2Cobrado.Text := '0'
    Else
       Me2Cobrado.Text := FloatToStr(StrToFloat(Me2Quantidade.Text) - StrToFloat(Trim(Me2CreditoSemente.Text)));
end;

end.
