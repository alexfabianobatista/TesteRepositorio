unit UBloqueioProdutoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFBloqueioProdutoCons = class(TFTConsulta)
    BitBtn2: TBitBtn;
    Label5: TLabel;
    MeProduto: TMaskEdit;
    Label4: TLabel;
    MeCadastro: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBloqueioProdutoCons: TFBloqueioProdutoCons;

implementation

uses UBloqueio_Produto_cl, UFilialCons, UProdutoCons, UCadastroCons,
  UFilial_cl, UProduto_cl, UCadastro_cl, UUsuario_cl;

{$R *.DFM}

procedure TFBloqueioProdutoCons.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
     MeTexto.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFBloqueioProdutoCons.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
     MeProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;

end;

procedure TFBloqueioProdutoCons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     MeCadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFBloqueioProdutoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(METexto.Text),'AGRICOLA');
  With DMBloqueio_Produto do
  Begin
    QBloqueioProduto_Cons.Close;
    If Trim(MeTexto.Text) <> '' Then
       QBloqueioProduto_Cons.SetVariable('COD_FILIAL',StrToInt(Trim(MeTexto.Text)))
    Else
       QBloqueioProduto_Cons.SetVariable('COD_FILIAL',Null);
    If Trim(MeProduto.Text) <> '' Then
       QBloqueioProduto_Cons.SetVariable('COD_PRODUTO',StrToInt(Trim(MeProduto.Text)))
    Else
       QBloqueioProduto_Cons.SetVariable('COD_PRODUTO',Null);
    If Trim(MeCadastro.Text) <> '' Then
       QBloqueioProduto_Cons.SetVariable('COD_CADASTRO',StrToInt(Trim(MeCadastro.Text)))
    Else
       QBloqueioProduto_Cons.SetVariable('COD_CADASTRO',Null);
    QBloqueioProduto_Cons.Open;
  End;
end;

end.
