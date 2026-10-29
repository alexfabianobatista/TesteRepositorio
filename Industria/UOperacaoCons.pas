unit UOperacaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFOperacaoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOperacaoCons: TFOperacaoCons;

implementation

uses UOperacao_cl;

{$R *.DFM}

procedure TFOperacaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMOperacao do
  Begin
    QOperacaoCons.Close;
    QOperacaoCons.SetVariable('DESC_OPERACAO',METexto.Text);
    //QOperacaoCons.SetVariable('TIPO_OPERACAO','null');
    QOperacaoCons.Open;
  End;
end;

end.
