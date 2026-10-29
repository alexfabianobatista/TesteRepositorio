unit UContaPatriLiqCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFContaPatriLiqCons = class(TFTConsulta)
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContaPatriLiqCons: TFContaPatriLiqCons;

implementation

uses UParamSistema_cl;

{$R *.dfm}

procedure TFContaPatriLiqCons.FormCreate(Sender: TObject);
begin
  inherited;
    DMParamSistema.QContaPatriLiqCons.Open;           
end;

procedure TFContaPatriLiqCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMParamSistema do
  begin
    QContaPatriLiqCons.Close;
    QContaPatriLiqCons.SetVariable('COD_PLANO_CONTA', null);
    if Trim(METexto.Text) <> '' then
      QContaPatriLiqCons.SetVariable('DESC_PLANO_CONTA', Trim(METexto.Text))
    else
      QContaPatriLiqCons.SetVariable('DESC_PLANO_CONTA', null);
    QContaPatriLiqCons.Open;
  end;
end;

end.
