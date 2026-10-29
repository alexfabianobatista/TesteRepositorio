unit FBloqueioProdutoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFTConsulta1 = class(TFTConsulta)
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
  FTConsulta1: TFTConsulta1;

implementation

uses UBloqueio_Produto_cl;

{$R *.DFM}

procedure TFTConsulta1.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
     MeTexto.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFTConsulta1.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
     MeProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;

end;

procedure TFTConsulta1.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     MeCadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFTConsulta1.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMBloqueio_Produto do
  Begin
    QBloqueioProduto_Cons.Close;
    If Trim(MeTexto.Text) <> '' Then
       QBloqueioProduto_Cons.SetVariable('COD_FILIAL').AsInteger := StrToInt(Trim(MeTexto.Text))
    Else
       QBloqueioProduto_Cons.SetVariable('COD_FILIAL').AsNull;
    If Trim(MeProduto.Text) <> '' Then
       QBloqueioProduto_Cons.SetVariable('COD_PRODUTO').AsInteger := StrToInt(Trim(MeProduto.Text))
    Else
       QBloqueioProduto_Cons.SetVariable('COD_PRODUTO').AsNull;
    If Trim(MeCadastro.Text) <> '' Then
       QBloqueioProduto_Cons.SetVariable('COD_CADASTRO').AsInteger := StrToInt(Trim(MeCadastro.Text))
    Else
       QBloqueioProduto_Cons.SetVariable('COD_CADASTRO').AsNull;
    QBloqueioProduto_Cons.Open;
  End;
end;

end.
