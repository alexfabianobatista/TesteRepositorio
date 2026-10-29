unit UObraContrato_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMObraContrato = class(TDataModule)
    QObraContrato_Cad: TOracleDataSet1;
    QObraContrato_CadCOD_FILIAL: TIntegerField;
    QObraContrato_CadCOD_CADASTRO: TIntegerField;
    QObraContrato_CadCOD_OBRA: TIntegerField;
    QObraContrato_CadNUM_CONTRATO: TStringField;
    QObraContrato_CadVL_CONTRATO: TFloatField;
    QObraContrato_CadIND_ACABADA: TStringField;
    QObraContrato_CadQT_OBRA: TFloatField;
    QObraContrato_CadVL_OBRA: TFloatField;
    QObraContrato_CadDT_INICIO: TDateTimeField;
    QObraContrato_CadDESC_TRECHO: TStringField;
    QObraContrato_CadCOD_OBRA_CONTRATO: TIntegerField;
    QObraContrato_CadIND_SITUACAO: TStringField;
    QObraContrato_Cons: TOracleDataSet1;
    QObraContrato_ConsCOD_FILIAL: TIntegerField;
    QObraContrato_ConsCOD_CADASTRO: TIntegerField;
    QObraContrato_ConsCOD_OBRA: TIntegerField;
    QObraContrato_ConsNUM_CONTRATO: TStringField;
    QObraContrato_ConsVL_CONTRATO: TFloatField;
    QObraContrato_ConsIND_ACABADA: TStringField;
    QObraContrato_ConsQT_OBRA: TFloatField;
    QObraContrato_ConsVL_OBRA: TFloatField;
    QObraContrato_ConsDT_INICIO: TDateTimeField;
    QObraContrato_ConsDESC_TRECHO: TStringField;
    QObraContrato_ConsDESC_OBSERVACAO: TStringField;
    QObraContrato_ConsCOD_OBRA_CONTRATO: TIntegerField;
    QObraContrato_ConsIND_SITUACAO: TStringField;
    QObraContrato_ConsNOME: TStringField;
    QObraContrato_ConsDESC_FILIAL: TStringField;
    QObraContrato_ConsDESC_OBRA: TStringField;
    QContaReceberCab: TOracleDataSet1;
    QContaReceberMov: TOracleDataSet1;
    QContaReceberMovCOD_CONTA_RECEBER_MOV: TIntegerField;
    QContaReceberMovCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContaReceberMovDT_MOVIMENTO: TDateTimeField;
    QContaReceberMovVAL_MOVIMENTO: TFloatField;
    QContaReceberMovDESC_OBSERVACAO: TStringField;
    QContaReceberMovCOD_USUARIO: TIntegerField;
    QContaReceberMovDT_USUARIO: TDateTimeField;
    QContaReceberMovIND_TIPO_MOVIMENTO: TStringField;
    QContaReceberMovCOD_BCO_MOVIMENTO: TIntegerField;
    QContaReceberMovCOD_CAIXA_MOV: TIntegerField;
    QContaReceberMovCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContaReceberMovCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QContaReceberMovCOD_NOTA_CAB: TIntegerField;
    QContaReceberCabCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContaReceberCabCOD_FINALIDADE: TIntegerField;
    QContaReceberCabCOD_BANCO_AGENCIA: TIntegerField;
    QContaReceberCabCOD_FILIAL: TIntegerField;
    QContaReceberCabNUM_PARCELA: TIntegerField;
    QContaReceberCabDESC_TIPO_DOCUMENTO: TStringField;
    QContaReceberCabDT_MOVIMENTO: TDateTimeField;
    QContaReceberCabDT_BAIXA: TDateTimeField;
    QContaReceberCabDT_VENCIMENTO: TDateTimeField;
    QContaReceberCabDT_EMISSAO: TDateTimeField;
    QContaReceberCabDT_CAPITALIZACAO: TDateTimeField;
    QContaReceberCabVAL_TITULO: TFloatField;
    QContaReceberCabVAL_NEGOCIO: TFloatField;
    QContaReceberCabIND_ACEITE: TStringField;
    QContaReceberCabIND_SITUACAO: TStringField;
    QContaReceberCabDESC_OBSERVACAO: TStringField;
    QContaReceberCabCOD_NOTA_CAB: TIntegerField;
    QContaReceberCabCOD_CADASTRO: TIntegerField;
    QContaReceberCabVAL_ORIGINAL: TFloatField;
    QContaReceberCabCOD_NOSSO_NUMERO: TStringField;
    QContaReceberCabVAL_JUROS: TFloatField;
    QContaReceberCabCOD_DEPARTAMENTO: TIntegerField;
    QContaReceberCabCOD_CONTRATO_VEND: TIntegerField;
    QContaReceberCabDESC_AVALISTA1: TStringField;
    QContaReceberCabDESC_AVALISTA2: TStringField;
    QContaReceberCabCOD_VENDEDOR: TIntegerField;
    QContaReceberCabPERC_COMISSAO: TFloatField;
    QContaReceberCabDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QContaReceberCabVAL_PROMISSORIA: TFloatField;
    QContaReceberCabIND_ENVIADO_BANCO: TStringField;
    QContaReceberCabCOD_CONTA_CORRENTE: TIntegerField;
    QContaReceberCabCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QContaReceberCabCOD_OBRA_CONTRATO: TIntegerField;
    QObraContrato_CadCOD_MOTIVO: TIntegerField;
    QRRelTitulosObraContrato: TOracleDataSet1;
    QRRelTitulosObraContratoCOD_OBRA_CONTRATO: TIntegerField;
    QRRelTitulosObraContratoCOD_OBRA: TIntegerField;
    QRRelTitulosObraContratoNUM_CONTRATO: TStringField;
    QRRelTitulosObraContratoVL_OBRA: TFloatField;
    QRRelTitulosObraContratoVL_CONTRATO: TFloatField;
    QRRelTitulosObraContratoQT_OBRA: TFloatField;
    QRRelTitulosObraContratoCOD_CADASTRO: TIntegerField;
    QRRelTitulosObraContratoDESC_TRECHO: TStringField;
    QRRelTitulosObraContratoDESC_OBRA: TStringField;
    QRRelTitulosObraContratoNOME: TStringField;
    QRRelTitulosObraContratoVAL_DESCONTO: TFloatField;
    QRRelTitulosObraContratoVAL_JURO: TFloatField;
    QRRelTitulosObraContratoVAL_PAGAMENTO: TFloatField;
    QRRelTitulosObraContratoDT_MOVIMENTO: TDateTimeField;
    QRRelTitulosObraContratoVAL_TOTAL: TFloatField;
    QRRelTitulosObraContratoDT_EMISSAO: TDateTimeField;
    QRRelTitulosObraContratoDT_VENCIMENTO: TDateTimeField;
    QObraContratoMov: TOracleDataSet1;
    QObraContratoMovCOD_OBRA_CONTRATO_MOV: TIntegerField;
    QObraContratoMovCOD_OBRA_CONTRATO: TIntegerField;
    QObraContratoMovDT_OBRA_CONTRATO_MOV: TDateTimeField;
    QObraContratoMovVAL_OBRA_CONTRATO_MOV: TFloatField;
    DSObraContratoMov: TDataSource;
    QObraContratoMovCons: TOracleDataSet1;
    QObraContratoMovConsCOD_OBRA_CONTRATO: TIntegerField;
    QObraContratoMovConsCOD_OBRA_CONTRATO_MOV: TIntegerField;
    QObraContratoMovConsNOME: TStringField;
    QObraContratoMovConsVL_CONTRATO: TFloatField;
    QObraContratoMovConsVAL_OBRA_CONTRATO_MOV: TFloatField;
    QRRelTitulosObraContratoDESC_OBSERVACAO: TStringField;
    QContaReceberCabCOD_OBRA: TIntegerField;
    QObraContrato_Aditivo: TOracleDataSet1;
    QObraContrato_AditivoCOD_OBRA_CONTRATO: TIntegerField;
    QObraContrato_AditivoCOD_OBRA_CONTRATO_ADITIVO: TIntegerField;
    QObraContrato_AditivoVL_ADITIVO: TFloatField;
    QObraContrato_AditivoDT_ADITIVO: TDateTimeField;
    QObraContrato_AditivoDESC_ADITIVO: TStringField;
    QContaReceberAditivo: TOracleDataSet1;
    QContaReceberAditivoCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContaReceberAditivoIND_SITUACAO: TStringField;
    QContaReceberCabNUM_TITULO: TFloatField;
    QContaReceberCabCOD_OBRA_CONTRATO_ADITIVO: TIntegerField;
    QObraContratoProduto: TOracleDataSet1;
    QObraContratoProdutoCOD_OBRA_CONTRATO_PRODUTO: TIntegerField;
    QObraContratoProdutoCOD_OBRA_CONTRATO: TIntegerField;
    QObraContratoProdutoQT_QUANTIDADE: TFloatField;
    QObraContratoProdutodesc_produto: TStringField;
    QObraContratoProdutoCOD_PRODUTO: TFloatField;
    QObraContratoProdutoQT_MOVIMENTO: TFloatField;
    QRObraContratoProduto: TOracleDataSet1;
    QRObraContratoProdutoCOD_PRODUTO: TFloatField;
    QRObraContratoProdutoQT_QUANTIDADE: TFloatField;
    QRObraContratoProdutoQT_MOVIMENTO: TFloatField;
    QRObraContratoProdutoQT_SALDO: TFloatField;
    QRObraContratoProdutoDESC_PRODUTO: TStringField;
    QRObraContratoProdutoCOD_CADASTRO: TIntegerField;
    QRObraContratoProdutoCOD_OBRA: TIntegerField;
    QRObraContratoProdutoNOME: TStringField;
    QRObraContratoProdutoCOD_OBRA_CONTRATO: TIntegerField;
    QObraContratoProdutoVAL_PRODUTO: TFloatField;
    QObraContrato_CadDESC_OBSERVACAO: TStringField;
    procedure QObraContrato_CadBeforeEdit(DataSet: TDataSet);
    procedure QObraContrato_CadAfterEdit(DataSet: TDataSet);
    procedure QObraContratoMovAfterInsert(DataSet: TDataSet);
    procedure QObraContrato_CadAfterInsert(DataSet: TDataSet);
    procedure QObraContrato_CadAfterPost(DataSet: TDataSet);
    procedure QObraContrato_AditivoAfterInsert(DataSet: TDataSet);
    procedure QObraContrato_CadBeforePost(DataSet: TDataSet);
    procedure QObraContrato_AditivoBeforeDelete(DataSet: TDataSet);
    procedure QObraContratoProdutoCalcFields(DataSet: TDataSet);
    procedure QObraContratoProdutoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMObraContrato: TDMObraContrato;

implementation

uses UOracle_cl, UUsuario_cl, USequencia_cl, UContasReceber_cl;

{$R *.DFM}

procedure TDMObraContrato.QObraContrato_CadBeforeEdit(DataSet: TDataSet);
begin
  If QObraContrato_CadInd_Situacao.Value <> '1' then
    Raise Exception.Create('Este Contrato já está confirmado ou cancelado!');

end;

procedure TDMObraContrato.QObraContrato_CadAfterEdit(DataSet: TDataSet);
begin
// RETIRADO PELO CÉSAR POR NAO SABER PORQUE USA ESTA QUERY 12/09/2011
//  DMObraContrato.QObraContratoMov.Close;
//  DMObraContrato.QObraContratoMov.Open;
end;

procedure TDMObraContrato.QObraContratoMovAfterInsert(DataSet: TDataSet);
begin
  QObraContratoMovCod_Obra_Contrato.Value := QObraContrato_CadCod_Obra_Contrato.Value;
  QObraContratoMovDt_Obra_Contrato_Mov.Value := Date;
end;

procedure TDMObraContrato.QObraContrato_CadAfterInsert(DataSet: TDataSet);
begin
  QObraContrato_CadCod_Filial.Value := DMUsuario.CodFilialUsuario;
end;

procedure TDMObraContrato.QObraContrato_CadAfterPost(DataSet: TDataSet);
Var wCodigo : Real;
Begin
  wCodigo := QObraContrato_CadCod_Obra_Contrato.Value;
  QObraContrato_Cad.Close;
  QObraContrato_Cad.SetVariable('PK',wCodigo);
  QObraContrato_Cad.Open;

end;

procedure TDMObraContrato.QObraContrato_AditivoAfterInsert(
  DataSet: TDataSet);
begin
  QObraContrato_AditivoCod_Obra_Contrato.Value := QObraContrato_CadCod_Obra_Contrato.Value;
  
end;

procedure TDMObraContrato.QObraContrato_CadBeforePost(DataSet: TDataSet);
begin
  If QObraContrato_CadNum_Contrato.Text = '' Then
   Begin
     QObraContrato_CadNum_Contrato.Value := IntToStr(DMSequencia.Sequencia(QObraContrato_CadCod_Filial.Value,'CONTRATOOBRA'));
     if DMOracle.DBCemapa.inTransaction then
      Begin
        DMOracle.DBCemapa.Commit;
        DMOracle.DBCemapa.StartTransaction;
      End;
   End;
end;

procedure TDMObraContrato.QObraContrato_AditivoBeforeDelete(
  DataSet: TDataSet);
begin
  //pega contas receber do aditivo
  QContaReceberAditivo.close;
  QContaReceberAditivo.SetVariable('COD_OBRA_CONTRATO_ADITIVO',QObraContrato_AditivoCOD_OBRA_CONTRATO_ADITIVO.Text);
  QContaReceberAditivo.open;

  Try
    //verifica se contas a receber tem baixas
    QContaReceberAditivo.First;
    while not QContaReceberAditivo.Eof do
    begin
      if QContaReceberAditivoIND_SITUACAO.Value <> 'ABERTO' then
      Raise Exception.Create('Contas a receber com baixa.');
      QContaReceberAditivo.Next;
    end;

    QContaReceberAditivo.First;
    while not QContaReceberAditivo.Eof do
    begin
      dmcontasreceber.QExcluiMov.close;
      dmcontasreceber.QExcluiMov.SetVariable('COD_CONTA_RECEBER',QContaReceberAditivoCOD_CONTA_RECEBER_CAB.Value);
      DMContasReceber.QExcluiMov.open;
      DMOracle.ExecutaSql('DELETE FROM TB_conta_receber_cab WHERE COD_CONTA_RECEBER_CAB = ' + QContaReceberAditivoCOD_CONTA_RECEBER_CAB.Text, true);
      QContaReceberAditivo.Next;
    end;
    ShowMessage('Volta do Aditivo realizada com sucesso.');
  Except
    DMOracle.DBCemapa.RollBack;
  Raise;
  end;
end;

procedure TDMObraContrato.QObraContratoProdutoCalcFields(
  DataSet: TDataSet);
begin
  if not QObraContratoProdutoCOD_PRODUTO.IsNull then
     QObraContratoProdutodesc_produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+QObraContratoProdutoCOD_PRODUTO.Text,True);

end;

procedure TDMObraContrato.QObraContratoProdutoAfterInsert(
  DataSet: TDataSet);
begin
  QObraContratoProdutoCod_Obra_Contrato.Value := QObraContrato_CadCod_Obra_Contrato.Value;

end;

end.
