unit UGrupoProdutoMetaCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus;

type
  TFGrupoProdutoMetaCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;       
var
  FGrupoProdutoMetaCons: TFGrupoProdutoMetaCons;

implementation

uses UGrupoProdutoMeta_cl;

{$R *.dfm}

procedure TFGrupoProdutoMetaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMGrupoProdutoMeta do
  begin
    QGrupoProdutoMetaCons.Close();
    if MeTexto.Text <> '' then
      QGrupoProdutoMetaCons.SetVariable('GRUPO',trim(METexto.Text));
    QGrupoProdutoMetaCons.Open();
  end;
end;

end.
