unit UCartaCorrecaoEletronica_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMCartaCorrecaoEletronica = class(TDataModule)
    QCartaCorrecaoEletronica: TOracleDataSet1;
    QCartaCorrecaoEletronicaID_LOTE: TFloatField;
    QCartaCorrecaoEletronicaDESC_CHAVE_ACESSO: TStringField;
    QCartaCorrecaoEletronicaDESC_RETORNO_PROCESSAMENTO: TStringField;
    QCartaCorrecaoEletronicaDESC_MSG_VALIDACAO: TMemoField;
    QCartaCorrecaoEletronica_Item: TOracleDataSet1;
    QCartaCorrecaoEletronica_ItemNSEQ_EVENTO: TIntegerField;
    QCartaCorrecaoEletronica_ItemID_LOTE: TFloatField;
    QCartaCorrecaoEletronica_ItemID_EVENTO: TStringField;
    QCartaCorrecaoEletronica_ItemDT_EVENTO: TDateTimeField;
    QCartaCorrecaoEletronica_ItemDESC_CORRECAO: TMemoField;
    QCartaCorrecaoEletronica_ItemDESC_RETORNO_PROCESSAMENTO: TStringField;
    QCartaCorrecaoEletronica_ItemDESC_MSG_VALIDACAO: TMemoField;
    QCartaCorrecaoEletronica_ItemDT_REG_EVENTO: TDateTimeField;
    QCartaCorrecaoEletronica_ItemDESC_PROTOCOLO: TStringField;
    QCartaCorrecaoEletronica_ItemDESC_XML_RETORNO: TMemoField;
    QCartaCorrecaoEletronica_ItemDESC_XML_CCE: TMemoField;
    QCartaCorrecaoEletronicamsg_validacao: TStringField;
    QCartaCorrecaoEletronica_Itemmsg_validacao: TStringField;
    procedure QCartaCorrecaoEletronicaCalcFields(DataSet: TDataSet);
    procedure QCartaCorrecaoEletronica_ItemCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCartaCorrecaoEletronica: TDMCartaCorrecaoEletronica;

implementation

uses UOracle_cl, Math;

{$R *.dfm}

procedure TDMCartaCorrecaoEletronica.QCartaCorrecaoEletronicaCalcFields(
  DataSet: TDataSet);
begin
  if QCartaCorrecaoEletronica.Active then
    QCartaCorrecaoEletronicamsg_validacao.Value := QCartaCorrecaoEletronicaDESC_RETORNO_PROCESSAMENTO.Text + ' - ' + QCartaCorrecaoEletronicaDESC_MSG_VALIDACAO.Value;
end;

procedure TDMCartaCorrecaoEletronica.QCartaCorrecaoEletronica_ItemCalcFields(
  DataSet: TDataSet);
begin
  if QCartaCorrecaoEletronica_Item.Active then
    QCartaCorrecaoEletronica_Itemmsg_validacao.Value := QCartaCorrecaoEletronica_ItemDESC_RETORNO_PROCESSAMENTO.Text + ' - ' + QCartaCorrecaoEletronica_ItemDESC_MSG_VALIDACAO.Value;
end;

end.
