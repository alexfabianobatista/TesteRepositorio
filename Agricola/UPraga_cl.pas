unit UPraga_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMPraga = class(TDataModule)
    DSPragaProduto: TDataSource;
    QRPragaProduto: TOracleDataSet1;
    QRPragaProdutoCOD_PRAGA: TIntegerField;
    QRPragaProdutoCOD_PRODUTO: TFloatField;
    QRPragaProdutoCOD_MENS_RECEITA: TIntegerField;
    QRPragaProdutoCOD_PRAGA_PRODUTO: TIntegerField;
    QRPragaProdutoDESC_PRAGA: TStringField;
    QPragaCons: TOracleDataSet1;
    QPragaConsCOD_PRAGA: TIntegerField;
    QPragaConsDESC_PRAGA: TStringField;
    QPraga: TOracleDataSet1;
    QPragaCOD_PRAGA: TIntegerField;
    QPragaDESC_PRAGA: TStringField;
    QPragaProduto: TOracleDataSet1;
    QPragaProdutoCOD_PRAGA: TIntegerField;
    QPragaProdutoCOD_PRODUTO: TFloatField;
    QPragaProdutoNUM_DOSE: TFloatField;
    QPragaProdutoDESC_AGUA: TStringField;
    QPragaProdutoDESC_CARENCIA: TStringField;
    QPragaProdutoDESC_DESTINO: TStringField;
    QPragaProdutoCOD_MENS_RECEITA: TIntegerField;
    QPragaProdutoDESC_AREA: TStringField;
    QPragaProdutoCOD_PRAGA_PRODUTO: TIntegerField;
    QRPragaProdutoDESC_AREA: TStringField;
    QRPragaProdutoNUM_DOSE: TFloatField;
    QRProdutoPraga: TOracleDataSet1;
    IntegerField1: TIntegerField;
    FloatField1: TFloatField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    StringField3: TStringField;
    FloatField2: TFloatField;
    QPragaProdutoCOD_CULTURA: TIntegerField;
    QRProdutoPragaDESC_PRODUTO: TStringField;
    QRPragaProdutoDESC_PRODUTO: TStringField;
    QRCulturaPragaProduto: TOracleDataSet1;
    IntegerField4: TIntegerField;
    FloatField3: TFloatField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField2: TStringField;
    StringField4: TStringField;
    FloatField4: TFloatField;
    StringField5: TStringField;
    QRCulturaPragaProdutoDESC_CULTURA: TStringField;
    QRCulturaPragaProdutoCOD_CULTURA: TIntegerField;
    QRReceituario: TOracleDataSet1;
    QRReceituarioNUM_RECEITA: TIntegerField;
    QRReceituarioCPF_AGRONOMO: TStringField;
    QRReceituarioNOME_CADASTRO: TStringField;
    QRReceituarioCGC_CPF_CADASTRO: TStringField;
    QRReceituarioDESC_ENDERECO: TStringField;
    QRReceituarioCOD_UF_IBGE: TIntegerField;
    QRReceituarioCOD_CIDADE_IBGE: TStringField;
    QRReceituarioDT_EMISSAO: TDateTimeField;
    QRReceituarioDESC_PRECAUCAO: TStringField;
    QRReceituarioQT_QUANTIDADE: TFloatField;
    QRReceituarioNUM_DOSE: TFloatField;
    QRReceituarioNUM_EMBALAGEM: TFloatField;
    QRVendas: TOracleDataSet1;
    QRVendasNUM_RECEITA: TIntegerField;
    QRVendasCPF_AGRONOMO: TStringField;
    QRVendasNUM_NOTA: TIntegerField;
    QRVendasCOD_SERIE: TStringField;
    QRVendasCOD_ESTADO: TStringField;
    QRVendasDT_EMISSAO: TDateTimeField;
    QRVendasNUM_CGC: TStringField;
    QRReceituarioCOD_NOTA_CAB: TIntegerField;
    QRReceituarioDESC_AREA: TStringField;
    QPragaCOD_PRAGA_SIAGRO: TIntegerField;
    QRReceituarioCOD_PRAGA_SIAGRO: TIntegerField;
    QRReceituarioCOD_CULTURA_SIAGRO: TIntegerField;
    QRReceituarioCOD_PRODUTO_SIAGRO: TIntegerField;
    QRReceituarioPRODUTO: TStringField;
    QRReceituarioDESC_PRODUTO: TStringField;
    QRReceituarioDESC_CARENCIA: TStringField;
    QPragaProdutodesc_produto: TStringField;
    QPragaProdutodesc_cultura: TStringField;
    QRReceituarioDESC_OBS: TStringField;
    QRReceituarioPRECAUCAO_RECEITA: TStringField;
    QRReceituarioDESC_EPI: TStringField;
    QRReceituarioDESC_AGUA: TStringField;
    QRReceituarioDESC_DESTINO: TStringField;
    QRReceituarioDESC_ORIENTACAO: TStringField;
    QRReceituarioNUM_APLICACAO: TIntegerField;
    QRVendasQT_AGROTOXICO: TFloatField;
    QUnidadeDosagemCons: TOracleDataSet1;
    QUnidadeDosagemConsCOD_UNIDADE_DOSAGEM: TIntegerField;
    QUnidadeDosagemConsDESC_UNIDADE_DOSAGEM: TStringField;
    QPragaProdutoCOD_UNIDADE_DOSAGEM: TIntegerField;
    QRReceituarioCOD_UNIDADE_DOSAGEM: TIntegerField;
    QPragaProdutoDESC_UTILIZACAO: TStringField;
    QRReceituarioDESC_UTILIZACAO: TStringField;
    QRReceituarioDESC_PRAGA: TStringField;
    QPragaProdutoCons: TOracleDataSet1;
    DSPragaProdutoCons: TDataSource;
    QPragaProdutoConsCOD_PRAGA: TIntegerField;
    QPragaProdutoConsDESC_PRAGA: TStringField;
    QRReceituarioNUM_EMBALAGEM_RECEITA: TFloatField;
    QRReceituarioDESC_LATITUDE: TStringField;
    QRReceituarioDESC_LONGITUDE: TStringField;
    QRReceituarioDESC_PRECAUCAO_MENS: TStringField;
    procedure QPragaAfterPost(DataSet: TDataSet);
    procedure QPragaProdutoAfterInsert(DataSet: TDataSet);
    procedure QPragaProdutoAfterPost(DataSet: TDataSet);
    procedure QPragaProdutoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPraga: TDMPraga;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMPraga.QPragaAfterPost(DataSet: TDataSet);
var wCodigo:Integer;
begin
   wCodigo := QPragaCod_Praga.Value;
   QPraga.Close;
   QPraga.SetVariable('PK',wCodigo);
   QPraga.Open;
   QPragaProduto.Close;
   QPragaProduto.Open;
end;

procedure TDMPraga.QPragaProdutoAfterInsert(DataSet: TDataSet);
begin
  QPragaProdutoCod_Praga.Value := QPragaCod_Praga.Value;
end;

procedure TDMPraga.QPragaProdutoAfterPost(DataSet: TDataSet);
begin
   QPragaProduto.Close;
   QPragaProduto.Open;
end;

procedure TDMPraga.QPragaProdutoCalcFields(DataSet: TDataSet);
begin
  QPragaProdutodesc_produto.Value := '';
  QPragaProdutodesc_cultura.Value := '';
  if not (QPragaProdutoCOD_PRODUTO.IsNull and QPragaProdutoCOD_CULTURA.IsNull) then
  begin
    Buscador.Limpa;
    Buscador.Adiciona('COD_PRODUTO || ' + QuotedStr(' - ') + ' || DESC_PRODUTO',
      'TB_PRODUTO', 'COD_PRODUTO = 0' + QPragaProdutoCOD_PRODUTO.Text);
    Buscador.Adiciona('COD_CULTURA || ' + QuotedStr(' - ') + ' || DESC_CULTURA',
      'TB_CULTURA', 'COD_CULTURA = 0' + QPragaProdutoCOD_CULTURA.Text);
    Buscador.Buscar;

    QPragaProdutodesc_produto.Value := Buscador.Proximo;
    QPragaProdutodesc_cultura.Value := Buscador.Proximo;
  end;
end;

end.
