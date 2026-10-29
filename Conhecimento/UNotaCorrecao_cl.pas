unit UNotaCorrecao_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMNotaCorrecao = class(TDataModule)
    QNotaCorrecao: TOracleDataSet1;
    QNotaCorrecaoCOD_NOTA_CAB: TIntegerField;
    QNotaCorrecaoCOD_CORRECAO: TIntegerField;
    QNotaCorrecaodesc_cadastro: TStringField;
    QNotaCorrecaodesc_tipo_nf: TStringField;
    QNotaCorrecaonum_nf: TStringField;
    QNotaCorrecaodt_emissao: TStringField;
    QNotaCorrecaodesc_serie: TStringField;
    QNotaCorrecaoDESC_ORIGEM_NOTA: TStringField;
    QNotaCorrecaodesc_cidade: TStringField;
    QNotaCorrecaodesc_endereco_cadastro: TStringField;
    QNotaCorrecaodesc_cnpj_cadastro: TStringField;
    QNotaCorrecaodesc_ie_cadastro: TStringField;
    QNotaCorrecaodesc_cidade_cadastro: TStringField;
    QNotaCorrecaodesc_cnpj_filial: TStringField;
    QNotaCorrecaodesc_nome_filial: TStringField;
    QNotaCorrecaodesc_endereco_filial: TStringField;
    QNotaCorrecaodesc_bairro_cep_filial: TStringField;
    QNotaCorrecaoDESC_CORRECAO: TStringField;
    QNotaCorrecaoDT_CARTA_CORRECAO: TDateTimeField;
    QNotaCorrecaoCOD_NOTA_CORRECAO: TIntegerField;
    QNotaCorrecaoCOD_CONHECIMENTO: TIntegerField;
    QRNotaCorrecao: TOracleDataSet1;
    QRNotaCorrecaoDESC_CADASTRO: TStringField;
    QRNotaCorrecaoDESC_ENDERECO_CADASTRO: TStringField;
    QRNotaCorrecaoDESC_CIDADE_CADASTRO: TStringField;
    QRNotaCorrecaoDESC_CNPJ_CADASTRO: TStringField;
    QRNotaCorrecaoDESC_IE_CADASTRO: TStringField;
    QRNotaCorrecaoDESC_TIPO_NF: TStringField;
    QRNotaCorrecaoDT_EMISSAO: TDateTimeField;
    QRNotaCorrecaoNUM_NF: TIntegerField;
    QRNotaCorrecaoDESC_SERIE: TStringField;
    QRNotaCorrecaoDESC_CNPJ_FILIAL: TStringField;
    QRNotaCorrecaoDESC_NOME_FILIAL: TStringField;
    QRNotaCorrecaoDESC_ENDERECO_FILIAL: TStringField;
    QRNotaCorrecaoDESC_CIDADE: TStringField;
    QRNotaCorrecaoDESC_BAIRRO_CEP_FILIAL: TStringField;
    QRNotaCorrecaoDESC_CORRECAO: TStringField;
    QRNotaCorrecaoCOD_CORRECAO: TIntegerField;
    QRNotaCorrecaoDT_CARTA_CORRECAO: TDateTimeField;
    QRNotaCorrecaoDESC_ORIGEM_NOTA: TStringField;
    QNotaCorrecaoDESC_ESPECIFICACAO: TStringField;
    procedure QNotaCorrecaoAfterInsert(DataSet: TDataSet);
    procedure QNotaCorrecaoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    fNota : Integer;
    fConhecimento : Integer;
    fConhecimentoFrete : Integer;

  public
    { Public declarations }
    Property pCodNota : Integer Read fNota Write fNota;
    Property pCodConhecimento : Integer Read fConhecimento Write fConhecimento;
    Property pCodConhecimentoFrete : Integer Read fConhecimentoFrete Write fConhecimentoFrete;

  end;

var
  DMNotaCorrecao: TDMNotaCorrecao;
  wTipo_Carta_Correcao : String;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMNotaCorrecao.QNotaCorrecaoAfterInsert(DataSet: TDataSet);
begin
  QNotaCorrecaoDesc_Origem_Nota.Value := wTipo_Carta_Correcao ;
  QNotaCorrecaoDt_Carta_Correcao.Value := Date;
  If pCodNota > 0 Then
     QNotaCorrecaoCod_Nota_Cab.Value := pCodNota;
  if pCodConhecimento <> 0 then
    QNotaCorrecaoCOD_CONHECIMENTO.Value := pCodConhecimento
  //quando for conhecimento de frete - usa o mesmo campo do código conhecimento
  else
    QNotaCorrecaoCOD_CONHECIMENTO.Value := pCodConhecimentoFrete;
//  QNotaCorrecao.AutoCalcFields := true;
end;

procedure TDMNotaCorrecao.QNotaCorrecaoAfterPost(DataSet: TDataSet);
begin
  wTipo_Carta_Correcao := QNotaCorrecaoDesc_Origem_Nota.Value;
end;

end.
