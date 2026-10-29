unit UMalaDiretaCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, UBiblioteca;

type
  TFMalaDiretaCons = class(TFTConsulta)
    procedure FormActivate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMalaDiretaCons: TFMalaDiretaCons;

implementation

uses UMalaDireta_cl;

{$R *.dfm}

procedure TFMalaDiretaCons.FormActivate(Sender: TObject);
begin
  inherited;
  METexto.SetFocus;
end;

procedure TFMalaDiretaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMMalaDireta do
  begin
    QMalaDiretaCons.Close;
    Bib.setVariableOuNull(QMalaDiretaCons, 'DESC_DESCRICAO', Trim(METexto.Text + '%'));
    QMalaDiretaCons.Open;
  end;
end;

end.
