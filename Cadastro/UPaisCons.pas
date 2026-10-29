unit UPaisCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db;

type
  TFPaisCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPaisCons: TFPaisCons;

implementation

uses UPais_cl;

{$R *.DFM}

procedure TFPaisCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPais do
  Begin
    QPaisCons.Close;
    QPaisCons.SetVariable('NOME_PAIS',Trim(METexto.Text));
    QPaisCons.Open;
  End;
end;

end.
