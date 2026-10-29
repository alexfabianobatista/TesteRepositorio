unit UPecas_cl;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, OracleData, OraTeste;

type
  TDMPecas = class(TDataModule)
    QPecasMes: TOracleDataSet1;
    QPecasMesCOD_PECAS_MES: TIntegerField;
    QPecasMesCOD_CLASSE: TIntegerField;
    QPecasMesQT_QUANTIDADE: TFloatField;
    QPecasMesVAL_CUSTO: TFloatField;
    QPecasMesVAL_VENDA: TFloatField;
    QPecasMesDT_LANCAMENTO: TDateTimeField;
    QPecasMesDesc_Classe: TStringField;
    QPecasCons: TOracleDataSet1;
    QPecasConsCOD_PECAS_MES: TIntegerField;
    QPecasConsQT_QUANTIDADE: TFloatField;
    QPecasConsVAL_VENDA: TFloatField;
    QPecasConsVAL_CUSTO: TFloatField;
    QPecasConsDT_LANCAMENTO: TDateTimeField;
    QPecasConsCOD_CLASSE: TIntegerField;
    QPecasConsDESC_CLASSE: TStringField;
    QRPecas: TOracleDataSet1;
    QRPecasCOD_CLASSE: TIntegerField;
    QRPecasDESC_CLASSE: TStringField;
    QRPecasTVALOR_VENDA: TFloatField;
    QRPecasTVALOR_CUSTO: TFloatField;
    QRPecasQT_TOTAL: TFloatField;
    QPecasMesCOD_FILIAL: TIntegerField;
    QPecasMesnome_filial: TStringField;
    QPecasConsCOD_FILIAL: TIntegerField;
    QRPecasNota: TOracleDataSet1;
    QRPecasNotaCOD_CLASSE: TIntegerField;
    QRPecasNotaDESC_CLASSE: TStringField;
    QRPecasNotaVAL_CUSTO: TFloatField;
    QRPecasNotaVAL_TOTAL: TFloatField;
    QRPecasNotaTVALOR_CUSTO: TFloatField;
    QRPecasNotaQT_TOTAL: TFloatField;
    procedure LineItemsCalcFields(DataSet: TDataSet);
    procedure QPecasMesAfterInsert(DataSet: TDataSet);
    procedure QPecasMesAfterPost(DataSet: TDataSet);
    procedure QPecasMesBeforePost(DataSet: TDataSet);
    procedure QPecasMesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPecas: TDMPecas;
  wCusto : Real;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMPecas.LineItemsCalcFields(DataSet: TDataSet);
begin
  {LineItemsExtendedPrice.Value := LineItemsPrice.Value *
    ((100 - LineItemsDiscount.Value) / 100);
  LineItemsTotal.Value := LineItemsExtendedPrice.Value *
    LineItemsQty.Value;
end;}

end;


procedure TDMPecas.QPecasMesAfterInsert(DataSet: TDataSet);
begin
//  QPecasMesCOD_PECAS_MES.Value := DMOracle.Sequencia('PECAS_MES');
  QPecasMesDt_Lancamento.Value := DMOracle.DataServ;
  QPecasMesVal_Custo.Value := wCusto;
end;

procedure TDMPecas.QPecasMesAfterPost(DataSet: TDataSet);
begin
  QPecasMes.SetVariable('PK',QPecasMesCOD_PECAS_MES.Value);
  wCusto := QPecasMesVal_Custo.Value;

end;

procedure TDMPecas.QPecasMesBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QPecasMesCOD_FILIAL.Text);
  if not(DMOracle.DBCemapa.InTransaction) then
     DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMPecas.QPecasMesCalcFields(DataSet: TDataSet);
begin
  QPecasMesDesc_Classe.Value := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE ','COD_CLASSE = '+FloatToStr(QPecasMesCOD_CLASSE.VALUE));
  QPecasMesnome_filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                'COD_FILIAL = '+FloatTostr(QPecasMesCod_Filial.Value));
end;

end.



