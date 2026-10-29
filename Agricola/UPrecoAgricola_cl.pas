unit UPrecoAgricola_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMPrecoAgricola = class(TDataModule)
    QPrecoAgricola: TOracleDataSet1;
    QPrecoAgricolaCOD_PRODUTO: TFloatField;
    QPrecoAgricolaDT_PRECO_AGRICOLA: TDateTimeField;
    QPrecoAgricolaPERC_ACIMA: TFloatField;
    QPrecoAgricolaPERC_ABAIXO: TFloatField;
    QPrecoAgricolaCOD_PRECO_AGRICOLA: TIntegerField;
    QPrecoAgricola_Cons: TOracleDataSet1;
    QPrecoAgricola_ConsCOD_PRODUTO: TFloatField;
    QPrecoAgricola_ConsDT_PRECO_AGRICOLA: TDateTimeField;
    QPrecoAgricola_ConsVAL_PRECO: TFloatField;
    QPrecoAgricola_ConsPERC_ACIMA: TFloatField;
    QPrecoAgricola_ConsPERC_ABAIXO: TFloatField;
    QPrecoAgricola_ConsCOD_PRECO_AGRICOLA: TIntegerField;
    QPrecoAgricolaCOD_FILIAL: TIntegerField;
    QPrecoAgricola_ConsCOD_FILIAL: TIntegerField;
    QRPrecoAgricola: TOracleDataSet1;
    QRPrecoAgricolaCOD_FILIAL: TIntegerField;
    QRPrecoAgricolaDESC_FILIAL: TStringField;
    QRPrecoAgricolaCOD_PRODUTO: TFloatField;
    QRPrecoAgricolaVAL_PRECO: TFloatField;
    QRPrecoAgricolaPERC_ACIMA: TFloatField;
    QRPrecoAgricolaPERC_ABAIXO: TFloatField;
    QRPrecoAgricolaDT_PRECO_AGRICOLA: TDateTimeField;
    QRPrecoAgricolaDESC_PRODUTO: TStringField;
    QPrecoAgricolaCOD_LOTE_TIPO: TIntegerField;
    QPrecoAgricola_ConsCOD_LOTE_TIPO: TIntegerField;
    QPrecoAgricolaPERC_ACIMA_CONTRATOS: TFloatField;
    QPrecoAgricolaPERC_ABAIXO_CONTRATOS: TFloatField;
    QPrecoAgricola_ConsVAL_PRECO_GP_REAL: TFloatField;
    QPrecoAgricola_ConsVAL_PRECO_GP_DOLAR: TFloatField;
    QPrecoAgricola_ConsVAL_PRECO_CF_REAL: TFloatField;
    QPrecoAgricola_ConsPERC_ACIMA_CONTRATOS: TFloatField;
    QPrecoAgricola_ConsPERC_ABAIXO_CONTRATOS: TFloatField;
    QPrecoAgricolaVAL_PRECO: TFloatField;
    QPrecoAgricolaVAL_PRECO_GP_REAL: TFloatField;
    QPrecoAgricolaVAL_PRECO_GP_DOLAR: TFloatField;
    QPrecoAgricolaVAL_PRECO_CF_REAL: TFloatField;
    procedure QPrecoAgricolaAfterInsert(DataSet: TDataSet);
    procedure QPrecoAgricolaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPrecoAgricola: TDMPrecoAgricola;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMPrecoAgricola.QPrecoAgricolaAfterInsert(DataSet: TDataSet);
begin
  QPrecoAgricolaDT_PRECO_AGRICOLA.Value := Date;
end;

procedure TDMPrecoAgricola.QPrecoAgricolaBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QPrecoAgricolaCOD_FILIAL.Text);
  // Estava permitindo cadastrar preço sem informar esses dados, ae dava problema na hora
  // de gerar a nota fiscal agricola - Marlon 06/2008
  if QPrecoAgricolaCOD_PRODUTO.Text = '' then
    Raise Exception.Create('Produto não informado');
  if QPrecoAgricolaCOD_FILIAL.Text = '' then
    Raise Exception.Create('Filial não informada');
  if QPrecoAgricolaCOD_LOTE_TIPO.Text = '' then
    Raise Exception.Create('Lote não informado');
  if QPrecoAgricolaVAL_PRECO.Text = '' then
    Raise Exception.Create('Preço não informado');
end;

end.
