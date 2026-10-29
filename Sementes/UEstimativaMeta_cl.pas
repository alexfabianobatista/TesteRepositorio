unit UEstimativaMeta_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMEstimativaMeta = class(TDataModule)
    QBuscaCultivar: TOracleDataSet1;
    QEstimativaMeta: TOracleDataSet1;
    QEstimativaMetaCOD_ESTIMATIVA_META: TIntegerField;
    QEstimativaMetaCOD_PRODUTO: TIntegerField;
    QEstimativaMetaCOD_PLANTIO_SAFRA: TIntegerField;
    QEstimativaMetaVAL_META: TFloatField;
    QEstimativaMetaVAL_ESTIMATIVA: TFloatField;
    DSEstimativaMeta: TDataSource;
    QEstimativaMetadesc_produto: TStringField;
    QBuscaCultivarCOD_PLANTIO_SAFRA: TIntegerField;
    QVerificaAlteracao: TOracleDataSet1;
    QRDadosGeraisCidade: TOracleDataSet1;
    QRDadosGeraisProduto: TOracleDataSet1;
    QRDadosGeraisProdutoAREA: TFloatField;
    QRDadosGeraisCidadeCIDADE: TStringField;
    QRDadosGeraisCidadeNUM_COOPERANTE: TFloatField;
    QRDadosGeraisProdutoVAL_META: TFloatField;
    QRDadosGeraisProdutoVAL_ESTIMATIVA: TFloatField;
    QRDadosGeraisProdutoCULTIVAR: TStringField;
    QBuscaCultivarDESC_COMPLEMENTO_2: TStringField;
    QVerificaAlteracaoCOD_PRODUTO: TFloatField;
    QBuscaCultivarCOD_PRODUTO: TFloatField;
    procedure QEstimativaMetaCalcFields(DataSet: TDataSet);
    procedure DSEstimativaMetaStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMEstimativaMeta: TDMEstimativaMeta;

implementation

uses UOracle_cl, UEstimativaMetaCad;

{$R *.DFM}

procedure TDMEstimativaMeta.QEstimativaMetaCalcFields(DataSet: TDataSet);
begin
  if QEstimativaMetaCod_Estimativa_Meta.Text <> '' then
    QEstimativaMetaDesc_Produto.value:=DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO_2 FROM TB_PRODUTO','COD_PRODUTO='+IntToStr(QEstimativaMetaCod_Produto.Value));
end;

procedure TDMEstimativaMeta.DSEstimativaMetaStateChange(Sender: TObject);
begin
   if DSEstimativaMeta.State in [DSInsert,DSEdit] then
   begin
     FEstimativaMetaCad.BTConfirmar.Enabled:=True;
     FEstimativaMetaCad.BTCancelar.Enabled:=True;
     FEstimativaMetaCad.BTExcluir.Enabled:=False;
     FEstimativaMetaCad.BTSair.Enabled:=False;
     FEstimativaMetaCad.BTEditar.Enabled:=False;
   end
   else
   begin
     FEstimativaMetaCad.BTConfirmar.Enabled:=False;
     FEstimativaMetaCad.BTCancelar.Enabled:=False;
     FEstimativaMetaCad.BTExcluir.Enabled:=True;
     FEstimativaMetaCad.BTSair.Enabled:=True;
     FEstimativaMetaCad.BTEditar.Enabled:=True;
   end;
end;

end.
