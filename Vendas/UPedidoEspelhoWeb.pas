unit UPedidoEspelhoWeb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DBCtrls, Grids, DBGrids,
  DB, ImgList, UFmVendedor, UFmCadastro, UFmDatas;

type
  TFPedidoEspelhoWeb = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    DBGEspelhoPedido: TDBGrid;
    DSPedidoEspelhoWeb: TDataSource;
    ImageList1: TImageList;
    BitBtn2: TBitBtn;
    FmCadastro1: TFmCadastro;
    FmVendedor1: TFmVendedor;
    FmDatas1: TFmDatas;
    RGImpressao: TRadioGroup;
    RGMarcarTodos: TRadioGroup;
    RgSituacao: TRadioGroup;
    procedure DBGEspelhoPedidoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGEspelhoPedidoCellClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RGMarcarTodosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPedidoEspelhoWeb: TFPedidoEspelhoWeb;

implementation

uses UPedido_cl, URPedido_Espelho, UOracle_cl;

{$R *.dfm}

procedure TFPedidoEspelhoWeb.DBGEspelhoPedidoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'IND_SELECIONADO' then
  begin
    DbGEspelhoPedido.Canvas.FillRect(Rect);
    if DmPedido.CdPedidoEspelhoWebIND_SELECIONADO.Value = 'N' then
      ImageList1.Draw(DbGEspelhoPedido.Canvas, Rect.Left + 5, Rect.Top + 1, 1)
    else
      ImageList1.Draw(DbGEspelhoPedido.Canvas, Rect.Left + 5, Rect.Top + 1, 0);
  end;
end;

procedure TFPedidoEspelhoWeb.BitBtn1Click(Sender: TObject);
begin
  DMPedido.CDPedidoEspelhoWeb.Filtered := False;
  DMPedido.CDPedidoEspelhoWeb.Close;
  if RGImpressao.ItemIndex = 1 then
    DMPedido.CDPedidoEspelhoWeb.Params.ParamByName('IND_IMPRESSO').AsInteger := 1
  else
    DMPedido.CDPedidoEspelhoWeb.Params.ParamByName('IND_IMPRESSO').AsInteger := 2;
  if Trim(FmCadastro1.MeCadastro.Text) <> '' then
    DMPedido.CDPedidoEspelhoWeb.Params.ParamByName('COD_CADASTRO').AsInteger:= StrtoInt(Trim(FmCadastro1.MeCadastro.Text))
  else
    DMPedido.CDPedidoEspelhoWeb.Params.ParamByName('COD_CADASTRO').Clear;
  if Trim(FmVendedor1.MeVendedor.Text) <> '' then
    DMPedido.CDPedidoEspelhoWeb.Params.ParamByName('COD_VENDEDOR').AsInteger := StrToInt(Trim(FmVendedor1.MeVendedor.Text))
  else
    DMPedido.CDPedidoEspelhoWeb.Params.ParamByName('COD_VENDEDOR').Clear;
  DMPedido.CDPedidoEspelhoWeb.Params.ParamByName('DT_EMISSAO_I').AsDate := StrToDate(FmDatas1.MeDtInicial.Text);
  DMPedido.CDPedidoEspelhoWeb.Params.ParamByName('DT_EMISSAO_F').AsDate:= StrToDate(FmDatas1.MeDtFinal.Text);
  case RgSituacao.ItemIndex of
    0: DMPedido.CDPedidoEspelhoWeb.Params.ParamByName('IND_SITUACAO').AsInteger := 1;
    1: DMPedido.CDPedidoEspelhoWeb.Params.ParamByName('IND_SITUACAO').AsInteger := 3;
    2: DMPedido.CDPedidoEspelhoWeb.Params.ParamByName('IND_SITUACAO').AsInteger := 2;
    3: DMPedido.CDPedidoEspelhoWeb.Params.ParamByName('IND_SITUACAO').Clear;
  end;
  DMPedido.CDPedidoEspelhoWeb.Open;

end;

procedure TFPedidoEspelhoWeb.DBGEspelhoPedidoCellClick(Column: TColumn);
begin
  if Column.FieldName = 'IND_SELECIONADO' then
  begin
    DMPedido.CDPedidoEspelhoWeb.Edit;
    if DMPedido.CDPedidoEspelhoWebIND_SELECIONADO.Value = 'N' then
      DMPedido.CDPedidoEspelhoWebIND_SELECIONADO.Value := 'S'
    else
      DMPedido.CDPedidoEspelhoWebIND_SELECIONADO.Value := 'N';
    DMPedido.CDPedidoEspelhoWeb.Post;
  end;
end;

procedure TFPedidoEspelhoWeb.BitBtn2Click(Sender: TObject);
Var wLinhas, wLinhas1 : Integer;
begin
  while not DMPedido.CDPedidoEspelhoWeb.Eof do
  Begin
    if FRPedido_Espelho = Nil then
      FRPedido_Espelho := TFRPedido_Espelho.Create(Application);
    DMPedido.QPedido.Close;
    DMPedido.QPedido.SetVariable('PK',DMPedido.CDPedidoEspelhoWebCOD_PEDIDO_CAB.Text);
    DMPedido.QPedido.Open;
    DMPedido.QRPedido.Open;
    wLinhas := StrToInt(DMOracle.BuscaNome('SELECT count(*) FROM TB_PEDIDO_ITEM','COD_PEDIDO_CAB = '+DMPedido.QPedidoCod_Pedido_Cab.Text));
    wLinhas1 := StrToInt(DMOracle.BuscaNome('SELECT count(DESC_OBS_ITEM) FROM TB_PEDIDO_ITEM','COD_PEDIDO_CAB = '+DMPedido.QPedidoCod_Pedido_Cab.Text));
    wLinhas := wLinhas + wLinhas1;
    If wLinhas >= 9 Then
       FRPedido_Espelho.QRPrimario.Height := 1056
    Else
       FRPedido_Espelho.QRPrimario.Height := 522;

    FRPedido_Espelho.QRPrimario.Print;
    DMPedido.QRPedido.Close;
    DMPedido.CDPedidoEspelhoWeb.Next;
  end;
end;

procedure TFPedidoEspelhoWeb.FormActivate(Sender: TObject);
begin
  FmDatas1.MeDtInicial.Text := DateToStr(Date);
  FmDatas1.MeDtFinal.Text := DateToStr(Date);
end;

procedure TFPedidoEspelhoWeb.RGMarcarTodosClick(Sender: TObject);
begin
  if RGMarcarTodos.ItemIndex = 0 then
  Begin
    DMPedido.CDPedidoEspelhoWeb.First;
    while not DMPedido.CDPedidoEspelhoWeb.eof do
    Begin
      DMPedido.CDPedidoEspelhoWeb.Edit;
      DMPedido.CDPedidoEspelhoWebIND_SELECIONADO.Value := 'S';
      DMPedido.CDPedidoEspelhoWeb.Next;
    end;
  end
  else
  Begin
    DMPedido.CDPedidoEspelhoWeb.First;
    while not DMPedido.CDPedidoEspelhoWeb.eof do
    Begin
      DMPedido.CDPedidoEspelhoWeb.Edit;
      DMPedido.CDPedidoEspelhoWebIND_SELECIONADO.Value := 'N'; 
      DMPedido.CDPedidoEspelhoWeb.Next;
    end;
  end;  
end;

end.
