unit UEmbarquePedidosParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ImgList, UFmCadastro,
  Mask, UFmRegiao, ExtCtrls;

type
  TFEmbarquePedidosParam = class(TForm)
    DsEmbarquePedidosParam: TDataSource;
    ImageList1: TImageList;
    BtnImprimir: TBitBtn;
    GbPedidos: TGroupBox;
    DbGPedidos: TDBGrid;
    FmCadastro1: TFmCadastro;
    procedure DbGPedidosCellClick(Column: TColumn);
    procedure BtnImprimirClick(Sender: TObject);
    procedure DbGPedidosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FmCadastro1MeCadastroExit(Sender: TObject);
    procedure FmCadastro1BtCadastroClick(Sender: TObject);
  private
    procedure Atualizar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmbarquePedidosParam: TFEmbarquePedidosParam;

implementation

uses UEmbarque_cl, UOracle_cl, UVidracaria_cl, UREmbarquePedidos,
  UEmbarqueCons;

{$R *.dfm}

procedure TFEmbarquePedidosParam.Atualizar;
begin
  if Trim(FmCadastro1.MeCadastro.Text) <> '' then
  begin
    DmVidracaria.CdEmbarquePedidoParam.Filtered := False;
    DmVidracaria.CdEmbarquePedidoParam.Close;
    DmVidracaria.CdEmbarquePedidoParam.Params.ParamByName('COD_CADASTRO').AsInteger := StrToInt(Trim(FmCadastro1.MeCadastro.Text));
    DmVidracaria.CdEmbarquePedidoParam.Open;
  end;
end;

procedure TFEmbarquePedidosParam.DbGPedidosCellClick(Column: TColumn);
begin
  if Column.FieldName = 'IND_SELECIONADO' then
  begin
    DmVidracaria.CdEmbarquePedidoParam.Edit;
    if DmVidracaria.CdEmbarquePedidoParamIND_SELECIONADO.Value = 'N' then
      DmVidracaria.CdEmbarquePedidoParamIND_SELECIONADO.Value := 'S'
    else
      DmVidracaria.CdEmbarquePedidoParamIND_SELECIONADO.Value := 'N';
    DmVidracaria.CdEmbarquePedidoParam.Post;
  end;
end;

procedure TFEmbarquePedidosParam.BtnImprimirClick(Sender: TObject);
var wNotas: string;
begin
  DmVidracaria.CdEmbarquePedidoParam.Filtered := True;

  wNotas := '';
  while not DmVidracaria.CdEmbarquePedidoParam.Eof do
  begin
    wNotas := wNotas + DmVidracaria.CdEmbarquePedidoParamCOD_PEDIDO_CAB.Text;
    if DmVidracaria.CdEmbarquePedidoParam.RecNo <> DmVidracaria.CdEmbarquePedidoParam.RecordCount then
      wNotas := wNotas + ', ';
    DmVidracaria.CdEmbarquePedidoParam.Next;
  end;

  DmVidracaria.QREmbarquePedido.Close;
  DmVidracaria.QREmbarquePedido.SetVariable('PEDIDOS', wNotas);
  DmVidracaria.QREmbarquePedido.Open;

  if FREmbarquePedidos = nil then
    FREmbarquePedidos := TFREmbarquePedidos.Create(Application);
  FREmbarquePedidos.QRPrimario.Preview;

  DmVidracaria.QREmbarquePedido.Close;

  DmVidracaria.CdEmbarquePedidoParam.Filtered := False;
end;

procedure TFEmbarquePedidosParam.DbGPedidosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'IND_SELECIONADO' then
  begin
    DbGPedidos.Canvas.FillRect(Rect);
    if DmVidracaria.CdEmbarquePedidoParamIND_SELECIONADO.Value = 'N' then
      ImageList1.Draw(DbGPedidos.Canvas, Rect.Left + 5, Rect.Top + 1, 1)
    else
      ImageList1.Draw(DbGPedidos.Canvas, Rect.Left + 5, Rect.Top + 1, 0);
  end;
end;

procedure TFEmbarquePedidosParam.FmCadastro1MeCadastroExit(
  Sender: TObject);
begin
  FmCadastro1.MeCadastroExit(Sender);
  Atualizar;
end;

procedure TFEmbarquePedidosParam.FmCadastro1BtCadastroClick(
  Sender: TObject);
begin
  FmCadastro1.BtCadastroClick(Sender);
  Atualizar;
end;

end.

