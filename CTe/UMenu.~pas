unit UMenu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls, ImgList, ComCtrls;

type
  TFMenuCTe = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    CadastrodeVeiculos1: TMenuItem;
    CTe1: TMenuItem;
    MDFe1: TMenuItem;
    ControledeEntrega1: TMenuItem;
    CTeOutrosServicos1: TMenuItem;
    Viagem1: TMenuItem;
    Cadastro1: TMenuItem;
    Tributacao1: TMenuItem;
    Serie1: TMenuItem;
    Operacao1: TMenuItem;
    Usuario1: TMenuItem;
    Empresa1: TMenuItem;
    Produto1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CadastrodeVeiculos1Click(Sender: TObject);
    procedure CTe1Click(Sender: TObject);
    procedure MDFe1Click(Sender: TObject);
    procedure ControledeEntrega1Click(Sender: TObject);
    procedure CTeOutrosServicos1Click(
      Sender: TObject);
    procedure Viagem1Click(Sender: TObject);
    procedure Cadastro1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Serie1Click(Sender: TObject);
    procedure Operacao1Click(Sender: TObject);
    procedure Tributacao1Click(Sender: TObject);
    procedure Usuario1Click(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuCTe: TFMenuCTe;

implementation

uses UVeiculoCad, UTela_cl, 
  UMdfeCadSimplificado, UControleEntregaCad, UCteCadSimplificado, UCteOSCadSimplificado,
  UCadastroCad, UProdutoCad, USerieCad, UOperacaoCad, UTributacaoCad,
  UUsuarioCad, UFilialCad, UUsuario_cl, UFilial_cl, Unit1, UViagemCad;

{$R *.DFM}

procedure TFMenuCTe.FormCreate(Sender: TObject);
begin
  inherited;
  Self.pModulo:= 'CTe';
end;

procedure TFMenuCTe.CadastrodeVeiculos1Click(Sender: TObject);
begin
  inherited;
  If FVeiculoCad = Nil then
    FVeiculoCad := TFVeiculoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FVeiculoCad.Caption,FVeiculoCad.Name);
  FVeiculoCad.ShowModal;
end;

procedure TFMenuCTe.CTe1Click(
  Sender: TObject);
begin
  inherited;
  if FCteCadSimplificado = Nil then
    FCteCadSimplificado := TFCteCadSimplificado.Create(Application);
  DMTela.VerificaTela(pModulo,FCteCadSimplificado.Caption, FCteCadSimplificado.Name);
  FCteCadSimplificado.ShowModal;
end;

procedure TFMenuCTe.MDFe1Click(
  Sender: TObject);
begin
  inherited;
  if FMdfeCadSimplificado = Nil then
    FMdfeCadSimplificado := TFMdfeCadSimplificado.Create(Application);
  DMTela.VerificaTela(pModulo,FMdfeCadSimplificado.Caption, FMdfeCadSimplificado.Name);
  FMdfeCadSimplificado.ShowModal;
end;

procedure TFMenuCTe.ControledeEntrega1Click(Sender: TObject);
begin
  inherited;
  if FControleEntregaCad = Nil then
    FControleEntregaCad := TFControleEntregaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FControleEntregaCad.Caption, FControleEntregaCad.Name);
  FControleEntregaCad.ShowModal;
end;

procedure TFMenuCTe.CTeOutrosServicos1Click(
  Sender: TObject);
begin
  inherited;
  if FCteOSCadSimplificado = Nil then
    FCteOSCadSimplificado := TFCteOSCadSimplificado.Create(Application);
  DMTela.VerificaTela(pModulo,FCteOSCadSimplificado.Caption, FCteOSCadSimplificado.Name);
  FCteOSCadSimplificado.ShowModal;
end;

procedure TFMenuCTe.Viagem1Click(Sender: TObject);
begin
  inherited;
  if FViagemCad = Nil then
    FViagemCad := TFViagemCad.Create(Application);
  DMTela.VerificaTela(pModulo,FViagemCad.Caption, FViagemCad.Name);
  FViagemCad.ShowModal;
end;

procedure TFMenuCTe.Cadastro1Click(Sender: TObject);
begin
  inherited;
  If FCadastroCad = Nil then
    FCadastroCad := TFCadastroCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCadastroCad.Caption,FCadastroCad.Name);
  FCadastroCad.ShowModal;
end;

procedure TFMenuCTe.Produto1Click(Sender: TObject);
begin
  inherited;
  If FProdutoCad = Nil then
    FProdutoCad := TFProdutoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FProdutoCad.Caption,FProdutoCad.Name);
  FProdutoCad.ShowModal;
end;

procedure TFMenuCTe.Serie1Click(Sender: TObject);
begin
  inherited;
  if FSerieCad = nil then
    FSerieCad := TFSerieCad.Create(Application);
  DMTela.VerificaTela(pModulo, FSerieCad.Caption, FSerieCad.Name);
  FSerieCad.ShowModal;
end;

procedure TFMenuCTe.Operacao1Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCad = nil then
    FOperacaoCad := TFOperacaoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FOperacaoCad.Caption, FOperacaoCad.Name);
  FOperacaoCad.ShowModal;
end;

procedure TFMenuCTe.Tributacao1Click(Sender: TObject);
begin
  inherited;
  if FTributacaoCad = nil then
    FTributacaoCad := TFTributacaoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FTributacaoCad.Caption, FTributacaoCad.Name);
  FTributacaoCad.ShowModal;
end;

procedure TFMenuCTe.Usuario1Click(Sender: TObject);
begin
  inherited;
  If FUsuarioCad = Nil then
    FUsuarioCad := TFUsuarioCad.Create(Application);
  DMTela.VerificaTela(pModulo,FUsuarioCad.Caption,FUsuarioCad.Name);
  FUsuarioCad.ShowModal;
end;

procedure TFMenuCTe.Empresa1Click(Sender: TObject);
var wCodFilial: Integer;
begin
  inherited;
  if FFilialCad = nil then
    FFilialCad := TFFilialCad.Create(Application);
  DMTela.VerificaTela(pModulo, FFilialCad.Caption, FFilialCad.Name);
  if DMUsuario.CodFilialUsuario > 0 then
    wCodFilial := DMUsuario.CodFilialUsuario
  else
    wCodFilial := 1;
  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK',wCodFilial);
  DMFilial.QFilial.Open;
  FFilialCad.ShowModal;
end;

end.
