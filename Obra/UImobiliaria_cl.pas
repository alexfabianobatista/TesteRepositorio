unit UImobiliaria_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMImobiliaria = class(TDataModule)
    QCondominio_Cad: TOracleDataSet1;
    QCondominio_CadCOD_CONDOMINIO: TIntegerField;
    QCondominio_CadDESC_CONDOMINIO: TStringField;
    QCondominio_Cons: TOracleDataSet1;
    QCondominio_ConsCOD_CONDOMINIO: TIntegerField;
    QCondominio_ConsDESC_CONDOMINIO: TStringField;
    QImovel_Cad: TOracleDataSet1;
    QImovel_CadCOD_IMOVEL: TIntegerField;
    QImovel_CadCOD_CONDOMINIO: TIntegerField;
    QImovel_CadDESC_IMOVEL: TStringField;
    QImovel_CadCOD_PROPRIETARIO: TIntegerField;
    QImovel_CadDESC_ENDERECO: TStringField;
    QImovel_CadDESC_BAIRRO: TStringField;
    QImovel_CadCOD_CIDADE: TIntegerField;
    QImovel_CadDESC_CEP: TStringField;
    QImovel_Cons: TOracleDataSet1;
    QImovel_ConsDESC_IMOVEL: TStringField;
    QImovel_ConsDESC_ENDERECO: TStringField;
    QImovel_ConsNOME: TStringField;
    QImovel_ConsDESC_CONDOMINIO: TStringField;
    QImovel_ConsDESC_CIDADE: TStringField;
    QImovel_ConsCOD_IMOVEL: TIntegerField;
    QLocatario_Cad: TOracleDataSet1;
    QLocatario_CadCOD_CONTRATO_LOCATARIO: TIntegerField;
    QLocatario_CadCOD_IMOVEL: TIntegerField;
    QLocatario_CadDT_EMISSAO: TDateTimeField;
    QLocatario_CadDIA_VENCIMENTO: TIntegerField;
    QLocatario_CadVL_CONTRATO: TFloatField;
    QLocatario_CadCOD_FILIAL: TIntegerField;
    QLocatario_Cons: TOracleDataSet1;
    QLocatario_ConsCOD_CONTRATO_LOCATARIO: TIntegerField;
    QLocatario_ConsDT_EMISSAO: TDateTimeField;
    QLocatario_ConsDIA_VENCIMENTO: TIntegerField;
    QLocatario_ConsVL_CONTRATO: TFloatField;
    QLocatario_ConsNOME: TStringField;
    QLocatario_ConsDESC_IMOVEL: TStringField;
    QLocador_Cad: TOracleDataSet1;
    QLocador_CadCOD_CONTRATO_LOCADOR: TIntegerField;
    QLocador_CadCOD_IMOVEL: TIntegerField;
    QLocador_CadDT_EMISSAO: TDateTimeField;
    QLocador_CadDIA_VENCIMENTO: TIntegerField;
    QLocador_CadVL_CONTRATO: TFloatField;
    QLocador_CadVL_CONDOMINIO: TFloatField;
    QLocador_CadCOD_FILIAL: TIntegerField;
    QLocador_CadCOD_CADASTRO: TIntegerField;
    QLocador_Cons: TOracleDataSet1;
    QLocador_ConsCOD_CONTRATO_LOCADOR: TIntegerField;
    QLocador_ConsDT_EMISSAO: TDateTimeField;
    QLocador_ConsVL_CONTRATO: TFloatField;
    QLocador_ConsVL_CONDOMINIO: TFloatField;
    QLocador_ConsNOME: TStringField;
    QLocador_ConsNOME_FIADOR: TStringField;
    QLocador_CadCOD_FIADOR: TIntegerField;
    QLocador_CadIND_SITUACAO: TStringField;
    QLocatario_CadIND_SITUACAO: TStringField;
    QLocador_CadCOD_FIADOR1: TIntegerField;
    QLocador_CadVL_CAUCAO: TFloatField;
    QLocador_CadIND_TIPO_CAUCAO: TStringField;
    QLocador_CadVL_GARANTIA: TFloatField;
    QLocador_CadDESC_GARANTIA: TStringField;
    QImagem_Imovel_Cad: TOracleDataSet1;
    QImagem_Imovel_CadCOD_IMOVEL_IMAGEM: TIntegerField;
    QImagem_Imovel_CadCOD_IMOVEL: TIntegerField;
    QImagem_Imovel_CadIMG_IMAGEM01: TBlobField;
    QImagem_Imovel_CadIMG_IMAGEM02: TBlobField;
    QImagem_Imovel_CadIMG_IMAGEM03: TBlobField;
    QImagem_Imovel_CadIMG_IMAGEM04: TBlobField;
    QImagem_Imovel_CadIMG_IMAGEM05: TBlobField;
    QImagem_Imovel_CadIMG_IMAGEM06: TBlobField;
    QImagem_Imovel_CadIMG_IMAGEM07: TBlobField;
    QImagem_Imovel_CadIMG_IMAGEM08: TBlobField;
    QImagem_Imovel_CadIMG_IMAGEM09: TBlobField;
    QImagem_Imovel_CadIMG_IMAGEM10: TBlobField;
    QContaPagar_Locatario: TOracleDataSet1;
    QContaPagar_LocatarioCOD_PROPRIETARIO: TIntegerField;
    QContaPagar_LocatarioDIA_VENCIMENTO: TIntegerField;
    QContaPagar_LocatarioCOD_FILIAL: TIntegerField;
    QContaPagar_LocatarioCOD_IMOVEL: TIntegerField;
    QLocatario_CadDT_INICIO_COBRANCA: TDateTimeField;
    QContaPagar_LocatarioVAL_CONTA_PAGAR: TFloatField;
    QLocador_CadDT_INICIO_COBRANCA: TDateTimeField;
    QContaReceber_Locador: TOracleDataSet1;
    QContaReceber_LocadorDIA_VENCIMENTO: TIntegerField;
    QContaReceber_LocadorVL_CONTRATO: TFloatField;
    QContaReceber_LocadorVL_CONDOMINIO: TFloatField;
    QContaReceber_LocadorCOD_FILIAL: TIntegerField;
    QContaReceber_LocadorCOD_IMOVEL: TIntegerField;
    QContaReceber_LocadorCOD_CADASTRO: TIntegerField;
    QContaReceber_LocadorCOD_CONTRATO_LOCADOR: TIntegerField;
    QRContrato_Locador: TOracleDataSet1;
    QRContrato_LocadorDT_EMISSAO: TDateTimeField;
    QRContrato_LocadorVL_CONTRATO: TFloatField;
    QRContrato_LocadorVL_CONDOMINIO: TFloatField;
    QRContrato_LocadorDIA_VENCIMENTO: TIntegerField;
    QRContrato_LocadorNOME: TStringField;
    QRContrato_LocadorDESC_CONDOMINIO: TStringField;
    QRContrato_LocadorDESC_IMOVEL: TStringField;
    QRFinanceiro: TOracleDataSet1;
    QRFinanceiroDESC_CONDOMINIO: TStringField;
    QRFinanceiroDESC_IMOVEL: TStringField;
    QRFinanceiroCOD_PROPRIETARIO: TIntegerField;
    QRFinanceiroNOME: TStringField;
    QRFinanceiroDT_EMISSAO: TDateTimeField;
    QRFinanceiroDT_VENCIMENTO: TDateTimeField;
    QRFinanceiroVAL_TITULO: TFloatField;
    QRFinanceiroVAL_ORIGINAL: TFloatField;
    QRFinanceiroIND_TIPO: TStringField;
    QRFinanceiroVAL_TITULO_CP: TFloatField;
    QRFinanceiroVAL_ORIGINAL_CP: TFloatField;
    QRFinanceiroVAL_TITULO_CR: TFloatField;
    QRFinanceiroVAL_ORIGINAL_CR: TFloatField;
    QContaPagar_LocatarioCOD_CONTRATO_LOCATARIO: TIntegerField;
    QLocador_CadDT_FIM_COBRANCA: TDateTimeField;
    QLocatario_CadPERC_TAXA_ADM: TFloatField;
    QrExtrato: TOracleDataSet1;
    QrExtratoIND_TIPO: TStringField;
    QrExtratoDESC_IMOVEL: TStringField;
    QrExtratoCOD_PROPRIETARIO: TIntegerField;
    QrExtratoNOME: TStringField;
    QrExtratoVL_CONTRATO: TFloatField;
    QrExtratoDESC_HISTORICO: TStringField;
    QrExtratoVAL_MOVIMENTO: TFloatField;
    QLocador_CadDESC_PROFISSAO: TStringField;
    QRComissao: TOracleDataSet1;
    QRComissaoCOD_PROPRIETARIO: TIntegerField;
    QRComissaoNOME: TStringField;
    QRComissaoVAL_COMISSAO: TFloatField;
    QRContrato_Resumos: TOracleDataSet1;
    QRContrato_ResumosDESC_CONDOMINIO: TStringField;
    QRContrato_ResumosDESC_IMOVEL: TStringField;
    QRContrato_ResumosCOD_PROPRIETARIO: TIntegerField;
    QRContrato_ResumosNOME: TStringField;
    QRContrato_ResumosVL_CONTRATO: TFloatField;
    QRContrato_ResumosVL_COMISSAO: TFloatField;
    QRContrato_ResumosVL_CONDOMINIO: TFloatField;
    QRContrato_ResumosVL_DESPESAS_PROPRIETARIO: TFloatField;
    QRContrato_ResumosNOME_LOCADOR: TStringField;
    procedure QLocador_CadAfterInsert(DataSet: TDataSet);
    procedure QLocatario_CadAfterInsert(DataSet: TDataSet);
    procedure QCondominio_CadAfterPost(DataSet: TDataSet);
    procedure QImovel_CadAfterPost(DataSet: TDataSet);
    procedure QLocatario_CadAfterPost(DataSet: TDataSet);
    procedure QLocador_CadAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMImobiliaria: TDMImobiliaria;

implementation

uses UOracle_cl, UUsuario_cl;

{$R *.dfm}

procedure TDMImobiliaria.QLocador_CadAfterInsert(DataSet: TDataSet);
begin
  QLocador_CadInd_Situacao.Value := 'A';
  QLocador_CadCod_Filial.Value := DMUsuario.CodFilialUsuario;
end;

procedure TDMImobiliaria.QLocatario_CadAfterInsert(DataSet: TDataSet);
begin
  QLocatario_CadInd_Situacao.Value := 'A';
  QLocatario_CadCod_Filial.Value := DMUsuario.CodFilialUsuario;
end;

procedure TDMImobiliaria.QCondominio_CadAfterPost(DataSet: TDataSet);
var wCodigo: Integer;
begin
  wCodigo := QCondominio_CadCod_Condominio.Value;
  QCondominio_Cad.Close;
  QCondominio_Cad.SetVariable('PK', wCodigo);
  QCondominio_Cad.Open;

end;

procedure TDMImobiliaria.QImovel_CadAfterPost(DataSet: TDataSet);
var wCodigo: Integer;
begin
  wCodigo := QImovel_CadCod_Imovel.Value;
  QImovel_Cad.Close;
  QImovel_Cad.SetVariable('PK', wCodigo);
  QImovel_Cad.Open;

end;

procedure TDMImobiliaria.QLocatario_CadAfterPost(DataSet: TDataSet);
var wCodigo: Integer;
begin
  wCodigo := QLocatario_CadCod_Contrato_Locatario.Value;
  QLocatario_Cad.Close;
  QLocatario_Cad.SetVariable('PK', wCodigo);
  QLocatario_Cad.Open;

end;

procedure TDMImobiliaria.QLocador_CadAfterPost(DataSet: TDataSet);
var wCodigo: Integer;
begin
  wCodigo := QLocador_CadCod_Contrato_Locador.Value;
  QLocador_Cad.Close;
  QLocador_Cad.SetVariable('PK', wCodigo);
  QLocador_Cad.Open;

end;

end.
