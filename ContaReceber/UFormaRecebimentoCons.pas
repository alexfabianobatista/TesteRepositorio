unit UFormaRecebimentoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFFormaRecebimentoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFormaRecebimentoCons: TFFormaRecebimentoCons;

implementation

uses UFormaRecebimento_cl;

{$R *.dfm}

procedure TFFormaRecebimentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
    DmFormaRecebimento.QFormaRecebimentoCons.Close;
    DmFormaRecebimento.QFormaRecebimentoCons.SetVariable('DESC_FORMA_RECEBIMENTO', Trim(METexto.Text));
    DmFormaRecebimento.QFormaRecebimentoCons.Open;
end;

procedure TFFormaRecebimentoCons.FormCreate(Sender: TObject);
begin
  inherited;
  DSConsulta.DataSet := DmFormaRecebimento.QFormaRecebimentoCons;
end;

end.
