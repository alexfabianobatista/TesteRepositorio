unit UEmbarque_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMEmbarque = class(TDataModule)
    DSEmbarque: TDataSource;
    DSEmbarqueItem: TDataSource;
    QREmbarque_Rota: TOracleDataSet1;
    QREmbarque_RotaNOME: TStringField;
    QREmbarque_RotaDESC_TELEFONE: TStringField;
    QREmbarque_RotaDESC_FANTASIA: TStringField;
    QREmbarque_RotaDESC_CIDADE: TStringField;
    QREmbarque_RotaNR_ROTA: TIntegerField;
    QrEmbarque_Ped_Nf1: TOracleDataSet1;
    QrEmbarque_Ped_Nf1COD_CADASTRO: TIntegerField;
    QrEmbarque_Ped_Nf1NUM_NOTA: TIntegerField;
    QrEmbarque_Ped_Nf1COD_EMBARQUE: TIntegerField;
    QrEmbarque_Ped_Nf1NOME: TStringField;
    QrEmbarque_Ped_Nf1DESC_RESUMO: TStringField;
    QrEmbarque_Ped_Nf1SVAL_TOTAL: TFloatField;
    QrEmbarque_Ped_Nf1SQT_QUANTIDADE: TFloatField;
    QrAcertoCondPagto: TOracleDataSet1;
    QrAcertoCondPagtoCOD_CADASTRO: TIntegerField;
    QrAcertoCondPagtoNUM_NOTA: TIntegerField;
    QrAcertoCondPagtoCOD_EMBARQUE: TIntegerField;
    QrAcertoCondPagtoNOME_MOTORISTA: TStringField;
    QrAcertoCondPagtoDT_EMBARQUE: TDateTimeField;
    QrAcertoCondPagtoNOME: TStringField;
    QrAcertoCondPagtoSVAL_TOTAL: TFloatField;
    QrAcertoCondPagtoSQT_QUANTIDADE: TFloatField;
    QrEmbarque_Ped_Nf: TOracleDataSet1;
    QrEmbarque_Ped_NfCOD_CADASTRO: TIntegerField;
    QrEmbarque_Ped_NfNUM_NOTA: TIntegerField;
    QrEmbarque_Ped_NfCOD_VENDEDOR: TIntegerField;
    QrEmbarque_Ped_NfNOME_VENDEDOR: TStringField;
    QrEmbarque_Ped_NfCOD_EMBARQUE: TIntegerField;
    QrEmbarque_Ped_NfNOME: TStringField;
    QrEmbarque_Ped_NfDESC_RESUMO: TStringField;
    QrEmbarque_Ped_NfSVAL_TOTAL: TFloatField;
    QrEmbarque_Ped_NfSQT_QUANTIDADE: TFloatField;
    QrAchaNrNota: TOracleDataSet1;
    QrAchaNrNotaNUM_NOTA: TIntegerField;
    QrAchaNrNotaDESC_TRANSPORTADORA: TStringField;
    QRNFs: TOracleDataSet1;
    QRNFsNUM_NOTA: TIntegerField;
    QREmbarque2: TOracleDataSet1;
    QREmbarque2COD_EMBARQUE: TIntegerField;
    QREmbarque2DT_EMBARQUE: TDateTimeField;
    QREmbarque2NOME_MOTORISTA: TStringField;
    QREmbarque2NUM_KILOMETRAGEM: TStringField;
    QREmbarque2DESC_OBS: TStringField;
    QREmbarque2COD_TRANSPORTADOR: TIntegerField;
    QREmbarque2NOME_TRANSPORTADOR: TStringField;
    QREmbarque2COD_PRODUTO: TFloatField;
    QREmbarque2DESC_PRODUTO: TStringField;
    QREmbarque2DESC_LOTE: TStringField;
    QREmbarque2SQT_PEDIDO: TFloatField;
    QREmbarque: TOracleDataSet1;
    QREmbarqueCOD_PEDIDO_CAB: TIntegerField;
    QREmbarqueNUM_PEDIDO: TIntegerField;
    QREmbarqueCOD_CADASTRO: TIntegerField;
    QREmbarqueNOME: TStringField;
    QREmbarqueDESC_ENDERECO: TStringField;
    QREmbarqueDESC_CEP: TStringField;
    QREmbarqueCOD_VENDEDOR: TIntegerField;
    QREmbarqueDT_EMISSAO: TDateTimeField;
    QREmbarqueDESC_CIDADE: TStringField;
    QREmbarqueCOD_ESTADO: TStringField;
    QREmbarqueDESC_OBSERVACAO: TStringField;
    QREmbarqueCOD_PRODUTO: TFloatField;
    QREmbarqueDESC_PRODUTO: TStringField;
    QREmbarqueDESC_LOTE: TStringField;
    QREmbarqueCOD_PEDIDO_ITEM: TIntegerField;
    QREmbarqueSQT_PEDIDO: TFloatField;
    QREmbarqueQT_PES: TIntegerField;
    QREmbarqueQT_VIDROS: TIntegerField;
    QREmbarqueNOME_MOTORISTA: TStringField;
    QREmbarqueNUM_SEQUENCIAL: TIntegerField;
    QREmbarque3: TOracleDataSet1;
    QREmbarque3SQTDE_CIDADE: TFloatField;
    QREmbarque3DESC_CIDADE: TStringField;
    QEmbarqueCons: TOracleDataSet1;
    QEmbarqueConsCOD_EMBARQUE: TIntegerField;
    QEmbarqueConsDT_EMBARQUE: TDateTimeField;
    QEmbarqueConsNOME_MOTORISTA: TStringField;
    QEmbarqueConsCOD_TRANSPORTADOR: TIntegerField;
    QEmbarqueConsNOME: TStringField;
    QEmbarqueItem: TOracleDataSet1;
    QEmbarqueItemCOD_EMBARQUE: TIntegerField;
    QEmbarqueItemCOD_PEDIDO_CAB: TIntegerField;
    QEmbarqueItemQT_PES: TIntegerField;
    QEmbarqueItemQT_VIDROS: TIntegerField;
    QEmbarqueItemNUM_SEQUENCIAL: TIntegerField;
    QEmbarqueItemnum_pedido: TStringField;
    QEmbarqueItemnome_cliente: TStringField;
    QEmbarque: TOracleDataSet1;
    QEmbarqueCOD_EMBARQUE: TIntegerField;
    QEmbarqueDT_EMBARQUE: TDateTimeField;
    QEmbarqueNOME_MOTORISTA: TStringField;
    QEmbarqueCOD_TRANSPORTADOR: TIntegerField;
    QEmbarqueNUM_KILOMETRAGEM: TStringField;
    QEmbarqueDESC_OBS: TStringField;
    QEmbarquenome_transportador: TStringField;
    QSomaNF: TOracleDataSet1;
    QSomaNFCOD_EMBARQUE: TIntegerField;
    QSomaNFSVAL_TOTAL: TFloatField;
    QSomaNF2: TOracleDataSet1;
    QSomaNF2COD_EMBARQUE: TIntegerField;
    QSomaNF2NUM_VOLUMES: TFloatField;
    QSomaNF2VAL_AVISTA: TFloatField;
    QSomaNF2VAL_APRAZO: TFloatField;
    QSomaNF2VAL_OUTROS: TFloatField;
    QrEmbarque_Ped_Nf1desc_condicao_pagto: TStringField;
    QrEmbarque_Ped_Nf1IND_CONDICAO_PAGTO: TStringField;
    QREmbarque_RotaNUM_NOTA: TIntegerField;
    QREmbarque2SQT_VALOR: TFloatField;
    QREmbarqueImposto: TOracleDataSet1;
    QREmbarqueImpostoNOME: TStringField;
    QREmbarqueImpostoCOD_CADASTRO: TIntegerField;
    QREmbarqueImpostoNUM_NOTA: TIntegerField;
    QREmbarqueImpostoDT_EMISSAO: TDateTimeField;
    QREmbarqueImpostoCOD_ESTADO: TStringField;
    QREmbarqueImpostoSVAL_TOTAL: TFloatField;
    QREmbarqueImpostoNUM_INSCRICAO: TStringField;
    QEmbarque_EmiteNota: TOracleDataSet1;
    QEmbarque_EmiteNotaCOD_PEDIDO_CAB: TIntegerField;
    QEmbarque_EmiteNotaCOD_FILIAL: TIntegerField;
    QEmbarque_EmiteNotaCOD_OPERACAO: TIntegerField;
    QEmbarque_EmiteNotaCOD_VENDEDOR: TIntegerField;
    QEmbarque_EmiteNotaCOD_CADASTRO: TIntegerField;
    QEmbarque_EmiteNotaDESC_COMPLEMENTO_OBS: TStringField;
    QEmbarque_EmiteNotaPERC_COMISSAO_NOTA: TFloatField;
    QEmbarque_EmiteNotaIND_TIPO_PAGAMENTO: TStringField;
    QEmbarque_EmiteNotaNR_DIAS_CHEQUE: TIntegerField;
    QEmbarque_EmiteNotaNR_DIAS_CHEQUE1: TIntegerField;
    QEmbarque_EmiteNotaNR_DIAS_CHEQUE2: TIntegerField;
    QEmbarque_EmiteNotaNR_DIAS_CHEQUE3: TIntegerField;
    QEmbarque_EmiteNotaCOD_PRODUTO: TFloatField;
    QEmbarque_EmiteNotaVAL_UNITARIO: TFloatField;
    QEmbarque_EmiteNotaCOD_TRIBUTACAO: TIntegerField;
    QEmbarque_EmiteNotaCOD_LOTE_TIPO: TIntegerField;
    QEmbarque_EmiteNotaQT_PEDIDO: TFloatField;
    QEmbarque_EmiteNotaCOD_PEDIDO_ITEM: TIntegerField;
    QEmbarque_EmiteNotaPERC_COMISSAO_ITENS: TFloatField;
    QEmbarque_EmiteNotacod_prazo_vencimento: TIntegerField;
    QEmbarque_EmiteNotaCOD_TRANSPORTADOR: TIntegerField;
    QEmbarque_EmiteNotaIND_TIPO_FRETE: TStringField;
    QREmbarque2SQT_METROS: TFloatField;
    QEmbarque_EmiteNotaVAL_DESCONTO: TFloatField;
    QEmbarque_EmiteNotaNUM_SEQUENCIAL: TIntegerField;
    QREmbarque2NUM_EMBALAGEM: TFloatField;
    QREmbarque2NUM_VOLUMES: TFloatField;
    QREmbarque2sqt_embalagem: TFloatField;
    QSomaNFSVAL_IMPOSTO: TFloatField;
    QSomaNF2sval_total: TFloatField;
    QREmbarqueImpostoSPERC_IMPOSTO: TFloatField;
    QREmbarqueImpostoSVAL_IMPOSTO: TFloatField;
    QSomaImposto: TOracleDataSet1;
    QSomaImpostoSVAL_IMPOSTO: TFloatField;
    QEmbarque_EmiteNotaNUM_PEDIDO: TIntegerField;
    QrAcertoCondPagtoCOD_NOTA_CAB: TIntegerField;
    QrAcertoCondPagtodesc_sigla: TStringField;
    QREmbarque_RotaNUM_SEQUENCIAL: TIntegerField;
    QEmbarque_EmiteNotaPERC_DESCONTO_ITEM: TFloatField;
    QNotaEmbarque: TOracleDataSet1;
    QNotaEmbarqueCOD_EMBARQUE: TIntegerField;
    QREmbarqueNUM_CGC_CPF: TStringField;
    QREmbarqueNUM_INSCRICAO: TStringField;
    QREmbarqueIND_TIPO_PAGAMENTO: TStringField;
    QrEmbarque_Ped_Nf1NR_DIAS_CHEQUE: TIntegerField;
    QrEmbarque_Ped_Nf1NR_DIAS_CHEQUE1: TIntegerField;
    QrEmbarque_Ped_Nf1NR_DIAS_CHEQUE2: TIntegerField;
    QrEmbarque_Ped_Nf1NR_DIAS_CHEQUE3: TIntegerField;
    QREmbarqueDESC_COMPLEMENTO_OBS: TStringField;
    QREmbarqueVAL_UNITARIO: TFloatField;
    QREmbarqueVAL_TOTAL: TFloatField;
    QEmbarque_EmiteNotaDESC_OBSERVACAO: TStringField;
    QREmbarque_RotaCOD_SERIE: TStringField;
    QREmbarque2DESC_CLASSE: TStringField;
    QEmbarqueItensPed: TOracleDataSet1;
    QEmbarqueItensPedCOD_PEDIDO_ITEM: TIntegerField;
    QEmbarqueIND_SITUACAO: TStringField;
    QREmbarqueCarga: TOracleDataSet1;
    QREmbarqueCargaDT_EMISSAO: TDateTimeField;
    QREmbarqueCargaCOD_EMBARQUE: TIntegerField;
    QREmbarqueCargaVAL_AVISTA_NF: TFloatField;
    QREmbarqueCargaVAL_APRAZO_NF: TFloatField;
    QREmbarqueCargaSVAL_IMPOSTO_NF: TFloatField;
    QEmbarqueItensNota: TOracleDataSet1;
    QEmbarqueItensNotaCOD_FILIAL: TIntegerField;
    QEmbarqueItensNotaCOD_PRODUTO: TFloatField;
    QEmbarqueItensNotaQT_QUANTIDADE: TFloatField;
    QEmbarqueIND_ATUALIZA_ESTOQUE: TStringField;
    QEmbarqueSoma: TOracleDataSet1;
    QEmbarqueSomaQT_EMBARQUE: TFloatField;
    QEmbarque_EmiteNotaNR_DIAS_CHEQUE4: TIntegerField;
    QREmbarqueCargaNOME_MOTORISTA: TStringField;
    QREmbarqueCargaDESC_PLACA: TStringField;
    QREmbarqueCargaVAL_BANCOS_NF: TFloatField;
    QEmbarqueDT_ATUALIZA_ESTOQUE: TDateTimeField;
    QREmbarquePedido: TOracleDataSet1;
    QREmbarquePedidoCOD_CADASTRO: TIntegerField;
    QREmbarquePedidoNOME: TStringField;
    QREmbarquePedidoDT_EMISSAO: TDateTimeField;
    QREmbarquePedidoDESC_OBSERVACAO: TStringField;
    QREmbarquePedidoNUM_PEDIDO: TIntegerField;
    QREmbarquePedidoDESC_PRODUTO: TStringField;
    QREmbarquePedidoSQT_PEDIDO: TFloatField;
    QREmbarquePedidoVAL_UNITARIO: TFloatField;
    QREmbarquePedidoPERC_DESCONTO: TFloatField;
    QREmbarquePedidoPERC_DESCONTO1: TFloatField;
    QREmbarquePedidoPERC_DESCONTO2: TFloatField;
    QREmbarquePedidoPERC_ACRESCIMO: TFloatField;
    QREmbarquePedidoval_total: TFloatField;
    QREmbarqueBaixado: TOracleDataSet1;
    QREmbarqueBaixadoCOD_EMBARQUE: TIntegerField;
    QREmbarqueBaixadoDT_ATUALIZA_ESTOQUE: TDateTimeField;
    QRProdutoEmbarcado: TOracleDataSet1;
    QRProdutoEmbarcadoCOD_FILIAL: TIntegerField;
    QRProdutoEmbarcadoCOD_PRODUTO: TFloatField;
    QRProdutoEmbarcadoDESC_PRODUTO: TStringField;
    QRProdutoEmbarcadoQT_QUANTIDADE: TFloatField;
    QRProdutoEmbarcadoCOD_CLASSE: TIntegerField;
    QRProdutoEmbarcadoDESC_CLASSE: TStringField;
    QREmbarque_RotaQT_TOTAL: TFloatField;
    QEmbarqueNUM_EMBARQUE: TIntegerField;
    QREmbarqueBaixadoNUM_EMBARQUE: TIntegerField;
    QREmbarqueCargaNUM_EMBARQUE: TIntegerField;
    QREmbarque2NUM_EMBARQUE: TIntegerField;
    QrAcertoCondPagtoNUM_EMBARQUE: TIntegerField;
    QREmbarque_RotaNOME_MOTORISTA: TStringField;
    QrEmbarque_Ped_Nf1VAL_IMPOSTO: TFloatField;
    QrEmbarque_Ped_NfSVAL_IMPOSTO: TFloatField;
    procedure QEmbarqueAfterInsert(DataSet: TDataSet);
    procedure QEmbarqueBeforeInsert(DataSet: TDataSet);
    procedure QEmbarqueBeforeEdit(DataSet: TDataSet);
    procedure QEmbarqueAfterCancel(DataSet: TDataSet);
    procedure QEmbarqueItemBeforeEdit(DataSet: TDataSet);
    procedure QEmbarqueItemBeforeDelete(DataSet: TDataSet);
    procedure QEmbarqueItemBeforeInsert(DataSet: TDataSet);
    procedure QEmbarqueItemAfterInsert(DataSet: TDataSet);
    procedure QEmbarqueCalcFields(DataSet: TDataSet);
    procedure QEmbarqueItemCalcFields(DataSet: TDataSet);
    procedure QEmbarqueItemAfterPost(DataSet: TDataSet);
    procedure QEmbarqueAfterPost(DataSet: TDataSet);
    procedure QrEmbarque_Ped_Nf1CalcFields(DataSet: TDataSet);
    procedure QEmbarque_EmiteNotaCalcFields(DataSet: TDataSet);
    procedure QREmbarque2CalcFields(DataSet: TDataSet);
    procedure QSomaNF2CalcFields(DataSet: TDataSet);
    procedure QEmbarqueItemBeforePost(DataSet: TDataSet);
    procedure QrAcertoCondPagtoCalcFields(DataSet: TDataSet);
    procedure QREmbarquePedidoCalcFields(DataSet: TDataSet);
    procedure QEmbarqueBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMEmbarque: TDMEmbarque;

implementation

uses UOracle_cl, UParamSistema_cl, USequencia_cl;

{$R *.DFM}

procedure TDMEmbarque.QEmbarqueAfterInsert(DataSet: TDataSet);
begin
  QEmbarqueItem.Close;
  QEmbarqueItem.Open;
end;

procedure TDMEmbarque.QEmbarqueBeforeInsert(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMEmbarque.QEmbarqueBeforeEdit(DataSet: TDataSet);
begin
  If Not DMOracle.DBCemapa.InTransaction Then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMEmbarque.QEmbarqueAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QEmbarque.Close;
  QEmbarque.Open;
end;

procedure TDMEmbarque.QEmbarqueItemBeforeEdit(DataSet: TDataSet);
begin
  If QEmbarque.State <> dsEdit Then
    Raise Exception.Create('Embarque não está no modo de Alteração!');
end;

procedure TDMEmbarque.QEmbarqueItemBeforeDelete(DataSet: TDataSet);
begin
  If QEmbarque.State <> dsEdit Then
     Raise Exception.Create('Embarque não está no modo de Alteração!');
end;

procedure TDMEmbarque.QEmbarqueItemBeforeInsert(DataSet: TDataSet);
begin
  If QEmbarque.State = dsInsert then
  Begin
    QEmbarque.Post;
    QEmbarque.Edit;
  End;
  If QEmbarque.State <> dsEdit Then
    Raise Exception.Create('Embarque não está no modo de Alteração!');
end;

procedure TDMEmbarque.QEmbarqueItemAfterInsert(DataSet: TDataSet);
begin
  QEmbarqueItemCod_Embarque.Value := QEmbarqueCod_Embarque.Value;
end;

procedure TDMEmbarque.QEmbarqueCalcFields(DataSet: TDataSet);
begin
  QEmbarquenome_transportador.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                      'COD_CADASTRO = '+FloatToStr(QEmbarqueCod_Transportador.Value));
end;

procedure TDMEmbarque.QEmbarqueItemCalcFields(DataSet: TDataSet);
begin
  QEmbarqueItemnum_pedido.Value := DMOracle.BuscaNome('SELECT NUM_PEDIDO FROM TB_PEDIDO_CAB',
                                   'COD_PEDIDO_CAB = '+FloatToStr(QEmbarqueItemCod_Pedido_Cab.Value));
  QEmbarqueItemnome_cliente.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO, TB_PEDIDO_CAB',
                                     'TB_PEDIDO_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO'
                                    +' AND TB_PEDIDO_CAB.COD_PEDIDO_CAB = '+FloatToStr(QEmbarqueItemCod_Pedido_Cab.Value));
  QEmbarqueSoma.Close;
  QEmbarqueSoma.Open;
                                    
end;

procedure TDMEmbarque.QEmbarqueItemAfterPost(DataSet: TDataSet);
begin
  QEmbarqueItem.Close;
  QEmbarqueItem.Open;
end;

procedure TDMEmbarque.QEmbarqueAfterPost(DataSet: TDataSet);
Var wCodigo : Real;
begin
  wCodigo := QEmbarqueCod_Embarque.Value;
  QEmbarque.Close;
  QEmbarque.SetVariable('PK',wCodigo);
  QEmbarque.Open;
end;

procedure TDMEmbarque.QrEmbarque_Ped_Nf1CalcFields(DataSet: TDataSet);
begin
    If QrEmbarque_Ped_Nf1Ind_condicao_Pagto.Value = '1' Then
       QrEmbarque_Ped_Nf1Desc_Condicao_Pagto.Value := 'A VISTA'
    else
       If QrEmbarque_Ped_Nf1Ind_condicao_Pagto.Value = '2' Then
          QrEmbarque_Ped_Nf1Desc_Condicao_Pagto.Value := 'A PRAZO'
       Else
          QrEmbarque_Ped_Nf1Desc_Condicao_Pagto.Value := 'CHEQUE ' + QrEmbarque_Ped_Nf1NR_DIAS_CHEQUE.Text + ' ' +
          QrEmbarque_Ped_Nf1NR_DIAS_CHEQUE1.Text + ' ' + QrEmbarque_Ped_Nf1NR_DIAS_CHEQUE2.Text + ' ' +
          QrEmbarque_Ped_Nf1NR_DIAS_CHEQUE3.Text;
end;

procedure TDMEmbarque.QEmbarque_EmiteNotaCalcFields(DataSet: TDataSet);
Var wCodigo_Prazo : String;
begin
  wCodigo_Prazo := DMOracle.BuscaNome('SELECT COD_PRAZO_VENCIMENTO FROM TB_PEDIDO_CAB',
                                   'COD_PEDIDO_CAB = '+FloatToStr(QEmbarque_EmiteNotaCod_Pedido_Cab.Value));
  if wCodigo_Prazo <> '' Then
     QEmbarque_EmiteNotaCod_Prazo_Vencimento.Value := StrToInt(wCodigo_Prazo);
end;

procedure TDMEmbarque.QREmbarque2CalcFields(DataSet: TDataSet);
begin
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL') or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') then
     QREmbarque2Sqt_Embalagem.Value := QREmbarque2Sqt_Pedido.Value * QREmbarque2Num_Volumes.Value
  Else
     QREmbarque2Sqt_Embalagem.Value := QREmbarque2Sqt_Pedido.Value * QREmbarque2Num_Embalagem.Value;
end;

procedure TDMEmbarque.QSomaNF2CalcFields(DataSet: TDataSet);
begin
  QSomaNF2sVal_Total.Value := (QSomaNF2VAL_AVISTA.Value + QSomaNF2VAL_APRAZO.Value +
                               QSomaNF2VAL_OUTROS.Value + QSomaImpostosVal_Imposto.Value);
end;

procedure TDMEmbarque.QEmbarqueItemBeforePost(DataSet: TDataSet);
Var wNumero,wCadastro : String;
begin
  If QEmbarqueItemNum_Sequencial.Text = '' Then
   Begin
     wNumero:=DMOracle.BuscaNome('SELECT MAX(NUM_SEQUENCIAL) FROM TB_EMBARQUE_ITEM',
                                 'COD_EMBARQUE = '+FloatToStr(QEmbarqueItemCod_Embarque.Value));
     If wNumero <> '' Then
        QEmbarqueItemNum_Sequencial.Value := StrToInt(wNumero) + 1
     else
        QEmbarqueItemNum_Sequencial.Value := 1;
   end;

   If Trim(DMEmbarque.QEmbarqueItemCod_Pedido_Cab.Text) <> '' Then
    begin
     wCadastro := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_PEDIDO_CAB','COD_PEDIDO_CAB = '+DMEmbarque.QEmbarqueItemCod_Pedido_Cab.Text);

   If Trim(DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO',' COD_CADASTRO = '+wCadastro)) <> '' then
       raise exception.Create('ATENÇÃO - Cadastro Cancelado, Verifique!');
    end;
end;

procedure TDMEmbarque.QrAcertoCondPagtoCalcFields(DataSet: TDataSet);
Var wCodBanco : String;
begin
  If QrAcertoCondPagtoCod_Nota_Cab.Text <> '' Then
  Begin
    wCodBanco:=DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_RECEBER_CAB',
                                  'COD_NOTA_CAB = '+FloatToStr(QrAcertoCondPagtoCod_Nota_Cab.Value));
    If wCodBanco <> '' Then
       QrAcertoCondPagtoDesc_Sigla.Value:=DMOracle.BuscaNome('SELECT DESC_SIGLA FROM TB_BANCO_AGENCIA',
                                  'COD_BANCO_AGENCIA = '+wCodBanco);
  End;
end;

procedure TDMEmbarque.QREmbarquePedidoCalcFields(DataSet: TDataSet);
begin
  QREmbarquePedidoVal_Total.Value := QREmbarquePedidosQt_Pedido.Value *
                                     QREmbarquePedidoVal_Unitario.Value;
  If QREmbarquePedidoPerc_Desconto.Value > 0 Then
     QREmbarquePedidoVal_Total.Value := QREmbarquePedidoVal_Total.Value -
       (QREmbarquePedidoVal_Total.Value * QREmbarquePedidoPerc_Desconto.Value / 100);
  If QREmbarquePedidoPerc_Desconto1.Text <> '' Then
     QREmbarquePedidoVal_Total.Value := QREmbarquePedidoVal_Total.Value -
       (QREmbarquePedidoVal_Total.Value * QREmbarquePedidoPerc_Desconto1.Value / 100);
  If QREmbarquePedidoPerc_Desconto2.Text <> '' Then
     QREmbarquePedidoVal_Total.Value := QREmbarquePedidoVal_Total.Value -
       (QREmbarquePedidoVal_Total.Value * QREmbarquePedidoPerc_Desconto2.Value / 100);
  If QREmbarquePedidoPerc_Acrescimo.Text <> '' Then
     QREmbarquePedidoVal_Total.Value := QREmbarquePedidoVal_Total.Value +
       (QREmbarquePedidoVal_Total.Value * QREmbarquePedidoPerc_Acrescimo.Value / 100);
end;

procedure TDMEmbarque.QEmbarqueBeforePost(DataSet: TDataSet);
begin
if QEmbarqueNUM_EMBARQUE.Text = '' Then
   Begin
     QEmbarqueNUM_EMBARQUE.Value:=DMSequencia.Sequencia(Trunc(1),'EMBARQUE');

   End;
end;

end.
