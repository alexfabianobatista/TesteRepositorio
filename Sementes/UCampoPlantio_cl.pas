unit UCampoPlantio_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMCampoPlantio = class(TDataModule)
    QCampoPlantio: TOracleDataSet1;
    QCampoPlantiodesc_plantio_safra: TStringField;
    QCampoPlantiodesc_cooperante: TStringField;
    QCampoPlantiodesc_cultivar: TStringField;
    QRRelacaoCampos: TOracleDataSet1;
    QCampoPlantiodesc_filial: TStringField;
    QCampoPlantioCons: TOracleDataSet1;
    QCampoPlantioItem: TOracleDataSet1;
    QCampoPlantioCOD_CAMPO_PLANTIO_CAB: TIntegerField;
    QCampoPlantioCOD_PLANTIO_SAFRA: TIntegerField;
    QCampoPlantioCOD_CADASTRO: TIntegerField;
    QCampoPlantioNUM_AREA: TFloatField;
    QCampoPlantioItemCOD_CAMPO_PLANTIO_ITEM: TIntegerField;
    QCampoPlantioItemCOD_CAMPO_PLANTIO_CAB: TIntegerField;
    QCampoPlantioItemNUM_NOTA: TIntegerField;
    QCampoPlantioItemQT_QUANTIDADE: TFloatField;
    QCampoPlantioItemDESC_EMISSOR_CERTIFICADO: TStringField;
    QCampoPlantioItemDESC_EMISSOR_NOTA: TStringField;
    QCampoPlantioItemNUM_CERTIFICADO: TStringField;
    DSCampoPlantioItem: TDataSource;
    QCampoPlantioCOD_FILIAL: TIntegerField;
    QCampoPlantioConsCOD_CAMPO_PLANTIO_CAB: TIntegerField;
    QCampoPlantioConsDESC_SAFRA: TStringField;
    QCampoPlantioConsDESC_CULTURA: TStringField;
    QCampoPlantioConsDESC_FILIAL: TStringField;
    QCampoPlantioConsNOME: TStringField;
    QCampoPlantioConsDESC_CLASSE_PLANTIO: TStringField;
    QCampoPlantioConsDESC_COMPLEMENTO_2: TStringField;
    QCampoPlantioCOD_PRODUTO: TFloatField;
    QCampoPlantioNUM_AREA_CALCULADA: TFloatField;
    QCampoPlantioItemnum_area_calculada: TFloatField;
    QCampoPlantioDT_CANCELAMENTO: TDateTimeField;
    QCampoPlantioDESC_MOTIVO: TStringField;
    QCampoPlantioNUM_CAMPO_PLANTIO: TIntegerField;
    QNum_Campo: TOracleDataSet1;
    QNum_CampoNUM_CAMPO: TFloatField;
    QCampoPlantioItemdesc_produto: TStringField;
    QCampoPlantioItemnum_campo: TStringField;
    QCampoPlantioConsNUM_CAMPO_PLANTIO: TIntegerField;
    QCampoPlantioDT_INICIO_PLANTIO: TDateTimeField;
    QCampoPlantioItemNUM_LOTE_SEMENTE2: TStringField;
    QCampoPlantioItemNUM_LOTE_SEMENTE: TIntegerField;
    QCampoPlantioDESC_LATITUDE: TStringField;
    QCampoPlantioDESC_LONGITUDE: TStringField;
    QCampoPlantioItemDT_EMISSAO_NOTA: TDateTimeField;
    QCampoPlantioItemDESC_INSC_RENASEM: TStringField;
    QCampoPlantioItemDESC_TIPO_CULTIVAR: TStringField;
    QCampoPlantioItemDT_CULTIVAR: TDateTimeField;
    QCampoPlantioDESC_LOCALIZACAO: TMemoField;
    QRRelacaoCamposAnexo: TOracleDataSet1;
    QRRelacaoCamposAnexoNUM_AREA: TFloatField;
    QRRelacaoCamposAnexoNUM_CAMPO_PLANTIO: TIntegerField;
    QRRelacaoCamposAnexoDT_CANCELAMENTO: TDateTimeField;
    QRRelacaoCamposAnexoDESC_MOTIVO: TStringField;
    QRRelacaoCamposAnexoNUM_LOTE_SEMENTE2: TStringField;
    QRRelacaoCamposAnexoQT_QUANTIDADE: TFloatField;
    QRRelacaoCamposAnexoNUM_NOTA: TIntegerField;
    QRRelacaoCamposAnexoDT_EMISSAO_NOTA: TDateTimeField;
    QRRelacaoCamposAnexoDESC_INSC_RENASEM: TStringField;
    QRRelacaoCamposAnexoNUM_ATESTADO: TStringField;
    QRRelacaoCamposAnexoNUM_CERTIFICADO: TStringField;
    QRRelacaoCamposAnexoNUM_TERMO: TStringField;
    QRRelacaoCamposAnexoDT_ATESTADO: TDateTimeField;
    QRRelacaoCamposAnexoDT_CERTIFICADO: TDateTimeField;
    QRRelacaoCamposAnexoDT_TERMO: TDateTimeField;
    QRRelacaoCamposAnexoDESC_COMPLEMENTO_2: TStringField;
    QRRelacaoCamposAnexoDESC_SAFRA: TStringField;
    QRRelacaoCamposAnexoDESC_CLASSE_PLANTIO: TStringField;
    QRRelacaoCamposAnexoDESC_CULTURA: TStringField;
    QRLocalizacaoCampos: TOracleDataSet1;
    QRLocalizacaoCamposNUM_AREA: TFloatField;
    QRLocalizacaoCamposCOD_CAMPO_PLANTIO_CAB: TIntegerField;
    QRLocalizacaoCamposNUM_CAMPO_PLANTIO: TIntegerField;
    QRLocalizacaoCamposDT_CANCELAMENTO: TDateTimeField;
    QRLocalizacaoCamposDESC_MOTIVO: TStringField;
    QRLocalizacaoCamposDESC_COMPLEMENTO_2: TStringField;
    QRLocalizacaoCamposDESC_LOCALIZACAO: TMemoField;
    QRLocalizacaoCamposNOME: TStringField;
    QRRelacaoCamposNUM_AREA: TFloatField;
    QRRelacaoCamposNUM_CAMPO_PLANTIO: TIntegerField;
    QRRelacaoCamposDT_CANCELAMENTO: TDateTimeField;
    QRRelacaoCamposDESC_LONGITUDE: TStringField;
    QRRelacaoCamposDESC_LATITUDE: TStringField;
    QRRelacaoCamposDT_INICIO_PLANTIO: TDateTimeField;
    QRRelacaoCamposDESC_MOTIVO: TStringField;
    QRRelacaoCamposDESC_COMPLEMENTO_2: TStringField;
    QRRelacaoCamposNOME: TStringField;
    QRRelacaoCamposDESC_ENDERECO: TStringField;
    QRRelacaoCamposDESC_CIDADE: TStringField;
    QRRelacaoCamposDESC_SAFRA: TStringField;
    QRRelacaoCamposDESC_CLASSE_PLANTIO: TStringField;
    QRRelacaoCamposDESC_FILIAL: TStringField;
    QRRelacaoCamposDESC_CIDADE_FILIAL: TStringField;
    QRRelacaoCamposCOD_CREDENCIAL_SEAB: TIntegerField;
    QRRelacaoCamposDESC_CULTURA: TStringField;
    QRRelacaoCamposDESC_EMPRESA: TStringField;
    QCampoPlantioQT_ESTIMATIVA_INSCRITA: TFloatField;
    QCampoPlantioqt_estimativa: TFloatField;
    QRRelacaoCamposQT_ESTIMATIVA_INSCRITA: TFloatField;
    procedure QCampoPlantioCalcFields(DataSet: TDataSet);
    procedure QCampoPlantioAfterInsert(DataSet: TDataSet);
    procedure DSCampoPlantioItemStateChange(Sender: TObject);
    procedure QCampoPlantioItemAfterInsert(DataSet: TDataSet);
    procedure QCampoPlantioAfterOpen(DataSet: TDataSet);
    procedure QCampoPlantioAfterCancel(DataSet: TDataSet);
    procedure QCampoPlantioItemAfterPost(DataSet: TDataSet);
    procedure QCampoPlantioItemBeforeInsert(DataSet: TDataSet);
    procedure QCampoPlantioItemAfterDelete(DataSet: TDataSet);
    procedure QCampoPlantioItemCalcFields(DataSet: TDataSet);
    procedure QCampoPlantioqt_estimativaChange(Sender: TField);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  DMCampoPlantio: TDMCampoPlantio;

implementation

uses UOracle_cl, UCampoPlantioCad, UEstimativaMeta_cl;

{$R *.DFM}

procedure TDMCampoPlantio.QCampoPlantioCalcFields(DataSet: TDataSet);
Var wQuant : String;
begin
  if QCampoPlantioCod_Plantio_Safra.Text <>  '' then
    QCampoPlantioDesc_Plantio_safra.Value:=DMOracle.BuscaNome('SELECT DESC_SAFRA FROM TB_PLANTIO_SAFRA','TB_PLANTIO_SAFRA.COD_PLANTIO_SAFRA='+IntToStr(QCampoPlantioCod_Plantio_Safra.Value));
  if QCampoPlantioCod_Cadastro.Text <> '' then
    QCampoPlantioDesc_Cooperante.Value:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO='+IntToStr(QCampoPlantioCod_Cadastro.Value));
  if QCampoPlantioCod_Produto.Text <> '' then
    QCampoPlantioDesc_Cultivar.Value:=DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO_2 FROM TB_PRODUTO','COD_PRODUTO='+Trim(QCampoPlantioCod_Produto.Text));
  if QCampoPlantioCod_Filial.Text <> '' then
    QCampoPlantioDesc_Filial.Value:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL='+IntToStr(QCampoPlantioCod_Filial.Value));
  if (QCampoPlantioCod_Plantio_Safra.Text <>  '') And
     (QCampoPlantioCod_Produto.Text <> '') then
   Begin
     wQuant := DMOracle.BuscaNome('SELECT QT_ESTIMATIVA FROM TB_ESTIMATIVA_PRODUTO','COD_PRODUTO='+QCampoPlantioCod_Produto.Text + ' And Cod_Plantio_Safra = ' + QCampoPlantioCod_Plantio_Safra.Text);
     If wQuant <> '' Then
       QCampoPlantioQt_Estimativa.Value := QCampoPlantioNum_Area.Value * StrToFloat(wQuant);
   End;
end;

procedure TDMCampoPlantio.QCampoPlantioAfterInsert(DataSet: TDataSet);
var
  wComando:String;
begin
  QCampoPlantioItem.Close;
  QCampoPlantioItem.Open;

end;

procedure TDMCampoPlantio.DSCampoPlantioItemStateChange(Sender: TObject);
begin
  If DSCampoPlantioItem.State in [Dsinsert, DsEdit] then
  Begin
    FCampoPlantioCad.BTEmissorCertificadoCons.enabled:=True;
    FCampoPlantioCad.BTnotaCons.enabled:=True;
  End
  Else
  Begin
    FCampoPlantioCad.BTEmissorCertificadoCons.enabled:=False;
    FCampoPlantioCad.BTnotaCons.enabled:=False;
  End;
end;

procedure TDMCampoPlantio.QCampoPlantioItemAfterInsert(DataSet: TDataSet);
begin
  QCampoPlantioItemCOD_CAMPO_PLANTIO_CAB.Value:=QCampoPlantioCOD_CAMPO_PLANTIO_CAB.Value;
end;

procedure TDMCampoPlantio.QCampoPlantioAfterOpen(DataSet: TDataSet);
begin
  QCampoPlantioItem.Close;
  QCampoPlantioItem.Open;
end;

procedure TDMCampoPlantio.QCampoPlantioAfterCancel(DataSet: TDataSet);
begin
  QCampoPlantioItem.Cancel;
end;

procedure TDMCampoPlantio.QCampoPlantioItemAfterPost(DataSet: TDataSet);
begin
  {if (QCampoPlantio.State in [DSEdit])or (QCampoPlantio.State in [DSInsert])  then
   begin
     QCampoPlantioNum_Area_Calculada.Value:=FCampoPlantioCad.wNum_Area_Calculada;
     QCampoPlantio.Post;
   end
   else
   begin
     QCampoPlantio.Edit;
     QCampoPlantioNum_Area_Calculada.Value:=FCampoPlantioCad.wNum_Area_Calculada;
     QCampoPlantio.Post;
   end;}
   FCampoPlantioCad.Recalcularrea1Click(SELF);
end;

procedure TDMCampoPlantio.QCampoPlantioItemBeforeInsert(DataSet: TDataSet);
begin
  if (QCampoPlantio.State in [DSEdit]) or (QCampoPlantio.State in [DSInsert])  then
  begin
    QCampoPlantio.Post;
  end;
end;

procedure TDMCampoPlantio.QCampoPlantioItemAfterDelete(DataSet: TDataSet);
begin
  FCampoPlantioCad.Recalcularrea1Click(SELF);
end;

procedure TDMCampoPlantio.QCampoPlantioItemCalcFields(DataSet: TDataSet);
begin
  if QCampoPlantioItemCod_Campo_Plantio_Cab.Text <> '' then
    QCampoPlantioItemNum_Campo.Value:=DMOracle.BuscaNome('SELECT TB_CAMPO_PLANTIO_CAB.NUM_CAMPO_PLANTIO FROM TB_CAMPO_PLANTIO_CAB','COD_CAMPO_PLANTIO_CAB = '+IntToStr(QCampoPlantioItemCod_Campo_Plantio_Cab.Value));
   if QCampoPlantioItemNum_Lote_semente.Text <> '' then
    QCampoPlantioItemNum_Lote_Semente2.text:=QCampoPlantioItemNum_Lote_Semente.Text;
end;
procedure TDMCampoPlantio.QCampoPlantioqt_estimativaChange(Sender: TField);
Var wQuant : String;
begin
  If QCampoPlantioQt_Estimativa_Inscrita.Text = '' Then
  Begin
    if (QCampoPlantioCod_Plantio_Safra.Text <>  '') And
       (QCampoPlantioCod_Produto.Text <> '') then
     Begin
       wQuant := DMOracle.BuscaNome('SELECT QT_ESTIMATIVA FROM TB_ESTIMATIVA_PRODUTO','COD_PRODUTO='+QCampoPlantioCod_Produto.Text + ' And Cod_Plantio_Safra = ' + QCampoPlantioCod_Plantio_Safra.Text);
       If wQuant <> '' Then
         QCampoPlantioQt_Estimativa_Inscrita.Value := QCampoPlantioNum_Area.Value * StrToFloat(wQuant);
     End;
  End;   
end;

end.
