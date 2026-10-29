unit UMenuCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, Buttons, ImgList, ComCtrls;

type
  TFMenuCompra = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    OrdemCompra1: TMenuItem;
    NotaEntrada1: TMenuItem;
    Parmetros1: TMenuItem;
    ContratoArroz1: TMenuItem;
    ImplantaoSaldoContratos1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure OrdemCompra1Click(Sender: TObject);
    procedure NotaEntrada1Click(Sender: TObject);
    procedure Parmetros1Click(Sender: TObject);
    procedure ContratoArroz1Click(Sender: TObject);
    procedure ImplantaoSaldoContratos1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuCompra: TFMenuCompra;

implementation

uses UTela_cl, UOrdemCompraCad, UNotaEntradaCad,
  UParamSistema, UContratoArroz,UContratoImplantacaoSaldo;

{$R *.DFM}

procedure TFMenuCompra.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'COMPRA';
end;

procedure TFMenuCompra.OrdemCompra1Click(Sender: TObject);
begin
  inherited;
  If FOrdemCompraCad = Nil then
    FOrdemCompraCad := TFOrdemCompraCad.Create(Application);
  DMTela.VerificaTela(pModulo,FOrdemCompraCad.Caption,FOrdemCompraCad.Name);
  FOrdemCompraCad.ShowModal;
end;

procedure TFMenuCompra.NotaEntrada1Click(Sender: TObject);
begin
  inherited;
  If FNotaEntradaCad = Nil then
    FNotaEntradaCad := TFNotaEntradaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FNotaEntradaCad.Caption,FNotaEntradaCad.Name);
  FNotaEntradaCad.ShowModal;
end;

procedure TFMenuCompra.Parmetros1Click(Sender: TObject);
begin
  inherited;
  If FParamSistema = Nil then
    FParamSistema := TFParamSistema.Create(Application);
  DMTela.VerificaTela(pModulo,FParamSistema.Caption,FParamSistema.Name);
  FParamSistema.ShowModal;
end;

procedure TFMenuCompra.ContratoArroz1Click(Sender: TObject);
begin
  inherited;
  If FContratoArrozCad = Nil then
    FContratoArrozCad := TFContratoArrozCad.Create(Application);
  DMTela.VerificaTela(pModulo,FContratoArrozCad.Caption,FContratoArrozCad.Name);
  FContratoArrozCad.ShowModal;
end;

procedure TFMenuCompra.ImplantaoSaldoContratos1Click(Sender: TObject);
begin
  inherited;
  If FContratoImplantacaoSaldoCad = Nil then
    FContratoImplantacaoSaldoCad := TFContratoImplantacaoSaldoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FContratoImplantacaoSaldoCad.Caption,FContratoImplantacaoSaldoCad.Name);
  FContratoImplantacaoSaldoCad.ShowModal;
end;

procedure TFMenuCompra.FormActivate(Sender: TObject);
begin
  inherited;
  MMCadSimples.Items[0].Items[2].Visible := False;
  MMCadSimples.Items[0].Items[3].Visible := False;
end;

end.
