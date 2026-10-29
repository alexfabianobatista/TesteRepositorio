unit UBibliotecaDB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, OracleData, OraTeste, Variants, DBClient,
  Provider, UBiblioteca;



type
  TBibliotecaDB = class


    published

    public
      procedure NotaEntradaQItemNFCalcFields(var QNotaEntrada: TDataSet);
      procedure NotaEntradaQNotaImpostoServicoCalcFields(var QNotaImpostoServico: TDataSet; var QSomaItemNota: TDataSet);
      procedure NotaEntradaQSomaItemNotaCalcFields(var DataSet: TDataSet);
   
    private

  end;

implementation

uses
  UOracle_cl, UUsuario_cl, UEstoque_cl, UTributacao_cl, UOperacao_cl,
  UPlanilha_cl, UFinalidade_cl, UParamSistema_cl,
  URomaneioAgricola_cl, UContasPagar_cl, UNotaSaida_cl, UProduto_cl,
  UCaixaLanc_Cont, UHistorico_cl, UNfe_cl, UObra_cl, USpedValidacao, Math,
  UDevolucaoTroca_cl, USequencia_cl, UCadastro_cl, UNotaEntrada_cl;

//USADO NO DMNOTAENTRADA
procedure TBibliotecaDB.NotaEntradaQItemNFCalcFields(var QNotaEntrada: TDataSet);
var
  wEmbalagem : String;
begin

  if DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO' Then
  begin
    QNotaEntrada.FieldByName('num_fabricante').Value := (DMOracle.FastSelect('NUM_FABRICANTE', 'TB_PRODUTO','COD_PRODUTO = ' + FloatToStr(QNotaEntrada.FieldByName('COD_PRODUTO').Value)));
    QNotaEntrada.FieldByName('num_ncm').Value := (DMOracle.FastSelect('NUM_GENERO_NCM', 'TB_PRODUTO','COD_PRODUTO = ' + FloatToStr(QNotaEntrada.FieldByName('COD_PRODUTO').Value)));
  end;
  if QNotaEntrada.FieldByName('PERC_BENEFICIADO').Value > 0 then
    QNotaEntrada.FieldByName('Qt_Beneficiado').Value := QNotaEntrada.FieldByName('Qt_Quantidade').Value * QNotaEntrada.FieldByName('PERC_BENEFICIADO').Value / 100
  else
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARICOTA' Then
     Begin
       wEmbalagem := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QNotaEntrada.FieldByName('COD_PRODUTO').Value), True);
       if Trim(wEmbalagem) = '' then
         wEmbalagem := '1'
       else
        QNotaEntrada.FieldByName('Qt_Beneficiado').Value := QNotaEntrada.FieldByName('Qt_Quantidade').Value * StrToFloat(wEmbalagem);
     End
    Else
       QNotaEntrada.FieldByName('Qt_Beneficiado').Value := QNotaEntrada.FieldByName('Qt_Quantidade').Value;
  if (QNotaEntrada.FieldByName('COD_PRODUTO').Value > 0) and (Trim(QNotaEntrada.FieldByName('ind_subst_trib').Text) = '') then
  begin
    if DMOracle.FastSelect('IND_SUBST_TRIB', 'TB_PRODUTO','COD_PRODUTO = ' +
      QNotaEntrada.FieldByName('COD_PRODUTO').Text) = 'SIM' then
      QNotaEntrada.FieldByName('ind_subst_trib').Value :=
        '* Produto com substituição tributária'
      else
        QNotaEntrada.FieldByName('ind_subst_trib').Clear;
  end;

end;

procedure TBibliotecaDB.NotaEntradaQNotaImpostoServicoCalcFields(var QNotaImpostoServico: TDataset; var QSomaItemNota: TDataSet);
var
  wVal: string;
begin

   if QNotaImpostoServico.FieldByName('COD_IMPOSTO').Text <> '' then
      QNotaImpostoServico.FieldByName('desc_imposto').Value := DMOracle.BuscaNome('SELECT DESC_IMPOSTO FROM TB_IMPOSTO', 'COD_IMPOSTO = ' + QNotaImpostoServico.FieldByName('COD_IMPOSTO').Text, True);

    if (QNotaImpostoServico.State in [dsinsert, dsEdit]) and (QNotaImpostoServico.FieldByName('COD_IMPOSTO').Text <> '') and
      (QNotaImpostoServico.FieldByName('VAL_IMPOSTO').Text = '') then
    begin
        wVal := DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_IMPOSTO', 'COD_IMPOSTO = ' + QNotaImpostoServico.FieldByName('COD_IMPOSTO').Text, True);
        if wval <> '' then
          QNotaImpostoServico.FieldByName('VAL_IMPOSTO').Value := StrToFloat(wVal) * (QSomaItemNota.FieldByName('SVAL_TOTAL').Value - QSomaItemNota.FieldByName('SVAL_DESCONTO').Value) / 100;
    end;
    
end;


procedure TBibliotecaDB.NotaEntradaQSomaItemNotaCalcFields(var DataSet: TDataSet);
begin

  with DMCadastro, DMTributacao, DMNotaEntrada do
  begin
    QCadastro.Close;
    QCadastro.SetVariable('PK', QNotaEntradaCOD_CADASTRO.Value);
    QCadastro.Open;
    QTributacao.Close;
    QTributacao.SetVariable('PK', QItemNFCOD_TRIBUTACAO.Value);
    QTributacao.Open;
    // Se possui CST de substituição tributária anterior, não deve alterar o valor da nota
    if ( (DMParamSistema.CodEmpresa <> 'FERRAGMED') and (DMParamSistema.CodEmpresa <> 'KREUZ')    and (DMParamSistema.CodEmpresa <> 'DINIZ')        and
         (DMParamSistema.CodEmpresa <> 'CEIFAGRIL') and (DMParamSistema.CodEmpresa <> 'GGIRARDI') and (DMParamSistema.CodEmpresa <> 'CASATINTAS') ) and
       ((Pos('60', QTributacaoDESC_SITUACAO_TRIB.Value) > 0)
          or (QTributacaoDESC_CSOSN.Value = '500')
      and
      (
        (QCadastroIND_FISICA_JURIDICA.Value = 'J') and (not QCadastroNUM_INSCRICAO.IsNull) and (QCadastroNUM_INSCRICAO.Value <> 'ISENTO')
        and (QCadastroIND_CONTRIBUINTE.Value = 'SIM')
      ))
      then  // Sem ICMS ST
      QSomaItemNotasval_total_nota.Value := QSomaItemNota.FieldByName('SVAL_TOTAL').Value
      + QSomaItemNotaSVAL_IPI.Value
      + QNotaEntradaVAL_DESPESAS.Value
      - QNotaEntradaVAL_DESCONTO.Value
      + Bib.ift( QNotaEntradaNUM_CONHECIMENTO_FRETE.IsNull,QSomaItemNotaSVAL_FRETE.Value,0) //REINCLUIDO POR PROBLEMAS NA GRASEL - CLEBER 15/03/2021 -
                                                                                           //    Alterado por Adriel
                                                                                           //para somar o valor do frete
                                                                                           //na NF-e (09/07/2013)
                                                                                           //Soma somente se o nº do
                                                                                           //conhecimento for nulo
    else //INCLUIDO NOVAMENTE POR PROBLEMAS NA GRASEL Com ICMS ST //RETIRADO - IF ERRADO (NÃO ESTAVA CALCULANDO ST NO CUSTO DO PRODUTO QUANDO INFORMADO CST (CSOSN FUNCIONAVA POQUE O IF ESTAVA ERRADO NÃO FECHADO APOS A VERIFICAÇÃO DO CSON 500). Junior 10/02/2021. FERRAGEM MEDIANEIRA.
      QSomaItemNotasval_total_nota.Value := QSomaItemNotaSVAL_TOTAL.Value
        + QSomaItemNotaSVAL_IPI.Value
        + QNotaEntradaVAL_DESPESAS.Value
        - QNotaEntradaVAL_DESCONTO.Value
        + QSomaItemNotaSVAL_ICMS_SUBST.Value
        + QNotaEntradaVAL_SUBST_TRIBUT.Value
        + Bib.ift( QNotaEntradaNUM_CONHECIMENTO_FRETE.IsNull,QSomaItemNotaSVAL_FRETE.Value,0); //Alterado por Adriel
                                                                                       //para somar o valor do frete
                                                                                       //na NF-e (09/07/2013)
                                                                                       //Soma somente se o nº do
                                                                                       //conhecimento for nulo



    //para nf-e, nao deve descontar funrural no valor total da nota
    //o valor total da nota na tela pode aparecer descontado o valor funrural,
    //mas no xml da nf-e o valor total vai ficar sem o desconto
    QSomaItemNotasval_total_nfe.Value := QSomaItemNotasval_total_nota.Value;

    if QSomaItemNotaIND_FUNRURAL.Value = 'S' then // porque tem opcao de calcular e nao descontar do total
       QSomaItemNotasval_total_nota.Value := QSomaItemNotasval_total_nota.Value - QNotaEntradaVAL_FUNRURAL.Value;
    QSomaItemNotasval_total_nota.Value := QSomaItemNotasval_total_nota.Value - QNotaEntradaVAL_SENAR.Value;
  end;
end;

end.
