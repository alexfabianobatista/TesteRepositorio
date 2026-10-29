unit URegistro60MestreCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFRegistro60MestreCons = class(TFTConsulta)
    procedure FormCreate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegistro60MestreCons: TFRegistro60MestreCons;

implementation

uses ULivroFiscal_Cl;

{$R *.dfm}

procedure TFRegistro60MestreCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DSConsulta.DataSet = nil then
    DSConsulta.DataSet := DMLivroFiscal.QTipo60MestreCons;
  METexto.Text := FormatDateTime('dd/MM/yyyy', Date);
end;

procedure TFRegistro60MestreCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMLivroFiscal do
  Begin
    QTipo60MestreCons.Close;
    QTipo60MestreCons.SetVariable('DT_EMISSAO', Trim(METexto.Text));
    QTipo60MestreCons.Open;
  End;
end;

end.
