unit UTipoProdCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, variants, Menus;

type
  TFTipoProdCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoProdCons: TFTipoProdCons;

implementation

uses UProduto_cl;

{$R *.DFM}

procedure TFTipoProdCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMProduto do
  Begin
    QTipoProdCons.Close;
    If Trim(METexto.Text)<>'' then
       QTipoProdCons.SetVariable('TIPO_PROD',METexto.Text)
    Else
        QTipoProdCons.SetVariable('TIPO_PROD',Null);
    QTipoProdCons.Open;
  End;
end;

end.
