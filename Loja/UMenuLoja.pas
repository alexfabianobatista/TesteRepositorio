unit UMenuLoja;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls, ImgList, ComCtrls, Registry,
  DelRun;

type
  TFMenuLoja = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Cadastro1: TMenuItem;
    Caixa1: TMenuItem;
    ContasaReceber1: TMenuItem;
    Produtos1: TMenuItem;
    Vendas1: TMenuItem;
    VendaaoConsumidor1: TMenuItem;
    ImpressoraFiscal1: TMenuItem;
    Fidelidade1: TMenuItem;
    Preo1: TMenuItem;
    ClientesSCPC1: TMenuItem;
    CadastrodeVendedor1: TMenuItem;
    DevoluoTrocadeMercadorias1: TMenuItem;
    Valepresente1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Cadastro1Click(Sender: TObject);
    procedure Caixa1Click(Sender: TObject);
    procedure ContasaReceber1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure VendaaoConsumidor1Click(Sender: TObject);
    procedure ImpressoraFiscal1Click(Sender: TObject);
    procedure Fidelidade1Click(Sender: TObject);
    procedure Preo1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ClientesSCPC1Click(Sender: TObject);
    procedure CadastrodeVendedor1Click(Sender: TObject);
    procedure DevoluoTrocadeMercadorias1Click(Sender: TObject);
    procedure Valepresente1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuLoja: TFMenuLoja;
  Registry: TRegistry;

implementation

uses UTela_cl, UCadastroCad, UCaixa_Cad, UContasReceberCad, UProdutoCad,
  UNotaSaidaCad, UNotaConsumidor, UImpressoraFiscal, UFidelidadeCad,
  UPrecos, UClienteSCPC, UVendedorCad, UTef, UDevolucaoTroca,
  UValePresenteCad;

{$R *.DFM}

procedure TFMenuLoja.FormCreate(Sender: TObject);
begin
  inherited;
  Self.pModulo:='LOJA';
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ChecaReducaoZAutomatica;
end;

procedure TFMenuLoja.Cadastro1Click(Sender: TObject);
begin
  inherited;
  If FCadastroCad = Nil then
    FCadastroCad := TFCadastroCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCadastroCad.Caption,FCadastroCad.Name);
  FCadastroCad.ShowModal;
end;

procedure TFMenuLoja.Caixa1Click(Sender: TObject);
begin
  inherited;
  If FCaixaCad = Nil then
    FCaixaCad := TFCaixaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCaixaCad.Caption,FCaixaCad.Name);
  FCaixaCad.ShowModal;
end;

procedure TFMenuLoja.ContasaReceber1Click(Sender: TObject);
begin
  inherited;
  If FContasReceberCad = Nil then
    FContasReceberCad := TFContasReceberCad.Create(Application);
  DMTela.VerificaTela(pModulo,FContasReceberCad.Caption,FContasReceberCad.Name);
  FContasReceberCad.ShowModal;
end;

procedure TFMenuLoja.Produtos1Click(Sender: TObject);
begin
  inherited;
  If FProdutoCad = Nil then
    FProdutoCad := TFProdutoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FProdutoCad.Caption,FProdutoCad.Name);
  FProdutoCad.ShowModal;
end;

procedure TFMenuLoja.Vendas1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaCad = Nil then
    FNotaSaidaCad := TFNotaSaidaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FNotaSaidaCad.Caption,FNotaSaidaCad.Name);
  FNotaSaidaCad.ShowModal;
end;

procedure TFMenuLoja.VendaaoConsumidor1Click(Sender: TObject);
begin
  inherited;
  If FNotaConsumidor = Nil then
    FNotaConsumidor := TFNotaConsumidor.Create(Application);
  DMTela.VerificaTela(pModulo,FNotaConsumidor.Caption,FNotaConsumidor.Name);
  FNotaConsumidor.ShowModal;
end;

procedure TFMenuLoja.ImpressoraFiscal1Click(Sender: TObject);
begin
  inherited;
  If FImpressoraFiscal = Nil Then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFMenuLoja.Fidelidade1Click(Sender: TObject);
begin
  inherited;
  if FFidelidadeCad = nil then
     FFidelidadeCad := TFFidelidadeCad.Create(Application);
  DMTela.VerificaTela(pModulo,FFidelidadeCad.Caption,FFidelidadeCad.Name);
  FFidelidadeCad.ShowModal;
end;

procedure TFMenuLoja.Preo1Click(Sender: TObject);
begin
  inherited;
  if FPrecoCad= nil then
     FPrecoCad:=TFPrecoCad.Create(Application);
  //DMTela.VerificaTela(pModulo,FPrecoCad.Caption);
  FPrecoCad.ShowModal;
end;

procedure TFMenuLoja.FormActivate(Sender: TObject);
Var vHorizontal, vVertical : Integer;
    wFilial: String;
begin
  inherited;
  For vHorizontal := 0 To Self.MMCadSimples.Items.Count-1 do
    For vVertical := 0 to MMCadSimples.Items[vHorizontal].Count-1 do
      MMCadSimples.Items[vHorizontal].Items[vVertical].Visible := True;
  wFilial := '';
  Registry := TRegistry.Create;//executa o tregistry
  Registry.RootKey:=HKEY_CURRENT_USER; //abre a chave mestra
  Registry.OpenKey('SOFTWARE\CemapaSistema',true);
  if Registry.ValueExists('FilialTEF') then
    wFilial := Registry.ReadString('FilialTEF');
  if wFilial <> '' then
    if FTEF = nil then
      FTEF := TFTEF.Create(Application);
end;

procedure TFMenuLoja.ClientesSCPC1Click(Sender: TObject);
begin
  inherited;
  if FClienteSCPC = Nil then
    FClienteSCPC := TFClienteSCPC.Create(Application);
  FClienteSCPC.ShowModal;
end;

procedure TFMenuLoja.CadastrodeVendedor1Click(Sender: TObject);
begin
  inherited;
  if FVendedorCad = Nil then
    FVendedorCad := TFVendedorCad.Create(Application);
  FVendedorCad.ShowModal;
end;

procedure TFMenuLoja.DevoluoTrocadeMercadorias1Click(Sender: TObject);
begin
  inherited;
  if FDevolucaoTroca = Nil then
    FDevolucaoTroca := TFDevolucaoTroca.Create(Application);
  FDevolucaoTroca.ShowModal;
end;

procedure TFMenuLoja.Valepresente1Click(Sender: TObject);
begin
  inherited;
  if FValePresenteCad = Nil then
    FValePresenteCad := TFValePresenteCad.Create(Application);
  FValePresenteCad.ShowModal;
end;

end.
