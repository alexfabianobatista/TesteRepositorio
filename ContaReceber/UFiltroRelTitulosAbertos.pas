unit UFiltroRelTitulosAbertos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTFiltroRelatorio, DB, DBClient, Provider, ImgList, StdCtrls,
  Buttons, Grids, DBGrids, DBCtrls;

type
  TFFiltroRelTitulosAbertos = class(TFTFiltroRelatorio)
    CDSFiltroRelatorioval_titulo: TFloatField;
    CDSFiltroRelatorioNOME: TStringField;
    CDSFiltroRelatorioNUM_TITULO: TFloatField;
    CDSFiltroRelatorioNUM_PARCELA: TIntegerField;
    CDSFiltroRelatorioDT_VENCIMENTO: TDateTimeField;
    CDSFiltroRelatoriovalorpago: TFloatField;
    CDSFiltroRelatoriosVal_Juros: TFloatField;
    CDSFiltroRelatorioDESC_TELEFONE: TStringField;
    CDSFiltroRelatorioCOD_CONTA_RECEBER_CAB: TIntegerField;
    CDSFiltroRelatorioCOD_FILIAL: TIntegerField;
    CDSFiltroRelatorioCOD_FINALIDADE: TIntegerField;
    CDSFiltroRelatorioCOD_BANCO_AGENCIA: TIntegerField;
    CDSFiltroRelatorioCOD_CADASTRO: TIntegerField;
    CDSFiltroRelatorioDESC_TIPO_DOCUMENTO: TStringField;
    CDSFiltroRelatorioVALT_TITULO: TFloatField;
    CDSFiltroRelatorioCOD_NOTA_CAB: TIntegerField;
    CDSFiltroRelatorioDESC_OBSERVACAO: TStringField;
    CDSFiltroRelatorioIND_ACEITE: TStringField;
    CDSFiltroRelatorioIND_SITUACAO: TStringField;
    CDSFiltroRelatorioVAL_JUROS: TFloatField;
    CDSFiltroRelatorioVAL_ORIGINAL: TFloatField;
    CDSFiltroRelatorioDESC_FILIAL: TStringField;
    CDSFiltroRelatorioPERC_TAXA: TFloatField;
    CDSFiltroRelatorioCOD_MOEDA: TIntegerField;
    CDSFiltroRelatorioNUM_TIPO_JURO: TStringField;
    CDSFiltroRelatorioDESC_CLASSIFICACAO: TStringField;
    CDSFiltroRelatoriodesc_sigla_banco: TStringField;
    CDSFiltroRelatorioDESC_CELULAR: TStringField;
    CDSFiltroRelatorioNOME_VENDEDOR: TStringField;
    CDSFiltroRelatorioDESC_ENDERECO: TStringField;
    CDSFiltroRelatorioDESC_CIDADE: TStringField;
    CDSFiltroRelatorioDESC_CEP: TStringField;
    CDSFiltroRelatorioCOD_ESTADO: TStringField;
    CDSFiltroRelatorioNUM_CGC_CPF: TStringField;
    CDSFiltroRelatorioDESC_AVALISTA1: TStringField;
    CDSFiltroRelatorioDESC_FONE_EMPRESA: TStringField;
    CDSFiltroRelatorioPERC_JURO_MORA: TFloatField;
    CDSFiltroRelatorioNUM_DIAS_CARENCIA: TIntegerField;
    CDSFiltroRelatorioperc_comissao: TFloatField;
    CDSFiltroRelatorioCOD_VENDEDOR: TIntegerField;
    CDSFiltroRelatoriocod_pedido_cab: TIntegerField;
    CDSFiltroRelatorioDESC_ENDERECO_FILIAL: TStringField;
    CDSFiltroRelatorioDESC_CNPJ_FILIAL: TStringField;
    CDSFiltroRelatorionum_dias_vencido: TIntegerField;
    CDSFiltroRelatorioNUM_INSCRICAO: TStringField;
    CDSFiltroRelatorioDT_NASCIMENTO: TDateTimeField;
    CDSFiltroRelatorioDESC_BAIRRO: TStringField;
    CDSFiltroRelatorioDT_MOVIMENTO: TDateTimeField;
    CDSFiltroRelatorioDT_BAIXA: TDateTimeField;
    CDSFiltroRelatorioDT_EMISSAO: TDateTimeField;
    CDSFiltroRelatorioDT_CAPITALIZACAO: TDateTimeField;
    CDSFiltroRelatorioDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    procedure CDSFiltroRelatorioCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFiltroRelTitulosAbertos: TFFiltroRelTitulosAbertos;

implementation

uses UContasReceber_cl, UBiblioteca;

{$R *.dfm}

procedure TFFiltroRelTitulosAbertos.CDSFiltroRelatorioCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  CDSFiltroRelatorioVAL_SELECIONADO.Value := Bib.ift(CDSFiltroRelatorioIND_SELECIONADO.Value = 'S',
    CDSFiltroRelatorioval_titulo.Value, 0);
end;

end.
