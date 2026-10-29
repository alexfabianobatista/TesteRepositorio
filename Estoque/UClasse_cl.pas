unit UClasse_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMClasse = class(TDataModule)
    QClasseCons: TOracleDataSet1;
    QClasseConsCOD_CLASSE: TIntegerField;
    QClasseConsDESC_CLASSE: TStringField;
    QClasseConsNUM_CLASSE: TIntegerField;
    QClasseConsNUM_SUBCLASSE: TIntegerField;
    QClasse: TOracleDataSet1;
    QClasseCOD_CLASSE: TIntegerField;
    QClassePERC_COMISSAO1: TFloatField;
    QClassePERC_COMISSAO2: TFloatField;
    QClasseNUM_SUBCLASSE: TIntegerField;
    QClasseNUM_CLASSE: TIntegerField;
    QRClasse: TOracleDataSet1;
    QRClasseCOD_CLASSE: TIntegerField;
    QRClasseDESC_CLASSE: TStringField;
    QRClassePERC_COMISSAO1: TFloatField;
    QRClassePERC_COMISSAO2: TFloatField;
    QRClasseNUM_CLASSE: TIntegerField;
    QRClasseNUM_SUBCLASSE: TIntegerField;
    QClasseVerificaNumClasse: TOracleDataSet1;
    QClasseVerificaNumClasseNUM_CLASSE: TIntegerField;
    QClasseVAL_CUSTO: TFloatField;
    QClasseCOD_RAMO: TIntegerField;
    QClassedesc_ramo: TStringField;
    QClasseIND_TIPO: TStringField;
    QClasseCOD_MENSAGEM: TIntegerField;
    QClasseIND_AREA: TStringField;
    QClasseConsnomeClasse: TStringField;
    QClasseIND_SITUACAO: TStringField;
    QClasseDESC_CLASSE: TStringField;
    QClassePERC_MARGEM_VAREJO: TFloatField;
    QClassePERC_MARGEM_ATACADO: TFloatField;
    procedure QClasseBeforePost(DataSet: TDataSet);
    procedure QClasseBeforeEdit(DataSet: TDataSet);
    procedure QClasseBeforeDelete(DataSet: TDataSet);
    procedure QClasseCalcFields(DataSet: TDataSet);
    procedure QClasseConsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMClasse: TDMClasse;
  wNum_SubClasse:Real;
  wClasse:Real;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMClasse.QClasseBeforePost(DataSet: TDataSet);
begin
     QClasseVerificaNumClasse.Close;
     QClasseVerificaNumClasse.SetVariable('NUM_CLASSE',QClasseNum_Classe.Value);
     QClasseVerificaNumClasse.Open;
     if (QClasseVerificaNumClasse.IsEmpty) and (QClasseNum_SubClasse.Value<>0) then
        raise Exception.Create('Não é possível incluir esta classe. Classe '+FloatToStr(QClasseNum_Classe.Value)+' SubClasse 0 não cadastrada');
     if (QClasse.State=dsedit) and (wNum_SubClasse<>QClasseNum_SubClasse.Value) and (wNum_SubClasse=0) then
        raise Exception.Create('Não é Possível alterar o campo SubClasse quando este for zero');
     QClasseVerificaNumClasse.Close;
     QClasseVerificaNumClasse.SetVariable('NUM_CLASSE',wClasse);
     QClasseVerificaNumClasse.Open;
     if not (QClasseVerificaNumClasse.IsEmpty) and (QClasse.State=dsedit) and
            (wNum_SubClasse=0) and (QClasseNum_Classe.value<>wClasse) then
       raise Exception.Create('Não é Possível alterar o campo Classe quando a SubClasse for Zero e existirem subclasses dele.');
end;

procedure TDMClasse.QClasseBeforeEdit(DataSet: TDataSet);
begin
  wNum_SubClasse:=QClasseNum_SubClasse.Value;
  wClasse:=QClasseNum_Classe.Value;
end;

procedure TDMClasse.QClasseBeforeDelete(DataSet: TDataSet);
begin
  QClasseVerificaNumClasse.Close;
  QClasseVerificaNumClasse.SetVariable('NUM_CLASSE',QClasseNum_Classe.Value);
  QClasseVerificaNumClasse.Open;
  if (QClasseVerificaNumClasse.RecordCount>1) and (wNum_SubClasse=0) then
     raise Exception.create('Não é possível excluir esta Classe, pois ainda existem subclasse inferiores dependentes.')
end;

procedure TDMClasse.QClasseCalcFields(DataSet: TDataSet);
begin
  QClassedesc_ramo.value:=DMOracle.BuscaNome('SELECT DESC_RAMO FROM TB_RAMO','COD_RAMO='+FloatToStr(QClasseCod_Ramo.value));
end;

procedure TDMClasse.QClasseConsCalcFields(DataSet: TDataSet);
begin
  if QClasseConsNUM_CLASSE.Value > 0 then
    QClasseConsnomeClasse.Value :=
      DMOracle.FastSelect('DESC_CLASSE','TB_CLASSE','NUM_SUBCLASSE = 0 AND NUM_CLASSE = ' +
      QClasseConsNUM_CLASSE.Text);
end;

end.
