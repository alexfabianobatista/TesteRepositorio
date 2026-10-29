unit UProducaoAgricolaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFProducaoAgricolaCons = class(TFTConsulta)
    Label2: TLabel;
    MEData: TMaskEdit;
    METurno: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    MECodigo: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProducaoAgricolaCons: TFProducaoAgricolaCons;

implementation

uses UProducaoAgricola_cl;

{$R *.DFM}

procedure TFProducaoAgricolaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DmProducaoAgricola do
  Begin
    QProducaoAgricolaCons.Close;

    if Trim(MECodigo.Text) = '' then
      QproducaoAgricolaCons.SetVariable('COD_PRODUCAO_AGRICOLA', '0')
    else
      QproducaoAgricolaCons.SetVariable('COD_PRODUCAO_AGRICOLA', Trim(MECodigo.Text));

    if Trim(MeTexto.Text) = '' then
      QProducaoAgricolaCons.SetVariable('COD_FILIAL',Null)
    else
      QProducaoAgricolaCons.SetVariable('COD_FILIAL',Trim(MeTexto.Text));

    if Trim(METurno.Text) = '' then
      QProducaoAgricolaCons.SetVariable('COD_TURNO',Null)
    else
      QProducaoAgricolaCons.SetVariable('COD_TURNO',Trim(METurno.Text));

    if Trim(MEData.Text) = '' then
      QProducaoAgricolaCons.SetVariable('DT_PRODUCAO_AGRICOLA',Null)
    else
      QProducaoAgricolaCons.SetVariable('DT_PRODUCAO_AGRICOLA',Trim(MEData.Text));

    QProducaoAgricolaCons.Open;
  End;
end;

end.
