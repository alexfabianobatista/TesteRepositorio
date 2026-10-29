unit UMaquinaRev_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMMaquinaRev = class(TDataModule)
    QMaquinaRevCab: TOracleDataSet1;
    QMaquinaRevCabCOD_MAQUINA_REV_CAB: TIntegerField;
    QMaquinaRevCabCOD_OBRA: TIntegerField;
    QMaquinaRevCabCOD_CADASTRO: TIntegerField;
    QMaquinaRevCabDT_REVISAO: TDateTimeField;
    QMaquinaRevItem: TOracleDataSet1;
    QMaquinaRevItemCOD_MAQUINA_REV_ITEM: TIntegerField;
    QMaquinaRevItemCOD_MAQUINA_REV_CAB: TIntegerField;
    QMaquinaRevItemDESC_ITEM: TStringField;
    QMaquinaRevItemCOMPLEMENTO: TStringField;
    QMaquinaRevCabdesc_obra: TStringField;
    QMaquinaRevCabnome: TStringField;
    DSItem: TDataSource;
    QMaquinaRevCons: TOracleDataSet1;
    QMaquinaRevConsCOD_MAQUINA_REV_CAB: TIntegerField;
    QMaquinaRevConsDT_REVISAO: TDateTimeField;
    QMaquinaRevConsCOD_OBRA: TIntegerField;
    QMaquinaRevConsDESC_OBRA: TStringField;
    QMaquinaRevConsCOD_CADASTRO: TIntegerField;
    QMaquinaRevConsNOME: TStringField;
    QRMaquinaRev: TOracleDataSet1;
    QMaquinaRevCabKM: TFloatField;
    QRMaquinaProxRev: TOracleDataSet1;
    QRMaquinaRevCOD_MAQUINA_REV_CAB: TIntegerField;
    QRMaquinaRevDT_REVISAO: TDateTimeField;
    QRMaquinaRevOBRA: TStringField;
    QRMaquinaRevCADASTRO: TStringField;
    QRMaquinaRevCOD_MAQUINA_REV_ITEM: TIntegerField;
    QRMaquinaRevDESC_ITEM: TStringField;
    QRMaquinaRevCOMPLEMENTO: TStringField;
    QRMaquinaRevFILIAL: TStringField;
    QRMaquinaRevKM_HR: TFloatField;
    QRMaquinaRevIND_KM_HR: TStringField;
    QRMaquinaProxRevCOD_OBRA: TIntegerField;
    QRMaquinaProxRevDESC_OBRA: TStringField;
    QRMaquinaProxRevVAL_MARCADOR: TFloatField;
    QRMaquinaProxRevIND_KM_HR: TStringField;
    QRMaquinaProxRevCOD_FILIAL: TIntegerField;
    QRMaquinaProxRevDESC_FILIAL: TStringField;
    QRMaquinaProxRevPROX_REVISAO: TFloatField;
    procedure QMaquinaRevCabAfterOpen(DataSet: TDataSet);
    procedure QMaquinaRevCabAfterClose(DataSet: TDataSet);
    procedure QMaquinaRevCabCalcFields(DataSet: TDataSet);
    procedure QMaquinaRevCabAfterInsert(DataSet: TDataSet);
    procedure QMaquinaRevItemAfterInsert(DataSet: TDataSet);
    procedure QMaquinaRevItemBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMaquinaRev: TDMMaquinaRev;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMMaquinaRev.QMaquinaRevCabAfterOpen(DataSet: TDataSet);
begin
  QMaquinaRevItem.close;
  QMaquinaRevItem.SetVariable('PK', QMaquinaRevCabCOD_MAQUINA_REV_CAB.value);
  QMaquinaRevItem.open;
end;

procedure TDMMaquinaRev.QMaquinaRevCabAfterClose(DataSet: TDataSet);
begin
    QMaquinaRevItem.close;
end;

procedure TDMMaquinaRev.QMaquinaRevCabCalcFields(DataSet: TDataSet);
begin
   if Trim (QMaquinaRevCabCOD_OBRA.text)<> '' then
     QMaquinaRevCabdesc_obra.text := DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA','COD_OBRA = '+QMaquinaRevCabCOD_OBRA.text)
  else
    QMaquinaRevCabdesc_obra.Text := '';
   if Trim (QMaquinaRevCabCOD_CADASTRO.text)<> '' then
     QMaquinaRevCabnome.text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+QMaquinaRevCabCOD_CADASTRO.text)
  else
    QMaquinaRevCabnome.Text := '';

end;

procedure TDMMaquinaRev.QMaquinaRevCabAfterInsert(DataSet: TDataSet);
begin
  QMaquinaRevCabDT_REVISAO.Value := Date;
end;

procedure TDMMaquinaRev.QMaquinaRevItemAfterInsert(DataSet: TDataSet);
begin
  QMaquinaRevItemCOD_MAQUINA_REV_CAB.Value := QMaquinaRevCabCOD_MAQUINA_REV_CAB.Value;
end;

procedure TDMMaquinaRev.QMaquinaRevItemBeforeInsert(DataSet: TDataSet);
begin
  if Trim(QMaquinaRevCabCOD_MAQUINA_REV_CAB.Text) = '' then
    Raise Exception.Create('Cabeçalho da Revisão não Informado');
  if QMaquinaRevCab.State in [DSInsert] then
    Raise Exception.Create('Cabeçalho da Revisão não Confirmado');
end;

end.
