unit URFerramentasCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFRFerramentasCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRFerramentasCons: TFRFerramentasCons;

implementation

uses UFerramenta_cl;

{$R *.DFM}

procedure TFRFerramentasCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMFerramenta do
  Begin
    QFerramentaCons.close;
    if Trim(METexto.Text) = '' then
      QFerramentaCons.SetVariable('FERRAMENTA',Null)
    Else
      QFerramentaCons.SetVariable('FERRAMENTA',Trim(METexto.Text));
    QFerramentaCons.Open;
  End;

end;

end.
