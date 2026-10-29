unit UImporta_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, variants;

type
  TDMImporta = class(TDataModule)
    QPedido: TOracleDataSet1;
    QPedidoCOD_PEDIDO_CAB: TIntegerField;
    QPedidoCOD_FILIAL: TIntegerField;
    QPedidoCOD_OPERACAO: TIntegerField;
    QPedidoCOD_VENDEDOR: TIntegerField;
    QPedidoCOD_CADASTRO: TIntegerField;
    QPedidoNUM_PEDIDO: TIntegerField;
    QPedidoDT_EMISSAO: TDateTimeField;
    QPedidoVAL_DESCONTO: TFloatField;
    QPedidoDT_ENTREGA: TDateTimeField;
    QPedidoDT_FATURAMENTO: TDateTimeField;
    QPedidoDT_SISTEMA: TDateTimeField;
    QPedidoDESC_OBSERVACAO: TStringField;
    QPedidoDESC_COMPLEMENTO_OBS: TStringField;
    QPedidoPERC_COMISSAO: TFloatField;
    QPedidoDESC_COMPLEMENTO_OBS2: TStringField;
    QPedidoDT_VENCIMENTO: TDateTimeField;
    QPedidoIND_TIPO_PAGAMENTO: TStringField;
    QPedidoCOD_PRODUTO: TFloatField;
    QPedidoQT_QUANTIDADE: TFloatField;
    QPedidoCOD_USUARIO: TIntegerField;
    QPedidoNR_DIAS_CHEQUE: TIntegerField;
    QPedidoNR_DIAS_CHEQUE1: TIntegerField;
    QPedidoNR_DIAS_CHEQUE2: TIntegerField;
    QPedidoNR_DIAS_CHEQUE3: TIntegerField;
    QPedidoCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPedidoIND_TIPO_FRETE: TStringField;
    QPedidoCOD_CULTURA: TIntegerField;
    QPedidoDT_ENTREGA_PRORROGADA: TDateTimeField;
    QPedidoNR_DIAS_CHEQUE4: TIntegerField;
    QPedidoItem: TOracleDataSet1;
    QPedidoItemCOD_PEDIDO_ITEM: TIntegerField;
    QPedidoItemCOD_PEDIDO_CAB: TIntegerField;
    QPedidoItemCOD_PRODUTO: TFloatField;
    QPedidoItemCOD_TRIBUTACAO: TIntegerField;
    QPedidoItemQT_PEDIDO: TFloatField;
    QPedidoItemVAL_UNITARIO: TFloatField;
    QPedidoItemQT_ATENDIDO: TFloatField;
    QPedidoItemQT_CANCELADO: TFloatField;
    QPedidoItemPERC_DESCONTO: TFloatField;
    QPedidoItemCOD_LOTE_TIPO: TIntegerField;
    QPedidoItemPERC_COMISSAO: TFloatField;
    QPedidoItemQT_EMBALAGEM: TFloatField;
    QPedidoItemQT_QUANTIDADE_AUX: TFloatField;
    QPedidoItemCOD_PRODUTO_AUX: TIntegerField;
    QPedidoItemVAL_DESCONTO: TFloatField;
    QPedidoItemPERC_DESCONTO1: TFloatField;
    QPedidoItemPERC_DESCONTO2: TFloatField;
    QPedidoItemPERC_ACRESCIMO: TFloatField;
    QPrazoVencimento: TOracleDataSet1;
    QPrazoVencimentoCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPrazoVencimentoNUM_DIAS: TIntegerField;
    QPedidoCOD_DEPARTAMENTO: TIntegerField;
    QPedidoNUM_PALM: TIntegerField;
    QPedidoCOD_BANCO_AGENCIA: TIntegerField;
    QPedidoPERC_SUB: TFloatField;
    QPedidoCOD_MENSAGEM: TIntegerField;
    QPedidoIND_SITUACAO: TStringField;
    QPedidoIND_ESTOQUE: TStringField;
    QPedidoIND_EMBARQUE: TStringField;
    QPedidoCOD_CONTA_CORRENTE: TIntegerField;
    QPedidoIND_PRECO_TABELA: TStringField;
    QPedidoVAL_IMPOSTO: TFloatField;
    QPedidoIND_LIBERADO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure importaCadastro(arq: string; var wCont_Inc,wCont_Alt : Integer);
    procedure importaPedido(arq: string; var wQtNotas, wQtItens: Integer);
  end;

var
  DMImporta: TDMImporta;

implementation

uses UOracle_cl, UCadastro_cl, USequencia_cl, UUsuario_cl, UProduto_cl,
  UClasse_cl, UVendedor_cl, UComissaoClasse_cl, UVerbaRepresentante_cl;

{$R *.DFM}


procedure TDMImporta.importaPedido(arq: string; var wQtNotas, wQtItens : Integer);
var
   F          : TextFile;
   S,wTrib,wTrib2,wBrinde,wBonificacao,wTroca,wFilial,wFinanceiro,wComercial,wNada,wLibera,wCadastro,wNovo : String;
   wContador : Integer;
   wValor_cc,wTotPedido,wAux,wValor_Outros : Real;
   wMes,wAno,wDia : word;
begin                        // esta variavel é utilizada para somar o valor de brinde e bonificacao
  AssignFile(F, arq);   {Pega arquivo selecionado em dialogo box}
  reset(F);
  Readln(F,S);
  DecodeDate(Date,wAno,wMes,wDia);
  try
    //DMOracle.DBCemapa.StartTransaction;
    DMImporta.QPedido.Open;
    DMImporta.QPedidoItem.Open;
    While Trim(copy(S,1,6)) <> '' Do
     Begin
       wFinanceiro := '';
       wComercial := '';
       wValor_Outros := 0;
       wLibera := 'SIM';       // aqui verifica se o pedido ja foi cadastrado
       If (DMOracle.BuscaNome('SELECT COD_PEDIDO_CAB FROM TB_PEDIDO_CAB','COD_CADASTRO='+IntToStr(StrToInt(copy(S,25,6)))+' And COD_FILIAL=1 And '+ ' NUM_PALM='+IntToStr(StrToInt(copy(S,19,6))))) <> '' Then
         Readln(F,S)
       Else
        With DMImporta Do
        Begin
          wBrinde:=DMOracle.BuscaNome('SELECT IND_BRINDE FROM TB_OPERACAO','COD_OPERACAO='+Trim(copy(S,1,6)));
          wBonificacao:=DMOracle.BuscaNome('SELECT IND_BONIFICACAO FROM TB_OPERACAO','COD_OPERACAO='+Trim(copy(S,1,6)));
          wTroca :=DMOracle.BuscaNome('SELECT IND_TROCA FROM TB_OPERACAO','COD_OPERACAO='+Trim(copy(S,1,6)));
{           If (wBrinde = 'S') Or (wBonificacao = 'S') then
            Begin
              wComercial := 'SIM';
              wFinanceiro := 'SIM';
            End;
}           DMCadastro.QCadastro.Close;
           If copy(S,25,6) = '000000' Then // quando vier com zeros significa um cadastro novo
            Begin
              wCadastro:=DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO','NUM_CGC_CPF='+Chr(39)+Trim(copy(S,167,14))+Chr(39));
              If wCadastro = '' Then
               Begin
                 wCadastro:=DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO','NUM_CGC_CPF='+Chr(39)+Trim(copy(S,167,8))+'/'+Trim(copy(S,175,4))+'-'+Trim(copy(S,179,2))+Chr(39));
                 If wCadastro = '' Then
                   Raise Exception.Create('Cadastro Inexistente - Cnpj: '+Trim(copy(S,167,14)));
               End;
              DMCadastro.QCadastro.SetVariable('PK',wCadastro);
              wCadastro := 'SIM';  // INDICA QUE TEM QUE BLOQUEAR NO CADASTRO
              wNovo := 'SIM'; // a partir de agora esta variavel indica que este cadastro é novo
            End
           Else
            Begin
             DMCadastro.QCadastro.SetVariable('PK',Trim(copy(S,25,6)));
             wCadastro := 'NAO';  // a partir de agora esta variavel indica que este cadastro  NÃO TEM QUE GERAR RELATORIO
             wNovo := 'NAO'; // INDICA QUE NAO É CADASTRO NOVO
            End;
           DMCadastro.QCadastro.Open;
           If DMCadastro.QCadastro.Eof Then
              Raise Exception.Create('Cadastro Inexistente - Codigo: '+Trim(copy(S,25,6)));
           wTrib:=DMOracle.BuscaNome('SELECT PERC_TRIBUTACAO FROM TB_ESTADO','COD_ESTADO='+chr(39)+DMCadastro.QCadastroCod_Estado.Text+chr(39));
           wFilial := '';
           If trim(copy(S,13,6)) <> '' Then
              wFilial :=DMOracle.BuscaNome('SELECT COD_FILIAL FROM TB_VENDEDOR','COD_VENDEDOR='+Trim(copy(S,13,6)));
           QPedido.Insert;
           If wFilial <> '' Then
              QPedidoCod_Filial.Value:=StrToInt(wFilial)
           Else
              QPedidoCod_Filial.Value:=1;
           QPedidoCod_Departamento.Value:=1;
           QPedidoCod_Operacao.Value:=StrToInt(trim(copy(S,1,6)));
           QPedidoCod_Vendedor.Value:=StrToInt(trim(copy(S,13,6)));
           QPedidoCod_Cadastro.Value:=DMCadastro.QCadastroCod_Cadastro.Value;
           QPedidoNum_Palm.Value:=StrToInt(trim(copy(S,19,6)));
           QPedidoNum_Pedido.Value:=DMSequencia.Sequencia(1,'PEDIDO');
           QPedidoDt_Emissao.Value:=StrToDate(copy(S,7,2)+'/'+copy(S,9,2)+'/'+copy(S,11,2));
           QPedidoDt_Entrega.Value:=StrToDate(copy(S,153,2)+'/'+copy(S,155,2)+'/'+copy(S,157,2));
           QPedidoDt_Sistema.Value:=DMOracle.DataHoraServ;
           QPedidoDesc_Observacao.Value:=copy(S,93,60);
//           If Trim(QPedidoDesc_Observacao.Value) <> '' Then
//              wComercial := 'SIM';
           QPedidoPerc_Sub.Value:=StrToInt(copy(S,164,3));
           If Trim(DMCadastro.QCadastroCOD_BANCO_AGENCIA.Text) <> '' Then
              QPedidoCod_Banco_Agencia.Value := DMCadastro.QCadastroCOD_BANCO_AGENCIA.Value;
           If copy(S,35,1) = '1' Then
             QPedidoInd_Tipo_Pagamento.Value:='A VISTA';
           If copy(S,35,1) = '2' Then
            Begin
              QPedidoInd_Tipo_Pagamento.Value:='A PRAZO';
              QPedidoCod_Prazo_Vencimento.Value:= StrToInt(copy(S,31,4));
            End;
           If copy(S,35,1) = '3' Then
            Begin
              QPedidoInd_Tipo_Pagamento.Value:='OUTROS';
              QPrazoVencimento.Close;
              QPrazoVencimento.SetVariable('Cod_Prazo_Vencimento',StrToInt(copy(S,31,4)));
              QPrazoVencimento.Open;
              wContador := 1;
              While Not(QPrazoVencimento.Eof) Do
              Begin
                Case wContador of
                 1 : QPedidoNr_Dias_Cheque.Value := QPrazoVencimentoNum_Dias.Value;
                 2 : QPedidoNr_Dias_Cheque1.Value := QPrazoVencimentoNum_Dias.Value;
                 3 : QPedidoNr_Dias_Cheque2.Value := QPrazoVencimentoNum_Dias.Value;
                 4 : QPedidoNr_Dias_Cheque3.Value := QPrazoVencimentoNum_Dias.Value;
                 5 : QPedidoNr_Dias_Cheque4.Value := QPrazoVencimentoNum_Dias.Value;
               End;
               Inc(wContador);
               QPrazoVencimento.Next;
             End;
           End;
          if DMUsuario.CodUsuarioCorrente > 0 then
            QPedidoCod_Usuario.Value := DMUsuario.CodUsuarioCorrente
          else
            QPedidoCod_Usuario.text := '';
//            If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL' Then
//             Begin
          DMProduto.Qproduto.Close;
          DMProduto.QProduto.SetVariable('PK',copy(S,49,6));
          DMProduto.Qproduto.Open;
          DMClasse.QClasse.Close;
          DMClasse.QClasse.SetVariable('PK',DMProduto.QProdutoCod_Classe.Value);
          DMClasse.QClasse.Open;
          If (wBonificacao = 'S') Or
             (wBrinde = 'S') Or
             (wTroca = 'S') Then
             QPedidoPerc_Comissao.Value := 0
          Else
             QPedidoPerc_Comissao.Value := (StrToFloat(trim(copy(S,159,5))))/100;
          QPedido.Post;
          DMVendedor.QVendedor.Close;  // acessa o cadastro de vendedor para verificar os problemas comerciais
          DMVendedor.QVendedor.SetVariable('Pk',QPedidoCod_Vendedor.Value);
          DMVendedor.QVendedor.Open;
          Inc(wQtNotas);
          wTotPedido := 0;  // serve para somar o valor total do pedido para calculo do limite de credito do cliente
          While (QPedidoCod_Cadastro.Value =DMCadastro.QCadastroCod_Cadastro.Value) And (QPedidoNum_Palm.Value=StrToInt(copy(S,19,6))) do
          begin
            If Not(QPedidoItem.Locate('COD_PRODUTO',StrToInt(trim(copy(S,49,6))),[])) Then
             Begin
               QPedidoItem.Insert;
               DMProduto.Qproduto.Close;
               DMProduto.QProduto.SetVariable('PK',copy(S,49,6));
               DMProduto.Qproduto.Open;
               If DMProduto.Qproduto.EOF Then
                  Raise Exception.Create('Produto Não Cadastrado - Codigo '+ copy(S,49,6));
               QPedidoItemCod_Pedido_Cab.Value := QPedidoCod_Pedido_Cab.Value;
               QPedidoItemCod_Produto.Value := StrToInt(trim(copy(S,49,6)));
               QPedidoItemQt_Pedido.Value := StrToFloat(trim(copy(S,55,8)))/1000;
               QPedidoItemVal_Unitario.Value := StrToFloat(trim(copy(S,63,8)))/1000;
{               wAux := DMProduto.QProdutoVal_Varejo.Value - DMProduto.QProdutoVal_Varejo.Value * DMVendedor.QVendedorPerc_Desconto_Liberado.Value / 100;
               If QPedidoItemVal_Unitario.Value < wAux Then
                  wComercial := 'SIM'; //nesta rotina verifica PRODUTO ESTA COM VALOR MENOR QUE TABELA é um problema comercial
               wAux := DMProduto.QProdutoVal_Varejo.Value + DMProduto.QProdutoVal_Varejo.Value * DMVendedor.QVendedorPerc_Acrescimo_Maximo.Value / 100;
               If QPedidoItemVal_Unitario.Value > wAux Then
                  wComercial := 'SIM'; //nesta rotina verifica PRODUTO ESTA COM VALOR muito acima da TABELA é um problema comercial
}               If DMCadastro.QCadastroCod_Estado.Value = 'PR' Then
                  QPedidoItemCod_Tributacao.Value := DMProduto.QProdutoCod_Tributacao.Value
               Else
                  QPedidoItemCod_Tributacao.Value := Trunc(StrToFloat(wTrib)); // aqui tributacao do cadastro de estado
               wTrib2 := DMOracle.BuscaNome('SELECT COD_TRIBUTACAO FROM TB_OPERACAO','COD_OPERACAO='+Trim(copy(S,1,6)));
               If wTrib2 <> ''  Then
                  QPedidoItemCod_Tributacao.Value := StrToInt(wTrib2); // segundo dyno e Eduardo deve ser pela operacao quando preenchido
               QPedidoItemCod_Lote_Tipo.Value := 1;
               QPedidoItemQt_Atendido.Value := 0;
               QPedidoItemQt_Cancelado.Value := 0;
               QPedidoItemPerc_Desconto.Value := 0;
               If (wBonificacao = 'S') Or
                  (wBrinde = 'S') Then
                  wValor_Outros := wValor_Outros + QPedidoItemVal_Unitario.Value * QPedidoItemQt_Pedido.Value;

               If (wBonificacao = 'S') Or
                  (wBrinde = 'S') Or
                  (wTroca = 'S') Then
                  QPedidoItemPerc_Comissao.Value := 0
               Else
                 Begin
 //                 If RgEmpresa.ItemIndex = 0 Then
 //                    QPedidoItemPerc_Comissao.Value := (StrToFloat(trim(copy(S,160,4))))/100
 //                 Else
{                    Begin  // esta rotina verifica o percentual de comissao baseado na quantidade vendida no pedido
                      DMComissaoClasse.QComissaoClasseCons.Close;
                      DMComissaoClasse.QComissaoClasseCons.SetVariable('COD_VENDEDOR',QPedidoCod_Vendedor.Value);
                      DMComissaoClasse.QComissaoClasseCons.SetVariable('COD_CLASSE',DMProduto.QProdutoCod_Classe.Value);
                      DMComissaoClasse.QComissaoClasseCons.Open;
                      If DMComissaoClasse.QComissaoClasseCons.Eof Then  //primeiro verifica se tem classe cadastrada para o vendedor
                       Begin                  //caso nao tenha verifica se tem classe sem vendedor - serve a comissao para todos os vendedores
                         DMComissaoClasse.QComissaoClasseCons.Close;
                         DMComissaoClasse.QComissaoClasseCons.SetVariable('COD_VENDEDOR',Null);
                         DMComissaoClasse.QComissaoClasseCons.Open;
                       End;
                      If not (DMComissaoClasse.QComissaoClasseCons.Eof) Then
                       Begin
                         if QPedidoItemQt_Pedido.Value <= DMComissaoClasse.QComissaoClasseConsQt_Ate.Value Then
                            QPedidoItemPerc_Comissao.Value := DMComissaoClasse.QComissaoClasseConsPerc_Comissao.Value
                         Else
                           if QPedidoItemQt_Pedido.Value <= DMComissaoClasse.QComissaoClasseConsQt_Ate1.Value Then
                              QPedidoItemPerc_Comissao.Value := DMComissaoClasse.QComissaoClasseConsPerc_Comissao1.Value
                           Else
                             if QPedidoItemQt_Pedido.Value <= DMComissaoClasse.QComissaoClasseConsQt_Ate2.Value Then
                                QPedidoItemPerc_Comissao.Value := DMComissaoClasse.QComissaoClasseConsPerc_Comissao2.Value;
                       End;
}                  wTotPedido := wTotPedido + QPedidoItemVal_Unitario.Value * QPedidoItemQt_Pedido.Value;
                   QPedidoItemPerc_Comissao.Value := StrToFloat(trim(copy(S,159,5))) / 100
                 End;
               QPedidoItem.Post;
               Inc(wQtItens);
             End;
            Readln(F,S);
            If Trim(copy(S,1,6)) = '' Then
               Break;
          End;
//            If RgEmpresa.ItemIndex = 1 Then
//             Begin  // nesta rotina verifica se o cliente tem problema no financeiro
             If DMCadastro.QCadastroDT_CANCELAMENTO.Text <> '' Then
                wFinanceiro := 'SIM';
             If DMCadastro.QCadastroNum_Cgc_Cpf.Value = '' Then
                wCadastro := 'SIM';
             wNada := DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_BCO_MOVIMENTO ',
                 'COD_CADASTRO = '+ QPedidoCod_Cadastro.Text +
                 ' AND DT_MOVIMENTO >= '+ Chr(39) +  DateToStr(Date()) + Chr(39));
             wValor_cc := 0;
             If wNada <> '' Then
                 wValor_cc := StrToFloat(wNada);
             DMCadastro.QSomaLimite.Close;
             DMCadastro.QSomaLimite.SetVariable('CADASTRO',QPedidoCod_Cadastro.Value);
             DMCadastro.QSomaLimite.Open;
             // AQUI TESTA LIMITE DE CREDITO DO CLIENTE
             If (DMCadastro.QCadastroVal_Limite.Value < (wTotPedido+wValor_cc+DMCadastro.QSomaLimiteSVal_Usado.Value)) and (DMCadastro.QCadastroVal_Limite.Value > 0) Then
                wFinanceiro := 'SIM';
             // AQUI TESTA SE O CLIENTE POSSUI TITULOS VENCIDOS
             wNada := DMOracle.BuscaNome('SELECT MIN(DT_VENCIMENTO) FROM TB_CONTA_RECEBER_CAB ',
                 'COD_CADASTRO = '+ QPedidoCod_Cadastro.Text + ' And IND_SITUACAO <> ' + Chr(39) + 'BAIXA TOTAL' + Chr(39));
             If wNada <> '' Then
                If StrToDate(wNada) < Date Then
                   wFinanceiro := 'SIM';
//             End;

             // se o pedido for brinde ou bonificacao - vai verificar se o vendedor possui verba
             If (wBonificacao = 'S') Or
                (wBrinde = 'S') Then
              Begin
                With DMVerbaRepresentante do
                Begin
                  QVerbaVendedorCons.Close;
                  QVerbaVendedorCons.SetVariable('Ano',wAno);
                  QVerbaVendedorCons.SetVariable('Mes',wMes);
                  QVerbaVendedorCons.SetVariable('Vendedor',QPedidoCod_Vendedor.Value);
                  QVerbaVendedorCons.Open;
                  if QVerbaVendedorCons.Eof Then
                     wComercial := 'SIM'
                  Else
                    Begin
                      If QVerbaVendedorConsVal_Verba.Value <= QVerbaVendedorConsVal_Utilizado.Value + wValor_Outros Then
                        wComercial := 'SIM'
                      Else
                        Begin
                          QVerbaVendedor.Close;
                          QVerbaVendedor.SetVariable('Num_Ano',wAno);
                          QVerbaVendedor.SetVariable('Num_Mes',wMes);
                          QVerbaVendedor.SetVariable('Cod_Vendedor',QPedidoCod_Vendedor.Value);
                          QVerbaVendedor.SetVariable('Cod_Verba_Representante',QVerbaVendedorConsCod_Verba_Representante.Value);
                          QVerbaVendedor.Open;
                          If not(QVerbaVendedor.Eof) Then
                           Begin
                            wValor_Outros := wValor_Outros + QVerbaVendedorVal_Utilizado.Value;
                            QVerbaVendedor.Edit;
                            QVerbaVendedorVal_Utilizado.Value := wValor_Outros;
                            QVerbaVendedor.Post;
                           End
                          Else
                           wComercial := 'SIM';  // porque nao achou verba representante
                        End;
                    End;
                End;
              End;
          If (wComercial = 'SIM') Or (wFinanceiro = 'SIM') Or (wCadastro = 'SIM') Then
           Begin
             If wFinanceiro = 'SIM' Then  // indica que tem problema no financeiro
               wLibera := 'F'
             Else
               wLibera := '0';
             if wComercial = 'SIM' Then  // indica que tem problema no comercial
               wLibera := wLibera + 'C'
             Else
               wLibera := wLibera + '0';
             if wCadastro = 'SIM' Then  // indica que é um cadastro novo  ou problema de cnpj
              Begin
                If wNovo = 'SIM' Then
                   wLibera := wLibera + 'N'  // Cadastro Novo
                Else
                   wLibera := wLibera + 'P' // Problema no cadastro
              End
             Else
               wLibera := wLibera + '0';
           End;
          QPedido.Edit;
          QPedidoInd_Liberado.Value := wLibera;
          QPedido.Post;
      End;
    End;
    //DMOracle.DBCemapa.Commit;
    //EdTotalNotas.Text := IntToStr(wQtNotas);
    //EdTotalItens.Text := IntToStr(wQtItens);
    CloseFile(F);
    DeleteFile(arq);
    //showmessage('Importação encerrada com Sucesso');
  except
    On E : Exception Do
     Begin
       DMImporta.QPedido.Cancel;
       DMImporta.QPedidoItem.Cancel;
       //DMOracle.DBCemapa.Rollback;
       Raise ;//exception.Create(e.Message + Chr(13) + ' Erro na Importação');
     End;
  End;
end;

procedure TDMImporta.importaCadastro(arq: string; var wCont_Inc,wCont_Alt : Integer);
var
   F          : TextFile;
   S : String;
begin
  AssignFile(F, arq);
  reset(F);
  Readln(F,S);
  wCont_Inc := 0;
  wCont_Alt := 0;
  //DMCadastro.QCadastro.CommitOnPost := False;
  try
    //DMOracle.DBCemapa.StartTransaction;
    While Trim(copy(S,1,1)) <> '' Do
     Begin
       If (copy(S,1,1) = '2') Or (Trim(Copy(S,36,6)) = '000000')  Then  //inclusao de novo cadastro
        Begin
          If (DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO','NUM_CGC_CPF='+Chr(39) + copy(S,251,14) + Chr(39))) = '' Then
           Begin
             With DMCadastro Do
             Begin
               QCadastro.Open;
               QCadastro.Insert;
               //QCadastroCod_Tipo_Cadastro.Value:=1;
               QCadastroCod_Vendedor.Value:=StrToInt(Trim(Copy(S,22,6)));
               QCadastroInd_Fisica_Juridica.Value:=Copy(S,42,1);
               QCadastroNome.Value:=Trim(Copy(S,43,34));
               QCadastroDesc_Fantasia.Value:=Trim(Copy(S,77,20));
               QCadastroDesc_Telefone.Value:=Trim(Copy(S,97,16));
               QCadastroNome_Contato.Value:=Trim(Copy(S,113,30));
               QCadastroDesc_Endereco.Value:=Trim(Copy(S,147,34));
               QCadastroDesc_Cidade.Value:=Trim(Copy(S,181,30));
               QCadastroCod_Estado.Value:=Trim(Copy(S,211,2));
               QCadastroDesc_Bairro.Value:=Trim(Copy(S,213,20));
               QCadastroDesc_Cep.Value:=Trim(Copy(S,243,8));
               QCadastroNum_Cgc_Cpf.Value:=Trim(Copy(S,251,14));
               QCadastroNum_Inscricao.Value:=Trim(Copy(S,265,18));
               if Trim(Copy(S,283,1)) <> ''  Then
                  QCadastroNum_Dia_Visita.Value:=StrToInt(Trim(Copy(S,283,1)));
               QCadastroDesc_Frequencia_Visita.Value:=Trim(Copy(S,284,1));
               If Trim(Copy(S,285,4)) <> '' Then
                  QCadastroNum_Hora_Visita.Value:=StrToInt(Trim(Copy(S,285,4)));
               QCadastro.Post;
               Inc(wCont_Inc);
               QCadastro.Close;
             End;
           End;
        End
       Else
        Begin  // rotina para alteracao no cadastro
          With DMCadastro Do
          Begin
            QCadastro.Close;
            QCadastro.SetVariable('PK',Trim(Copy(S,36,6)));
            QCadastro.Open;
            If Not(QCadastro.Eof) Then
             Begin
               QCadastro.Edit;
               If Trim(Copy(S,77,20)) <> '' Then
                  QCadastroDesc_Fantasia.Value:=Trim(Copy(S,77,20));
               If Trim(Copy(S,97,16)) <> '' Then
                  QCadastroDesc_Telefone.Value:=Trim(Copy(S,97,16));
               If Trim(Copy(S,113,30)) <> '' Then
                  QCadastroNome_Contato.Value:=Trim(Copy(S,113,30));
               QCadastro.Post;
               QCadastro.Close;
               Inc(wCont_Alt);
             End;
          End;
        End;
       Readln(F,S);
     End;
    //DMOracle.DBCemapa.Commit;
    CloseFile(F);
    DeleteFile(arq);
    //EdTotalIncluidos.Text := IntToStr(wCont_Inc);
    //EdTotalAlterados.Text := IntToStr(wCont_Alt);
    //showmessage('Importação encerrada com Sucesso');
  except
//    showmessage('Erro na importação');
    DMCadastro.QCadastro.Cancel;
    //DMOracle.DBCemapa.Rollback;
    Raise;
  End;


end;


end.
