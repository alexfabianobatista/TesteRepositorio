unit UFPneuCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  ExtCtrls;

type
  TFPneuCons = class(TFTConsulta)
    RGSituacao: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPneuCons: TFPneuCons;

implementation

uses UPneu_cl;


{$R *.dfm}

procedure TFPneuCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMPneu do
  begin
    QPneuCons.Close;
    QPneuCons.SetVariable('DESC_DESCRICAO',Trim(METexto.Text));
    case RGSituacao.ItemIndex of
      0: QPneuCons.SetVariable('IND_SITUACAO', 'ATIVO');
      1: QPneuCons.SetVariable('IND_SITUACAO', 'DESATIVADO');
      2: QPneuCons.SetVariable('IND_SITUACAO', Null);
    end;
    QPneuCons.Open;
  end;
end;

end.
