unit UNotaItensCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus,
  DBCtrls;

type
  TFNotaItensCons = class(TFTConsulta)
    Label2: TLabel;
    MeVendedor: TMaskEdit;
    Label3: TLabel;
    MePagto: TMaskEdit;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaItensCons: TFNotaItensCons;

implementation

uses UNotaSaida_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFNotaItensCons.FormActivate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CEIFAGRIL' then
    FNotaItensCons.DBGrid1.Columns[1].Visible := True;
end;

end.
