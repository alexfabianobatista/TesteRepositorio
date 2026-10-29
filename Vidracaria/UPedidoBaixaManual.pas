unit UPedidoBaixaManual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFmPedido, UFmCadastro, Grids, DBGrids, StdCtrls, DB, ImgList,
  Buttons;

type
  TFPedidoBaixaManual = class(TForm)
    FmPedido: TFmPedido;
    FmCadastro: TFmCadastro;
    GbPedidos: TGroupBox;
    DbGPedidos: TDBGrid;
    DsBaixa: TDataSource;
    ImageList1: TImageList;
    BtnBaixar: TBitBtn;
    BtnConsultar: TBitBtn;
    procedure DbGPedidosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DbGPedidosCellClick(Column: TColumn);
    procedure FmPedido1BtPedidoClick(Sender: TObject);
    procedure FmCadastro1MeCadastroExit(Sender: TObject);
    procedure FmCadastro1BtCadastroClick(Sender: TObject);
    procedure BtnBaixarClick(Sender: TObject);
    procedure FmPedido1MePedidoExit(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
  private
    procedure Carregar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPedidoBaixaManual: TFPedidoBaixaManual;

implementation

uses UPedido_cl, UOracle_cl;

{$R *.dfm}

procedure TFPedidoBaixaManual.DbGPedidosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'IND_BAIXADO' then
  begin
    DbGPedidos.Canvas.FillRect(Rect);
    if DMPedido.CdPedidoBaixaManualIND_BAIXADO.Value = 'N' then
      ImageList1.Draw(DbGPedidos.Canvas, Rect.Left + 5, Rect.Top + 1, 1)
    else
      ImageList1.Draw(DbGPedidos.Canvas, Rect.Left + 5, Rect.Top + 1, 0);
  end;
end;

procedure TFPedidoBaixaManual.DbGPedidosCellClick(Column: TColumn);
begin
  if Column.FieldName = 'IND_BAIXADO' then
  begin
    DMPedido.CdPedidoBaixaManual.Edit;
    if DMPedido.CdPedidoBaixaManualIND_BAIXADO.Value = 'S' then
      DMPedido.CdPedidoBaixaManualIND_BAIXADO.Value := 'N'
    else
      DMPedido.CdPedidoBaixaManualIND_BAIXADO.Value := 'S';
    DMPedido.CdPedidoBaixaManual.Post;
  end;
end;

procedure TFPedidoBaixaManual.Carregar;
begin
  DMPedido.CdPedidoBaixaManual.Filtered := False;

  DMPedido.CdPedidoBaixaManual.Close;

  if Trim(FmCadastro.MeCadastro.Text) = '' then
    DMPedido.CdPedidoBaixaManual.Params.ParamByName('COD_CADASTRO').Clear
  else
    DMPedido.CdPedidoBaixaManual.Params.ParamByName('COD_CADASTRO').AsInteger := StrToInt(Trim(FmCadastro.MeCadastro.Text));

  if Trim(FmPedido.MePedido.Text) = '' then
    DMPedido.CdPedidoBaixaManual.Params.ParamByName('COD_PEDIDO_CAB').Clear
  else
    DMPedido.CdPedidoBaixaManual.Params.ParamByName('COD_PEDIDO_CAB').AsInteger := StrToInt(Trim(FmPedido.MePedido.Text));

  DMPedido.CdPedidoBaixaManual.Params.ParamByName('COD_PRODUTO').Clear;

  DMPedido.CdPedidoBaixaManual.Open;
end;

procedure TFPedidoBaixaManual.FmPedido1BtPedidoClick(Sender: TObject);
begin
  FmPedido.BtPedidoClick(Sender);
  if Trim(FmPedido.MePedido.Text) <> '' then
    Carregar;
end;

procedure TFPedidoBaixaManual.FmCadastro1MeCadastroExit(Sender: TObject);
begin
  FmCadastro.MeCadastroExit(Sender);

end;

procedure TFPedidoBaixaManual.FmCadastro1BtCadastroClick(Sender: TObject);
begin
  FmCadastro.BtCadastroClick(Sender);
  if Trim(FmCadastro.MeCadastro.Text) <> '' then
    Carregar;
end;

procedure TFPedidoBaixaManual.BtnBaixarClick(Sender: TObject);
begin
  if (MessageDlg('Confirma a baixa destes pedidos?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  DsBaixa.Enabled := False;

  DMPedido.CdPedidoBaixaManual.Filtered := True;
  DMPedido.CdPedidoBaixaManual.First;
  try
    while not DMPedido.CdPedidoBaixaManual.Eof do
    begin
      DMOracle.ExecutaSql('UPDATE TB_PEDIDO_CAB SET DT_BAIXA_VIDRACARIA = CAST(' + QuotedStr(FormatDateTime('dd/MM/yyyy hh:mm:ss', DMOracle.DataHoraServ)) + ' AS TIMESTAMP) WHERE COD_PEDIDO_CAB = ' + DMPedido.CdPedidoBaixaManualCOD_PEDIDO_CAB.Text, False);

      DMPedido.CdPedidoBaixaManual.Next;
    end;
  except
    MessageDlg('Erro no processamento das baixas.' + #13 + #10 + 'Pedido: ' + DMPedido.CdPedidoBaixaManualCOD_PEDIDO_CAB.Text + '.', mtError, [mbOK], 0);
    DMOracle.DBCemapa.Rollback;
    DMPedido.CdPedidoBaixaManual.Filtered := False;
    DsBaixa.Enabled := True;
    Exit;
  end;
  DsBaixa.Enabled := True;

  DMOracle.DBCemapa.Commit;

  Carregar;
end;

procedure TFPedidoBaixaManual.FmPedido1MePedidoExit(Sender: TObject);
begin
  FmPedido.MePedidoExit(Sender);

end;

procedure TFPedidoBaixaManual.BtnConsultarClick(Sender: TObject);
begin
  Carregar;
end;

end.
