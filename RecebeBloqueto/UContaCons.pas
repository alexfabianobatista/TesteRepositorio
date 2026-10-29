unit UContaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFContaCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContaCons: TFContaCons;

implementation

uses UConta_cl;

{$R *.DFM}

procedure TFContaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMConta do
  Begin
    QContaCons.close;
    If(Trim(MeTexto.Text)<>'')Then
      QContaCons.ParamByName('DESC_BANCO').AsString := Trim(MeTexto.Text)
    Else
      QContaCons.ParamByName('DESC_BANCO').AsString := '';
    QContaCons.Open;
  End;
end;

end.
