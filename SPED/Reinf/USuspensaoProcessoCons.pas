unit USuspensaoProcessoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UReinf_cl, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls,
  Mask, Buttons;

type
  TFSuspensaoProcCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSuspensaoProcCons: TFSuspensaoProcCons;

implementation

{$R *.dfm}

procedure TFSuspensaoProcCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    QReinfSuspProcessoCons.Close;
    if Trim(METexto.Text) = '' then
      QReinfSuspProcessoCons.SetVariable('PK', null)
    else
      QReinfSuspProcessoCons.SetVariable('PK', Trim(METexto.Text));
    QReinfSuspProcessoCons.Open;
  end;
end;

procedure TFSuspensaoProcCons.FormCreate(Sender: TObject);
begin
  inherited;
  with DMReinf do
  begin
    QReinfSuspProcessoCons.Open;
  end;
end;

end.
