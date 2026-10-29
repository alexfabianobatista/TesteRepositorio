unit UCentroCustoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Variants;

type
  TFCentroCustoCons = class(TFTConsulta)
    MEDescricao: TMaskEdit;
    Label2: TLabel;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCentroCustoCons: TFCentroCustoCons;

implementation

uses UCentroCusto_cl;

{$R *.DFM}

procedure TFCentroCustoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMCentroCusto.QCentroCustoCons.Close;
  If Trim(METexto.Text) <> '' then
    DMCentroCusto.QCentroCustoCons.SetVariable('COD_CENTRO_CUSTO',METexto.Text)
  else
    DMCentroCusto.QCentroCustoCons.SetVariable('COD_CENTRO_CUSTO',Null);

  If Trim(MEDescricao.Text) <> '' then
    DMCentroCusto.QCentroCustoCons.SetVariable('DESC_CENTRO_CUSTO', MEDescricao.Text)
  else
    DMCentroCusto.QCentroCustoCons.SetVariable('DESC_CENTRO_CUSTO', Null);
  DMCentroCusto.QCentroCustoCons.Open;

end;

end.
