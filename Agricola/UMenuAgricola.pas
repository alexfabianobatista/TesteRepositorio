unit UMenuAgricola;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, Buttons, ImgList, ComCtrls;

type
  TFMenuAgricola = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    CadastroTabeladeDescontos1: TMenuItem;
    ProdutoAgricola1: TMenuItem;
    Romaneio1: TMenuItem;
    NotaFiscalAgricola1: TMenuItem;
    MensagemParaReceita1: TMenuItem;
    Pragas1: TMenuItem;
    Culturas1: TMenuItem;
    Agronomos1: TMenuItem;
    GuiaAplicao1: TMenuItem;
    EmissodeReceitas1: TMenuItem;
    Contrato1: TMenuItem;
    ContratosdeGarantiadePreo1: TMenuItem;
    ContratosdeVenda1: TMenuItem;
    ContratoCPR1: TMenuItem;
    CustosdeContratodeVenda1: TMenuItem;
    BloqueiodeProdutos1: TMenuItem;
    PenhorCedular1: TMenuItem;
    PreoProdutoAgricola1: TMenuItem;
    Contratos1: TMenuItem;
    CadastrodeDescontoporProdutor1: TMenuItem;
    MarcarNotasPRelatrio1: TMenuItem;
    ContratoPrmio1: TMenuItem;
    Pesagem1: TMenuItem;
    AcertoSaldoFixar1: TMenuItem;
    CadastroPadroProduto1: TMenuItem;
    CadastroPadroContratoProduto1: TMenuItem;
    CadastroPreosPCidade1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CadastroTabeladeDescontos1Click(Sender: TObject);
    procedure ProdutoAgricola1Click(Sender: TObject);
    procedure Romaneio1Click(Sender: TObject);
    procedure NotaFiscalAgricola1Click(Sender: TObject);
    procedure MensagemParaReceita1Click(Sender: TObject);
    procedure Pragas1Click(Sender: TObject);
    procedure Culturas1Click(Sender: TObject);
    procedure Agronomos1Click(Sender: TObject);
    procedure GuiaAplicao1Click(Sender: TObject);
    procedure EmissodeReceitas1Click(Sender: TObject);
    procedure Contrato1Click(Sender: TObject);
    procedure ContratosdeGarantiadePreo1Click(Sender: TObject);
    procedure ContratosdeVenda1Click(Sender: TObject);
    procedure ContratoCPR1Click(Sender: TObject);
    procedure ControledeFretes1Click(Sender: TObject);
    procedure CustosdeContratodeVenda1Click(Sender: TObject);
    procedure BloqueiodeProdutos1Click(Sender: TObject);
    procedure PenhorCedular1Click(Sender: TObject);
    procedure PreoProdutoAgricola1Click(Sender: TObject);
    procedure Contratos1Click(Sender: TObject);
    procedure CadastrodeDescontoporProdutor1Click(Sender: TObject);
    procedure MarcarNotasPRelatrio1Click(Sender: TObject);
    procedure AcertosemSaldoaFixar1Click(Sender: TObject);
    procedure ContratoPrmio1Click(Sender: TObject);
    procedure Pesagem1Click(Sender: TObject);
    procedure AcertoSaldoFixar1Click(Sender: TObject);
    procedure CadastroPadroProduto1Click(Sender: TObject);
    procedure CadastroPadroContratoProduto1Click(Sender: TObject);
    procedure CadastroPreosPCidade1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuAgricola: TFMenuAgricola;

implementation

uses UDescontoAgricolaCad, UTela_cl, UProdutoAgricolaCad, URomaneioCad,
  URomaneioAgricola_cl, URomSaldo_Param,
  URomDemSaldo, URomDemSaldo2, UNotaAgricolaCad, UMensReceitaCad, UPragaCad,
  UCulturaCad, UAgronomoCad, UGuiaAplicacaoCad,
  URomaneioParam, URRomaneio_Periodo, UReceitaCad, UContratoCad,
  UContratoCad_GP, UContratoVenda_Cad, UContratoCPR, UConhecimentoFreteCad,
  UContratoVendCustos, UBloqueioProdutoCad, UPenhorCedularCad,
  UPrecoAgricolaCad, UContrato_PJuridicaCad, UDescontoProdutorCad,
  UParamSistema_cl, UUsuario_cl, UNotaFiscalMarcar, UDevolucaoFixar,
  UContratoPremioCad, UPesagemCad, UAcertoAgricola, UPadraoProdutoCad,
  UPadraoDescontoProduto, UPrecoCidadeClasseCad;

{$R *.DFM}

procedure TFMenuAgricola.FormCreate(Sender: TObject);
begin
  inherited;
  Pmodulo := 'AGRICOLA';

end;

procedure TFMenuAgricola.CadastroTabeladeDescontos1Click(Sender: TObject);
begin
  inherited;
  If FDescontoAgricolaCad = Nil then
    FDescontoAgricolaCad := TFDescontoAgricolaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FDescontoAgricolaCad.Caption,FDescontoAgricolaCad.Name);
  FDescontoAgricolaCad.ShowModal;
end;

procedure TFMenuAgricola.ProdutoAgricola1Click(Sender: TObject);
begin
  inherited;
  If FProdutoAgricolaCad = Nil then
    FProdutoAgricolaCad := TFProdutoAgricolaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FProdutoAgricolaCad.Caption,FProdutoAgricolaCad.Name);
  FProdutoAgricolaCad.ShowModal;

end;

procedure TFMenuAgricola.Romaneio1Click(Sender: TObject);
begin
  inherited;
  If FRomaneioCad = Nil then
    FRomaneioCad := TFRomaneioCad.Create(Application);
  DMTela.VerificaTela(pModulo,FRomaneioCad.Caption,FRomaneioCad.Name);
  FRomaneioCad.ShowModal;
end;

procedure TFMenuAgricola.NotaFiscalAgricola1Click(Sender: TObject);
begin
  inherited;
  If FNotaAgricolaCad = Nil then
    FNotaAgricolaCad := TFNotaAgricolaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FNotaAgricolaCad.Caption,FNotaAgricolaCad.Name);
  FNotaAgricolaCad.ShowModal;
end;

procedure TFMenuAgricola.MensagemParaReceita1Click(
  Sender: TObject);
begin
  inherited;
  If FMensReceitaCad = Nil then
    FMensReceitaCad := TFMensReceitaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FMensReceitaCad.Caption,FMensReceitaCad.Name);
  FMensReceitaCad.ShowModal;
end;

procedure TFMenuAgricola.Pragas1Click(Sender: TObject);
begin
  inherited;
  If FPragaCad = Nil then
    FPragaCad := TFPragaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPragaCad.Caption,FPragaCad.Name);
  FPragaCad.ShowModal;
end;

procedure TFMenuAgricola.Culturas1Click(Sender: TObject);
begin
  inherited;
  If FCulturaCad = Nil then
    FCulturaCad := TFCulturaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCulturaCad.Caption,FCulturaCad.Name);
  FCulturaCad.ShowModal;
end;

procedure TFMenuAgricola.Agronomos1Click(Sender: TObject);
begin
  inherited;
  If FAgronomoCad = Nil then
    FAgronomoCad := TFAgronomoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FAgronomoCad.Caption,FAgronomoCad.Name);
  FAgronomoCad.ShowModal;
end;

procedure TFMenuAgricola.GuiaAplicao1Click(Sender: TObject);
begin
  inherited;
  If FGuiaAplicacaoCad = Nil then
    FGuiaAplicacaoCad := TFGuiaAplicacaoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FGuiaAplicacaoCad.Caption,FGuiaAplicacaoCad.Name);
  FGuiaAplicacaoCad.ShowModal;
end;

procedure TFMenuAgricola.EmissodeReceitas1Click(Sender: TObject);
begin
  inherited;
  If FReceitaCad = Nil then
    FReceitaCad := TFReceitaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FReceitaCad.Caption,FReceitaCad.Name);
  FReceitaCad.ShowModal;
end;

procedure TFMenuAgricola.Contrato1Click(Sender: TObject);
begin
  inherited;
  If FContratoCad = Nil then
    FContratoCad := TFContratoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FContratoCad.Caption,FContratoCad.Name);
  FContratoCad.ShowModal;
end;

procedure TFMenuAgricola.ContratosdeGarantiadePreo1Click(Sender: TObject);
begin
  inherited;
  if FContratoCad_GP = nil then
    FContratoCad_GP := TFContratoCad_GP.Create(Application);
  DMTela.VerificaTela(pModulo,FContratoCad_GP.Caption,FContratoCad_GP.Name);
  FContratoCad_GP.ShowModal;
end;

procedure TFMenuAgricola.ContratosdeVenda1Click(Sender: TObject);
begin
  inherited;
  if FContrato_Vend = nil then
     FContrato_Vend:=TFContrato_Vend.Create(Application);
  DMTela.VerificaTela(pModulo,FContrato_Vend.Caption,FContrato_Vend.Name);
  FContrato_Vend.ShowModal;
end;

procedure TFMenuAgricola.ContratoCPR1Click(Sender: TObject);
begin
  inherited;
  if FContrato_CPR = nil then
     FContrato_CPR := TFContrato_CPR.Create(Application);
  DMTela.VerificaTela(pModulo,FContrato_CPR.Caption,FContrato_CPR.Name);
  FContrato_CPR.ShowModal;
end;

procedure TFMenuAgricola.ControledeFretes1Click(Sender: TObject);
begin
  inherited;
{  if FConhecimentoFreteCad = nil then
     FConhecimentoFreteCad := TFConhecimentoFreteCad.Create(Application);
  DMTela.VerificaTela(pModulo,FConhecimentoFreteCad.Caption,FConhecimentoFreteCad.Name);
  FConhecimentoFreteCad.ShowModal;
 }
end;

procedure TFMenuAgricola.CustosdeContratodeVenda1Click(Sender: TObject);
begin
  inherited;
  if FContratoVendCustos = nil then
     FContratoVendCustos := TFContratoVendCustos.Create(Application);
  DMTela.VerificaTela(pModulo,FContratoVendCustos.Caption,FContratoVendCustos.Name);
  FContratoVendCustos.ShowModal;

end;

procedure TFMenuAgricola.BloqueiodeProdutos1Click(Sender: TObject);
begin
  inherited;
  if FBloqueioProdutoCad = nil then
     FBloqueioProdutoCad := TFBloqueioProdutoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FBloqueioProdutoCad.Caption,FBloqueioProdutoCad.Name);
  FBloqueioProdutoCad.ShowModal;

end;

procedure TFMenuAgricola.PenhorCedular1Click(Sender: TObject);
begin
  inherited;
  if FPenhorCedularCad = nil then
     FPenhorCedularCad := TFPenhorCedularCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPenhorCedularCad.Caption,FPenhorCedularCad.Name);
  FPenhorCedularCad.ShowModal;
end;

procedure TFMenuAgricola.PreoProdutoAgricola1Click(Sender: TObject);
begin
  inherited;
{  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI') And
     (DMUsuario.CodUsuarioCorrente <> 3) Then
     Raise Exception.Create('Tela Nao Liberada');  }
  If FPrecoAgricolaCad = Nil then
    FPrecoAgricolaCad := TFPrecoAgricolaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPrecoAgricolaCad.Caption,FPrecoAgricolaCad.Name);
  FPrecoAgricolaCad.ShowModal;

end;

procedure TFMenuAgricola.Contratos1Click(Sender: TObject);
begin
  inherited;
  If FContrato_PJuridica = Nil then
    FContrato_PJuridica := TFContrato_PJuridica.Create(Application);
  DMTela.VerificaTela(pModulo,FContrato_PJuridica.Caption,FContrato_PJuridica.Name);
  FContrato_PJuridica.ShowModal;

end;

procedure TFMenuAgricola.CadastrodeDescontoporProdutor1Click(
  Sender: TObject);
begin
  inherited;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI') And
     (DMUsuario.CodUsuarioCorrente <> 3) Then
     Raise Exception.Create('Tela Nao Liberada');
  If FDescontoProdutorCad = Nil then
    FDescontoProdutorCad := TFDescontoProdutorCad.Create(Application);
  DMTela.VerificaTela(pModulo,FDescontoProdutorCad.Caption,FDescontoProdutorCad.Name);
  FDescontoProdutorCad.ShowModal;

end;

procedure TFMenuAgricola.MarcarNotasPRelatrio1Click(Sender: TObject);
begin
  inherited;
  If FNotaFiscalMarcar = Nil then
    FNotaFiscalMarcar := TFNotaFiscalMarcar.Create(Application);
  DMTela.VerificaTela(pModulo,FNotaFiscalMarcar.Caption,FNotaFiscalMarcar.Name);
  FNotaFiscalMarcar.ShowModal;

end;

procedure TFMenuAgricola.AcertosemSaldoaFixar1Click(Sender: TObject);
begin
  inherited;
  If FDevolucaoFixar = Nil then
    FDevolucaoFixar := TFDevolucaoFixar.Create(Application);
  DMTela.VerificaTela(pModulo,FDevolucaoFixar.Caption,FDevolucaoFixar.Name);
  FDevolucaoFixar.ShowModal;

end;

procedure TFMenuAgricola.ContratoPrmio1Click(Sender: TObject);
begin
  inherited;
  If FContratoPremioCad = Nil then
    FContratoPremioCad := TFContratoPremioCad.Create(Application);
  DMTela.VerificaTela(pModulo,FContratoPremioCad.Caption,FContratoPremioCad.Name);
  FContratoPremioCad.ShowModal;
end;

procedure TFMenuAgricola.Pesagem1Click(Sender: TObject);
begin
  inherited;
  If FPesagemCad = Nil then
    FPesagemCad := TFPesagemCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPesagemCad.Caption,FPesagemCad.Name);
  FPesagemCad.ShowModal;

end;

procedure TFMenuAgricola.AcertoSaldoFixar1Click(Sender: TObject);
begin
  inherited;
  If FAcertoAgricola = Nil Then
     FAcertoAgricola := TFAcertoAgricola.Create(application);
  FAcertoAgricola.ShowModal;
end;

procedure TFMenuAgricola.CadastroPadroProduto1Click(Sender: TObject);
begin
  inherited;
  if FPadraoProdutoCad = Nil then
    FPadraoProdutoCad := TFPadraoProdutoCad.Create(Application);
  FPadraoProdutoCad.ShowModal();
end;

procedure TFMenuAgricola.CadastroPadroContratoProduto1Click(
  Sender: TObject);
begin
  inherited;
  if FPadraoDescontoProduto = Nil then
    FPadraoDescontoProduto := TFPadraoDescontoProduto.Create(Application);
  FPadraoDescontoProduto.ShowModal;
end;

procedure TFMenuAgricola.CadastroPreosPCidade1Click(Sender: TObject);
begin
  inherited;
  if FPrecoCidadeClasseCad = Nil then
    FPrecoCidadeClasseCad := TFPrecoCidadeClasseCad.Create(Application);
  FPrecoCidadeClasseCad.ShowModal;
end;

end.
