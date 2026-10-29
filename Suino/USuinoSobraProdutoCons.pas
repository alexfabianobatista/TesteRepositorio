unit USuinoSobraProdutoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  UFmProduto;

type
  TFSuinoSobraProdutoCons = class(TFTConsulta)
    FmProduto: TFmProduto;
    Label2: TLabel;
    Label3: TLabel;
    MeDataIni: TMaskEdit;
    MeDataFin: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSuinoSobraProdutoCons: TFSuinoSobraProdutoCons;

implementation

uses USuino_cl, UBiblioteca;

{$R *.dfm}

procedure TFSuinoSobraProdutoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmSuino.QSobraCons.Close;
  if Trim(FmProduto.MeProduto.Text) = '' then
    DmSuino.QSobraCons.SetVariable('COD_PRODUTO', Null)
  else
    DmSuino.QSobraCons.SetVariable('COD_PRODUTO', Trim(FmProduto.MeProduto.Text));
  DmSuino.QSobraCons.SetVariable('DT_SOBRA_INI', MeDataIni.Text);
  DmSuino.QSobraCons.SetVariable('DT_SOBRA_FIN', MeDataFin.Text);
  DmSuino.QSobraCons.Open;
end;

procedure TFSuinoSobraProdutoCons.FormCreate(Sender: TObject);
var wDataIni, wDataFin: TDate;
begin
  inherited;
  Bib.PriUltDataVar(wDataIni, wDataFin, True);
  MeDataIni.Text := FormatDateTime('dd/mm/yyyy', wDataIni);
  MeDataFin.Text := FormatDateTime('dd/mm/yyyy', wDataFin);
end;

end.
