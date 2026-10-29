unit UFFuncionarioCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons,variants;

type
  TFFuncionarioCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFuncionarioCons: TFFuncionarioCons;

implementation

uses UFuncionario_cl;

{$R *.DFM}

procedure TFFuncionarioCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMFuncionario do
  Begin
    QFuncionarioCons.Close;
    If Trim(METexto.Text) = '' then
      QFuncionarioCons.SetVariable('DESCRICAO',Null)
    Else
      QFuncionarioCons.SetVariable('DESCRICAO',METexto.Text);
    QFuncionarioCons.Open;
  End;
end;

end.
