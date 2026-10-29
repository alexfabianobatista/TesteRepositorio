unit UFiltroRelContaCorrente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTFiltroRelatorio, DB, DBClient, Provider, ImgList, StdCtrls,
  Buttons, Grids, DBGrids, DBCtrls;

type
  TFFiltroRelContaCorrente = class(TFTFiltroRelatorio)
    CDSFiltroRelatorioCOD_NOTA_CAB: TIntegerField;
    CDSFiltroRelatorioDT_EMISSAO: TDateTimeField;
    CDSFiltroRelatorioNUM_NOTA: TIntegerField;
    CDSFiltroRelatorioCOD_SERIE: TStringField;
    CDSFiltroRelatorioCOD_CADASTRO: TIntegerField;
    CDSFiltroRelatorioNOME_CADASTRO: TStringField;
    CDSFiltroRelatorioVal_Total: TFloatField;
    CDSFiltroRelatorioVAL_AVISTA: TFloatField;
    CDSFiltroRelatorioNOME_VENDEDOR: TStringField;
    CDSFiltroRelatorioVAL_TOTAL_ITENS: TFloatField;
    procedure CDSFiltroRelatorioCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFiltroRelContaCorrente: TFFiltroRelContaCorrente;

implementation

uses URelatorioVenda_cl, UBiblioteca;

{$R *.dfm}

procedure TFFiltroRelContaCorrente.CDSFiltroRelatorioCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  CDSFiltroRelatorioVAL_SELECIONADO.Value := Bib.ift(CDSFiltroRelatorioIND_SELECIONADO.Value = 'S',
    CDSFiltroRelatorioVal_Total.Value, 0);
end;

end.
