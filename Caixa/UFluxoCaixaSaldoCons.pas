unit UFluxoCaixaSaldoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFFluxoCaixaSaldoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFluxoCaixaSaldoCons: TFFluxoCaixaSaldoCons;

implementation

uses UFluxoCaixa_cl;

{$R *.DFM}

procedure TFFluxoCaixaSaldoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMFluxoCaixa Do
  Begin
    QFluxoCaixaSaldoCons.Close;
    If Trim(MeTexto.Text) <> '' Then
       QFluxoCaixaSaldoCons.SetVariable('DT_REFERENCIA',StrToDate(Trim(MeTexto.Text)))
    else
       Raise Exception.Create('Preencher data inicial para referencia');
    QFluxoCaixaSaldoCons.Open;
  End
end;

end.
