unit UPenhorCedular_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMPenhorCedular = class(TDataModule)
    QPenhorCedularCad: TOracleDataSet1;
    QPenhorCedularCadCOD_PENHOR_CEDULAR: TIntegerField;
    QPenhorCedularCadCOD_CADASTRO: TIntegerField;
    QPenhorCedularCadCOD_PRODUTO: TIntegerField;
    QPenhorCedularCadCOD_FILIAL: TIntegerField;
    QPenhorCedularCadQT_QUANTIDADE: TFloatField;
    QPenhorCedularCadIND_SITUACAO: TStringField;
    QPenhorCedularCadCOD_BANCO_AGENCIA: TIntegerField;
    QPenhorCedularCadDT_ANO_SAFRA: TStringField;
    QPenhorCedularCons: TOracleDataSet1;
    QPenhorCedularConsCOD_PENHOR_CEDULAR: TIntegerField;
    QPenhorCedularConsCOD_CADASTRO: TIntegerField;
    QPenhorCedularConsCOD_PRODUTO: TIntegerField;
    QPenhorCedularConsCOD_FILIAL: TIntegerField;
    QPenhorCedularConsQT_QUANTIDADE: TFloatField;
    QPenhorCedularConsIND_SITUACAO: TStringField;
    QPenhorCedularConsDT_ANO_SAFRA: TStringField;
    QPenhorCedularConsCOD_BANCO_AGENCIA: TIntegerField;
    QPenhorCedularCadNUM_PENHOR_CEDULAR: TIntegerField;
    QPenhorCedularCadDT_EMISSAO: TDateTimeField;
    QPenhorCedularConsOld: TOracleDataSet1;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField1: TStringField;
    FloatField1: TFloatField;
    StringField2: TStringField;
    QRPenhorCedular: TOracleDataSet1;
    QRPenhorCedularNUM_PENHOR_CEDULAR: TIntegerField;
    QRPenhorCedularCOD_CADASTRO: TIntegerField;
    QRPenhorCedularNOME: TStringField;
    QRPenhorCedularDESC_PRODUTO: TStringField;
    QRPenhorCedularDT_ANO_SAFRA: TStringField;
    QRPenhorCedularQT_QUANTIDADE: TFloatField;
    QRPenhorCedularIND_SITUACAO: TStringField;
    QRPenhorCedularCOD_E_NOME: TStringField;
    QRPenhorCedularCOD_FILIAL: TIntegerField;
    QPenhorCedularBaixa: TOracleDataSet1;
    QPenhorCedularBaixaCOD_PENHOR_CEDULAR_BAIXA: TIntegerField;
    QPenhorCedularBaixaCOD_PENHOR_CEDULAR: TIntegerField;
    QPenhorCedularBaixaQT_QUANTIDADE_BAIXA: TFloatField;
    QPenhorCedularBaixaDT_BAIXA: TDateTimeField;
    QPenhorCedularCadQT_QUANTIDADE_BAIXADO: TFloatField;
    QPenhorCedularCadDESC_INSTRUMENTO_CREDITO: TStringField;
    QPenhorCedularCadNUM_INSTRUMENTO_CREDITO: TStringField;
    QPenhorCedularCadDT_EMISSAO_INSTRUMENTO: TDateTimeField;
    QPenhorCedularCadCOD_CDA: TIntegerField;
    QPenhorCedularConsNUM_PENHOR_CEDULAR: TIntegerField;
    QPenhorCedularConsDT_EMISSAO: TDateTimeField;
    QPenhorCedularCadDESC_AGENCIA: TStringField;
    QPenhorCedularCadCOD_CADASTRO_PARCEIRO: TIntegerField;
    QPenhorCedularCadCOD_FIEL_DEPOSITARIO: TIntegerField;
    QPenhorCedularCadendereco: TStringField;
    QPenhorCedularCadcidade: TStringField;
    QPenhorCedularCadestado: TStringField;
    QPenhorCedularCadbairro: TStringField;
    QPenhorCedularCadCOD_LOTE_TIPO: TIntegerField;
    QPenhor_Cedular_Doc: TOracleDataSet;
    QPenhor_Cedular_DocCOD_PENHOR_CEDULAR_DOC: TIntegerField;
    QPenhor_Cedular_DocNOME_ARQUIVO: TStringField;
    QPenhor_Cedular_DocDT_INCLUSAO: TDateTimeField;
    QPenhor_Cedular_DocDESCRICAO: TStringField;
    QPenhor_Cedular_DocARQUIVO: TBlobField;
    QPenhor_Cedular_DocCOD_PENHOR_CEDULAR: TIntegerField;
    procedure QPenhorCedularCadBeforePost(DataSet: TDataSet);
    procedure QPenhorCedularCadAfterPost(DataSet: TDataSet);
    procedure QPenhorCedularBaixaAfterInsert(DataSet: TDataSet);
    procedure QPenhorCedularCadAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPenhorCedular: TDMPenhorCedular;

implementation

uses UOracle_cl, USequencia_cl;

{$R *.DFM}

procedure TDMPenhorCedular.QPenhorCedularCadBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QPenhorCedularCadCOD_FILIAL.Text);
  if (QPenhorCedularCad.State = dsInsert) And (QPenhorCedularCadNum_Penhor_Cedular.Text = '') then
     QPenhorCedularCadNum_Penhor_Cedular.Value:=DMSequencia.Sequencia(Trunc(QPenhorCedularCadCOD_FILIAL.VALUE),'PENHOR_CEDULAR');
end;

procedure TDMPenhorCedular.QPenhorCedularCadAfterPost(DataSet: TDataSet);
Var wCodigo : Integer;
begin
  wCodigo := QPenhorCedularCadCod_Penhor_Cedular.Value;
  QPenhorCedularCad.Close;
  QPenhorCedularCad.SetVariable('PK',wCodigo);
  QPenhorCedularCad.Open;
end;

procedure TDMPenhorCedular.QPenhorCedularBaixaAfterInsert(
  DataSet: TDataSet);
begin
  QPenhorCedularBaixaDT_BAIXA.Value := date;
end;

procedure TDMPenhorCedular.QPenhorCedularCadAfterInsert(DataSet: TDataSet);
begin
  DMPenhorCedular.QPenhorCedularCadIND_SITUACAO.Value := 'ABERTO';
end;

end.
