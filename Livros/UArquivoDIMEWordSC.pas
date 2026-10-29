unit UArquivoDIMEWordSC;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Forms, Dialogs, Buttons, Controls,
     maskUtils, ULivroFiscal_Cl, UOracle_cl, URegEntrada_cl, ComOBJ;

type
  TArquivoDIMEWordSC = Class
  private
    procedure limpaVariavelRestante();
  public
    procedure geraDIMEWord(wCPFContabilista, wContabilista, wFilial, wDataInicial, wDataFinal,
                       wPeriodoReferencia, wTipoDeclaracao, wRegimeApuracao, wPorteEmpresa,
                       wConsolidada, wCentralizada, wTransferencia, wCredito, wIncentivo, wMovimento,
                       wSubsTributario, wEscrita, wQtdeTrabalhadores, wRadioCreditos, wRadioIncentivos : String);
    function tiraMascara(text:string): String;

  end;

  var
    ArquivoDIMEWordSC: TArquivoDIMEWordSC;
    Doc: Variant;
implementation
//--------------------------------------------------------------------------
//---Procedure Responsável pela Impressão em arquivo .doc do
//---Relatório DIME - Declaração de Informação do ICMS e Movimento Econômico
//---Portaria SEF n°256/04 - Atualização 25/09/2007
//---Camila 16/11/2007 - 14/12/2007
//--------------------------------------------------------------------------

procedure TArquivoDIMEWordSC.geraDIMEWord(wCPFContabilista, wContabilista, wFilial, wDataInicial, wDataFinal,
                                           wPeriodoReferencia, wTipoDeclaracao, wRegimeApuracao, wPorteEmpresa,
                                           wConsolidada, wCentralizada, wTransferencia, wCredito, wIncentivo, wMovimento,
                                           wSubsTributario, wEscrita, wQtdeTrabalhadores, wRadioCreditos, wRadioIncentivos : String);
var
  Path, campo, wNomeArquivo : String;
  wInscricao, wDescFilial : String;
  wTotal1, wTotal2, wTotal3, wTotal4, wTotal5, wTotalDebitos, wTotalCreditos, wAux, wTotMunicipio : Real;
  WinWord, Docs : Variant;
  wAuxLinhas, wAuxTabela : integer;
begin
  With DMLivroFiscal do
  Begin
//----------------------------------------------
//Configuração do Arquivo WORD
//----------------------------------------------
    Path:=ExtractFilePath(ParamStr(0))+'Contratos\';
    // Cria objeto principal de controle
    WinWord := CreateOleObject('Word.Application');
    // Esconde o Word
    WinWord.Visible := false;
    // Pega uma interface para o objeto que manipula documentos
    Docs := WinWord.Documents;
    Doc := Docs.Open(Path + 'DIME.Doc');
    //----------------------------------------------
    //INICIO GERAÇÃO DOS QUADROS
//-------------------------------------------------------------------------------------------------
//Tipo 20 - Dados Contabilista---------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
    campo := wCPFContabilista;
    Doc.Content.Find.Execute(FindText := '%cpfContabilista%', ReplaceWith := campo, Replace := 2);
    campo := wContabilista;
    Doc.Content.Find.Execute(FindText := '%contabilista%', ReplaceWith := campo, Replace := 2);
//-------------------------------------------------------------------------------------------------
//Tipo 21 - Quadro 00 - Inicio da Declaração de ICMS-----------------------------------------------
//-------------------------------------------------------------------------------------------------
    wInscricao  := DMOracle.BuscaNome('SELECT DESC_INSCRICAO FROM TB_FILIAL','COD_FILIAL = '+wFilial);
    wDescFilial := DMOracle.BuscaNome('SELECT DESC_FILIAL    FROM TB_FILIAL','COD_FILIAL = '+wFilial);
    //-----------------------------
    //Gerando Quadro 00
    campo := wInscricao;
    Doc.Content.Find.Execute(FindText := '%00-010-inscricaoEstadual%', ReplaceWith := campo, Replace := 2);
    campo := wFilial;
    Doc.Content.Find.Execute(FindText := '%00-020-razaoSocial%', ReplaceWith := campo, Replace := 2);
    campo := wPeriodoReferencia;
    Doc.Content.Find.Execute(FindText := '%00-030-periodoReferencia%', ReplaceWith := campo, Replace := 2);
    campo := wTipoDeclaracao;
    Doc.Content.Find.Execute(FindText := '%00-040-tipoDeclaracao%', ReplaceWith := campo, Replace := 2);
    campo := wRegimeApuracao;
    Doc.Content.Find.Execute(FindText := '%00-050-regimeApuracao%', ReplaceWith := campo, Replace := 2);
    campo := wPorteEmpresa;
    Doc.Content.Find.Execute(FindText := '%00-060-porteEmpresa%', ReplaceWith := campo, Replace := 2);
    campo := wConsolidada;
    Doc.Content.Find.Execute(FindText := '%00-070-apuracaoConsolidada%', ReplaceWith := campo, Replace := 2);
    campo := wCentralizada;
    Doc.Content.Find.Execute(FindText := '%00-080-apuracaoCentralizada%', ReplaceWith := campo, Replace := 2);
    campo := wTransferencia;
    Doc.Content.Find.Execute(FindText := '%00-090-transfCreditoPeriodo%', ReplaceWith := campo, Replace := 2);
    campo := wCredito;
    Doc.Content.Find.Execute(FindText := '%00-100-creditoPresumido%', ReplaceWith := campo, Replace := 2);
    campo := wIncentivo;
    Doc.Content.Find.Execute(FindText := '%00-110-creditoIncentivosFiscal%', ReplaceWith := campo, Replace := 2);
    campo := wMovimento;
    Doc.Content.Find.Execute(FindText := '%00-120-movimento%', ReplaceWith := campo, Replace := 2);
    campo := wSubsTributario;
    Doc.Content.Find.Execute(FindText := '%00-130-substitutoTributario%', ReplaceWith := campo, Replace := 2);
    campo := wEscrita;
    Doc.Content.Find.Execute(FindText := '%00-140-escritaContabil%', ReplaceWith := campo, Replace := 2);
    campo := wQtdeTrabalhadores;
    Doc.Content.Find.Execute(FindText := '%00-150-qtdeTrabalhadoresAtividade%', ReplaceWith := campo, Replace := 2);
    //Fim Geração Quadro 00
    //---------------------
//-------------------------------------------------------------------------------------------------
//Tipo 22 - Quadro 01 - Valores Fiscais Entradas---------------------------------------------------
//Tipo 23 - Quadro 02 - Valores Fiscais Saídas-----------------------------------------------------
//Tipo 24 - Quadro 03 - Resumo dos Valores Fiscais-------------------------------------------------
//-------------------------------------------------------------------------------------------------
    with DMRegEntrada do
    begin
      //---------------------------------------
      //Dados para Quadro 01
      QApuracaoE.Close;
      QApuracaoE.SetVariable('FILIAL',wFilial);
      QApuracaoE.SetVariable('DATA_I',wDataInicial);
      QApuracaoE.SetVariable('DATA_F',wDataFinal);
      QApuracaoE.Open;
      //----------------------------------------
      //Dados para Quadro 02
      QApuracaoS.Close;
      QApuracaoS.SetVariable('FILIAL',wFilial);
      QApuracaoS.SetVariable('DATA_I',wDataInicial);
      QApuracaoS.SetVariable('DATA_F',wDataFinal);
      QApuracaoS.Open;
      //----------------------------------------
      //Dados para Quadro 03
      wTotal1 := 0;
      wTotal2 := 0;
      wTotal3 := 0;
      wTotal4 := 0;
      wTotal5 := 0;
      //----------------------------------------
      //------------------------
      //Gerando Quadro 01
      //Controle da Tabela e de Linhas para geração no Arquivo do Word.
      //wAuxTabela: Comeca em 3, pois é a Terceira (3º) Tabela do Arquivo DIME do WORD
      //wAuxLinhas: Comeca em 5, pois já existem 4 linhas na tabela. Seu incremento será dinâmico.
      wAuxTabela := 3;
      wAuxLinhas := 5;
      While Not (QApuracaoE.Eof) do
      Begin
        campo := QApuracaoENat_Operacao.Text;
        Doc.Content.Find.Execute(FindText := '%01-cfop_E%', ReplaceWith := campo, Replace := 2);
        campo := QApuracaoEVal_Contabil.Text;
        Doc.Content.Find.Execute(FindText := '%01-valorContabil_E%', ReplaceWith := campo, Replace := 2);
        campo := QApuracaoEVal_Icm_Base.Text;
        Doc.Content.Find.Execute(FindText := '%01-opCCredBaseCalculo_E%', ReplaceWith := campo, Replace := 2);
        campo := QApuracaoEVal_Icm.Text;
        Doc.Content.Find.Execute(FindText := '%01-opCCredImpostoCreditado_E%', ReplaceWith := campo, Replace := 2);
        campo := QApuracaoEVal_Icm_Base_Isento.Text;
        Doc.Content.Find.Execute(FindText := '%01-opSCredNaoTributada_E%', ReplaceWith := campo, Replace := 2);
        campo := QApuracaoEVal_Icm_Base_Outras.Text;
        Doc.Content.Find.Execute(FindText := '%01-opSCredOutras_E%', ReplaceWith := campo, Replace := 2);

        //---------------------------------------------------------------------------
        //Somatório dos valores necessário para preenchimento do Quadro 03
        wTotal1 := wTotal1 + QApuracaoEVal_Contabil.Value;
        wTotal2 := wTotal2 + QApuracaoEVal_Icm_Base.Value;
        wTotal3 := wTotal3 + QApuracaoEVal_Icm.Value;
        wTotal4 := wTotal4 + QApuracaoEVal_Icm_Base_Isento.Value;
        wTotal5 := wTotal5 + QApuracaoEVal_Icm_Base_Outras.Value;
        //---------------------------------------------------------------------------
        //-----------------------------------
        //Gerando Linhas Dinamicamente
        //Tabela wAuxTabela do Arquivo DIME do WORD
        //-----------------------------------
        Doc.Tables.Item(wAuxTabela).Rows.Add;
        Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 1).Range.InsertAfter('%01-cfop_E%');
        Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 2).Range.InsertAfter('%01-valorContabil_E%');
        Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 3).Range.InsertAfter('%01-opCCredBaseCalculo_E%');
        Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 4).Range.InsertAfter('%01-opCCredImpostoCreditado_E%');
        Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 5).Range.InsertAfter('%01-opSCredNaoTributada_E%');
        Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 6).Range.InsertAfter('%01-opSCredOutras_E%');
        //-----------------------------------
        //Incrementa Linha
        Inc(wAuxLinhas,1);
        //Avanca ao Próximo Registro da Query
        QApuracaoE.Next;
        //-----------------------------------
      End;
      //Fim Geração Quadro 01
      //---------------------

      //---------------------
      //Gerando PARCIALMENTE(1/2) Quadro 03 - Somatório dos Valores do Quadro 01(ENTRADAS)
      If wTotal1 > 0 Then
      Begin
        campo := FloatToStr(wTotal1);
        Doc.Content.Find.Execute(FindText := '%03-010-SUMvalorContabil_E%', ReplaceWith := campo, Replace := 2);
      End;
      If wTotal2 > 0 Then
      Begin
        campo := FloatToStr(wTotal2);
        Doc.Content.Find.Execute(FindText := '%03-020-SUMopCCredBaseCalculo_E%', ReplaceWith := campo, Replace := 2);
      End;
      If wTotal3 > 0 Then
      Begin
        campo := FloatToStr(wTotal3);
        Doc.Content.Find.Execute(FindText := '%03-030-SUMopCCredImpostoCreditado_E%', ReplaceWith := campo, Replace := 2);
      End;
      If wTotal4 > 0 Then
      Begin
        campo := FloatToStr(wTotal4);
        Doc.Content.Find.Execute(FindText := '%03-040-SUMopSCredNaoTributada_E%', ReplaceWith := campo, Replace := 2);
      End;
      If wTotal5 > 0 Then
      Begin
        campo := FloatToStr(wTotal5);
        Doc.Content.Find.Execute(FindText := '%03-050-SUMopSCredOutras_E%', ReplaceWith := campo, Replace := 2);
      End;
      //Fim Geracão PARCIAL(1/2) Quadro 03
      //----------------------

      //----------------------------------------
      //Dados para Quadro 03
      wTotal1 := 0;
      wTotal2 := 0;
      wTotal3 := 0;
      wTotal4 := 0;
      wTotal5 := 0;
      //----------------------------------------
      //------------------------
      //Gerando Quadro 02
      //Controle de Linhas para geração no Arquivo do Word.
      //wAuxTabela: Comeca em 4, pois é a 4º Tabela do Arquivo DIME do WORD
      //Comeca em 5, pois já existem 4 linhas na tabela. Seu incremento será dinâmico.
      wAuxTabela := 4;
      wAuxLinhas := 5;
      While Not (QApuracaoS.Eof) do
      Begin
        campo := QApuracaoSNat_Operacao.Text;
        Doc.Content.Find.Execute(FindText := '%02-cfop_S%', ReplaceWith := campo, Replace := 2);
        campo := QApuracaoSVal_Contabil.Text;
        Doc.Content.Find.Execute(FindText := '%02-valorContabil_S%', ReplaceWith := campo, Replace := 2);
        campo := QApuracaoSVal_Icm_Base.Text;
        Doc.Content.Find.Execute(FindText := '%02-opCCredBaseCalculo_S%', ReplaceWith := campo, Replace := 2);
        campo := QApuracaoSVal_Icm.Text;
        Doc.Content.Find.Execute(FindText := '%02-opCCredImpostoDebitado_S%', ReplaceWith := campo, Replace := 2);
        campo := QApuracaoSVal_Icm_Base_Isento.Text;
        Doc.Content.Find.Execute(FindText := '%02-opSCredNaoTributada_S%', ReplaceWith := campo, Replace := 2);
        campo := QApuracaoSVal_Icm_Base_Outras.Text;
        Doc.Content.Find.Execute(FindText := '%02-opSCredOutras_S%', ReplaceWith := campo, Replace := 2);

        //---------------------------------------------------------------------------
        //Somatório dos valores necessário para preenchimento do Quadro 03
        wTotal1 := wTotal1 + QApuracaoSVal_Contabil.Value;
        wTotal2 := wTotal2 + QApuracaoSVal_Icm_Base.Value;
        wTotal3 := wTotal3 + QApuracaoSVal_Icm.Value;
        wTotal4 := wTotal4 + QApuracaoSVal_Icm_Base_Isento.Value;
        wTotal5 := wTotal5 + QApuracaoSVal_Icm_Base_Outras.Value;
        //---------------------------------------------------------------------------
        //-----------------------------------
        //Gerando Linhas Dinamicamente
        //Tabela wAuxTabela do Arquivo DIME do WORD
        //-----------------------------------
        Doc.Tables.Item(wAuxTabela).Rows.Add;
        Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 1).Range.InsertAfter('%02-cfop_S%');
        Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 2).Range.InsertAfter('%02-valorContabil_S%');
        Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 3).Range.InsertAfter('%02-opCCredBaseCalculo_S%');
        Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 4).Range.InsertAfter('%02-opCCredImpostoDebitado_S%');
        Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 5).Range.InsertAfter('%02-opSCredNaoTributada_S%');
        Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 6).Range.InsertAfter('%02-opSCredOutras_S%');
        //-----------------------------------
        //Incrementa Linha
        Inc(wAuxLinhas,1);
        //Avanca ao Próximo Registro da Query
        QApuracaoS.Next;
        //-----------------------------------

      End;
      //Fim Geração Quadro 02
      //---------------------

      //---------------------
      //Gerando PARCIALMENTE(2/2) Quadro 03 - Somatório dos Valores do Quadro 02(SAIDAS)
      If wTotal1 > 0 Then
      Begin
        campo := FloatToStr(wTotal1);
        Doc.Content.Find.Execute(FindText := '%03-060-SUMvalorContabil_S%', ReplaceWith := campo, Replace := 2);
      End;
      If wTotal2 > 0 Then
      Begin
        campo := FloatToStr(wTotal2);
        Doc.Content.Find.Execute(FindText := '%03-070-SUMopCCredBaseCalculo_S%', ReplaceWith := campo, Replace := 2);
      End;
      If wTotal3 > 0 Then
      Begin
        campo := FloatToStr(wTotal3);
        Doc.Content.Find.Execute(FindText := '%03-080-SUMopCCredImpostoDebitado_S%', ReplaceWith := campo, Replace := 2);
      End;
      If wTotal4 > 0 Then
      Begin
        campo := FloatToStr(wTotal4);
        Doc.Content.Find.Execute(FindText := '%03-090-SUMopSCredNaoTributada_S%', ReplaceWith := campo, Replace := 2);
      End;
      If wTotal5 > 0 Then
      Begin
        campo := FloatToStr(wTotal4);
        Doc.Content.Find.Execute(FindText := '%03-100-SUMopSCredOutras_S%', ReplaceWith := campo, Replace := 2);
      End;
      //Fim Geracão PARCIAL(2/2) Quadro 03
      //---------------------
    end; //with
//-------------------------------------------------------------------------------------------------
//Tipo 25 - Quadro 04 - Resumo de Apuração dos Débitos---------------------------------------------
//Tipo 26 - Quadro 05 - Resumo de Apuração dos Créditos--------------------------------------------
//-------------------------------------------------------------------------------------------------
    wTotalCreditos := 0;
    wTotalDebitos  := 0;

    //---------------------
    //Dados Quadro 05
    DMLivroFiscal.QResumoApuracao.Close;  //*** este acesso é para pegar o saldo credor mes anterior
    DMLivroFiscal.QResumoApuracao.SetVariable('FILIAL', wFilial);
    DMLivroFiscal.QResumoApuracao.SetVariable('ANO',Copy(wDataInicial,7,4));
    DMLivroFiscal.QResumoApuracao.SetVariable('MES',Copy(wDataInicial,4,2));

    if Copy(wDataInicial,4,2) = '01' Then
    begin
      DMLivroFiscal.QResumoApuracao.SetVariable('ANO_ANT',StrToInt(Copy(wDataInicial,7,4))-1);
      DMLivroFiscal.QResumoApuracao.SetVariable('MES_ANT',12);
    end
    Else
    Begin
      DMLivroFiscal.QResumoApuracao.SetVariable('ANO_ANT',StrToInt(Copy(wDataInicial,7,4)));
      DMLivroFiscal.QResumoApuracao.SetVariable('MES_ANT',StrToInt(Copy(wDataInicial,4,2))-1);
    End;
    DMLivroFiscal.QResumoApuracao.Open;

    //-----------------------------
    //Gerando Quadro 04 e Quadro 05
    If Not (DMLivroFiscal.QResumoApuracao.Eof) Then
      If DMLivroFiscal.QResumoApuracao.Locate('NUM_GIA',61,[]) Then
      Begin
        campo := DMLivroFiscal.QResumoApuracaoValor.Text;
        Doc.Content.Find.Execute(FindText := '%05-010-RESULTsaldoCredorMesAnterior%', ReplaceWith := campo, Replace := 2);

        wTotalCreditos := wTotalCreditos + DMLivroFiscal.QResumoApuracaoValor.Value;
      End;

    DMLivroFiscal.QLivroFiscal.Close;
    DMLivroFiscal.QLivroFiscal.SetVariable('Filial',wFilial);
    DMLivroFiscal.QLivroFiscal.SetVariable('Ano',Copy(wDataInicial,7,4));
    DMLivroFiscal.QLivroFiscal.SetVariable('Mes',Copy(wDataInicial,4,2));
    DMLivroFiscal.QLivroFiscal.Open;

    If Not(DMLivroFiscal.QLivroFiscal.Eof) Then
    Begin
       campo := DMLivroFiscal.QLivroFiscalVAL_DB_ICM.Text;
       Doc.Content.Find.Execute(FindText := '%04-010-RESULTdebitoSaidas%', ReplaceWith := campo, Replace := 2); // ** debito saida
       campo := DMLivroFiscal.QLivroFiscalVAL_CR_ICM.Text;
       Doc.Content.Find.Execute(FindText := '%05-020-RESULTcreditoEntradas%', ReplaceWith := campo, Replace := 2); // ** credito entrada

       wTotalCreditos := wTotalCreditos + DMLivroFiscal.QLivroFiscalVAL_CR_ICM.Value;   // ** esta somando acima
       wTotalDebitos  := DMLivroFiscal.QLivroFiscalVAL_DB_ICM.Value;

       DMLivroFiscal.QLcto.Close;  // ** parametros passados por MasterDetail
       DMLivroFiscal.QLcto.Open;

       //------------------------------------
       //Não haverá incremento de linhas, apenas concatenação de texto em linhas predeterminadas.
       //wAuxTabela: Será alternado entre a 6º e a 7º Tabela do Arquivo no mesmo laço de repetição.
       While Not (DMLivroFiscal.QLcto.Eof) Do
       Begin
         If DMLivroFiscal.QLctoCod_Gia.Value = 54 Then   // ** Diferencial por Aliquota
         Begin

           //--------Tabela 6º--------
           wAuxTabela := 6;
           //-------------------------

           campo := DMLivroFiscal.QLctoVAL_IMPOSTO.Text;
           Doc.Content.Find.Execute(FindText := '%04-020-debitoDifAliquotaAtivoPermanente%', ReplaceWith := campo, Replace := 2);
           //----4º Linha
           Doc.Tables.Item(wAuxTabela).Cell(4, 3).Range.InsertAfter(#13 + '%04-020-debitoDifAliquotaAtivoPermanente%');
           //------------
           wTotalDebitos := wTotalDebitos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
         End;
         If DMLivroFiscal.QLctoCod_Gia.Value = 53 Then   // ** Estorno de Credito
         Begin
           campo := DMLivroFiscal.QLctoVAL_IMPOSTO.Text;
           Doc.Content.Find.Execute(FindText := '%04-050-estornoCredito%', ReplaceWith := campo, Replace := 2);
           //---8° Linha
           Doc.Tables.Item(wAuxTabela).Cell(8, 3).Range.InsertAfter(#13 + '%04-050-estornoCredito%');
           //-----------
           wTotalDebitos := wTotalDebitos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
         End;
         If DMLivroFiscal.QLctoCod_Gia.Value = 56 Then  // ** Outros Estornos
         Begin
           campo := DMLivroFiscal.QLctoVAL_IMPOSTO.Text;
           Doc.Content.Find.Execute(FindText := '%04-060-estornoOutros%', ReplaceWith := campo, Replace := 2);
           //---9º Linha
           Doc.Tables.Item(wAuxTabela).Cell(9, 3).Range.InsertAfter(#13 + '%04-060-estornoOutros%');
           //-----------
           wTotalDebitos := wTotalDebitos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
         End;
         If DMLivroFiscal.QLctoCod_Gia.Value = 52 Then  // ** Outros Debitos
         Begin
           campo := DMLivroFiscal.QLctoVAL_IMPOSTO.Text;
           Doc.Content.Find.Execute(FindText := '%04-070-debitoOutros%', ReplaceWith := campo, Replace := 2);
           //---11º Linha
           Doc.Tables.Item(wAuxTabela).Cell(11, 3).Range.InsertAfter(#13 + '%04-070-debitoOutros%');
           //------------
           wTotalDebitos := wTotalDebitos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
         End;

         //--------Tabela 7º--------
         wAuxTabela := 7;
         //-------------------------

         If DMLivroFiscal.QLctoCod_Gia.Value = 66 Then  // ** Credito Ativo Permanente
         Begin
           campo := DMLivroFiscal.QLctoVAL_IMPOSTO.Text;
           Doc.Content.Find.Execute(FindText := '%05-030-creditoAtivoPermanente%', ReplaceWith := campo, Replace := 2);
           //---6º Linha
           Doc.Tables.Item(wAuxTabela).Cell(6, 3).Range.InsertAfter(#13 + '%05-030-creditoAtivoPermanente%');
           //-----------
           wTotalCreditos := wTotalCreditos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
         End;
         If DMLivroFiscal.QLctoCod_Gia.Value = 67 Then  // ** Ativo Permanente
         Begin
           campo := DMLivroFiscal.QLctoVAL_IMPOSTO.Text;
           Doc.Content.Find.Execute(FindText := '%05-040-creditoDifAliquotaMatUsoConsumo%', ReplaceWith := campo, Replace := 2);
           //---7º Linha
           Doc.Tables.Item(wAuxTabela).Cell(7, 3).Range.InsertAfter(#13 + '%05-040-creditoDifAliquotaMatUsoConsumo%');
           //-----------
           wTotalCreditos := wTotalCreditos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
         End;
         If DMLivroFiscal.QLctoCod_Gia.Value = 59 Then  // ** Estorno Debitos p/Transferencia
         Begin
           campo := DMLivroFiscal.QLctoVAL_IMPOSTO.Text;
           Doc.Content.Find.Execute(FindText := '%05-060-estornoDebitoTransCredAcum%', ReplaceWith := campo, Replace := 2);
           //---10º Linha
           Doc.Tables.Item(wAuxTabela).Cell(10, 3).Range.InsertAfter(#13 + '%05-060-estornoDebitoTransCredAcum%');
           //-----------
           wTotalCreditos := wTotalCreditos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
         End;
         If DMLivroFiscal.QLctoCod_Gia.Value = 64 Then  // ** Outros Estornos de Debitos
         Begin
           campo := DMLivroFiscal.QLctoVAL_IMPOSTO.Text;
           Doc.Content.Find.Execute(FindText := '%05-070-estornoOutrosDebitos%', ReplaceWith := campo, Replace := 2);
           //---11º Linha
           Doc.Tables.Item(wAuxTabela).Cell(11, 3).Range.InsertAfter(#13 + '%05-070-estornoOutrosDebitos%');
           //-----------
           wTotalCreditos := wTotalCreditos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
         End;
         If DMLivroFiscal.QLctoCod_Gia.Value = 63 Then  // ** Outros Creditos
         Begin
           campo := DMLivroFiscal.QLctoVAL_IMPOSTO.Text;
           Doc.Content.Find.Execute(FindText := '%05-160-creditoOutros%', ReplaceWith := campo, Replace := 2);
           //---25º Linha
           Doc.Tables.Item(wAuxTabela).Cell(25, 3).Range.InsertAfter(#13 + '%05-160-creditoOutros%');
           //-----------
           wTotalCreditos := wTotalCreditos + DMLivroFiscal.QLctoVAL_IMPOSTO.Value;
         End;

         DMLivroFiscal.QLcto.Next;
       End;

       If wTotalDebitos > 0 Then   // ** total do quadro anterior
       Begin
         campo := FloatToStr(wTotalDebitos);
         Doc.Content.Find.Execute(FindText := '%04-990-debitoSubtotal%', ReplaceWith := campo, Replace := 2);
       End;
       If wTotalCreditos > 0 Then // ** total do quadro anterior
       Begin
         campo := FloatToStr(wTotalCreditos);
         Doc.Content.Find.Execute(FindText := '%05-990-creditoSubtotal%', ReplaceWith := campo, Replace := 2);
       End;
    End;
    //Fim Geração Quadro 04 e Quadro 05
    //---------------------------------
//-------------------------------------------------------------------------------------------------
//Tipo 30 - Quadro 09 - Cálculo do Imposto a Pagar ou Saldo Credor---------------------------------
//Tipo 33 - Quadro 12 - Discriminação dos Pagamentos do Imposto------------------------------------
//-------------------------------------------------------------------------------------------------
    If wTotalDebitos > wTotalCreditos Then
    Begin
      //--------------------------------
      //Gerando Quadro 12
      campo := DMLivroFiscal.QLivroFiscalInd_Origem.Text;
      Doc.Content.Find.Execute(FindText := '%12origem%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalCod_Receita.Text;
      Doc.Content.Find.Execute(FindText := '%12codigoReceita%', ReplaceWith := campo, Replace := 2);

//*****
//Falta DADOS para Coluna NOVA no Quadro 12 - Classe de Vencimento
//*****
//      campo := ;
//      Doc.Content.Find.Execute(FindText := '%12classeVencimento%', ReplaceWith := campo, Replace := 2);
//*****

      //campo := DateToStr(FormatDateTime('DDMMYYYY',DMLivroFiscal.QLivroFiscalDt_Vencimento_Recolhimento.Value));
      campo := FormatDateTime('DDMMYYYY',DMLivroFiscal.QLivroFiscalDt_Vencimento_Recolhimento.Value);
      Doc.Content.Find.Execute(FindText := '%12dataVencimento%', ReplaceWith := campo, Replace := 2);
      campo := FloatToStr(wTotalDebitos - wTotalCreditos);
      Doc.Content.Find.Execute(FindText := '%12valor%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalNum_Classe_Vencto.Text;
      Doc.Content.Find.Execute(FindText := '%12numeroAcordo%', ReplaceWith := campo, Replace := 2);
    End;
    //Fim Geração Quadro 12
    //---------------------------------
    //Gerando Quadro 09
    campo := FloatToStr(wTotalDebitos);
    Doc.Content.Find.Execute(FindText := '%09-010-debitoSubtotal%', ReplaceWith := campo, Replace := 2);
    campo := FloatToStr(wTotalDebitos);
    Doc.Content.Find.Execute(FindText := '%09-040-debitoTotal%', ReplaceWith := campo, Replace := 2);
    campo := FloatToStr(wTotalCreditos);
    Doc.Content.Find.Execute(FindText := '%09-050-creditoSubtotal%', ReplaceWith := campo, Replace := 2);
    campo := FloatToStr(wTotalCreditos);
    Doc.Content.Find.Execute(FindText := '%09-080-creditoTotal%', ReplaceWith := campo, Replace := 2);

    If wTotalDebitos > wTotalCreditos Then
    Begin
      campo := FloatToStr(wTotalDebitos - wTotalCreditos);
      Doc.Content.Find.Execute(FindText := '%09-120-saldoDevedor%', ReplaceWith := campo, Replace := 2);
      campo := FloatToStr(wTotalDebitos - wTotalCreditos);
      Doc.Content.Find.Execute(FindText := '%09-999-impostoRecolher%', ReplaceWith := campo, Replace := 2);
     End
    Else
    Begin
      campo := FloatToStr(wTotalCreditos - wTotalDebitos);
      Doc.Content.Find.Execute(FindText := '%09-140-saldoCredor%', ReplaceWith := campo, Replace := 2);
      campo := FloatToStr(wTotalCreditos - wTotalDebitos);
      Doc.Content.Find.Execute(FindText := '%09-998-saldoCredorMesSeg%', ReplaceWith := campo, Replace := 2);
      campo := FloatToStr(wTotalCreditos - wTotalDebitos);
      Doc.Content.Find.Execute(FindText := '%09-190-saldoCredorRelOutrosCreditos%', ReplaceWith := campo, Replace := 2);
     End;
    //Fim Geração Quadro 09
    //---------------------------------
//-------------------------------------------------------------------------------------------------
//Tipo 44 - Quadro 44 - Créditos Presumidos--------------------------------------------------------
//-------------------------------------------------------------------------------------------------
    //Gerando Quadro 44
    If (wRadioCreditos = '0') Or (wRadioIncentivos = '0') Then
    Begin
      campo := DMLivroFiscal.QLivroFiscalVal_Salario_Mes.Text;
      Doc.Content.Find.Execute(FindText := '%44-010-totalValoresPagosMesEmp%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Salario_Exec_Anterior.Text;
      Doc.Content.Find.Execute(FindText := '%44-020-mediaValoresPagosEmpExAnt%', ReplaceWith := campo, Replace := 2);
      campo := FloatToStr(DMLivroFiscal.QLivroFiscalVal_Salario_Mes.Value - DMLivroFiscal.QLivroFiscalVal_Salario_Exec_Anterior.Value);
      Doc.Content.Find.Execute(FindText := '%44-030-incrementoVerificado%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_FundoSocial.Text;
      Doc.Content.Find.Execute(FindText := '%44-130-contribuicaoFundoSocial%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_FundoCultural.Text;
      Doc.Content.Find.Execute(FindText := '%44-140-aplicacaoFunCultural%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_FundoTurismo.Text;
      Doc.Content.Find.Execute(FindText := '%44-150-aplicacaoFunTurismo%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_FundoEsporte.Text;
      Doc.Content.Find.Execute(FindText := '%44-160-aplicacaoFunEsporte%', ReplaceWith := campo, Replace := 2);
      campo := FloatToStr(DMLivroFiscal.QLivroFiscalVal_Salario_Mes.Value           +
                          DMLivroFiscal.QLivroFiscalVal_Salario_Exec_Anterior.Value +
                          DMLivroFiscal.QLivroFiscalVal_FundoSocial.Value           +
                          DMLivroFiscal.QLivroFiscalVal_FundoCultural.Value         +
                          DMLivroFiscal.QLivroFiscalVal_FundoTurismo.Value          +
                          DMLivroFiscal.QLivroFiscalVal_FundoEsporte.Value);
      Doc.Content.Find.Execute(FindText := '%44-990-totalCredPresumidos%', ReplaceWith := campo, Replace := 2);
    End;
    //Fim Geração Quadro 44
    //------------------------
//-------------------------------------------------------------------------------------------------
//Tipo 47 - Quadro 47 - Compras de extratores, produtores agropecuários e pescadores---------------
//-------------------------------------------------------------------------------------------------
    //Dados para Quadro 47
    DMLivroFiscal.QRNotaArquivoSc_47.Close;  // este acesso é paga REGISTO TIPO 47 - PASSADO PELO JOAO VIA E_MAIL
    DMLivroFiscal.QRNotaArquivoSc_47.SetVariable('FILIAL', wFilial);
    DMLivroFiscal.QRNotaArquivoSc_47.SetVariable('DATA_I', wDataInicial);
    DMLivroFiscal.QRNotaArquivoSc_47.SetVariable('DATA_F', wDataFinal);
    DMLivroFiscal.QRNotaArquivoSc_47.Open;
    //---------------------
    //Gerando Quadro 47
    //Controle da Tabela e de Linhas para geração no Arquivo do Word.
    //wAuxTabela: Comeca em 11, pois é a 11º Tabela do Arquivo DIME do WORD
    //wAuxLinhas: Comeca em 4, pois já existem 3 linhas na tabela. Seu incremento será dinâmico.
    wAuxTabela := 11;
    wAuxLinhas := 4;
    wTotMunicipio := 0;
    While Not(DMLivroFiscal.QRNotaArquivoSc_47.Eof) Do
    Begin
      //Alterado 13/03/2008 - Camila. Campo '%47-codMunicipioSC% passou a receber além do COD_MUNICIPIO_SC, o campo DESC_CIDADE, afim de facilitar a visualização.
      campo := DMLivroFiscal.QRNotaArquivoSc_47COD_MUNICIPIO_SC.Text + ' - ' + DMLivroFiscal.QRNotaArquivoSc_47DESC_CIDADE.Text;
      Doc.Content.Find.Execute(FindText := '%47-codMunicipioSC%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QRNotaArquivoSc_47SVAL_TOTAL.Text;
      Doc.Content.Find.Execute(FindText := '%47-valorMunicipioSC%', ReplaceWith := campo, Replace := 2);

      wTotMunicipio := wTotMunicipio + DMLivroFiscal.QRNotaArquivoSc_47SVAL_TOTAL.Value;
      DMLivroFiscal.QRNotaArquivoSc_47.Next;

      //-----------------------------------
      //Gerando Linhas Dinamicamente
      //Tabela wAuxTabela do Arquivo DIME do WORD
      //-----------------------------------
      Doc.Tables.Item(wAuxTabela).Rows.Add;
      Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 1).Range.InsertAfter('%47-codMunicipioSC%');
      Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 2).Range.InsertAfter('%47-valorMunicipioSC%');
      //-----------------------------------
      //Incrementa Linha
      Inc(wAuxLinhas,1);

    End;
    If wTotMunicipio > 0 Then
    Begin
      //-------------------------------------
      //Gerando Linha para Colocar Total
      Doc.Tables.Item(wAuxTabela).Rows.Add;
      Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 2).Range.InsertAfter('%47-99999-somatorioValorMunicipioSC%');
      //-------------------------------------
      campo := FloatToStr(wTotMunicipio);
      Doc.Content.Find.Execute(FindText := '%47-99999-somatorioValorMunicipioSC%', ReplaceWith := campo, Replace := 2);
    End;

    DMRegEntrada.QApuracaoE_UF.Close;  // este acesso é paga REGISTO TIPO 47 - PASSADO PELO JOAO VIA E_MAIL
    DMRegEntrada.QApuracaoE_UF.SetVariable('FILIAL', wFilial);
    DMRegEntrada.QApuracaoE_UF.SetVariable('DATA_I', wDataInicial);
    DMRegEntrada.QApuracaoE_UF.SetVariable('DATA_F', wDataFinal);
    DMRegEntrada.QApuracaoE_UF.Open;
    //Fim Geração Quadro 47
    //-----------------------
//-------------------------------------------------------------------------------------------------
//Tipo 49 - Quadro 49 - Entradas por Unidade da Federação------------------------------------------
//-------------------------------------------------------------------------------------------------
    wTotal1 := 0;
    wTotal2 := 0;
    wTotal3 := 0;
    //--------------------
    //Gerando Quadro 49
    //Controle da Tabela e de Linhas para geração no Arquivo do Word.
    //wAuxTabela: Comeca em 12, pois é a 12º Tabela do Arquivo DIME do WORD
    //wAuxLinhas: Comeca em 5, pois já existem 4 linhas na tabela. Seu incremento será dinâmico.
    wAuxTabela := 12;
    wAuxLinhas := 5;
    While Not(DMRegEntrada.QApuracaoE_UF.Eof) Do
    Begin
      campo := DMRegEntrada.QApuracaoE_UFCOD_ESTADO.Text;
      Doc.Content.Find.Execute(FindText := '%49-UF%', ReplaceWith := campo, Replace := 2);
      campo := DMRegEntrada.QApuracaoE_UFVal_Contabil.Text;
      Doc.Content.Find.Execute(FindText := '%49-valorContabilUF%', ReplaceWith := campo, Replace := 2);
      campo := DMRegEntrada.QApuracaoE_UFVal_Icm_Base.Text;
      Doc.Content.Find.Execute(FindText := '%49-baseCalculoUF%', ReplaceWith := campo, Replace := 2);
      campo := FloatToStr(DMRegEntrada.QApuracaoE_UFVal_Icm_Base_Outras.Value + DMRegEntrada.QApuracaoE_UFVal_Icm_Base_Isento.Value);
      Doc.Content.Find.Execute(FindText := '%49-outrasUF%', ReplaceWith := campo, Replace := 2);

      wTotal1 := wTotal1 + DMRegEntrada.QApuracaoE_UFVal_Contabil.Value;
      wTotal2 := wTotal2 + DMRegEntrada.QApuracaoE_UFVal_Icm_Base.Value;
      wTotal3 := wtotal3 + DMRegEntrada.QApuracaoE_UFVal_Icm_Base_Outras.Value + DMRegEntrada.QApuracaoE_UFVal_Icm_Base_Isento.Value;

      //-----------------------------------
      //Gerando Linhas Dinamicamente
      //Tabela wAuxTabela do Arquivo DIME do WORD
      //-----------------------------------
      Doc.Tables.Item(wAuxTabela).Rows.Add;
      Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 1).Range.InsertAfter('%49-UF%');
      Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 2).Range.InsertAfter('%49-valorContabilUF%');
      Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 3).Range.InsertAfter('%49-baseCalculoUF%');
      Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 4).Range.InsertAfter('%49-outrasUF%');
      //-----------------------------------
      //Incrementa Linha
      Inc(wAuxLinhas,1);
      //Avanca ao Próximo Registro da Query
      DMRegEntrada.QApuracaoE_UF.Next;
      //-----------------------------------

    End;
    If (wTotal1 <> 0) Or (wTotal2 <> 0) Or (wTotal3 <> 0) Then
    Begin
      //-------------------------------------
      //Gerando Linha para Colocar Total
      Doc.Tables.Item(wAuxTabela).Rows.Add;
      Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 2).Range.InsertAfter('%49-somatorioValorContabilUF%');
      Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 3).Range.InsertAfter('%49-somatorioBaseCalculoUF%');
      Doc.Tables.Item(wAuxTabela).Cell(wAuxLinhas, 4).Range.InsertAfter('%49-somatorioOutrasUF%');
      //-------------------------------------
      campo := FloatToStr(wTotal1);
      Doc.Content.Find.Execute(FindText := '%49-somatorioValorContabilUF%', ReplaceWith := campo, Replace := 2);
      campo := FloatToStr(wTotal2);
      Doc.Content.Find.Execute(FindText := '%49-somatorioBaseCalculoUF%', ReplaceWith := campo, Replace := 2);
      campo := FloatToStr(wTotal3);
      Doc.Content.Find.Execute(FindText := '%49-somatorioOutrasUF%', ReplaceWith := campo, Replace := 2);
    End;
//-------------------------------------------------------------------------------------------------
//Tipo 50 - Quadro 50 - Saídas por Unidade da Federação--------------------------------------------
//-------------------------------------------------------------------------------------------------
    //------------------------------
    //Dados Quadro 50
    DMRegEntrada.QApuracaoS_UF.Close;  // este acesso é paga REGISTO TIPO 47 - PASSADO PELO JOAO VIA E_MAIL
    DMRegEntrada.QApuracaoS_UF.SetVariable('FILIAL', wFilial);
    DMRegEntrada.QApuracaoS_UF.SetVariable('DATA_I', wDataInicial);
    DMRegEntrada.QApuracaoS_UF.SetVariable('DATA_F', wDataFinal);
    DMRegEntrada.QApuracaoS_UF.Open;
    //------------------------------

    wTotal1 := 0;
    wTotal2 := 0;
    wTotal3 := 0;

    While Not(DMRegEntrada.QApuracaoS_UF.Eof) Do
    Begin
      campo := DMRegEntrada.QApuracaoS_UFCOD_ESTADO.Text;
      Doc.Content.Find.Execute(FindText := '%50-UF%', ReplaceWith := campo, Replace := 2);
      campo := DMRegEntrada.QApuracaoS_UFVal_Contabil.Text;
      Doc.Content.Find.Execute(FindText := '%50-naoContribuintesValorContabil%', ReplaceWith := campo, Replace := 2);
      campo := '000000';
      Doc.Content.Find.Execute(FindText := '%50-contribuitesValorContabil%', ReplaceWith := campo, Replace := 2);
      campo := DMRegEntrada.QApuracaoS_UFVal_Icm_Base.Text;
      Doc.Content.Find.Execute(FindText := '%50-naoContribuintesBaseCalculo%', ReplaceWith := campo, Replace := 2);
      campo := '000000';
      Doc.Content.Find.Execute(FindText := '%50-contribuitesBaseCalculo%', ReplaceWith := campo, Replace := 2);
      campo := FloatToStr(DMRegEntrada.QApuracaoS_UFVal_Icm_Base_Outras.Value + DMRegEntrada.QApuracaoS_UFVal_Icm_Base_Isento.Value);
      Doc.Content.Find.Execute(FindText := '%50-outras%', ReplaceWith := campo, Replace := 2);
      campo := '000000';
      Doc.Content.Find.Execute(FindText := '%50-icms%', ReplaceWith := campo, Replace := 2);

      wTotal1 := wTotal1 + DMRegEntrada.QApuracaoS_UFVal_Contabil.Value;
      wTotal2 := wTotal2 + DMRegEntrada.QApuracaoS_UFVal_Icm_Base.Value;
      wTotal3 := wtotal3 + DMRegEntrada.QApuracaoS_UFVal_Icm_Base_Outras.Value + DMRegEntrada.QApuracaoS_UFVal_Icm_Base_Isento.Value;

      DMRegEntrada.QApuracaoS_UF.Next;
    End;

    If (wTotal1 <> 0) Or (wTotal2 <> 0) Or (wTotal3 <> 0) Then
    Begin
      campo := FloatToStr(wTotal1);
      Doc.Content.Find.Execute(FindText := '%50-somatorioNaoContribuintes%', ReplaceWith := campo, Replace := 2);
      campo := '000000';
      Doc.Content.Find.Execute(FindText := '%50-somatorioContribuites%', ReplaceWith := campo, Replace := 2);
      campo := FloatToStr(wTotal2);
      Doc.Content.Find.Execute(FindText := '%50-somatorioNaoContribuintesBaseCalculo%', ReplaceWith := campo, Replace := 2);
      campo := '000000';
      Doc.Content.Find.Execute(FindText := '%50-somatorioContribuitesBaseCalculo%', ReplaceWith := campo, Replace := 2);
      campo := FloatToStr(wTotal3);
      Doc.Content.Find.Execute(FindText := '%50-somatorioOutras%', ReplaceWith := campo, Replace := 2);
      campo := '000000';
      Doc.Content.Find.Execute(FindText := '%50-somatorioIcms%', ReplaceWith := campo, Replace := 2);
    End;

//-------------------------------------------------------------------------------------------------
//Tipo 80 - Quadro 80 - Resumo do livro registro de inventário e Receita Bruta---------------------
//-------------------------------------------------------------------------------------------------
// do registro 80 a 84 somente informar quando mes for 06 (joao passou isso)

//***Pode gerar problemas nessa verificação
    If Copy(wDataInicial,4,2) = '06' Then
    Begin
      //-------------------------
      //Gerando Quadro 80
      campo := DMLivroFiscal.QLivroFiscalVAL_ESTOQUE_INICIO.Text;
      Doc.Content.Find.Execute(FindText := '%80-010-estoqueInicioExe%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVAL_ESTOQUE_FIM.Text;
      Doc.Content.Find.Execute(FindText := '%80-020-estoqueFimExe%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Receita_Bruta.Text;
      Doc.Content.Find.Execute(FindText := '%80-030-receitaBrutaVendaServico%', ReplaceWith := campo, Replace := 2);
      //-------------------------

//-------------------------------------------------------------------------------------------------
//Tipo 81 - Quadro 81 - Ativo----------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
    //Gerando Quadro 81
      If DMLivroFiscal.QLivroFiscalVAL_CIRCULANTE.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_CIRCULANTE.Text;
        Doc.Content.Find.Execute(FindText := '%81-110-circulante%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_DISPONIBILIDADES.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_DISPONIBILIDADES.Text;
        Doc.Content.Find.Execute(FindText := '%81-111-disponibilidades%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_CONTA_RECEBER_CIRCULANTE.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_CONTA_RECEBER_CIRCULANTE.Text;
        Doc.Content.Find.Execute(FindText := '%81-113-contasReceberCirculante%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_ESTOQUE.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_ESTOQUE.Text;
        Doc.Content.Find.Execute(FindText := '%81-121-estoqueMerEMatPrim%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_OUTROS_ESTOQUE.Value > 0 then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_OUTROS_ESTOQUE.Text;
        Doc.Content.Find.Execute(FindText := '%81-123-estoqueOutros%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_OUTROS_CONTAS_ATIVO.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_OUTROS_CONTAS_ATIVO.Text;
        Doc.Content.Find.Execute(FindText := '%81-128-contasOutrasAtivoCirculante%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_REALIZAVEL_LONGO_PRAZO.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_REALIZAVEL_LONGO_PRAZO.Text;
        Doc.Content.Find.Execute(FindText := '%81-130-realizavelLongoPrazo%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_CONTA_RECEBER_REALIZAVEL.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_CONTA_RECEBER_REALIZAVEL.Text;
        Doc.Content.Find.Execute(FindText := '%81-131-contasReceberRealizavel%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_OUTROS_CONTAS_REALIZAVEL.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_OUTROS_CONTAS_REALIZAVEL.Text;
        Doc.Content.Find.Execute(FindText := '%81-148-contasOutrasRealizavel%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_PERMANENTE.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_PERMANENTE.Text;
        Doc.Content.Find.Execute(FindText := '%81-150-permanente%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_INVESTIMENTOS.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_INVESTIMENTOS.Text;
        Doc.Content.Find.Execute(FindText := '%81-151-investimentos%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_IMOBILIZADO.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_IMOBILIZADO.Text;
        Doc.Content.Find.Execute(FindText := '%81-155-imobilizadoLiquido%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_DIFERIDO.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_DIFERIDO.Text;
        Doc.Content.Find.Execute(FindText := '%81-157-diferidoLiquido%', ReplaceWith := campo, Replace := 2);
      End;
      campo := FloatToStr(DMLivroFiscal.QLivroFiscalVAL_CIRCULANTE.Value             +
                          DMLivroFiscal.QLivroFiscalVAL_REALIZAVEL_LONGO_PRAZO.Value +
                          DMLivroFiscal.QLivroFiscalVAL_PERMANENTE.Value);
      Doc.Content.Find.Execute(FindText := '%81-199-ativoTotalGeral%', ReplaceWith := campo, Replace := 2);

//-------------------------------------------------------------------------------------------------
//Tipo 82 - Quadro 82 - Passivo--------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
      //Gerando Quadro 82
      campo := DMLivroFiscal.QLivroFiscalVAL_CIRCULANTE_PASSIVO.Text;
      Doc.Content.Find.Execute(FindText := '%82-210-circulante%', ReplaceWith := campo, Replace := 2);
      If DMLivroFiscal.QLivroFiscalVAL_FORNECEDORES.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_FORNECEDORES.Text;
        Doc.Content.Find.Execute(FindText := '%82-211-fornecedores%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_EMPRESTIMOS_FINANCIAMENTOS.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_EMPRESTIMOS_FINANCIAMENTOS.Text;
        Doc.Content.Find.Execute(FindText := '%82-213-emprestimosFinanciamentos%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_OUTRAS_CONTAS_PASSIVO.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_OUTRAS_CONTAS_PASSIVO.Text;
        Doc.Content.Find.Execute(FindText := '%82-215-contasOutrasPassivoCirculante%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_EXIGIVEL_LONGO_PRAZO.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_EXIGIVEL_LONGO_PRAZO.Text;
        Doc.Content.Find.Execute(FindText := '%82-230-exigivelLongoPrazo%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_RESULTADO_EXERCICIO.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_RESULTADO_EXERCICIO.Text;
        Doc.Content.Find.Execute(FindText := '%82-240-resultadosExeFuturos%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_PASSIVO_DESCOBERTO.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_PASSIVO_DESCOBERTO.Text;
        Doc.Content.Find.Execute(FindText := '%82-269-passivoDescoberto%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_PATRIMONIO_LIQUIDO.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_PATRIMONIO_LIQUIDO.Text;
        Doc.Content.Find.Execute(FindText := '%82-270-patrimonioLiquido%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_CAPITAL_SOCIAL.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_CAPITAL_SOCIAL.Text;
        Doc.Content.Find.Execute(FindText := '%82-271-capitalSocial%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_OUTRAS_CONTAS_PATR_LIQUIDO.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_OUTRAS_CONTAS_PATR_LIQUIDO.Text;
        Doc.Content.Find.Execute(FindText := '%82-278-contasOutrasPatrLiq%', ReplaceWith := campo, Replace := 2);
      End;
      If DMLivroFiscal.QLivroFiscalVAL_OUTRAS_CONT_PATR_LIQ_NEG.Value > 0 Then
      Begin
        campo := DMLivroFiscal.QLivroFiscalVAL_OUTRAS_CONT_PATR_LIQ_NEG.Text;
        Doc.Content.Find.Execute(FindText := '%82-279-contasOutrasPatrLiqValorNeg%', ReplaceWith := campo, Replace := 2);
      End;
      campo := FloatToStr(DMLivroFiscal.QLivroFiscalVAL_CIRCULANTE_PASSIVO.Value   +
                          DMLivroFiscal.QLivroFiscalVAL_EXIGIVEL_LONGO_PRAZO.Value +
                          DMLivroFiscal.QLivroFiscalVAL_RESULTADO_EXERCICIO.Value  +
                          DMLivroFiscal.QLivroFiscalVAL_PASSIVO_DESCOBERTO.Value   +
                          DMLivroFiscal.QLivroFiscalVAL_PATRIMONIO_LIQUIDO.Value);
      Doc.Content.Find.Execute(FindText := '%82-299-geralTotalPassivo%', ReplaceWith := campo, Replace := 2);

//-------------------------------------------------------------------------------------------------
//Tipo 83 - Quadro 83 - Demonstração de Resultado--------------------------------------------------
//-------------------------------------------------------------------------------------------------
      //Gerando Quadro 83
      campo := DMLivroFiscal.QLivroFiscalVal_Receita_Bruta.Text;
      Doc.Content.Find.Execute(FindText := '%83-310-receitaBrutaVendasServ%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Deducoes_Receita_Bruta.Text;
      Doc.Content.Find.Execute(FindText := '%83-311-deducaoReceitaBruta%', ReplaceWith := campo, Replace := 2);
      campo := FloatToStr(DMLivroFiscal.QLivroFiscalVal_Receita_Bruta.Value -
                          DMLivroFiscal.QLivroFiscalVal_Deducoes_Receita_Bruta.Value);
      Doc.Content.Find.Execute(FindText := '%83-320-receitaLiquidaVendasServ%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Custo_Mercadoria.Text;
      Doc.Content.Find.Execute(FindText := '%83-323-custoMerProdVendServPrest%', ReplaceWith := campo, Replace := 2);

      wAux := DMLivroFiscal.QLivroFiscalVal_Receita_Bruta.Value - DMLivroFiscal.QLivroFiscalVal_Deducoes_Receita_Bruta.Value - DMLivroFiscal.QLivroFiscalVal_Custo_Mercadoria.Value;
      If wAux > 0 Then
      Begin
        campo := FloatToStr(wAux);
        Doc.Content.Find.Execute(FindText := '%83-330-lucroBruto%', ReplaceWith := campo, Replace := 2);
        campo := '000000';
        Doc.Content.Find.Execute(FindText := '%83-331-prejuizoBruto%', ReplaceWith := campo, Replace := 2);
      End
      Else
      Begin
        campo := '000000';
        Doc.Content.Find.Execute(FindText := '%83-330-lucroBruto%', ReplaceWith := campo, Replace := 2);
        campo := FloatToStr(wAux * -1);
        Doc.Content.Find.Execute(FindText := '%83-331-prejuizoBruto%', ReplaceWith := campo, Replace := 2);
      End;
      campo := DMLivroFiscal.QLivroFiscalVal_Outras_Receitas_Oper.Text;
      Doc.Content.Find.Execute(FindText := '%83-333-receitaOutrasOp%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Despesas_Operacionais.Text;
      Doc.Content.Find.Execute(FindText := '%83-335-despesasOperacionais%', ReplaceWith := campo, Replace := 2);

      wAux := DMLivroFiscal.QLivroFiscalVal_Outras_Receitas_Oper.Value - DMLivroFiscal.QLivroFiscalVal_Despesas_Operacionais.Value;
      If wAux > 0 Then
      Begin
        campo := FloatToStr(wAux);
        Doc.Content.Find.Execute(FindText := '%83-340-lucroOperacional%', ReplaceWith := campo, Replace := 2);
        campo := '000000';
        Doc.Content.Find.Execute(FindText := '%83-341-prejuizoOperacional%', ReplaceWith := campo, Replace := 2);
      End
      Else
      Begin
        campo := '000000';
        Doc.Content.Find.Execute(FindText := '%83-340-lucroOperacional%', ReplaceWith := campo, Replace := 2);
        campo := FloatToStr(wAux * -1);
        Doc.Content.Find.Execute(FindText := '%83-341-prejuizoOperacional%', ReplaceWith := campo, Replace := 2);
      End;
      campo := DMLivroFiscal.QLivroFiscalVal_Receitas_Nao_Oper.Text;
      Doc.Content.Find.Execute(FindText := '%83-343-receitasNaoOperacionais%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Despesas_Nao_Oper.Text;
      Doc.Content.Find.Execute(FindText := '%83-345-despezasNaoOperacionais%', ReplaceWith := campo, Replace := 2);

      wAux :=  DMLivroFiscal.QLivroFiscalVal_Receita_Bruta.Value          -
               DMLivroFiscal.QLivroFiscalVal_Deducoes_Receita_Bruta.Value -
               DMLivroFiscal.QLivroFiscalVal_Custo_Mercadoria.Value       +
               DMLivroFiscal.QLivroFiscalVal_Outras_Receitas_Oper.Value   -
               DMLivroFiscal.QLivroFiscalVal_Despesas_Operacionais.Value  +
               DMLivroFiscal.QLivroFiscalVal_Receitas_Nao_Oper.Value      -
               DMLivroFiscal.QLivroFiscalVal_Despesas_Nao_Oper.Value;
      If wAux > 0 Then
      Begin
        campo := FloatToStr(wAux);
        Doc.Content.Find.Execute(FindText := '%83-350-resultadoAntesIREContribSocial%', ReplaceWith := campo, Replace := 2);
        campo := '000000';
        Doc.Content.Find.Execute(FindText := '%83-351-resultadoNegAntesIREContribSocial%', ReplaceWith := campo, Replace := 2);
      End
      Else
      Begin
        campo := '000000';
        Doc.Content.Find.Execute(FindText := '%83-350-resultadoAntesIREContribSocial%', ReplaceWith := campo, Replace := 2);
        campo := FloatToStr(wAux * -1);
        Doc.Content.Find.Execute(FindText := '%83-351-resultadoNegAntesIREContribSocial%', ReplaceWith := campo, Replace := 2);
      End;
      campo := DMLivroFiscal.QLivroFiscalVal_Provisao_IR_Contr_Social.Text;
      Doc.Content.Find.Execute(FindText := '%83-353-previsaoIRContribSocial%', ReplaceWith := campo, Replace := 2);

      wAux := wAux - DMLivroFiscal.QLivroFiscalVal_Provisao_IR_Contr_Social.Value;
      If wAux > 0 Then
      Begin
        campo := FloatToStr(wAux);
        Doc.Content.Find.Execute(FindText := '%83-360-resultadoIRContribSocial%', ReplaceWith := campo, Replace := 2);
        campo := '000000';
        Doc.Content.Find.Execute(FindText := '%83-361-resultadoNegativoIRContribSocial%', ReplaceWith := campo, Replace := 2);
      End
      Else
      Begin
        campo := '000000';
        Doc.Content.Find.Execute(FindText := '%83-360-resultadoIRContribSocial%', ReplaceWith := campo, Replace := 2);
        campo := FloatToStr(wAux);
        Doc.Content.Find.Execute(FindText := '%83-361-resultadoNegativoIRContribSocial%', ReplaceWith := campo, Replace := 2);
      End;
      campo := DMLivroFiscal.QLivroFiscalVal_Participacoes_Contr.Text;
      Doc.Content.Find.Execute(FindText := '%83-363-participacaoContribuicoes%', ReplaceWith := campo, Replace := 2);

      wAux := wAux - DMLivroFiscal.QLivroFiscalVal_Participacoes_Contr .Value;
      If wAux > 0 Then
      Begin
        campo := FloatToStr(wAux);
        Doc.Content.Find.Execute(FindText := '%83-398-prejuizoExercicio%', ReplaceWith := campo, Replace := 2);
        campo := '000000';
        Doc.Content.Find.Execute(FindText := '%83-399-lucroExercicio%', ReplaceWith := campo, Replace := 2);
      End
      Else
      Begin
        campo := '000000';
        Doc.Content.Find.Execute(FindText := '%83-398-prejuizoExercicio%', ReplaceWith := campo, Replace := 2);
        campo := FloatToStr(wAux);
        Doc.Content.Find.Execute(FindText := '%83-399-lucroExercicio%', ReplaceWith := campo, Replace := 2);
      End;
//-------------------------------------------------------------------------------------------------
//Tipo 84 - Quadro 84 - Detalhamento das Despezas--------------------------------------------------
//-------------------------------------------------------------------------------------------------
      //Gerando Quadro 84
      campo := DMLivroFiscal.QLivroFiscalVal_Pro_Labore.Text;
      Doc.Content.Find.Execute(FindText := '%84-411-proLabore%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Comissoes_Salarios.Text;
      Doc.Content.Find.Execute(FindText := '%84-412-comissaoSalarioOrdenados%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Combustiveis.Text;
      Doc.Content.Find.Execute(FindText := '%84-431-combustivelLubrificante%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Encargos_Sociais.Text;
      Doc.Content.Find.Execute(FindText := '%84-421-encargosSociais%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Tributos_Federais.Text;
      Doc.Content.Find.Execute(FindText := '%84-422-tributosFederais%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Tributos_Estaduais.Text;
      Doc.Content.Find.Execute(FindText := '%84-423-tributosEstaduais%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Tributos_Municipais.Text;
      Doc.Content.Find.Execute(FindText := '%84-424-tributosMunicipais%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Agua_Telefone.Text;
      Doc.Content.Find.Execute(FindText := '%84-432-aguaTelefone%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Energia_Eletrica.Text;
      Doc.Content.Find.Execute(FindText := '%84-433-energiaEletrica%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Alugueis.Text;
      Doc.Content.Find.Execute(FindText := '%84-441-alugueis%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Servicos_Profissionais.Text;
      Doc.Content.Find.Execute(FindText := '%84-451-servicosProfissionais%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Seguros.Text;
      Doc.Content.Find.Execute(FindText := '%84-442-seguros%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Fretes_Carretos.Text;
      Doc.Content.Find.Execute(FindText := '%84-443-fretesCarretos%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Despesas_Financeiras.Text;
      Doc.Content.Find.Execute(FindText := '%84-461-despesasFinanceiras%', ReplaceWith := campo, Replace := 2);
      campo := DMLivroFiscal.QLivroFiscalVal_Outras_Despesas.Text;
      Doc.Content.Find.Execute(FindText := '%84-498-outrasDespesas%', ReplaceWith := campo, Replace := 2);
      campo := FloatToStr(DMLivroFiscal.QLivroFiscalVal_Pro_Labore.Value             +
                          DMLivroFiscal.QLivroFiscalVal_Comissoes_Salarios.Value     +
                          DMLivroFiscal.QLivroFiscalVal_Combustiveis.Value           +
                          DMLivroFiscal.QLivroFiscalVal_Encargos_Sociais.Value       +
                          DMLivroFiscal.QLivroFiscalVal_Tributos_Federais.Value      +
                          DMLivroFiscal.QLivroFiscalVal_Tributos_Estaduais.Value     +
                          DMLivroFiscal.QLivroFiscalVal_Tributos_Municipais.Value    +
                          DMLivroFiscal.QLivroFiscalVal_Agua_Telefone.Value          +
                          DMLivroFiscal.QLivroFiscalVal_Energia_Eletrica.Value       +
                          DMLivroFiscal.QLivroFiscalVal_Alugueis.Value               +
                          DMLivroFiscal.QLivroFiscalVal_Servicos_Profissionais.Value +
                          DMLivroFiscal.QLivroFiscalVal_Seguros.Value                +
                          DMLivroFiscal.QLivroFiscalVal_Fretes_Carretos.Value        +
                          DMLivroFiscal.QLivroFiscalVal_Despesas_Financeiras.Value   +
                          DMLivroFiscal.QLivroFiscalVal_Outras_Despesas.Value        +
                          DMLivroFiscal.QLivroFiscalVal_Outras_Despesas.Value);
      Doc.Content.Find.Execute(FindText := '%84-499-total%', ReplaceWith := campo, Replace := 2);
    End;
//-------------------------------------------------------------------------------------------------
//Tipo 98 - Quadro 98 - Fim da Declaração----------------------------------------------------------
//-------------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------------
//Tipo 99 - Quadro 99 - Quantidade de declarações e de registros-----------------------------------
//-------------------------------------------------------------------------------------------------

    //-------------------------------------------------------------------------------------------------
    //---------------------FIM GERAÇÃO DE QUADROS DIME-------------------------------------------------
    //Quadros Gerados----------------------------------------------------------------------------------
    //S20, S21, S22, S23, S24, S25, S26, S30, S33, S44, S47, S49, S50, S80, S81, S82, S83 e S84
    //-------------------------------------------------------------------------------------------------
  end;//with
  //Limpa todas variáveis que não foram preenchidas no Word
  limpaVariavelRestante();

  //Novo nome do Arquivo
  wNomeArquivo := (ExtractFilePath(ParamStr(0))+'Contratos\' + 'DIME_' + TiraMascara(wDataInicial) + 'ate' + TiraMascara(wDataFinal) + '.doc');
  //Salva Como o Arquivo DIME gerado
  Doc.SaveAs(wNomeArquivo);
  //Fecha o Microsft Word
  WinWord.Quit;
  MessageDlg('Arquivo DIME Criado em : ' + #13 + wNomeArquivo + #13 + 'Gerado com Sucesso!', mtInformation,[mbOk], 0);
end;
//-----------------------------------------------------------
procedure TArquivoDIMEWordSC.limpaVariavelRestante();
var
  campo: String;
begin
  campo := '';
  Doc.Content.Find.Execute(FindText := '%cpfContabilista%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%contabilista%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%00-010-inscricaoEstadual%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%00-020-razaoSocial%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%00-030-periodoReferencia%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%00-040-tipoDeclaracao%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%00-050-regimeApuracao%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%00-060-porteEmpresa%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%00-070-apuracaoConsolidada%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%00-080-apuracaoCentralizada%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%00-090-transfCreditoPeriodo%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%00-100-creditoPresumido%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%00-110-creditoIncentivosFiscal%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%00-120-movimento%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%00-130-substitutoTributario%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%00-140-escritaContabil%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%00-150-qtdeTrabalhadoresAtividade%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%01-cfop_E%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%01-valorContabil_E%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%01-opCCredBaseCalculo_E%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%01-opCCredImpostoCreditado_E%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%01-opSCredNaoTributada_E%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%01-opSCredOutras_E%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%03-010-SUMvalorContabil_E%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%03-020-SUMopCCredBaseCalculo_E%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%03-030-SUMopCCredImpostoCreditado_E%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%03-040-SUMopSCredNaoTributada_E%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%03-050-SUMopSCredOutras_E%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%02-cfop_S%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%02-valorContabil_S%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%02-opCCredBaseCalculo_S%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%02-opCCredImpostoDebitado_S%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%02-opSCredNaoTributada_S%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%02-opSCredOutras_S%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%03-060-SUMvalorContabil_S%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%03-070-SUMopCCredBaseCalculo_S%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%03-080-SUMopCCredImpostoDebitado_S%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%03-090-SUMopSCredNaoTributada_S%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%03-100-SUMopSCredOutras_S%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%05-010-RESULTsaldoCredorMesAnterior%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%04-010-RESULTdebitoSaidas%', ReplaceWith := campo, Replace := 2); // ** debito saida
  Doc.Content.Find.Execute(FindText := '%05-020-RESULTcreditoEntradas%', ReplaceWith := campo, Replace := 2); // ** credito entrada
  Doc.Content.Find.Execute(FindText := '%04-020-debitoDifAliquotaAtivoPermanente%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%04-050-estornoCredito%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%04-060-estornoOutros%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%04-070-debitoOutros%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%05-030-creditoAtivoPermanente%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%05-040-creditoDifAliquotaMatUsoConsumo%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%05-060-estornoDebitoTransCredAcum%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%05-070-estornoOutrosDebitos%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%05-160-creditoOutros%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%04-990-debitoSubtotal%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%05-990-creditoSubtotal%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%12origem%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%12codigoReceita%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%12dataVencimento%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%12valor%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%12numeroAcordo%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%09-010-debitoSubtotal%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%09-040-debitoTotal%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%09-050-creditoSubtotal%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%09-080-creditoTotal%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%09-120-saldoDevedor%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%09-999-impostoRecolher%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%09-140-saldoCredor%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%09-998-saldoCredorMesSeg%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%09-190-saldoCredorRelOutrosCreditos%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%44-010-totalValoresPagosMesEmp%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%44-020-mediaValoresPagosEmpExAnt%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%44-030-incrementoVerificado%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%44-130-contribuicaoFundoSocial%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%44-140-aplicacaoFunCultural%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%44-150-aplicacaoFunTurismo%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%44-160-aplicacaoFunEsporte%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%44-990-totalCredPresumidos%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%47-codMunicipioSC%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%47-valorMunicipioSC%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%47-99999-somatorioValorMunicipioSC%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%49-UF%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%49-valorContabilUF%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%49-baseCalculoUF%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%49-outrasUF%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%49-somatorioValorContabilUF%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%49-somatorioBaseCalculoUF%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%49-somatorioOutrasUF%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%50-UF%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%50-naoContribuintesValorContabil%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%50-contribuitesValorContabil%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%50-naoContribuintesBaseCalculo%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%50-contribuitesBaseCalculo%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%50-outras%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%50-icms%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%50-somatorioNaoContribuintes%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%50-somatorioContribuites%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%50-somatorioNaoContribuintesBaseCalculo%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%50-somatorioContribuitesBaseCalculo%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%50-somatorioOutras%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%50-somatorioIcms%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%80-010-estoqueInicioExe%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%80-020-estoqueFimExe%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%80-030-receitaBrutaVendaServico%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%81-110-circulante%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%81-111-disponibilidades%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%81-113-contasReceberCirculante%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%81-121-estoqueMerEMatPrim%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%81-123-estoqueOutros%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%81-128-contasOutrasAtivoCirculante%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%81-130-realizavelLongoPrazo%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%81-131-contasReceberRealizavel%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%81-148-contasOutrasRealizavel%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%81-150-permanente%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%81-151-investimentos%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%81-155-imobilizadoLiquido%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%81-157-diferidoLiquido%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%81-199-ativoTotalGeral%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%82-210-circulante%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%82-211-fornecedores%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%82-213-emprestimosFinanciamentos%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%82-215-contasOutrasPassivoCirculante%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%82-230-exigivelLongoPrazo%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%82-240-resultadosExeFuturos%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%82-269-passivoDescoberto%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%82-270-patrimonioLiquido%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%82-271-capitalSocial%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%82-278-contasOutrasPatrLiq%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%82-279-contasOutrasPatrLiqValorNeg%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%82-299-geralTotalPassivo%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-310-receitaBrutaVendasServ%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-311-deducaoReceitaBruta%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-320-receitaLiquidaVendasServ%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-323-custoMerProdVendServPrest%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-330-lucroBruto%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-331-prejuizoBruto%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-330-lucroBruto%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-331-prejuizoBruto%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-333-receitaOutrasOp%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-335-despesasOperacionais%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-340-lucroOperacional%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-341-prejuizoOperacional%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-340-lucroOperacional%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-341-prejuizoOperacional%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-343-receitasNaoOperacionais%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-345-despezasNaoOperacionais%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-350-resultadoAntesIREContribSocial%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-351-resultadoNegAntesIREContribSocial%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-350-resultadoAntesIREContribSocial%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-351-resultadoNegAntesIREContribSocial%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-353-previsaoIRContribSocial%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-360-resultadoIRContribSocial%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-361-resultadoNegativoIRContribSocial%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-360-resultadoIRContribSocial%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-361-resultadoNegativoIRContribSocial%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-363-participacaoContribuicoes%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-398-prejuizoExercicio%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-399-lucroExercicio%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-398-prejuizoExercicio%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%83-399-lucroExercicio%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%84-411-proLabore%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%84-412-comissaoSalarioOrdenados%', ReplaceWith := campo, Replace := 2);     
  Doc.Content.Find.Execute(FindText := '%84-431-combustivelLubrificante%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%84-421-encargosSociais%', ReplaceWith := campo, Replace := 2);      
  Doc.Content.Find.Execute(FindText := '%84-422-tributosFederais%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%84-423-tributosEstaduais%', ReplaceWith := campo, Replace := 2);      
  Doc.Content.Find.Execute(FindText := '%84-424-tributosMunicipais%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%84-432-aguaTelefone%', ReplaceWith := campo, Replace := 2);     
  Doc.Content.Find.Execute(FindText := '%84-433-energiaEletrica%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%84-441-alugueis%', ReplaceWith := campo, Replace := 2);     
  Doc.Content.Find.Execute(FindText := '%84-451-servicosProfissionais%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%84-442-seguros%', ReplaceWith := campo, Replace := 2);     
  Doc.Content.Find.Execute(FindText := '%84-443-fretesCarretos%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%84-461-despesasFinanceiras%', ReplaceWith := campo, Replace := 2);      
  Doc.Content.Find.Execute(FindText := '%84-498-outrasDespesas%', ReplaceWith := campo, Replace := 2);
  Doc.Content.Find.Execute(FindText := '%84-499-total%', ReplaceWith := campo, Replace := 2);
end;
//-----------------------------------------------------------
function TArquivoDIMEWordSC.tiraMascara(text:string): String;
var
  aux:string;
  i:integer;
begin
  Aux := '';
  for i :=1 to Length(text) do
  begin
    if(copy(text,i,1)<>'.') and (copy(text,i,1)<>'-') and (copy(text,i,1)<>'/')and(copy(text,i,1)<>'\') then
    begin
      Aux := Aux + copy(text,i,1);
    end;
  end;
  Result := Aux;
end;


{

//valores para serem passados na chamada da procedure   *****************

 //Variaveis
  //wCPFContabilista   = FLivroFiscalParam.Me20CpfContador.Text
  //wContabilista      = FLivroFiscalParam.Me20Contador.Text
  //wFilial            = FLivroFiscalParam.Fm20Filial.MeFilial.Text
  //wInscricao
  //wDescFilial
  //wDataInicial       = FLivroFiscalParam.Me20DtInicial.Text
  //wDataFinal         = FLivroFiscalParam.Me20DtFinal.Text
  //wPeriodoReferencia = Copy(FLivroFiscalParam.Me20DtInicial.Text,4,2)+Copy(FLivroFiscalParam.Me20DtInicial.Text,7,4)
  //wTipoDeclaracao    = IntToStr(FLivroFiscalParam.Rg20TipoDeclaracao.ItemIndex + 1)
  //wRegimeApuracao    = IntToStr(FLivroFiscalParam.Rg20RegimeApuracao.ItemIndex + 1)
  //wPorteEmpresa      = IntToStr(FLivroFiscalParam.Rg20Porte.ItemIndex + 1)
  //wConsolidada       = IntToStr(FLivroFiscalParam.Rg20Consolidada.ItemIndex + 1)
  //wCentralizada      = IntToStr(FLivroFiscalParam.Rg20Centralizada.ItemIndex + 1)
  //wTransferencia     = IntToStr(FLivroFiscalParam.Rg20Transferencia.ItemIndex + 1)
  //wCredito           = IntToStr(FLivroFiscalParam.Rg20Creditos.ItemIndex + 1)
  //wIncentivo         = IntToStr(FLivroFiscalParam.Rg20Incentivos.ItemIndex + 1);
  //wMovimento         = IntToStr(FLivroFiscalParam.Rg20Movimento.ItemIndex + 1)
  //wSubsTributario    = IntToStr(FLivroFiscalParam.Rg20SubstitutoTributario.ItemIndex + 1)
  //wEscrita           = IntToStr(FLivroFiscalParam.Rg20Escrita.ItemIndex + 1)
  //wQtdeTrabalhadores = StrToInt(FLivroFiscalParam.Me20QtTrabalhadores.Text
  //wRadioCreditos     = FLivroFiscalParam.Rg20Creditos.ItemIndex
  //wRadioIncentivos   = FLivroFiscalParam.Rg20Incentivos.ItemIndex

}
end.
