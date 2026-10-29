unit UDesdobramento_ClasparCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFDesdobramento_ClasparCons = class(TFTConsulta)
    Label3: TLabel;
    MEDtInicial: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDesdobramento_ClasparCons: TFDesdobramento_ClasparCons;

implementation

uses UNotaSaida_cl;

{$R *.DFM}

procedure TFDesdobramento_ClasparCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    QDesdobramento_ClasparCons.Close;
    QDesdobramento_ClasparCons.SetVariable('DATA',StrToDate(MEDtInicial.Text));
    QDesdobramento_ClasparCons.Open;
  End;

end;

end.
