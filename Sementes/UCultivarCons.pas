unit UCultivarCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFCultivarCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCultivarCons: TFCultivarCons;

implementation

uses UCultivar_cl;

{$R *.DFM}

procedure TFCultivarCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMCultivar do
  Begin
    QCultivarCons.Close;
    if MEtexto.text <> '' then
      QCultivarCons.SetVariable('Descricao',METexto.Text)
    else
      QCultivarCons.SetVariable('Descricao', Null);
    QCultivarCons.Open;
  End;
end;

end.
