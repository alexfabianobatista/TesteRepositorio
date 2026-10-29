unit UProcedimentoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, VARIANTS;

type
  TFProcedimentoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProcedimentoCons: TFProcedimentoCons;

implementation

uses UProcedimento_cl;

{$R *.DFM}

procedure TFProcedimentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
   With DMProcedimento do
  Begin
    QProcedimentoCons.Close;
    If Trim(METexto.Text) = '' then
      QProcedimentoCons.SetVariable('DESCRICAO',Null)
    Else
      QProcedimentoCons.SetVariable('DESCRICAO',METexto.Text);
    QProcedimentoCons.Open;
  End;
end;

end.
