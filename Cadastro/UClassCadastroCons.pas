unit UClassCadastroCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db;

type
  TFClassCadastroCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClassCadastroCons: TFClassCadastroCons;

implementation

uses UClassCadastro_cl;

{$R *.DFM}

procedure TFClassCadastroCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMClassCadastro do
  Begin
    QClassCadastroCons.Close;
    QClassCadastroCons.SetVariable('DESC_CLASSIFICAO',METexto.Text);
    QClassCadastroCons.Open;
  End;
end;

end.
