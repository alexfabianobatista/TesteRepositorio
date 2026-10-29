unit UAtualizaPrecoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, UFmProduto, UFmClasse, UFmFilial,
  UFmMarca, UFmLote, UFmCadastro;

type
  TFAtualizaPrecoEstoque = class(TForm)
    MePorcentagem: TMaskEdit;
    LblPorcentagem: TLabel;
    BtOk: TBitBtn;
    BtCancelar: TBitBtn;
    FmProduto: TFmProduto;
    CBVarejo: TCheckBox;
    CBAtacado: TCheckBox;
    FmFilial: TFmFilial;
    SBCodClasse: TSpeedButton;
    Label3: TLabel;
    MeCodClasse: TMaskEdit;
    EdDescClasse: TEdit;
    Label4: TLabel;
    FmMarca1: TFmMarca;
    FmLote1: TFmLote;
    FmCadastro1: TFmCadastro;
    procedure FormShow(Sender: TObject);
    procedure MePorcentagemKeyPress(Sender: TObject; var Key: Char);
    procedure BtOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBCodClasseClick(Sender: TObject);
    procedure MeCodClasseExit(Sender: TObject);
    procedure FmProdutoBtProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtualizaPrecoEstoque: TFAtualizaPrecoEstoque;
  wTamanho: Integer;

implementation

uses UClasseCons, UClasse_cl, UOracle_cl;

{$R *.dfm}

procedure TFAtualizaPrecoEstoque.FormShow(Sender: TObject);
begin
//  if (FmFilial.Visible) then
//    Height := wTamanho
//  else
//    Height := 313;
end;

procedure TFAtualizaPrecoEstoque.MePorcentagemKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', ',', '-', #8]) then
    Key := #0;
end;

procedure TFAtualizaPrecoEstoque.BtOkClick(Sender: TObject);
begin
  if (MessageDlg('Tem certeza que deseja atualizar os preços?', mtConfirmation, [mbYes, mbCancel], 0) = mrYes) then
    ModalResult := MrOk;
end;

procedure TFAtualizaPrecoEstoque.FormCreate(Sender: TObject);
begin
  wTamanho := Self.Height;
end;

procedure TFAtualizaPrecoEstoque.SBCodClasseClick(Sender: TObject);
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
    wDescClasse := 'Classe: ' + DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE ='+QClasseConsNUM_CLASSE.Text+
                                      'AND NUM_SUBCLASSE = 0');
    MeCodClasse.Text := QClasseConsCOD_CLASSE.Text;
    EdDescClasse.Text := wDescClasse + ' subClasse: ' + QClasseConsDESC_CLASSE.Text;
  End;
end;

procedure TFAtualizaPrecoEstoque.MeCodClasseExit(Sender: TObject);
var wNumClasse : String;
begin
  if Trim(MeCodClasse.Text) <> '' then
  begin
    wNumClasse := DMOracle.BuscaNome('SELECT NUM_CLASSE FROM TB_CLASSE',
      'COD_CLASSE = ' + MeCodClasse.Text);
    EdDescClasse.Text := 'Classe: '+ DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = ' +
        wNumClasse + ' AND NUM_SUBCLASSE = 0');
    EdDescClasse.Text := EdDescClasse.Text +
      ' - Subclasse: ' +
      DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','COD_CLASSE = ' + MeCodClasse.Text);
  end
  else
    EdDescClasse.Text := 'Todas';
end;

procedure TFAtualizaPrecoEstoque.FmProdutoBtProdutoClick(Sender: TObject);
begin
  FmProduto.BtProdutoClick(Sender);

end;

end.
