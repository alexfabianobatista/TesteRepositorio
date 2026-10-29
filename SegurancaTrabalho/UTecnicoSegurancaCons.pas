unit UTecnicoSegurancaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFTecnicoSegurancaCons = class(TFTConsulta)
    MEFilial: TMaskEdit;
    Label2: TLabel;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTecnicoSegurancaCons: TFTecnicoSegurancaCons;

implementation

uses UTecnicoSeguranca_cl, UFilialCons, UFilial_cl;

{$R *.DFM}

procedure TFTecnicoSegurancaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  try
    with DMTecnicoSeguranca do
    begin
      QTecnicoSegCons.Close;
      if Trim(MEFilial.Text) = '' then
      QTecnicoSegCons.SetVariable('FILIAL',Null)
      else
      QTecnicoSegCons.SetVariable('FILIAL',Trim(MEFilial.Text));
      if Trim(METexto.Text) = '' then
      QTecnicoSegCons.SetVariable('DESC_NOME',Null)
      else
      QTecnicoSegCons.SetVariable('DESC_NOME',Trim(METexto.Text));

      QTecnicoSegCons.Open;
    end;
  except
    Raise Exception.Create('Não foi possível realizar a Consulta');
  end;

end;

end.
