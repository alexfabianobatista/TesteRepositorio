unit UFConferenciaPedidoCodBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFmPedido, StdCtrls, Mask, Grids, DBGrids, DB, Buttons, ExtCtrls;

type
  TFConferenciaPedidoCodBarras = class(TForm)
    Label2: TLabel;
    MEProduto: TMaskEdit;
    EdProduto: TEdit;
    DBGPedido: TDBGrid;
    DsConferenciaNFCodBarras: TDataSource;
    BtCancelar: TBitBtn;
    RgPedidoAlterado: TRadioGroup;
    Label1: TLabel;
    MePedido: TMaskEdit;
    SBPedido: TSpeedButton;
    EdPedido: TEdit;
    SBProduto: TSpeedButton;
    procedure MEProdutoExit(Sender: TObject);
    procedure DBGPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SBPedidoClick(Sender: TObject);
    procedure MePedidoExit(Sender: TObject);
    procedure MePedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SBProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConferenciaPedidoCodBarras: TFConferenciaPedidoCodBarras;

implementation

uses UPedido_cl, UOracle_cl, UPedidoCons, UProduto_cl,UProdutoCons;

{$R *.dfm}

procedure TFConferenciaPedidoCodBarras.MEProdutoExit(Sender: TObject);
var
 wQuantidade, wCodProduto : integer;
 wCodProdutoConferido: double;
begin
  if (Trim(MEProduto.Text) <> '') and (Trim(MePedido.Text) <> '') then
  Begin
    With DMPedido do
    Begin
      // PRIMEIRO TENTA LOCALIZAR PELO CÓDIGO DE BARRAS
      QConferenciaPedidoCodBarras.Close;
      QConferenciaPedidoCodBarras.SetVariable('COD_PEDIDO_CAB',QPedidoConsCOD_PEDIDO_CAB.Value);
      QConferenciaPedidoCodBarras.SetVariable('DESC_COD_BARRA',Trim(MEProduto.Text));
      QConferenciaPedidoCodBarras.SetVariable('COD_PRODUTO',NULL);
      QConferenciaPedidoCodBarras.SetVariable('COD_PRODUTO_DESTAQUE', NULL);
      QConferenciaPedidoCodBarras.Open;
      // =========================================================
      // NÃO ENCONTROU -> TENTA PELO CÓDIGO DO PRODUTO
      // =========================================================
      if QConferenciaPedidoCodBarras.IsEmpty then
      begin
        QConferenciaPedidoCodBarras.Close;
        QConferenciaPedidoCodBarras.SetVariable('COD_PEDIDO_CAB',QPedidoConsCOD_PEDIDO_CAB.Value);
        QConferenciaPedidoCodBarras.SetVariable('DESC_COD_BARRA',NULL);
        QConferenciaPedidoCodBarras.SetVariable('COD_PRODUTO_DESTAQUE', NULL);
        if TryStrToInt(Trim(MEProduto.Text), wCodProduto) then
          QConferenciaPedidoCodBarras.SetVariable('COD_PRODUTO',wCodProduto)
        else
          QConferenciaPedidoCodBarras.SetVariable('COD_PRODUTO',NULL);
        QConferenciaPedidoCodBarras.Open;
      end;
      // =========================================================
      // NÃO ENCONTROU NADA
      // =========================================================
      if QConferenciaPedidoCodBarras.IsEmpty then
      begin
        // SOM DE ERRO
        MessageBeep(MB_ICONERROR);
        Application.MessageBox('PRODUTO NÃO ENCONTRADO OU QUANTIDADE JÁ ATENDIDA!','ERRO NA CONFERÊNCIA', MB_ICONERROR + MB_OK);
        QConferenciaPedidoCodBarras.Close;
        QConferenciaPedidoCodBarras.SetVariable('COD_PEDIDO_CAB',QPedidoConsCOD_PEDIDO_CAB.Value);
        QConferenciaPedidoCodBarras.SetVariable('DESC_COD_BARRA',NULL);
        QConferenciaPedidoCodBarras.SetVariable('COD_PRODUTO',NULL);
        QConferenciaPedidoCodBarras.SetVariable('COD_PRODUTO_DESTAQUE', NULL);
        QConferenciaPedidoCodBarras.Open;
        
        MEProduto.Clear;
        MEProduto.SetFocus;
        Exit;
      end;
      // =========================================================
      // PRODUTO ENCONTRADO
      // =========================================================
      if QConferenciaPedidoCodBarrasQT_PEDIDO.Value >
         QConferenciaPedidoCodBarrasQT_EMBARCADO.Value then
      Begin
        Try
          DMOracle.DBCemapa.StartTransaction;
          wCodProdutoConferido := QConferenciaPedidoCodBarrasCOD_PRODUTO.Value;
          wQuantidade := StrToInt(DMOracle.FastSelect('IND_QTD_ETIQUETAS','TB_PRODUTO','COD_PRODUTO = ' +
                             QConferenciaPedidoCodBarrasCOD_PRODUTO.Text));
          // 0 = Quantidade da Nota
          if (wQuantidade = 0) then
            Executador.Adiciona('UPDATE TB_ESTOQUE_EMBARCADO ' + 'SET QT_EMBARCADO = ' +
                   IntToStr(StrToInt(QConferenciaPedidoCodBarrasQT_PEDIDO.Text)) +
                   ' WHERE COD_ESTOQUE_EMBARCADO = ' + QConferenciaPedidoCodBarrasCOD_ESTOQUE_EMBARCADO.Text);
          // 1 = Apenas uma unidade
          if (wQuantidade = 1) then
            Executador.Adiciona('UPDATE TB_ESTOQUE_EMBARCADO ' + 'SET QT_EMBARCADO = ' +
                   IntToStr(StrToInt(QConferenciaPedidoCodBarrasQT_EMBARCADO.Text) + 1) +
                   ' WHERE COD_ESTOQUE_EMBARCADO = ' + QConferenciaPedidoCodBarrasCOD_ESTOQUE_EMBARCADO.Text);
          Executador.Executar(True, False);
          DMOracle.DBCemapa.Commit;
          QConferenciaPedidoCodBarras.Close;
          QConferenciaPedidoCodBarras.SetVariable('COD_PEDIDO_CAB',StrToInt(Trim(MePedido.Text)));
          QConferenciaPedidoCodBarras.SetVariable('DESC_COD_BARRA',NULL);
          QConferenciaPedidoCodBarras.SetVariable('COD_PRODUTO',NULL);
          QConferenciaPedidoCodBarras.SetVariable('COD_PRODUTO_DESTAQUE', wCodProdutoConferido);

          QConferenciaPedidoCodBarras.Open;

          MEProduto.Clear;
          MEProduto.SetFocus;
        except
          on e: Exception do
          begin
            DMOracle.DBCemapa.Rollback;
            QConferenciaPedidoCodBarras.Close;
            QConferenciaPedidoCodBarras.SetVariable('COD_PEDIDO_CAB',StrToInt(Trim(MePedido.Text)));
            QConferenciaPedidoCodBarras.SetVariable('DESC_COD_BARRA',NULL);
            QConferenciaPedidoCodBarras.SetVariable('COD_PRODUTO',NULL);
            QConferenciaPedidoCodBarras.SetVariable('COD_PRODUTO_DESTAQUE', NULL);
            QConferenciaPedidoCodBarras.Open;

            MEProduto.Clear;
            MEProduto.SetFocus;
            Raise Exception.Create(e.Message);

          end;
        end;
      end;
    End;
  end;


  //Código antigo..... junior 26/05/2026

{  if (Trim(MEProduto.Text) <> '') and (Trim(FmPedido1.MePedido.Text) <> '' ) then
  Begin
    With DMPedido do
    Begin
      QConferenciaPedidoCodBarras.Close;
      QConferenciaPedidoCodBarras.SetVariable('COD_PEDIDO_CAB',QPedidoConsCOD_PEDIDO_CAB.Value);
      QConferenciaPedidoCodBarras.SetVariable('DESC_COD_BARRA',MEProduto.Text);
      //QConferenciaPedidoCodBarras.SetVariable('COD_PRODUTO',MEProduto.Text);
      QConferenciaPedidoCodBarras.Open;
      if QConferenciaPedidoCodBarras.Eof then
      begin
        //raise exception.Create('Produto não encontrado na NF.');
        ShowMessage('Produto não encontrado no Pedido ou Quantidade já Atendida!');
        QConferenciaPedidoCodBarras.Close;
        QConferenciaPedidoCodBarras.SetVariable('COD_PEDIDO_CAB',QPedidoConsCOD_PEDIDO_CAB.Value);
        //QConferenciaPedidoCodBarras.SetVariable('COD_PRODUTO',null);
        QConferenciaPedidoCodBarras.SetVariable('DESC_COD_BARRA',null);
        QConferenciaPedidoCodBarras.Open;
        MEProduto.SetFocus;
        MEProduto.Text := '';
        exit;
      end;
{ Comentado pois a query foi alterada devido a Girardi trabalhar com lote de produtos.
     if QConferenciaNFCodBarrasQT_QUANTIDADE.Value = QConferenciaNFCodBarrasQT_EMBARCADO.Value then
      begin
//        Raise Exception.Create('Quantidade já Atendida!');
        ShowMessage('Quantidade já Atendida!');
        QConferenciaNFCodBarras.Close;
        QConferenciaNFCodBarras.SetVariable('COD_NOTA_CAB',QNotaSaidaConsCOD_NOTA_CAB.Value);
        //QConferenciaNFCodBarras.SetVariable('COD_PRODUTO',null);
        QConferenciaNFCodBarras.SetVariable('DESC_COD_BARRA',null);
        QConferenciaNFCodBarras.Open;
        MEProduto.SetFocus;
        MEProduto.Text := '';
        exit;
      end; }
{      if QConferenciaPedidoCodBarrasQT_PEDIDO.Value > QConferenciaPedidoCodBarrasQT_EMBARCADO.Value then
      Begin
        Try
          DMOracle.DBCemapa.StartTransaction;
{Alterado o bloco para que quando o produto for em caixa, deixando o mesmo marcado no cadastro a quantidade de etiquetas para a da nota, a conferencia irá realizar a baixa em todos, passando apenas um codigo de barras.
Solicitado por Gabriela. Girardi. Alex 16/10/2023}
{          wQuantidade := StrToInt (DMOracle.FastSelect('IND_QTD_ETIQUETAS','TB_PRODUTO','COD_PRODUTO = ' + QConferenciaPedidoCodBarrasCOD_PRODUTO.Text) );
          if (wQuantidade = 0) then {0=Quantidade da nota (Tela cadastro do produto) (Na tela de cadastro do produto)}
{            Executador.Adiciona('UPDATE TB_ESTOQUE_EMBARCADO SET QT_EMBARCADO = '+IntTOStr(StrToInt(QConferenciaPedidoCodBarrasQT_PEDIDO.Text)) +
              ' WHERE COD_ESTOQUE_EMBARCADO = '+ QConferenciaPedidoCodBarrasCOD_ESTOQUE_EMBARCADO.Text);
          if (wQuantidade = 1) then {1=Apenas uma unidade (Tela cadastro do produto)}
{            Executador.Adiciona('UPDATE TB_ESTOQUE_EMBARCADO SET QT_EMBARCADO = '+IntTOStr(StrToInt(QConferenciaPedidoCodBarrasQT_EMBARCADO.Text) + 1) +
              ' WHERE COD_ESTOQUE_EMBARCADO = '+ QConferenciaPedidoCodBarrasCOD_ESTOQUE_EMBARCADO.Text);

          Executador.Executar(True, False); //Executando tudo de uma vez
          DMOracle.DBCemapa.Commit;
          QConferenciaPedidoCodBarras.Close;
          QConferenciaPedidoCodBarras.SetVariable('COD_PEDIDO_CAB',StrToInt(Trim(FmPedido1.MePedido.Text)));
          QConferenciaPedidoCodBarras.SetVariable('DESC_COD_BARRA',NULL);
         // QConferenciaPedidoCodBarras.SetVariable('COD_PRODUTO',NULL);
          QConferenciaPedidoCodBarras.Open;
          MEProduto.SetFocus;
          MEProduto.Text := '';
        except
          on e: Exception do
          begin
            DMOracle.DBCemapa.rollback;
            QConferenciaPedidoCodBarras.Close;
            QConferenciaPedidoCodBarras.SetVariable('COD_PEDIDO_CAB',StrToInt(Trim(FmPedido1.MePedido.Text)));
            QConferenciaPedidoCodBarras.SetVariable('DESC_COD_BARRA',NULL);
            //QConferenciaPedidoCodBarras.SetVariable('COD_PRODUTO',NULL);
            QConferenciaPedidoCodBarras.Open;
            MEProduto.SetFocus;
            MEProduto.Text := '';
            exit;
          end;
        end;
      end;
    end;
  end;}
end;

procedure TFConferenciaPedidoCodBarras.DBGPedidoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//atualizando a visualização do DBGrid
  if DMPedido.QConferenciaPedidoCodBarrasQT_PEDIDO.Value = DMPedido.QConferenciaPedidoCodBarrasQT_EMBARCADO.Value then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := clGreen;
    TDBGrid(Sender).Canvas.Font.Color := clWhite;
  end;
  DBGPedido.Canvas.FillRect(Rect);
  TDBGrid(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFConferenciaPedidoCodBarras.SBPedidoClick(Sender: TObject);
var
  wCodProduto: String;
begin
  if FPedidoCons = Nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  FPedidoCons.RgListarAtendidos.ItemIndex := 0;
  if FPedidoCons.ShowModal = MrOk then
  begin
    MePedido.Text := DMPedido.QPedidoConsCOD_PEDIDO_CAB.Text;
    MePedidoExit(Self);
  end;
  With DMPedido do
  Begin
    QConferenciaPedidoCodBarras.Close;
    QConferenciaPedidoCodBarras.SetVariable('COD_PEDIDO_CAB',QPedidoConsCOD_PEDIDO_CAB.Value);
    QConferenciaPedidoCodBarras.SetVariable('DESC_COD_BARRA',NULL);
    QConferenciaPedidoCodBarras.SetVariable('COD_PRODUTO_DESTAQUE', NULL);
    //QConferenciaNFCodBarras.SetVariable('COD_PRODUTO',NULL);
    QConferenciaPedidoCodBarras.Open;
    If (QConferenciaPedidoCodBarras.RecordCount = 0) or (RgPedidoAlterado.ItemIndex = 0) then
    Begin
      QItemPedidoCons.Close;
      QItemPedidoCons.SetVariable('COD_PEDIDO_CAB',QPedidoConsCOD_PEDIDO_CAB.Value);
      QItemPedidoCons.Open;
      QItemPedidoCons.First;
      while not QItemPedidoCons.Eof do
      Begin
        If QItemPedidoConsDESC_COD_BARRA.Text = '' then
          QItemPedidoConsDESC_COD_BARRA.Text := '0';
{Solicitado por Gabi da GGirardi pois os pedidos em que eram acrescentados itens não apareciam para conferência . Alex 16/05/2024.}
        wCodProduto := DMOracle.FastSelect('COD_PRODUTO','TB_ESTOQUE_EMBARCADO','COD_PEDIDO_CAB = ' + QItemPedidoConsCOD_PEDIDO_CAB.Text +
                                          ' AND COD_PRODUTO = ' + QItemPedidoConsCOD_PRODUTO.Text);
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        if (wCodProduto = '' ) then
        begin
          DMOracle.QExecSQL.SQL.Add('INSERT INTO TB_ESTOQUE_EMBARCADO(COD_ESTOQUE_EMBARCADO,COD_PRODUTO,COD_FILIAL,QT_EMBARCADO,DT_EMBARQUE, '+
            'COD_PEDIDO_CAB, DESC_COD_BARRAS, COD_LOTE_TIPO) VALUES(SQESTOQUE_EMBARCADO.NEXTVAL,'+ QItemPedidoConsCOD_PRODUTO.Text+ ',1'+ ',0'+ ',' +
            QuotedStr(DateToStr(DATE))+ ',' + QItemPedidoConsCOD_PEDIDO_CAB.Text +','+ QuotedStr(QItemPedidoConsDESC_COD_BARRA.Text) +','+ QItemPedidoConsCOD_LOTE_TIPO.Text + ')');
          DMOracle.QExecSQL.ExecSQL;
          DMOracle.DBCemapa.Commit;
          QItemPedidoCons.Next;
        end
        else
          QItemPedidoCons.Next;
//        end;
      end;
    end;
    QConferenciaPedidoCodBarras.Close;
    QConferenciaPedidoCodBarras.SetVariable('COD_PEDIDO_CAB',QPedidoConsCOD_PEDIDO_CAB.Value);
    QConferenciaPedidoCodBarras.SetVariable('DESC_COD_BARRA',NULL);
    QConferenciaPedidoCodBarras.SetVariable('COD_PRODUTO_DESTAQUE', NULL);
    //QConferenciaNFCodBarras.SetVariable('COD_PRODUTO',NULL);
    QConferenciaPedidoCodBarras.Open;
  end;
  MEProduto.SetFocus;
end;

procedure TFConferenciaPedidoCodBarras.MePedidoExit(Sender: TObject);
begin
  if Trim(MePedido.Text) <> '' then
    EdPedido.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_PEDIDO_CAB INNER JOIN TB_CADASTRO ON TB_PEDIDO_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO','TB_PEDIDO_CAB.COD_PEDIDO_CAB = ' + MePedido.Text, True)
  else
    EdPedido.Text := 'Todos';
end;

procedure TFConferenciaPedidoCodBarras.MePedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = 123 Then  //123 = F12
     SBPedido.Click;
end;

procedure TFConferenciaPedidoCodBarras.SBProdutoClick(Sender: TObject);
begin
  if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
  begin
   MEProduto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
   MEProdutoExit(Self);
  end;
end;

end.
