unit UMenuPafEcf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTMenuPrincipal, Menus, ImgList, ComCtrls, Buttons, ExtCtrls, Registry,
  ActnList;

type
  TFMenuPafEcf = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    MenuFiscal1: TMenuItem;
    CupomFiscal1: TMenuItem;
    ActionList1: TActionList;
    Action1: TAction;
    ConsultadeProduto1: TMenuItem;
    RecebimentodeTtulo1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MenuFiscal1Click(Sender: TObject);
    procedure CupomFiscal1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure NotadeVenda1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure ConsultadeProduto1Click(Sender: TObject);
    procedure RecebimentodeTtulo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuPafEcf: TFMenuPafEcf;
  Registry: TRegistry;
implementation

uses UImpressoraFiscal, UCupomFiscalCad, UTef, UNotaSaidaCad,
  UParamSistema_cl, Delrun, UProdutoCons, UContasReceberBaixa, DateUtils,
  UContasReceber_cl;

{$R *.dfm}

procedure TFMenuPafEcf.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'PAF-ECF';
end;

procedure TFMenuPafEcf.MenuFiscal1Click(Sender: TObject);
begin
  inherited;
  If FImpressoraFiscal = Nil Then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFMenuPafEcf.CupomFiscal1Click(Sender: TObject);
begin
  inherited;
  if FCupomFiscalCad = nil then
    FCupomFiscalCad := TFCupomFiscalCad.Create(Application);
  FCupomFiscalCad.ShowModal;
end;

procedure TFMenuPafEcf.FormActivate(Sender: TObject);
var wFilial: String;
begin
  inherited;
  wFilial := '';
  Registry := TRegistry.Create;//executa o tregistry
  Registry.RootKey:=HKEY_LOCAL_MACHINE; //abre a chave mestra
  Registry.OpenKey('SOFTWARE\CemapaSistema',true);
  if Registry.ValueExists('FilialTEF') then
    wFilial := Registry.ReadString('FilialTEF');
  if wFilial <> '' then
    if FTEF = nil then
      FTEF := TFTEF.Create(Application);


  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  //Checa se a impressora fez redução z automática
  if not RunningUnderDelphi then
    FImpressoraFiscal.ChecaReducaoZAutomatica;
end;
procedure TFMenuPafEcf.NotadeVenda1Click(Sender: TObject);
begin
  inherited;
  //if FNotaSaidaCad = Nil then
//    FNotaSaidaCad := TFNotaSaidaCad.Create(Application);
//  FNotaSaidaCad.ShowModal;
end;

procedure TFMenuPafEcf.Action1Execute(Sender: TObject);
begin
  inherited;
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFMenuPafEcf.ConsultadeProduto1Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  FProdutoCons.HabilitaColunasPaf;
  FProdutoCons.ShowModal;
end;

procedure TFMenuPafEcf.RecebimentodeTtulo1Click(Sender: TObject);
begin
  inherited;
  if not FImpressoraFiscal.VerificaPAFECFLiberado then
    Abort;
  with DMContasReceber do
  begin
    QcontasReceber_Cab.Open;
    QContasReceber_Mov.Open;
  end;
  if FContasReceberBaixa = nil then
    FContasReceberBaixa := TFContasReceberBaixa.Create(Application);
  FcontasReceberBaixa.PCBaixa.Pages[2].TabVisible := false;
  FcontasReceberBaixa.PCBaixa.Pages[3].TabVisible := false;
  FcontasReceberBaixa.sbAlteraObs.Visible := False;
  FcontasReceberBaixa.sbProcuraNota.Visible := False;
  FContasReceberBaixa.ShowModal;
end;

end.
