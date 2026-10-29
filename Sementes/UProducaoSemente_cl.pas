unit UProducaoSemente_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMProducaoSemente = class(TDataModule)
    QProducaoSemente: TOracleDataSet1;
    QProducaoSementeCOD_CAMPO_PLANTIO_CAB: TIntegerField;
    QProducaoSementeCOD_ROMANEIO_AGRICOLA: TIntegerField;
    QProducaoSementeCons: TOracleDataSet1;
    QProducaoSementeConsNUM_ROMANEIO: TIntegerField;
    QProducaoSementeConsQT_PESO_BRUTO: TIntegerField;
    QProducaoSementeConsDESC_PLACA: TStringField;
    DSProducaoSementeCons: TDataSource;
    QRomaneioCooperanteCons: TOracleDataSet1;
    QRomaneioCooperanteConsNUM_ROMANEIO: TIntegerField;
    QRomaneioCooperanteConsQT_PESO_BRUTO: TIntegerField;
    QRomaneioCooperanteConsDESC_PLACA: TStringField;
    DSRomaneioCooperanteCons: TDataSource;
    QRomaneioCooperanteConsCOD_ROMANEIO_AGRICOLA: TIntegerField;
    QProducaoSementeConsCOD_ROMANEIO_AGRICOLA: TIntegerField;
    QRProducaoSemente: TOracleDataSet1;
    QRProducaoSementeNUM_CAMPO_PLANTIO: TIntegerField;
    QRProducaoSementeNOME: TStringField;
    QRProducaoSementeDESC_COMPLEMENTO_2: TStringField;
    QRProducaoSementeNUM_AREA: TFloatField;
    QRProducaoSementeVAL_AREA_APROVADA: TFloatField;
    QRProducaoSementeDT_PREVISAO_COLHEITA: TDateTimeField;
    QRProducaoSementeNUM_TICKET: TIntegerField;
    QRProducaoSementeDESC_PLACA: TStringField;
    QRProducaoSementeNUM_ROMANEIO: TIntegerField;
    QRProducaoSementeQT_TARA: TIntegerField;
    QRProducaoSementeQT_PESO_BRUTO: TIntegerField;
    QRProducaoSementePERC_PH: TFloatField;
    QRProducaoSementePERC_UMIDADE: TFloatField;
    QRProducaoSementePERC_IMPUREZA: TFloatField;
    QRProducaoSementeDESC_SAFRA: TStringField;
    QRProducaoSementeDESC_CLASSE_PLANTIO: TStringField;
    QRProducaoSementePERC_DESCONTO: TFloatField;
    QRProducaoSementeTotal: TOracleDataSet1;
    QRProducaoSementeTotalTOTAL_AREA_INSCRITA: TFloatField;
    QRProducaoSementeTotalTOTAL_AREA_APROVADA: TFloatField;
    QRProducaoBrutaSemente: TOracleDataSet1;
    QRProducaoBrutaSementeDESC_COMPLEMENTO_2: TStringField;
    QRProducaoBrutaSementeNUM_AREA: TFloatField;
    QRProducaoBrutaSementeVAL_AREA_APROVADA: TFloatField;
    QRProducaoBrutaSementeDESC_SAFRA: TStringField;
    QRProducaoBrutaSementeDESC_CLASSE_PLANTIO: TStringField;
    QRProducaoBrutaSementePRODUCAO_RECEBIDA: TFloatField;
    QRProducaoBrutaSementeDESC_CULTURA: TStringField;
    QRProducaoBrutaSementeDESC_CIDADE: TStringField;
    QRProducaoBrutaSementeNUM_CAMPO_PLANTIO: TFloatField;
    QLoteSemente: TOracleDataSet1;
    QLoteSementeCOD_PRODUTO: TFloatField;
    QLoteSementeCOD_PLANTIO_SAFRA: TIntegerField;
    QLoteSementePERC_PUREZA_SEMENTE: TFloatField;
    QLoteSementeQUANT_NOCIVAS_TOL: TIntegerField;
    QLoteSementePERC_GERMINACAO: TStringField;
    QLoteSementeDESC_VALIDADE: TStringField;
    QLoteSementedesc_produto: TStringField;
    QLoteSementedesc_safra: TStringField;
    QLoteSementeCons: TOracleDataSet1;
    QLoteSementeConsNUM_LOTE_SEMENTE: TIntegerField;
    QLoteSementeConsCOD_PRODUTO: TFloatField;
    QLoteSementeConsCOD_PLANTIO_SAFRA: TIntegerField;
    QLoteSementeConsPERC_PUREZA_SEMENTE: TFloatField;
    QLoteSementeConsQUANT_NOCIVAS_TOL: TIntegerField;
    QLoteSementeConsPERC_GERMINACAO: TStringField;
    QLoteSementeConsDESC_VALIDADE: TStringField;
    QLoteSementeConsDESC_SAFRA: TStringField;
    QLoteSementeConsDESC_COMPLEMENTO_2: TStringField;
    QNumLote: TOracleDataSet1;
    QNumLoteNUM_LOTE: TFloatField;
    QLoteSementeNUM_LOTE_SEMENTE: TIntegerField;
    QRIdentificacaoAmostras: TOracleDataSet1;
    QRIdentificacaoAmostrasNUM_LOTE_SEMENTE: TIntegerField;
    QRIdentificacaoAmostrasCOD_PRODUTO: TFloatField;
    QRIdentificacaoAmostrasCOD_PLANTIO_SAFRA: TIntegerField;
    QRIdentificacaoAmostrasPERC_PUREZA_SEMENTE: TFloatField;
    QRIdentificacaoAmostrasQUANT_NOCIVAS_TOL: TIntegerField;
    QRIdentificacaoAmostrasPERC_GERMINACAO: TStringField;
    QRIdentificacaoAmostrasDESC_VALIDADE: TStringField;
    QLoteSementeQUANT_LOTE: TIntegerField;
    QRIdentificacaoAmostrasQUANT_LOTE: TIntegerField;
    QLoteSementeConsQUANT_LOTE: TIntegerField;
    QRIdentificacaoAmostrasDESC_SAFRA: TStringField;
    QRIdentificacaoAmostrasDESC_COMPLEMENTO_2: TStringField;
    QLoteSementeIND_APROVADO: TStringField;
    QLoteSementeConsIND_APROVADO: TStringField;
    QRIdentificacaoAmostrasIND_APROVADO: TStringField;
    QRProducaoBrutaSementeNUM_CGC: TStringField;
    QLoteSementeNUM_BOLETIM: TStringField;
    QLoteSementeDT_EMISSAO_BOLETIM: TDateTimeField;
    QRomaneioCooperanteConsDESC_PRODUTO: TStringField;
    QProducaoSementeConsDESC_PRODUTO: TStringField;
    QLoteSementeNUM_LOTE_SEMENTE2: TStringField;
    QLoteSementeQUANT_OUTR_ESPECIES: TIntegerField;
    QLoteSementeQT_OUTRA_CULTIVAR: TIntegerField;
    QLoteSementeDESC_OUTRO_FATOR: TStringField;
    QLoteSementeNUM_BOLETIM_QUALIDADE: TIntegerField;
    procedure QLoteSementeCalcFields(DataSet: TDataSet);
    procedure QLoteSementeBeforePost(DataSet: TDataSet);
    procedure QLoteSementeAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMProducaoSemente: TDMProducaoSemente;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMProducaoSemente.QLoteSementeCalcFields(DataSet: TDataSet);
begin
  if QLoteSementeCod_Plantio_Safra.Text <>  '' then
    QLoteSementeDesc_safra.Value:=DMOracle.BuscaNome('SELECT DESC_SAFRA FROM TB_PLANTIO_SAFRA','TB_PLANTIO_SAFRA.COD_PLANTIO_SAFRA='+IntToStr(QLoteSementeCod_Plantio_Safra.Value));
  if QLoteSementeCod_Produto.Text <> '' then
    QLoteSementeDesc_Produto.Value:=DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO_2 FROM TB_PRODUTO','COD_PRODUTO='+Trim(QLoteSementeCod_Produto.Text));
end;

procedure TDMProducaoSemente.QLoteSementeBeforePost(DataSet: TDataSet);
begin
    if QLoteSemente.State in [DSInsert] then
    begin
      QNumLote.Close;
      QNumLote.setVariable('COD_PRODUTO',QLoteSementeCod_Produto.Value);
      QNumLote.setVariable('COD_PLANTIO_SAFRA',QLoteSementeCod_Plantio_Safra.Value);
      QNumLote.Open;
      QLoteSementeNum_Lote_Semente.Text:=FloatToStr(QNumLoteNUM_Lote.Value+1);
    end;
  end;
procedure TDMProducaoSemente.QLoteSementeAfterInsert(DataSet: TDataSet);
begin
   QLoteSementeNum_Lote_Semente.Value:=0;
   QLoteSementeInd_Aprovado.Value:='NAO';
end;

end.

