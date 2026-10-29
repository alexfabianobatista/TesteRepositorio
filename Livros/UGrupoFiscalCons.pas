unit UGrupoFiscalCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus;

type
  TFGrupoFiscalCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrupoFiscalCons: TFGrupoFiscalCons;

implementation

uses UGrupoFiscal_cl;

{$R *.DFM}

procedure TFGrupoFiscalCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMGrupoFiscal.QGrupoFiscalCons.close;
  DMGrupoFiscal.QGrupoFiscalCons.SetVariable('DESC_GRUPO_FISCAL', METexto.text);
  DMGrupoFiscal.QGrupoFiscalCons.open;
end;

end.
