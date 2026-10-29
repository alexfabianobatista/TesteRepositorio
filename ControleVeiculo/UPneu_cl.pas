unit UPneu_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMPneu = class(TDataModule)
    QPneuCad: TOracleDataSet1;
    QPneuCons: TOracleDataSet1;
    QRPneu: TOracleDataSet1;
    QPneuConsCOD_PNEU: TIntegerField;
    QPneuConsDESC_DESCRICAO: TStringField;
    QPneuConsNUM_SERIE: TStringField;
    QPneuConsDT_COMPRA: TDateTimeField;
    QPneuConsIND_SITUACAO: TStringField;
    QPneuConsIND_RECAPAGEM: TStringField;
    QPneuCadCOD_PNEU: TIntegerField;
    QPneuCadDESC_DESCRICAO: TStringField;
    QPneuCadNUM_SERIE: TStringField;
    QPneuCadDT_COMPRA: TDateTimeField;
    QPneuCadIND_SITUACAO: TStringField;
    QPneuCadIND_RECAPAGEM: TStringField;
    QPneuCadNUM_VEZES_RECAPAGEM: TIntegerField;
    QRPneuCOD_PNEU: TIntegerField;
    QRPneuDESC_DESCRICAO: TStringField;
    QRPneuNUM_SERIE: TStringField;
    QRPneuDT_COMPRA: TDateTimeField;
    QRPneuIND_SITUACAO: TStringField;
    QRPneuIND_RECAPAGEM: TStringField;
    QRPneuNUM_VEZES_RECAPAGEM: TIntegerField;
    QPneuCadNUM_PLACA: TStringField;
    QRPneuNUM_PLACA: TStringField;
    QPneuCadCOD_MARCA_PNEU: TIntegerField;
    QPneuTroca: TOracleDataSet1;
    DSPneuTroca: TDataSource;
    QPneuTrocaCOD_PNEU_TROCA: TIntegerField;
    QPneuTrocaCOD_PNEU: TIntegerField;
    QPneuTrocaCOD_VEICULO: TIntegerField;
    QPneuTrocaDT_TROCA: TDateTimeField;
    QPneuTrocaIND_ESTADO: TIntegerField;
    QPneuCadCOD_FILIAL: TIntegerField;
    QRTroca: TOracleDataSet1;
    QRTrocaCOD_PNEU: TIntegerField;
    QRTrocaCOD_FILIAL: TIntegerField;
    QRTrocaDESC_DESCRICAO: TStringField;
    QRTrocaDT_COMPRA: TDateTimeField;
    QRTrocaDT_TROCA: TDateTimeField;
    QRTrocaIND_ESTADO: TIntegerField;
    QRTrocaNUM_PLACA: TStringField;
    QRTrocadesc_estado: TStringField;
    procedure QPneuCadAfterCancel(DataSet: TDataSet);
    procedure QPneuCadBeforeEdit(DataSet: TDataSet);
    procedure QPneuCadBeforeInsert(DataSet: TDataSet);
    procedure QPneuTrocaBeforeEdit(DataSet: TDataSet);
    procedure QPneuTrocaBeforeInsert(DataSet: TDataSet);
    procedure QPneuTrocaAfterInsert(DataSet: TDataSet);
    procedure QPneuTrocaAfterPost(DataSet: TDataSet);
    procedure QPneuCadAfterPost(DataSet: TDataSet);
    procedure QPneuCadAfterOpen(DataSet: TDataSet);
    procedure QRTrocaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPneu: TDMPneu;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TDMPneu.QPneuCadAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QPneuTroca.Close;
  QPneuTroca.Open;
end;

procedure TDMPneu.QPneuCadBeforeEdit(DataSet: TDataSet);
begin
  If not DMOracle.DBCemapa.InTransaction Then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMPneu.QPneuCadBeforeInsert(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMPneu.QPneuTrocaBeforeEdit(DataSet: TDataSet);
begin
  If Not (QPneuCad.State = dsEdit) then
    Raise Exception.Create('Pneu não está no modo de alteração!');
end;

procedure TDMPneu.QPneuTrocaBeforeInsert(DataSet: TDataSet);
begin
  If QPneuCad.State = dsInsert then
  Begin
    QPneuCad.Post;
    QPneuCad.Edit;
  End;
  If Not (QPneuCad.State = dsEdit) then
    Raise Exception.Create('Pneu não está no modo de alteração!');
end;

procedure TDMPneu.QPneuTrocaAfterInsert(DataSet: TDataSet);
begin
  QPneuTrocaCOD_PNEU.Value := QPneuCadCod_Pneu.Value;
end;

procedure TDMPneu.QPneuTrocaAfterPost(DataSet: TDataSet);
Var wCodigo : Real;
begin
  wCodigo := QPneuTrocaCod_Pneu_Troca.Value;
  QPneuTroca.Close;
  QPneuTroca.Open;
  QPneuTroca.Locate('COD_PNEU_TROCA',wCodigo,[]);
end;

procedure TDMPneu.QPneuCadAfterPost(DataSet: TDataSet); 
Var wCodigo : Real;
begin
  wCodigo := QPneuCadCod_Pneu.Value;
  QPneuCad.Close;
  QPneuCad.SetVariable('PK',wCodigo);
  QPneuCad.Open;

  DMOracle.DBCemapa.Commit;
end;

procedure TDMPneu.QPneuCadAfterOpen(DataSet: TDataSet);
begin             
  QPneuTroca.Close;
  QPneuTroca.Open;
end;

procedure TDMPneu.QRTrocaCalcFields(DataSet: TDataSet);
begin
  case QRTrocaIND_ESTADO.Value of
    1: QRTrocadesc_estado.Text := 'Novo';
    2: QRTrocadesc_estado.Text := 'Semi-novo';
    3: QRTrocadesc_estado.Text := 'Usado';
    4: QRTrocadesc_estado.Text := 'Gasto';
  end;
end;

end.
