unit ULimpezaNotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, UFmOperacao, UFmDatas, UFmFilial,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  UFmCadastro;

type
  TFLimpezaNotas = class(TFTCadSimples)
    FmFilial: TFmFilial;
    FmDatas: TFmDatas;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FmOperacao: TFmOperacao;
    RGTipoPagamento: TRadioGroup;
    FmCadastro1: TFmCadastro;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLimpezaNotas: TFLimpezaNotas;

implementation

uses UOracle_cl, ULimpezaNotas_cl;

{$R *.dfm}

procedure TFLimpezaNotas.BitBtn1Click(Sender: TObject);
Var wCont : Integer;
begin
  inherited;
  If Trim(FmDatas.MeDtInicial.Text) = '' Then
     Raise Exception.Create('Preencher Data Inicial');

  If Trim(FmDatas.MeDtFinal.Text) = '' Then
     Raise Exception.Create('Preencher Data Final');
  If Trim(FmOperacao.MeOperacao.Text) = '' Then
     Raise Exception.Create('Preencher Operação');
  If DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO','COD_OPERACAO = '+Trim(FmOperacao.MeOperacao.Text)) = 'F' Then
     Raise Exception.Create('Está Operação Emite Nota Fiscal - Não é Permitido Excluir');


  With DMLimpezaNotas do
  Begin
    QLimpezaNotaCab.Close;
    If Trim(FmFilial.MeFilial.Text) = '' Then
       QLimpezaNotaCab.SetVariable('Cod_Filial',Null)
    Else
       QLimpezaNotaCab.SetVariable('Cod_Filial',StrToInt(Trim(FmFilial.MeFilial.Text)));
    If Trim(FmOperacao.MeOperacao.Text) = '' Then
       QLimpezaNotaCab.SetVariable('Cod_Operacao',Null)
    Else
       QLimpezaNotaCab.SetVariable('Cod_Operacao',StrToInt(Trim(FmOperacao.MeOperacao.Text)));
    Case RGTipoPagamento.ItemIndex of
      0: QLimpezaNotaCab.SetVariable('IND_PAGAMENTO', 1); //A VISTA
      1: QLimpezaNotaCab.SetVariable('IND_PAGAMENTO', 2); //A PRAZO
      2: QLimpezaNotaCab.SetVariable('IND_PAGAMENTO', 3); //OUTROS
      3: QLimpezaNotaCab.SetVariable('IND_PAGAMENTO', null);
    End;
    if Trim(FmCadastro1.MeCadastro.Text) <> '' then
      QLimpezaNotaCab.SetVariable('COD_CADASTRO',Trim(FmCadastro1.MeCadastro.Text))
    else
      QLimpezaNotaCab.SetVariable('COD_CADASTRO',Null);
    QLimpezaNotaCab.SetVariable('Dt_Inicial',Trim(FmDatas.MeDtInicial.Text));
    QLimpezaNotaCab.SetVariable('Dt_Final',Trim(FmDatas.MeDtFinal.Text));

    QLimpezaNotaCab.Open;
    QLimpezaNotaItem.Open;
    QCaixaNotaCab.Open;
    QBaixaPedido_Item.Open;
    QBaixaOC.Open;
    QContaReceberCab.Open;
    QContaReceberMov.Open;
    QCaixa_Mov_CR.Open;
    QBanco_Mov_CR.Open;
    QContaPagarCab.Open;
    QContaPagarMov.Open;
    QCaixa_Mov_CP.Open;
    QBanco_Mov_Cp.Open;
    QNome_Nota.Open;
    Try
      DMOracle.DBCemapa.StartTransaction;
      While not(QLimpezaNotaCab.Eof) Do
       Begin
         If QLimpezaNotaCabInd_Condicao_Pagto.Value = '2' Then
          Begin  // esta parte da rotina serve para verificar se a nota é a prazo e tem alguma parcela em aberto - caso tenha não exclui nada
            If QLimpezaNotaCabInd_Entrada_Saida.Value = 'E' Then
               wCont := StrToInt('0'+ DMOracle.BuscaNome('SELECT Count(*) FROM TB_Conta_Pagar_Cab','IND_SITUACAO <> '+ QuoteDStr('BAIXA TOTAL') +' And Cod_Nota_Cab = ' + QLimpezaNotaCabCod_Nota_Cab.Text))
            Else
               wCont := StrToInt('0'+ DMOracle.BuscaNome('SELECT Count(*) FROM TB_Conta_Receber_Cab','IND_SITUACAO <> '+ QuoteDStr('BAIXA TOTAL') +' And Cod_Nota_Cab = ' + QLimpezaNotaCabCod_Nota_Cab.Text));
            If wCont > 0 Then
             Begin
               QLimpezaNotaCab.Next;
               Continue;
             End;
          End;
         While not(QCaixaNotaCab.Eof) Do
           QCaixaNotaCab.Delete; //limpeza do caixa gerado pela inclusao de uma nota fiscal
         While not(QContaReceberCab.Eof) Do // exclui lancamentos gerados no Contas a Receber
          Begin
            While not(QContaReceberMov.Eof) Do
             Begin
               While not(QCaixa_Mov_CR.Eof) Do
                 QCaixa_Mov_CR.Delete; //limpeza do caixa gerado pela baixa de um titulo

               While not(QBanco_Mov_CR.Eof) Do
                Begin
                  While not(QLimpezaCaixa_Banco_CR.Eof) Do // limpeza do caixa gerado pela baixa de um titulo por banco que gera caixa
                      QLimpezaCaixa_Banco_CR.Delete;
                  QBanco_Mov_CR.Delete; //limpeza do banco gerado pela baixa de um titulo
                End;
               QContaReceberMov.Delete; //limpeza do banco gerado pela baixa de um titulo
             End;
            QContaReceberCab.Delete; // limpeza dos movimentos do titulo
          End;

         While not(QContaPagarCab.Eof) Do   // exclui lancamentos gerados no Contas a Pagar
          Begin
            While not(QContaPagarMov.Eof) Do
             Begin
               While not(QCaixa_Mov_CP.Eof) Do
                 QCaixa_Mov_CP.Delete; //limpeza do caixa gerado pela baixa de um titulo

               While not(QBanco_Mov_Cp.Eof) Do
                Begin
                  While not(QBanco_Mov_Cp.Eof) Do // limpeza do caixa gerado pela baixa de um titulo por banco que gera caixa
                    QLimpezaCaixa_Banco_CP.Delete;
                  QBanco_Mov_Cp.Delete; //limpeza do banco gerado pela baixa de um titulo
                End;
               QContaPagarMov.Delete; //limpeza do banco gerado pela baixa de um titulo
             End;
            QContaPagarCab.Delete; // limpeza dos movimentos do titulo
          End;
         while not(QNome_Nota.Eof) do
           QNome_Nota.Delete;    //limpeza da tb_nome_nota utilizado para emitir PE sem ter cliente cadastrado.
         While not(QLimpezaNotaItem.Eof) Do   // exclui lancamentos gerados nos Itens e nota fiscal
          Begin
            While not(QBaixaPedido_Item.Eof) Do
              QBaixaPedido_Item.Delete; //limpeza da baixa de pedido por nota

            While not(QBaixaOC.Eof) Do
               QBaixaOC.Delete; //limpeza da baixa da ordem de compra por nota

            QLimpezaNotaItem.Delete; // limpeza dos movimentos do itens da nota fiscal
          End;


         QLimpezaNotaCab.Delete; // exclui a nota fiscal
       End;
      DMOracle.DBCemapa.Commit;
      ShowMessage('Limpeza Efetuada com Sucesso');
    Except
      DMOracle.DBCemapa.RollBack;
      ShowMessage('Limpeza não efetuada !!!!!');
    End;
    QLimpezaNotaCab.Close;
    QLimpezaNotaItem.Close;
    QCaixaNotaCab.Close;
    QBaixaPedido_Item.Close;
    QBaixaOC.Close;
    QContaReceberCab.Close;
    QContaReceberMov.Close;
    QCaixa_Mov_CR.Close;
    QBanco_Mov_CR.Close;
    QContaPagarCab.Close;
    QContaPagarMov.Close;
    QCaixa_Mov_CP.Close;
    QBanco_Mov_Cp.Close;

  End;

end;

end.
