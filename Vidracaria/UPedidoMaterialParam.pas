unit UPedidoMaterialParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, UFmProduto, DB, ImgList;

type
  TFPedidoMaterialParam = class(TForm)
    FmProduto1: TFmProduto;
    DsPedidoMaterialParam: TDataSource;
    ImageList1: TImageList;
    BitBtn1: TBitBtn;
    GbPedidos: TGroupBox;
    DbGPedidos: TDBGrid;
    procedure FmProduto1MeProdutoExit(Sender: TObject);
    procedure DbGPedidosCellClick(Column: TColumn);
    procedure FmProduto1BtProdutoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DbGPedidosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure Atualizar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPedidoMaterialParam: TFPedidoMaterialParam;

implementation

uses UVidracaria_cl, UOracle_cl, URPedidoMaterial;

{$R *.dfm}

procedure TFPedidoMaterialParam.FmProduto1MeProdutoExit(Sender: TObject);
begin
  FmProduto1.MeProdutoExit(Sender);

  Atualizar;
end;

procedure TFPedidoMaterialParam.Atualizar;
begin
  if Trim(FmProduto1.MeProduto.Text) <> '' then
  begin
    DmVidracaria.CdPedidoMaterialParam.Filtered := False;
    DmVidracaria.CdPedidoMaterialParam.Close;
    DmVidracaria.CdPedidoMaterialParam.Params.ParamByName('COD_PRODUTO').AsInteger := StrToInt(Trim(FmProduto1.MeProduto.Text));
    DmVidracaria.CdPedidoMaterialParam.Open;
  end;
end;

procedure TFPedidoMaterialParam.DbGPedidosCellClick(Column: TColumn);
begin
  if Column.FieldName = 'IND_SELECIONADO' then
  begin
    DmVidracaria.CdPedidoMaterialParam.Edit;
    if DmVidracaria.CdPedidoMaterialParamIND_SELECIONADO.Value = 'N' then
      DmVidracaria.CdPedidoMaterialParamIND_SELECIONADO.Value := 'S'
    else
      DmVidracaria.CdPedidoMaterialParamIND_SELECIONADO.Value := 'N';
    DmVidracaria.CdPedidoMaterialParam.Post;
  end;
end;

procedure TFPedidoMaterialParam.FmProduto1BtProdutoClick(Sender: TObject);
begin
  FmProduto1.BtProdutoClick(Sender);
  Atualizar;
end;

procedure TFPedidoMaterialParam.BitBtn1Click(Sender: TObject);
var wNotas: string;
begin
  DmVidracaria.CdPedidoMaterialParam.Filtered := True;

  wNotas := '';
  while not DmVidracaria.CdPedidoMaterialParam.Eof do
  begin
    wNotas := wNotas + DmVidracaria.CdPedidoMaterialParamCOD_PEDIDO_CAB.Text;
    if DmVidracaria.CdPedidoMaterialParam.RecNo <> DmVidracaria.CdPedidoMaterialParam.RecordCount then
      wNotas := wNotas + ', ';
    DmVidracaria.CdPedidoMaterialParam.Next;
  end;

  DmVidracaria.QRPedidoMaterial.Close;
  DmVidracaria.QRPedidoMaterial.SetVariable('PEDIDOS', wNotas);
  DmVidracaria.QRPedidoMaterial.Open;

  if FRPedidoMaterial = nil then
    FRPedidoMaterial := TFRPedidoMaterial.Create(Application);
  if DmVidracaria.QRPedidoMaterial.RecordCount >= 9 then
    FRPedidoMaterial.QRPrimario.Height := 1056
  else
    FRPedidoMaterial.QRPrimario.Height := 522;
  FRPedidoMaterial.QRPrimario.Preview;

  DmVidracaria.QRPedidoMaterial.Close;

  DmVidracaria.CdPedidoMaterialParam.Filtered := False;
end;

procedure TFPedidoMaterialParam.DbGPedidosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'IND_SELECIONADO' then
  begin
    DbGPedidos.Canvas.FillRect(Rect);
    if DmVidracaria.CdPedidoMaterialParamIND_SELECIONADO.Value = 'N' then
      ImageList1.Draw(DbGPedidos.Canvas, Rect.Left + 5, Rect.Top + 1, 1)
    else
      ImageList1.Draw(DbGPedidos.Canvas, Rect.Left + 5, Rect.Top + 1, 0);
  end;
end;

end.

