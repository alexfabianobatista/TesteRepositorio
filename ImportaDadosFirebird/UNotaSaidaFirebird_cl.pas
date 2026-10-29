unit UNotaSaidaFirebird_cl;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDMNotaSaidaFirebird = class(TDataModule)
    ZQHistoricoReceituario: TZQuery;
    ZQHistoricoReceituarioCOD_CLIENTE: TIntegerField;
    ZQHistoricoReceituarioDT_EMISSAO: TDateField;
    ZQHistoricoReceituarioCOD_RECEITUARIO_OTICA: TIntegerField;
    ZQHistoricoReceituarioDESC_OBSERVACAO: TStringField;
    ZQHistoricoReceituarioCOD_PRODUTO: TIntegerField;
    ZQHistoricoReceituarioQDE_PRODUTO: TFloatField;
    ZQHistoricoReceituarioVLR_PRODUTO: TFloatField;
    ZQHistoricoReceituarioDESC_PRODUTO: TStringField;
    ZQHistoricoReceituarioVLR_DESCONTO: TFloatField;
    ZQHistoricoReceituarioCOD_FILIAL: TIntegerField;
    ZQNota_Atenas: TZQuery;
    ZQNota_AtenasCOD_NOTA_CAB: TIntegerField;
    ZQNota_AtenasCOD_CADASTRO: TIntegerField;
    ZQNota_AtenasDT_EMISSAO: TDateField;
    ZQNota_AtenasDT_SAIDA: TDateField;
    ZQNota_AtenasIND_CONDICAO_PAGTO: TStringField;
    ZQNota_AtenasCOD_VENDEDOR: TStringField;
    ZQNota_AtenasVAL_ENTRADA: TFloatField;
    ZQNota_AtenasVAL_DESCONTO: TFloatField;
    ZQNota_AtenasVAL_DESPESAS: TFloatField;
    ZQNota_AtenasDESC_OBSERVACAO: TStringField;
    ZQNota_AtenasVAL_TOTAL: TFloatField;
    ZQNota_AtenasCOD_PRODUTO: TIntegerField;
    ZQNota_AtenasQT_QUANTIDADE: TFloatField;
    ZQNota_AtenasVAL_UNITARIO: TFloatField;
    ZQNota_AtenasCOD_TRIBUTACAO: TStringField;
    ZQNota_AtenasCOD_FILIAL: TSmallintField;
    ZQNota_AtenasVAL_DESCONTO_ITEM: TFloatField;
    ZQNota_AtenasVAL_TOTAL_ITEM: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMNotaSaidaFirebird: TDMNotaSaidaFirebird;

implementation
uses UFirebird_cl;
{$R *.dfm}

end.
