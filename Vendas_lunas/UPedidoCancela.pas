unit UPedidoCancela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFPedidoCancela = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MEQuantidade: TMaskEdit;
    Label1: TLabel;
    MEMotivo: TMaskEdit;
    Label22: TLabel;
    BtConsMotivo: TBitBtn;
    EdMotivo: TEdit;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtConsMotivoClick(Sender: TObject);
    procedure MEMotivoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPedidoCancela: TFPedidoCancela;

implementation

uses UPedido_cl, UOracle_cl, UUsuario_cl, UMotivoCons, UMotivo_cl;

{$R *.DFM}

procedure TFPedidoCancela.DBGrid1CellClick(Column: TColumn);
begin
  With DMPedido do
  Begin
    QPedido_Cancelado.Close;
    QPedido_Cancelado.SetVariable('PK',QPedidoItem_CancCod_Pedido_Item.Value);
    QPedido_Cancelado.Open;
  End;
end;

procedure TFPedidoCancela.BitBtn2Click(Sender: TObject);
begin
  if DmPedido.QPedidoItem_CancQt_Pedido.Value < (DmPedido.QPedidoItem_CancQt_Atendido.Value+DmPedido.QPedidoItem_CancQt_Cancelado.Value+StrToFloat(MEQuantidade.Text)) Then
     raise Exception.Create('Quantidade Inválida!');
  if Trim(MEMotivo.Text) = '' Then
     raise Exception.Create('Preencher Código Motivo!');
  if MEQuantidade.Text = '' Then
     raise Exception.Create('Preencher Quantidade!');

  Try
    DMoracle.DBCemapa.StartTransaction;
    with DmPedido do
    begin
      // altera a quantidade cancelada nos itens
      QPedidoItem_Canc.edit;
      QpedidoItem_CancQt_Cancelado.Value := QPedidoItem_CancQt_Cancelado.Value + StrToFloat(MEQuantidade.Text);
      QPedidoItem_Canc.Post;
      // incluir um registro nos lançamentos cancelados dos pedidos
      QPedido_Cancelado.Open;
      QPedido_Cancelado.Insert;
      QPedido_CanceladoCod_Pedido_Item.Value := QPedidoItem_CancCod_Pedido_Item.Value;
      QPedido_CanceladoDt_Cancelamento.Value := DMOracle.DataServ;
      QPedido_CanceladoQt_Cancelado.Value := StrToFloat(MEQuantidade.Text);
      QPedido_CanceladoCod_Usuario.Value := DmUsuario.CodUsuarioCorrente;
      QPedido_CanceladoCod_Motivo.Value := StrToInt(Trim(MEMotivo.Text));
      QPedido_Cancelado.Post;
      MEQuantidade.Clear;
    end;

    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
    DMPedido.QPedidoItem_Canc.Close;
    DMPedido.QPedidoItem_Canc.Open;
//    DMPedido.QPedido_Cancelado.Refresh;
//    DMPedido.QpedidoItem_Canc.Refresh;
    Raise Exception.Create('Erro ao Lançar este Movimento!');
  end;

end;

procedure TFPedidoCancela.FormActivate(Sender: TObject);
begin
  With DMPedido do
  begin
    QPedidoItem_Canc.Close;
    QPedidoItem_Canc.SetVariable('PK',QPedidoItemCod_Pedido_Cab.Value);
    QPedidoItem_Canc.Open;
    QPedido_Cancelado.Close;
    QPedido_Cancelado.SetVariable('PK',QPedidoItem_CancCod_Pedido_Item.Value);
    QPedido_Cancelado.Open;
  end;
end;

procedure TFPedidoCancela.BtConsMotivoClick(Sender: TObject);
begin
  If FMotivoCons = Nil then
    FMotivoCons := TFMotivoCons.Create(Application);
  If FMotivoCons.ShowModal = mrOk then
  Begin
    MEMotivo.Text := DMMotivo.QMotivoConsCod_Motivo.Text;
    MEMotivoExit(Self);
  End;

end;

procedure TFPedidoCancela.MEMotivoExit(Sender: TObject);
begin
  If Trim(MEMotivo.Text) <> '' Then
    EdMotivo.Text := DMOracle.BuscaNome('SELECT DESC_MOTIVO FROM TB_MOTIVO','COD_MOTIVO = '+MEMotivo.Text);
end;

procedure TFPedidoCancela.BitBtn1Click(Sender: TObject);
begin
  Try
    DMoracle.DBCemapa.StartTransaction;

    With DmPedido do
    begin
      // altera a quantidade cancelada nos itens
      QPedidoItem_Canc.edit;
      QpedidoItem_CancQt_Cancelado.Value := QPedidoItem_CancQt_Cancelado.Value - QPedido_CanceladoQt_Cancelado.Value;
      QPedidoItem_Canc.Post;
      // incluir um registro nos lançamentos cancelados dos pedidos
//      QPedido_Cancelado.Open;
      QPedido_Cancelado.Delete;
//      QPedido_Cancelado.Post;
    end;

    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
    Raise Exception.Create('Erro ao Excluir este Movimento!');
  end;

end;

procedure TFPedidoCancela.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMPedido.QpedidoItem.Close;
   DMPedido.QpedidoItem.Open;
end;

end.
