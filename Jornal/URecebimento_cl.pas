unit URecebimento_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMRecebimento = class(TDataModule)
    QRecebimentoJornalCad: TOracleDataSet1;
    QRecebimentoJornalItem: TOracleDataSet1;
    QRecebimentoJornalItemCOD_RECEBIMENTO_JORNAL_ITEM: TIntegerField;
    QRecebimentoJornalItemCOD_RECEBIMENTO_JORNAL: TIntegerField;
    QRecebimentoJornalItemVAL_PAGO: TFloatField;
    QRecebimentoJornalItemDT_PAGAMENTO: TDateTimeField;
    QRecebimentoJornalItemNUM_PARCELA: TIntegerField;
    DSRecebimentoJornalItem: TDataSource;
    QRecebimentoJornalCadcidade: TStringField;
    QRecebimentoJornalCons: TOracleDataSet1;
    QRecebimentoJornalCadNUM_ANO: TIntegerField;
    QRecebimentoJornalCadCOD_CADASTRO: TIntegerField;
    QRecebimentoJornalCadDT_VENCIMENTO: TDateTimeField;
    QRecebimentoJornalCadDT_CADASTRO: TDateTimeField;
    QRecebimentoJornalCadVAL_TOTAL: TFloatField;
    QRecebimentoJornalConsNUM_ANO: TIntegerField;
    QRecebimentoJornalConsDT_VENCIMENTO: TDateTimeField;
    QRecebimentoJornalConsVAL_TOTAL: TFloatField;
    QRecebimentoJornalConsNOME: TStringField;
    QRecebimentoJornalCadCOD_VENDEDOR: TIntegerField;
    QRecebimentoJornalCadCOD_RECEBIMENTO_JORNAL: TIntegerField;
    QRecebimentoJornalConsCOD_RECEBIMENTO_JORNAL: TIntegerField;
    procedure QRecebimentoJornalCadAfterInsert(DataSet: TDataSet);
    procedure QRecebimentoJornalCadBeforePost(DataSet: TDataSet);
    procedure QRecebimentoJornalCadAfterPost(DataSet: TDataSet);
    procedure QRecebimentoJornalCadCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure SetaDefaults;
  public
    { Public declarations }
  end;

var
  DMRecebimento: TDMRecebimento;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TDMRecebimento.QRecebimentoJornalCadAfterInsert(
  DataSet: TDataSet);
begin
  SetaDefaults;
end;
procedure TDMRecebimento.SetaDefaults;
Var wAno, wMes, wDia :Word;
begin
  DecodeDate(DMOracle.DataServ,wAno, wMes,wDia);
  if QRecebimentoJornalCadDT_CADASTRO.Text = '' then
    QRecebimentoJornalCadDT_CADASTRO.Value :=
      DMOracle.DataServ;
  if QRecebimentoJornalCadNUM_ANO.Value = 0 then
    QRecebimentoJornalCadNUM_ANO.Value := wAno;
end;
procedure TDMRecebimento.QRecebimentoJornalCadBeforePost(
  DataSet: TDataSet);
begin
  SetaDefaults;
end;

procedure TDMRecebimento.QRecebimentoJornalCadAfterPost(DataSet: TDataSet);
var i: Integer;
begin
  if (QRecebimentoJornalItem.RecordCount = 0) and
    (not QRecebimentoJornalCadCOD_RECEBIMENTO_JORNAL.IsNull) then
  begin
    for i := 1 to 4 do
    begin
      QRecebimentoJornalItem.Insert;
      QRecebimentoJornalItemNUM_PARCELA.Value := i;
      QRecebimentoJornalItemVAL_PAGO.Value := 0;
      QRecebimentoJornalItem.Post;
    end;
    QRecebimentoJornalItem.Refresh;
  end;
end;

procedure TDMRecebimento.QRecebimentoJornalCadCalcFields(
  DataSet: TDataSet);
begin
  if QRecebimentoJornalCad.RecordCount > 0 then
  begin
    with DMOracle do
    begin
      if QRecebimentoJornalCadCOD_CADASTRO.Value > 0 then
      begin
        QRecebimentoJornalCadcidade.Value :=
          BuscaNome('SELECT CI.DESC_CIDADE FROM TB_CIDADE CI INNER JOIN TB_CADASTRO CA' +
            ' ON CI.COD_CIDADE = CA.COD_CIDADE','CA.COD_CADASTRO = ' +
            QRecebimentoJornalCadCOD_CADASTRO.Text);
      end;
    end;
  end;
end;

end.
