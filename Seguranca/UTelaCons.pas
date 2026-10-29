unit UTelaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, Menus, Variants;

type
  TFTelaCons = class(TFTConsulta)
    MEDescricao: TMaskEdit;
    Label2: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure METextoChange(Sender: TObject);
    procedure MEDescricaoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTelaCons: TFTelaCons;

implementation

uses UTela_cl;

{$R *.DFM}

procedure TFTelaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMTela do
  Begin
    QTelaCons.Close;
    if trim(METexto.Text) <> '' then
      QTelaCons.SetVariable('TELA',UpperCase(METexto.Text))
    else
      QTelaCons.SetVariable('TELA', NULL);

    if trim(MEDescricao.Text) <> '' then
      QTelaCons.SetVariable('NOME',UpperCase(MEDescricao.Text))
    else
      QTelaCons.SetVariable('NOME',NULL);
    QTelaCons.Open;
  End;
end;

procedure TFTelaCons.METextoChange(Sender: TObject);
begin
  inherited;
  BtProcurarClick(Self);
end;

procedure TFTelaCons.MEDescricaoChange(Sender: TObject);
begin
  inherited;
  BtProcurarClick(Self);
end;

end.
