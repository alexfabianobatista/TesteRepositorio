unit UOS_TipoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFOFI0008 = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOFI0008: TFOFI0008;

implementation

uses UOficina_cl;

{$R *.DFM}

procedure TFOFI0008.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMOficina do
  begin
    QOS_TipoCons.Close;
    if Trim(METexto.Text) = '' then
       QOS_TipoCons.SetVariable('DESC_OS_TIPO',Null)
    else
       QOS_TipoCons.SetVariable('DESC_OS_TIPO',METexto.Text+'%');
    QOS_TipoCons.Open;
  end;
end;

end.
