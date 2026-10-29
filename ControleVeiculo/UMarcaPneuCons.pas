unit UMarcaPneuCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFMarcaPneuCons = class(TFTConsulta)
    procedure FormShow(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure METextoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMarcaPneuCons: TFMarcaPneuCons;

implementation

uses UMarcaPneu_cl, DateUtils;

{$R *.dfm}

procedure TFMarcaPneuCons.FormShow(Sender: TObject);
begin
  inherited;
  METexto.SetFocus;
end;

procedure TFMarcaPneuCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMMarcaPneu.QMarcaPneuCons.Close;
  DMMarcaPneu.QMarcaPneuCons.SetVariable('DESCRICAO', METexto.Text + '%');
  DMMarcaPneu.QMarcaPneuCons.Open;
end;

procedure TFMarcaPneuCons.METextoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BtProcurarClick(Sender);
end;

end.
 