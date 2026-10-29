unit UPlantioSafra_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMPlantioSafra = class(TDataModule)
    QPlantioSafra: TOracleDataSet1;
    QPlantioSafradesc_classe: TStringField;
    QPlantioSafraCOD_PLANTIO_SAFRA: TIntegerField;
    QPlantioSafraDESC_SAFRA: TStringField;
    QPlantioSafraCOD_CLASSE_PLANTIO: TIntegerField;
    QPlantioSafraCOD_CULTURA: TIntegerField;
    QPlantioSafradesc_cultura: TStringField;
    QPlantioSafraCons: TOracleDataSet1;
    QPlantioSafraConsDESC_SAFRA: TStringField;
    QPlantioSafraConsDESC_CLASSE_PLANTIO: TStringField;
    QPlantioSafraConsDESC_CULTURA: TStringField;
    QPlantioSafraConsCOD_PLANTIO_SAFRA: TIntegerField;
    QRPlantioSafra: TOracleDataSet1;
    QRPlantioSafraCOD_PLANTIO_SAFRA: TIntegerField;
    QRPlantioSafraDESC_SAFRA: TStringField;
    QRPlantioSafraDESC_CLASSE_PLANTIO: TStringField;
    QRPlantioSafraDESC_CULTURA: TStringField;
    QPlantioSafraCOD_FILIAL: TIntegerField;
    QPlantioSafradesc_filial: TStringField;
    procedure QPlantioSafraCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPlantioSafra: TDMPlantioSafra;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMPlantioSafra.QPlantioSafraCalcFields(DataSet: TDataSet);
begin
   if QPlantioSafraCod_Classe_Plantio.Text <> '' then
     QPlantioSafradesc_classe.Value:=DMOracle.BuscaNome('SELECT DESC_CLASSE_PLANTIO FROM TB_CLASSE_PLANTIO','COD_CLASSE_PLANTIO= '+IntToStr(QPlantioSafraCod_Classe_Plantio.Value));
   if QPlantioSafraCod_Cultura.Text <> '' then
     QPlantioSafradesc_cultura.Value:=DMOracle.BuscaNome('SELECT DESC_CULTURA FROM TB_CULTURA','COD_CULTURA= '+IntToStr(QPlantioSafraCod_Cultura.Value));
   if QPlantioSafraCod_Filial.Text <> '' then
     QPlantioSafraDesc_Filial.Value:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+IntToStr(QPlantioSafraCod_Filial.Value));
end;

end.
