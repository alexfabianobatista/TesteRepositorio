unit UTipoServicoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, VARIANTS;

type
  TFTipoServicoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoServicoCons: TFTipoServicoCons;

implementation

uses UTipoServico_cl;

{$R *.DFM}

procedure TFTipoServicoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMTipoServico do
  Begin
    QTipoServicoCons.Close;
    If Trim(METexto.Text) = '' then
      QTipoServicoCons.SetVariable('DESCRICAO',Null)
    Else
      QTipoServicoCons.SetVariable('DESCRICAO',METexto.Text);
    QTipoServicoCons.Open;
  end;
end;

end.
