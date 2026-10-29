unit UpatrimonioCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFPatrimonioCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPatrimonioCons: TFPatrimonioCons;

implementation

uses Upatrimonio_cl;

{$R *.DFM}

procedure TFPatrimonioCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPatrimonio do
  Begin
    QPatrimonio_Cons.Close;
    If Trim(METexto.Text) = '' then
      QPatrimonio_Cons.SetVariable('DESCRICAO',Null)
    Else
      QPatrimonio_Cons.SetVariable('DESCRICAO',METexto.Text);
    QPatrimonio_Cons.SetVariable('COD_PAT', Null);
    QPatrimonio_Cons.Open;
  End;

end;

end.
