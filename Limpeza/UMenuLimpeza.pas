unit UMenuLimpeza;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls, ImgList, ComCtrls;

type
  TFMenuLimpeza = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    LimpezadeCaixa1: TMenuItem;
    LimpezadeBancos1: TMenuItem;
    LimpezadePedidos1: TMenuItem;
    LimpezadeContasReceber1: TMenuItem;
    LimpezadeContasPagar1: TMenuItem;
    LimpezadeNotasFiscais1: TMenuItem;
    LimpezaRomaneioAgricola1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure LimpezadeCaixa1Click(Sender: TObject);
    procedure LimpezadeBancos1Click(Sender: TObject);
    procedure LimpezadePedidos1Click(Sender: TObject);
    procedure LimpezadeContasReceber1Click(Sender: TObject);
    procedure LimpezadeContasPagar1Click(Sender: TObject);
    procedure LimpezadeNotasFiscais1Click(Sender: TObject);
    procedure LimpezaRomaneioAgricola1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuLimpeza: TFMenuLimpeza;

implementation

uses ULimpeza_Param, UTela_cl, ULimpezaCaixa, ULimpezaBancos,
  ULimpezaPedidos, ULimpezaContasReceber, ULimpezaContasPagar,
  ULimpezaNotas, UUsuario_cl, ULimpezaRomaneio;

{$R *.DFM}

procedure TFMenuLimpeza.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'LIMPEZA';

end;

procedure TFMenuLimpeza.LimpezadeCaixa1Click(Sender: TObject);
begin
  inherited;
  If DMUsuario.pTipoFuncionario <> 'DIRETOR' Then
     Raise Exception.Create('Esta operação somente pode ser executada por usuário Diretor');
  If FLimpezaCaixa = Nil then
    FLimpezaCaixa := TFLimpezaCaixa.Create(Application);
  DMTela.VerificaTela(pModulo,FLimpezaCaixa.Caption,FLimpezaCaixa.Name);
  FLimpezaCaixa.ShowModal;
end;

procedure TFMenuLimpeza.LimpezadeBancos1Click(Sender: TObject);
begin
  inherited;
  If DMUsuario.pTipoFuncionario <> 'DIRETOR' Then
     Raise Exception.Create('Esta operação somente pode ser executada por usuário Diretor');
  If FLimpezaBancos = Nil then
    FLimpezaBancos := TFLimpezaBancos.Create(Application);
  DMTela.VerificaTela(pModulo,FLimpezaBancos.Caption,FLimpezaBancos.Name);
  FLimpezaBancos.ShowModal;

end;

procedure TFMenuLimpeza.LimpezadePedidos1Click(Sender: TObject);
begin
  inherited;
  If DMUsuario.pTipoFuncionario <> 'DIRETOR' Then
     Raise Exception.Create('Esta operação somente pode ser executada por usuário Diretor');
  If FLimpezaPedidos = Nil then
    FLimpezaPedidos := TFLimpezaPedidos.Create(Application);
  DMTela.VerificaTela(pModulo,FLimpezaPedidos.Caption,FLimpezaPedidos.Name);
  FLimpezaPedidos.ShowModal;

end;

procedure TFMenuLimpeza.LimpezadeContasReceber1Click(Sender: TObject);
begin
  inherited;
  If DMUsuario.pTipoFuncionario <> 'DIRETOR' Then
     Raise Exception.Create('Esta operação somente pode ser executada por usuário Diretor');
  If FLimpezaContasReceber = Nil then
    FLimpezaContasReceber := TFLimpezaContasReceber.Create(Application);
  DMTela.VerificaTela(pModulo,FLimpezaContasReceber.Caption,FLimpezaContasReceber.Name);
  FLimpezaContasReceber.ShowModal;
end;

procedure TFMenuLimpeza.LimpezadeContasPagar1Click(Sender: TObject);
begin
  inherited;
  If DMUsuario.pTipoFuncionario <> 'DIRETOR' Then
     Raise Exception.Create('Esta operação somente pode ser executada por usuário Diretor');
  If FLimpezaContasPagar = Nil then
    FLimpezaContasPagar := TFLimpezaContasPagar.Create(Application);
  DMTela.VerificaTela(pModulo,FLimpezaContasPagar.Caption,FLimpezaContasPagar.Name);
  FLimpezaContasPagar.ShowModal;
end;

procedure TFMenuLimpeza.LimpezadeNotasFiscais1Click(Sender: TObject);
begin
  inherited;
  If DMUsuario.pTipoFuncionario <> 'DIRETOR' Then
     Raise Exception.Create('Esta operação somente pode ser executada por usuário Diretor');
  If FLimpezaNotas = Nil then
    FLimpezaNotas := TFLimpezaNotas.Create(Application);
  DMTela.VerificaTela(pModulo,FLimpezaNotas.Caption,FLimpezaNotas.Name);
  FLimpezaNotas.ShowModal;

end;

procedure TFMenuLimpeza.LimpezaRomaneioAgricola1Click(Sender: TObject);
begin
  inherited;
  If DMUsuario.pTipoFuncionario <> 'DIRETOR' Then
     Raise Exception.Create('Esta operação somente pode ser executada por usuário Diretor');
  If FLimpezaRomaneio = Nil then
    FLimpezaRomaneio := TFLimpezaRomaneio.Create(Application);
  DMTela.VerificaTela(pModulo,FLimpezaRomaneio.Caption,FLimpezaRomaneio.Name);
  FLimpezaRomaneio.ShowModal;

end;

end.
