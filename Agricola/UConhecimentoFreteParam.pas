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
    procedure Sb1ContratoConsClick(Sender: TObject);
    procedure ME2CodClienteExit(Sender: TObject);
    procedure Bt2ClienteClick(Sender: TObject);
    procedure Me3CodFilialExit(Sender: TObject);
    procedure Me3CodProdutoExit(Sender: TObject);
    procedure Sb3FilialConsClick(Sender: TObject);
    procedure Sb3ProdutoConsClick(Sender: TObject);
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

end.
