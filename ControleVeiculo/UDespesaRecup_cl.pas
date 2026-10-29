unit UDespesaRecup_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMDespesaRecup = class(TDataModule)
    QDespesaRecupCad: TOracleDataSet1;
    QDespesaRecupCadCOD_DESPESA_RECUP: TIntegerField;
    QDespesaRecupCadCOD_VEICULO: TIntegerField;
    QDespesaRecupCadCOD_PRODUTO: TFloatField;
    QDespesaRecupCadQT_QUANTIDADE: TFloatField;
    QDespesaRecupCadVL_UNITARIO: TFloatField;
    QDespesaRecupCadDT_DESPESA: TDateTimeField;
    QDespesaRecupCadDT_INICIO: TDateTimeField;
    QDespesaRecupCadDT_FIM: TDateTimeField;
    QMedia: TOracleDataSet1;
    QMediaCOD_VEICULO: TIntegerField;
    QMediaNUM_PLACA: TStringField;
    QMediaCOD_PRODUTO: TFloatField;
    QMediaQTDE: TFloatField;
    QMediaCUSTO: TFloatField;
    QMediaVL_UNITARIO: TFloatField;
    QMediaKM_I: TFloatField;
    QMediaKM_F: TFloatField;
    QMediaQT_KM: TFloatField;
    QMediaMEDIA: TFloatField;
    QDespesaRecupCadMEDIA: TFloatField;
    QDespesaRecupCadIND_UN_KM: TStringField;
    QDespesaRecupCadCOD_CADASTRO: TIntegerField;
    QDespesaRecupCadvl_total: TFloatField;
    QDespesaRecupCadNUM_CHEQUE: TFloatField;
    QDespesaRecupCadCOD_BANCO: TIntegerField;
    QDespesaRecupCons: TOracleDataSet1;
    QDespesaRecupConsCOD_DESPESA_RECUP: TIntegerField;
    QDespesaRecupConsCOD_VEICULO: TIntegerField;
    QDespesaRecupConsNUM_PLACA: TStringField;
    QDespesaRecupConsMOTORISTA: TStringField;
    QDespesaRecupConsQT_QUANTIDADE: TFloatField;
    QDespesaRecupConsVL_UNITARIO: TFloatField;
    QDespesaRecupConsDT_DESPESA: TDateTimeField;
    QDespesaRecupConsPERIODO: TStringField;
    QRRecibo: TOracleDataSet1;
    QRReciboCOD_DESPESA_RECUP: TIntegerField;
    QRReciboCOD_VEICULO: TIntegerField;
    QRReciboNUM_PLACA: TStringField;
    QRReciboDESC_MODELO: TStringField;
    QRReciboNUM_ANO_FAB: TIntegerField;
    QRReciboDESC_FABRICANTE: TStringField;
    QRReciboNOME: TStringField;
    QRReciboPERIODO: TStringField;
    QRReciboQT_QUANTIDADE: TFloatField;
    QRReciboVL_UNITARIO: TFloatField;
    QRReciboMEDIA: TFloatField;
    QRReciboVL_TOTAL: TFloatField;
    QRReciboNUM_CHEQUE: TFloatField;
    QRReciboKM: TFloatField;
    QRReciboDESC_COR: TStringField;
    QRReciboDESC_BANCO_AGENCIA: TStringField;
    QRReciboDT_DESPESA: TDateTimeField;
    QRDespesaRecup: TOracleDataSet1;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    StringField3: TStringField;
    QRReciboQTDADE: TFloatField;
    QRRecibovlr_total: TFloatField;
    QRReciboIND_UN_KM: TStringField;
    QRDespesaRecupPRODUTO: TStringField;
    QMediaDESC_PRODUTO: TStringField;
    QDespesaRecupConsPRODUTO: TStringField;
    QRReciboDESC_PRODUTO: TStringField;
    QRDespesaRecupIND_UN_KM: TStringField;
    QRDespesaRecupMEDIA: TFloatField;
    QRDespesaRecupDESC_MARCA: TStringField;
    QDespesaRecupCadCOD_NOTA_ITEM: TIntegerField;
    QRDespesaRecupNUM_VEICULO: TIntegerField;
    QDespesaRecupCadNUM_VEICULO: TIntegerField;
    QDespesaRecupCadKM: TFloatField;
    QDespesaRecupCadNUM_HORA_INICIO: TFloatField;
    QLancaHorimetro: TOracleDataSet1;
    QLancaHorimetroCOD_DESPESA_RECUP: TIntegerField;
    QLancaHorimetroCOD_VEICULO: TIntegerField;
    QLancaHorimetroCOD_PRODUTO: TFloatField;
    QLancaHorimetroQT_QUANTIDADE: TFloatField;
    QLancaHorimetroVL_UNITARIO: TFloatField;
    QLancaHorimetroDT_DESPESA: TDateTimeField;
    QLancaHorimetroDT_INICIO: TDateTimeField;
    QLancaHorimetroDT_FIM: TDateTimeField;
    QLancaHorimetroMEDIA: TFloatField;
    QLancaHorimetroIND_UN_KM: TStringField;
    QLancaHorimetroCOD_CADASTRO: TIntegerField;
    QLancaHorimetroNUM_CHEQUE: TFloatField;
    QLancaHorimetroCOD_BANCO: TIntegerField;
    QLancaHorimetroCOD_NOTA_ITEM: TIntegerField;
    QLancaHorimetroKM: TFloatField;
    QLancaHorimetroNUM_VEICULO: TIntegerField;
    QLancaHorimetroNUM_HORA_INICIO: TFloatField;
    QLancaHorimetroNUM_HORA_FIM: TFloatField;
    QLancaConsumo: TOracleDataSet1;
    QLancaConsumoCOD_CUSTO_VEICULO_MOV: TIntegerField;
    QLancaConsumoCOD_VEICULO: TIntegerField;
    QLancaConsumoCOD_PRODUTO: TFloatField;
    QLancaConsumoKM: TFloatField;
    QLancaConsumoVL_CUSTO: TFloatField;
    QLancaConsumoDT_MOVIMENTO: TDateTimeField;
    QLancaConsumoCOD_USUARIO: TIntegerField;
    QLancaConsumoCOD_CAIXA_MOV: TIntegerField;
    QLancaConsumoCOD_CONTA_PAGAR_MOV: TIntegerField;
    QLancaConsumoCOD_NOTA_ITEM: TIntegerField;
    QLancaConsumoNUM_VEICULO: TIntegerField;
    QLancaConsumoCOD_FINALIDADE: TIntegerField;
    QLancaConsumoCOD_HISTORICO: TIntegerField;
    QLancaConsumoCOD_CONTA_PAGAR_CAB: TIntegerField;
    QLancaConsumoQT_QUANTIDADE: TFloatField;
    QLancaConsumoDT_LCTO: TDateTimeField;
    QLancaConsumoCOD_CADASTRO: TIntegerField;
    QLancaConsumoNUM_NOTA_REQUISICAO: TIntegerField;
    QLancaConsumoDESC_OBSERVACAO: TStringField;
    QLancaConsumoIND_ESTOQUE_ATUALIZADO: TStringField;
    QLancaConsumoCOD_LOTE_TIPO: TIntegerField;
    QLancaConsumoCOD_CADASTRO_PRODUTOR: TIntegerField;
    QLancaConsumoHR_VEICULO: TFloatField;
    QDespesaRecupCadNUM_HORA_FIM: TFloatField;
    QDespesaRecupCadCOD_CADASTRO_ORIGEM: TIntegerField;
    QDespesaRecupCadCOD_CADASTRO_DESTINO: TIntegerField;
    QDespesaRecupCadQT_VIAGEM: TFloatField;
    QDespesaRecupCadCOD_ROMANEIO_AGRICOLA: TIntegerField;
    QDespesaRecupCadDT_SEMEADURA: TDateTimeField;
    procedure QDespesaRecupCadCalcFields(DataSet: TDataSet);
    procedure QDespesaRecupCadAfterInsert(DataSet: TDataSet);
    procedure QRReciboCalcFields(DataSet: TDataSet);
    procedure QDespesaRecupCadBeforePost(DataSet: TDataSet);
    procedure QDespesaRecupCadBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDespesaRecup: TDMDespesaRecup;

implementation

uses UOracle_cl, UVeiculo_cl, UParamSistema_cl;

{$R *.DFM}

procedure TDMDespesaRecup.QDespesaRecupCadCalcFields(DataSet: TDataSet);
begin
  if QDespesaRecupCadIND_UN_KM.Value = 'U' then
    QDespesaRecupCadvl_total.Value := QDespesaRecupCadVL_UNITARIO.Value * QDespesaRecupCadQT_QUANTIDADE.Value
  else if QDespesaRecupCadIND_UN_KM.Value = 'K' then
  begin
    if QDespesaRecupCadMEDIA.Value > 0 then
      QDespesaRecupCadvl_total.Value := (QDespesaRecupCadVL_UNITARIO.Value * QDespesaRecupCadQT_QUANTIDADE.Value) / QDespesaRecupCadMEDIA.Value
    else
      QDespesaRecupCadvl_total.Value := QDespesaRecupCadVL_UNITARIO.Value * QDespesaRecupCadQT_QUANTIDADE.Value;
  end;
end;

procedure TDMDespesaRecup.QDespesaRecupCadAfterInsert(DataSet: TDataSet);
begin
  QDespesaRecupCadDT_DESPESA.Value := DMOracle.DataServ;
  QDespesaRecupCadIND_UN_KM.Value := 'U';
  if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') or (DMParamSistema.CodEmpresa = 'TOMATESMI') then
  begin
    QDespesaRecupCadDT_INICIO.Value := Date();
    QDespesaRecupCadDT_FIM.Value    := Date;
  end;
end;

procedure TDMDespesaRecup.QRReciboCalcFields(DataSet: TDataSet);
begin
  if QRReciboIND_UN_KM.Value = 'U' then
  begin
    QRRecibovlr_total.Value := QRReciboVL_UNITARIO.Value * QRReciboQT_QUANTIDADE.Value
  end
  else
  begin
    if QRReciboIND_UN_KM.Value = 'K' then
    begin
      if QRReciboMEDIA.Value > 0 then
        QRRecibovlr_total.Value := (QRReciboVL_UNITARIO.Value * QRReciboQT_QUANTIDADE.Value) / QRReciboMEDIA.Value
      else
        QRRecibovlr_total.Value := QRReciboVL_UNITARIO.Value * QRReciboQT_QUANTIDADE.Value;
    end
    else
    begin
      QRRecibovlr_total.Value := QRReciboVL_UNITARIO.Value * QRReciboQT_QUANTIDADE.Value;
    end;
  end;
end;

procedure TDMDespesaRecup.QDespesaRecupCadBeforePost(DataSet: TDataSet);
begin
  if Trim(DMDespesaRecup.QDespesaRecupCadQT_QUANTIDADE.Text) = '' then
    Raise Exception.Create('Quantidade deve ser Informada');
  if DMOracle.BuscaNome('SELECT IND_KM FROM TB_PRODUTO','COD_PRODUTO = '+
                        FloatToStr(DMDespesaRecup.QDespesaRecupCadCOD_PRODUTO.Value)) <> 'N' then
    if (Trim(DMDespesaRecup.QDespesaRecupCadKM.Text) = '') then
      Raise Exception.Create('KM Marcador deve ser Informado');
  if DMOracle.BuscaNome('SELECT IND_BAIXA FROM TB_VEICULO','COD_VEICULO = '+
                        FloatToStr(DMDespesaRecup.QDespesaRecupCadCOD_VEICULO.Value)) <> '' then
    Raise Exception.Create('Não é possível Alocar Despesa a um Veículo Baixado');

  try
    with DMVeiculo do
    begin
      QVeiculoCad.Close;
      QVeiculoCad.SetVariable('PK',DMDespesaRecup.QDespesaRecupCadNUM_VEICULO.Value);
      QVeiculoCad.SetVariable('COD_VEICULO',DMDespesaRecup.QDespesaRecupCadCOD_VEICULO.Value);
      QVeiculoCad.Open;
      if QVeiculoCadKM_ATUAL.Value < DMDespesaRecup.QDespesaRecupCadKM.Value then
      begin
        QVeiculoCad.Edit;
        QVeiculoCadKM_ATUAL.Value := DMDespesaRecup.QDespesaRecupCadKM.Value;
        QVeiculoCadDT_ATUALIZACAO.Value := DMDespesaRecup.QDespesaRecupCadDT_DESPESA.Value;
        QVeiculoCad.Post;
      end;
     { if QVeiculoCadHR_ATUAL.Value < QCustoVeiculoMovCadHR_VEICULO.Value then
      begin
        QVeiculoCad.Edit;
        QVeiculoCadHR_ATUAL.Value := QCustoVeiculoMovCadHR_VEICULO.Value;
        QVeiculoCadDT_ATUALIZACAO.Value := QCustoVeiculoMovCadDT_MOVIMENTO.Value;
        QVeiculoCad.Post;
      end;}
    end;
  except
    Raise Exception.Create('Não foi possível atualizar os dados do Veículo');
  end;
  //QCustoVeiculoMovCadCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMDespesaRecup.QDespesaRecupCadBeforeDelete(DataSet: TDataSet);
begin
{  if QCustoVeiculoMovCadIND_ESTOQUE_ATUALIZADO.Value = 'S' then
    raise Exception.Create('Produto já lançado no estoque. Necessário voltar estoque antes de excluir.');}
end;

end.
