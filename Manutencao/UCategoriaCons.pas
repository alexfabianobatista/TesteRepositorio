unit UCategoriaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFCategoriaCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCategoriaCons: TFCategoriaCons;

implementation

uses UCategoriaProfissional_cl;

{$R *.DFM}

procedure TFCategoriaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMCategoriaProfissional do
  Begin
    QCategoriaCons.Close;
    If Trim(METexto.Text) = '' then
      QCategoriaCons.SetVariable('DESCRICAO',Null)
    Else
      QCategoriaCons.SetVariable('DESCRICAO',METexto.Text);
    QCategoriaCons.Open;
  End;
end;

end.
