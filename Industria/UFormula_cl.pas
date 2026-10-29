unit UFormula_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, DBClient;

type
  TDMFormula = class(TDataModule)
    DSFormula: TDataSource;
    DSFormulaItem: TDataSource;
    QRFormula: TOracleDataSet1;
    QRProjecao: TOracleDataSet1;
    QRProjecaoCOD_FORMULA: TIntegerField;
    QRProjecaoCOD_PROD_FORMULA: TFloatField;
    QRProjecaoSQT_PROJECAO: TFloatField;
    QRProjecaoCOD_PROD_MAT_PRIMA: TFloatField;
    QRProjecaoSQT_ESTOQUE: TFloatField;
    QRProjecaoSQT_SALDO_ESTOQUE: TFloatField;
    QFormulaCons: TOracleDataSet1;
    QFormulaConsCOD_FORMULA: TIntegerField;
    QFormulaConsCOD_LOTE_TIPO: TIntegerField;
    QRFormula_Custo: TOracleDataSet1;
    QRFormula_CustoCOD_FORMULA: TIntegerField;
    QRFormula_CustoCOD_PRODUTO_FORMULA: TIntegerField;
    QRFormula_CustoVAL_CUSTO_OPERACIONAL: TFloatField;
    QRFormula_CustoQT_PRODUCAO: TFloatField;
    QRFormula_CustoCOD_PRODUTO_ITEM: TIntegerField;
    QRFormula_CustoQT_ITEM: TFloatField;
    QRFormula_Custodesc_produto_acabado: TStringField;
    QFormula: TOracleDataSet1;
    QFormulaCOD_FORMULA: TIntegerField;
    QFormulaCOD_PRODUTO: TIntegerField;
    QFormulaCOD_LOTE_TIPO: TIntegerField;
    QFormulaVAL_CUSTO_OPERACIONAL: TFloatField;
    QFormulaQT_PRODUCAO: TFloatField;
    QFormulaCOD_FILIAL: TIntegerField;
    QFormulanome_produto: TStringField;
    QFormulanome_lote: TStringField;
    QFormulanome_filial: TStringField;
    QFormulaItem: TOracleDataSet1;
    QFormulaItemCOD_FORMULA: TIntegerField;
    QFormulaItemCOD_FORMULA_ITEM: TIntegerField;
    QFormulaItemCOD_PRODUTO: TIntegerField;
    QFormulaItemCOD_LOTE_TIPO: TIntegerField;
    QFormulaItemQT_ITEM: TFloatField;
    QFormulaItemIND_REAPROVEITAMENTO: TStringField;
    QFormulaItemnome_produto: TStringField;
    QFormulaItemnome_lote: TStringField;
    QFormulaDESC_OBSERVACAO: TStringField;
    QFormulaDESC_OBSERVACAO1: TStringField;
    QFormulaConsDESC_OBSERVACAO: TStringField;
    QRCustoFormula: TOracleDataSet1;
    QFormulaCusto: TOracleDataSet1;
    QFormulaCustoCOD_FORMULA_CUSTO: TIntegerField;
    QFormulaCustoCOD_FORMULA: TIntegerField;
    QFormulaCustoDESC_FORMULA_CUSTO: TStringField;
    QFormulaCustoQT_QUANTIDADE: TFloatField;
    QFormulaCustoVAL_CUSTO: TFloatField;
    DSFormulaCusto: TDataSource;
    QRCustoFormulaCOD_FORMULA_CUSTO: TIntegerField;
    QRCustoFormulaCOD_FORMULA: TIntegerField;
    QRCustoFormulaDESC_FORMULA_CUSTO: TStringField;
    QRCustoFormulaQT_QUANTIDADE: TFloatField;
    QRCustoFormulaVAL_CUSTO: TFloatField;
    QRProjecaoDESC_PROD_FORMULA: TStringField;
    QRProjecaoDESC_PROD_MAT_PRIMA: TStringField;
    QFormulaConsDESC_PRODUTO: TStringField;
    QRFormula_CustoDESC_PRODUTO: TStringField;
    QRFormula_CustoVL_CUSTO_ESTOQUE: TFloatField;
    QRFormula_Custovl_custo_medio: TFloatField;
    QRFormula_CustoCOD_FILIAL: TIntegerField;
    QFormulaItemIND_BAIXA_ESTOQUE: TStringField;
    QRFormulaCOD_FORMULA: TIntegerField;
    QRFormulaDESC_PRODUTO_ACABADO: TStringField;
    QRFormulaDESC_PRODUTO_MATPRIMA: TStringField;
    QRFormulaVAL_CUSTO_OPERACIONAL: TFloatField;
    QRFormulaCOD_PRODUTO_ITEM: TIntegerField;
    QRFormulaQT_ITEM: TFloatField;
    QRFormulaCOD_LOTE_ITEM: TIntegerField;
    QRFormulaCOD_LOTE_FORMULA: TIntegerField;
    QRFormulaQT_MINIMO: TFloatField;
    QRFormulaQT_MAXIMO: TFloatField;
    QRRelacaoFormula: TOracleDataSet1;
    QRRelacaoFormuladesc_produto: TStringField;
    QRRelacaoFormulaCOD_FORMULA: TIntegerField;
    QRRelacaoFormulaCOD_PRODUTO: TIntegerField;
    QRRelacaoFormulaCOMPONENTE: TIntegerField;
    QRRelacaoFormulaDESC_COMPONENTE: TStringField;
    QRRelacaoFormulaQT_ITEM: TFloatField;
    QRRelacaoFormulaqt_minimo: TIntegerField;
    QRRelacaoFormulaqt_maximo: TIntegerField;
    QFormulaInsumo: TOracleDataSet1;
    DSFormulaInsumo: TDataSource;
    QFormulaInsumoCOD_FORMULA_INSUMO: TIntegerField;
    QFormulaInsumoCOD_FORMULA: TIntegerField;
    QFormulaInsumoCOD_PRODUTO: TIntegerField;
    QFormulaInsumoCOD_LOTE_TIPO: TIntegerField;
    QFormulaInsumoDESC_OBS: TMemoField;
    QFormulaInsumoQT_QUANTIDADE: TFloatField;
    QFormulaInsumoIND_BAIXA_ESTOQUE: TStringField;
    QFormulaInsumodesc_produto: TStringField;
    QRFormula_CustoDESC_UNIDADE: TStringField;
    QRRelacaoFormulaDESC_UNIDADE: TStringField;
    QRCustoFormulaVAL_CUSTO_OPERACIONAL: TFloatField;
    QRProjecaoVL_CUSTO: TFloatField;
    QSomaItemFormula: TOracleDataSet1;
    DSSomaItemFormula: TDataSource;
    QSomaItemFormulaSQT_ITEM: TFloatField;
    QRRelacaoFormulaVL_CUSTO: TFloatField;
    QRRelacaoFormulawCusto: TFloatField;
    QRRelacaoFormulaVAL_CUSTO_OPERACIONAL: TFloatField;
    QFormulaDESC_MODO_PREPARO: TMemoField;
    CdsDuplicaFormula: TClientDataSet;
    CdsDuplicaFormulacod_produto: TIntegerField;
    CdsDuplicaFormulacod_lote_tipo: TIntegerField;
    CdsDuplicaFormulaqt_item: TFloatField;
    CdsDuplicaFormulaind_reaproveitamento: TStringField;
    CdsDuplicaFormulanome_produto: TStringField;
    CdsDuplicaFormulanome_lote: TStringField;
    CdsDuplicaFormulaind_baixa_estoque: TStringField;
    CdsDuplicaFormulacod_formula: TIntegerField;
    CdsDuplicaFormulacod_formula_item: TIntegerField;
    QRProdAcaboMatPrima: TOracleDataSet1;
    QRProdAcaboMatPrimaCOD_FORMULA: TIntegerField;
    QRProdAcaboMatPrimaDESC_PRODUTO_ACABADO: TStringField;
    QRProdAcaboMatPrimaDESC_PRODUTO_MATPRIMA: TStringField;
    QRProdAcaboMatPrimaCOD_PRODUTO_ITEM: TIntegerField;
    QRProjecaoCompras: TOracleDataSet1;
    QRProjecaoComprasCODFORMULA: TIntegerField;
    QRProjecaoComprasNOMEFORMULA: TStringField;
    QRProjecaoComprasPRODUTO: TIntegerField;
    QRProjecaoComprasNOME_PRODUTO: TStringField;
    QRProjecaoComprasQTD_FORMULA_ITEM: TFloatField;
    QRProjecaoComprasQT_TOTAL_FORMULA: TFloatField;
    QRProjecaoComprasESTOQUE: TFloatField;
    QRProjecaoComprasQTD_PROJETADA1: TFloatField;
    QRProjecaoComprasQTD_PROJETADA2: TFloatField;
    QRProjecaoComprasQTD_PROJETADA3: TFloatField;
    QRProjecaoComprasQTD_PROJETADA4: TFloatField;
    QRProjecaoComprasQTD_PROJETADA5: TFloatField;
    QRProjecaoComprasQTD_PROJETADA6: TFloatField;
    QRProjecaoComprasQTD_PROJETADA7: TFloatField;
    QRProjecaoComprasQTD_PROJETADA8: TFloatField;
    QRProjecaoComprasqtd_produzida: TFloatField;
    QRProjecaoComprasFORMULA1: TFloatField;
    QRProjecaoComprasFORMULA2: TFloatField;
    QRProjecaoComprasFORMULA3: TFloatField;
    QRProjecaoComprasFORMULA4: TFloatField;
    QRProjecaoComprasFORMULA5: TFloatField;
    QRProjecaoComprasFORMULA6: TFloatField;
    QRProjecaoComprasFORMULA7: TFloatField;
    QRProjecaoComprasFORMULA8: TFloatField;
    QRProjecaoComprasqtd_compra: TFloatField;
    QRProjecaoComprasPRODFORMULA: TIntegerField;
    QFormulaCOD_USUARIO: TIntegerField;
    QFormulaItemCOD_USUARIO: TIntegerField;
    QRFormula_CustoVAL_VAREJO: TFloatField;
    QFormulaIND_SITUACAO: TStringField;
    QFormulaConsIND_SITUACAO: TStringField;
    CdsDuplicaFormulacod_usuario: TIntegerField;
    QRFormulaNUM_FABRICANTE: TStringField;
    QRFormula_CustoNUM_FABRICANTE: TStringField;
    QRRelacaoFormulaNUM_FABRICANTE: TStringField;
    procedure QFormulaCalcFields(DataSet: TDataSet);
    procedure QFormulaAfterInsert(DataSet: TDataSet);
    procedure QFormulaBeforeInsert(DataSet: TDataSet);
    procedure QFormulaBeforeEdit(DataSet: TDataSet);
    procedure QFormulaAfterCancel(DataSet: TDataSet);
    procedure QFormulaItemAfterInsert(DataSet: TDataSet);
    procedure QFormulaItemCalcFields(DataSet: TDataSet);
    procedure QFormulaItemBeforeEdit(DataSet: TDataSet);
    procedure QFormulaItemBeforeDelete(DataSet: TDataSet);
    procedure QFormulaItemBeforeInsert(DataSet: TDataSet);
    procedure QFormulaItemAfterPost(DataSet: TDataSet);
    procedure QFormulaAfterPost(DataSet: TDataSet);
    procedure QRFormula_CustoCalcFields(DataSet: TDataSet);
    procedure QFormulaCustoAfterInsert(DataSet: TDataSet);
    procedure QFormulaCustoAfterPost(DataSet: TDataSet);
    procedure QFormulaCustoBeforeDelete(DataSet: TDataSet);
    procedure QFormulaCustoBeforeEdit(DataSet: TDataSet);
    procedure QFormulaCustoBeforeInsert(DataSet: TDataSet);
    procedure QRRelacaoFormulaCalcFields(DataSet: TDataSet);
    procedure QFormulaInsumoCalcFields(DataSet: TDataSet);
    procedure QFormulaInsumoAfterInsert(DataSet: TDataSet);
    procedure QFormulaInsumoBeforeDelete(DataSet: TDataSet);
    procedure QFormulaInsumoBeforeEdit(DataSet: TDataSet);
    procedure QFormulaInsumoBeforeInsert(DataSet: TDataSet);
    procedure QFormulaItemAfterDelete(DataSet: TDataSet);
    procedure QFormulaItemBeforePost(DataSet: TDataSet);
    procedure QRProjecaoComprasCalcFields(DataSet: TDataSet);
    procedure QFormulaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    fApagando : Boolean;
  public
    { Public declarations }
    Property pApagando : Boolean Read fApagando Write fApagando Default False;
    Procedure ExcluiFormula;
  end;

var
  DMFormula: TDMFormula;

implementation

uses UOracle_cl, UUsuario_cl, UParamSistema_cl;

{$R *.DFM}

procedure TDMFormula.QFormulaCalcFields(DataSet: TDataSet);
begin
  QFormulaNome_Produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                'COD_PRODUTO = '+FloatToStr(QFormulaCod_Produto.Value));
  QFormulaNome_Lote.Value := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO',
                                'COD_LOTE_TIPO = '+FloatToStr(QFormulaCod_Lote_Tipo.Value));
  QFormulaNome_filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                               'COD_FILIAL =' + FloatToStr(QFormulaCod_Filial.Value));
end;

procedure TDMFormula.QFormulaAfterInsert(DataSet: TDataSet);
begin
//  QFormulaCod_Formula.Value := DMOracle.Sequencia('FORMULA');
end;

procedure TDMFormula.QFormulaBeforeInsert(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
  QFormulaCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  if DMParamSistema.CodEmpresa = 'JPFERRAGEM' then
    QFormulaCOD_LOTE_TIPO.Value := 1;
end;

procedure TDMFormula.QFormulaBeforeEdit(DataSet: TDataSet);
begin
  If not DMOracle.DBCemapa.InTransaction Then
    DMOracle.DBCemapa.StartTransaction;
  QFormulaCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMFormula.QFormulaAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QFormulaItem.Close;
  QFormulaItem.Open;
end;

procedure TDMFormula.QFormulaItemAfterInsert(DataSet: TDataSet);
begin
  QFormulaItemCod_Formula.Value := QFormulaCod_Formula.Value;
  QFormulaItemCod_Formula_Item.Value := DMOracle.Sequencia('FORMULA_ITEM');
end;

procedure TDMFormula.QFormulaItemCalcFields(DataSet: TDataSet);
begin
  QFormulaItemNome_Produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QFormulaItemCod_Produto.Value));
  QFormulaItemNome_Lote.Value := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+FloatToStr(QFormulaItemCod_Lote_Tipo.Value));
end;

procedure TDMFormula.QFormulaItemBeforeEdit(DataSet: TDataSet);
begin
  If Not (QFormula.State = dsEdit) then
    Raise Exception.Create('Fórmula não está no modo de alteração!');
  QFormulaItemCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMFormula.QFormulaItemBeforeDelete(DataSet: TDataSet);
begin
  If not pApagando then
  Begin                                           
    If Not (QFormula.State = dsEdit) then
      Raise Exception.Create('Fórmula não está no modo de alteração!');
  End;
end;

procedure TDMFormula.QFormulaItemBeforeInsert(DataSet: TDataSet);
begin
  If QFormula.State = dsInsert then
  Begin
    QFormula.Post;
    QFormula.Edit;
  End;
  If Not (QFormula.State = dsEdit) then
    Raise Exception.Create('Fórmula não está no modo de alteração!');
  if DMParamSistema.CodEmpresa = 'JPFERRAGEM' then
    QFormulaItemCOD_LOTE_TIPO.Value := 1;
end;

procedure TDMFormula.ExcluiFormula;
begin
  Try
    pApagando := True;
    DMOracle.DBCemapa.StartTransaction;
    While Not QFormulaItem.Eof do
      QFormulaItem.Delete;
    while Not QFormulaCusto.Eof do
      QFormulaCusto.Delete;
      
    QFormula.Delete;
    DMOracle.DBCemapa.Commit;
    pApagando := False;
  Except
    If DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.RollBack;
    pApagando := False;
  End;
end;

procedure TDMFormula.QFormulaItemAfterPost(DataSet: TDataSet);
Var wCodigo : Real;
begin
  wCodigo := QFormulaItemCod_Formula_Item.Value;
  QFormulaItem.Close;
  QFormulaItem.Open;
  QFormulaItem.Locate('COD_FORMULA_ITEM',wCodigo,[]);
  QSomaItemFormula.Close;
  QSomaItemFormula.Open;
end;

procedure TDMFormula.QFormulaAfterPost(DataSet: TDataSet);
Var wCodigo : Real;
begin
  wCodigo := QFormulaCod_Formula.Value;
  QFormula.Close;
  QFormula.SetVariable('PK',wCodigo);
  QFormula.Open;
end;

procedure TDMFormula.QRFormula_CustoCalcFields(DataSet: TDataSet);
Var wCusto : String;
begin
  QRFormula_CustoDESC_PRODUTO_ACABADO.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                    'COD_PRODUTO = '+FloatToStr(QRFormula_CustoCod_Produto_Formula.Value));
  wCusto := '';                                    
  If (QRFormula_CustoCod_Produto_Item.Value <> 191) And
     (QRFormula_CustoCod_Produto_Item.Value <> 119) And
     (QRFormula_CustoCod_Produto_Item.Value <> 189) Then
     wCusto := DMOracle.BuscaNome('SELECT avg(VAL_CUSTO / qt_quantidade) FROM tb_nota_cab,Tb_nota_item,TB_OPERACAO',
         'Tb_nota_cab.cod_nota_cab=tb_nota_item.cod_nota_cab and tb_nota_cab.cod_operacao = tb_operacao.cod_operacao '+
         ' and tb_nota_cab.ind_entrada_saida=' + Chr(39) + 'E' + Chr(39) + ' and tb_nota_cab.ind_situacao=' + Chr(39) + '2' + Chr(39) +
         ' and tb_operacao.ind_compras=' + Chr(39) + 'C' + Chr(39) + ' and tb_nota_cab.cod_filial= ' + QRFormula_CustoCod_Filial.Text +
         ' and tb_nota_item.cod_produto= ' + QRFormula_CustoCod_Produto_Item.Text + ' and tb_nota_cab.dt_recebimento>=' + Chr(39) + DateToStr(Date - 30) + Chr(39));
  If wCusto <> '' Then
     QRFormula_CustoVl_Custo_Medio.Value := StrToFloat(wCusto)
  Else
     QRFormula_CustoVl_Custo_Medio.Value := QRFormula_CustoVl_Custo_Estoque.Value;
End;

procedure TDMFormula.QFormulaCustoAfterInsert(DataSet: TDataSet);
begin
  QFormulaCustoCod_Formula.Value := QFormulaCod_Formula.Value;
  //QFormulaCustoCod_Formula_Custo.Value := DMOracle.Sequencia('FORMULA_CUSTO');
end;

procedure TDMFormula.QFormulaCustoAfterPost(DataSet: TDataSet);
Var wCodigo : Real;
begin
  wCodigo := QFormulaCustoCod_Formula_Custo.Value;
  QFormulaCusto.Close;
  QFormulaCusto.Open;
  QFormulaCusto.Locate('COD_FORMULA_CUSTO',wCodigo,[]);
end;

procedure TDMFormula.QFormulaCustoBeforeDelete(DataSet: TDataSet);
begin
  If not pApagando then
  Begin
    If Not (QFormula.State = dsEdit) then
      Raise Exception.Create('Fórmula não está no modo de alteração!');
  End;

end;

procedure TDMFormula.QFormulaCustoBeforeEdit(DataSet: TDataSet);
begin
  If Not (QFormula.State = dsEdit) then
    Raise Exception.Create('Fórmula não está no modo de alteração!');

end;

procedure TDMFormula.QFormulaCustoBeforeInsert(DataSet: TDataSet);
begin
  If QFormula.State = dsInsert then
  Begin
    QFormula.Post;
    QFormula.Edit;
  End;
  If Not (QFormula.State = dsEdit) then
    Raise Exception.Create('Fórmula não está no modo de alteração!');  
end;

procedure TDMFormula.QRRelacaoFormulaCalcFields(DataSet: TDataSet);
begin
  QRRelacaoFormuladesc_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO ='
                                                           + QRRelacaoFormulaCOD_PRODUTO.Text);
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' Then
  Begin
  QRRelacaoFormulaqt_minimo.Value := StrToInt('0' + DMOracle.BuscaNome('SELECT QT_MINIMO FROM TB_ESTOQUE','COD_PRODUTO ='
                                                        + QRRelacaoFormulaCOMPONENTE.Text + ' AND COD_LOTE_TIPO = 310'));
  QRRelacaoFormulaqt_maximo.Value := StrToInt('0' +DMOracle.BuscaNome('SELECT QT_MAXIMO FROM TB_ESTOQUE','COD_PRODUTO ='
                                                        + QRRelacaoFormulaCOMPONENTE.Text + ' AND COD_LOTE_TIPO = 310'));
  end
  else
  Begin
    QRRelacaoFormulaqt_minimo.Value := StrToInt('0' + DMOracle.BuscaNome('SELECT QT_MINIMO FROM TB_ESTOQUE','COD_PRODUTO ='
                                                        + QRRelacaoFormulaCOMPONENTE.Text));
    QRRelacaoFormulaqt_maximo.Value := StrToInt('0' +DMOracle.BuscaNome('SELECT QT_MAXIMO FROM TB_ESTOQUE','COD_PRODUTO ='
                                                        + QRRelacaoFormulaCOMPONENTE.Text));
  end;
  QRRelacaoFormulawCusto.Value := (QRRelacaoFormulaQT_ITEM.Value * QRRelacaoFormulaVL_CUSTO.Value);

end;

procedure TDMFormula.QFormulaInsumoCalcFields(DataSet: TDataSet);
begin
  if QFormulaInsumoCOD_PRODUTO.Value > 0 then
    QFormulaInsumodesc_produto.Text := DMOracle.FastSelect('DESC_PRODUTO','TB_PRODUTO',
      'COD_PRODUTO = ' + QFormulaInsumoCOD_PRODUTO.Text);
end;

procedure TDMFormula.QFormulaInsumoAfterInsert(DataSet: TDataSet);
begin
  QFormulaInsumoCOD_FORMULA.Value := QFormulaCOD_FORMULA.Value;
  QFormulaInsumoIND_BAIXA_ESTOQUE.Value := 'SIM';
end;

procedure TDMFormula.QFormulaInsumoBeforeDelete(DataSet: TDataSet);
begin
  If not pApagando then
  Begin
    If Not (QFormula.State = dsEdit) then
      Raise Exception.Create('Fórmula não está no modo de alteração!');
  End;
end;

procedure TDMFormula.QFormulaInsumoBeforeEdit(DataSet: TDataSet);
begin
  If Not (QFormula.State = dsEdit) then
    Raise Exception.Create('Fórmula não está no modo de alteração!');
end;

procedure TDMFormula.QFormulaInsumoBeforeInsert(DataSet: TDataSet);
begin
  If QFormula.State = dsInsert then
  Begin
    QFormula.Post;
    QFormula.Edit;
  End;
  If Not (QFormula.State = dsEdit) then
    Raise Exception.Create('Fórmula não está no modo de alteração!');
end;

procedure TDMFormula.QFormulaItemAfterDelete(DataSet: TDataSet);
begin
  QSomaItemFormula.Close;
  QSomaItemFormula.Open;
end;

procedure TDMFormula.QFormulaItemBeforePost(DataSet: TDataSet);
begin
  QFormulaItemCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  if QSomaItemFormula.Eof then
  begin
    QSomaItemFormula.Close;
    QSomaItemFormula.Open;
  end;
  if DMParamSistema.CodEmpresa = 'JPFERRAGEM' then
    QFormulaItemCOD_LOTE_TIPO.Value := 1;
end;

procedure TDMFormula.QRProjecaoComprasCalcFields(DataSet: TDataSet);
begin
  if (QRProjecaoComprasQTD_PROJETADA1.Value > 0) and (QRProjecaoComprasCODFORMULA.Value = QRProjecaoComprasFORMULA1.Value) then
  begin
    QRProjecaoComprasqtd_produzida.Value := QRProjecaoComprasQTD_FORMULA_ITEM.Value * QRProjecaoComprasQTD_PROJETADA1.Value;
    QRProjecaoComprasqtd_compra.Value := QRProjecaoComprasESTOQUE.Value - QRProjecaoComprasqtd_produzida.Value;
  end;
  if (QRProjecaoComprasQTD_PROJETADA2.Value > 0) and (QRProjecaoComprasCODFORMULA.Value = QRProjecaoComprasFORMULA2.Value) then
  begin
    QRProjecaoComprasqtd_produzida.Value := QRProjecaoComprasQTD_FORMULA_ITEM.Value * QRProjecaoComprasQTD_PROJETADA2.Value;
    QRProjecaoComprasqtd_compra.Value := QRProjecaoComprasESTOQUE.Value - QRProjecaoComprasqtd_produzida.Value;
  end;
  if (QRProjecaoComprasQTD_PROJETADA3.Value > 0) and (QRProjecaoComprasCODFORMULA.Value = QRProjecaoComprasFORMULA3.Value) then
  begin
    QRProjecaoComprasqtd_produzida.Value := QRProjecaoComprasQTD_FORMULA_ITEM.Value * QRProjecaoComprasQTD_PROJETADA3.Value;
    QRProjecaoComprasqtd_compra.Value := QRProjecaoComprasESTOQUE.Value - QRProjecaoComprasqtd_produzida.Value;
  end;
  if (QRProjecaoComprasQTD_PROJETADA4.Value > 0) and (QRProjecaoComprasCODFORMULA.Value = QRProjecaoComprasFORMULA4.Value) then
  begin
    QRProjecaoComprasqtd_produzida.Value := QRProjecaoComprasQTD_FORMULA_ITEM.Value * QRProjecaoComprasQTD_PROJETADA4.Value;
    QRProjecaoComprasqtd_compra.Value := QRProjecaoComprasESTOQUE.Value - QRProjecaoComprasqtd_produzida.Value;
  end;
  if (QRProjecaoComprasQTD_PROJETADA5.Value > 0) and (QRProjecaoComprasCODFORMULA.Value = QRProjecaoComprasFORMULA5.Value) then
  begin
    QRProjecaoComprasqtd_produzida.Value := QRProjecaoComprasQTD_FORMULA_ITEM.Value * QRProjecaoComprasQTD_PROJETADA5.Value;
    QRProjecaoComprasqtd_compra.Value := QRProjecaoComprasESTOQUE.Value - QRProjecaoComprasqtd_produzida.Value;
  end;
  if (QRProjecaoComprasQTD_PROJETADA6.Value > 0) and (QRProjecaoComprasCODFORMULA.Value = QRProjecaoComprasFORMULA6.Value) then
  begin
    QRProjecaoComprasqtd_produzida.Value := QRProjecaoComprasQTD_FORMULA_ITEM.Value * QRProjecaoComprasQTD_PROJETADA6.Value;
    QRProjecaoComprasqtd_compra.Value := QRProjecaoComprasESTOQUE.Value - QRProjecaoComprasqtd_produzida.Value;
  end;
  if (QRProjecaoComprasQTD_PROJETADA7.Value > 0) and (QRProjecaoComprasCODFORMULA.Value = QRProjecaoComprasFORMULA7.Value) then
  begin
    QRProjecaoComprasqtd_produzida.Value := QRProjecaoComprasQTD_FORMULA_ITEM.Value * QRProjecaoComprasQTD_PROJETADA7.Value;
    QRProjecaoComprasqtd_compra.Value := QRProjecaoComprasESTOQUE.Value - QRProjecaoComprasqtd_produzida.Value;
  end;
  if (QRProjecaoComprasQTD_PROJETADA8.Value > 0) and (QRProjecaoComprasCODFORMULA.Value = QRProjecaoComprasFORMULA8.Value) then
  begin
    QRProjecaoComprasqtd_produzida.Value := QRProjecaoComprasQTD_FORMULA_ITEM.Value * QRProjecaoComprasQTD_PROJETADA8.Value;
    QRProjecaoComprasqtd_compra.Value := QRProjecaoComprasESTOQUE.Value - QRProjecaoComprasqtd_produzida.Value;
  end;
end;

procedure TDMFormula.QFormulaBeforePost(DataSet: TDataSet);
begin
  if DMParamSistema.CodEmpresa = 'JPFERRAGEM' then
    QFormulaCOD_LOTE_TIPO.Value := 1;
  QFormulaCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

end.
