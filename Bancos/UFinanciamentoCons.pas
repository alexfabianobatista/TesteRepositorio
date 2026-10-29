unit UFinanciamentoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFFinanciamentoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFinanciamentoCons: TFFinanciamentoCons;

implementation

uses UFinanciamento_cl;

{$R *.dfm}

procedure TFFinanciamentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMFinanciamento.QFinanciamentoCons.Close;
  DMFinanciamento.QFinanciamentoCons.Open;
end;

end.
