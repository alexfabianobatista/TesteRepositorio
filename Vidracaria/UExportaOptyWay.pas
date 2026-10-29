unit UExportaOptyWay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, UFmProduto, ImgList, StdCtrls, Buttons;

type
  TFExportaOptyWay = class(TForm)
    FmProduto1: TFmProduto;
    ImageList1: TImageList;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    SaveDialog1: TSaveDialog;
    BitBtn2: TBitBtn;
    procedure FmProduto1MeProdutoExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FmProduto1BtProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExportaOptyWay: TFExportaOptyWay;
  wAux : integer = 0;

implementation

uses UPedido_cl, UOracle_cl, UPedidoParam, UPedidoCad, UBiblioteca,
  URPedido_Espelho, DB;

{$R *.dfm}

function RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
var S : string;
    x : integer;
begin

  for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0','1','2','3','4','5','6','7','8','9'] then
       S := S + wCgc1[x];

  while Length(S) < Zeros do
      S := '0' + S;

  Result := S;
end;

procedure TFExportaOptyWay.FmProduto1MeProdutoExit(Sender: TObject);
begin
  FmProduto1.MeProdutoExit(Sender);

  If Trim(FmProduto1.MeProduto.Text) <> '' then
  Begin
    DMPedido.QExportaPedido.Close;
    DMPedido.QExportaPedido.SetVariable('PRODUTO',FmProduto1.MeProduto.Text);
    DMPedido.QExportaPedido.Open;
  end;
end;

procedure TFExportaOptyWay.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Column.FieldName = 'IND_REPOSICAO') then
  begin
    if DMPedido.QExportaPedido.FieldByName('IND_REPOSICAO').AsString = 'SIM' then
    begin
      DBGrid1.Canvas.Brush.Color:= clRed;  //"pinta" a celula inteira
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end
    //Else
    //begin
    //  DBGrid1.Canvas.Brush.Color:= clGreen;  //"pinta" a celula inteira
    //  DBGrid1.Canvas.FillRect(Rect);
    //  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    //end ;
  END;

  if (Column.Title.Caption = 'X') then
  begin
    DBGrid1.Canvas.FillRect(Rect);
    if DMPedido.QExportaPedidoIND_EXPORTADO.Value = 'N' then
      ImageList1.Draw(DBGrid1.Canvas, Rect.Left + 5, Rect.Top + 1, 3)
    else
      ImageList1.Draw(DBGrid1.Canvas, Rect.Left + 5, Rect.Top + 1, 2);
  end; 
end;

procedure TFExportaOptyWay.DBGrid1CellClick(Column: TColumn);
var wRecNo: Integer;
begin
  if Column.Title.Caption = 'X' then
  Begin 
    wRecNo := DMPedido.QExportaPedido.RecNo;

    DMPedido.QExportaOptyWay.Close;
    DMPedido.QExportaOptyWay.SetVariable('IND_EXPORTADO',NULL);
    DMPedido.QExportaOptyWay.SetVariable('COD_PEDIDO_CAB',DMPedido.QExportaPedidoCOD_PEDIDO_CAB.Text);
    DMPedido.QExportaOptyWay.SetVariable('PRODUTO',NULL);
    DMPedido.QExportaOptyWay.Open;
    DMPedido.QExportaOptyWay.First;
    while not DMPedido.QExportaOptyWay.Eof do
    Begin
      if DMPedido.QExportaPedidoIND_EXPORTADO.Value = 'N' then
      Begin
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('UPDATE TB_MATERIAL SET IND_EXPORTADO = ''E'' WHERE COD_PEDIDO_ITEM='+ DMPedido.QExportaOptyWayCOD_PEDIDO_ITEM.Text);
        DMOracle.QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;
        DBGrid1.SelectedIndex := DBGrid1.SelectedIndex + 1;
      end
      else
      if DMPedido.QExportaPedidoIND_EXPORTADO.Value = 'E' then
      Begin
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('UPDATE TB_MATERIAL SET IND_EXPORTADO = ''N'' WHERE COD_PEDIDO_ITEM='+ DMPedido.QExportaOptyWayCOD_PEDIDO_ITEM.Text);
        DMOracle.QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;  
        DBGrid1.SelectedIndex := DBGrid1.SelectedIndex + 1;
      end;
      DMPedido.QExportaOptyWay.Next;
    end;  
    DMPedido.QExportaPedido.Close;
    DMPedido.QExportaPedido.SetVariable('PRODUTO',FmProduto1.MeProduto.Text);
    DMPedido.QExportaPedido.Open;
    DMPedido.QExportaPedido.RecNo := wRecNo;
  end;
end;

procedure TFExportaOptyWay.BitBtn1Click(Sender: TObject);
var
   wAux, wSeq: String;
   F : TextFile;
   wNumPecas, wCont : integer;
   wContRegistro :Integer;
begin
  wNumPecas := 0;
  wCont := 0;
  wContRegistro := 0;

  with DMPedido do
  Begin
    QExportaOptyWay.Close;
    QExportaOptyWay.SetVariable('PRODUTO',FmProduto1.MeProduto.Text);
    QExportaOptyWay.SetVariable('IND_EXPORTADO','E');
    QExportaOptyWay.SetVariable('COD_PEDIDO_CAB',NULL);
    QExportaOptyWay.Open;
    QExportaOptyWay.First;
    while not QExportaOptyWay.Eof do
    Begin
      inc(wContRegistro);
      inc(wNumPecas);
      DMOracle.ExecutaSql('UPDATE TB_MATERIAL SET IND_EXPORTADO =''S'' WHERE COD_PEDIDO_ITEM='+QExportaOptyWayCOD_PEDIDO_ITEM.Text);

//      if QExportaOptyWayIND_REPOSICAO.Text = 'NAO' then
//      Begin
//        wSeq := DMOracle.BuscaNome('SELECT SQACOMPANHAMENTO_PEDIDO.NEXTVAL FROM DUAL','1=1');
//        DMOracle.QExecSQL.Close;
//        DMOracle.QExecSQL.SQL.Clear;
//        DMOracle.QExecSQL.SQL.Add('INSERT INTO TB_ACOMPANHAMENTO_PEDIDO(COD_ACOMPANHAMENTO_PEDIDO,COD_PEDIDO_CAB,COD_PEDIDO_ITEM)');
//        DMOracle.QExecSQL.SQL.Add(' VALUES('+ chr(39)+wSeq+chr(39)+','+QExportaOptyWayCOD_PEDIDO_CAB.Value+','+QExportaOptyWayCOD_PEDIDO_ITEM.Value+')');
//        DMOracle.QExecSQL.ExecSQL;
//        DMOracle.DBCemapa.Commit;
//      end;

     // if(wContRegistro = 100) then
    //  begin
     //   try
     //     wContRegistro := 0;
     //     DMOracle.DBCemapa.Connected := false;
     //     DMOracle.DBCemapa.Connected := true;
      //  Except
      //    Raise Exception.Create('Cursor não atualizado')
      //  end;
      //end;
      QExportaOptyWay.Next;
    end;
    //cabeçalho do arquivo de exportaçao 58 pos.
    wAux := copy('Pedido -' + DateToStr(Date) + '                                ',1,32);
    wAux :=wAux+Bib.LimpaString(DateToStr(date),'/')+'        '+RMaskCGC_CPF(IntToStr(wNumPecas),8)+'V3'+Chr(13)+Chr(10);
    //segunda linha 8 posiçoes numero de registros
    wAux := wAux + RMaskCGC_CPF(IntToStr(wNumPecas),8)+Chr(13)+Chr(10);
    //desc. peças 152 pos.

    QExportaOptyWay.First;
    while not QExportaOptyWay.Eof do
    begin
      inc(wCont);
      //descrição pos. 1 a 16
      wAux := wAux + copy(QExportaOptyWayDESC_COMPLEMENTO.Text+'                ',1,16);
      //num.sequencial peça pos.17 a 21
      wAux := wAux + RMaskCGC_CPF(intToStr(wCont),5);
      //cliente pos. 22 a 33
      wAux := wAux + copy(copy(QExportaOptyWayDESC_FANTASIA.Text,1,6)+Copy(QExportaOptyWayDESC_COMPLEMENTO_OBS.Text,1,6)+'            ',1,12);
      //num.pedido pos. 34 a 45
      wAux := wAux + RMaskCGC_CPF(QExportaOptyWayCOD_PEDIDO_CAB.Text,7)+'     ';
      //shape id pos. 46 a 53
      wAux := wAux + '        ';
      //amoladura pos. 54 a 61
      wAux := wAux + RMaskCGC_CPF(QExportaOptyWayVAL_AMOLADURA.Text,8);
      //prioridade da peça pos. 62 a 64
      wAux := wAux + '  0';
      //rotation flag pos. 65 a 65
      wAux := wAux + 'Y';
      //num.peças a corta pos. 66 a 73
      wAux := wAux + '       1';
      //tool thickiness pos. 74 a 81
      wAux := wAux + '  9999.0';
      //largura pos. 82 a 89
      wAux := wAux + RMaskCGC_CPF(QExportaOptyWayVAL_LARGURA.Text,8);
      //altura pos. 90 a 97
      wAux := wAux + RMaskCGC_CPF(QExportaOptyWayVAL_ALTURA.Text,8);
      //spacer pos. 98 a 105
      wAux := wAux + '     0,0';
      //observaçao pos. 106 a 137
      if QExportaOptyWayIND_TIPO.Text = 'F' then
        wAux := wAux + 'FIXO                            '
      Else
        wAux := wAux + 'MOVEL                           ';
      //num. de rotulos pos. 138 a 142
      wAux := wAux + '    1';
      //exceded pieces pos. 143 a 147
      wAux := wAux + '    0';
      //preference values pos. 148 a 152
      wAux := wAux + '  999';
      //rack pos. 153 a 158
      wAux := wAux + RMaskCGC_CPF(QExportaOptyWayCOD_PECA.Text,6)+Chr(13)+Chr(10);;
      QExportaOptyWay.Next;
    end;
  end;

  SaveDialog1.DefaultExt := 'ASCII';
  SaveDialog1.FileName := 'Exp.asc';
  SaveDialog1.Filter := 'Arquivo de Exportação';

  SaveDialog1.FilterIndex := 0;
  if FPedidoCad.SaveDialog1.Execute then
   begin
    AssignFile(F, FPedidoCad.SaveDialog1.FileName );
    Rewrite(F);
    Writeln(F, wAux);
    CloseFile(F);
    MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
    DMPedido.QExportaPedido.Close;
    DMPedido.QExportaPedido.SetVariable('PRODUTO',FmProduto1.MeProduto.Text);
    DMPedido.QExportaPedido.Open;
   End
  Else
    MessageDlg('Arquivo Não Gerado!', mtInformation,[mbOk], 0);
end;


procedure TFExportaOptyWay.BitBtn2Click(Sender: TObject);
Var
  wLinhas : Integer;
  wPedido :String;
begin
  DMPedido.QExportaOptyWay.Close;
  DMPedido.QExportaOptyWay.SetVariable('PRODUTO',FmProduto1.MeProduto.Text);
  DMPedido.QExportaOptyWay.SetVariable('IND_EXPORTADO','E');
  DMPedido.QExportaOptyWay.SetVariable('COD_PEDIDO_CAB',NULL);
  DMPedido.QExportaOptyWay.Open;
  DMPedido.QExportaOptyWay.First;
  while not DMPedido.QExportaOptyWay.Eof do
  Begin
    if wPedido <> DMPedido.QExportaOptyWayCOD_PEDIDO_CAB.Value then
    Begin
      DMPedido.QPedido.Close;
      DMPedido.QPedido.SetVariable('PK',DMPedido.QExportaOptyWayCOD_PEDIDO_CAB.Value);
      DMPedido.QPedido.Open;
      DMPedido.QRPedido.Open;

      if FRPedido_Espelho = Nil then
        FRPedido_Espelho := TFRPedido_Espelho.Create(Application);

      wLinhas := StrToInt(DMOracle.BuscaNome('SELECT count(*) FROM TB_PEDIDO_ITEM','COD_PEDIDO_CAB = '+DMPedido.QExportaOptyWayCOD_PEDIDO_CAB.Text));
      If wLinhas >= 9 Then
        FRPedido_Espelho.QRPrimario.Height := 1056
      Else
        FRPedido_Espelho.QRPrimario.Height := 522;

      FRPedido_Espelho.QRPrimario.Print;
      //FRPedido_Espelho.Close;
      wPedido := DMPedido.QExportaOptyWayCOD_PEDIDO_CAB.Value;
      DMPedido.QExportaOptyWay.Next;
    end
    else
      DMPedido.QExportaOptyWay.Next;
  end;
end;

procedure TFExportaOptyWay.FormActivate(Sender: TObject);
begin
  DMPedido.DSExportaPedido.DataSet.Close;
  DMPedido.DSExportaPedido.DataSet.Open;
end;

procedure TFExportaOptyWay.FmProduto1BtProdutoClick(Sender: TObject);
begin
  FmProduto1.BtProdutoClick(Sender);

end;

end.
