unit UModuloCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus;

type
  TFModuloCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
    procedure METextoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FModuloCons: TFModuloCons;

implementation

uses UFuncao_cl;

{$R *.DFM}

procedure TFModuloCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMFuncao.QModuloCons.Close;
  DMFuncao.QModuloCons.SetVariable('nome', METexto.Text);
  DMFuncao.QModuloCons.Open;
end;

procedure TFModuloCons.METextoChange(Sender: TObject);
begin
  inherited;
  BtProcurarClick(Self);
end;

end.
