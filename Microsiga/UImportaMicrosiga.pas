unit UImportaMicrosiga;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFImportaMicrosiga = class(TForm)
    BitBtn13: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure BitBtn13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImportaMicrosiga: TFImportaMicrosiga;

implementation

uses UOracle_cl, UImporta_cl, UParamSistema_cl, UUsuario_cl, UProduto_cl,
  UClasse_cl, USequencia_cl;

{$R *.DFM}

procedure TFImportaMicrosiga.BitBtn13Click(Sender: TObject);
var
   F          : TextFile;
   S,wUf,wTrib,wBrinde,wBonificacao : String;
   wContador : Integer;
begin
  S:= '';  // Inicializa valor da variavel.
  OpenDialog1.InitialDir:='c:\';
  OpenDialog1.Filter:='txt';
  try
    DMOracle.DBCemapa.StartTransaction;
    if OpenDialog1.Execute then
    begin
      AssignFile(F, OpenDialog1.FileName);   {Pega arquivo selecionado em dialogo box}
      reset(F);
      Readln(F,S);
      While Trim(copy(S,1,6)) <> '' Do
       Begin
        If (DMOracle.BuscaNome('SELECT COD_PEDIDO_CAB FROM TB_PEDIDO_CAB','COD_CADASTRO='+IntToStr(StrToInt(copy(S,25,6)))+' And COD_FILIAL=1 And '+ ' NUM_PEDIDO='+IntToStr(StrToInt(copy(S,19,6))))) <> '' Then
           Readln(F,S)
        Else
          With DMImporta Do
          Begin
             QPedido.Open;
             QPedidoItem.Open;
             wUf:=DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO='+copy(S,25,6));
             wTrib:=DMOracle.BuscaNome('SELECT PERC_TRIBUTACAO FROM TB_ESTADO','COD_ESTADO='+chr(39)+wUf+chr(39));
             wBrinde:=DMOracle.BuscaNome('SELECT IND_BRINDE FROM TB_OPERACAO','COD_OPERACAO='+Trim(copy(S,1,6)));
             wBonificacao:=DMOracle.BuscaNome('SELECT IND_BONIFICAÇAO FROM TB_OPERACAO','COD_OPERACAO='+Trim(copy(S,1,6)));
             QPedido.Insert;
             QPedidoCod_Filial.Value:=1;
             QPedidoCod_Departamento.Value:=1;
             QPedidoCod_Operacao.Value:=StrToInt(trim(copy(S,1,6)));
             QPedidoCod_Vendedor.Value:=StrToInt(trim(copy(S,13,6)));
             QPedidoCod_Cadastro.Value:=StrToInt(trim(copy(S,25,6)));
             QPedidoNum_Palm.Value:=StrToInt(trim(copy(S,19,6)));
             QPedidoNum_Pedido.Value:=DMSequencia.Sequencia(1,'PEDIDO');
             QPedidoDt_Emissao.Value:=StrToDate(copy(S,7,2)+'/'+copy(S,9,2)+'/'+copy(S,11,2));
             QPedidoDt_Entrega.Value:=StrToDate(copy(S,153,2)+'/'+copy(S,155,2)+'/'+copy(S,157,2));
             QPedidoDt_Sistema.Value:=DMOracle.DataHoraServ;
             QPedidoDesc_Observacao.Value:=copy(S,93,60);
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
            QPedidoCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;
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
               (QPedidoCod_Operacao.Value = 911) Or
               (QPedidoCod_Operacao.Value = 914) Or
               (QPedidoCod_Operacao.Value = 36) Or
               (QPedidoCod_Operacao.Value = 136) Then
               QPedidoPerc_Comissao.Value := 0
            Else
               QPedidoPerc_Comissao.Value := (StrToFloat(trim(copy(S,160,4))))/100;
//            End;
            QPedido.Post;

            while (QPedidoCod_Cadastro.Value =StrToInt(copy(S,25,6))) And (QPedidoNum_Palm.Value=StrToInt(copy(S,19,6))) do
            begin
              QPedidoItem.Insert;
              QPedidoItemCod_Pedido_Cab.Value := QPedidoCod_Pedido_Cab.Value;
              QPedidoItemCod_Produto.Value := StrToInt(trim(copy(S,49,6)));
              QPedidoItemQt_Pedido.Value := StrToFloat(trim(copy(S,55,8)))/1000;
              QPedidoItemVal_Unitario.Value := StrToFloat(trim(copy(S,63,8)))/1000;
              QPedidoItemCod_Tributacao.Value := Trunc(StrToFloat(wTrib));
              QPedidoItemCod_Lote_Tipo.Value := 1;
              QPedidoItemQt_Atendido.Value := 0;
              QPedidoItemQt_Cancelado.Value := 0;
              QPedidoItemPerc_Desconto.Value := 0;
              If DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE' Then
               Begin
              {  DMProduto.Qproduto.Close;
                 DMProduto.QProduto.SetVariable('PK',trim(copy(S,49,6)));
                 DMProduto.Qproduto.Open;
                 DMClasse.QClasse.Close;
                 DMClasse.QClasse.SetVariable('PK',DMProduto.QProdutoCod_Classe.Value);
                 DMClasse.QClasse.Open;
              }
                If (wBonificacao = 'S') Or
                   (wBrinde = 'S') Or
                   (QPedidoCod_Operacao.Value = 911) Or
                   (QPedidoCod_Operacao.Value = 914) Or
                   (QPedidoCod_Operacao.Value = 36) Or
                   (QPedidoCod_Operacao.Value = 136) Then
                   QPedidoItemPerc_Comissao.Value := 0
                Else
                   QPedidoItemPerc_Comissao.Value := (StrToFloat(trim(copy(S,160,4))))/100;
              {
                 If (QPedidoCod_Vendedor.Value = 88) Then
                  Begin
                    QPedidoItemPerc_Comissao.Value := 5.33;
                    If DMClasse.QClasseInd_Tipo.Value = 'DANDI' Then
                       QPedidoItemPerc_Comissao.Value := 3.55;
                  End;
                 If (QPedidoCod_Vendedor.Value = 99) And
                    (DMClasse.QClasseInd_Tipo.Value = 'LAMINADO') Then
                     QPedidoItemPerc_Comissao.Value := 6;

                 IF (QPedidoCod_Vendedor.Value = 133) And
                    (DMClasse.QClasseInd_Tipo.Value = 'LAMINADO') Then
                     QPedidoItemPerc_Comissao.Value := 7;

                 If (QPedidoCod_Vendedor.Value = 147) And
                    (DMClasse.QClasseInd_Tipo.Value = 'LAMINADO') Then
                     QPedidoItemPerc_Comissao.Value := 6;

                 If (QPedidoCod_Vendedor.Value = 151) Then
                     QPedidoItemPerc_Comissao.Value := 6;

                 If (QPedidoCod_Vendedor.Value = 153) And
                    (DMClasse.QClasseInd_Tipo.Value = 'LAMINADO') Then
                     QPedidoItemPerc_Comissao.Value := 6;

                 If (QPedidoCod_Vendedor.Value = 179) Then
                     QPedidoItemPerc_Comissao.Value := 6;

                 If (QPedidoCod_Vendedor.Value = 200) Then
                     QPedidoItemPerc_Comissao.Value := 6;
               }
               End;
              QPedidoItem.Post;
              Readln(F,S);
              If Trim(copy(S,1,6)) = '' Then
                 Break;
            End;
         End;
       End;
    End;
    showmessage('Importação encerrada com Sucesso');
    DMOracle.DBCemapa.Commit;
  except
    showmessage('Erro na importação');
    DMOracle.DBCemapa.Rollback;
    Raise;
  end;
End;

end.
