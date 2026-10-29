unit UPatrimonio_cl;

interface      

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, Oracle;

type
  TDMPatrimonio = class(TDataModule)
    QPatrimonio: TOracleDataSet1;
    QPatrimonioCons: TOracleDataSet1;
    QPatrimonioItem: TOracleDataSet1;
    QPatrimonioItemCons: TOracleDataSet1;
    QPatrimonioCOD_PATRIMONIO_CAB: TIntegerField;
    QPatrimonioDESC_PATRIMONIO: TStringField;
    QPatrimonioConsCOD_PATRIMONIO_CAB: TIntegerField;
    QPatrimonioConsDESC_PATRIMONIO: TStringField;
    QPatrimonioItemCOD_PATRIMONIO_ITEM: TIntegerField;
    QPatrimonioItemCOD_PATRIMONIO_CAB: TIntegerField;
    QPatrimonioItemCOD_PRODUTO: TFloatField;
    QPatrimonioItemCOD_USUARIO: TIntegerField;
    QPatrimonioItemCOD_FILIAL: TIntegerField;
    QPatrimonioItemCOD_MOEDA: TIntegerField;
    QPatrimonioItemIND_SITUACAO: TStringField;
    QPatrimonioItemPERC_DEPRECIACAO: TFloatField;
    QPatrimonioItemVAL_AQUISICAO: TFloatField;
    QPatrimonioItemVAL_ATUAL: TFloatField;
    QPatrimonioItemDT_AQUISICAO: TDateTimeField;
    QPatrimonioItemDT_BAIXA: TDateTimeField;
    QPatrimonioItemDT_ULTIMA_DEPRECIACAO: TDateTimeField;
    QPatrimonioItemDT_ULTIMA_CORRECAO: TDateTimeField;
    QPatrimonioItemANO_FABRICACAO: TIntegerField;
    DSPatrimonio: TDataSource;
    DSPatrimonioItem: TDataSource;
    QRRelacaoPatrimonio: TOracleDataSet1;
    QRRelacaoPatrimonioCOD_PATRIMONIO_CAB: TIntegerField;
    QRRelacaoPatrimonioDESC_PATRIMONIO: TStringField;
    QRPatrimonioItem: TOracleDataSet1;
    QRPatrimonioItemCOD_PATRIMONIO_ITEM: TIntegerField;
    QRPatrimonioItemCOD_USUARIO: TIntegerField;
    QRPatrimonioItemCOD_MOEDA: TIntegerField;
    QRPatrimonioItemIND_SITUACAO: TStringField;
    QRPatrimonioItemPERC_DEPRECIACAO: TFloatField;
    QRPatrimonioItemVAL_AQUISICAO: TFloatField;
    QRPatrimonioItemVAL_ATUAL: TFloatField;
    QRPatrimonioItemDT_AQUISICAO: TDateTimeField;
    QRPatrimonioItemDT_BAIXA: TDateTimeField;
    QRPatrimonioItemDT_ULTIMA_DEPRECIACAO: TDateTimeField;
    QRPatrimonioItemDT_ULTIMA_CORRECAO: TDateTimeField;
    QRPatrimonioItemANO_FABRICACAO: TIntegerField;
    QRPatrimonioItemCOD_PATRIMONIO_CAB: TIntegerField;
    QRPatrimonioItemDESC_PATRIMONIO: TStringField;
    QRPatrimonioItemCOD_PRODUTO: TFloatField;
    QRPatrimonioItemDESC_MOEDA: TStringField;
    QRPatrimonioItemCOD_FILIAL: TIntegerField;
    QPatrimonioItemDT_INICIO_USO: TDateTimeField;
    QPatrimonioItemDESC_OBS: TStringField;
    QPatrimonioItemCOD_NOTA_CAB_ENTRADA: TIntegerField;
    QPatrimonioItemCOD_NOTA_CAB_SAIDA: TIntegerField;
    QPatrimonioItemCOD_LOCALIZACAO: TIntegerField;
    QPatrimonioItemConsCOD_PATRIMONIO_ITEM: TIntegerField;
    QPatrimonioItemConsCOD_FILIAL: TIntegerField;
    QPatrimonioItemConsIND_SITUACAO: TStringField;
    QPatrimonioItemConsDT_AQUISICAO: TDateTimeField;
    QPatrimonioItemConsCOD_NOTA_CAB_ENTRADA: TIntegerField;
    QPatrimonioItemConsCOD_NOTA_CAB_SAIDA: TIntegerField;
    QPatrimonioItemConsCOD_PATRIMONIO_CAB: TIntegerField;
    QPatrimonioItemConsDESC_PATRIMONIO: TStringField;
    QPatrimonioItemConsCOD_PRODUTO: TFloatField;
    QPatrimonioItemConsDESC_PRODUTO: TStringField;
    QPatrimonioItemConsNOME: TStringField;
    QPatrimonioItemConsDESC_LOCALIZACAO: TStringField;
    QRPatrimonioItemCOD_NOTA_CAB_ENTRADA: TIntegerField;
    QRPatrimonioItemCOD_NOTA_CAB_SAIDA: TIntegerField;
    QRPatrimonioItemNOME: TStringField;
    QRPatrimonioItemCOD_LOCALIZACAO: TIntegerField;
    QRPatrimonioItemDESC_LOCALIZACAO: TStringField;
    QPatrimonioItemNUM_PATRIMONIO: TIntegerField;
    DSListaItem: TDataSource;
    QPatrimonioItemDESC_COMPONENTE_1: TStringField;
    QPatrimonioItemDESC_COMPONENTE_2: TStringField;
    QPatrimonioItemDESC_COMPONENTE_3: TStringField;
    QPatrimonioItemDESC_COMPONENTE_4: TStringField;
    QRPatrimonioItemNUM_PATRIMONIO: TIntegerField;
    QPatrimonioItemval_total: TFloatField;
    QPatrimonioItemVAL_ICMS: TFloatField;
    QPatrimonioItemNUM_LRE: TIntegerField;
    QPatrimonioItemNUM_FOLHA_LRE: TIntegerField;
    QPatrimonioItemIND_GERA_CIAP: TStringField;
    QPatrimonioItemNUM_ORDEM: TIntegerField;
    QPatrimonioItemDESC_GRAVAME: TStringField;
    QPatrimonioItemperc_ao_mes: TFloatField;
    QPatrimonioItemtempo_depreciacao: TFloatField;
    QPatrimonioItemval_depreciado: TFloatField;
    QPatrimonioItemCONTA_CREDITO_DEPRECIACAO: TStringField;
    QPatrimonioItemCONTA_DEBITO_DEPRECIACAO: TStringField;
    QPatrimonioItemCONTA_CREDITO_CIAP: TStringField;
    QPatrimonioItemCONTA_DEBITO_CIAP: TStringField;
    QPatrimonioItemCONTA_CREDITO_DIF_CIAP: TStringField;
    QPatrimonioItemCONTA_DEBITO_DIF_CIAP: TStringField;
    QPatrimonioItemHISTORICO_CONTABIL: TIntegerField;
    QPatrimonioItemCONTA_CREDITO_BAIXA: TStringField;
    QPatrimonioItemCONTA_DEBITO_BAIXA: TStringField;
    QPatrimonioItemCONTA_CREDITO_BAIXA_DEP: TStringField;
    QPatrimonioItemCONTA_DEBITO_BAIXA_DEP: TStringField;
    QPatrimonioItemCOD_LCTO_CONT_BX_CRED: TIntegerField;
    QPatrimonioItemCOD_LCTO_CONT_BX_DEB: TIntegerField;
    QPatrimonioItemCOD_LCTO_CONT_BX_DEP_ACUM_CRED: TIntegerField;
    QPatrimonioItemCOD_LCTO_CONT_BX_DEP_ACUM_DEB: TIntegerField;
    QPatrimonioItemDESC_PERDA_CIAP: TStringField;
    QPatrimonioItemDT_PERDA_CIAP: TDateTimeField;
    QPatrimonioItemIND_CONFIRMADO: TStringField;
    QPatrimonioItemCONTA_CREDITO_ICMS: TStringField;
    QPatrimonioItemCONTA_DEBITO_ICMS: TStringField;
    QPatrimonioItemCOD_LCTO_CONT_ICMS_CRED: TIntegerField;
    QPatrimonioItemCOD_LCTO_CONT_ICMS_DEB: TIntegerField;
    QPatrimonioItemCONTA_CONTABIL_BEM: TStringField;
    QPatrimonioItemCOD_PATRIMONIO_ITEM_TRANSF: TIntegerField;
    QPatrimonioItemCOD_LCTO_CONT_BX_CIAP_CRED: TIntegerField;
    QPatrimonioItemCOD_LCTO_CONT_BX_CIAP_DEB: TIntegerField;
    QRPatrimonioItemDESC_PRODUTO: TStringField;
    OPContabilidade: TOraclePackage;
    OPPatrimonio: TOraclePackage;
    QPatrimonioItemCOD_HISTORICO_DEPRECIACAO: TIntegerField;
    QPatrimonioItemCOD_HISTORICO_CIAP: TIntegerField;
    QPatrimonioItemCOD_HISTORICO_DIF_CIAP: TIntegerField;
    QPatrimonioItemCOD_HISTORICO_BAIXA: TIntegerField;
    QPatrimonioItemCOD_HISTORICO_BAIXA_DEP: TIntegerField;
    QPatrimonioItemCOD_HISTORICO_ICMS: TIntegerField;
    QPatrimonioItemCOD_PATRIMONIO_GRUPO_CONTA: TIntegerField;
    QPatrimonioBaixa: TOracleDataSet1;
    QPatrimonioBaixaCOD_PATRIMONIO_BAIXA: TIntegerField;
    QPatrimonioBaixaCOD_PATRIMONIO_ITEM: TIntegerField;
    QPatrimonioBaixaVAL_BAIXA: TFloatField;
    QPatrimonioBaixaDT_BAIXA: TDateTimeField;
    QPatrimonioBaixaIND_SITUACAO: TStringField;
    QPatrimonioBaixaCOD_PATRIMONIO_DEPRECIACAO: TIntegerField;
    QRPatrimonioNaoConfirmado: TOracleDataSet1;
    QRPatrimonioNaoConfirmadoCOD_PATRIMONIO_CAB: TIntegerField;
    QRPatrimonioNaoConfirmadoDESC_PATRIMONIO: TStringField;
    QPatrimonioItemIND_TIPO_DEPRECIACAO: TStringField;
    QPatrimonioConserto: TOracleDataSet1;
    QPatrimonioConsertoCOD_PATRIMONIO_CONSERTO: TIntegerField;
    QPatrimonioConsertoCOD_PATRIMONIO_ITEM: TIntegerField;
    QPatrimonioConsertoCOD_CADASTRO: TIntegerField;
    QPatrimonioConsertoDESC_OBSERVACAO: TStringField;
    QPatrimonioConsertoDT_REMESSA: TDateTimeField;
    QPatrimonioConsertoDT_RETORNO: TDateTimeField;
    QPatrimonioItemCOD_CST_PIS_DEPRECIACAO: TStringField;
    QPatrimonioItemCOD_CST_PIS_INCORPORACAO: TStringField;
    QPatrimonioItemCOD_CST_COFINS_INCORPORACAO: TStringField;
    QPatrimonioItemCOD_CST_COFINS_DEPRECIACAO: TStringField;
    QCstPisIncorporacao: TOracleDataSet1;
    QCstPisDepreciacao: TOracleDataSet1;
    QCstPisIncorporacaoCOD_CST_PIS: TStringField;
    QCstPisIncorporacaoDESC_CST_PIS: TStringField;
    QCstPisIncorporacaoDESC_COMPLETA: TStringField;
    QCstPisDepreciacaoCOD_CST_PIS: TStringField;
    QCstPisDepreciacaoDESC_CST_PIS: TStringField;
    QCstPisDepreciacaoDESC_COMPLETA: TStringField;
    QCstCofinsIncorporacao: TOracleDataSet1;
    QCstCofinsDepreciacao: TOracleDataSet1;
    QCstCofinsIncorporacaoCOD_CST_COFINS: TStringField;
    QCstCofinsIncorporacaoDESC_CST_COFINS: TStringField;
    QCstCofinsIncorporacaoDESC_COMPLETA: TStringField;
    QCstCofinsDepreciacaoCOD_CST_COFINS: TStringField;
    QCstCofinsDepreciacaoDESC_CST_COFINS: TStringField;
    QCstCofinsDepreciacaoDESC_COMPLETA: TStringField;
    DSPisIncorporacao: TDataSource;
    DSPisDepreciacao: TDataSource;
    DSCofinsIncorporacao: TDataSource;
    DSCofinsDepreciacao: TDataSource;
    QIdentBemImob: TOracleDataSet1;
    QOrigCred: TOracleDataSet1;
    QIdentBemImobCOD_IDENT_BEM_IMOB: TStringField;
    QIdentBemImobDESC_IDENT_BEM_IMOB: TStringField;
    QIdentBemImobDESC_COMPLETA: TStringField;
    QOrigCredCOD_ORIG_CRED: TStringField;
    QOrigCredDESC_ORIG_CRED: TStringField;
    QOrigCredDESC_COMPLETA: TStringField;
    QUtilBemImob: TOracleDataSet1;
    DSIdentBemImob: TDataSource;
    DSOrigCred: TDataSource;
    DSUtilBemImob: TDataSource;
    QPatrimonioItemCOD_IDENT_BEM_IMOB: TStringField;
    QPatrimonioItemCOD_ORIG_CRED: TStringField;
    QPatrimonioItemCOD_UTIL_BEM_IMOB: TIntegerField;
    procedure QPatrimonioItemCalcFields(DataSet: TDataSet);
    procedure QPatrimonioItemBeforePost(DataSet: TDataSet);
    procedure QPatrimonioBeforeCancel(DataSet: TDataSet);
    procedure QPatrimonioItemBeforeEdit(DataSet: TDataSet);
    procedure QPatrimonioAfterCancel(DataSet: TDataSet);
    procedure QPatrimonioItemBeforeInsert(DataSet: TDataSet);
    procedure QPatrimonioItemAfterInsert(DataSet: TDataSet);
    procedure QPatrimonioItemAfterPost(DataSet: TDataSet);
    procedure QPatrimonioBeforePost(DataSet: TDataSet);
    procedure QPatrimonioItemAfterOpen(DataSet: TDataSet);
    procedure QPatrimonioItemVAL_AQUISICAOValidate(Sender: TField);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  DMPatrimonio: TDMPatrimonio;
  wFilial, wNavigator :String;
  wDtAquisicao :TDateTime;
  wProduto, wUsuario, wPatrimonio, wLocalizacao :Integer;

implementation

uses UOracle_cl, UUsuario_cl, UPatrimonioCad, USequencia_cl;

{$R *.DFM}

procedure CalculaTotalItem (Cod_Patrimonio_Cab:Integer);
begin

end;


procedure TDMPatrimonio.QPatrimonioItemCalcFields(DataSet: TDataSet);
var wVal : string;
begin
  wVal := DMOracle.BuscaNome('SELECT SUM(VAL_ATUAL) FROM TB_PATRIMONIO_ITEM',
                                                              'COD_PATRIMONIO_CAB = '+QPatrimonioItemCOD_PATRIMONIO_CAB.text);
  if wVal <> '' then
    QPatrimonioItemVal_Total.Value:=StrToFloat(wVal);


  if QPatrimonioItemPERC_DEPRECIACAO.Text <> '' then
  begin
    QPatrimonioItemperc_ao_mes.Value := QPatrimonioItemPERC_DEPRECIACAO.Value / 12;
    QPatrimonioItemtempo_depreciacao.Value := 100 / QPatrimonioItemPERC_DEPRECIACAO.Value
  end
  else
  begin
    QPatrimonioItemperc_ao_mes.Text := '';
    QPatrimonioItemtempo_depreciacao.Text := '';
  end;

  if (QPatrimonioItemVAL_AQUISICAO.text <> '') and (QPatrimonioItemVAL_ATUAL.text <> '') then
    QPatrimonioItemval_depreciado.Value := QPatrimonioItemVAL_AQUISICAO.Value - QPatrimonioItemVAL_ATUAL.Value
  else
    QPatrimonioItemval_depreciado.Text := '';

end;

procedure TDMPatrimonio.QPatrimonioItemBeforePost(DataSet: TDataSet);
var
  num : integer;
begin
  if QPatrimonioItem.State = DSInsert then
  begin
      DMUsuario.Checar_Filial_Usuario(QPatrimonioItemCOD_FILIAL.Text, 'PATRIMONIO');
      num := DMSequencia.Sequencia(QPatrimonioItemCOD_FILIAL.Value, 'NUM_PATRIMONIO_ITEM');
      QPatrimonioItemNum_Patrimonio.Value := num;
  end;

  if (QPatrimonioItem.State = DSEdit) And (QPatrimonioItemNUM_ORDEM.Text = '')
     and (QPatrimonioItemIND_GERA_CIAP.Value = 'SIM') then
    QPatrimonioItemNUM_ORDEM.Value := DMSequencia.Sequencia(Trunc(QPatrimonioItemCOD_FILIAL.VALUE),'NUM_ORDEM_CIAP');

  if ((QPatrimonioItem.State = DSEdit) And (QPatrimonioItemNUM_ORDEM.Text <> '')
     and (QPatrimonioItemIND_GERA_CIAP.Text = 'NAO')) then
    QPatrimonioItemNUM_ORDEM.Text := '';

//  DMOracle.DBCemapa.Commit;
end;

procedure TDMPatrimonio.QPatrimonioBeforeCancel(DataSet: TDataSet);
begin
//  If QPatrimonioItem.State in [dsEdit,dsInsert] then
//   QPatrimonioItem.Cancel;

//  DMOracle.DBCemapa.Rollback;
end;

procedure TDMPatrimonio.QPatrimonioItemBeforeEdit(DataSet: TDataSet);
begin
{  If(QPatrimonio.State <> dsEdit)Then
  Begin
    Raise Exception.Create('Cadastro de Patrimônio não está no modo de alteração!');
  End;}
  if QPatrimonioItemIND_CONFIRMADO.Value = 'SIM' then
    MessageDlg('Este patrimonio está confirmado, alguns campos não poderão ser alterados',
        mtInformation, [mbOk], 0);
end;

procedure TDMPatrimonio.QPatrimonioAfterCancel(DataSet: TDataSet);
begin
//  DMOracle.DBCemapa.Rollback;
end;

procedure TDMPatrimonio.QPatrimonioItemBeforeInsert(DataSet: TDataSet);
begin
//  If not(QPatrimonio.State = DSEdit) or not(QPatrimonio.State = DSInsert) Then
   // showmessage('O Patrimônio deve estar em modo de Alteração');
   wFilial := QPatrimonioItemCOD_FILIAL.Text;
   wProduto := Trunc(QPatrimonioItemCOD_PRODUTO.Value);
   wUsuario := QPatrimonioItemCOD_USUARIO.Value;
   wPatrimonio := QPatrimonioItemCOD_PATRIMONIO_CAB.Value;
   wLocalizacao := QPatrimonioItemCOD_LOCALIZACAO.Value;
   wDtAquisicao := QPatrimonioItemDT_AQUISICAO.Value;

end;

procedure TDMPatrimonio.QPatrimonioItemAfterInsert(DataSet: TDataSet);
begin
  QPatrimonioItemIND_SITUACAO.Value := 'ATIVO';
  QPatrimonioItemIND_CONFIRMADO.Value := 'NAO';
end;

procedure TDMPatrimonio.QPatrimonioItemAfterPost(DataSet: TDataSet);
begin
//  If(QPatrimonio.State = DSEdit) or (QPatrimonio.State = DSInsert) Then
//    QPatrimonio.post;
end;

procedure TDMPatrimonio.QPatrimonioBeforePost(DataSet: TDataSet);
begin
//  DMOracle.DBCemapa.Commit;
end;

procedure TDMPatrimonio.QPatrimonioItemAfterOpen(DataSet: TDataSet);
begin
  QCstPisIncorporacao.Close;
  //QCstPisIncorporacao.SetVariable('IND_TIPO', 'NULL');
  QCstPisIncorporacao.Open;

  QCstCofinsIncorporacao.Close;
  //QCstCofinsIncorporacao.SetVariable('IND_TIPO', 'NULL');
  QCstCofinsIncorporacao.Open;

  QCstPisDepreciacao.Close;
  //QCstPisDepreciacao.SetVariable('IND_TIPO', 'NULL');
  QCstPisDepreciacao.Open;

  QCstCofinsDepreciacao.Close;
  //QCstCofinsDepreciacao.SetVariable('IND_TIPO', 'NULL');
  QCstCofinsDepreciacao.Open;

  QIdentBemImob.Open;
  QOrigCred.Open;
  QUtilBemImob.Open;
end;

procedure TDMPatrimonio.QPatrimonioItemVAL_AQUISICAOValidate(
  Sender: TField);
begin
  if QPatrimonioItemVAL_ATUAL.IsNull then
    QPatrimonioItemVAL_ATUAL.Value := QPatrimonioItemVAL_AQUISICAO.Value;
end;

end.
