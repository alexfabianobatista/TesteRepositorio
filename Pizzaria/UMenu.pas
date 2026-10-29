unit UMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ComCtrls,
  StdCtrls, Grids, Buttons, Mask, DBGrids;

type
  TFMenu = class(TForm)
    MainMenu1: TMainMenu;
    C1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Consultas1: TMenuItem;
    Movimentao1: TMenuItem;
    Clientes1: TMenuItem;
    Operadores1: TMenuItem;
    iposdeProdutos1: TMenuItem;
    r6d4t6s1: TMenuItem;
    Sabores1: TMenuItem;
    Venda1: TMenuItem;
    Configurao1: TMenuItem;
    ParmetrosdoSistema1: TMenuItem;
    Vendas1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Operadores1Click(Sender: TObject);
    procedure iposdeProdutos1Click(Sender: TObject);
    procedure r6d4t6s1Click(Sender: TObject);
    procedure Sabores1Click(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure ParmetrosdoSistema1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
  private
//    procedure TrocaTabPorEnter(var Msg: TMsg; var Handled: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu: TFMenu;

implementation

uses UClienteCad, UOperadorCad, UTipoProdutoCad, UProdutoCad, USaborCad,
  UVenda, UParamSistemaCad, UVenda_Nova, UVendaCons;

{$R *.dfm}

procedure TFMenu.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFMenu.Clientes1Click(Sender: TObject);
begin
  Application.CreateForm(TFClienteCad, FClienteCad);
  FClienteCad.ShowModal;
end;

procedure TFMenu.Operadores1Click(Sender: TObject);
begin
  Application.CreateForm(TFOperadorCad, FOperadorCad);
  FOperadorCad.ShowModal;
end;

procedure TFMenu.iposdeProdutos1Click(Sender: TObject);
begin
  Application.CreateForm(TFTipoProdutoCad, FTipoProdutoCad);
  FTipoProdutoCad.ShowModal;
end;

procedure TFMenu.r6d4t6s1Click(Sender: TObject);
begin
  Application.CreateForm(TFProdutoCad, FProdutoCad);
  FProdutoCad.ShowModal;
end;

procedure TFMenu.Sabores1Click(Sender: TObject);
begin
  Application.CreateForm(TFSaborCad, FSaborCad);
  FSaborCad.ShowModal;
end;

procedure TFMenu.Venda1Click(Sender: TObject);
begin
  Application.CreateForm(TFVenda_Nova, FVenda_Nova);
  FVenda_Nova.ShowModal;
end;

procedure TFMenu.ParmetrosdoSistema1Click(Sender: TObject);
begin
  Application.CreateForm(TFParamSistemaCad, FParamSistemaCad);
  FParamSistemaCad.ShowModal;
end;

procedure TFMenu.Vendas1Click(Sender: TObject);
begin
  Application.CreateForm(TFVendaCons, FVendaCons);
  FVendaCons.ShowModal;
end;

end.
