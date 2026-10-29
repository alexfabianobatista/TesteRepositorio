unit UMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ComCtrls,
  StdCtrls, Grids, Buttons, Mask;

type
  TFMenu = class(TForm)
    MainMenu1: TMainMenu;
    C1: TMenuItem;
    Clientes1: TMenuItem;
    Sair1: TMenuItem;
    Endereos1: TMenuItem;
    Bairro1: TMenuItem;
    Cidade1: TMenuItem;
    Estado1: TMenuItem;
    Cor1: TMenuItem;
    Marca1: TMenuItem;
    Veculo1: TMenuItem;
    Vendedor1: TMenuItem;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Consultas1: TMenuItem;
    Clientes2: TMenuItem;
    Veculos1: TMenuItem;
    Funcionrios1: TMenuItem;
    Movimentao1: TMenuItem;
    Venda1: TMenuItem;
    Compra1: TMenuItem;
    N1: TMenuItem;
    Clientesquemaiscompraram1: TMenuItem;
    ClientesqueCompraramemDeterminadoMs1: TMenuItem;
    ClientescomCompraeVenda1: TMenuItem;
    VeculosCompradoseVendidosnoMesmoMs1: TMenuItem;
    VeculosporCliente1: TMenuItem;
    Comisses1: TMenuItem;
    Vendas1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Endereos1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Bairro1Click(Sender: TObject);
    procedure Cidade1Click(Sender: TObject);
    procedure Estado1Click(Sender: TObject);
    procedure Cor1Click(Sender: TObject);
    procedure Marca1Click(Sender: TObject);
    procedure Vendedor1Click(Sender: TObject);
    procedure Veculo1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Veculos1Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Compra1Click(Sender: TObject);
    procedure Clientesquemaiscompraram1Click(Sender: TObject);
    procedure ClientesqueCompraramemDeterminadoMs1Click(Sender: TObject);
    procedure ClientescomCompraeVenda1Click(Sender: TObject);
    procedure VeculosCompradoseVendidosnoMesmoMs1Click(Sender: TObject);
    procedure VeculosporCliente1Click(Sender: TObject);
    procedure Comisses1Click(Sender: TObject);
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

uses UClienteCad, UEnderecoCad, UBairroCad, UCidadeCad, UEstadoCad,
  UCorCad, UMarcaCad, UVendedorCad, UVeiculoCad, UClienteCons,
  UVeiculoCons, UVendedorCons, UVenda, UCompra, UClienteCons_MaisComprou,
  UFuncoes, UClienteCons_VendaMes, UClienteCons_CompraVenda,
  UClienteCons_CompraVendaMesmoMes, UClienteCons_VeiculosVendidos,
  UVendedorCons_Comissao, UVendaCons;

{$R *.dfm}

procedure TFMenu.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFMenu.Endereos1Click(Sender: TObject);
begin
  Application.CreateForm(TFEnderecoCad, FEnderecoCad);
  FEnderecoCad.ShowModal;
end;

procedure TFMenu.Clientes1Click(Sender: TObject);
begin
  Application.CreateForm(TFClienteCad, FClienteCad);
  FClienteCad.ShowModal;
end;

procedure TFMenu.Bairro1Click(Sender: TObject);
begin
  Application.CreateForm(TFBairroCad, FBairroCad);
  FBairroCad.ShowModal;
end;

procedure TFMenu.Cidade1Click(Sender: TObject);
begin
  Application.CreateForm(TFCidadeCad, FCidadeCad);
  FCidadeCad.ShowModal;
end;

procedure TFMenu.Estado1Click(Sender: TObject);
begin
  Application.CreateForm(TFEstadoCad, FEstadoCad);
  FEstadoCad.ShowModal;
end;

procedure TFMenu.Cor1Click(Sender: TObject);
begin
  Application.CreateForm(TFCorCad, FCorCad);
  FCorCad.ShowModal;
end;

procedure TFMenu.Marca1Click(Sender: TObject);
begin
  Application.CreateForm(TFMarcaCad, FMarcaCad);
  FMarcaCad.ShowModal;
end;

procedure TFMenu.Vendedor1Click(Sender: TObject);
begin
  Application.CreateForm(TFVendedorCad, FVendedorCad);
  FVendedorCad.ShowModal;
end;

procedure TFMenu.Veculo1Click(Sender: TObject);
begin
  Application.CreateForm(TFVeiculoCad, FVeiculoCad);
  FVeiculoCad.ShowModal;
end;

procedure TFMenu.Clientes2Click(Sender: TObject);
begin
  Application.CreateForm(TFClienteCons, FClienteCons);
  FClienteCons.ShowModal;
end;

procedure TFMenu.Veculos1Click(Sender: TObject);
begin
  Application.CreateForm(TFVeiculoCons, FVeiculoCons);
  FVeiculoCons.ShowModal;
end;

procedure TFMenu.Funcionrios1Click(Sender: TObject);
begin
  Application.CreateForm(TFVendedorCons, FVendedorCons);
  FVendedorCons.ShowModal;
end;

procedure TFMenu.Venda1Click(Sender: TObject);
begin
  Application.CreateForm(TFVenda, FVenda);
  FVenda.ShowModal;
end;

//procedure TFMenu.TrocaTabPorEnter(var Msg: TMsg; var Handled: Boolean);
//begin
//  if not ((Screen.ActiveControl is TCustomMemo) or
//       (Screen.ActiveControl is TCustomGrid) or
//       (Screen.ActiveControl is TButton) or
//       (Screen.ActiveControl is TBitBtn) or
//       (Screen.ActiveControl is TCustomEdit) or
//       (Screen.ActiveControl is TMaskEdit) or
//       (Screen.ActiveForm.ClassName = 'TMessageForm')) then
//    if (Msg.message = WM_KEYDOWN) then
//      case Msg.wParam of
//        VK_RETURN, VK_DOWN: Screen.ActiveForm.Perform(WM_NextDlgCtl, 0, 0);
//        VK_UP: Screen.ActiveForm.Perform(WM_NextDlgCtl, 1, 0);
//      end;
//end;

procedure TFMenu.FormCreate(Sender: TObject);
begin
//  Application.OnMessage := TrocaTabPorEnter;
end;

procedure TFMenu.Compra1Click(Sender: TObject);
begin
  Application.CreateForm(TFCompra, FCompra);
  FCompra.ShowModal;
end;

procedure TFMenu.Clientesquemaiscompraram1Click(Sender: TObject);
begin
  Application.CreateForm(TFClienteCons_MaisComprou, FClienteCons_MaisComprou);
  FClienteCons_MaisComprou.ShowModal;
end;

procedure TFMenu.ClientesqueCompraramemDeterminadoMs1Click(
  Sender: TObject);
begin
  Application.CreateForm(TFClienteCons_VendaMes, FClienteCons_VendaMes);
  FClienteCons_VendaMes.ShowModal;
end;

procedure TFMenu.ClientescomCompraeVenda1Click(Sender: TObject);
begin
  Application.CreateForm(TFClienteCons_CompraVenda, FClienteCons_CompraVenda);
  FClienteCons_CompraVenda.ShowModal;
end;

procedure TFMenu.VeculosCompradoseVendidosnoMesmoMs1Click(Sender: TObject);
begin
  Application.CreateForm(TFClienteCons_CompraVendaMesmoMes, FClienteCons_CompraVendaMesmoMes);
  FClienteCons_CompraVendaMesmoMes.ShowModal;
end;

procedure TFMenu.VeculosporCliente1Click(Sender: TObject);
begin
  Application.CreateForm(TFClienteCons_VeiculosVendidos, FClienteCons_VeiculosVendidos);
  FClienteCons_VeiculosVendidos.ShowModal;
end;

procedure TFMenu.Comisses1Click(Sender: TObject);
begin
  Application.CreateForm(TFVendedorCons_Comissao, FVendedorCons_Comissao);
  FVendedorCons_Comissao.ShowModal;
end;

procedure TFMenu.Vendas1Click(Sender: TObject);
begin
  Application.CreateForm(TFVendaCons, FVendaCons);
  FVendaCons.ShowModal;
end;

end.
