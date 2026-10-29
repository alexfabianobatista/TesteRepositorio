unit UProdutoSkyhubCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, UFmProduto, Menus, DB, Grids, DBGrids, StdCtrls,
  Mask, Buttons;

type
  TFProdutoSkyhubCons = class(TFTConsulta)
    FmProduto1: TFmProduto;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutoSkyhubCons: TFProdutoSkyhubCons;

implementation

uses
  UProdutoSkyhub_cl, UBiblioteca;

{$R *.dfm}

procedure TFProdutoSkyhubCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMProdutoSkyhub do
  begin
    QProdutoSkyhubCons.Close;
    Bib.setVariableOuNull(QProdutoSkyhubCons, 'DESC_PRODUTO', Trim(METexto.Text + '%'));
    Bib.setVariableOuNull(QProdutoSkyhubCons, 'COD_PRODUTO', Trim(FmProduto1.MeProduto.Text));
    QProdutoSkyhubCons.Open;
  end;

end;

procedure TFProdutoSkyhubCons.FormActivate(Sender: TObject);
begin
  inherited;
  DBGrid1.Width := DBGrid1.Width + 1;
  DBGrid1.Width := DBGrid1.Width - 1;
end;

end.
