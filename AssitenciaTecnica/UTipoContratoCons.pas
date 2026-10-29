unit UTipoContratoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFTipoContratoCons = class(TFTConsulta)
    lblValorMensal: TLabel;
    MeValorMensal: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoContratoCons: TFTipoContratoCons;

implementation

uses UTipoContrato_cl;

{$R *.dfm}

procedure TFTipoContratoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DSConsulta.DataSet.Close;

  with DMTipoContrato do
  begin
    if Trim(METexto.Text) <> '' then
      QTipoContratoCons.SetVariable('DESCRICAO', Trim(METexto.Text))
    else
      QTipoContratoCons.SetVariable('DESCRICAO', 'A');

    if Trim(MeValorMensal.Text) <> '' then
      QTipoContratoCons.SetVariable('VALOR', Trim(MeValorMensal.Text))
    else
      QTipoContratoCons.SetVariable('VALOR', Null);
  end;

  DSConsulta.DataSet.Open;
end;

end.
