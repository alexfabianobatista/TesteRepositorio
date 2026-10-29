unit UFEstoqueSaidaProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Mask, Grids, DBGrids, StdCtrls, Db;

type
  TFEstoqueSaidaProduto = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label6: TLabel;
    Edit4: TEdit;
    DSPedidoItemCons: TDataSource;
    ME_CodProdutoBarra: TEdit;
    BtnConfirmar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstoqueSaidaProduto: TFEstoqueSaidaProduto;

implementation

uses UOracle_cl, UEstoque_cl;

{$R *.DFM}

procedure TFEstoqueSaidaProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  DMPedido.QPedido.Active := False;
//  DMPedido.QPedidoItem.Active := False;
  Action := CaFree;
  FEstoqueSaidaProduto := Nil;
end;

procedure TFEstoqueSaidaProduto.FormActivate(Sender: TObject);
begin
  with DMEstoque do
  begin
    QPedidoItemCons.Active := False;
    QPed_ItemBxa_Barra.Active := False;
  end;
end;

procedure TFEstoqueSaidaProduto.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    Edit1.SetFocus;
    raise exception.Create('Número do pedido deve ser informado!');
  end;

  // Usuario informou um numero para pedido
  with DMEstoque do
  begin
    QPedidoItemCons.close;
    QPedidoItemCons.SetVariable('pNUM_PEDIDO',Edit1.Text);
    QPedidoItemCons.Open;
    if QPedidoItemCons.RecordCount = 0 then
    begin
      Edit1.SetFocus;
      raise exception.Create('Pedido informado não encontrado!');
    end;
    Edit3.Text := QPedidoItemConsDT_EMISSAO.Text;
    Edit2.Text := QPedidoItemConsCOD_CADASTRO.Text;
  end;

  Edit2.Text:= Edit2.Text+' - '+DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','TB_CADASTRO.COD_CADASTRO= '+Edit2.Text);
  Edit4.Text:= DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','TB_FILIAL.COD_FILIAL= '+FloatToStr(DMEstoque.QPedidoItemConsCOD_FILIAL.Value));

  // Informações do pedido estão ok
  // Aguarda digitação codigo de barra para o produto.


  ME_CodProdutoBarra.SetFocus;

end;

procedure TFEstoqueSaidaProduto.BtnConfirmarClick(Sender: TObject);
var mProdutoBarra : String;
    mProdutoCodigo: String;
begin
  mProdutoBarra := '';
  mProdutoCodigo:= '';

  if Trim(ME_CodProdutoBarra.Text) = '' then
  begin
    ME_CodProdutoBarra.SetFocus;
    raise exception.Create('Informe um número valido! - CODIGO DE BARRA');
  end;
  mProdutoBarra :=DMOracle.BuscaNome('SELECT NUM_FABRICANTE FROM TB_PRODUTO','TB_PRODUTO.NUM_FABRICANTE='+CHR(39)+ME_CodProdutoBarra.Text+CHR(39));
  mProdutoCodigo:=DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','TB_PRODUTO.NUM_FABRICANTE= '+CHR(39)+ME_CodProdutoBarra.Text+CHR(39));

  if mProdutoBarra = '' then
  begin
    ME_CodProdutoBarra.SetFocus;
    raise exception.Create('Produto não tem número do fabricação-CODIGO BARRA!');
  end;

  if MProdutoCodigo = '' then
  begin
    ME_CodProdutoBarra.SetFocus;
    raise exception.Create('Produto não cadastrado ou não encontrado!');
  end;

  if not DMEstoque.QPedidoItemCons.Locate('COD_PRODUTO',mProdutoCodigo,[loPartialKey]) then
     raise exception.Create('Produto não encontrado no PEDIDO!, Verifique!');

  DMEstoque.QPed_ItemBxa_Barra.Close;
  DMEstoque.QPed_ItemBxa_Barra.SetVariable('pCOD_PEDIDO_CAB',DMEstoque.QPedidoItemConsCOD_PEDIDO_CAB.Value);
  DMEstoque.QPed_ItemBxa_Barra.SetVariable('pCOD_PRODUTO',DMEstoque.QPedidoItemConsCOD_PRODUTO.Value);
  DMEstoque.QPed_ItemBxa_Barra.Open;

  if ( DMEstoque.QPed_ItemBxa_BarraQT_PEDIDO.Value ) <
     ( DMEstoque.QPed_ItemBxa_BarraQT_ATENDIDO.Value + 1 ) then
     raise exception.Create('Quantidade atendida não pode ser maior que quantidade do PEDIDO!');

  { Inicia procedimentos de gravação com banco de dados. }
  if not DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.StartTransaction;

  try

   DMEstoque.QPed_ItemBxa_Barra.Edit;

   DMEstoque.QPed_ItemBxa_BarraQT_ATENDIDO.Value :=
   DMEstoque.QPed_ItemBxa_BarraQT_ATENDIDO.Value + 1;

   DMEstoque.QPed_ItemBxa_Barra.Post;

   DMEstoque.AtualizaEstoque(-1,DMEstoque.QPedidoItemConsCOD_FILIAL.Value,
                                StrToInt(DMEstoque.QPedidoItemConsCOD_PRODUTO.Text),
                                DMEstoque.QPedidoItemConsCOD_LOTE_TIPO.Value,1,0,0,0);

   DMOracle.DBCemapa.Commit;

  except
     DMOracle.DBCemapa.Rollback;
     raise exception.Create('Não foi possivel gravar informações, tente novamente!');
  end;

  DBGrid1.Refresh;
  ME_CodProdutoBarra.Clear;
  ME_CodProdutoBarra.SetFocus;

end;

end.
