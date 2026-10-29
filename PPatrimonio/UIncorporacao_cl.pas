unit UIncorporacao_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMIncorporacao = class(TDataModule)
    QIncorporacao: TOracleDataSet1;
    QIncorporacaoCOD_PATRIMONIO_INCORPORACAO: TIntegerField;
    QIncorporacaoCOD_PATRIMONIO_ITEM: TIntegerField;
    QIncorporacaoVAL_INCORPORACAO: TFloatField;
    QIncorporacaoDT_INCORPORACAO: TDateTimeField;
    QIncorporacaoCOD_NOTA_CAB: TIntegerField;
    QIncorporacaoCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QIncorporacaoCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QIncorporacaoVAL_INCORPORACAO_DEPRECIADO: TFloatField;
    QBaixa: TOracleDataSet1;
    QBaixaCOD_PATRIMONIO_BAIXA: TIntegerField;
    QBaixaCOD_PATRIMONIO_ITEM: TIntegerField;
    QBaixaVAL_BAIXA: TFloatField;
    QBaixaDT_BAIXA: TDateTimeField;
    QBaixaIND_SITUACAO: TStringField;
    QBaixaCOD_PATRIMONIO_DEPRECIACAO: TIntegerField;
    QBaixaCOD_LCTO_CONT_BX_CRED: TIntegerField;
    QBaixaCOD_LCTO_CONT_BX_DEB: TIntegerField;
    QBaixaCOD_LCTO_CONT_BX_DEP_ACUM_CRED: TIntegerField;
    QBaixaCOD_LCTO_CONT_BX_DEP_ACUM_DEB: TIntegerField;
    QBaixaVAL_BAIXA_DEP_ACUM: TFloatField;
    QBaixaCOD_LCTO_CONT_BX_CIAP_CRED: TIntegerField;
    QBaixaCOD_LCTO_CONT_BX_CIAP_DEB: TIntegerField;
    QBaixaVAL_BAIXA_VAL_ATUAL: TFloatField;
    procedure QIncorporacaoAfterInsert(DataSet: TDataSet);
    procedure QIncorporacaoAfterEdit(DataSet: TDataSet);
    procedure QIncorporacaoBeforeDelete(DataSet: TDataSet);
    procedure QIncorporacaoBeforePost(DataSet: TDataSet);
    procedure QIncorporacaoAfterPost(DataSet: TDataSet);
    procedure QIncorporacaoAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMIncorporacao: TDMIncorporacao;

implementation

uses UOracle_cl, UPatrimonio_cl;

{$R *.DFM}

procedure TDMIncorporacao.QIncorporacaoAfterInsert(DataSet: TDataSet);
begin

  DMIncorporacao.QIncorporacaoDT_INCORPORACAO.Value := date;

//  if DMPatrimonio.QPatrimonioItemIND_CONFIRMADO.Value <> 'SIM' then
//  begin
//    DMIncorporacao.QIncorporacao.cancel;
//    raise Exception.Create('Não pode ser feita uma incorporação em um patrimônio não confirmado!');
//  end;

  if DMPatrimonio.QPatrimonioItemIND_SITUACAO.Value <> 'ATIVO' then
  begin
    DMIncorporacao.QIncorporacao.cancel;
    raise Exception.Create('Não pode ser feita uma incorporação em um patrimônio não ativo!');
  end;
end;

procedure TDMIncorporacao.QIncorporacaoAfterEdit(DataSet: TDataSet);
begin
  if QIncorporacao.State = dsedit then
  begin
    QIncorporacao.cancel;
    Raise Exception.Create('Essa Incoporação não pode ser alterada.');
  end;
end;

procedure TDMIncorporacao.QIncorporacaoBeforeDelete(DataSet: TDataSet);
begin
  //FOI CRIADO UMA TRIGGER PARA O CÓDIGO COMENTADO ABAIXO
end;

procedure TDMIncorporacao.QIncorporacaoBeforePost(DataSet: TDataSet);
begin
  with DMPatrimonio do
  begin
    if QPatrimonioItemCOD_PATRIMONIO_ITEM.Text <> '' then
      QIncorporacaoCOD_PATRIMONIO_ITEM.Value := QPatrimonioItemCOD_PATRIMONIO_ITEM.Value;
  end;
  //FOI CRIADA UMA TRIGGER NO BANCO DE DADOS PARA O CÓDIGO QUE ESTAVA AQUI
end;

procedure TDMIncorporacao.QIncorporacaoAfterPost(DataSet: TDataSet);
begin
  DMPatrimonio.QPatrimonioItem.RefreshRecord;
  QIncorporacao.RefreshRecord;
end;

procedure TDMIncorporacao.QIncorporacaoAfterDelete(DataSet: TDataSet);
begin
  DMPatrimonio.QPatrimonioItem.RefreshRecord;
end;

end.
