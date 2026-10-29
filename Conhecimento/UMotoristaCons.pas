unit UMotoristaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFMotoristaCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMotoristaCons: TFMotoristaCons;

implementation

uses UMotorista_cl;

{$R *.DFM}

procedure TFMotoristaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMMotorista do
  Begin
     QMotoristaCons.close;
     if MEtexto.text = '' then
        QMotoristaCons.setvariable('Descricao',Null)
     else
        QMotoristaCons.setvariable('Descricao',MEtexto.text);
     QMotoristaCons.open;
  end;
end;

end.
