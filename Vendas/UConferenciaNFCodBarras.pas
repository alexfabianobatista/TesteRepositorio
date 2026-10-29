unit UConferenciaNFCodBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Mask, DB, UFmNota;

type
  TFConferenciaNFCodBarras = class(TForm)
    Label5: TLabel;
    Label2: TLabel;
    EdNum_Nota: TEdit;
    DBGNota: TDBGrid;
    BtConfirmar: TBitBtn;
    BtCancelar: TBitBtn;
    EdProduto: TEdit;
    MEProduto: TMaskEdit;
    DsConferenciaNFCodBarras: TDataSource;
    FmNota1: TFmNota;
    procedure FmNota1BtNotaClick(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
    procedure DBGNotaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConferenciaNFCodBarras: TFConferenciaNFCodBarras;

implementation

uses UNotaSaida_cl, UOracle_cl;

{$R *.dfm}

procedure TFConferenciaNFCodBarras.FmNota1BtNotaClick(Sender: TObject);
begin
  FmNota1.BtNotaClick(Sender);
  With DMNotaSaida do
  Begin
    QConferenciaNFCodBarras.Close;
    QConferenciaNFCodBarras.SetVariable('COD_NOTA_CAB',QNotaSaidaConsCOD_NOTA_CAB.Value);
    QConferenciaNFCodBarras.SetVariable('DESC_COD_BARRA',NULL);
    //QConferenciaNFCodBarras.SetVariable('COD_PRODUTO',NULL);
    QConferenciaNFCodBarras.Open;
    If QConferenciaNFCodBarras.RecordCount = 0 then
    Begin
      QItemNFCons.Close;
      QItemNfCons.SetVariable('COD_NOTA_CAB',QNotaSaidaConsCOD_NOTA_CAB.Value);
      QItemNFCons.Open;
      QItemNfCons.First;
      while not QItemNfCons.Eof do
      Begin
        If QItemNfConsDESC_COD_BARRA.Text = '' then
          QItemNfConsDESC_COD_BARRA.Text := '0';
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('INSERT INTO TB_ESTOQUE_EMBARCADO(COD_ESTOQUE_EMBARCADO,COD_PRODUTO,COD_FILIAL,QT_EMBARCADO,DT_EMBARQUE, '+
            'COD_NOTA_CAB, DESC_COD_BARRAS, COD_LOTE_TIPO) VALUES(SQESTOQUE_EMBARCADO.NEXTVAL,'+ QItemNfConsCOD_PRODUTO.Text+ ',1'+ ',0'+ ',' +
            QuotedStr(DateToStr(DATE))+ ',' + QItemNfConsCOD_NOTA_CAB.Text +','+ QItemNfConsDESC_COD_BARRA.Text +','+ QItemNfConsCOD_LOTE_TIPO.Text + ')');
        DMOracle.QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;
        QItemNfCons.Next;
      end;
    end;
    QConferenciaNFCodBarras.Close;
    QConferenciaNFCodBarras.SetVariable('COD_NOTA_CAB',QNotaSaidaConsCOD_NOTA_CAB.Value);
    QConferenciaNFCodBarras.SetVariable('DESC_COD_BARRA',NULL);
    //QConferenciaNFCodBarras.SetVariable('COD_PRODUTO',NULL);
    QConferenciaNFCodBarras.Open;
    EdNum_Nota.Text := QNotaSaidaConsNOME.Text;
  end;
  MEProduto.SetFocus; 
end;

procedure TFConferenciaNFCodBarras.MEProdutoExit(Sender: TObject);
var
 wQuantidade: integer;
begin
  if (Trim(MEProduto.Text) <> '') and (Trim(FmNota1.MeNota.Text) <> '' ) then
  Begin
    With DMNotaSaida do
    Begin
      QConferenciaNFCodBarras.Close;
      QConferenciaNFCodBarras.SetVariable('COD_NOTA_CAB',QNotaSaidaConsCOD_NOTA_CAB.Value);
      QConferenciaNFCodBarras.SetVariable('DESC_COD_BARRA',MEProduto.Text);
      //QConferenciaNFCodBarras.SetVariable('COD_PRODUTO',MEProduto.Text);
      QConferenciaNFCodBarras.Open;
      if QConferenciaNFCodBarras.Eof then
      begin
        //raise exception.Create('Produto não encontrado na NF.');
        ShowMessage('Produto não encontrado na NF ou Quantidade já Atendida!');
        QConferenciaNFCodBarras.Close;
        QConferenciaNFCodBarras.SetVariable('COD_NOTA_CAB',QNotaSaidaConsCOD_NOTA_CAB.Value);
        //QConferenciaNFCodBarras.SetVariable('COD_PRODUTO',null);
        QConferenciaNFCodBarras.SetVariable('DESC_COD_BARRA',null);
        QConferenciaNFCodBarras.Open;
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
      if QConferenciaNFCodBarrasQT_QUANTIDADE.Value > QConferenciaNFCodBarrasQT_EMBARCADO.Value then
      Begin
        Try
          DMOracle.DBCemapa.StartTransaction;
{Alterado o bloco para que quando o produto for em caixa, deixando o mesmo marcado no cadastro a quantidade de etiquetas para a da nota, a conferencia irá realizar a baixa em todos, passando apenas um codigo de barras.
Solicitado por Gabriela. Girardi. Alex 16/10/2023}
          wQuantidade := StrToInt (DMOracle.FastSelect('IND_QTD_ETIQUETAS','TB_PRODUTO','COD_PRODUTO = ' + QConferenciaNFCodBarrasCOD_PRODUTO.Text) );
          if (wQuantidade = 0) then {0=Quantidade da nota (Tela cadastro do produto) (Na tela de cadastro do produto)}
            Executador.Adiciona('UPDATE TB_ESTOQUE_EMBARCADO SET QT_EMBARCADO = '+IntTOStr(StrToInt(QConferenciaNFCodBarrasQT_QUANTIDADE.Text)) +
              ' WHERE COD_ESTOQUE_EMBARCADO = '+ QConferenciaNFCodBarrasCOD_ESTOQUE_EMBARCADO.Text);
          if (wQuantidade = 1) then {1=Apenas uma unidade (Tela cadastro do produto)}
            Executador.Adiciona('UPDATE TB_ESTOQUE_EMBARCADO SET QT_EMBARCADO = '+IntTOStr(StrToInt(QConferenciaNFCodBarrasQT_EMBARCADO.Text) + 1) +
              ' WHERE COD_ESTOQUE_EMBARCADO = '+ QConferenciaNFCodBarrasCOD_ESTOQUE_EMBARCADO.Text);

          Executador.Executar(True, False); //Executando tudo de uma vez
          DMOracle.DBCemapa.Commit;
          QConferenciaNFCodBarras.Close;
          QConferenciaNFCodBarras.SetVariable('COD_NOTA_CAB',StrToInt(Trim(FmNota1.MeNota.Text)));
          QConferenciaNFCodBarras.SetVariable('DESC_COD_BARRA',NULL);
         // QConferenciaNFCodBarras.SetVariable('COD_PRODUTO',NULL);
          QConferenciaNFCodBarras.Open;
          MEProduto.SetFocus;
          MEProduto.Text := '';
        except
          on e: Exception do
          begin
            DMOracle.DBCemapa.rollback;
            QConferenciaNFCodBarras.Close;
            QConferenciaNFCodBarras.SetVariable('COD_NOTA_CAB',StrToInt(Trim(FmNota1.MeNota.Text)));
            QConferenciaNFCodBarras.SetVariable('DESC_COD_BARRA',NULL);
            //QConferenciaNFCodBarras.SetVariable('COD_PRODUTO',NULL);
            QConferenciaNFCodBarras.Open;
            MEProduto.SetFocus;
            MEProduto.Text := '';
            exit;
          end;
        end;
      end;
    end;
  end;
end;

procedure TFConferenciaNFCodBarras.DBGNotaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//atualizando a visualização do DBGrid
  if DMNotaSaida.QConferenciaNFCodBarrasQT_QUANTIDADE.Value = DMNotaSaida.QConferenciaNFCodBarrasQT_EMBARCADO.Value then
  begin
    TDBGrid(Sender).Canvas.Brush.Color :=clBlue;
    TDBGrid(Sender).Canvas.Font.Color := clWhite;
  end;
  DBGNota.Canvas.FillRect(Rect);
  TDBGrid(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

end.
