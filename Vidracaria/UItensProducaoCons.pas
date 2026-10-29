unit UItensProducaoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, ColorGrd, dbcgrids, ImgList, DB,
  Buttons;

type
  TFItensProducaoCons = class(TForm)
    MePedidoCons: TMaskEdit;
    Pedido: TLabel;
    DBGrid8: TDBGrid;
    BitBtn1: TBitBtn;
    LbCliente: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    LbProduto: TLabel;
    SBPedidoCons: TSpeedButton;
    DsAcompanhamento: TDataSource;
    ImageList1: TImageList;
    SBControle: TSpeedButton;
    procedure DBGrid8DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure MePedidoConsExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SBPedidoConsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FItensProducaoCons: TFItensProducaoCons;

implementation

uses UPedido_cl, UOracle_cl, OracleData, UPedidoCons, UVidracaria_cl,
  UParamSistema_cl;

{$R *.dfm}

procedure TFItensProducaoCons.DBGrid8DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'DESC_QUEBRAS' then
  begin
    if DmVidracaria.QAcompanhamentoIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Font.Color := clRed;
    //      ImageList1.Draw(DBGrid8.Canvas, Rect.Left + 5, Rect.Top + 1, 0);
    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  if (Column.Field.FieldName = 'IND_EMBARQUE') then
  begin
    if DmVidracaria.QAcompanhamentoIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Brush.Color := clRed
    else if DMVidracaria.QAcompanhamentoIND_EMBARQUE.Value = 'N' then
      DBGrid8.Canvas.Brush.Color := clYellow
    else
      DBGrid8.Canvas.Brush.Color := clGreen;

    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  if (Column.Field.FieldName = 'IND_FORNO') then
  begin
    if DmVidracaria.QAcompanhamentoIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Brush.Color := clRed
    else if DmVidracaria.QAcompanhamentoDESC_SERVICO.Value = 'SEM TEMPERA' then
      DBGrid8.Canvas.Brush.Color := clBlue
    else if DMVidracaria.QAcompanhamentoIND_FORNO.Value = 'N' then
      DBGrid8.Canvas.Brush.Color := clYellow
    else
      DBGrid8.Canvas.Brush.Color := clGreen;

    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  if (Column.Field.FieldName = 'IND_CALCULO') then
  begin
    if DmVidracaria.QAcompanhamentoIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Brush.Color := clRed
    else if DMVidracaria.QAcompanhamentoIND_CALCULO.Value = 'N' then
      DBGrid8.Canvas.Brush.Color := clYellow
    else
      DBGrid8.Canvas.Brush.Color := clGreen;
                                                     
    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  if (Column.Field.FieldName = 'IND_CORTE') then
  begin
    if DmVidracaria.QAcompanhamentoIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Brush.Color := clRed
    else if DMVidracaria.QAcompanhamentoIND_CORTE.Value = 'N' then
      DBGrid8.Canvas.Brush.Color := clYellow
    else
      DBGrid8.Canvas.Brush.Color := clGreen;

    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  if (Column.Field.FieldName = 'IND_USINAGEM') then
  begin
    if DmVidracaria.QAcompanhamentoIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Brush.Color := clRed
    else if DMVidracaria.QAcompanhamentoIND_USINAGEM.Value = 'N' then
      DBGrid8.Canvas.Brush.Color := clYellow
    else
      DBGrid8.Canvas.Brush.Color := clGreen;

    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  if (Column.Field.FieldName = 'IND_MARCACAO') then
  begin
    if DmVidracaria.QAcompanhamentoIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Brush.Color := clRed
    else if DMVidracaria.QAcompanhamentoIND_MARCACAO.Value = 'N' then
      DBGrid8.Canvas.Brush.Color := clYellow
    else
      DBGrid8.Canvas.Brush.Color := clGreen;

    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  if (Column.Field.FieldName = 'IND_CONFERENCIA') then
  begin
    if DmVidracaria.QAcompanhamentoIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Brush.Color := clRed
    else if DMVidracaria.QAcompanhamentoIND_CONFERENCIA.Value = 'N' then
      DBGrid8.Canvas.Brush.Color := clYellow
    else
      DBGrid8.Canvas.Brush.Color := clGreen;

    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  if (Column.Field.FieldName = 'IND_LAVACAO') then
  begin
    if DmVidracaria.QAcompanhamentoIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Brush.Color := clRed
    else if DMVidracaria.QAcompanhamentoIND_LAVACAO.Value = 'N' then
      DBGrid8.Canvas.Brush.Color := clYellow
    else
      DBGrid8.Canvas.Brush.Color := clGreen;

    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
    if (Column.Field.FieldName = 'IND_LAPIDACAO') then
  begin
    if DmVidracaria.QAcompanhamentoIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Brush.Color := clRed
    else if DMVidracaria.QAcompanhamentoIND_LAPIDACAO.Value = 'N' then
      DBGrid8.Canvas.Brush.Color := clYellow
    else
      DBGrid8.Canvas.Brush.Color := clGreen;

    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  if (Column.Field.FieldName = 'IND_FURACAO') then
  begin
    if DmVidracaria.QAcompanhamentoIND_QUEBRA.Value = 'S' then
      DBGrid8.Canvas.Brush.Color := clRed
    else if DMVidracaria.QAcompanhamentoIND_FURACAO.Value = 'N' then
      DBGrid8.Canvas.Brush.Color := clYellow
    else
      DBGrid8.Canvas.Brush.Color := clGreen;

    DBGrid8.Canvas.FillRect(Rect);
    DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFItensProducaoCons.MePedidoConsExit(Sender: TObject);
var
  wAux, wAux1, wAux2, wDataBaixa: string;
begin
  if Trim(MePedidoCons.Text) <> '' then
  begin
    DMVidracaria.QAcompanhamento.Close;
    DMVidracaria.QAcompanhamento.SetVariable('COD_PEDIDO_CAB',
      MePedidoCons.Text);
    DMVidracaria.QAcompanhamento.Open;

    if DMVidracaria.QAcompanhamento.IsEmpty then
    begin
      MessageDlg('Pedido inexistente.', mtError, [mbOK], 0);
      MePedidoCons.SetFocus;
      Exit;
    end;

    DMVidracaria.QAcompanhamento.First;

    wAux := DmOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_PEDIDO_CAB',
      'COD_PEDIDO_CAB=' + Trim(MePedidoCons.Text));
    wAux1 := DMOracle.BuscaNome('SELECT COD_PEDIDO_ITEM FROM TB_PEDIDO_ITEM',
      'COD_PEDIDO_CAB=' + Trim(MePedidoCons.Text));
    wAux2 := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PEDIDO_ITEM',
      'COD_PEDIDO_ITEM=' + wAux1);
    LbCliente.Caption := wAux + ' ' +
      DmOracle.BuscaNome('SELECT DESC_FANTASIA FROM TB_CADASTRO', 'COD_CADASTRO='
      + wAux);
    LbProduto.Caption := wAux2 + ' ' +
      DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO=' +
      wAux2);

    wDataBaixa := DMOracle.BuscaNome('SELECT DECODE(DT_BAIXA_VIDRACARIA, NULL, '
      + QuotedStr('') + ', TO_CHAR(DT_BAIXA_VIDRACARIA, ' +
      QuotedStr('dd/mm/yyyy hh:mi:ss') + ')) FROM TB_PEDIDO_CAB',
      'COD_PEDIDO_CAB = ' + MePedidoCons.Text);
    if wDataBaixa <> '' then
      MessageDlg('Este pedido já foi baixado em: ' + wDataBaixa + '.',
        mtInformation, [mbOK], 0);
  end;
end;

procedure TFItensProducaoCons.BitBtn1Click(Sender: TObject);
begin
  MePedidoConsExit(Self);
end;

procedure TFItensProducaoCons.SBPedidoConsClick(Sender: TObject);
begin
  if FPedidoCons = nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  if FPedidoCons.ShowModal = mrOk then
    with DMPedido do
    begin
      MePedidoCons.Text := DMPedido.QPedidoConsCOD_PEDIDO_CAB.Text;
      MePedidoConsExit(Self);
    end;

end;

procedure TFItensProducaoCons.FormCreate(Sender: TObject);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'VETRO' then
  Begin
    SBControle.Enabled := True;
    SBControle.Visible := True;
  end;
end;

end.

