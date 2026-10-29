unit UCustoVeiculoMov_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMCustoVeiculoMov = class(TDataModule)
    QCustoVeiculoMovCad: TOracleDataSet1;
    QCustoVeiculoMovCadnum_placa: TStringField;
    QCustoVeiculoMovCaddesc_produto: TStringField;
    QCustoVeiculoMovCons: TOracleDataSet1;
    QCustoVeiculoMovConsCOD_CUSTO_VEICULO_MOV: TIntegerField;
    QCustoVeiculoMovConsNUM_PLACA: TStringField;
    QCustoVeiculoMovConsKM: TFloatField;
    QCustoVeiculoMovConsVL_CUSTO: TFloatField;
    QCustoVeiculoMovCadCOD_CUSTO_VEICULO_MOV: TIntegerField;
    QCustoVeiculoMovCadVL_CUSTO: TFloatField;
    QCustoVeiculoMovCadDT_MOVIMENTO: TDateTimeField;
    QCustoVeiculoMovCadCOD_USUARIO: TIntegerField;
    QCustoVeiculoMovCadCOD_CAIXA_MOV: TIntegerField;
    QCustoVeiculoMovCadCOD_NOTA_ITEM: TIntegerField;
    QCustoVeiculoMovCadNUM_VEICULO: TIntegerField;
    QCustoVeiculoMovCadCOD_VEICULO: TIntegerField;
    QCustoVeiculoMovCadCOD_FINALIDADE: TIntegerField;
    QCustoVeiculoMovCadCOD_HISTORICO: TIntegerField;
    QCustoVeiculoMovCaddesc_finalidade: TStringField;
    QCustoVeiculoMovCaddesc_historico: TStringField;
    QCustoVeiculoMovConsCOD_VEICULO: TIntegerField;
    QCustoVeiculoMovConsNUM_VEICULO: TIntegerField;
    QCustoVeiculoMovCadCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRCustoVeiculoMov: TOracleDataSet1;
    QRCustoVeiculoMovCOD_CUSTO_VEICULO_MOV: TFloatField;
    QRCustoVeiculoMovNUM_VEICULO: TFloatField;
    QRCustoVeiculoMovCOD_VEICULO: TFloatField;
    QRCustoVeiculoMovVL_CUSTO: TFloatField;
    QRCustoVeiculoMovKM: TFloatField;
    QRCustoVeiculoMovNUM_PLACA: TStringField;
    QRCustoVeiculoMovTIPO: TStringField;
    QRCustoPorVeiculo: TOracleDataSet1;
    QCustoVeiculoMovCadKM: TFloatField;
    QCustoVeiculoMovCadCOD_PRODUTO: TFloatField;
    QCustoVeiculoMovCadind_km: TStringField;
    QCustoVeiculoMovCadind_tp_produto: TStringField;
    QRCustoPorVeiculoNUM_PLACA: TStringField;
    QRCustoPorVeiculoNOME: TStringField;
    QRCustoPorVeiculoVEICULO: TStringField;
    QRGastoVeiculo: TOracleDataSet1;
    QRCustoPorVeiculoCOD_VEICULO: TFloatField;
    QRCustoPorVeiculoCUSTO: TFloatField;
    QRGastoVeiculoNUM_PLACA: TStringField;
    QRGastoVeiculoDESC_FABRICANTE: TStringField;
    QRGastoVeiculoDESC_MODELO: TStringField;
    QRGastoVeiculoDESC_COR: TStringField;
    QRGastoVeiculoMOTORISTA: TStringField;
    QRGastoVeiculoCADASTRO: TStringField;
    QRGastoVeiculoKM: TFloatField;
    QCustoVeiculoMovCadQT_QUANTIDADE: TFloatField;
    QCustoVeiculoMovCadcod_nota_cab: TIntegerField;
    QRCustoPorVeiculoQTDE: TFloatField;
    QRGastoVeiculoQT_QUANTIDADE: TFloatField;
    QRGastoVeiculoVL_CUSTO: TFloatField;
    QRGastoVeiculoNF: TStringField;
    QCustoVeiculoMovCadDT_LCTO: TDateTimeField;
    QRCustoVeiculoMovDT_LCTO: TDateTimeField;
    QRGastoVeiculoDT_LCTO: TDateTimeField;
    QCustoVeiculoMovCadCOD_CADASTRO: TIntegerField;
    QCustoVeiculoMovCadnome: TStringField;
    QRGastoVeiculoDT_MOVIMENTO: TDateTimeField;
    QRMedia: TOracleDataSet1;
    QRMediaNUM_PLACA: TStringField;
    QRMediaQTDE_MEDIA: TFloatField;
    QRMediaCUSTO_MEDIA: TFloatField;
    QRMediaVL_UNITARIO_MEDIA: TFloatField;
    QRMediaKM_I: TFloatField;
    QRMediaKM_F: TFloatField;
    QRMediaTOTAL_KM: TFloatField;
    QRMediaMEDIA: TFloatField;
    QRMediaDESC_FABRICANTE: TStringField;
    QRMediaDESC_MODELO: TStringField;
    QRMediaDESC_COR: TStringField;
    QRMediaMOTORISTA: TStringField;
    QRMediaQTDE_MOV: TFloatField;
    QRMediaCUSTO_MOV: TFloatField;
    QRMediaDT_LCTO: TDateTimeField;
    QRMediaDT_MOVIMENTO: TDateTimeField;
    QRMediaNF: TStringField;
    QRMediaKM: TFloatField;
    QRMediaCADASTRO: TStringField;
    QRResumoDespesa: TOracleDataSet1;
    QRResumoDespesaNUM_PLACA: TStringField;
    QRResumoDespesaDESC_MODELO: TStringField;
    QRResumoDespesaDESC_COR: TStringField;
    QRResumoDespesaNOME: TStringField;
    QRResumoDespesaCUSTO: TFloatField;
    QRResumoDespesaCLASSIFICACAO: TStringField;
    QRGastoVeiculoPRODUTO: TStringField;
    QRCustoVeiculoMovPRODUTO: TStringField;
    QRMediaPRODUTO: TStringField;
    QRCustoPorVeiculoPRODUTO: TStringField;
    QRGastoVeiculoDT_MOVIMENTO_ENTRADA: TDateTimeField;
    QRGastoVeiculo2: TOracleDataSet1;
    QRGastoVeiculo2NUM_PLACA: TStringField;
    QRGastoVeiculo2DESC_FABRICANTE: TStringField;
    QRGastoVeiculo2DESC_MODELO: TStringField;
    QRGastoVeiculo2DESC_COR: TStringField;
    QRGastoVeiculo2MOTORISTA: TStringField;
    QRGastoVeiculo2PRODUTO: TStringField;
    QRGastoVeiculo2QT_QUANTIDADE: TFloatField;
    QRGastoVeiculo2VL_CUSTO: TFloatField;
    QRGastoVeiculo2DT_LCTO: TDateTimeField;
    QRGastoVeiculo2DT_MOVIMENTO: TDateTimeField;
    QRGastoVeiculo2NF: TStringField;
    QRGastoVeiculo2CADASTRO: TStringField;
    QRGastoVeiculo2KM: TFloatField;
    QRGastoVeiculo2IND_KM: TStringField;
    QRMediaULT_KM: TFloatField;
    QRGastoVeiculo2ULT_KM: TFloatField;
    QRMediaCOD_VEICULO: TFloatField;
    QRMediaNUM_ANO_FAB: TFloatField;
    QRGastoVeiculoCOD_VEICULO: TIntegerField;
    QRGastoVeiculoNUM_ANO_FAB: TIntegerField;
    QRGastoVeiculo2COD_VEICULO: TFloatField;
    QRGastoVeiculo2NUM_ANO_FAB: TFloatField;
    QCustoVeiculoMovCadNUM_NOTA_REQUISICAO: TIntegerField;
    QRGastoVeiculo2NUM_CHASSI: TStringField;
    QRCustoVeiculo_Receita: TOracleDataSet1;
    QRCustoVeiculo_ReceitaNUM_PLACA: TStringField;
    QRCustoVeiculo_ReceitaVEICULO: TStringField;
    QRCustoVeiculo_ReceitaDT_MOVIMENTO: TDateTimeField;
    QRCustoVeiculo_ReceitaVL_CUSTO_DESPESAS: TFloatField;
    QRCustoVeiculo_ReceitaQT_DESPESAS: TFloatField;
    QRCustoVeiculo_ReceitaVL_TOTAL_RECEITAS: TFloatField;
    QRCustoVeiculo_ReceitaQT_RECEITAS: TFloatField;
    QRCustoVeiculo_ReceitaDESC_PRODUTO: TStringField;
    QCustoVeiculoMovConsDT_MOVIMENTO: TDateTimeField;
    QCustoVeiculoMovConsNUM_NOTA_REQUISICAO: TIntegerField;
    QCustoVeiculoMovCadDESC_OBSERVACAO: TStringField;
    QCustoVeiculoMovCadIND_ESTOQUE_ATUALIZADO: TStringField;
    QCustoVeiculoMovConsCOD_FILIAL: TIntegerField;
    QCustoVeiculoMovCadnomeProdutor: TStringField;
    QCustoVeiculoMovCadCOD_CADASTRO_PRODUTOR: TIntegerField;
    QRGastoVeiculoCOD_CADASTRO_PRODUTOR: TIntegerField;
    QRGastoVeiculonomeProdutor: TStringField;
    QRGastoVeiculo2COD_CADASTRO_PRODUTOR: TIntegerField;
    QRGastoVeiculo2nomeProdutor: TStringField;
    QRCustoVeiculo_ReceitaNOME: TStringField;
    QRCustoVeiculo_ReceitaDESC_UNIDADE: TStringField;
    QCustoVeiculoMovCadHR_VEICULO: TFloatField;
    QRGastoVeiculoHR_VEICULO: TFloatField;
    QCustoVeiculoMovConsCOD_PRODUTO: TFloatField;
    QCustoVeiculoMovCadCOD_LOTE_TIPO: TIntegerField;
    QCustoVeiculoMovCadVL_UNITARIO: TFloatField;
    QRGastoVeiculoReq: TOracleDataSet1;
    QRGastoVeiculoReqCOD_VEICULO: TIntegerField;
    QRGastoVeiculoReqNUM_PLACA: TStringField;
    QRGastoVeiculoReqNUM_ANO_FAB: TIntegerField;
    QRGastoVeiculoReqDESC_FABRICANTE: TStringField;
    QRGastoVeiculoReqDESC_MODELO: TStringField;
    QRGastoVeiculoReqDESC_COR: TStringField;
    QRGastoVeiculoReqMOTORISTA: TStringField;
    QRGastoVeiculoReqPRODUTO: TStringField;
    QRGastoVeiculoReqQT_QUANTIDADE: TFloatField;
    QRGastoVeiculoReqVL_CUSTO: TFloatField;
    QRGastoVeiculoReqDT_LCTO: TDateTimeField;
    QRGastoVeiculoReqDT_MOVIMENTO: TDateTimeField;
    QRGastoVeiculoReqNF: TFloatField;
    QRGastoVeiculoReqCADASTRO: TStringField;
    QRGastoVeiculoReqKM: TFloatField;
    QRGastoVeiculoReqCOD_CADASTRO_PRODUTOR: TIntegerField;
    QRGastoVeiculoReqDT_MOVIMENTO_ENTRADA: TDateTimeField;
    QRGastoVeiculoReqHR_VEICULO: TFloatField;
    QRGastoVeiculoReqCOD_CADASTRO: TIntegerField;
    QRGastoVeiculoReqVAL_UNITARIO: TFloatField;
    QCustoVeiculoMovConsQT_QUANTIDADE: TFloatField;
    QCustoVeiculoMovConsVAL_UNITARIO: TFloatField;
    QCustoVeiculoMovConsDESC_PRODUTO: TStringField;
    QCustoVeiculoMovCadVL_DESCONTO: TFloatField;
    QCustoVeiculoMovConsVL_DESCONTO: TFloatField;
    QRCustoVeiculo_ReceitaSintetico: TOracleDataSet1;
    QRCustoVeiculo_ReceitaSinteticoNUM_PLACA: TStringField;
    QRCustoVeiculo_ReceitaSinteticoVL_CUSTO_DESPESAS: TFloatField;
    QRCustoVeiculo_ReceitaSinteticoVL_TOTAL_RECEITAS: TFloatField;
    QRCustoVeiculo_ReceitaSinteticoVEICULO: TStringField;
    QRCustoVeiculo_ReceitaMensal: TOracleDataSet1;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    QRCustoVeiculo_ReceitaMensalMES: TFloatField;
    QRCustoVeiculo_ReceitaMensalANO: TFloatField;
    QRCustoVeiculo_ReceitaDESC_OBSERVACAO: TStringField;
    QRCustoVeiculo_ReceitaDESC_CARACTERISTICA: TStringField;
    QRCustoVeiculo_ReceitaMensalDESC_CARACTERISTICA: TStringField;
    QRCustoVeiculo_ReceitaSinteticoDESC_CARACTERISTICA: TStringField;
    QRCustoVeiculo_ReceitaDESC_OBS_VEICULO: TStringField;
    QRCustoVeiculo_ReceitaCOD_VEICULO: TIntegerField;
    QRCustoVeiculo_ReceitaNUM_REQUISICAO: TFloatField;
    QRCustoVeiculo_ReceitaKM: TFloatField;
    QRCustoVeiculo_ReceitaDESC_OBSERVACAO2: TStringField;
    QRRequisicaoVeiculo: TOracleDataSet1;
    QRCustoPorVeiculoDESC_CARACTERISTICA: TStringField;
    QRCustoVeiculo_Receitapeso_liq: TFloatField;
    QRCustoVeiculo_ReceitaNUM_ROMANEIO: TFloatField;
    QRCustoVeiculo_ReceitaVAL_KM_DISTANCIA: TFloatField;
    QRCustoVeiculo_ReceitaVAL_PRECO_TARIFA: TFloatField;
    QRCustoVeiculo_ReceitaQT_PESO_BRUTO: TFloatField;
    QRCustoVeiculo_ReceitaQT_TARA: TFloatField;
    QCustoVeiculoMovConsFORNECEDOR: TStringField;
    procedure QCustoVeiculoMovCadCalcFields(DataSet: TDataSet);
    procedure QCustoVeiculoMovCadAfterInsert(DataSet: TDataSet);
    procedure QCustoVeiculoMovCadBeforePost(DataSet: TDataSet);
    procedure AlteraCustoVei(wTela: String; wCod,wDoc: Integer);
    procedure QCustoVeiculoMovCadBeforeDelete(DataSet: TDataSet);
    procedure QRGastoVeiculoCalcFields(DataSet: TDataSet);
    procedure QRGastoVeiculo2CalcFields(DataSet: TDataSet);
    procedure QCustoVeiculoMovCadVL_UNITARIOValidate(Sender: TField);
    procedure QCustoVeiculoMovCadQT_QUANTIDADEValidate(Sender: TField);
    procedure QCustoVeiculoMovCadVL_DESCONTOValidate(Sender: TField);
    procedure QRCustoVeiculo_ReceitaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExcluiCustoVei(wTela: String; wCod:Integer);
  end;

var
  DMCustoVeiculoMov: TDMCustoVeiculoMov;

implementation

uses UOracle_cl, UUsuario_cl, UVeiculo_cl, UParamSistema_cl;

{$R *.DFM}

{*------------------------------------------------------------------------------
Procedimento para excluir movimento custos de veículos lançados pelo Contas a
Pagar/Caixa e Nota Saída - PMC 31/03/2004
------------------------------------------------------------------------------*}
procedure TDMCustoVeiculoMov.ExcluiCustoVei(wTela: String; wCod: Integer);
begin
  if Trim(wTela) = '' then
    Raise Exception.Create('Tela deve ser Informada');
  if wCod = 0 then
    Raise Exception.Create('Código do Movimento(Caixa/Conta Pagar/Nota Item) deve ser Informado');
  DMOracle.QExecSQL.Close;
  DMOracle.QExecSQL.SQL.Clear;
  DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_CUSTO_VEICULO_MOV WHERE ');
  if Trim(wTela) = 'CONTA PAGAR' then
    DMOracle.QExecSQL.SQL.Add('COD_CONTA_PAGAR_CAB = '+IntToStr(wCod))
  else if Trim(wTela) = 'NOTA SAIDA' then
    DMOracle.QExecSQL.SQL.Add('COD_NOTA_ITEM = '+IntToStr(wCod))
  else if Trim(wTela) = 'CAIXA MOV' then
    DMOracle.QExecSQL.SQL.Add('COD_CAIXA_MOV = '+IntToStr(wCod))
  else
    Raise Exception.Create('Tela Desconhecida');
  DMOracle.QExecSQL.ExecSQL;
end;

{*------------------------------------------------------------------------------
Procedimento para Alterar movimento custos de veículos lançados pelo Contas a
Pagar - PMC 10/05/2004
------------------------------------------------------------------------------*}
procedure TDMCustoVeiculoMov.AlteraCustoVei(wTela: String; wCod,wDoc: Integer);
begin
  if Trim(wTela) = '' then
    Raise Exception.Create('Tela deve ser Informada');
  if wCod = 0 then
    Raise Exception.Create('Código do Conta Pagar deve ser Informado');
  DMOracle.QExecSQL.Close;
  DMOracle.QExecSQL.SQL.Clear;
  DMOracle.QExecSQL.SQL.Add('UPDATE TB_CUSTO_VEICULO_MOV SET ');
  if Trim(wTela) = 'CONTA PAGAR' then
    DMOracle.QExecSQL.SQL.Add('COD_FINALIDADE = +'+IntToStr(wDoc)+' WHERE COD_CONTA_PAGAR_CAB = '+IntToStr(wCod))
  else
    Raise Exception.Create('Tela Desconhecida');
  DMOracle.QExecSQL.ExecSQL;
end;

procedure TDMCustoVeiculoMov.QCustoVeiculoMovCadCalcFields(
  DataSet: TDataSet);
begin
  if Trim(QCustoVeiculoMovCadCOD_VEICULO.Text) <> '' then
    QCustoVeiculoMovCadnum_placa.Value := DMOracle.BuscaNome('SELECT NUM_PLACA FROM TB_VEICULO',
                                                             'COD_VEICULO = '+QCustoVeiculoMovCadCOD_VEICULO.Text)
  else
    QCustoVeiculoMovCadnum_placa.Value := '';

  if Trim(QCustoVeiculoMovCadCOD_CADASTRO.Text) <> '' then
    QCustoVeiculoMovCadnome.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                                        'COD_CADASTRO = '+QCustoVeiculoMovCadCOD_CADASTRO.Text)
  else
    QCustoVeiculoMovCadnome.Value := '';

  if Trim(QCustoVeiculoMovCadCOD_CADASTRO_PRODUTOR.Text) <> '' then
    QCustoVeiculoMovCadnomeProdutor.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                                        'COD_CADASTRO = '+QCustoVeiculoMovCadCOD_CADASTRO_PRODUTOR.Text)
  else
    QCustoVeiculoMovCadnomeProdutor.Value := '';

  if Trim(QCustoVeiculoMovCadCOD_PRODUTO.Text) <> '' then
  begin
    QCustoVeiculoMovCaddesc_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                                                'COD_PRODUTO = '+QCustoVeiculoMovCadCOD_PRODUTO.Text);
    QCustoVeiculoMovCadind_km.Value := DMOracle.BuscaNome('SELECT IND_KM FROM TB_PRODUTO',
                                                          'COD_PRODUTO = '+QCustoVeiculoMovCadCOD_PRODUTO.Text);
    QCustoVeiculoMovCadind_tp_produto.Value := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO',
                                                                  'COD_PRODUTO = '+QCustoVeiculoMovCadCOD_PRODUTO.Text);
  end
  else
  begin
    QCustoVeiculoMovCaddesc_produto.Value := '';
    QCustoVeiculoMovCadind_km.Value := '';
    QCustoVeiculoMovCadind_tp_produto.Value :='';
  end;

  if Trim(QCustoVeiculoMovCadCOD_FINALIDADE.Text) <> '' then
    QCustoVeiculoMovCaddesc_finalidade.Value := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE',
                                                                   'COD_FINALIDADE = '+QCustoVeiculoMovCadCOD_FINALIDADE.Text)
  else
    QCustoVeiculoMovCaddesc_finalidade.Value := '';

  if Trim(QCustoVeiculoMovCadCOD_HISTORICO.Text) <> '' then
    QCustoVeiculoMovCaddesc_historico.Value := DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO',
                                                                   'COD_HISTORICO = '+QCustoVeiculoMovCadCOD_HISTORICO.Text)
  else
    QCustoVeiculoMovCaddesc_historico.Value := '';
  if Trim(QCustoVeiculoMovCadCOD_NOTA_ITEM.Text) <> '' then
    QCustoVeiculoMovCadcod_nota_cab.Text := DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_NOTA_ITEM',
                                                                'COD_NOTA_ITEM = '+QCustoVeiculoMovCadCOD_NOTA_ITEM.Text)
  else
    QCustoVeiculoMovCadcod_nota_cab.Text := '';

end;

procedure TDMCustoVeiculoMov.QCustoVeiculoMovCadAfterInsert(
  DataSet: TDataSet);
begin
  if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') then
  begin
    QCustoVeiculoMovCadCOD_LOTE_TIPO.Value := 1;
    QCustoVeiculoMovCadCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
    QCustoVeiculoMovCadDT_LCTO.Value := DMOracle.DataServ;
  end
  else
  begin
    QCustoVeiculoMovCadCOD_LOTE_TIPO.Value := 1;
    QCustoVeiculoMovCadDT_MOVIMENTO.Value := DMOracle.DataServ;
    QCustoVeiculoMovCadCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
    QCustoVeiculoMovCadDT_LCTO.Value := DMOracle.DataServ;
  end;
end;

procedure TDMCustoVeiculoMov.QCustoVeiculoMovCadBeforePost(
  DataSet: TDataSet);
begin
  if Trim(QCustoVeiculoMovCadQT_QUANTIDADE.Text) = '' then
    Raise Exception.Create('Quantidade deve ser Informada');
  if DMOracle.BuscaNome('SELECT IND_KM FROM TB_PRODUTO','COD_PRODUTO = '+
                        FloatToStr(QCustoVeiculoMovCadCOD_PRODUTO.Value)) <> 'N' then
    if (Trim(QCustoVeiculoMovCadKM.Text) = '') and (Trim(QCustoVeiculoMovCadHR_VEICULO.Text) = '') then
      Raise Exception.Create('KM Marcador deve ser Informado');
  if DMOracle.BuscaNome('SELECT IND_BAIXA FROM TB_VEICULO','COD_VEICULO = '+
                        FloatToStr(QCustoVeiculoMovCadCOD_VEICULO.Value)) <> '' then
    Raise Exception.Create('Não é possível Alocar Despesa a um Veículo Baixado');
  if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') then
  begin
    if Trim(QCustoVeiculoMovCadDT_MOVIMENTO.Text) = '' then
      Raise Exception.Create('Data de emissão deve ser informada');
  end;

  try
    with DMVeiculo do
    begin
      QVeiculoCad.Close;
      QVeiculoCad.SetVariable('PK',QCustoVeiculoMovCadNUM_VEICULO.Value);
      QVeiculoCad.SetVariable('COD_VEICULO',QCustoVeiculoMovCadCOD_VEICULO.Value);
      QVeiculoCad.Open;
      if QVeiculoCadKM_ATUAL.Value < QCustoVeiculoMovCadKM.Value then
      begin
        QVeiculoCad.Edit;
        QVeiculoCadKM_ATUAL.Value := QCustoVeiculoMovCadKM.Value;
        QVeiculoCadDT_ATUALIZACAO.Value := QCustoVeiculoMovCadDT_MOVIMENTO.Value;
        QVeiculoCad.Post;
      end;
      if QVeiculoCadHR_ATUAL.Value < QCustoVeiculoMovCadHR_VEICULO.Value then
      begin
        QVeiculoCad.Edit;
        QVeiculoCadHR_ATUAL.Value := QCustoVeiculoMovCadHR_VEICULO.Value;
        QVeiculoCadDT_ATUALIZACAO.Value := QCustoVeiculoMovCadDT_MOVIMENTO.Value;
        QVeiculoCad.Post;
      end;
    end;
  except
    Raise Exception.Create('Não foi possível atualizar os dados do Veículo');
  end;
  QCustoVeiculoMovCadCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMCustoVeiculoMov.QCustoVeiculoMovCadBeforeDelete(
  DataSet: TDataSet);
begin
  if QCustoVeiculoMovCadIND_ESTOQUE_ATUALIZADO.Value = 'S' then
    raise Exception.Create('Produto já lançado no estoque. Necessário voltar estoque antes de excluir.');
end;

procedure TDMCustoVeiculoMov.QRGastoVeiculoCalcFields(DataSet: TDataSet);
begin
  if QRGastoVeiculoCOD_CADASTRO_PRODUTOR.Text <> '' then
    QRGastoVeiculonomeProdutor.Value := DMOracle.FastSelect('NOME','TB_CADASTRO','COD_CADASTRO = ' + QRGastoVeiculoCOD_CADASTRO_PRODUTOR.Text);
end;

procedure TDMCustoVeiculoMov.QRGastoVeiculo2CalcFields(DataSet: TDataSet);
begin
  if QRGastoVeiculo2COD_CADASTRO_PRODUTOR.Text <> '' then
    QRGastoVeiculo2nomeProdutor.Text := DMOracle.FastSelect('NOME','TB_CADASTRO','COD_CADASTRO = ' + QRGastoVeiculo2COD_CADASTRO_PRODUTOR.Text);
end;

procedure TDMCustoVeiculoMov.QCustoVeiculoMovCadVL_UNITARIOValidate(
  Sender: TField);
begin
  if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') or (DMParamSistema.CodEmpresa = 'TOMATESMI') or (DMParamSistema.CodEmpresa = 'ITATIBA') then
    QCustoVeiculoMovCadVL_CUSTO.Value := ((QCustoVeiculoMovCadVL_UNITARIO.Value * QCustoVeiculoMovCadQT_QUANTIDADE.Value) - QCustoVeiculoMovCadVL_DESCONTO.Value);
end;

procedure TDMCustoVeiculoMov.QCustoVeiculoMovCadQT_QUANTIDADEValidate(
  Sender: TField);
begin
  QCustoVeiculoMovCadVL_UNITARIOValidate(Sender);
end;

procedure TDMCustoVeiculoMov.QCustoVeiculoMovCadVL_DESCONTOValidate(
  Sender: TField);
begin
  if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or(DMParamSistema.CodEmpresa = 'MATRANSP') or (DMParamSistema.CodEmpresa = 'TOMATESMI') or (DMParamSistema.CodEmpresa = 'ITATIBA') then
    QCustoVeiculoMovCadVL_CUSTO.Value := ((QCustoVeiculoMovCadVL_UNITARIO.Value * QCustoVeiculoMovCadQT_QUANTIDADE.Value) - QCustoVeiculoMovCadVL_DESCONTO.Value);
end;

procedure TDMCustoVeiculoMov.QRCustoVeiculo_ReceitaCalcFields(
  DataSet: TDataSet);
var
 wCodVeiculo, wDistancia, wDescPlaca, wValKm: string;
begin
  if QRCustoVeiculo_ReceitaNUM_ROMANEIO.Text <> '' then
    QRCustoVeiculo_Receitapeso_liq.Value := QRCustoVeiculo_ReceitaQT_PESO_BRUTO.Value - QRCustoVeiculo_ReceitaQT_TARA.Value;
end;

end.
