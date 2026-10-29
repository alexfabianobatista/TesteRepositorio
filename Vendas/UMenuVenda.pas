unit UMenuVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, Buttons, ImgList, ComCtrls, Registry,
  DelRun;

type
  TFMenuVenda = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Pedido1: TMenuItem;
    NotaVenda1: TMenuItem;
    NotaaoConsumidor1: TMenuItem;
    ImpressoraFiscal1: TMenuItem;
    SeguroNotas1: TMenuItem;
    DesdobramentoClaspar1: TMenuItem;
    NotadeTransfernciaFiliais1: TMenuItem;
    LimpezaNotasVendas1: TMenuItem;
    Contabilizao1: TMenuItem;
    Vendasporvendedorregio1: TMenuItem;
    Notas1: TMenuItem;
    Frete1: TMenuItem;
    Logstica1: TMenuItem;
    N1: TMenuItem;
    GuiadeTransito1: TMenuItem;
    CupomFiscal1: TMenuItem;
    rocaDevoluo1: TMenuItem;
    Valepresente1: TMenuItem;
    NotadeSadaAutomtica1: TMenuItem;
    frentedecaixa1: TMenuItem;
    IntegraoMGMobile1: TMenuItem;
    IntegraoMaxRoteirizador: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Pedido1Click(Sender: TObject);
    procedure NotaVenda1Click(Sender: TObject);
    procedure NotaaoConsumidor1Click(Sender: TObject);
    procedure ImpressoraFiscal1Click(Sender: TObject);
    procedure SeguroNotas1Click(Sender: TObject);
    procedure DesdobramentoClaspar1Click(Sender: TObject);
    procedure NotadeTransfernciaFiliais1Click(Sender: TObject);
    procedure LimpezaNotasVendas1Click(Sender: TObject);
    procedure Vendasporvendedorregio1Click(Sender: TObject);
    procedure Notas1Click(Sender: TObject);
    procedure Frete1Click(Sender: TObject);
    procedure Logstica1Click(Sender: TObject);
    procedure GuiadeTransito1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CupomFiscal1Click(Sender: TObject);
    procedure rocaDevoluo1Click(Sender: TObject);
    procedure Valepresente1Click(Sender: TObject);
    procedure NotadeSadaAutomtica1Click(Sender: TObject);
    procedure frentedecaixa1Click(Sender: TObject);
    procedure IntegraoMGMobile1Click(Sender: TObject);
    procedure IntegraoMaxRoteirizadorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuVenda: TFMenuVenda;
  Registry: TRegistry;

implementation

uses UPedidoCad, UTela_cl, UNotaSaidaCad, UNotaConsumidor,
  UImpressoraFiscal, ULiberaFrete, UParamSistema_cl, UDesdobramentoCad,
  UDesdobramento_ClasparCons, UNotaTransfFilialCad, ULimpezaVendas,
  UContabilidadeParam, UVenda_Regiao, UMonitorLogistica, UFidelidadeCad,
  UGuiaTransito_Cad, UNfe_cl, UFilial_cl, UUsuario_cl, UOracle_cl, UTef,
  UCupomFiscalCad, Math, UDevolucaoTroca, UValePresenteCad,
  UNotaSaidaAutomatica, UBibVenda, UNotaAutomaticaFlag, UNotaFrenteCaixa,
  UIntegracaoMGMobile, UIntegracaoMaxRoteirizador;

{$R *.DFM}

procedure TFMenuVenda.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'VENDA';

  if not RunningUnderDelphi then
  begin
    FImpressoraFiscal.ChecaReducaoZAutomatica;
  end;

  if NotaAutomaticaFlag = Nil then
    NotaAutomaticaFlag := TNotaAutomaticaFlag.Create;
  NotaAutomaticaFlag.pNotaAutomatica := false;

end;

procedure TFMenuVenda.Pedido1Click(Sender: TObject);
begin
  inherited;
  If FPedidoCad = Nil then
    FPedidoCad := TFPedidoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FPedidoCad.Caption,FPedidoCad.Name);
  If (DmParamSistema.QParamSistemaCod_Empresa.Value <> 'CGS') And
     (DmParamSistema.QParamSistemaCod_Empresa.Value <> 'GONZATTI') Then
  Begin
    FPedidoCad.DBECodProdutoAux.Visible := False;
    FPedidoCad.LblCodProdutoAux.Visible := False;
  End;
  If DmParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' Then
  Begin
    FPedidoCad.DbEdit37.Visible := True;
    FPedidoCad.Label30.Visible := True;
    FPedidoCad.BtConsProdutoAux.Visible := True;
  End;
  FPedidoCad.ShowModal;
end;

procedure TFMenuVenda.NotaVenda1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaCad = Nil then
    FNotaSaidaCad := TFNotaSaidaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FNotaSaidaCad.Caption,FNotaSaidaCad.Name);
  FNotaSaidaCad.ShowModal;
end;

procedure TFMenuVenda.NotaaoConsumidor1Click(Sender: TObject);
begin
  inherited;
  If FNotaConsumidor = Nil then
    FNotaConsumidor := TFNotaConsumidor.Create(Application);
  DMTela.VerificaTela(pModulo,FNotaConsumidor.Caption,FNotaConsumidor.Name);
  FNotaConsumidor.ShowModal;
end;

procedure TFMenuVenda.ImpressoraFiscal1Click(Sender: TObject);
begin
  inherited;
  If FImpressoraFiscal = Nil Then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFMenuVenda.SeguroNotas1Click(Sender: TObject);
begin
  inherited;
  If FLiberaFrete = Nil then
    FLiberaFrete := TFLiberaFrete.Create(Application);
  DMTela.VerificaTela(pModulo,FLiberaFrete.Caption,FLiberaFrete.Name);
  FLiberaFrete.ShowModal;
end;

procedure TFMenuVenda.DesdobramentoClaspar1Click(Sender: TObject);
begin
  inherited;
  If FDesdobramentoCad = Nil then
    FDesdobramentoCad := TFDesdobramentoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FDesdobramentoCad.Caption,FDesdobramentoCad.Name);
  FDesdobramentoCad.ShowModal;

end;

procedure TFMenuVenda.NotadeTransfernciaFiliais1Click(Sender: TObject);
begin
  inherited;
  If FNotaTransfFilialCad = Nil then
    FNotaTransfFilialCad := TFNotaTransfFilialCad.Create(Application);
  DMTela.VerificaTela(pModulo,FNotaTransfFilialCad.Caption,FNotaTransfFilialCad.Name);
  FNotaTransfFilialCad.ShowModal;

end;

procedure TFMenuVenda.LimpezaNotasVendas1Click(Sender: TObject);
begin
  inherited;
  If FLimpezaVendas = Nil then
    FLimpezaVendas := TFLimpezaVendas.Create(Application);
//  DMTela.VerificaTela(pModulo,FNotaTransfFilialCad.Caption);
  FLimpezaVendas.ShowModal;

end;

procedure TFMenuVenda.Vendasporvendedorregio1Click(Sender: TObject);
begin
  inherited;
  if FVenda_regiao = nil then
     FVenda_regiao := TFVenda_regiao.Create(Application);
  DMTela.VerificaTela(pModulo,FVenda_regiao.Caption,FVenda_regiao.Name);
  FVenda_regiao.ShowModal;
end;

procedure TFMenuVenda.Notas1Click(Sender: TObject);
begin
  inherited;
  If FContabilidadeParam = Nil then
    FContabilidadeParam := TFContabilidadeParam.Create(Application);
  DMTela.VerificaTela(pModulo,FContabilidadeParam.Caption,FContabilidadeParam.Name);
  FContabilidadeParam.PGRelatorio.Pages[0].TabVisible := True;
  FContabilidadeParam.BtOk.Visible := True;
  FContabilidadeParam.BtCancela.Visible := True;
//  FContabilidadeParam.BitBtn1.Visible := True;
  FContabilidadeParam.ShowModal;

end;

procedure TFMenuVenda.Frete1Click(Sender: TObject);
begin
  inherited;
{  If FContabilidadeParam = Nil then
    FContabilidadeParam := TFContabilidadeParam.Create(Application);
  DMTela.VerificaTela(pModulo,FContabilidadeParam.Caption,FContabilidadeParam.Name);
  FContabilidadeParam.PGRelatorio.Pages[1].TabVisible := True;
  FContabilidadeParam.BtOk.Visible := False;
  FContabilidadeParam.BtCancela.Visible := False;
  FContabilidadeParam.BitBtn1.Visible := False;
  FContabilidadeParam.ShowModal;
 }
end;

procedure TFMenuVenda.Logstica1Click(Sender: TObject);
begin
  inherited;
  if FMonitorLogistica = nil then
     FMonitorLogistica := TFMonitorLogistica.Create(Application);
  DMTela.VerificaTela(pModulo,FMonitorLogistica.Caption,FMonitorLogistica.Name);
  FMonitorLogistica.ShowModal;
end;

procedure TFMenuVenda.GuiadeTransito1Click(Sender: TObject);
begin
  inherited;
  if FGuiaTransito_Cad = nil then
     FGuiaTransito_Cad := TFGuiaTransito_Cad.Create(Application);
  DMTela.VerificaTela(pModulo,FGuiaTransito_Cad.Caption,FGuiaTransito_Cad.Name);
  FGuiaTransito_Cad.ShowModal;
end;

procedure TFMenuVenda.FormActivate(Sender: TObject);
var wFilial: String;
  i: integer;
begin
  inherited;
  wFilial := '';
  Registry := TRegistry.Create;//executa o tregistry
  Registry.RootKey:=HKEY_CURRENT_USER; //abre a chave mestra
  Registry.OpenKey('SOFTWARE\CemapaSistema',true);
  if Registry.ValueExists('FilialTEF') then
    wFilial := Registry.ReadString('FilialTEF');
  if wFilial <> '' then
    if FTEF = nil then
      FTEF := TFTEF.Create(Application);

    // Só aparece para clientes com nota automática
    if DMParamSistema.QParamSistemaIND_NOTA_AUTOMATICA_WEB.Text = 'SIM' then
    begin
      for i := 0 to MMCadSimples.Items[0].Count -1 do
      begin
        if MMCadSimples.Items[0][i].Name = 'NotadeSadaAutomtica1' then
          MMCadSimples.Items[0][i].Enabled := true;
      end;
    end;
    if DMParamSistema.CodEmpresa = 'MARICOTA' then
      MMCadSimples.Items[0][18].Enabled := true;
    if DMParamSistema.CodEmpresa = 'DEION' then
      MMCadSimples.Items[0][19].Enabled := true;
end;

procedure TFMenuVenda.CupomFiscal1Click(Sender: TObject);
begin
  inherited;
  if DelRun.RunningUnderDelphi then
  begin
    if FCupomFiscalCad = nil then
      FCupomFiscalCad := TFCupomFiscalCad.Create(Application);
    FCupomFiscalCad.ShowModal;
  end
  else
    MessageDlg('Esta funcionalidade está sendo desenvolvida', mtInformation,
      [mbOk],0);
end;

procedure TFMenuVenda.rocaDevoluo1Click(Sender: TObject);
begin
  inherited;
  if FDevolucaoTroca = Nil then
    FDevolucaoTroca := TFDevolucaoTroca.Create(Application);
  DMTela.VerificaTela(pModulo,FDevolucaoTroca.Caption,FDevolucaoTroca.Name);
  FDevolucaoTroca.ShowModal;
end;

procedure TFMenuVenda.Valepresente1Click(Sender: TObject);
begin
  inherited;
  if FValePresenteCad = Nil then
    FValePresenteCad := TFValePresenteCad.Create(Application);
  DMTela.VerificaTela(pModulo,FValePresenteCad.Caption,FValePresenteCad.Name);
  FValePresenteCad.ShowModal;
end;

procedure TFMenuVenda.NotadeSadaAutomtica1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaAutomatica := TFNotaSaidaAutomatica.Create(Application);
  FNotaSaidaAutomatica.ShowModal();
end;

procedure TFMenuVenda.frentedecaixa1Click(Sender: TObject);
begin
  inherited;
  If FNotaFrenteCaixa = Nil then
    FNotaFrenteCaixa := TFNotaFrenteCaixa.Create(Application);
  DMTela.VerificaTela(pModulo,FNotaFrenteCaixa.Caption,FNotaFrenteCaixa.Name);
  FNotaFrenteCaixa.ShowModal;
end;

procedure TFMenuVenda.IntegraoMGMobile1Click(Sender: TObject);
begin
  inherited;
  If FIntegracaoMGMobile = Nil then
    FIntegracaoMGMobile := TFIntegracaoMGMobile.Create(Application);
  DMTela.VerificaTela(pModulo,FIntegracaoMGMobile.Caption,FIntegracaoMGMobile.Name);
  FIntegracaoMGMobile.ShowModal;
end;

procedure TFMenuVenda.IntegraoMaxRoteirizadorClick(Sender: TObject);
begin
  inherited;
  If FIntegracaoMaxRoteirizador = Nil then
    FIntegracaoMaxRoteirizador := TFIntegracaoMaxRoteirizador.Create(Application);
  DMTela.VerificaTela(pModulo,FIntegracaoMaxRoteirizador.Caption,FIntegracaoMaxRoteirizador.Name);
  FIntegracaoMaxRoteirizador.ShowModal;
end;

end.

