unit UBloqueio_Produto_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMBloqueio_Produto = class(TDataModule)
    QBloqueioProduto_Cad: TOracleDataSet1;
    QBloqueioProduto_CadCOD_PRODUTO_BLOQUEADO: TIntegerField;
    QBloqueioProduto_CadCOD_CADASTRO: TIntegerField;
    QBloqueioProduto_CadCOD_MOTIVO: TIntegerField;
    QBloqueioProduto_CadCOD_FILIAL: TIntegerField;
    QBloqueioProduto_CadCOD_USUARIO: TIntegerField;
    QBloqueioProduto_CadDESC_COMPLEMENTO: TStringField;
    QBloqueioProduto_CadDT_BLOQUEIO: TDateTimeField;
    QBloqueioProduto_CadDT_LANCAMENTO: TDateTimeField;
    QBloqueioProduto_CadCOD_PRODUTO: TIntegerField;
    QBloqueioProduto_Cons: TOracleDataSet1;
    QBloqueioProduto_ConsCOD_PRODUTO_BLOQUEADO: TIntegerField;
    QBloqueioProduto_ConsCOD_CADASTRO: TIntegerField;
    QBloqueioProduto_ConsCOD_MOTIVO: TIntegerField;
    QBloqueioProduto_ConsCOD_FILIAL: TIntegerField;
    QBloqueioProduto_ConsCOD_USUARIO: TIntegerField;
    QBloqueioProduto_ConsDESC_COMPLEMENTO: TStringField;
    QBloqueioProduto_ConsDT_BLOQUEIO: TDateTimeField;
    QBloqueioProduto_ConsDT_LANCAMENTO: TDateTimeField;
    QBloqueioProduto_ConsCOD_PRODUTO: TIntegerField;
    QBloqueioProduto_CadIND_TIPO_PRODUTO: TStringField;
    QBloqueioProduto_CadQT_QUANTIDADE: TIntegerField;
    QBloqueioProduto_ConsQT_QUANTIDADE: TIntegerField;
    QBloqueioProduto_ConsIND_TIPO_PRODUTO: TStringField;
    QBloqueioProduto_CadCOD_CADASTRO_PARCEIRO: TIntegerField;
    QRBloqueioProduto: TOracleDataSet1;
    QRBloqueioProdutoCOD_FILIAL: TIntegerField;
    QRBloqueioProdutoDESC_FILIAL: TStringField;
    QRBloqueioProdutoCOD_PRODUTO: TFloatField;
    QRBloqueioProdutoDESC_PRODUTO: TStringField;
    QRBloqueioProdutoCOD_CADASTRO: TIntegerField;
    QRBloqueioProdutoNOME: TStringField;
    QRBloqueioProdutoDT_BLOQUEIO: TDateTimeField;
    QRBloqueioProdutoDT_LANCAMENTO: TDateTimeField;
    QRBloqueioProdutoIND_TIPO_PRODUTO: TStringField;
    QRBloqueioProdutoQT_QUANTIDADE: TIntegerField;
    QBloqueioProduto_CadCOD_LOTE_TIPO: TIntegerField;
    QBloqueioProduto_CadCOD_CADASTRO_AUTORIZADO: TIntegerField;
    QBloqueioProduto_CadNUM_AUTORIZACAO: TIntegerField;
    procedure QBloqueioProduto_CadAfterInsert(DataSet: TDataSet);
    procedure QBloqueioProduto_CadBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBloqueio_Produto: TDMBloqueio_Produto;

implementation

uses UOracle_cl, UUsuario_cl;

{$R *.DFM}

procedure TDMBloqueio_Produto.QBloqueioProduto_CadAfterInsert(
  DataSet: TDataSet);
begin
   QBloqueioProduto_CadDt_Lancamento.Value := Date;
   QBloqueioProduto_CadCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMBloqueio_Produto.QBloqueioProduto_CadBeforePost(
  DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QBloqueioProduto_CadCOD_FILIAL.Text);
end;

end.
