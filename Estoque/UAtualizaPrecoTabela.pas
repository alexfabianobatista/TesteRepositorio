unit UAtualizaPrecoTabela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, Grids, DBGrids, UFmClasse, UFmSubClasse;

type
  TFAtualizaPrecoTabela = class(TFTCadSimples)
    DBGAtualizaPrecoTabela: TDBGrid;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    FmSubClasse: TFmSubClasse;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtualizaPrecoTabela: TFAtualizaPrecoTabela;

implementation

uses UProduto_cl;

{$R *.dfm}

procedure TFAtualizaPrecoTabela.BitBtn1Click(Sender: TObject);
begin
  inherited;
  with DMProduto do
  begin
    QAtualizaPrecoProduto.Close;
    QAtualizaPrecoProduto.ClearVariables;
    if Trim(FmSubClasse.MeClasse.Text) <> '' then
      QAtualizaPrecoProduto.SetVariable('CLASSE', FmSubClasse.MeClasse.Text);
    if Trim(FmSubClasse.MeSubClasse.Text) <> '' then
      QAtualizaPrecoProduto.SetVariable('SUBCLASSE', FmSubClasse.MeSubClasse.Text);
    QAtualizaPrecoProduto.Open;
  end;
end;

procedure TFAtualizaPrecoTabela.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

end.
