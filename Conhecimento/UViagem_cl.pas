unit UViagem_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMViagem = class(TDataModule)
    QViagemCad: TOracleDataSet;
    QViagemCadCOD_VIAGEM: TIntegerField;
    QViagemCadDESC_PLACA: TStringField;
    QViagemCadDT_VIAGEM: TDateTimeField;
    QViagemCadDESC_VIAGEM: TStringField;
    QViagemCadVL_FRETE_IDA: TFloatField;
    QViagemCadVL_FRETE_VOLTA: TFloatField;
    QViagemCadVL_FRETE_TOTAL: TFloatField;
    QViagemCadVL_COMISSAO: TFloatField;
    QViagemCadVL_ADIANTAMENTO: TFloatField;
    QViagemCadsval_saldo_receber: TFloatField;
    QViagemCons: TOracleDataSet;
    QViagemConsCOD_VIAGEM: TIntegerField;
    QViagemConsDESC_PLACA: TStringField;
    QViagemConsDT_VIAGEM: TDateTimeField;
    QViagemConsDESC_VIAGEM: TStringField;
    QViagemConsVL_FRETE_IDA: TFloatField;
    QViagemConsVL_FRETE_VOLTA: TFloatField;
    QViagemConsVL_FRETE_TOTAL: TFloatField;
    QViagemConsVL_COMISSAO: TFloatField;
    QViagemConsVL_ADIANTAMENTO: TFloatField;
    QViagemCadCOD_FILIAL: TIntegerField;
    QViagemConsCOD_FILIAL: TIntegerField;
    QRViagem: TOracleDataSet1;
    QRViagemCOD_VIAGEM: TIntegerField;
    QRViagemDESC_PLACA: TStringField;
    QRViagemDT_VIAGEM: TDateTimeField;
    QRViagemDESC_VIAGEM: TStringField;
    QRViagemVL_FRETE_IDA: TFloatField;
    QRViagemVL_FRETE_VOLTA: TFloatField;
    QRViagemVL_FRETE_TOTAL: TFloatField;
    QRViagemVL_COMISSAO: TFloatField;
    QRViagemVL_ADIANTAMENTO: TFloatField;
    QRViagemCOD_FILIAL: TIntegerField;
    QRViagemSVL_SALDO_RECEBER: TFloatField;
    QViagemCadQT_VIAGEM: TFloatField;
    QViagemCadCOD_CADASTRO_ORIGEM: TIntegerField;
    QViagemCadCOD_CADASTRO_DESTINO: TIntegerField;
    QViagemCadCOD_MOTORISTA: TIntegerField;
    QViagemCadQT_QUANTIDADE: TIntegerField;
    QViagemCadVL_UNITARIO: TFloatField;
    QViagemCadVL_TOTAL: TFloatField;
    QViagemConsQT_VIAGEM: TFloatField;
    QViagemConsCOD_CADASTRO_ORIGEM: TIntegerField;
    QViagemConsCOD_CADASTRO_DESTINO: TIntegerField;
    QViagemConsCOD_MOTORISTA: TIntegerField;
    QViagemConsQT_QUANTIDADE: TIntegerField;
    QViagemConsVL_UNITARIO: TFloatField;
    QViagemConsVL_TOTAL: TFloatField;
    QViagemConsNOME_ORIGEM: TStringField;
    QViagemConsNOME_DESTINO: TStringField;
    QViagemConsNOME_MOTORISTA: TStringField;
    QRControleViagem: TOracleDataSet1;
    QRControleViagemCOD_VIAGEM: TIntegerField;
    QRControleViagemCOD_FILIAL: TIntegerField;
    QRControleViagemDESC_PLACA: TStringField;
    QRControleViagemDT_VIAGEM: TDateTimeField;
    QRControleViagemDESC_VIAGEM: TStringField;
    QRControleViagemVL_FRETE_IDA: TFloatField;
    QRControleViagemVL_FRETE_VOLTA: TFloatField;
    QRControleViagemVL_FRETE_TOTAL: TFloatField;
    QRControleViagemVL_COMISSAO: TFloatField;
    QRControleViagemVL_ADIANTAMENTO: TFloatField;
    QRControleViagemQT_VIAGEM: TFloatField;
    QRControleViagemCOD_CADASTRO_ORIGEM: TIntegerField;
    QRControleViagemCOD_CADASTRO_DESTINO: TIntegerField;
    QRControleViagemCOD_MOTORISTA: TIntegerField;
    QRControleViagemQT_QUANTIDADE: TIntegerField;
    QRControleViagemVL_UNITARIO: TFloatField;
    QRControleViagemVL_TOTAL: TFloatField;
    QRControleViagemNOME_ORIGEM: TStringField;
    QRControleViagemNOME_DESTINO: TStringField;
    QRControleViagemNOME_MOTORISTA: TStringField;
    procedure QViagemCadCalcFields(DataSet: TDataSet);
    procedure QViagemCadVL_UNITARIOValidate(Sender: TField);
    procedure QViagemCadQT_QUANTIDADEValidate(Sender: TField);
    procedure QViagemCadAfterInsert(DataSet: TDataSet);
    procedure QViagemCadBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMViagem: TDMViagem;

implementation

uses UOracle_cl, UUsuario_cl;

{$R *.dfm}

procedure TDMViagem.QViagemCadCalcFields(DataSet: TDataSet);
begin
  QViagemCadsval_saldo_receber.Value := QViagemCadVL_COMISSAO.Value - QViagemCadVL_ADIANTAMENTO.Value;
end;

procedure TDMViagem.QViagemCadVL_UNITARIOValidate(Sender: TField);
begin
  if QViagemCadVL_UNITARIO.Text <> '' then
    QViagemCadVL_TOTAL.Value := (QViagemCadQT_QUANTIDADE.Value * QViagemCadVL_UNITARIO.Value);
end;

procedure TDMViagem.QViagemCadQT_QUANTIDADEValidate(Sender: TField);
begin
  QViagemCadVL_UNITARIOValidate(Sender);
end;

procedure TDMViagem.QViagemCadAfterInsert(DataSet: TDataSet);
begin
  QViagemCadCOD_FILIAL.Value := DMUsuario.CodFilialUsuario;
end;

procedure TDMViagem.QViagemCadBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QViagemCadCOD_FILIAL.Text);
end;

end.
