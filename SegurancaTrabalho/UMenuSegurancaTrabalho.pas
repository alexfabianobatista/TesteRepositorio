unit UMenuSegurancaTrabalho;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls, ImgList, ComCtrls;

type
  TFMenuSegurancaTrabalho = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Funcionrio1: TMenuItem;
    Exame1: TMenuItem;
    TipoExame1: TMenuItem;
    FunoFuncionrio1: TMenuItem;
    Emprstimo1: TMenuItem;
    Produto1: TMenuItem;
    Compra1: TMenuItem;
    CaractersticaProduto1: TMenuItem;
    Estoque1: TMenuItem;
    TransfernciadeEstoque1: TMenuItem;
    TcnicoSegurana1: TMenuItem;
    CategoriaProfissional1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Funcionrio1Click(Sender: TObject);
    procedure Exame1Click(Sender: TObject);
    procedure TipoExame1Click(Sender: TObject);
    procedure FunoFuncionrio1Click(Sender: TObject);
    procedure Emprstimo1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Compra1Click(Sender: TObject);
    procedure CaractersticaProduto1Click(Sender: TObject);
    procedure Estoque1Click(Sender: TObject);
    procedure TransfernciadeEstoque1Click(Sender: TObject);
    procedure TcnicoSegurana1Click(Sender: TObject);
    procedure CategoriaProfissional1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuSegurancaTrabalho: TFMenuSegurancaTrabalho;

implementation

uses UFuncionarioCad, UTela_cl, UExameCad, UTipoExameCad,
  UFuncaoFuncionarioCad, UEmprestimoCad, UProdutoSegurancaCad,
  UCompraProdutoCad, UCaracteristicaProdutoCad,
  UEstoqueSeguranca, UTransfEstoqueCad, UTecnicoSeguranca, UCategoriaCad;

{$R *.DFM}

procedure TFMenuSegurancaTrabalho.FormCreate(Sender: TObject);
begin
  inherited;
  FMenuSegurancaTrabalho.pModulo := 'SEGURANCATRABALHO';
end;

procedure TFMenuSegurancaTrabalho.Funcionrio1Click(Sender: TObject);
begin
  inherited;
  If FFuncionarioCad = Nil then
    FFuncionarioCad := TFFuncionarioCad.Create(Application);
  DMTela.VerificaTela(pModulo,FFuncionarioCad.Caption,FFuncionarioCad.Name);
  FFuncionarioCad.ShowModal;
end;

procedure TFMenuSegurancaTrabalho.Exame1Click(Sender: TObject);
begin
  inherited;
  If FExameCad = Nil then
    FExameCad := TFExameCad.Create(Application);
  DMTela.VerificaTela(pModulo,FExameCad.Caption,FExameCad.Name);
  FExameCad.ShowModal;
end;

procedure TFMenuSegurancaTrabalho.TipoExame1Click(Sender: TObject);
begin
  inherited;
  If FTipoExameCad = Nil then
    FTipoExameCad := TFTipoExameCad.Create(Application);
  DMTela.VerificaTela(pModulo,FTipoExameCad.Caption,FTipoExameCad.Name);
  FTipoExameCad.ShowModal;
end;

procedure TFMenuSegurancaTrabalho.FunoFuncionrio1Click(Sender: TObject);
begin
  inherited;
  If FFuncaoFuncionarioCad = Nil then
    FFuncaoFuncionarioCad := TFFuncaoFuncionarioCad.Create(Application);
  DMTela.VerificaTela(pModulo,FFuncaoFuncionarioCad.Caption,FFuncaoFuncionarioCad.Name);
  FFuncaoFuncionarioCad.ShowModal;
end;

procedure TFMenuSegurancaTrabalho.Emprstimo1Click(Sender: TObject);
begin
  inherited;
  If FEmprestimoCad = Nil then
    FEmprestimoCad := TFEmprestimoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FEmprestimoCad.Caption,FEmprestimoCad.Name);
  FEmprestimoCad.ShowModal;
end;

procedure TFMenuSegurancaTrabalho.Produto1Click(Sender: TObject);
begin
  inherited;
  If FProdutoSegurancaCad = Nil then
    FProdutoSegurancaCad := TFProdutoSegurancaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FProdutoSegurancaCad.Caption,FProdutoSegurancaCad.Name);
  FProdutoSegurancaCad.ShowModal;
end;

procedure TFMenuSegurancaTrabalho.Compra1Click(Sender: TObject);
begin
  inherited;
  if FCompraProdutoCad = nil then
    FCompraProdutoCad := TFCompraProdutoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCompraProdutoCad.Caption,FCompraProdutoCad.Name);
  FCompraProdutoCad.ShowModal;
end;

procedure TFMenuSegurancaTrabalho.CaractersticaProduto1Click(
  Sender: TObject);
begin
  inherited;
  If FCaracteristicaProdutoCad = Nil then
    FCaracteristicaProdutoCad := TFCaracteristicaProdutoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCaracteristicaProdutoCad.Caption,FCaracteristicaProdutoCad.Name);
  FCaracteristicaProdutoCad.ShowModal;
end;

procedure TFMenuSegurancaTrabalho.Estoque1Click(Sender: TObject);
begin
  inherited;
  If FEstoqueSeguranca = Nil then
    FEstoqueSeguranca := TFEstoqueSeguranca.Create(Application);
  DMTela.VerificaTela(pModulo,FEstoqueSeguranca.Caption,FEstoqueSeguranca.Name);
  FEstoqueSeguranca.ShowModal;
end;

procedure TFMenuSegurancaTrabalho.TransfernciadeEstoque1Click(
  Sender: TObject);
begin
  inherited;
  If FTransfEstoqueCad = Nil then
    FTransfEstoqueCad := TFTransfEstoqueCad.Create(Application);
  DMTela.VerificaTela(pModulo,FTransfEstoqueCad.Caption,FTransfEstoqueCad.Name);
  FTransfEstoqueCad.ShowModal;
end;

procedure TFMenuSegurancaTrabalho.TcnicoSegurana1Click(Sender: TObject);
begin
  inherited;
  if FTecnicoSegurancaCad = nil then
    FTecnicoSegurancaCad := TFTecnicoSegurancaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FTecnicoSegurancaCad.Caption,FTecnicoSegurancaCad.Name);
  FTecnicoSegurancaCad.ShowModal;
end;

procedure TFMenuSegurancaTrabalho.CategoriaProfissional1Click(
  Sender: TObject);
begin
  inherited;
  If FCategoriaCad = Nil then
    FCategoriaCad := TFCategoriaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCategoriaCad.Caption,FCategoriaCad.Name);
  FCategoriaCad.ShowModal;
end;

end.
