unit ULiberarPedido_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMLiberarPedido = class(TDataModule)
    QPedidosPendentes: TOracleDataSet1;
    QPedidosPendentesCOD_CADASTRO: TIntegerField;
    QPedidosPendentesNUM_PEDIDO: TIntegerField;
    QPedidosPendentesCOD_VENDEDOR: TIntegerField;
    QPedidosPendentesCOD_OPERACAO: TIntegerField;
    QPedidosPendentesCOD_PEDIDO_CAB: TIntegerField;
    QPedidosPendentesDT_EMISSAO: TDateTimeField;
    QPedidosPendentesNOME: TStringField;
    QPedidosPendentesIND_LIBERADO: TStringField;
    QPedidosPendentesind_problema_financeiro: TStringField;
    QPedidosPendentesind_problema_cadastro: TStringField;
    QPedidosPendentesIND_TIPO_PAGAMENTO: TStringField;
    QPedidosPendentesCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPedidosPendentesind_problema_comercial: TStringField;
    QRPedidosProblemaComercial: TOracleDataSet1;
    QRPedidosProblemaComercialCOD_PEDIDO_CAB: TIntegerField;
    QRPedidosProblemaComercialNUM_PEDIDO: TIntegerField;
    QRPedidosProblemaComercialVAL_VAREJO: TFloatField;
    QRPedidosProblemaComercialVAL_UNITARIO: TFloatField;
    QRPedidosProblemaComercialCOD_CADASTRO: TIntegerField;
    QRPedidosProblemaComercialQT_PEDIDO: TFloatField;
    QRPedidosProblemaComercialVAL_DESCONTO: TFloatField;
    QRPedidosProblemaComercialCOD_VENDEDOR: TIntegerField;
    QRPedidosProblemaComercialNOME_VENDEDOR: TStringField;
    QRPedidosProblemaComercialPERC_COMISSAO: TFloatField;
    QRPedidosProblemaComercialCOD_OPERACAO: TIntegerField;
    QRPedidosProblemaComercialDESC_OPERACAO: TStringField;
    QRPedidosProblemaComercialCOD_CLASSE: TIntegerField;
    QRPedidosProblemaFinanceiro: TOracleDataSet1;
    QRPedidosProblemaFinanceiroVAL_PEDIDO: TFloatField;
    QRPedidosProblemaFinanceiroNUM_PEDIDO: TIntegerField;
    QRPedidosProblemaFinanceiroDT_EMISSAO: TDateTimeField;
    QRPedidosProblemaFinanceiroNOME: TStringField;
    QRPedidosProblemaFinanceiroCOD_CADASTRO: TIntegerField;
    QRPedidosProblemaFinanceiroIND_TIPO_PAGAMENTO: TStringField;
    QRPedidosProblemaFinanceiroCOD_OPERACAO: TIntegerField;
    QRPedidosProblemaFinanceiroDESC_OPERACAO: TStringField;
    QRPedidosProblemaComercialDESC_OBSERVACAO: TStringField;
    QRPedidosProblemaFinanceiroNOME_VENDEDOR: TStringField;
    QRPedidosProblemaFinanceiroCOD_VENDEDOR: TIntegerField;
    QRPedidosProblemaFinanceiroDESC_COND_PAGAMENTO: TStringField;
    QRPedidosProblemaCadastro: TOracleDataSet1;
    QRPedidosProblemaCadastroNUM_PEDIDO: TIntegerField;
    QRPedidosProblemaCadastroDT_EMISSAO: TDateTimeField;
    QRPedidosProblemaCadastroNOME: TStringField;
    QRPedidosProblemaCadastroDESC_CIDADE: TStringField;
    QRPedidosProblemaCadastroDESC_CEP: TStringField;
    QRPedidosProblemaCadastroCOD_CADASTRO: TIntegerField;
    QRPedidosProblemaCadastroNUM_CGC_CPF: TStringField;
    QRPedidosProblemaCadastroDESC_TELEFONE: TStringField;
    QRPedidosProblemaCadastroDESC_ENDERECO: TStringField;
    QRPedidosProblemaCadastroNOME_VENDEDOR: TStringField;
    QRPedidosProblemaComercialNOME: TStringField;
    QRPedidosProblemaCadastroSNOVO: TStringField;
    QRPedidosProblemaComercialDESC_COND_PAGAMENTO: TStringField;
    QRPedidosProblemaComercialIND_TIPO_PAGAMENTO: TStringField;
    QRPedidosProblemaComercialCOD_PRAZO_VENCIMENTO: TIntegerField;
    QRPedidosProblemaCadastroNUM_INSCRICAO: TStringField;
    QRPedidosProblemaCadastroNOME_CONTATO: TStringField;
    QRPedidosProblemaCadastroDESC_FANTASIA: TStringField;
    QRPedidosProblemaCadastroDESC_BAIRRO: TStringField;
    procedure QPedidosPendentesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMLiberarPedido: TDMLiberarPedido;

implementation

uses UOracle_cl;

{$R *.DFM}

{
o campo IND_LIBERADO está estruturado da seguinte forma:

se o valor for 'SIM' o pedido está liberado caso contrario sao observados os
seguintes critérios:

na primeira posição são armazenados os problemas referentes a CADASTRO.
na segunda posicao sao armazenados os problemas referentes ao FINANCEIRO.
na terceira posicao sao armazenados os problemas referentes ao COMERCIAL.
}
procedure TDMLiberarPedido.QPedidosPendentesCalcFields(DataSet: TDataSet);
begin
  if (copy(QPedidosPendentesIND_LIBERADO.Text,1,1) <> '0') then
    QPedidosPendentesind_problema_financeiro.Value := 'Sim';

  if (copy(QPedidosPendentesIND_LIBERADO.Text,2,1) <> '0') then
    QPedidosPendentesind_problema_comercial.Value := 'Sim';

  if (copy(QPedidosPendentesIND_LIBERADO.Text,3,1) <> '0') then
    QPedidosPendentesind_problema_cadastro.Value := 'Sim';
end;

end.
