unit UPrevisaoColheitaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, StdCtrls, Db, Grids, DBGrids, Mask, Buttons;

type
  TFPrevisaoColheitaCons = class(TFTConsulta)
    MESafra: TMaskEdit;
    Label2: TLabel;
    EDProduto: TEdit;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrevisaoColheitaCons: TFPrevisaoColheitaCons;

implementation

uses UPrevisaoColheita_cl;

{$R *.DFM}

procedure TFPrevisaoColheitaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPrevisaoColheita do
  Begin
    QPrevisaoColheitaCons.Close;
    if Trim(MESafra.Text) <> '' then
      QPrevisaoColheitaCons.SetVariable('COD_PLANTIO_SAFRA',Trim(MESafra.Text));
    if Trim(EDProduto.Text) <> '' then
      QPrevisaoColheitaCons.SetVariable('COD_PRODUTO',Trim(EDProduto.Text));
    QPrevisaoColheitaCons.Open;
  end;
end;

end.
