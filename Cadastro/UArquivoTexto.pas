unit UArquivoTexto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls, Grids, DBGrids, Db, Printers;

type
  TFArquivoTexto = class(TForm)
    Panel1: TPanel;
    BtSalvar: TBitBtn;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    BTCarregar: TButton;
    BtBaixa: TBitBtn;
    procedure BtSalvarClick(Sender: TObject);
    procedure BTCarregarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtBaixaClick(Sender: TObject);
  private
    { Private declarations }
    FTipo:String;
    procedure ConsisteDados(Reg:integer; Var Tit,CC:String);
    procedure BxaTitArqRemessa();
  public
    { Public declarations }
    Property Tipo : String read FTipo write FTipo;
  end;

var
  FArquivoTexto: TFArquivoTexto;
  x:TStream;
  Tit, CC, c_banco:String;

implementation

uses UArquivosRW, UOracle_cl, UContasReceber_cl, UPlanilha_cl,
  UBancoAgencia_cl, UUsuario_cl, UContasReceberGeraArqTexto,
  UParamSistema_cl, UCaixa_cl, UBiblioteca, UFinalidade_cl, UEmiteRecibo,
  UContasReceberBaixa, UFilial_cl;

{$R *.DFM}

procedure TFArquivoTexto.BtSalvarClick(Sender: TObject);
begin
  ArquivoGen.Grava(Memo1,Tipo,'C:');
  if Tipo = 'BB' then
    If DMOracle.DBCemapa.intransaction then
      DMOracle.DBCemapa.Commit;
end;

procedure TFArquivoTexto.BTCarregarClick(Sender: TObject);
begin
 if OpenDialog1.Execute then
  Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TFArquivoTexto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback;
end;

procedure TFArquivoTexto.BtBaixaClick(Sender: TObject);
var
  i,wCont : integer;
  x, CC, wRECUSA : String;
begin
  DMOracle.DBCemapa.StartTransaction;

  wCont := 1;    // Inicializa valor para salto de linha-relatório de erros

  for i:=2 to Memo1.Lines.Count-1 do
    begin
      x:=ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,24,i);
      if StrToFloat(x)<>3 then         // Comando não recusado.
        begin
          if StrToInt(x) in [5,6,7,8,15] then
            begin
              Try
                ConsisteDados(i,Tit,CC);
                If Trim(Tit) <> '' Then
                   BxaTitArqRemessa();          // Baixa titulo arquivo-retorno de remessa.
              except
                DMOracle.DBCemapa.RollBack;
                raise Exception.create('Erro! Transação não efetuada');
              end;
            end;
        end
      else
        Begin
         x:=ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,14,2);

         case StrToInt(x) of
         1 : wRECUSA := 'Identificação inválida' ;
         2 : wRECUSA := 'Variação da carteira inválida';
         3 : wRECUSA := 'Valor de juros por um dia';
         4 : wRECUSA := 'Valor de desconto inválido';
         5 : wRECUSA := 'Espécie de titulo inválida para carteira/variação';
         6 : wRECUSA := 'Espécie de valor variavel inválido';
         7 : wRECUSA := 'Prefixo da agência usuária inválido';
         8 : wRECUSA := 'Valor do titulo/apólice inválido';
         9 : wRECUSA := 'Data de vencimento inválida';
         10: wRECUSA := 'Fora do prazo(só admissivel na carteira 11)';
         11: wRECUSA := 'Inexistência de margem para desconto';
         12: wRECUSA := 'O Banco não tem agência na praça do sacado';
         13: wRECUSA := 'Razões cadastrais';
         14: wRECUSA := 'Sacado interligado com o sacador(só admissivel em cobrança simples-cart.11 e 17)';
         15: wRECUSA := 'Titulo sacado contra órgão do Poder Publico(só admissivel na cart.11 e sem ordem de protesto)';
         16: wRECUSA := 'Títulos preenchidos de forma irregular';
         17: wRECUSA := 'Título rasurado';
         18: wRECUSA := 'Endereço do sacado não localizado ou incompleto';
         19: wRECUSA := 'Código do cedente inválido';
         20: wRECUSA := 'Nome/endereço do cliente não informado(ECT)';
         21: wRECUSA := 'Carteira inválida';
         22: wRECUSA := 'Quantidade de valor variável inválida';
         23: wRECUSA := 'Faixa nosso número execedida';
         24: wRECUSA := 'Valor do abatimento inválido';
         25: wRECUSA := 'Novo número do título dado pelo cedente';
         26: wRECUSA := 'Valor do IOF de seguro invalido';
         27: wRECUSA := 'Nome do sacado/cedente inválido ou não informado';
         28: wRECUSA := 'Data do novo vencimento inválida';
         29: wRECUSA := 'Endereço não informado';
         30: wRECUSA := 'Registro de título já liquidado(carteira 17 tipo 4)';
         31: wRECUSA := 'Número de borderô inválido';
         32: wRECUSA := 'Nome da pessoa autorizada inválido';
         33: wRECUSA := 'Nosso número já existe';
         34: wRECUSA := 'Número da prestação do contrato inválido';
         35: wRECUSA := 'Percentual de desconto inválido';
         36: wRECUSA := 'Dias para fichamento de protesto invalido';
         37: wRECUSA := 'Data de emissão do titulo inválido';
         38: wRECUSA := 'Data do vencimento anterior à data da emissão do titulo';
         39: wRECUSA := 'Comando de alteração indevido para carteira';
         40: wRECUSA := 'Tipo de moeda inválido';
         41: wRECUSA := 'Abatimento não permitido';
         42: wRECUSA := 'CEP do sacado inválido';
         43: wRECUSA := 'Código de unidade variável incompativel com a data de emissão do título';
         44: wRECUSA := 'Dados para debito ao sacado inválidos';
         45: wRECUSA := 'Carteira/variação encerrada';
         46: wRECUSA := 'Convênio encerrado';
         47: wRECUSA := 'Título tem valor diverso do informado';
         48: wRECUSA := 'Motivo de baixa inválido para carteira';
         49: wRECUSA := 'Abatimento a cancelar não consta do título';
         50: wRECUSA := 'Comando incompativel com a carteira';
         51: wRECUSA := 'Código do convenente inválido';
         52: wRECUSA := 'Abatimento igual ou maior que o valor do título';
         53: wRECUSA := 'Título já se encontra na situação pretendida';
         54: wRECUSA := 'Título fora do prazo admitido para a conta 1';
         55: wRECUSA := 'Novo vencimento fora dos limites da carteira';
         56: wRECUSA := 'Título não pertence ao convenente';
         57: wRECUSA := 'Variação incompativel com a carteira';
         58: wRECUSA := 'Impossivel a transferência para carteira indicada';
         59: wRECUSA := 'Título vencido em transferência para a carteira 51';
         60: wRECUSA := 'Título com prazo superior a 179 dias em transferência para cart.51';
         61: wRECUSA := 'Título já foi fichado para protesto';
         62: wRECUSA := 'Alteração da situação de debito inválida para o código de responsabilidade';
         63: wRECUSA := 'DV do nosso número inválido';
         64: wRECUSA := 'Título não passivel de débito/baixa-situação anormal';
         65: wRECUSA := 'Título com ordem de não protestar-não pode ser encaminhado à cartório';
         80: wRECUSA := 'Nosso número inválido';
         81: wRECUSA := 'Data para concessão de desconto invalida';
         82: wRECUSA := 'CEP do sacado inválido';
         83: wRECUSA := 'Carteira/variação não localizada no cedente';
         84: wRECUSA := 'Título não localizado na existência';
         99: wRECUSA := 'Outros motivos';
         end;

         // Inicia impressao dos erros \\
         if Imp = Nil Then
            Imp := TImp.Create;
            Imp.AbreImpressora;

         if wCont = 1 then
            begin
              Imp.WriteXY(6.5,wCont,'R E L A T O R I O   D E   E R R O S  - CBR643-RETORNO    -    Data: '+DateTimeToStr(Now));
              // Imp.WriteXY(75,wCont,);
              wCont := wCont+2;
              Inc(wCont);
              // Imp.WriteXY(1,wCont,'Razao Social: '+QrRomEmissaoDESC_FILIAL.Text);
              // Inc(wCont);
              Imp.WriteXY(1,wCont,'Titulo     Cliente   Nº Registro    Cmd. de Recusa    Mensagem');
              Inc(WCont);
              Imp.WriteXY(1,wCont,'----------------------------------------------------------------------------------------------------------');
              Inc(WCont);
            end;
            Imp.WriteXY(5,wCont,ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,26,10)+' '+
                                ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,06,8)+' '+IntToStr(i)+'                   '+x+'           '+wRECUSA);
            Inc(WCont);
            if wCont >= 66 then
               begin
                Imp.SaltaPagina;
                wCont := 1;
               end;
        end;
       // ShowMessage('Registro nº '+IntToStr(i)+' Comando recusado-Erro '+x+' '+wRECUSA)

    end;
    Imp.SaltaPagina;
    Imp.FechaImpressora;  // Finaliza os serviços de Impressao}

    DMOracle.DBCemapa.Commit;
end;


procedure TFArquivoTexto.ConsisteDados(Reg: integer; Var Tit,CC:String);
Var
  x,y,cod_filial,cod_cadastro,nr_titulo,parc:String;
begin
  try
//  x           :=ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,9,Reg);
    x           :=ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,10,2);
    y           :=ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,11,2);
//   cod_filial  :=Copy(x,1,2);
//   cod_cadastro:=Copy(x,3,7);
//   nr_titulo   :=Copy(x,10,6);
//   parc        :=Copy(x,16,2);

// Tit         :=DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB','COD_FILIAL = '+COD_FILIAL+' AND COD_CADASTRO = '+COD_CADASTRO+
//              ' AND NUM_TITULO = '+NR_TITULO+' AND NUM_PARCELA = '+PARC);
   Tit         :=DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB','COD_NOSSO_NUMERO = '+ CHR(39) + Trim(X) + Trim(Y)+ CHR(39));

//   c_banco     :=DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_AGENCIA = '+ArquivoBB.LeArquivoRetorno('HEADER',Memo1,7,2)+
//                ' AND DIGITO_VERIFICADOR_AGENCIA = '+ArquivoBB.LeArquivoRetorno('HEADER',Memo1,8,2));
//   CC          :=DmOracle.BuscaNome('SELECT COD_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','NUM_CONTA_CORRENTE = '+ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,6,Reg)+
//                                     ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,7,Reg));

//   DMBancoAgencia.QBancoAgencia.Close;
//   DMBancoAgencia.QBancoAgencia.ParamByName('PK').AsFloat := StrToFloat(c_Banco);
//   DMBancoAgencia.QBancoAgencia.Open;

  except
    Raise;
  end;

end;

procedure TFArquivoTexto.BxaTitArqRemessa();
Var
  wValor_Juro,wValor_Desconto,wValor_Baixa,wPagto_Juro:Real;
  wValor_Teste,wFilial_Contabil:Real;
  wCodDoc,wFilial,wCodCompl,wVlrLancto :Real;
  wNumDoc,wContaCred,wCodHistorico, wContaDeb:String;
  wDtLancto:TDateTime;

begin
  wValor_Juro:=0;
  wValor_Desconto:=0;
  wValor_Baixa:=0;
  wPagto_Juro:=0;

  DMBancoAGencia.QBancoAgencia.Close;
  DMBancoAgencia.QBancoAgencia.ParamByName('PK').AsFloat := DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value;
  DMBancoAGencia.QBancoAgencia.Open;
  CC := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Text;
  with DMContasReceber do
  begin
    QContasReceber_Cab.Close;
    QContasReceber_Cab.ParamByName('PK').AsFloat :=StrToFloat(Tit);
    QContasReceber_Cab.Open;

    DMFinalidade.QFinalidade.Close;
    DMFinalidade.QFinalidade.ParamByName('PK').AsFloat:=DMContasReceber.QContasReceber_CabCOD_FINALIDADE.Value;
    DMFinalidade.QFinalidade.Open;

    if (Trim(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,41,12))<>'') and
       (Trim(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,41,12))<>'0') then
       wValor_Baixa := StrToFloat(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,41,12));

      if (Trim(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,42,12))<>'') and
         (Trim(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,42,12))<>'0') then
      begin
       wValor_Juro := StrToFloat(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,42,12));
       wPagto_Juro := StrToFloat(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,42,12));
      end;

      if (Trim(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,40,12))<>'') and
         (Trim(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,40,12))<>'0') then
         wValor_Desconto:=StrToFloat(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,40,12))+
                          StrToFloat(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,39,12));

      wValor_Teste := Trunc((StrToFloat(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,29,12))+
                             StrToFloat(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,42,12))-
                             wValor_Juro-wValor_Baixa)*100)/100;

      if (wValor_Teste >= 0) and ((wValor_Baixa<>0) or (wValor_Juro<>0)) then
      begin   // Se o Lançamento não vai gerar um valor negativo.
      try
        DMOracle.DBCemapa.StartTransaction; // Inicia a transação

        //Inclui no Movimento o Juro no movimento contas a receber
        if wValor_Juro>0 then
        begin
          QContasReceberBaixaMov.Insert;
          QContasReceberBaixaMovVal_Movimento.Value:=wValor_Juro;
          QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,25,6));
          // QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
          QContasReceberBaixaMovInd_Tipo_Movimento.Value:='JUROS';
          QContasReceberBaixaMov.Post;
        end;

        // Inclui no Movimento o Pagamento do Juro
        if wPagto_Juro>0 then
        begin
          QContasReceberBaixaMov.Insert;
          QContasReceberBaixaMovVal_Movimento.Value:=wPagto_Juro;
          QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,34,6));
          //QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
          QContasReceberBaixaMovInd_Tipo_Movimento.Value:='RECEBTO. JUROS';
        end;
        if not(DMFinalidade.QFinalidadeCod_Historico_Cheque.isNull) then
        begin
          DMBancoAgencia.QBancoMovimento.Insert;
          DMBancoAgencia.QBancoMovimentoCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;
          DMBancoAgencia.QBancoMovimentoDT_Usuario.Value:=DMOracle.DataHoraServ;
          DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value:=StrToFloat(CC);
          //DMBancoAgencia.QBancoMovimentoCod_Historico.Value:=QContasReceberBaixaCod_Historico_Cheque.Value;
          DMBancoAgencia.QBancoMovimentoDT_Movimento.value:=StrToDate(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,25,6));
          DMBancoAgencia.QBancoMovimentoVal_Movimento.value:=wPagto_Juro;
//          DMBancoAgencia.QBancoMovimentoNum_Cheque.value:=DMBancoAgencia.QContaCorrenteNUM_CHEQUE.Value;
          DMBancoAgencia.QBancoMovimentoCod_Cadastro.value:=DMContasReceber.QContasReceber_CabCOD_CADASTRO.Value;
          DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value:=DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
          {DMBancoAgencia.QBancoMovimentoDesc_Observacao.Value:=QContasReceberBaixaNome.Value;}
          DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value:='Título :'+FloatToStr(QContasReceber_CabNUM_TITULO.Value)+' Parcela: '+FloatToStr(QContasReceber_CabNUM_PARCELA.Value);
          DMBancoAgencia.QBancoMovimento.Post;
          QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
        end;

        If DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' Then
        begin
          wCodDoc:=QContasReceber_CabCod_Conta_Receber_Cab.Value;
          wNumDoc:=FloatToStr(QContasReceber_CabNum_Titulo.Value);
          wFilial:=QContasReceber_CabCod_Filial.Value;
          wFilial_Contabil:=QContasReceber_CabCod_Filial.Value;
          wContaCred:=DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_JURO_CRED FROM TB_FINALIDADE','COD_FINALIDADE ='+FloatToStr(QContasReceber_CabCod_Finalidade.Value));
          wContaDeb:=DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Juro_Bco_Deb.Value;
          if wFilial <> 1  Then
             wFilial_Contabil  := 1;

          wCodCompl:=QContasReceber_CabCod_Cadastro.Value;
          wCodHistorico:=DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_FINALIDADE','COD_FINALIDADE ='+FloatToStr(QContasReceber_CabCod_Finalidade.Value));
          wVlrLancto:=wPagto_Juro;
          if (wContaCred <> '') and (wContaDeb  <> '') then
          begin
            wDtLancto:=StrToDate(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,25,6));
            DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,StrToFloat(wCodHistorico),wVlrlancto,wDTLancto,wContaDeb);
            QContasReceberBaixaMovCOD_LANCTO_CONTABIL_CRED.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
            DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,StrToFloat(wCodHistorico),wVlrlancto,wDTLancto,wContaCred);
            QContasReceberBaixaMovCOD_LANCTO_CONTABIL_DEB.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
          End;
        end;
        QContasReceberBaixaMov.Post;
        // FINAL BEGIN JUROS

        //Inclui no Movimento a Baixa
        if wValor_Baixa>0 then
        begin
          QContasReceberBaixaMov.Insert;
          QContasReceberBaixaMovVal_Movimento.Value:=wValor_Baixa - wValor_Desconto;
          QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,25,6));
          //QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
          QContasReceberBaixaMovInd_Tipo_Movimento.Value:='RECEBTO. PRINCIPAL';

          if not(DMFinalidade.QFinalidadeCod_Historico_Cheque.isNull) then
          begin
            DMBancoAgencia.QBancoMovimento.Insert;
            DMBancoAgencia.QBancoMovimentoCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;
            DMBancoAgencia.QBancoMovimentoDT_Usuario.Value:=DMOracle.DataHoraServ;
            //DMBancoAgencia.QBancoMovimentoCod_Historico.Value:=QContasReceberBaixaCod_Historico_Cheque.Value;
            DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value:=StrToFloat(CC);
            DMBancoAgencia.QBancoMovimentoDT_Movimento.value:=StrToDate(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,25,6));
            //   If DmParamSistema.QParamSistemaInd_Tipo_Integracao.Value='C' Then  // INTEGRAÇÃO CONTABIL VIA CAIXA
            //      DMBancoAgencia.QBancoMovimentoVal_Movimento.value:=wValor_Baixa
            //   Else
            DMBancoAgencia.QBancoMovimentoVal_Movimento.value:=wValor_Baixa - wValor_Desconto;
//            DMBancoAgencia.QBancoMovimentoNum_Cheque.value:=DMBancoAgencia.QContaCorrenteNUM_CHEQUE.Value;
            DMBancoAgencia.QBancoMovimentoCod_Cadastro.value:=DMContasReceber.QContasReceber_CabCOD_CADASTRO.Value;
            DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value:=DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
            {DMBancoAgencia.QBancoMovimentoDesc_Observacao.Value:=QContasReceberBaixaNome.Value;}
            DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value:='Título :'+FloatToStr(QContasReceber_CabNUM_TITULO.Value)+' Parcela: '+FloatToStr(QContasReceber_CabNUM_PARCELA.Value);
            DMBancoAgencia.QBancoMovimento.Post;
            QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
          end;

          // Inclusão do Lançamento Contábil
          if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' Then
          begin
            wCodDoc:=QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
            wNumDoc:=FloatToStr(QContasReceber_CabNum_Titulo.Value);
            wFilial:=QContasReceber_CabCod_Filial.Value;
            wFilial_Contabil:=QContasReceber_CabCod_Filial.Value;
            wContaCred:=DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_BAIXA_CRED FROM TB_FINALIDADE','COD_FINALIDADE ='+FloatToStr(QContasReceber_CabCod_Finalidade.Value));
            wContaDeb:=DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Prin_Bco_Deb.Value;
            if wFilial <> 1  Then
               wFilial_Contabil  := 1;
            wCodCompl:=QContasReceber_CabCod_Cadastro.Value;
            wCodHistorico:=DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_FINALIDADE','COD_FINALIDADE ='+FloatToStr(QContasReceber_CabCod_Finalidade.Value));
            wVlrLancto:=wValor_Baixa;
            if (wContaCred <> '') and (wContaDeb  <> '') then
            begin
              wDtLancto:=StrToDate(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,25,6));
              DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,StrToFloat(wCodHistorico),wVlrlancto,wDTLancto,wContaDeb);
              QContasReceberBaixaMovCod_lancto_contabil_Cred.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
              DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,StrToFloat(wCodHistorico),wVlrlancto,wDTLancto,wContaCred);
              QContasReceberBaixaMovCod_lancto_contabil_Deb.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
            end;
          End;
          QContasReceberBaixaMov.Post;

        end; // Termino da Inclusão dos Movimentos de Baixa

        if wValor_Desconto>0 then
        begin     //Inclui no Movimento o Desconto
          QContasReceberBaixaMov.Insert;
          QContasReceberBaixaMovVal_Movimento.Value:=wValor_Desconto;
          QContasReceberBaixaMovDt_Movimento.Value:=StrToDate(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,25,6));
          //QContasReceberBaixaMovDesc_Observacao.Value:=MEObservacao.Text;
          QContasReceberBaixaMovInd_Tipo_Movimento.Value:='DESC. CONCEDIDO';

          // Inclusão no Movimento Bancário
          if not(DMFinalidade.QFinalidadeCOD_HISTORICO_DESC.IsNull) then
          begin
            DMBancoAgencia.QBancoMovimento.Insert;
            DMBancoAgencia.QBancoMovimentoCod_Usuario.Value:=DMUsuario.CodUsuarioCorrente;
            DMBancoAgencia.QBancoMovimentoCod_Historico.Value:=DMFinalidade.QFinalidadeCOD_HISTORICO_JURO.Value;
            DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value:=StrToFloat(CC);
//            DMBancoAgencia.QBancoMovimentoNum_Cheque.Value:=DMBancoAgencia.QContaCorrenteNUM_CHEQUE.Value;
            DMBancoAgencia.QBancoMovimentoDT_Movimento.Value:=StrToDate(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,25,6));
            DMBancoAgencia.QBancoMovimentoDT_Usuario.Value:=DMOracle.DataHoraServ;
            DMBancoAgencia.QBancoMovimentoVal_Movimento.Value:=wValor_Desconto;
            DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.Value:=DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
            DMBancoAgencia.QBancoMovimento.Post;
            QContasReceberBaixaMovCod_Bco_Movimento.Value:=DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
          end;
          if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' Then
          begin
            wCodDoc:=QContasReceber_CabCod_Conta_Receber_Cab.Value;
            wNumDoc:=FloatToStr(QContasReceber_CabNum_Titulo.Value);
            wFilial:=QContasReceber_CabCod_Filial.Value;
            wFilial_Contabil:=QContasReceber_CabCod_Filial.Value;
            wContaCred:=DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Desc_Bco_Cred.Value;
            If wFilial <> 1  Then
               wFilial_Contabil  := 1;
            wContaDeb:=DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_DESC_DEB FROM TB_FINALIDADE','COD_FINALIDADE ='+FloatToStr(QContasReceber_CabCod_Finalidade.Value));
            wCodCompl:=QContasReceber_CabCod_Cadastro.Value;
            wCodHistorico:=DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_FINALIDADE','COD_FINALIDADE ='+FloatToStr(QContasReceber_CabCod_Finalidade.Value));
            wVlrLancto:=wValor_Desconto;;
            if (wContaCred <> '') And (wContaDeb  <> '') then
            begin
              wDtLancto:=StrToDate(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,25,6));
              DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial_Contabil,wContaCred,'CREDITO',wCodCompl,StrToFloat(wCodHistorico),wVlrlancto,wDTLancto,wContaDeb);
              QContasReceberBaixaMovCod_lancto_contabil_Cred.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
              DMPlanilha.GravaLanc('CR',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,StrToFloat(wCodHistorico),wVlrlancto,wDTLancto,wContaCred);
              QContasReceberBaixaMovCod_lancto_contabil_Deb.Value:=DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
            end;
            QContasReceberBaixaMov.Post;
          end;
        end; // Término da Inclusao do Movimento de Desconto

        // Término da Inclusão de Movimentos
        QContasReceber_Cab.Edit;
        QContasReceber_CabVAL_JUROS.Value :=0;
        QContasReceber_CabVAL_TITULO.Value:=0;
        // Muda a Situção do Título
        QContasReceber_CabDT_BAIXA.Value              :=DMOracle.DataServ;
        QContasReceber_CabIND_SITUACAO.Value          :='BAIXA TOTAL';
        QContasReceber_CabDT_CAPITALIZACAO.Value      :=StrToDate(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,34,6));
        QContasReceber_CabDT_CAPITALIZACAO_MOEDA.Value:=StrToDate(ArquivoBB.LeArquivoRetorno('DETALHE',Memo1,34,6));
        QContasReceber_Cab.Post;
        DMOracle.DBCemapa.Commit; // Fim da transação
      except
        DMOracle.DBCemapa.RollBack;
        raise exception.create('Erro! Transação não efetuada');
      end //  End If
    end
    else
        ShowMessage('Erro! Valores incorretos na Baixa. Valores Negativos não podem ser gerados, favor verificar.');
    end; // End With
end;

end.
