unit UAtestado_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMAtestado = class(TDataModule)
    QAtestado: TOracleDataSet1;
    QAtestadoItem: TOracleDataSet1;
    QAtestadoCOD_ATESTADO_CAB: TIntegerField;
    QAtestadoNUM_ATESTADO: TIntegerField;
    QAtestadoCOD_FUNCIONARIO: TIntegerField;
    QAtestadoItemCOD_ATESTADO_CAB: TIntegerField;
    QAtestadoItemCOD_ATESTADO_ITEM: TIntegerField;
    QAtestadoItemNUM_LOTE_SEMENTE: TIntegerField;
    QAtestadoItemCOD_PLANTIO_SAFRA: TIntegerField;
    QAtestadoItemCOD_PRODUTO: TFloatField;
    QAtestadodesc_funcionario: TStringField;
    DSAtestadoItem: TDataSource;
    QExibeLote: TOracleDataSet1;
    QExibeLoteCOD_ATESTADO_CAB: TIntegerField;
    QExibeLoteCOD_ATESTADO_ITEM: TIntegerField;
    QExibeLoteCOD_PLANTIO_SAFRA: TIntegerField;
    QExibeLoteCOD_PRODUTO: TFloatField;
    DSExibeLote: TDataSource;
    QExibeLoteDESC_SAFRA: TStringField;
    QExibeLoteDESC_COMPLEMENTO_2: TStringField;
    QAtestadoCons: TOracleDataSet1;
    QAtestadoConsCOD_ATESTADO_CAB: TIntegerField;
    QAtestadoConsNUM_ATESTADO: TIntegerField;
    QAtestadoConsCOD_FUNCIONARIO: TIntegerField;
    QRAtestado: TOracleDataSet1;
    QRAtestadoCOD_ATESTADO_CAB: TIntegerField;
    QRAtestadoNUM_ATESTADO: TIntegerField;
    QRAtestadoCOD_FUNCIONARIO: TIntegerField;
    QRAtestadoCOD_ATESTADO_ITEM: TIntegerField;
    QRAtestadoCOD_PLANTIO_SAFRA: TIntegerField;
    QRAtestadoCOD_PRODUTO: TFloatField;
    QRAtestadoPERC_PUREZA_SEMENTE: TFloatField;
    QRAtestadoQUANT_NOCIVAS_TOL: TIntegerField;
    QRAtestadoPERC_GERMINACAO: TStringField;
    QRAtestadoDESC_VALIDADE: TStringField;
    QRAtestadoQUANT_LOTE: TIntegerField;
    QRAtestadoIND_APROVADO: TStringField;
    QRAtestadoDESC_FILIAL: TStringField;
    QRAtestadoDESC_ENDERECO: TStringField;
    QRAtestadoDESC_INSCRICAO: TStringField;
    QRAtestadoNUM_CGC: TStringField;
    QRAtestadoDESC_CIDADE: TStringField;
    QRAtestadoDESC_SAFRA: TStringField;
    QRAtestadoDT_EMISSAO_BOLETIM: TDateTimeField;
    QAtestadoConsDT_EMISSAO_BOLETIM: TDateTimeField;
    QAtestadoDT_EMISSAO: TDateTimeField;
    QAtestadoConsNUM_BOLETIM: TStringField;
    QAtestadoConsDT_EMISSAO: TDateTimeField;
    QRAtestadoNUM_BOLETIM: TStringField;
    QRAtestadoDT_EMISSAO: TDateTimeField;
    QRAtestadoCLASSE_NUM_ATESTADO: TStringField;
    QRAtestadoCOD_ESTADO: TStringField;
    QRAtestadoDESC_CULTURA: TStringField;
    QCalculaSacas: TOracleDataSet1;
    QCalculaSacasTOTAL_LOTE: TFloatField;
    QRAtestadoDESC_COMPLEMENTO_2: TStringField;
    QAtestadoCOD_MENSAGEM: TIntegerField;
    QAtestadoConsCOD_MENSAGEM: TIntegerField;
    QAtestadodesc_mensagem: TStringField;
    QRAtestadoCOD_MENSAGEM: TIntegerField;
    QRAtestadoDESC_MENSAGEM: TStringField;
    QRAtestadoDESC_COMPLEMENTO: TStringField;
    QRAtestadoDESC_COMPLEMENTO1: TStringField;
    QRAtestadoDESC_COMPLEMENTO2: TStringField;
    QRAtestadoDESC_COMPLEMENTO3: TStringField;
    QRAtestadoDESC_FUNCIONARIO: TStringField;
    QRAtestadoNUM_REG_CREA: TStringField;
    QRAtestadoCOD_CREDENCIAL_SEAB: TIntegerField;
    QRAtestadoNUM_EMBALAGEM: TFloatField;
    QRAtestadoNUM_MINISTERIO_AGRICULTURA: TIntegerField;
    QExibeLoteNUM_LOTE_SEMENTE: TStringField;
    QRAtestadoNUM_LOTE_SEMENTE: TStringField;
    QRAtestadoQUANT_OUTR_ESPECIES: TIntegerField;
    QRAtestadoQT_OUTRA_CULTIVAR: TIntegerField;
    QRAtestadoDESC_OUTRO_FATOR: TStringField;
    QRAtestadoNUM_BOLETIM_QUALIDADE: TIntegerField;
    QRAtestadoDESC_CEP: TStringField;
    QRAtestadoDESC_TELEFONE: TStringField;
    procedure QAtestadoCalcFields(DataSet: TDataSet);
    procedure QAtestadoBeforePost(DataSet: TDataSet);
    procedure QAtestadoAfterInsert(DataSet: TDataSet);
    procedure QAtestadoAfterOpen(DataSet: TDataSet);
    procedure QAtestadoAfterPost(DataSet: TDataSet);
    procedure QAtestadoItemAfterInsert(DataSet: TDataSet);
    procedure QAtestadoItemAfterPost(DataSet: TDataSet);
    procedure QAtestadoItemAfterCancel(DataSet: TDataSet);
    procedure QAtestadoItemAfterDelete(DataSet: TDataSet);
    procedure QAtestadoItemAfterOpen(DataSet: TDataSet);
    procedure QAtestadoAfterDelete(DataSet: TDataSet);
    procedure DSAtestadoItemStateChange(Sender: TObject);
    procedure QAtestadoItemBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAtestado: TDMAtestado;

implementation

uses UOracle_cl, USequencia_cl, UAtestadoCad;

{$R *.DFM}

procedure TDMAtestado.QAtestadoCalcFields(DataSet: TDataSet);
begin
  if QAtestadoCod_Mensagem.Text <>  '' then
    QAtestadoDesc_Mensagem.Value:=DMOracle.BuscaNome('SELECT DESC_MENSAGEM FROM TB_MENSAGEM',
                                                 'TB_MENSAGEM.COD_MENSAGEM = '+IntToStr(QAtestadoCod_Mensagem.Value));
  if QAtestadoCod_Funcionario.Text <> '' then
    QAtestadoDesc_Funcionario.Value:=DMOracle.BuscaNome('SELECT DESC_FUNCIONARIO FROM TB_FUNCIONARIO',
                                                        'COD_FUNCIONARIO = '+Trim(QAtestadoCod_Funcionario.Text));
end;

procedure TDMAtestado.QAtestadoBeforePost(DataSet: TDataSet);
begin
  DMAtestado.QAtestadoNum_Atestado.Value:=DMSequencia.Sequencia(1,'ATESTADO_SEMENTE');
end;

procedure TDMAtestado.QAtestadoAfterInsert(DataSet: TDataSet);
begin
  QAtestadoNum_Atestado.Value:=0;
  QAtestadoDt_Emissao.Value:=Date;
end;

procedure TDMAtestado.QAtestadoAfterOpen(DataSet: TDataSet);
begin
  QAtestadoItem.Close;
  QAtestadoItem.SetVariable('COD_ATESTADO_CAB',QAtestadoCod_Atestado_Cab.Value);
  QAtestadoItem.Open;
end;

procedure TDMAtestado.QAtestadoAfterPost(DataSet: TDataSet);
begin
  QAtestadoItem.Close;
  QAtestadoItem.SetVariable('COD_ATESTADO_CAB',QAtestadoCod_Atestado_Cab.Value);
  QAtestadoItem.Open;
end;

procedure TDMAtestado.QAtestadoItemAfterInsert(DataSet: TDataSet);
begin
  if QAtestadoItem.RecordCount < 10 then
  begin
    QAtestadoItemCod_Atestado_Cab.Value := QAtestadoCod_Atestado_Cab.Value;
    FAtestadoCad.BTLoteSementeConsClick(self);
  end
  else
  begin
    Showmessage('Número máximo de lotes alcançado');
    QAtestadoItem.Cancel;
  end;
end;

procedure TDMAtestado.QAtestadoItemAfterPost(DataSet: TDataSet);
begin
  QExibeLote.Close;
  QExibeLote.SetVariable('COD_ATESTADO_CAB',QAtestadoCod_Atestado_Cab.Value);
  QExibeLote.Open;
end;

procedure TDMAtestado.QAtestadoItemAfterCancel(DataSet: TDataSet);
begin
  QExibeLote.Close;
  QExibeLote.SetVariable('COD_ATESTADO_CAB',QAtestadoCod_Atestado_Cab.Value);
  QExibeLote.Open;
end;

procedure TDMAtestado.QAtestadoItemAfterDelete(DataSet: TDataSet);
begin
  QExibeLote.Close;
  QExibeLote.SetVariable('COD_ATESTADO_CAB',QAtestadoCod_Atestado_Cab.Value);
  QExibeLote.Open;
end;

procedure TDMAtestado.QAtestadoItemAfterOpen(DataSet: TDataSet);
begin
  QExibeLote.Close;
  QExibeLote.SetVariable('COD_ATESTADO_CAB',QAtestadoCod_Atestado_Cab.Value);
  QExibeLote.Open;
end;

procedure TDMAtestado.QAtestadoAfterDelete(DataSet: TDataSet);
begin
  QAtestadoItem.Close;
  QAtestadoItem.SetVariable('COD_ATESTADO_CAB',QAtestadoCod_Atestado_Cab.Value);
  QAtestadoItem.Open;
end;

procedure TDMAtestado.DSAtestadoItemStateChange(Sender: TObject);
begin
  if DSAtestadoITem.State in [DSInsert,DSEdit] then
  begin
    FAtestadoCad.BTLoteSementeCons.enabled:=true;
  end
  else
  begin
    FAtestadoCad.BTLoteSementeCons.enabled:=false;
  end;
end;

procedure TDMAtestado.QAtestadoItemBeforeInsert(DataSet: TDataSet);
begin
  if QAtestado.State in [DSInsert,DSEdit] then
  begin
    QAtestado.Post;
  end;
end;

end.
