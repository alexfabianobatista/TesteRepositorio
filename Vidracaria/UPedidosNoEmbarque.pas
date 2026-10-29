unit UPedidosNoEmbarque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, Buttons, Grids, DBGrids, UFmCadastro;

type
  TFPedidosNoEmbarque = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    ImageList1: TImageList;
    FmCadastro1: TFmCadastro;
    procedure FmCadastro1MeCadastroExit(Sender: TObject);
    procedure FmCadastro1BtCadastroClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPedidosNoEmbarque: TFPedidosNoEmbarque;

implementation

uses UEmbarque_cl, UPedido_cl, UOracle_cl, URPedidosNoEmbarque;

{$R *.dfm}

procedure TFPedidosNoEmbarque.FmCadastro1MeCadastroExit(Sender: TObject);
begin
  FmCadastro1.MeCadastroExit(Sender);
  IF Trim(FmCadastro1.MeCadastro.Text) <> '' then
  Begin
    with DMPedido do
    Begin
      QPedidoCons.Close;
      QPedidoCons.SetVariable('CADASTRO',FMCadastro1.MeCadastro.Text);
      QPedidoCons.SetVariable('NUM_PEDIDO',Null);
      QPedidoCons.SetVariable('FILIAL',Null);
      QPedidoCons.SetVariable('COD_DEPARTAMENTO',Null);
      QPedidoCons.SetVariable('IND_SITUACAO','1');
//      QPedidoCons.SetVariable('SUBSTITUICAO','TB_PEDIDO_CAB.COD_PEDIDO_CAB IN (SELECT COD_PEDIDO_CAB FROM TB_PEDIDO_ITEM WHERE (QT_PEDIDO - QT_ATENDIDO - QT_CANCELADO) <> 0 AND TB_PEDIDO_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB)');
      QPedidoCons.SetVariable('SUBSTITUICAO','TB_PEDIDO_CAB.DT_BAIXA_VIDRACARIA IS NULL');
      QPedidoCons.SetVariable('DATA_I','01/01/1900');
      QPedidoCons.Open;
    end;
  end;  
end;

procedure TFPedidosNoEmbarque.FmCadastro1BtCadastroClick(Sender: TObject);
begin
  FmCadastro1.BtCadastroClick(Sender);
    FmCadastro1.MeCadastro.SetFocus;
end;

procedure TFPedidosNoEmbarque.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Column.Title.Caption = 'X') then
  begin
    DBGrid1.Canvas.FillRect(Rect);
    if DMPedido.QPedidoConsNUM_PALM.Value = 0 then
      ImageList1.Draw(DBGrid1.Canvas, Rect.Left + 5, Rect.Top + 1, 1)
    else
      ImageList1.Draw(DBGrid1.Canvas, Rect.Left + 5, Rect.Top + 1, 0);
  end;
end;

procedure TFPedidosNoEmbarque.DBGrid1CellClick(Column: TColumn);
var wRecNo: Integer;
begin
  if Column.Title.Caption = 'X' then
  Begin 
    wRecNo := DMPedido.QPedidoCons.RecNo;
    if ((DMPedido.QPedidoConsNUM_PALM.Text = '') OR (DMPedido.QPedidoConsNUM_PALM.Value = 0)) then
    Begin
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_CAB SET NUM_PALM = 1 WHERE COD_PEDIDO_CAB='+ DMPedido.QPedidoConsCOD_PEDIDO_CAB.Text);
      DMOracle.QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
      DBGrid1.SelectedIndex := DBGrid1.SelectedIndex + 1;
    end
    else
    Begin
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_CAB SET NUM_PALM = 0 WHERE COD_PEDIDO_CAB='+ DMPedido.QPedidoConsCOD_PEDIDO_CAB.Text);
      DMOracle.QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
      DBGrid1.SelectedIndex := DBGrid1.SelectedIndex + 1;
    end;
   
    DMPedido.QPedidoCons.Close;
    DMPedido.QPedidoCons.SetVariable('CADASTRO',FMCadastro1.MeCadastro.Text);
    DMPedido.QPedidoCons.SetVariable('NUM_PEDIDO',Null);
    DMPedido.QPedidoCons.SetVariable('FILIAL',Null);
    DMPedido.QPedidoCons.SetVariable('COD_DEPARTAMENTO',Null);
    DMPedido.QPedidoCons.SetVariable('IND_SITUACAO','1');
//    DMPedido.QPedidoCons.SetVariable('SUBSTITUICAO','TB_PEDIDO_CAB.COD_PEDIDO_CAB IN (SELECT COD_PEDIDO_CAB FROM TB_PEDIDO_ITEM WHERE (QT_PEDIDO - QT_ATENDIDO - QT_CANCELADO) <> 0 AND TB_PEDIDO_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB)');
    DMPedido.QPedidoCons.SetVariable('SUBSTITUICAO','TB_PEDIDO_CAB.DT_BAIXA_VIDRACARIA IS NULL');
    DMPedido.QPedidoCons.SetVariable('DATA_I','01/01/1900');
    DMPedido.QPedidoCons.Open;
    DMPedido.QPedidoCons.RecNo := wRecNo;
  end;
end;

procedure TFPedidosNoEmbarque.BitBtn2Click(Sender: TObject);
begin
  DMEmbarque.QPedidosNoEmbarque.Close;
  DMEmbarque.QPedidosNoEmbarque.SetVariable('COD_CADASTRO',StrToInt(Trim(FmCadastro1.MeCadastro.Text)));
  DMEmbarque.QPedidosNoEmbarque.SetVariable('NUM_PALM',1);
  DMEmbarque.QPedidosNoEmbarque.Open;
  if FRPedidosNoEmbarque = Nil then
    FRPedidosNoEmbarque := TFRPedidosNoEmbarque.Create(Application);
  FRPedidosNoEmbarque.QRPrimario.Preview;
  DMPedido.QPedidoCons.First;
  while not DMPedido.QPedidoCons.Eof do
  Begin
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_CAB SET NUM_PALM = 0 WHERE COD_PEDIDO_CAB ='+DMPedido.QPedidoConsCOD_PEDIDO_CAB.Text);
    DMOracle.QExecSQL.ExecSQL;
    DMPedido.QPedidoCons.Next;
  end;
  DMOracle.DBCemapa.Commit;
end;

procedure TFPedidosNoEmbarque.FormActivate(Sender: TObject);
begin
  DMPedido.QPedidoCons.Close;
end;

end.
