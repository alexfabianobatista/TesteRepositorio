unit UFGrupo_CustosCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Variants, Menus;

type
  TFGrupo_CustosCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrupo_CustosCons: TFGrupo_CustosCons;

implementation

uses UGrupo_cl;


{$R *.DFM}

procedure TFGrupo_CustosCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
    with DMGrupo do
    begin
      QGrupo_CustoCons.Close;
      if Trim(METexto.Text) <> '' then
         QGrupo_CustoCons.SetVariable('DESC_GRUPO',Trim(METexto.Text))
      else
         QGrupo_CustoCons.SetVariable('DESC_GRUPO',Null);

      QGrupo_CustoCons.Open;
    end;
end;

end.
