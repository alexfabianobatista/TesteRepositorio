unit UAtualizaPrecoMarca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, UFmProduto, UFmClasse, UFmFilial,
  UFmMarca;

type
  TFAtualizaPrecoMarca = class(TForm)
    MePorcentagem: TMaskEdit;
    LblPorcentagem: TLabel;
    BtOk: TBitBtn;
    BtCancelar: TBitBtn;
    FmClasse: TFmClasse;
    FmProduto: TFmProduto;
    FmMarca: TFmMarca;
    procedure MePorcentagemKeyPress(Sender: TObject; var Key: Char);
    procedure BtOkClick(Sender: TObject);
    procedure FmClasseBtClasseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FmClasseMeClasseExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtualizaPrecoMarca: TFAtualizaPrecoMarca;
  wTamanho: Integer;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TFAtualizaPrecoMarca.MePorcentagemKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', '-', '.', #8]) then
    Key := #0;
end;

procedure TFAtualizaPrecoMarca.BtOkClick(Sender: TObject);
begin
  if (MessageDlg('Tem certeza que deseja atualizar os preços?', mtConfirmation, [mbYes, mbCancel], 0) = mrYes) then
    ModalResult := MrOk;
end;

procedure TFAtualizaPrecoMarca.FmClasseBtClasseClick(Sender: TObject);
begin
  FmClasse.BtClasseClick(Sender);
end;

procedure TFAtualizaPrecoMarca.FormCreate(Sender: TObject);
begin
  wTamanho := Self.Height;
end;

procedure TFAtualizaPrecoMarca.FmClasseMeClasseExit(Sender: TObject);
begin
//  FmClasse.MeClasseExit(Sender);
  if Trim(FmClasse.MeClasse.Text) <> '' then
    FmClasse.EdClasse.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
        'COD_CLASSE = ' + FmClasse.MeClasse.Text)
  else
    FmClasse.EdClasse.Text := 'Todas';
end;

end.
