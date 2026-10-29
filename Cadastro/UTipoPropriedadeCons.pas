unit UTipoPropriedadeCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db;

type
  TFTipoPropriedadeCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoPropriedadeCons: TFTipoPropriedadeCons;

implementation

uses UTipoPropriedade_cl;

{$R *.DFM}

procedure TFTipoPropriedadeCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMTipoPropriedade do
  Begin
    QTipoPropriedadeCons.Close;
    QTipoPropriedadeCons.SetVariable('DESC_TIPO_PROPRIEDADE',Trim(METexto.Text));
    QTipoPropriedadeCons.Open;
  End;
end;

end.
