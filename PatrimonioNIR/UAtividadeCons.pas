unit UAtividadeCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Variants, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFAtividadeCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtividadeCons: TFAtividadeCons;

implementation

uses UAtividade_cl;

{$R *.DFM}

procedure TFAtividadeCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMAtividade do
  Begin
    QAtividadeCons.Close;
    If Trim(METexto.Text) = '' then
      QAtividadeCons.SetVariable('DESCRICAO',Null)
    Else
      QAtividadeCons.SetVariable('DESCRICAO',METexto.Text);
    QAtividadeCons.Open;
  End;
end;

end.
