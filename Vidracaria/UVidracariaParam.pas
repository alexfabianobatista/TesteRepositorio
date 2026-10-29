unit UVidracariaParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask,
  UFmDatas, UFmLote, UFmProduto;

type
  TFVidracariaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    CbSetor1: TComboBox;
    MeDataIni1: TMaskEdit;
    MeHoraIni1: TMaskEdit;
    Label3: TLabel;
    MeDataFin1: TMaskEdit;
    MeHoraFin1: TMaskEdit;
    Label2: TLabel;
    TabSheet2: TTabSheet;
    GB2Periodo: TGroupBox;
    Label53: TLabel;
    Label56: TLabel;
    Me2DtInicial: TMaskEdit;
    Me2DtFinal: TMaskEdit;
    CBSetor2: TComboBox;
    Label4: TLabel;
    TabSheet3: TTabSheet;
    Fm2Lote: TFmLote;
    Fm2Produto: TFmProduto;
    procedure TabSheet1Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVidracariaParam: TFVidracariaParam;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TFVidracariaParam.TabSheet1Show(Sender: TObject);
begin
  inherited;
  MeHoraIni1.Text := '08:00';
  MeDataIni1.Text := FormatDateTime('dd/mm/yyyy', DMOracle.DataServ);
  MeHoraFin1.Text := '18:00';
  MeDataFin1.Text := FormatDateTime('dd/mm/yyyy', DMOracle.DataServ);
end;

end.

