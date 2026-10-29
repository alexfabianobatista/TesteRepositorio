unit UNotasMarketplace_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMNotasMarketplace = class(TDataModule)
    QNotasMarketplace: TOracleDataSet1;
    QNotasMarketplaceCOD_NOTA_CAB: TIntegerField;
    QNotasMarketplaceNUM_NOTA: TIntegerField;
    QNotasMarketplaceNOME: TStringField;
    QNotasMarketplaceCOD_PEDIDO_CAB: TIntegerField;
    QNotasMarketplaceCOD_PEDIDO_MARKETPLACE: TStringField;
    QNotasMarketplaceSVAL_TOTAL: TFloatField;
    QNotasMarketplaceCOD_FILIAL: TIntegerField;
    QNotasMarketplaceDESC_CHAVE_ACESSO: TStringField;
    QConfiguracoesSkyhub: TOracleDataSet1;
    QNotasMarketplacedesc_situacao: TStringField;
    QNotasMarketplaceDT_EMISSAO: TDateTimeField;
    QConfiguracoesSkyhubCOD_CONFIGURACAO_SKYHUB: TIntegerField;
    QConfiguracoesSkyhubCOD_FILIAL: TFloatField;
    QConfiguracoesSkyhubIND_ATIVO: TStringField;
    QConfiguracoesSkyhubDESC_USUARIO_EMAIL: TStringField;
    QConfiguracoesSkyhubDESC_TOKEN_INTEGRACAO: TStringField;
    QConfiguracoesSkyhubDESC_TOKEN_ACCOUNT: TStringField;
    QConfiguracoesSkyhubCOD_OPERACAO: TFloatField;
    QNotasMarketplaceDESC_SITUACAO_MARKETPLACE: TStringField;
    QNotasMarketplaceSVAL_RECEBER: TFloatField;
    QNotasMarketplaceVAL_FRETE_MARKETPLACE: TFloatField;
    procedure QNotasMarketplaceCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMNotasMarketplace: TDMNotasMarketplace;

implementation
uses UOracle_cl;

{$R *.dfm}

procedure TDMNotasMarketplace.QNotasMarketplaceCalcFields(
  DataSet: TDataSet);
begin
  if QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Text = 'APPROVED' then
    QNotasMarketplacedesc_situacao.Value := 'Aprovado'
  else if QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Text = 'INVOICED' then
    QNotasMarketplacedesc_situacao.Value := 'Faturado'
  else if QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Text = 'SHIPPED' then
    QNotasMarketplacedesc_situacao.Value := 'Enviado'
  else if QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Text = 'DELIVERED' then
    QNotasMarketplacedesc_situacao.Value := 'Recebido'
  else if QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Text = 'CANCELED' then
    QNotasMarketplacedesc_situacao.Value := 'Cancelado'
  else if QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Text = 'FINALIZADO' then
    QNotasMarketplacedesc_situacao.Value := 'Finalizado'
  else
    QNotasMarketplacedesc_situacao.Value := QNotasMarketplaceDESC_SITUACAO_MARKETPLACE.Text;
end;

end.
