unit UMarcarPecas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, UFmPedido, DB, ImgList, StdCtrls, Buttons;

type
  TFMarcarPecas = class(TForm)
    FmPedido1: TFmPedido;
    DBGItens: TDBGrid;
    dsItens: TDataSource;
    ImageList1: TImageList;
    BtCancelar: TBitBtn;
    BtConfirmar: TBitBtn;
    procedure FmPedido1MePedidoExit(Sender: TObject);
    procedure DBGItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGItensCellClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure FmPedido1BtPedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMarcarPecas: TFMarcarPecas;

implementation

uses UVidracaria_cl, UBiblioteca;

{$R *.dfm}

procedure TFMarcarPecas.FmPedido1MePedidoExit(Sender: TObject);
begin
  FmPedido1.MePedidoExit(Sender);
  DmVidracaria.CdsDesenhoExportacao.Close;
  if Trim(FmPedido1.MePedido.Text) <> '' then
    DmVidracaria.CdsDesenhoExportacao.Params.ParamByName('COD_PEDIDO_CAB').AsInteger := StrToInt(Trim(FmPedido1.MePedido.Text))
  else
    DmVidracaria.CdsDesenhoExportacao.Params.ParamByName('COD_PEDIDO_CAB').AsInteger := -1;
  DmVidracaria.CdsDesenhoExportacao.Open;
end;

procedure TFMarcarPecas.DBGItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'COD_DESENHO_EXPORTACAO' then
  begin
    DBGItens.Canvas.FillRect(Rect);
    if DmVidracaria.CdsDesenhoExportacaoCOD_DESENHO_EXPORTACAO.Value = '' then
      ImageList1.Draw(DBGItens.Canvas, Rect.Left + 5, Rect.Top + 1, 3)
    else
      ImageList1.Draw(DBGItens.Canvas, Rect.Left + 5, Rect.Top + 1, 2);
  end;
end;

procedure TFMarcarPecas.DBGItensCellClick(Column: TColumn);
begin
  if (Column.FieldName = 'COD_DESENHO_EXPORTACAO') and (DmVidracaria.cdsDesenhoExportacao.RecordCount > 0) then
  begin
    with DmVidracaria do
    begin
      CdsDesenhoExportacao.Edit;
      if CdsDesenhoExportacaoCOD_DESENHO_EXPORTACAO.Value = '' then
        CdsDesenhoExportacaoCOD_DESENHO_EXPORTACAO.Value := CdsDesenhoExportacaoCOD_PEDIDO_CAB.AsString + cdsDesenhoExportacaoSEQ.AsString
      else
        CdsDesenhoExportacaoCOD_DESENHO_EXPORTACAO.Value := '';
      CdsDesenhoExportacao.Post;
    end;
  end;
end;

procedure TFMarcarPecas.FormActivate(Sender: TObject);
begin
  FmPedido1.MePedido.Text := '';
  FmPedido1MePedidoExit(sender);
end;

procedure TFMarcarPecas.FmPedido1BtPedidoClick(Sender: TObject);
begin
  FmPedido1.BtPedidoClick(Sender);

end;

end.
