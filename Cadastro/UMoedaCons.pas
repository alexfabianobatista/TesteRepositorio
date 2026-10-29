unit UMoedaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, Menus;

type
  TFMoedaCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMoedaCons: TFMoedaCons;

implementation

uses UMoeda_cl;

{$R *.DFM}

procedure TFMoedaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMMoeda do
  begin
    QMoedaCons.Close;
    QMoedaCons.SetVariable('NOME_MOEDA', UpperCase(METexto.Text));
    QMoedaCons.Open;
  end;
end;

end.
