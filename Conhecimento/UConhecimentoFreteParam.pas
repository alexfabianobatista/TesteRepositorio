unit UConhecimentoFreteParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFConhecimentoFreteParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label7: TLabel;
    ME1CodContrato: TMaskEdit;
    ME1Contrato: TMaskEdit;
    Sb1ContratoCons: TSpeedButton;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    ME2DtInicial: TMaskEdit;
    ME2DtFinal: TMaskEdit;
    Label35: TLabel;
    ME2CodCliente: TMaskEdit;
    Bt2Cliente: TSpeedButton;
    ME2Cliente: TMaskEdit;
    TabSheet3: TTabSheet;
    Label66: TLabel;
    Sb3FilialCons: TSpeedButton;
    Label67: TLabel;
    Sb3ProdutoCons: TSpeedButton;
    Me3CodFilial: TMaskEdit;
    Ed3Filial: TEdit;
    Me3CodProduto: TMaskEdit;
    Ed3Produto: TEdit;
    GroupBox9: TGroupBox;
    Label68: TLabel;
    Label69: TLabel;
    Me3DtInicio: TMaskEdit;
    Me3DtFim: TMaskEdit;
    Rg3Situacao: TRadioGroup;
    Label1: TLabel;
    Sb3Transportado: TSpeedButton;
    Me3Transportador: TMaskEdit;
    Ed3Transportador: TEdit;
    Label2: TLabel;
    Me3Placa: TMaskEdit;
    Label3: TLabel;
    Sb3CadastroNF: TSpeedButton;
    Me3CadastroNf: TMaskEdit;
    Ed3CadastroNF: TEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Me3DtInicioNF: TMaskEdit;
    Me3DtFinalNF: TMaskEdit;
    TabSheet4: TTabSheet;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    ME4DtInicio: TMaskEdit;
    ME4DtFim: TMaskEdit;
    Label9: TLabel;
    ME4Filial: TMaskEdit;
    SB4Filial: TSpeedButton;
    Ed4Filial: TEdit;
    Label10: TLabel;
    ME4Transportador: TMaskEdit;
    SB4Transportador: TSpeedButton;
    Ed4Transportador: TEdit;
    Label11: TLabel;
    ME4CadastroNF: TMaskEdit;
    SB4CadastroNF: TSpeedButton;
    Ed4CadastroNF: TEdit;
    Label12: TLabel;
    ME4Produto: TMaskEdit;
    SB4Produto: TSpeedButton;
    Ed4Produto: TEdit;
    RG4Situacao: TRadioGroup;
    TabSheet5: TTabSheet;
    Label13: TLabel;
    ME5Filial: TMaskEdit;
    SB5Filial: TSpeedButton;
    Ed5Filial: TEdit;
    Label14: TLabel;
    ME5Transportador: TMaskEdit;
    SB5Transportador: TSpeedButton;
    Ed5Transportador: TEdit;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    ME5DtInicio: TMaskEdit;
    ME5DtFim: TMaskEdit;
    TabSheet6: TTabSheet;
    Label91: TLabel;
    Sb6Filial: TSpeedButton;
    Me6CodFilial: TMaskEdit;
    Ed6DescFilial: TEdit;
    GroupBox13: TGroupBox;
    Label92: TLabel;
    Label93: TLabel;
    Me6DtInicial: TMaskEdit;
    Me6DtFinal: TMaskEdit;
    procedure Sb1ContratoConsClick(Sender: TObject);
    procedure ME2CodClienteExit(Sender: TObject);
    procedure Bt2ClienteClick(Sender: TObject);
    procedure Me3CodFilialExit(Sender: TObject);
    procedure Me3CodProdutoExit(Sender: TObject);
    procedure Sb3FilialConsClick(Sender: TObject);
    procedure Sb3ProdutoConsClick(Sender: TObject);
    procedure Me3TransportadorExit(Sender: TObject);
    procedure Sb3TransportadoClick(Sender: TObject);
    procedure Me3CadastroNfExit(Sender: TObject);
    procedure Sb3CadastroNFClick(Sender: TObject);
    procedure ME4FilialExit(Sender: TObject);
    procedure SB4FilialClick(Sender: TObject);
    procedure ME4TransportadorExit(Sender: TObject);
    procedure SB4TransportadorClick(Sender: TObject);
    procedure ME4CadastroNFExit(Sender: TObject);
    procedure SB4CadastroNFClick(Sender: TObject);
    procedure ME4ProdutoExit(Sender: TObject);
    procedure SB4ProdutoClick(Sender: TObject);
    procedure ME5FilialExit(Sender: TObject);
    procedure SB5FilialClick(Sender: TObject);
    procedure ME5TransportadorExit(Sender: TObject);
    procedure SB5TransportadorClick(Sender: TObject);
    procedure Sb6FilialClick(Sender: TObject);
    procedure Me6CodFilialExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConhecimentoFreteParam: TFConhecimentoFreteParam;

implementation

uses UContratoVenda_Cons, Ucontrato_cl, UCadastroCons, UCadastro_cl,
  UOracle_cl, UFilialCons, UFilial_cl, UProdutoCons, UProduto_cl;

{$R *.DFM}

procedure TFConhecimentoFreteParam.Sb1ContratoConsClick(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = Nil then
    FContrato_VendaCons  := TFContrato_VendaCons.Create(Application);
  if FContrato_VendaCons.ShowModal=mrOk then
    begin
      ME1CodContrato.text:=DMContrato.QContrato_VendConsCod_Contrato_Vend.text;
      ME1Contrato.text:=DMContrato.QContrato_VendConsNome.Text;
    end;
end;

procedure TFConhecimentoFreteParam.ME2CodClienteExit(Sender: TObject);
begin
  inherited;
  if Trim(ME2CodCliente.text)<>'' then
    ME2Cliente.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ME2CodCliente.text)
  else
    ME2Cliente.Clear;
end;

procedure TFConhecimentoFreteParam.Bt2ClienteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      ME2CodCliente.text:=DMCadastro.QCadastroConsCOD_CADASTRO.text;
      ME2CodClienteExit(Self);
    end;
end;

procedure TFConhecimentoFreteParam.Me3CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me3CodFilial.text) <> '' then
    Ed3Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Me3CodFilial.text)
  else
    Ed3Filial.Text:='Todas';
end;

procedure TFConhecimentoFreteParam.Me3CodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me3CodProduto.text) <> '' then
    Ed3Produto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Me3CodProduto.text)
  else
    Ed3Produto.Text:='Todos';
end;

procedure TFConhecimentoFreteParam.Sb3FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
   begin
     FConhecimentoFreteParam.Me3CodFilial.text := DMFilial.QFilialConsCOD_FILIAL.Text;
     FConhecimentoFreteParam.Ed3Filial.text := DMFilial.QFilialConsDESC_FILIAL.Text;
   end;
end;

procedure TFConhecimentoFreteParam.Sb3ProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
     FProdutoCons:=TFProdutoCons.create(application);
   if FProdutoCons.showmodal = mrOk then
   begin
     FConhecimentoFreteParam.Me3CodProduto.text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
     FConhecimentoFreteParam.Ed3Produto.text := DMProduto.QProdutoConsDESC_PRODUTO.Text;
   end;
end;

procedure TFConhecimentoFreteParam.Me3TransportadorExit(Sender: TObject);
begin
  inherited;
  if Trim(Me3Transportador.text) <> '' then
    Ed3Transportador.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Me3Transportador.text)
  else
    Ed3Transportador.Text:='Todos';

end;

procedure TFConhecimentoFreteParam.Sb3TransportadoClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
   if FCadastroCons.showmodal = mrOk then
   begin
     FConhecimentoFreteParam.Me3Transportador.text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
     FConhecimentoFreteParam.Ed3Transportador.text := DMCadastro.QCadastroConsNOME.Text;
   end;

end;

procedure TFConhecimentoFreteParam.Me3CadastroNfExit(Sender: TObject);
begin
  inherited;
  if Trim(Me3CadastroNF.text) <> '' then
    Ed3CadastroNF.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Me3CadastroNF.text)
  else
    Ed3CadastroNF.Text:='Todos';

end;

procedure TFConhecimentoFreteParam.Sb3CadastroNFClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
   if FCadastroCons.showmodal = mrOk then
   begin
     Me3CadastroNF.text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
     Ed3CadastroNF.text := DMCadastro.QCadastroConsNOME.Text;
   end;

end;

procedure TFConhecimentoFreteParam.ME4FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me4Filial.text) <> '' then
    Ed4Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Me4Filial.text)
  else
    Ed4Filial.Text:='Todas';
end;

procedure TFConhecimentoFreteParam.SB4FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
   begin
     FConhecimentoFreteParam.Me4Filial.text := DMFilial.QFilialConsCOD_FILIAL.Text;
     FConhecimentoFreteParam.Ed4Filial.text := DMFilial.QFilialConsDESC_FILIAL.Text;
   end;
end;

procedure TFConhecimentoFreteParam.ME4TransportadorExit(Sender: TObject);
begin
  inherited;
  if Trim(Me4Transportador.text) <> '' then
    Ed4Transportador.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Me4Transportador.text)
  else
    Ed4Transportador.Text:='Todos';
end;

procedure TFConhecimentoFreteParam.SB4TransportadorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
   if FCadastroCons.showmodal = mrOk then
   begin
     FConhecimentoFreteParam.Me4Transportador.text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
     FConhecimentoFreteParam.Ed4Transportador.text := DMCadastro.QCadastroConsNOME.Text;
   end;
end;

procedure TFConhecimentoFreteParam.ME4CadastroNFExit(Sender: TObject);
begin
  inherited;
  if Trim(Me4CadastroNF.text) <> '' then
    Ed4CadastroNF.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Me4CadastroNF.text)
  else
    Ed4CadastroNF.Text:='Todos';
end;

procedure TFConhecimentoFreteParam.SB4CadastroNFClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
   if FCadastroCons.showmodal = mrOk then
   begin
     Me4CadastroNF.text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
     Ed4CadastroNF.text := DMCadastro.QCadastroConsNOME.Text;
   end;
end;

procedure TFConhecimentoFreteParam.ME4ProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me4Produto.text) <> '' then
    Ed4Produto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Me4Produto.text)
  else
    Ed4Produto.Text:='Todos';
end;

procedure TFConhecimentoFreteParam.SB4ProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
     FProdutoCons:=TFProdutoCons.create(application);
   if FProdutoCons.showmodal = mrOk then
   begin
     FConhecimentoFreteParam.Me4Produto.text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
     FConhecimentoFreteParam.Ed4Produto.text := DMProduto.QProdutoConsDESC_PRODUTO.Text;
   end;
end;

procedure TFConhecimentoFreteParam.ME5FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me5Filial.text) <> '' then
    Ed5Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Me5Filial.text)
  else
    Ed5Filial.Text:='Todas';
end;

procedure TFConhecimentoFreteParam.SB5FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
   begin
     FConhecimentoFreteParam.Me5Filial.text := DMFilial.QFilialConsCOD_FILIAL.Text;
     FConhecimentoFreteParam.Ed5Filial.text := DMFilial.QFilialConsDESC_FILIAL.Text;
   end;
end;

procedure TFConhecimentoFreteParam.ME5TransportadorExit(Sender: TObject);
begin
  inherited;
  if Trim(Me5Transportador.text) <> '' then
    Ed5Transportador.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Me5Transportador.text)
  else
    Ed5Transportador.Text:='Todos';
end;

procedure TFConhecimentoFreteParam.SB5TransportadorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
   if FCadastroCons.showmodal = mrOk then
   begin
     FConhecimentoFreteParam.Me5Transportador.text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
     FConhecimentoFreteParam.Ed5Transportador.text := DMCadastro.QCadastroConsNOME.Text;
   end;
end;

procedure TFConhecimentoFreteParam.Sb6FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = MrOk then
   begin
     FConhecimentoFreteParam.Me6CodFilial.text:=IntToStr(DMFilial.QFilialConsCod_Filial.value);
     Me6CodFilialExit(self);
   end;

end;

procedure TFConhecimentoFreteParam.Me6CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me6CodFilial.text) <> '' then
    Ed6DescFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Me6CodFilial.text)
  else
    Ed6DescFilial.Text:='Todas';

end;

end.
