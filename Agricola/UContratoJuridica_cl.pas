unit UContratoJuridica_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMContratoJuridica = class(TDataModule)
    QContratoCompra_PJuridica: TOracleDataSet1;
    QContratoCompra_PJuridicaCOD_FILIAL: TIntegerField;
    QContratoCompra_PJuridicaCOD_CADASTRO: TIntegerField;
    QContratoCompra_PJuridicaCOD_CADASTRO_PARCEIRO: TIntegerField;
    QContratoCompra_PJuridicaIND_FIXAR: TIntegerField;
    QContratoCompra_PJuridicaQT_QUANTIDADE: TFloatField;
    QContratoCompra_PJuridicaVAL_DOLAR: TFloatField;
    QContratoCompra_PJuridicaIND_ICMS: TIntegerField;
    QContratoCompra_PJuridicaDT_EMISSAO: TDateTimeField;
    QContratoCompra_PJuridicaDT_ENTREGA: TDateTimeField;
    QContratoCompra_PJuridicaDT_VENCIMENTO: TDateTimeField;
    QContratoCompra_PJuridicaDESC_LOCAL_ENTREGA: TStringField;
    QContratoCompra_PJuridicaDESC_ACONDICIONAMENTO: TStringField;
    QContratoCompra_PJuridicaIND_FRETE: TStringField;
    QContratoCompra_PJuridicaDT_ANO_SAFRA: TStringField;
    QContratoCompra_PJuridicaIND_TIPO_SAFRA: TStringField;
    QContratoCompra_PJuridicaTIPO_BASE: TStringField;
    QContratoCompra_PJuridicaCOD_AVALISTA: TIntegerField;
    QContratoCompra_PJuridicaPRECO: TFloatField;
    QContratoCompra_PJuridicaNUM_CONTRATO: TIntegerField;
    QContratoCompra_PJuridicaIND_SITUACAO: TStringField;
    QContratoCompra_PJuridicaQTDE_SALDO: TFloatField;
    QContratoCompra_PJuridicaCOD_FIEL_DEPOSITARIO: TIntegerField;
    QContratoCompra_PJuridicaDESC_TESTEMUNHA1: TStringField;
    QContratoCompra_PJuridicaDESC_TESTEMUNHA2: TStringField;
    QContratoCompra_PJuridicadesc_filial: TStringField;
    QContratoCompra_PJuridicadesc_cliente: TStringField;
    QContratoCompra_PJuridicadesc_avalista: TStringField;
    QContratoCompra_PJuridicadesc_fieldepositario: TStringField;
    QContratoCompra_PJuridicadesc_produto: TStringField;
    QContratoCompraJuridicaCons: TOracleDataSet1;
    QContratoCompraJuridicaConsCOD_CADASTRO: TIntegerField;
    QContratoCompraJuridicaConsCOD_FILIAL: TIntegerField;
    QContratoCompraJuridicaConsIND_FIXAR: TIntegerField;
    QContratoCompraJuridicaConsQT_QUANTIDADE: TFloatField;
    QContratoCompraJuridicaConsVAL_DOLAR: TFloatField;
    QContratoCompraJuridicaConsIND_ICMS: TIntegerField;
    QContratoCompraJuridicaConsDT_EMISSAO: TDateTimeField;
    QContratoCompraJuridicaConsDT_ENTREGA: TDateTimeField;
    QContratoCompraJuridicaConsDT_VENCIMENTO: TDateTimeField;
    QContratoCompraJuridicaConsDESC_LOCAL_ENTREGA: TStringField;
    QContratoCompraJuridicaConsDESC_ACONDICIONAMENTO: TStringField;
    QContratoCompraJuridicaConsIND_FRETE: TStringField;
    QContratoCompraJuridicaConsDT_ANO_SAFRA: TStringField;
    QContratoCompraJuridicaConsIND_TIPO_SAFRA: TStringField;
    QContratoCompraJuridicaConsTIPO_BASE: TStringField;
    QContratoCompraJuridicaConsCOD_AVALISTA: TIntegerField;
    QContratoCompraJuridicaConsPRECO: TFloatField;
    QContratoCompraJuridicaConsNUM_CONTRATO: TIntegerField;
    QContratoCompraJuridicaConsDESC_FILIAL: TStringField;
    QContratoCompraJuridicaConsNOME: TStringField;
    QContratoCompraJuridicaConsCOD_CONTRATO_JURIDICA: TIntegerField;
    QContratoCompra_PJuridicaCOD_CONTRATO_JURIDICA: TIntegerField;
    QContratoCompra_PJuridicaCOD_PRODUTO: TFloatField;
    QContratoCompraJuridicaConsCOD_PRODUTO: TFloatField;
    procedure QContratoCompra_PJuridicaCalcFields(DataSet: TDataSet);
    procedure QContratoCompra_PJuridicaBeforePost(DataSet: TDataSet);
    procedure QContratoCompra_PJuridicaAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContratoJuridica: TDMContratoJuridica;

implementation

uses UOracle_cl, USequencia_cl;

{$R *.DFM}

procedure TDMContratoJuridica.QContratoCompra_PJuridicaCalcFields(
  DataSet: TDataSet);
begin
    if Trim (QContratoCompra_PJuridicaCod_Filial.Text)<> '' then
       QContratoCompra_PJuridicaDesc_Filial.Value:=DMOracle.BuscaNome(
       'SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL= '+Trim (QContratoCompra_PJuridicaCod_Filial.Text));
    if Trim (QContratoCompra_PJuridicaCod_Cadastro.Text)<> '' then
       QContratoCompra_PJuridicaDesc_Cliente.Value:=DMOracle.BuscaNome(
       'SELECT NOME FROM TB_CADASTRO','COD_CADASTRO= '+Trim (QContratoCompra_PJuridicaCod_Cadastro.Text));
    if Trim (QContratoCompra_PJuridicaCod_Produto.Text)<> '' then
       QContratoCompra_PJuridicaDesc_Produto.Value:=DMOracle.BuscaNome(
       'SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO= '+Trim (QContratoCompra_PJuridicaCod_Produto.Text));
    if Trim (QContratoCompra_PJuridicaCod_Fiel_Depositario.Text)<> '' then
       QContratoCompra_PJuridicaDesc_FielDepositario.Value:=DMOracle.BuscaNome(
       'SELECT NOME FROM TB_CADASTRO','COD_CADASTRO= '+Trim (QContratoCompra_PJuridicaCod_Fiel_Depositario.Text));
    if Trim (QContratoCompra_PJuridicaCod_Avalista.Text)<> '' then
       QContratoCompra_PJuridicaDesc_Avalista.Value:=DMOracle.BuscaNome(
       'SELECT NOME FROM TB_CADASTRO','COD_CADASTRO= '+Trim (QContratoCompra_PJuridicaCod_Avalista.Text));
end;

procedure TDMContratoJuridica.QContratoCompra_PJuridicaBeforePost(
  DataSet: TDataSet);
begin
  If QContratoCompra_PJuridicaNum_Contrato.Value = 0 Then
    QContratoCompra_PJuridicaNum_Contrato.Value:=DMSequencia.Sequencia(QContratoCompra_PJuridicaCOD_FILIAL.VALUE,'Contrato_Juridica');
end;

procedure TDMContratoJuridica.QContratoCompra_PJuridicaAfterInsert(
  DataSet: TDataSet);
begin
  QContratoCompra_PJuridicaDT_Emissao.Value:= DMoracle.DataServ;
  QContratoCompra_PJuridicaNum_Contrato.Value:= 0;
end;

end.
