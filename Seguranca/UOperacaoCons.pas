unit UOperacaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, Db;

type
  TFOperacaoCons = class(TFTConsulta)
    RGTipoOperacao: TRadioGroup;
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
{  With DMOperacao do
  Begin
    QOperacaoCons.Close;
    QOperacaoCons.ParamByName('DESC_OPERACAO').AsString := METexto.Text;
    If RGTipoOperacao.ItemIndex = 0 then
      QOperacaoCons.ParamByName('TIPO_OPERACAO').AsString := 'E'
    Else
      QOperacaoCons.ParamByName('TIPO_OPERACAO').AsString := 'S';
    QOperacaoCons.Open;
  End; }
end;

end.

