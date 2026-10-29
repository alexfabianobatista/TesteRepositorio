unit UAlteraPreco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, variants;

type
  TFAlteraPreco = class(TForm)
    SBProduto_AlteraPreco: TSpeedButton;
    MEProduto_AlteraPreco: TMaskEdit;
    EdProduto_AlteraPreco: TEdit;
    MEAlteraPreco: TMaskEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    MeCodClasse: TMaskEdit;
    Label3: TLabel;
    SBCodClasse: TSpeedButton;
    EdDescClasse: TEdit;
    Label4: TLabel;
    procedure SBProduto_AlteraPrecoClick(Sender: TObject);
    procedure MEProduto_AlteraPrecoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SBCodClasseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAlteraPreco: TFAlteraPreco;
  wValor : real;

implementation

uses UProdutoCons, UProduto_cl, UCadastro_cl, UOracle_cl, UClasseCons,
  UClasse_cl, DB;

{$R *.DFM}

procedure TFAlteraPreco.SBProduto_AlteraPrecoClick(Sender: TObject);
begin
  if FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    with DMProduto do
      MEProduto_AlteraPreco.Text := FloatToStr(QProdutoConsCOD_PRODUTO.Value);
      MEProduto_AlteraPrecoExit(self);
  end;

end;

procedure TFAlteraPreco.MEProduto_AlteraPrecoExit(Sender: TObject);
begin
 If Trim(MEProduto_AlteraPreco.Text) <> '' Then
  With DMCadastro do
    EdProduto_AlteraPreco.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                                       'COD_PRODUTO = '+chr(39)+Trim(MEProduto_AlteraPreco.Text)+chr(39));
end;

procedure TFAlteraPreco.BitBtn1Click(Sender: TObject);
begin
  If (Trim(MEProduto_alteraPreco.Text) = '') and (Trim(MECodClasse.Text) = '') then
    Raise Exception.Create('Informe o Produto ou a Classe!');
  If (Trim(MEProduto_alteraPreco.Text) <> '') and (Trim(MECodClasse.Text) <> '') then
    Raise Exception.Create('Informe só o Produto ou só a Classe!');
  If MEAlteraPreco.Text = '' then
    Raise Exception.Create('Informe o Porcentual a ser alterado no Preço!');

  with dmProduto do
  Begin
    if Trim(MEProduto_alteraPreco.Text) <> '' then
    Begin
      QAlteraPreco.close;
      QAlteraPreco.SetVariable('COD_PRODUTO',MEProduto_alteraPreco.Text);
      QAlteraPreco.SetVariable('COD_CLASSE', Null);
      QAlteraPreco.open;
      QAlteraPreco.First;
    end;
    if Trim(MECodClasse.Text) <> '' then
    Begin
      QAlteraPreco.close;
      QAlteraPreco.SetVariable('COD_PRODUTO',NULL);
      QAlteraPreco.SetVariable('COD_CLASSE',Trim(MECodClasse.Text));
      QAlteraPreco.open;
      QAlteraPreco.First;
    end;
    while not QAlteraPreco.Eof do
    Begin
      QProdutoFornecedor.close;
      QProdutoFornecedor.SetVariable('PK',QAlteraPrecoCOD_PRODUTO_FORNECEDOR.Value);
      QProdutoFornecedor.open;
      QProdutoFornecedor.Edit;
      QProdutoFornecedorVal_produto.Value := (((QAlteraPrecoVal_produto.Value * StrToFloat(MEAlteraPreco.Text)) /100) + QAlteraPrecoVal_produto.Value);
      QProdutoFornecedor.Post;
      QAlteraPreco.next;
    end;
    showmessage('Preços Atualizados!');
  end;
end;
procedure TFAlteraPreco.SBCodClasseClick(Sender: TObject);
var
wDescClasse : string;
begin
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  With DMClasse do
  Begin
    QClasse.Close;
    QClasse.SetVariable('PK',QClasseConsCod_Classe.Value);
    QClasse.Open;
    wDescClasse := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE ='+QClasseConsNUM_CLASSE.Text+
                                      'AND NUM_SUBCLASSE = 0');
    MeCodClasse.Text := QClasseConsCOD_CLASSE.Text;
    EdDescClasse.Text := wDescClasse + '-' + QClasseConsDESC_CLASSE.Text;
  End;
end;

end.
