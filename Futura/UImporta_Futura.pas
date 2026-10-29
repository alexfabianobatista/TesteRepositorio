unit UImporta_Futura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFImporta_Futura = class(TForm)
    OpenDialog1: TOpenDialog;
    BitBtn13: TBitBtn;
    procedure BitBtn13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImporta_Futura: TFImporta_Futura;

implementation

uses UOracle_cl, UImportaFutura_cl, UUsuario_cl, UProduto_cl,
  UParamSistema_cl, UClasse_cl, UOperacao_cl;

{$R *.DFM}

procedure TFImporta_Futura.BitBtn13Click(Sender: TObject);
var
   F          : TextFile;
   S,wComando,wUf,wTrib,wComissao, wObs_Cheque,wClasse,wRegime_Especial,wFilial : String;
   wContador,wLinhas  :Integer;
begin
  S:= '';  // Inicializa valor da variavel.
//  wContador := 0;
  OpenDialog1.InitialDir:='c:\';
  OpenDialog1.Filter:='txt';
  DMOracle.DBCemapa.StartTransaction;
  try
    if OpenDialog1.Execute then
    begin
      AssignFile(F, OpenDialog1.FileName);   {Pega arquivo selecionado em dialogo box}
      reset(F);
      Readln(F,S);
    end;
    DMImportaFutura.QPedido.Open;
    DMImportaFutura.QPedidoItem.Open;
    wFilial:=DMOracle.BuscaNome('SELECT COD_FILIAL FROM TB_VENDEDOR','COD_VENDEDOR='+copy(S,25,6));
    If (DMOracle.BuscaNome('SELECT COD_PEDIDO_CAB FROM TB_PEDIDO_CAB','COD_CADASTRO='+IntToStr(StrToInt(copy(S,45,6)))+' And COD_FILIAL='+wFilial + ' And '+ ' NUM_PEDIDO='+IntToStr(StrToInt(copy(S,31,6))))) = '' Then
    Begin
      wComando := copy(S,74,3);
      If wComando <> '' Then
         wLinhas := StrToInt(wComando)
      Else
         wLinhas := 0;
      DMOperacao.QOperacao.Close;
      DMOperacao.QOperacao.SetVariable('Pk',StrToInt(copy(S,1,4)));
      DMOperacao.QOperacao.Open;
      wUf:=DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO='+copy(S,45,6));
      DMImportaFutura.QPedido.Insert;
      DMImportaFutura.QPedidoCod_Filial.Value:=StrToInt(wFilial);
      If DMImportaFutura.QPedidoCod_Filial.Value = 9 Then
        DMImportaFutura.QPedidoCod_Departamento.Value:=9
      Else
        DMImportaFutura.QPedidoCod_Departamento.Value:=12;
      DMImportaFutura.QPedidoCod_Operacao.Value:=StrToInt(copy(S,1,4));
      DMImportaFutura.QPedidoCod_Vendedor.Value:=StrToInt(copy(S,25,6));
      DMImportaFutura.QPedidoCod_Cadastro.Value:=StrToInt(copy(S,45,6));
      DMImportaFutura.QPedidoNum_Pedido.Value:=StrToInt(copy(S,31,6));
      DMImportaFutura.QPedidoDt_Emissao.Value:=StrToDate(copy(S,5,2)+'/'+copy(S,7,2)+'/'+copy(S,9,2));
      DMImportaFutura.QPedidoDt_Entrega.Value:=StrToDate(copy(S,212,2)+'/'+copy(S,214,2)+'/'+copy(S,216,2));
      DMImportaFutura.QPedidoDt_Sistema.Value:=DMOracle.DataHoraServ;
      DMImportaFutura.QPedidoDesc_Observacao.Value:=copy(S,133,60);
      DMImportaFutura.QPedidoPerc_Comissao.Value := 3;
      DMImportaFutura.QPedidoNum_Palm.Value := StrToInt(Copy(S,31,6));
      If DMOperacao.QOperacaoIND_TROCA.Value = 'S' Then
         DMImportaFutura.QPedidoCod_Mensagem.Value := 17
      Else
        If DMOperacao.QOperacaoIND_BONIFICACAO.Value = 'S' Then
           DMImportaFutura.QPedidoCod_Mensagem.Value := 16
        Else
          If wUf = 'PR' Then
             DMImportaFutura.QPedidoCod_Mensagem.Value := 3
          Else
             If DMImportaFutura.QPedidoCOD_FILIAL.Value = 9 Then
               DMImportaFutura.QPedidoCod_Mensagem.Value := 49
             Else
               DMImportaFutura.QPedidoCod_Mensagem.Value := 8;
      If StrToInt(copy(S,1,4)) = 1429 Then
      Begin
        DMImportaFutura.QPedidoCod_Banco_Agencia.Value := 1;
        DMImportaFutura.QPedidoCod_Conta_Corrente.Value := 1;
      End;
      If StrToInt(copy(S,1,4)) = 1430 Then
      Begin
        DMImportaFutura.QPedidoCod_Banco_Agencia.Value := 4;
        DMImportaFutura.QPedidoCod_Conta_Corrente.Value := 4;
      End;
      If StrToInt(copy(S,1,4)) = 1431 Then
      Begin
        DMImportaFutura.QPedidoCod_Banco_Agencia.Value := 748;
        DMImportaFutura.QPedidoCod_Conta_Corrente.Value := 18;
      End;
      If StrToInt(copy(S,1,4)) = 1432 Then
      Begin
        DMImportaFutura.QPedidoCod_Banco_Agencia.Value := 416;
        DMImportaFutura.QPedidoCod_Conta_Corrente.Value := 7;
      End;
      If (copy(S,61,1) = '1') Then  // toda venda a vista deve ser para 7 dias cfe solicitacao do JEAN 31/01/2007
       Begin
         DMImportaFutura.QPedidoInd_Tipo_Pagamento.Value:='A PRAZO';
         DMImportaFutura.QPedidoCod_Prazo_Vencimento.Value:= 1;
       End
      Else
        If copy(S,61,1) = '2' Then
         Begin
           DMImportaFutura.QPedidoInd_Tipo_Pagamento.Value:='A PRAZO';
           DMImportaFutura.QPedidoCod_Prazo_Vencimento.Value:= StrToInt(copy(S,51,4));
         End
        Else
         If copy(S,61,1) = '3' Then
         Begin
           DMImportaFutura.QPedidoCod_Banco_Agencia.Value := 16;
           DMImportaFutura.QPedidoCod_Conta_Corrente.Value := 10;
           DMImportaFutura.QPedidoInd_Tipo_Pagamento.Value:='A PRAZO';
           DMImportaFutura.QPedidoCod_Prazo_Vencimento.Value:= StrToInt(copy(S,51,4));
           DMImportaFutura.QPrazoVencimento.Close;
           DMImportaFutura.QPrazoVencimento.SetVariable('Cod_Prazo_Vencimento',StrToInt(copy(S,51,4)));
           DMImportaFutura.QPrazoVencimento.Open;
           wContador := 1;
           wObs_Cheque := 'Cheque Para ';
           While Not(DMImportaFutura.QPrazoVencimento.Eof) Do
           Begin
             Case wContador of
               1 : wObs_Cheque := wObs_Cheque + DMImportaFutura.QPrazoVencimentoNum_Dias.Text;
               2 : wObs_Cheque := wObs_Cheque + ', ' + DMImportaFutura.QPrazoVencimentoNum_Dias.Text;
               3 : wObs_Cheque := wObs_Cheque + ', ' + DMImportaFutura.QPrazoVencimentoNum_Dias.Text;
               4 : wObs_Cheque := wObs_Cheque + ', ' + DMImportaFutura.QPrazoVencimentoNum_Dias.Text;
               5 : wObs_Cheque := wObs_Cheque + ', ' + DMImportaFutura.QPrazoVencimentoNum_Dias.Text;
             End;
             Inc(wContador);
             DMImportaFutura.QPrazoVencimento.Next;
           End;
           wObs_Cheque := wObs_Cheque + ' Dias';
         End;
      If (DMOperacao.QOperacaoInd_Troca.Value = 'S') Or
         (DMOperacao.QOperacaoInd_Brinde.Value = 'S') Or
         (DMOperacao.QOperacaoInd_Bonificacao.Value = 'S') Then
         DMImportaFutura.QPedidoInd_Tipo_Pagamento.Value:='A VISTA';
      DMImportaFutura.QPedidoDesc_Complemento_Obs.Value:= wObs_Cheque;
      DMImportaFutura.QPedidoCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;
      DMImportaFutura.QPedido.Post;

      wContador := 0;
      while wContador < wLinhas   do
      begin
        DMImportaFutura.QPedidoItem.Insert;
        DMImportaFutura.QPedidoItemCod_Pedido_Cab.Value := DMImportaFutura.QPedidoCod_Pedido_Cab.Value;
        DMImportaFutura.QPedidoItemCod_Produto.Value := StrToInt(copy(S,81,6));
        DMImportaFutura.QPedidoItemQt_Pedido.Value := StrToFloat(copy(S,87,8))/1000;
        DMImportaFutura.QPedidoItemVal_Unitario.Value := StrToFloat(copy(S,103,8))/1000;
//        DMImportaFutura.QPedidoItemVal_Unitario.Value := StrToFloat(copy(S,101,8))/1000;
        DMProduto.Qproduto.Close;
        DMProduto.QProduto.SetVariable('PK',copy(S,81,6));
        DMProduto.Qproduto.Open;
        wTrib:=DMOracle.BuscaNome('SELECT PERC_TRIBUTACAO FROM TB_ESTADO','COD_ESTADO='+chr(39)+wUf+chr(39));
        If wUf = 'PR' Then
           wTrib := DMPRoduto.QProdutoCod_Tributacao.Text;

        If (wUF = 'MS') And
           ((DMProduto.QProdutoCod_Classe.Value = 225) or (DMProduto.QProdutoCod_Classe.Value = 227)) Then
           DMImportaFutura.QPedidoItemCod_Tributacao.Value := 70
        Else
           DMImportaFutura.QPedidoItemCod_Tributacao.Value := Trunc(StrToFloat(wTrib));
        If DMOperacao.QOperacaoInd_Bonificacao.Value = 'S' Then  // solicitacao da Ivonete - bonificacao dentro do estado
           If wUf = 'PR' Then                                   // tributacao = 7 fora do estado tributacao = 74
              DMImportaFutura.QPedidoItemCod_Tributacao.Value := 7
           else
              DMImportaFutura.QPedidoItemCod_Tributacao.Value := 74;

        // SOLICITACAO DA KELY NO DIA 04/05/2006 PARA VENDEDOR ALICIO(19) E VENDAS PARA MS
        If (DMImportaFutura.QPedidoCod_Vendedor.Value = 19) And (wUF = 'MS') Then
         Begin
           wClasse:=DMOracle.BuscaNome('SELECT NUM_CLASSE FROM TB_CLASSE','COD_CLASSE='+DMProduto.QprodutoCod_Classe.Text);
           If (wClasse = '2') or (wClasse = '10') or (wClasse = '3') or (wClasse = '4') or (wClasse = '11') or (wClasse = '12') Then
              DMImportaFutura.QPedidoItemCod_Tributacao.Value := 80;
           If wClasse = '13' Then
              DMImportaFutura.QPedidoItemCod_Tributacao.Value := 79;
         End;

        wRegime_Especial:=DMOracle.BuscaNome('SELECT IND_REGIME_ESPECIAL FROM TB_CADASTRO','COD_CADASTRO='+DMImportaFutura.QPedidoCod_Cadastro.Text);
        If wRegime_Especial = 'SIM' Then  // clientes com regime especial de imposto ICMS isento conf solicitacao AIGLE
           DMImportaFutura.QPedidoItemCod_Tributacao.Value := 6;
        If DMImportaFutura.QPedidoCod_Filial.Value = 9 Then   // tributacao conforme tabela passada pelo jean 31/01/2007
         Begin
           If wUF = 'SC' Then
              DMImportaFutura.QPedidoItemCod_Tributacao.Value := 7;
           If wUF = 'PR' Then
              DMImportaFutura.QPedidoItemCod_Tributacao.Value := 12;
           If wUF = 'SP' Then
              DMImportaFutura.QPedidoItemCod_Tributacao.Value := 12;
           If wUF = 'ES' Then
              DMImportaFutura.QPedidoItemCod_Tributacao.Value := 7;
           If wUF = 'BA' Then
              DMImportaFutura.QPedidoItemCod_Tributacao.Value := 7;
         End;
        DMImportaFutura.QPedidoItemCod_Lote_Tipo.Value := 1;
//        DMImportaFutura.QPedidoItemVal_Unitario.Value := StrToFloat(copy(S,101,8))/1000;
        DMImportaFutura.QPedidoItemQt_Atendido.Value := 0;
        DMImportaFutura.QPedidoItemQt_Cancelado.Value := 0;
        DMImportaFutura.QPedidoItemPerc_Desconto.Value := 0;
        If DMImportaFutura.QPedidoCod_Vendedor.Value = 113 Then
           If (StrToInt(copy(S,81,6)) = 1648) or
              (StrToInt(copy(S,81,6)) = 1649) Then
              DMImportaFutura.QPedidoItemPerc_Comissao.Value := 3
           Else
              DMImportaFutura.QPedidoItemPerc_Comissao.Value := 1.2
        Else
          Begin
            wComissao := DMOracle.BuscaNome('SELECT PERC_COMISSAO FROM TB_PRODUTO','COD_PRODUTO='+copy(S,81,6));
            If wComissao <> '' Then
               DMImportaFutura.QPedidoItemPerc_Comissao.Value := StrToFloat(wComissao);
          End;
        DMImportaFutura.QPedidoItem.Post;
        inc(wContador);
        Readln(F,S);
      end;
      DMOracle.DBCemapa.Commit;
      ShowMessage('Importação efetuada com sucesso!');
    End
   Else
     ShowMessage('Pedido Já Importado; Número='+copy(S,31,6)+' Cadastro='+copy(S,45,6));
  except
    DMOracle.DBCemapa.Rollback;
    Raise;
  end;
end;

end.
