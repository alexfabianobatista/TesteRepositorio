unit UVeiculo_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMVeiculo = class(TDataModule)
    QVeiculoCad: TOracleDataSet1;
    QVeiculoCadCOD_VEICULO: TIntegerField;
    QVeiculoCadNUM_CHASSI: TStringField;
    QVeiculoCadCOD_CADASTRO: TIntegerField;
    QVeiculoCadCOD_MODELO: TIntegerField;
    QVeiculoCadNUM_PLACA: TStringField;
    QVeiculoCadNUM_ANO: TIntegerField;
    QVeiculoCadnome: TStringField;
    QVeiculoCaddesc_modelo: TStringField;
    QVeiculoCons: TOracleDataSet1;
    QRVeiculo: TOracleDataSet1;
    QVeiculoCadCOD_FILIAL: TIntegerField;
    QVeiculoCadCLASSIFICACAO: TStringField;
    QVeiculoCadDT_AQUISICAO: TDateTimeField;
    QVeiculoCadDT_ATUALIZACAO: TDateTimeField;
    QVeiculoCaddesc_filial: TStringField;
    QVeiculoCadKM_ATUAL: TFloatField;
    QVeiculoConsCOD_VEICULO: TIntegerField;
    QVeiculoConsNUM_PLACA: TStringField;
    QVeiculoCadNUM_VEICULO: TIntegerField;
    QVeiculoCadNUM_RENAVAM: TStringField;
    QVeiculoCaddesc_fabricante: TStringField;
    QVeiculoCadCOD_COR: TIntegerField;
    QVeiculoCaddesc_cor: TStringField;
    QVeiculoCadNUM_ANO_FAB: TIntegerField;
    QVeiculoCadCOD_MOTORISTA: TIntegerField;
    QVeiculoCadnome_motorista: TStringField;
    QVeiculoConsNUM_VEICULO: TIntegerField;
    QVeiculoConsDESC_MODELO: TStringField;
    QVeiculoConsDESC_COR: TStringField;
    QVeiculoConsCLASSIFICACAO: TStringField;
    QVeiculoConsDESC_FABRICANTE: TStringField;
    QRVeiculoNUM_VEICULO: TIntegerField;
    QRVeiculoCOD_VEICULO: TIntegerField;
    QRVeiculoNUM_PLACA: TStringField;
    QRVeiculoCLASSIFICACAO: TStringField;
    QRVeiculoNUM_ANO: TIntegerField;
    QRVeiculoNUM_ANO_FAB: TIntegerField;
    QRVeiculoDESC_MODELO: TStringField;
    QRVeiculoDESC_FABRICANTE: TStringField;
    QVeiculoCadTIPO: TStringField;
    QVeiculoConsTIPO: TStringField;
    QRVeiculoTIPO: TStringField;
    QRVeiculoDT_AQUISICAO: TDateTimeField;
    QRVeiculoFILIAL: TStringField;
    QRVeiculoPROPRIETARIO: TStringField;
    QRVeiculoMOTORISTA: TStringField;
    QVeiculoCadIND_BAIXA: TStringField;
    QVeiculoCadNUM_MOTOR: TStringField;
    QVeiculoCadNUM_SERIE: TStringField;
    QVeiculoCadQT_HORAS: TStringField;
    QVeiculoCadDESC_MONOBLOCO: TStringField;
    QVeiculoCadNUM_CAIXA_CAMBIO: TStringField;
    QVeiculoCadNUM_EIXO_DIANTEIRO: TStringField;
    QVeiculoConsNOME: TStringField;
    QVeiculoConsNUM_MOTOR: TStringField;
    QVeiculoConsNUM_SERIE: TStringField;
    QVeiculoConsCOD_CADASTRO: TIntegerField;
    QVeiculoCadHR_ATUAL: TFloatField;
    QRDadosVeiculo: TOracleDataSet1;
    QRDadosVeiculoNUM_PLACA: TStringField;
    QRDadosVeiculoNUM_CHASSI: TStringField;
    QRDadosVeiculoNUM_RENAVAM: TStringField;
    QRDadosVeiculoDESC_MODELO: TStringField;
    QRDadosVeiculoDESC_FABRICANTE: TStringField;
    QRDadosVeiculoDESC_COR: TStringField;
    QRDadosVeiculoTIPO: TStringField;
    QRDadosVeiculoNUM_ANO: TIntegerField;
    QRDadosVeiculoNOME: TStringField;
    QRDadosVeiculoCLASSIFICACAO: TStringField;
    QVeiculoCadDESC_OBSERVACAO: TStringField;
    QRVeiculoIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    QRVeiculoCOD_MODELO: TIntegerField;
    QRVeiculoCOD_FILIAL: TIntegerField;
    QVeiculoCadNUM_COMPRIMENTO: TFloatField;
    QVeiculoCadNUM_LARGURA: TFloatField;
    QVeiculoCadNUM_ALTURA: TFloatField;
    QRVeiculoNUM_LARGURA: TFloatField;
    QRVeiculoNUM_COMPRIMENTO: TFloatField;
    QRVeiculoNUM_ALTURA: TFloatField;
    QRVeiculoNUM_VOLUME_MAXIMO: TFloatField;
    QRVeiculoNUM_PESO_MAXIMO: TFloatField;
    QRVeiculoDESC_CIDADE: TStringField;
    QRVeiculoCOD_CIDADE: TIntegerField;
    QRVeiculoCOD_ESTADO: TStringField;
    QVeiculoCadNUM_VOLUME_MAXIMO: TFloatField;
    QVeiculoCadNUM_PESO_MAXIMO: TFloatField;
    QVeiculoCadDESC_CIDADE: TStringField;
    QVeiculoCadCOD_CIDADE: TIntegerField;
    QVeiculoCadCOD_ESTADO: TStringField;
    QRVeiculoCNPJ_FILIAL: TStringField;
    QRVeiculoCNPJ_CPF_PROPRIETARIO: TStringField;
    QVeiculoConsKM_ATUAL: TFloatField;
    QVeiculoConsNUM_ANO_FAB: TIntegerField; 
    QVeiculoConsNUM_ANO: TIntegerField;
    QVeiculoConsHR_ATUAL: TFloatField;
    QVeiculoConsNUM_CHASSI: TStringField;
    QVeiculoCadDESC_CARACTERISTICA: TStringField;
    QRDadosVeiculoDESC_OBSERVACAO: TStringField;
    QRVeiculoDESC_OBSERVACAO: TStringField;
    QVeiculoConsDESC_CARACTERISTICA: TStringField;

    procedure QVeiculoCadCalcFields(DataSet: TDataSet);
    procedure QVeiculoCadBeforePost(DataSet: TDataSet);
    procedure QVeiculoCadBeforeInsert(DataSet: TDataSet);
    procedure QVeiculoCadCOD_CIDADEChange(Sender: TField);
    procedure QVeiculoCadAfterInsert(DataSet: TDataSet);
  private
    FpVeiculo: Integer;
    procedure SetpVeiculo(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    property pVeiculo: Integer read FpVeiculo write SetpVeiculo;
  end;

var
  DMVeiculo: TDMVeiculo;

implementation

uses UOracle_cl, USequencia_cl, UParamSistema_cl, UBiblioteca;

{$R *.DFM}

procedure TDMVeiculo.QVeiculoCadCalcFields(DataSet: TDataSet);
  var wFabricante: String;
begin
  if Trim(QVeiculoCadCOD_CADASTRO.Text) <> '' then
    QVeiculoCadnome.Value:= DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                               'COD_CADASTRO = '+QVeiculoCadCOD_CADASTRO.Text)
  else
    QVeiculoCadnome.Value := '';

  if Trim(QVeiculoCadCOD_MOTORISTA.Text) <> '' then
    QVeiculoCadnome_motorista.Value:= DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                                         'COD_CADASTRO = '+QVeiculoCadCOD_MOTORISTA.Text)
  else
    QVeiculoCadnome_motorista.Value := '';

  if Trim(QVeiculoCadCOD_MODELO.Text) <> '' then
  begin
    QVeiculoCaddesc_modelo.Value:= DMOracle.BuscaNome('SELECT DESC_MODELO FROM TB_VEICULO_MODELO',
                                                      'COD_MODELO = '+QVeiculoCadCOD_MODELO.Text);
    wFabricante := DMOracle.BuscaNome('SELECT COD_FABRICANTE FROM TB_VEICULO_MODELO',
                                      'COD_MODELO = '+QVeiculoCadCOD_MODELO.Text);
    if Trim(wFabricante) <> '' then
      QVeiculoCaddesc_fabricante.Value:= DMOracle.BuscaNome('SELECT DESC_FABRICANTE FROM TB_VEICULO_FABRICANTE',
                                                            'COD_FABRICANTE = '+ wFabricante)
    else
      QVeiculoCaddesc_fabricante.Value:= '';
  end
  else
  begin
    QVeiculoCaddesc_modelo.Value:= '';
    QVeiculoCaddesc_fabricante.Value:= '';
  end;

  if Trim(QVeiculoCadCOD_FILIAL.Text) <> '' then
    QVeiculoCaddesc_filial.Value:= DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                                      'COD_FILIAL = '+QVeiculoCadCOD_FILIAL.Text)
  else
    QVeiculoCaddesc_filial.Value:= '';

  if Trim(QVeiculoCadCOD_COR.Text) <> '' then
    QVeiculoCaddesc_cor.Value:= DMOracle.BuscaNome('SELECT DESC_COR FROM TB_COR',
                                                   'COD_COR = '+QVeiculoCadCOD_COR.Text)
  else
    QVeiculoCaddesc_cor.Value:= '';
end;

procedure TDMVeiculo.QVeiculoCadBeforePost(DataSet: TDataSet);
var
  wVeiculo: String;
begin
  DMOracle.ValidaFilial(QVeiculoCadCOD_FILIAL.Text);
  if DMVeiculo.QVeiculoCadNUM_VEICULO.Text = '' then
    DMVeiculo.QVeiculoCadNUM_VEICULO.Value:=DMSequencia.Sequencia(1,'Veiculo');
  if DMParamSistema.CodEmpresa = 'MEDIPECAS' then
  begin
    wVeiculo := DMOracle.FastSelect('COD_VEICULO', 'TB_VEICULO',
      'REPLACE(REPLACE(NUM_PLACA, ' + QuotedStr('-') + '), ' +
      QuotedStr(' ') + ') = ' + QuotedStr(Bib.LimpaString(QVeiculoCadNUM_PLACA.Value,'- ')) +
      ' ORDER BY 1');
    if (wVeiculo <> '') and (wVeiculo <> QVeiculoCadCOD_VEICULO.Text) then
    begin
      MessageDlg('Já existe um veículo cadastrado com esta placa e com o código ' +
        wVeiculo + '.', mtError, [mbOK], 0);
      Abort;
    end;
  end;
end;

procedure TDMVeiculo.QVeiculoCadBeforeInsert(DataSet: TDataSet);
begin
  QVeiculoCad.Close;
  QVeiculoCad.SetVariable('PK',pVeiculo);
  QVeiculoCad.Open;
end;

procedure TDMVeiculo.SetpVeiculo(const Value: Integer);
begin
  FpVeiculo := Value;
end;

procedure TDMVeiculo.QVeiculoCadCOD_CIDADEChange(Sender: TField);
begin
  if QVeiculoCadCOD_CIDADE.Text <> '' then
  begin
    QVeiculoCadDESC_CIDADE.Value := DMOracle.FastSelect('DESC_CIDADE','TB_CIDADE','COD_CIDADE = '+QVeiculoCadCOD_CIDADE.Text);
    QVeiculoCadCOD_ESTADO.Value := DMOracle.FastSelect('COD_ESTADO','TB_CIDADE','COD_CIDADE = '+QVeiculoCadCOD_CIDADE.Text);
  end;
end;

procedure TDMVeiculo.QVeiculoCadAfterInsert(DataSet: TDataSet);
begin
  QVeiculoCadDT_AQUISICAO.Value := DMOracle.DataServ;
  QVeiculoCadDT_ATUALIZACAO.Value := DMOracle.DataServ;
  QVeiculoCadCLASSIFICACAO.Value := 'FROTA';
  if pVeiculo > 0 then
    QVeiculoCadNUM_VEICULO.Value := pVeiculo;
end;

end.
