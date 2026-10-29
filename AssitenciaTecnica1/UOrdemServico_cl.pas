unit UOrdemServico_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDMOrdemServico = class(TDataModule)
    QOrdemServico: TQuery;
    QOrdemServicoCOD_ORDEM_SERVICO_CAB: TFloatField;
    QOrdemServicoCOD_CADASTRO: TFloatField;
    QOrdemServicoDESC_EQUIPAMENTO: TMemoField;
    QOrdemServicoDT_ENTRADA: TDateTimeField;
    QOrdemServicoDESC_SOLICITACAO: TStringField;
    QOrdemServicoVL_DESCONTO: TFloatField;
    QOrdemServicoCons: TQuery;
    QOrdemServicoConsCOD_ORDEM_SERVICO_CAB: TFloatField;
    QOrdemServicoConsDESC_EQUIPAMENTO: TMemoField;
    QOrdemServicoConsDT_ENTRADA: TDateTimeField;
    QOrdemServicoConsNOME: TStringField;
    QOrdemServiconome_cliente: TStringField;
    DSOrdemServicoIt: TDataSource;
    DSOrdemServico: TDataSource;
    QOrdemServicoDT_SAIDA: TDateTimeField;
    QOrdemServicototal: TFloatField;
    QREntrada: TQuery;
    QOrdemServicoCOD_FILIAL: TFloatField;
    QOrdemServiconome_filial: TStringField;
    QOrdemServicoCOD_TECNICO: TFloatField;
    QOrdemServiconome_tecnico: TStringField;
    QREntradaCOD_CADASTRO: TFloatField;
    QREntradaNOME_CLIENTE: TStringField;
    QREntradaDESC_ENDERECO: TStringField;
    QREntradaDESC_CIDADE: TStringField;
    QREntradaDESC_TELEFONE: TStringField;
    QREntradaCOD_VENDEDOR: TFloatField;
    QREntradaNOME_VENDEDOR: TStringField;
    QREntradaDESC_FILIAL: TStringField;
    QREntradaCOD_ORDEM_SERVICO_CAB: TFloatField;
    QREntradaDESC_EQUIPAMENTO: TMemoField;
    QREntradaDESC_SOLICITACAO: TStringField;
    QREntradaDT_ENTRADA: TDateTimeField;
    QREntradaVL_DESCONTO: TFloatField;
    QRSintetico: TQuery;
    QRSinteticoNOME: TStringField;
    QRSinteticoCOD_CADASTRO: TFloatField;
    QRSinteticoCOD_ORDEM_SERVICO_CAB: TFloatField;
    QRSinteticoQT_PRODUTO: TFloatField;
    QRSinteticoVAL_DESCONTO: TFloatField;
    QRSinteticoVAL_TOTAL: TFloatField;
    QRAnalitico: TQuery;
    QRAnaliticoNOME: TStringField;
    QRAnaliticoCOD_CADASTRO: TFloatField;
    QRAnaliticoCOD_ORDEM_SERVICO_CAB: TFloatField;
    QRAnaliticoQT_PRODUTO: TFloatField;
    QRAnaliticoVAL_DESCONTO: TFloatField;
    QRAnaliticoVAL_TOTAL: TFloatField;
    QRMedia: TQuery;
    QRMediaNOME: TStringField;
    QRMediaCOD_CADASTRO: TFloatField;
    QRMediaCOD_ORDEM_SERVICO_CAB: TFloatField;
    QRMediaDT_ENTRADA: TDateTimeField;
    QRMediaDT_SAIDA: TDateTimeField;
    QRMediaQT_DIA: TFloatField;
    QRAnaliticoDESC_PRODUTO: TStringField;
    QRAnaliticoCOD_PRODUTO: TFloatField;
    QRAberto: TQuery;
    QREntradaDT_SAIDA: TDateTimeField;
    QRSaida_Receber: TQuery;
    QRSaida_ReceberNUM_PARCELA: TFloatField;
    QRSaida_ReceberDT_VENCIMENTO: TDateTimeField;
    QRSaida_ReceberVAL_TITULO: TFloatField;
    QOrdemServicoIt: TQuery;
    QOrdemServicoItCOD_ORDEM_SERVICO_CAB: TFloatField;
    QOrdemServicoItCOD_ORDEM_SERVICO_ITEM: TFloatField;
    QOrdemServicoItCOD_PRODUTO: TFloatField;
    QOrdemServicoItDESC_COMPLEMENTO: TStringField;
    QOrdemServicoItQT_PRODUTO: TFloatField;
    QOrdemServicoItVL_UNITARIO: TFloatField;
    QOrdemServicoItVAL_DESCONTO: TFloatField;
    QOrdemServicoItnome_produto: TStringField;
    QOrdemServicoItvl_total: TFloatField;
    QOrdemServicoItvl_total_bruto: TFloatField;
    QRAbertoCOD_ORDEM_SERVICO_CAB: TFloatField;
    QRAbertoCOD_CADASTRO: TFloatField;
    QRAbertoNOME_CLIENTE: TStringField;
    QRAbertoCOD_VENDEDOR: TFloatField;
    QRAbertoNOME_VENDEDOR: TStringField;
    QRAbertoVL_DESCONTO: TFloatField;
    QRAbertoDESC_EQUIPAMENTO: TMemoField;
    QRAbertoDESC_SOLICITACAO: TStringField;
    QRAbertoDT_ENTRADA: TDateTimeField;
    QrSaida: TQuery;
    QrSaidaCOD_ORDEM_SERVICO_CAB: TFloatField;
    QrSaidaCOD_ORDEM_SERVICO_ITEM: TFloatField;
    QrSaidaCOD_PRODUTO: TFloatField;
    QrSaidaDESC_COMPLEMENTO: TStringField;
    QrSaidaQT_PRODUTO: TFloatField;
    QrSaidaVL_UNITARIO: TFloatField;
    QrSaidaVAL_DESCONTO: TFloatField;
    QrSaidanome_produto: TStringField;
    QrSaidavl_total: TFloatField;
    procedure QOrdemServicoCalcFields(DataSet: TDataSet);
    procedure QOrdemServicoAfterInsert(DataSet: TDataSet);
    procedure QOrdemServicoItCalcFields(DataSet: TDataSet);
    procedure QOrdemServicoItBeforeInsert(DataSet: TDataSet);
    procedure QOrdemServicoItBeforeEdit(DataSet: TDataSet);
    procedure QOrdemServicoItBeforeDelete(DataSet: TDataSet);
    procedure QOrdemServicoBeforeInsert(DataSet: TDataSet);
    procedure QOrdemServicoBeforeEdit(DataSet: TDataSet);
    procedure QOrdemServicoAfterCancel(DataSet: TDataSet);
    procedure QOrdemServicoAfterPost(DataSet: TDataSet);
    procedure QOrdemServicoBeforeCancel(DataSet: TDataSet);
    procedure QOrdemServicoItAfterInsert(DataSet: TDataSet);
    procedure QOrdemServicoItAfterPost(DataSet: TDataSet);
    procedure QOrdemServicoBeforeDelete(DataSet: TDataSet);
    procedure QOrdemServicoBeforePost(DataSet: TDataSet);
    procedure QOrdemServicoItBeforePost(DataSet: TDataSet);
    procedure QOrdemServicoItCOD_PRODUTOValidate(Sender: TField);
    procedure QrSaidaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMOrdemServico: TDMOrdemServico;

implementation

uses UOracle_cl, UUsuario_cl;

{$R *.DFM}

procedure TDMOrdemServico.QOrdemServicoCalcFields(DataSet: TDataSet);
Var wAux : String;
begin
  QOrdemServiconome_filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                    'COD_FILIAL = '+FloatTostr(QOrdemServicoCod_Filial.Value));
  QOrdemServiconome_cliente.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                      'COD_CADASTRO = '+FloatTostr(QOrdemServicoCod_Cadastro.Value));
  QOrdemServiconome_tecnico.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                      'COD_VENDEDOR = '+FloatTostr(QOrdemServicoCod_Tecnico.Value));
  wAux := DMoracle.BuscaNome('SELECT SUM(VL_UNITARIO*QT_PRODUTO) AS S FROM TB_ORDEM_SERVICO_ITEM',
                             'COD_ORDEM_SERVICO_CAB = '+FloatToStr(QOrdemServicoCod_Ordem_Servico_Cab.Value) );
  If Trim(wAux) <> '' Then
    QOrdemServicototal.Value := StrToFloat(wAux)-QOrdemServicoVl_Desconto.Value
  Else
    QOrdemServicoTotal.Value := 0;
end;

procedure TDMOrdemServico.QOrdemServicoAfterInsert(DataSet: TDataSet);
begin
  QOrdemServicoCod_Ordem_Servico_Cab.Value := DMOracle.Sequencia('ORDEM_SERVICO');
  QOrdemServicoDt_Entrada.Value := DMOracle.DataServ;
  QOrdemServicoCod_Filial.Value := DMUsuario.CodFilialUsuario;
end;

procedure TDMOrdemServico.QOrdemServicoItCalcFields(DataSet: TDataSet);
begin
  QOrdemServicoitnome_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                      'COD_PRODUTO = '+FloatTostr(QOrdemServicoItCod_Produto.Value));
  QOrdemServicoItvl_Total.Value := QOrdemServicoItVl_unitario.Value*QOrdemServicoItQt_Produto.Value-QOrdemServicoItVal_Desconto.Value;
  QOrdemServicoItvl_Total_bruto.Value := QOrdemServicoItVl_unitario.Value*QOrdemServicoItQt_Produto.Value;
end;

procedure TDMOrdemServico.QOrdemServicoItBeforeInsert(DataSet: TDataSet);
begin
  If QOrdemServico.State = dsInsert Then
  Begin
    QOrdemServico.Post;
    QOrdemServico.Edit;
  End;
  If QOrdemServico.State <> dsEdit Then
    Raise Exception.Create('Ordem de Serviço não está no modo de alteração!');
end;

procedure TDMOrdemServico.QOrdemServicoItBeforeEdit(DataSet: TDataSet);
begin
  If Not (QOrdemServico.State in [dsEdit,dsInsert]) Then
    Raise Exception.Create('Ordem de Serviço não está no modo de alteração!');
end;

procedure TDMOrdemServico.QOrdemServicoItBeforeDelete(DataSet: TDataSet);
begin
  If Not (QOrdemServico.State in [dsEdit,dsInsert]) Then
    Raise Exception.Create('Ordem de Serviço não está no modo de alteração!');
end;

procedure TDMOrdemServico.QOrdemServicoBeforeInsert(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMOrdemServico.QOrdemServicoBeforeEdit(DataSet: TDataSet);
begin
  If Trim(QOrdemServicoDt_Saida.Text)  <> '' Then
    Raise Exception.Create('Ordem de Serviço já fechada');
  If Not DMOracle.DBCemapa.InTransaction Then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMOrdemServico.QOrdemServicoAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QOrdemServico.Close;
  QOrdemServico.Open;
end;

procedure TDMOrdemServico.QOrdemServicoAfterPost(DataSet: TDataSet);
Var wCodigo : Real;
begin
  wCodigo := QOrdemServicoCod_Ordem_Servico_Cab.Value;
  QOrdemServico.Close;
  QOrdemServico.ParambyName('PK').AsFloat := wCodigo;
  QOrdemServico.Open;
end;

procedure TDMOrdemServico.QOrdemServicoBeforeCancel(DataSet: TDataSet);
begin
  If QOrdemServicoIt.State in [dsInsert,dsEdit] then
    QOrdemServicoIt.Cancel;
end;

procedure TDMOrdemServico.QOrdemServicoItAfterInsert(DataSet: TDataSet);
begin
  QOrdemServicoItCod_Ordem_Servico_item.Value := DMOracle.Sequencia('ORDEM_SERVICO_ITEM');
  QOrdemServicoItCod_Ordem_Servico_Cab.Value := QOrdemServicoCod_Ordem_Servico_Cab.Value;
end;

procedure TDMOrdemServico.QOrdemServicoItAfterPost(DataSet: TDataSet);
begin
  QOrdemServicoIt.Close;
  QOrdemServicoIt.Open;
  // QOrdemServicoCalcFields(QOrdemServico);
end;

procedure TDMOrdemServico.QOrdemServicoBeforeDelete(DataSet: TDataSet);
begin
  If QOrdemServicoDt_Saida.Value > 0 Then
    Raise Exception.Create('Ordem de Serviço já fechada');
end;

procedure TDMOrdemServico.QOrdemServicoBeforePost(DataSet: TDataSet);
Var wDesconto : Real;
begin
  wDesconto := 0;
  QOrdemServicoIt.First;
  While Not QOrdemServicoIt.Eof do
  Begin
    wDesconto := wDesconto + QOrdemServicoItVal_Desconto.Value;
    QOrdemServicoIt.Next;
  End;
  QOrdemServicoVl_Desconto.Value := wDesconto;
end;

procedure TDMOrdemServico.QOrdemServicoItBeforePost(DataSet: TDataSet);
begin
  If QOrdemServicoItQt_Produto.Value = 0 Then
    Raise Exception.Create('Quantidade inválida!');
  If QOrdemServicoItVl_Unitario.Value = 0 Then
    Raise Exception.Create('Valor Unitário Inválido!');
end;

procedure TDMOrdemServico.QOrdemServicoItCOD_PRODUTOValidate(
  Sender: TField);
Var wVl_Unitario : String;
begin
  wVl_Unitario := DMOracle.BuscaNOme('SELECT VAL_VAREJO FROM TB_PRODUTO',
                       'COD_PRODUTO = '+FloatToStr(QOrdemServicoItCod_Produto.Value));
  If Trim(wVl_Unitario) <> '' Then
    QOrdemServicoItVl_Unitario.Value := StrToFloat(wVl_Unitario)
  Else
    QOrdemServicoItVl_Unitario.Value := 0;
end;

procedure TDMOrdemServico.QrSaidaCalcFields(DataSet: TDataSet);
begin
  QrSaidanome_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                      'COD_PRODUTO = '+FloatTostr(QrSaidaCod_Produto.Value));
  QrSaidavl_Total.Value := QrSaidaVl_unitario.Value*QrSaidaQt_Produto.Value-QrSaidaVal_Desconto.Value;

end;

end.
