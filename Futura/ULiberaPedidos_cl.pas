unit ULiberaPedidos_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMLiberaPedidos = class(TDataModule)
    QPedidosPendentes: TOracleDataSet1;
    QPedidosPendentesCOD_CADASTRO: TIntegerField;
    QPedidosPendentesNUM_PEDIDO: TIntegerField;
    QPedidosPendentesCOD_VENDEDOR: TIntegerField;
    QPedidosPendentesCOD_OPERACAO: TIntegerField;
    QPedidosPendentesCOD_PEDIDO_CAB: TIntegerField;
    QPedidosPendentesDT_EMISSAO: TDateTimeField;
    QPedidoItens: TOracleDataSet1;
    QPedidoItensCOD_PRODUTO: TFloatField;
    QPedidoItensQT_PEDIDO: TFloatField;
    QPedidoItensVAL_UNITARIO: TFloatField;
    QPedidoItensPERC_DESCONTO: TFloatField;
    QPedidoItensPERC_COMISSAO: TFloatField;
    QPedidoItensCOD_TRIBUTACAO: TIntegerField;
    QPedidosPendentesNOME: TStringField;
    QPedidosPendentesIND_LIBERADO: TStringField;
    QPedidoItensdesc_produto: TStringField;
    QrPedidosCidade: TOracleDataSet1;
    QrPedidosCidadeCOD_CADASTRO: TIntegerField;
    QrPedidosCidadeDT_EMISSAO: TDateTimeField;
    QrPedidosCidadeCOD_VENDEDOR: TIntegerField;
    QrPedidosCidadeNUM_PEDIDO: TIntegerField;
    QrPedidosCidadeCOD_OPERACAO: TIntegerField;
    QrPedidosCidadeCOD_FILIAL: TIntegerField;
    QrPedidosCidadeNOME: TStringField;
    QrPedidosCidadeDESC_CIDADE: TStringField;
    QrPedidosCidadeCOD_PRODUTO: TFloatField;
    QrPedidosCidadeQT_PEDIDO: TFloatField;
    QrPedidosCidadeVAL_UNITARIO: TFloatField;
    QrPedidosCidadeCOD_TRIBUTACAO: TIntegerField;
    QrPedidosCidadeDESC_PRODUTO: TStringField;
    QrPedidosCidadeNOME_VENDEDOR: TStringField;
    QrPedidosCidadeIND_LIBERADO: TStringField;
    QPedidosPendentesind_problema_financeiro: TStringField;
    QPedidosPendentesind_problema_cadastro: TStringField;
    QPedidosPendentesIND_TIPO_PAGAMENTO: TStringField;
    QPedidosPendentesCOD_PRAZO_VENCIMENTO: TIntegerField;
    QrPedidosCidadeCOD_PEDIDO_CAB: TIntegerField;
    QrPedidosCidadeDESC_OBSERVACAO: TStringField;
    QRPedidosProblemaPreco: TOracleDataSet1;
    QRPedidosProblemaPrecoCOD_PEDIDO_CAB: TIntegerField;
    QRPedidosProblemaPrecoNUM_PEDIDO: TIntegerField;
    QRPedidosProblemaPrecoVAL_VAREJO: TFloatField;
    QRPedidosProblemaPrecoVAL_UNITARIO: TFloatField;
    QRPedidosProblemaPrecoCOD_PRODUTO: TFloatField;
    QRPedidosProblemaPrecoDESC_PRODUTO: TStringField;
    QRPedidosProblemaPrecoNOME: TStringField;
    QRPedidosProblemaPrecoCOD_CADASTRO: TIntegerField;
    QRPedidosProblemaPrecoQT_PEDIDO: TFloatField;
    QRPedidosProblemaPrecoVAL_DESCONTO: TFloatField;
    procedure QPedidoItensCalcFields(DataSet: TDataSet);
    procedure QPedidosPendentesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMLiberaPedidos: TDMLiberaPedidos;

implementation

uses UOracle_cl, UParamSistema_cl;

{$R *.DFM}

procedure TDMLiberaPedidos.QPedidoItensCalcFields(DataSet: TDataSet);
begin
  QPedidoItensDesc_Produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItensCod_Produto.Value));
end;

procedure TDMLiberaPedidos.QPedidosPendentesCalcFields(DataSet: TDataSet);
Var wDtVencto,wLibera : String;
begin
  If DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QPedidosPendentesCod_Cadastro.Value)) <> ''  Then
     QPedidosPendentesInd_Problema_Cadastro.Value := 'Sim';

  wDtVencto := DMOracle.BuscaNome('SELECT Min(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB','COD_CADASTRO = '+FloatToStr(QPedidosPendentesCod_Cadastro.Value)+ ' AND IND_SITUACAO <> '+chr(39)+'BAIXA TOTAL'+chr(39));
  wLibera := DMOracle.BuscaNome('SELECT IND_LIBERA_VENDA FROM TB_CADASTRO','TB_CADASTRO.COD_CADASTRO = '+
                                FloatToStr(QPedidosPendentesCod_Cadastro.Value));
  if wDtvencto <> '' then
     if StrToDate(wDtVencto) < Date Then
        If wLibera = 'NAO' Then
           QPedidosPendentesInd_Problema_Financeiro.Value := 'Sim';


end;

end.
