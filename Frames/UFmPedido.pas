unit UFmPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFmPedido = class(TFrame)
    Label1: TLabel;
    MePedido: TMaskEdit;
    BtPedido: TBitBtn;
    EdPedido: TEdit;
    procedure BtPedidoClick(Sender: TObject);
    procedure MePedidoExit(Sender: TObject);
    procedure MePedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UPedidoCons, UPedido_cl, DB, UOracle_cl;

{$R *.dfm}

procedure TFmPedido.BtPedidoClick(Sender: TObject);
begin
  if FPedidoCons = Nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  if FPedidoCons.ShowModal = MrOk then
  begin
    MePedido.Text := DMPedido.QPedidoConsCOD_PEDIDO_CAB.Text;
    MePedidoExit(Self);
  end;
end;

procedure TFmPedido.MePedidoExit(Sender: TObject);
begin
  if Trim(MePedido.Text) <> '' then
    EdPedido.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_PEDIDO_CAB INNER JOIN TB_CADASTRO ON TB_PEDIDO_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO','TB_PEDIDO_CAB.COD_PEDIDO_CAB = ' + MePedido.Text, True)
  else
    EdPedido.Text := 'Todos';
end;

procedure TFmPedido.MePedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     BtPedido.Click;
end;

end.
