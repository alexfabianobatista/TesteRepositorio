unit UNotaSaida_Confirma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ComCtrls, Db, Grids, DBGrids, DBCtrls, ExtCtrls, variants, maskutils;

type
  TFNotaSaida_Confirma = class(TForm)
    PCConfirma: TPageControl;
    TSContaReceber: TTabSheet;
    TSFutura: TTabSheet;
    BtAvancar: TBitBtn;
    BtCancelar: TBitBtn;
    Label2: TLabel;
    GBCPNota: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MEDataCP: TMaskEdit;
    MEValorCP: TMaskEdit;
    BtApagaParcela: TBitBtn;
    LBContaReceber: TListBox;
    MEFinalidade: TMaskEdit;
    BtConsFinalidade: TBitBtn;
    EdFinalidade: TEdit;
    GBCPFrete: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    MEDtParcFrete: TMaskEdit;
    MEValParcFrete: TMaskEdit;
    BtApagaParcFrete: TBitBtn;
    LBContaPagarFrete: TListBox;
    MEFinalidadeFrete: TMaskEdit;
    BtConsFinalidadeFrete: TBitBtn;
    EdFinalidadeFrete: TEdit;
    Label1: TLabel;
    LFutura: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBGrid4: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid5: TDBGrid;
    BtBaixaAux: TBitBtn;
    BtCancelaBaixaAux: TBitBtn;
    MEQtBaixarAux: TMaskEdit;
    DBECod_Nota: TDBEdit;
    TSContaCorrente: TTabSheet;
    TSConfima: TTabSheet;
    Label16: TLabel;
    EdTotalNF: TEdit;
    Label18: TLabel;
    Label17: TLabel;
    Label8: TLabel;
    MEDiasCP: TMaskEdit;
    TabSheet1: TTabSheet;
    Label20: TLabel;
    Label21: TLabel;
    Label31: TLabel;
    MEDepartamento: TMaskEdit;
    BtConsDepartamento: TBitBtn;
    EdDepartamento: TEdit;
    Label22: TLabel;
    MEDepContaPagar: TMaskEdit;
    BtConsDepContaPagar: TBitBtn;
    EdDepContaPagar: TEdit;
    Label19: TLabel;
    MeBanco: TMaskEdit;
    EdBanco: TEdit;
    BtConsBanco: TBitBtn;
    Label23: TLabel;
    MePrazo: TMaskEdit;
    BtPrazo: TBitBtn;
    BitBtn1: TBitBtn;
    Label24: TLabel;
    MeBaixado: TMaskEdit;
    MeContaCorrente: TMaskEdit;
    Label25: TLabel;
    lblTotalImposto: TLabel;
    Label35: TLabel;
    Label3: TLabel;
    MeContaCorrente_Cheque: TMaskEdit;
    Label7: TLabel;
    MeDepartamento_Cheque: TMaskEdit;
    MeHistorico: TMaskEdit;
    Label26: TLabel;
    Label27: TLabel;
    MeNrCheque: TMaskEdit;
    BtDepartamento: TBitBtn;
    BtConsHistorico: TBitBtn;
    Label28: TLabel;
    MeValorCheque: TMaskEdit;
    MeDtCheque: TMaskEdit;
    Label29: TLabel;
    Label30: TLabel;
    MeObservacao: TMaskEdit;
    MeObservacao1: TMaskEdit;
    LbCheques: TListBox;
    BtInsertContaCorrente: TBitBtn;
    BtExcluiContaCorrente: TBitBtn;
    BtConsContaCorrente: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BtConsFinalidadeClick(Sender: TObject);
    procedure MEFinalidadeExit(Sender: TObject);
    procedure BtConsFinalidadeFreteClick(Sender: TObject);
    procedure MEFinalidadeFreteExit(Sender: TObject);
    procedure MEValorCPExit(Sender: TObject);
    procedure MEValParcFreteExit(Sender: TObject);
    procedure BtAvancarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtApagaParcelaClick(Sender: TObject);
    procedure BtApagaParcFreteClick(Sender: TObject);
    procedure DBECod_NotaChange(Sender: TObject);
    procedure BtBaixaAuxClick(Sender: TObject);
    procedure BtCancelaBaixaAuxClick(Sender: TObject);
    procedure MEDiasCPExit(Sender: TObject);
    procedure MEDepartamentoExit(Sender: TObject);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure MEDepContaPagarExit(Sender: TObject);
    procedure BtConsDepContaPagarClick(Sender: TObject);
    procedure BtConsBancoClick(Sender: TObject);
    procedure BtPrazoClick(Sender: TObject);
    procedure MePrazoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MeContaCorrenteExit(Sender: TObject);
    procedure BtInsertContaCorrenteClick(Sender: TObject);
    procedure BtExcluiContaCorrenteClick(Sender: TObject);
    procedure BtConsContaCorrenteClick(Sender: TObject);
    procedure BtDepartamentoClick(Sender: TObject);
    procedure BtConsHistoricoClick(Sender: TObject);
  private
    { Private declarations }
    fAtivado : Boolean;
    Procedure DoContaReceberPagar;
    Procedure Finaliza;
    Procedure SetaContaReceber;
    Function SetaGera_Futura:Boolean;
    Procedure SetaContaCorrente;
    Procedure SetaConfirma;
    Procedure AtivaPagina(pNomePagina:String);
  public
    { Public declarations }
    Property pAtivado : Boolean Read fAtivado Write fAtivado;
  end;

var
  FNotaSaida_Confirma: TFNotaSaida_Confirma;

implementation

uses UOperacao_cl, UNotaSaida_cl, UFinalidade_cl, UOracle_cl,
  UFinalidadeCons, USerie_cl, UBancoAgencia_cl, UBancosCons, URBloqueto,
  UNotaEntrada_cl, UDepartamentoCons, UDepartamento_cl, UGuiaAplicacaoParam,
  UNotaImpressao, UParamSistema_cl, UContasReceber_cl, URBoletaBB,
  URContasReceber_Duplicatas_Ab, UReceitaCad, UReceita_cl,
  URelatorioVenda_cl, UImpressoraFiscal, Ubiblioteca, UPrazoVencimentoCons,
  UPrazoVencimento_cl, UContaCorrenteCons, UPromissoria, UHistoricoCons,
  UHistorico_cl, UCadastro_cl, URContasReceber_Duplicatas_MEDIBENS;

{$R *.DFM}

procedure TFNotaSaida_Confirma.FormActivate(Sender: TObject);
var
  wCC : string;
begin
  Try
    If Not pAtivado then
    Begin
      pAtivado := True;
      BtAvancar.Enabled := True;
      BtCancelar.Enabled := True;
      DMOperacao.QOperacao.Close;
      DMOperacao.QOperacao.SetVariable('PK',DMNotaSaida.QNotaSaidaCod_Operacao.Value);
      DMOperacao.QOperacao.Open;
      If DmOperacao.QOperacaoInd_Tipo_Operacao.Value <> 'S' Then
         Raise Exception.Create ('Operação Não é de Saída');
      If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And (DMNotaSaida.QNotaSaidaCod_Departamento.Value <> 12) then
         If (DMOperacao.QOperacaoInd_Vendas.Value = 'V') And (DMNotaSaida.QNotaSaidaCod_Contrato_Vend.Text = '')  Then
          Begin
            If (DMNotaSaida.QNotaSaidaCod_Vendedor.Text = '') Or (DMNotaSaida.QNotaSaidaCod_Vendedor.Value = 0) Then
               Raise Exception.Create ('Informar Código do Vendedor');
{            If (DMNotaSaida.QNotaSaidaCod_Cultura.Text = '') Or (DMNotaSaida.QNotaSaidaCod_Cultura.Value = 0) Then
               Raise Exception.Create ('Informar Cultura');   }  
          End;
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL' Then
       Begin
         MeDepartamento.Text := '1';
         MeFinalidade.Text := '2';
       End;
      LBContaReceber.Items.Clear;
      LBCheques.Items.Clear;
      LBContaPagarFrete.Items.Clear;
      MeContaCorrente_Cheque.Clear;
      MeDepartamento_Cheque.Clear;
      MeHistorico.Clear;
      MeNrCheque.Clear;
      MeValorCheque.Clear;
      MeDtCheque.Clear;
      MeObservacao.Clear;
      MeObservacao1.Clear;
      DMNotaSaida.QItemNF.AutoCalcFields := False;
      DMNotaSaida.QNotaSaida.Edit; // Abre Transaçao
      DMNotaSaida.QNotaSaidaInd_Situacao.Value := '2'; // Confirmada
      // Gerar Caixa com o Cod_Historico_Caixa da Operacao
      DMNotaSaida.RateiaFrete;
      DMNotaSaida.AtualizaEstoque(-1);
      DMNotaSaida.IncluiNotaAux;
      DMNotaSaida.QItemNF.AutoCalcFields := True;
      EdTotalNF.Text := FloatToStr((DMNotaSaida.QSomaItemNotaSVal_Total_Nota.Value - DMNotaSaida.QNotaSaidaVal_AVista.Value));
      SetaContaCorrente;
    End;
  Except
    BtAvancar.Enabled := False;
    AtivaPagina('ERRO');
    Raise;
  End;
  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS') or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FORTE')) then
  Begin
    //wCC.Text := DMOracle.BuscaNome('SELECT DESC_AGENCIA FROM TB_CADASTRO','COD_CADASTRO ='+DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value);
    MEContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_AGENCIA FROM TB_CADASTRO','COD_CADASTRO ='+DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
    MEContaCorrenteExit(self);
  end;
  If DmParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' Then
  Begin
    FNotaSaida_Confirma.Top := 0;
  End;
end;

Procedure TFNotaSaida_Confirma.DoContaReceberPagar;
Begin
  With DMNotaSaida do
  Begin
    If ( Trim(MEDepartamento.Text) = '') and (QNotaSaidaInd_Condicao_Pagto.Value = '2') Then
      Raise Exception.Create('Departamento do Contas a Receber não informado!');
    If (DMNotaSaida.QNotaSaidaVal_Frete.Value > 0) And
       (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'AB') and
       (DMNotaSaida.QNotaSaidaInd_Tipo_Frete.Value = 'CIF') then // Contas a Pagar do Frete
    Begin
       DMNotaSaida.ValidaContaPagar(LBContaPagarFrete.Items,StrToInt(Trim(MEFinalidadeFrete.Text)));
       If Trim(MEDepContaPagar.Text) = '' Then
         Raise Exception.Create('Departamento do Contas a Pagar não informado!');
    End;
    Try
//      QItemNF.AutoCalcFields := False;
//      QNotaSaida.Edit; // Abre Transaçao
//      QNotaSaidaInd_Situacao.Value := '2'; // Confirmada
      // Gerar Caixa com o Cod_Historico_Caixa da Operacao
//      DMNotaSaida.RateiaFrete;
//      DMNotaSaida.AtualizaEstoque(-1);
//      DMNotaSaida.IncluiNotaAux;
      // AtivaPagina('CONTA_RECEBER');
//      QItemNF.AutoCalcFields := True;
      SetaGera_Futura;
    Except
      QItemNF.AutoCalcFields := True;
      AtivaPagina('ERRO');
      Raise;
    End;
  End;
End;

procedure TFNotaSaida_Confirma.FormCreate(Sender: TObject);
Var wQtdePagina : Integer;
  wAux : string;
begin
  For wQtdePagina := 0 to PCConfirma.PageCount-1 do
  Begin
    PCConfirma.Pages[wQtdePagina].TabVisible := False;
  End;
  pAtivado := False;

  

  //calcula o valor da soma dos impostos e mostra na tela de confirmacao
  wAux := '0' + DMOracle.BuscaNome('SELECT NVL(SUM(VAL_IMPOSTO),0) FROM TB_NOTA_IMPOSTO_SERVICO','COD_NOTA_CAB = ' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text);
  lblTotalImposto.Caption := FormatFloat('#,##0.00', strtofloat(wAux));

end;

procedure TFNotaSaida_Confirma.FormDeactivate(Sender: TObject);
Var wQtdePagina : Integer;
begin
  For wQtdePagina := 0 to PCConfirma.PageCount-1 do
  Begin
    PCConfirma.Pages[wQtdePagina].TabVisible := False;
  End;
end;

procedure TFNotaSaida_Confirma.BtConsFinalidadeClick(Sender: TObject);
begin
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.showModal = mrOk then
  Begin
    MEFinalidade.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    MEFinalidadeExit(Self);
  End;
end;

procedure TFNotaSaida_Confirma.MEFinalidadeExit(Sender: TObject);
begin
  If Trim(MEFinalidade.Text) <> '' Then
   Begin
     EdFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MEFinalidade.Text);
     If (DMOracle.BuscaNome('SELECT IND_LIBERADO FROM TB_FINALIDADE','COD_FINALIDADE = '+MEFinalidade.Text)) <> 'SIM' Then
      Begin
        MeFinalidade.SetFocus;
        Raise Exception.Create ('Finalidade Nao Liberada Para Uso');
      End  
   End
  Else
    EdFinalidade.Text := '';
end;

procedure TFNotaSaida_Confirma.BtConsFinalidadeFreteClick(Sender: TObject);
begin
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.showModal = mrOk then
  Begin
    MEFinalidadeFrete.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    MEFinalidadeFreteExit(Self);
  End;
end;

procedure TFNotaSaida_Confirma.MEFinalidadeFreteExit(Sender: TObject);
begin
  If Trim(MEFinalidadeFrete.Text) <> '' Then
    EdFinalidadeFrete.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MEFinalidadeFrete.Text);
end;

procedure TFNotaSaida_Confirma.MEValorCPExit(Sender: TObject);
Var wLinha, wAux : String;
Const wBranco : String = '                            ';
begin
  If (MEDataCP.Text <> '') and
     (MEValorCP.Text <> '') then
  Begin
    If StrToDate(MEDataCp.Text) < Date Then
       Raise Exception.Create('Data de Vencimento Menor que Data Atual!');
    wLinha := DateToStr( StrToDate(MEDataCP.Text) );
    wAux := FormatFloat('###,###,##0.00',StrToFloat(MEValorCP.Text));
    wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
    wLinha := wLinha + wAux;
    LBContaReceber.Items.Add(wLinha);
    MEDataCP.Text := '';
    MEValorCP.Text := '';
    MEDiasCP.SetFocus;
  End;
end;

procedure TFNotaSaida_Confirma.MEValParcFreteExit(Sender: TObject);
Var wLinha, wAux : String;
Const wBranco : String = '                            ';
begin
  If (MEDtParcFrete.Text <> '') and
     (MEValParcFrete.Text <> '') then
  Begin
    wLinha := DateToStr( StrToDate(MEDtParcFrete.Text) );
    wAux := FormatFloat('###,###,##0.00',StrToFloat(MEValParcFrete.Text));
    wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
    wLinha := wLinha + wAux;
    LBContaPagarFrete.Items.Add(wLinha);
    MEDtParcFrete.Text := '';
    MEValParcFrete.Text := '';
    MEDtParcFrete.SetFocus;
  End;
end;

procedure TFNotaSaida_Confirma.BtAvancarClick(Sender: TObject);
Var wQt_Baixa  : Real;
begin
  DMNotaSaida.QItemNF.AutoCalcfields := False;
  Try
    Case PcConfirma.ActivePage.PageIndex of
      0 : Begin
//            If Trim(MEBancoAgencia.Text) = '' Then
//              Raise Exception.Create('Banco agência não informado!');
//            If (Trim(DBLCBContaCorrente.Text) = '')
//               and (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '3') then
//              Raise Exception.Create('Conta Corrente não informada!');
            EdTotalNF.Text := FloatToStr((DMNotaSaida.QSomaItemNotaSVal_Total_Nota.Value - DMNotaSaida.QNotaSaidaVal_AVista.Value));
            If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZADIMEL') Or (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FAVILLE') Then
              If (DMNotaSaida.QNotaSaidaCOD_FILIAL.Value = 4) And (DMNotaSaida.QNotaSaidaCOD_ESTADO.Value <> 'BA') Then
                 EdTotalNF.Text := FloatToStr((DMNotaSaida.QSomaItemNotaSVal_Total_Nota.Value - DMNotaSaida.QNotaSaidaVal_AVista.Value - DMNotaSaida.QSomaItemNotaSVal_Icms_Subst.Value));
            FNotaSaida_Confirma.SetaContaReceber;
          End;
      1 : Begin // Aba de Conta Pagar    Aqui Atualiza Estoque
            FNotaSaida_Confirma.DoContaReceberPagar;
          End;
      2 : Begin   // Futura
            With DMNotaSaida do
            Begin
              QItemNF.First;
              While not QItemNF.Eof do
              Begin
                wQt_Baixa := 0;
                QBaixaAux.First;
                While not QBaixaAux.Eof do
                Begin
                  wQt_Baixa := wQt_Baixa + QBaixaAuxQt_Quantidade.Value;
                  QBaixaAux.Next;
                End;
                If wQt_Baixa <> QItemNFQt_Quantidade.Value then
                  Raise Exception.Create('Quantidade de rateio inválida!');
                QItemNF.Next;
              End;
            End;
            //FNotaSaida_Confirma.Finaliza;
            SetaConfirma;
          End;
      4 : BtCancelarClick(Self);
      3 : Begin   // Confirmação
            FNotaSaida_Confirma.Finaliza;
          End;
    End; // Case
  Except
    DMNotaSaida.QItemNF.Close;
    DMNotaSaida.QItemNF.Open;
    ModalResult := mrNone;
    Raise;
  End;
end;

Procedure TFNotaSaida_Confirma.Finaliza;
Begin
  With DMNotaSaida do
  Begin
    Try
      If DMNotaSaida.QNotaSaida.State = dsEdit Then
         DMNotaSaida.QNotaSaida.Post;
      If (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'GONZATTI') or
         (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'MOINHO') then
      begin
        QGuiaAplicacao.Open;
        If QGuiaAplicacaoCod_Produto.Value > 0 Then
        Begin
          DMReceita.pNome_Tela := 'NOTA';
          If FReceitaCad = Nil then
             FReceitaCad := TFReceitaCad.Create(Application);
          FReceitaCad.ShowModal;
        End;
      End;
    Except
      DMNotaSaida.QNotaSaida.Cancel;
      Raise;
    End;
  End;
  FNotaSaida_Confirma.Close;
End;

procedure TFNotaSaida_Confirma.BtCancelarClick(Sender: TObject);
begin
  If DMNotaSaida.QNotaSaida.State <> dsBrowse then
    DMNotaSaida.QNotaSaida.Cancel;
  If DMOracle.DBCemapa.InTransaction then
  Begin
    if not(DMNotaSaida.pTR) and not(DMNotaSaida.pTRF) then
      DMOracle.DBCemapa.RollBack
    else
      DMNotaSaida.pCF:=True;
    DMNotaSaida.QNotaSaida.Close;
    DMNotaSaida.QNotaSaida.Open;
  End;
end;

procedure TFNotaSaida_Confirma.BtApagaParcelaClick(Sender: TObject);
begin
  LBContaReceber.Items.Delete(LBContaReceber.ItemIndex);
end;

procedure TFNotaSaida_Confirma.BtApagaParcFreteClick(Sender: TObject);
begin
  LBContaPagarFrete.Items.Delete(LBContaPagarFrete.ItemIndex);
end;

procedure TFNotaSaida_Confirma.DBECod_NotaChange(Sender: TObject);
begin
  With DMNotaSaida do
  Begin
    If QNotaSaidaCod_FILIAL.Value <> 0 Then
     Begin
       QNFAuxAberto.Close;
       QNFAuxAberto.SetVariable('COD_FILIAL',QNotaSaidaCod_FILIAL.Value);
       QNFAuxAberto.SetVariable('COD_PRODUTO',QItemNFCod_Produto.Value);
       QNFAuxAberto.Open;
       MEQtBaixarAux.Text := bib.LimpaString(QItemNFQt_Quantidade.Text,'.');
     End;
  End;
end;

procedure TFNotaSaida_Confirma.BtBaixaAuxClick(Sender: TObject);
Var wQtde : Real;
begin
  wQtde := StrToFloat(MEQtBaixarAux.Text);
  With DMNotaSaida do
  Begin
    Try
      If (wQtde > QNFAuxAbertoQt_Saldo.Value) Or
         (wQtde > QItemNFQt_Quantidade.Value) then
         Raise Exception.Create('Quantidade inválida!');
      QBaixaAux.Insert;
      QBaixaAuxCod_Nota_Item.Value := QItemNFCod_Nota_Item.Value;
      QBaixaAuxCod_Nota_Aux.Value := QNFAuxAbertoCod_Nota_Aux.Value;
      QBaixaAuxQt_Quantidade.Value := wQtde;
      QBaixaAux.Post;
      QNFAuxAberto.Close;
      QNFAuxAberto.Open;
      MeBaixado.Text := DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_BAIXA_AUX','COD_NOTA_ITEM = '+FloatToStr(QItemNFCod_Nota_Item.Value));
    Except
      If QBaixaAux.State in [dsEdit,dsInsert] then
        QBaixaAux.Cancel;
      Raise;
    End;
  End;
End;

procedure TFNotaSaida_Confirma.BtCancelaBaixaAuxClick(Sender: TObject);
begin
  With DMNotaSaida do
  Begin
    QBaixaAux.Delete;
    QNFAuxAberto.Close;
    QNFAuxAberto.Open;
    MeBaixado.Text := DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_BAIXA_AUX','COD_NOTA_ITEM = '+FloatToStr(QItemNFCod_Nota_Item.Value));
  End;
end;

Procedure TFNotaSaida_Confirma.SetaContaReceber;
Var wMes,wAno,wDia : Word;
Begin
  // Verifica se será gerado contas a Receber ou Contas a Pagar
  If (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '2') Or
     ((DMNotaSaida.QNotaSaidaVal_Frete.Value > 0) and
      (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'AB') and
      (DMNotaSaida.QNotaSaidaInd_Tipo_Frete.Value = 'CIF')) then
  Begin
    GBCPNota.Enabled := DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '2'; // A Prazo
    GBCPFrete.Enabled := DMNotaSaida.QNotaSaidaVal_Frete.Value > 0;

     If DMCadastro.QCadastroNum_Dia_Vencto.Text <> '' Then  // esta rotina é quando foi colocado um dia para vencimento
      Begin                                                 // das contas do cliente no cadastro
        DecodeDate(Date, wAno, wMes, wDia);                 // o sistema gera automaticamente para o proximo mes o C.R.
        Inc(wMes);
        If wMes > 12 Then
        Begin
           wMes := 1;
           Inc(wAno);
        End;
        If DMOracle.DiasNoMes(StrToDate('01/'+IntToStr(wMes)+'/'+IntToStr(wAno))) < DMCadastro.QCadastroNum_Dia_Vencto.Value Then  // isto serve para o caso de informar 31 e o mes so tem 30 dias
           wDia := DMOracle.DiasNoMes(StrToDate('01/'+IntToStr(wMes)+'/'+IntToStr(wAno)))
        Else
           wDia := DMCadastro.QCadastroNum_Dia_Vencto.Value;
        MEDataCP.Text := IntToStr(wDia)+'/'+IntToStr(wMes)+'/'+IntToStr(wAno);
        MeValorCp.Text := EdTotalNF.Text;
      End;
    AtivaPagina('CONTA_RECEBER');
  End
   Else
     FNotaSaida_Confirma.DoContaReceberPagar;
End;

Function TFNotaSaida_Confirma.SetaGera_Futura;
Var wFinalizar : Boolean;
Begin
  wFinalizar := True;
  // Baixa de Deposito na Empresa
  DMNotaSaida.QNFAuxAberto.Close;
//  DMNotaSaida.QNFAuxAberto.SetVariable('COD_FILIAL',DMNotaSaida.QNotaSaidaCod_FILIAL.Value);
//  DMNotaSaida.QNFAuxAberto.SetVariable('COD_PRODUTO',DMNotaSaida.QItemNFCod_Produto.Value);
  If DMOperacao.QOperacaoInd_Deposito_Empresa.Value = 'S' Then // Simples Remessa
  Begin
    LFutura.Caption := 'Baixa de Depósito na Empresa';
    PCConfirma.Pages[2].Caption := 'Depósito';
    DMNotaSaida.QNFAuxAberto.SetVariable('COD_CADASTRO',DMNotaSaida.QNotaSaidaCod_Cadastro.Value);
    DMNotaSaida.QNFAuxAberto.SetVariable('TIPO','DEP_EMP'); // Depósito na Empresa
    DMNotaSaida.QNFAuxAberto.Open;
    DMNotaSaida.QBaixaAux.Open;
    wFinalizar := False;
  End;
  // Remessa de Venda Futura
  If DMOperacao.QOperacaoInd_Futura_Cliente.Value = 'S' Then // Simples Remessa
  Begin
    LFutura.Caption := 'Simples Remessa de Venda Futura';
    PCConfirma.Pages[2].Caption := 'Venda Futura';
//    DMNotaSaida.QNFAuxAberto.Close;
    DMNotaSaida.QNFAuxAberto.SetVariable('COD_CADASTRO',DMNotaSaida.QNotaSaidaCod_Cadastro.Value);
    DMNotaSaida.QNFAuxAberto.SetVariable('TIPO','VEN_FUT'); // Venda Futura
    DMNotaSaida.QNFAuxAberto.Open;
    DMNotaSaida.QBaixaAux.Close;
    DMNotaSaida.QBaixaAux.Open;
    wFinalizar := False;
  End;

  // Devolução de Compra Futura
  If DMOperacao.QOperacaoInd_Futura_Fornecedor.Value = 'D' Then
  Begin
    LFutura.Caption := 'Devolução de Compra Futura';
    PCConfirma.Pages[2].Caption := 'Compra Futura';
//    DMNotaSaida.QNFAuxAberto.Close;
    DMNotaSaida.QNFAuxAberto.SetVariable('COD_CADASTRO',DMNotaSaida.QNotaSaidaCod_Cadastro.Value);
    DMNotaSaida.QNFAuxAberto.SetVariable('TIPO','COM_FUT'); // Compra Futura
    DMNotaSaida.QNFAuxAberto.Open;
    DMNotaSaida.QBaixaAux.Open;
    wFinalizar := False;
  End;

  // Devolucao de Mercadoria em Consignação
  If DMOperacao.QOperacaoInd_Consignacao_Fornecedor.Value = 'D' Then
  Begin
    LFutura.Caption := 'Devolução de Consignação';
    PCConfirma.Pages[2].Caption := 'Consignação';
//    DMNotaSaida.QNFAuxAberto.Close;
    DMNotaSaida.QNFAuxAberto.SetVariable('COD_CADASTRO',DMNotaSaida.QNotaSaidaCod_Cadastro.Value);
    DMNotaSaida.QNFAuxAberto.SetVariable('TIPO','CON_FOR'); // Devolução de Compra em Consignação
    DMNotaSaida.QNFAuxAberto.Open;
    DMNotaSaida.QBaixaAux.Open;
    wFinalizar := False;
  End;

  // Devolucao de Empréstimo
  If DMOperacao.QOperacaoInd_Emprestimo_Fornecedor.Value = 'D' Then
  Begin
    LFutura.Caption := 'Devolução de Empréstimo';
    PCConfirma.Pages[2].Caption := 'Empréstimo';
//    DMNotaSaida.QNFAuxAberto.Close;
    DMNotaSaida.QNFAuxAberto.SetVariable('COD_CADASTRO',DMNotaSaida.QNotaSaidaCod_Cadastro.Value);
    DMNotaSaida.QNFAuxAberto.SetVariable('TIPO','EMP_FOR'); // Devolução de Empréstimo
    DMNotaSaida.QNFAuxAberto.Open;
    DMNotaSaida.QBaixaAux.Open;
    wFinalizar := False;
  End;
  If wFinalizar = True Then
    SetaConfirma
  Else
  Begin
    DMNotaSaida.QItemNF.EnableControls;
    DMNotaSaida.QItemNF.First;
    AtivaPagina('FUTURA');
  End;
  Result := True;
End;

Procedure TFNotaSaida_Confirma.SetaContaCorrente;
Begin
  If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO') And
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GONZATTI') Then
    AtivaPagina('CONTA_CORRENTE')
  Else
    FNotaSaida_Confirma.SetaContaReceber;
End;

Procedure TFNotaSaida_Confirma.SetaConfirma;
Var wComando,wLibera_Bloqueto : String;
    x, y: array of string;
Begin
  With DMNotaSaida do
  Begin
    Try
      QItemNF.AutoCalcfields := False;
      If QNotaSaidaNum_Nota.Value = 0 then
         QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value,QNotaSaidaCod_Serie.Value);
      If QNotaSaidaInd_Condicao_Pagto.Value = '1' then // A Vista
         AtuCaixa(QSomaItemNotaSVal_Total_Nota.Value,'A VISTA');
      If QNotaSaidaVal_AVista.Value > 0 then // Valor da Entrada
         AtuCaixa(QNotaSaidaVal_AVista.Value,'ENTRADA');
      If QNotaSaidaInd_Condicao_Pagto.Value = '2' then // A Prazo
         GeraContaReceber(LBContaReceber.Items, StrToInt(Trim(MEFinalidade.Text)), Trim(MEBanco.Text),Trim(MEDepartamento.Text), Trim(MeContaCorrente.Text));
      If (QNotaSaidaVal_Frete.Value > 0) And
         (Trim(QNotaSaidaNum_Conhecimento_Frete.Text) <> '') And
         (Trim(QNotaSaidaCod_Tributacao_Frete.Text) <> '') And
         (Trim(QNotaSaidaCod_Operacao_CF.Text) <> '') And
         (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'AB') And
         (QNotaSaidaInd_Tipo_Frete.Value = 'CIF') then // Contas a Pagar do Frete
         GeraContaPagar(LBContaPagarFrete.Items,StrToInt(Trim(MEFinalidadeFrete.Text)),StrToInt(Trim(MEDepContaPagar.Text)));
      If DMParamSistema.QparamSistemaInd_Contabiliza.Value = 'S' Then
         Contabiliza;
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
         DesdobramentoClaspar;
      If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB') And
         (QNotaSaidaVal_Frete.Value <> 0) Then
         Conhecimento_Frete(QNotaSaidaCod_Nota_Cab.Value,QNotaSaidaNum_Conhecimento_Frete.Value,QNotaSaidaCod_Filial.Value,
              QNotaSaidaCod_Transportador.Value,QNotaSaidaCod_Operacao_Cf.Value,QNotaSaidaCod_Tributacao_Frete.Value, QNotaSaidaVal_Pedagio.Value,
              QNotaSaidaVal_Icm_Frete.Value,QNotaSaidaVal_Frete_Ton.Value,QNotaSaidaVal_Frete.Value,
              QNotaSaidaDesc_Placa.Value,QNotaSaidaDesc_Transportadora.Value,QNotaSaidaCod_Contrato_Vend.Text, QNotaSaidaDt_Emissao_Cf.Value);
      AtuPedido(1);
//    DMNotaSaida.AtuCPFunrural(1);
      If pTRF2 Then  // nota de transferencia:Gravar o codigo da nota de entrada para chegar na volta de confirmação se a nota de entrada ja foi confirmada
         QNotaSaidaCOD_NOTA_CAB_TRANS_ENT.Value := DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Value;
      QNotaSaida.Post;
// vai gerar o movimento bancario dos cheques lançados
      DMBancoAgencia.GeraMovBancario(LBCheques.Items, QNotaSaidaCod_Nota_Cab.Value,QNotaSaidaNum_Nota.Value,QNotaSaidaCod_Cadastro.Value,QNotaSaidaCod_Vendedor.Value,QNotaSaidaCod_Serie.Value);
      if not(pTR) and not(pTRF) then
         DMOracle.DBCemapa.Commit;
      If DMNotaSaida.QNotaSaidaCod_Ordem_Carregamento_Cab.Text <> '' then
        With DMOracle do
        Begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_ORDEM_CARREGAMENTO_CAB SET IND_SITUACAO=' +Chr(39) + 'B' + Chr(39);
          wComando := wComando + ',COD_NOTA_CAB='+DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text + ' WHERE COD_ORDEM_CARREGAMENTO_CAB = '+FloatToStr(DMNotaSaida.QNotaSaidaCod_Ordem_Carregamento_Cab.Value);
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;
          If DMOracle.DBCemapa.InTransaction then
             DMOracle.DBCemapa.Commit;
        End;
      if DMOperacao.QOperacaoInd_Cupom_Fiscal.Value = 'S' Then
      begin
        if FImpressoraFiscal = nil Then
           FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
        FimpressoraFiscal.EmiteCF_Yanco(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
      end
      else
      Begin
        If ((DMOperacao.QOperacaoInd_Emite.Value <> 'N') and (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'BORGES')) then
          FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
        if ((DMParamSistema.QParamSistemaCod_Empresa.Value = 'BORGES') AND
            (MessageDlg('Deseja emitir a nota?',mtConfirmation,[mbYes,mbNo],0) = mrYes)) Then
            FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
      end;
      If (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '2') And
         (DMOperacao.QOperacaoInd_Bloqueto.Value = 'S') Then
      begin
        wLibera_Bloqueto := DMOracle.BuscaNome('SELECT IND_LIBERA_BLOQUETO FROM TB_CADASTRO',
                           'COD_CADASTRO = '+IntToStr(DMNotaSaida.QNotaSaidaCod_Cadastro.Value)); //somente emite bloqueto se estiver liberado no cadastro de clientes
        // QRBloqueto.Open;
        If (wLibera_Bloqueto = 'SIM') And (Trim(MeContaCorrente.Text) <> '') Then
        Begin
          DMContasReceber.Monta_Sql_Bloqueto;
          DMContasReceber.QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB = ' + DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text);
          DMContasReceber.QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_CONTA_CORRENTE = ' + Trim(MeContaCorrente.Text));
          DMContasReceber.Chama_Emissao_Bloqueto; // VAI IMPRIMIR O BLOQUETO ESTÁ NO DATA MODULO CONTAS A RECEBER
        End;
      End;
      If DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'AB' then
       begin
         if DMNotaSaida.QNotaSaidaDt_Recebimento.Text = '' Then
          Begin
            With DMOracle do
            Begin
              QExecSQL.Close;
              QExecSQL.SQL.Clear;
              wComando := 'UPDATE TB_NOTA_CAB SET DT_RECEBIMENTO=DT_EMISSAO';
              wComando := wComando + ' WHERE COD_NOTA_CAB = '+FloatToStr(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
              QExecSQL.SQL.Add(wComando);
              QExecSQL.ExecSQL;
              If DMOracle.DBCemapa.InTransaction then
                 DMOracle.DBCemapa.Commit;
            End;
         End;
      End;
      If (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value <> '1')
         and (DMOperacao.QOperacaoInd_Duplicata.Value = 'S') Then
      begin
        with DMContasReceber do
        begin
          QRContasReceber_Duplicatas.Close;
          QRContasReceber_Duplicatas.SetVariable('COD_NOTA_CAB',DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
          QRContasReceber_Duplicatas.SetVariable('COD_FILIAL',DMNotaSaida.QNotaSaidaCod_Filial.Value);
          QRContasReceber_Duplicatas.SetVariable('COD_DEPARTAMENTO',Null);
          QRContasReceber_Duplicatas.SetVariable('COD_CONTA_RECEBER_CAB',Null);
          QRContasReceber_Duplicatas.Open;
        end;
        if DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'AB' then
        begin
          if MessageDlg('Emitir Duplicata?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              FPromissoria.Duplicata_AB;
        End;

        if (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'FORTE') Or
           (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'MOINHO') then
          if MessageDlg('Emitir Duplicata?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           Begin
             if FRContasReceberDuplicatas_MEDIBENS=nil then
                FRContasReceberDuplicatas_MEDIBENS:=TFRContasReceberDuplicatas_MEDIBENS.Create(Application);
             setLength(x, 8); //8 sql diferentes
             setLength(y, 8);
             x[0] := 'SELECT DESC_FILIAL FROM TB_FILIAL WHERE COD_FILIAL= '+DMNotaSaida.QNotaSaidaCod_Filial.Text;
             x[1] := 'SELECT DESC_ENDERECO FROM TB_FILIAL WHERE COD_FILIAL= '+DMNotaSaida.QNotaSaidaCod_Filial.Text;
             x[2] := 'SELECT DESC_CIDADE FROM TB_FILIAL WHERE COD_FILIAL= '+DMNotaSaida.QNotaSaidaCod_Filial.Text;
             x[3] := 'SELECT NUM_CGC FROM TB_FILIAL WHERE COD_FILIAL= '+DMNotaSaida.QNotaSaidaCod_Filial.Text;
             x[4] := 'SELECT DESC_INSCRICAO FROM TB_FILIAL WHERE COD_FILIAL= '+DMNotaSaida.QNotaSaidaCod_Filial.Text;
             x[5] := 'SELECT COD_ESTADO FROM TB_FILIAL WHERE COD_FILIAL= '+DMNotaSaida.QNotaSaidaCod_Filial.Text;
             x[6] := 'SELECT DESC_CEP FROM TB_FILIAL WHERE COD_FILIAL= '+DMNotaSaida.QNotaSaidaCod_Filial.Text;
             x[7] := 'SELECT DESC_TELEFONE FROM TB_FILIAL WHERE COD_FILIAL= '+DMNotaSaida.QNotaSaidaCod_Filial.Text;
             DMOracle.BuscaNomes(x, y);
             FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa.caption := Y[0];
             FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa2.caption:= Y[0];
             FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa3.caption := Y[0];
             FRContasReceberDuplicatas_MEDIBENS.QRLEndereco.caption:= Y[1];
             FRContasReceberDuplicatas_MEDIBENS.QRLCidade.caption:= Y[2];
             FRContasReceberDuplicatas_MEDIBENS.QRLCGC.caption:= Y[3];
             FRContasReceberDuplicatas_MEDIBENS.QRLInscricao.caption:= Y[4];
             FRContasReceberDuplicatas_MEDIBENS.QRLEstado.caption:= Y[5];
             FRContasReceberDuplicatas_MEDIBENS.QRLCEP.caption:= Y[6];
             FRContasReceberDuplicatas_MEDIBENS.QRLfone.caption:= Y[7];
             FRContasReceberDuplicatas_MEDIBENS.QRPrimario.Preview
           end;
        if ((DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'COZER') or
            (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'BRUSCHI')) Then
           if MessageDlg('Emitir Nota Promissória?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
             FPromissoria.Promissoria_Dos;

      End;
      AtivaPagina('CONFIRMA');
    Except
      AtivaPagina('ERRO');
      Raise;
    End;
  End;
End;

procedure TFNotaSaida_Confirma.MEDiasCPExit(Sender: TObject);
begin
  If Trim(MEDiasCP.Text) <> '' then
  Begin
    MEDataCP.Text := DateToStr(DMNotaSaida.QNotaSaidaDt_Emissao.Value+StrToFloat(MEDiasCP.Text));
    MEDiasCP.Text := '';
  End;
end;

Procedure TFNotaSaida_Confirma.AtivaPagina(pNomePagina:String);
begin
  If PCConfirma.ActivePage <> Nil Then
    PCConfirma.ActivePage.TabVisible := False;
  If pNomePagina = 'CONTA_CORRENTE' Then
    PCConfirma.Pages[0].TabVisible := True // Conta Corrente
  Else
    If pNomePagina = 'CONTA_RECEBER' Then
     Begin
      PCConfirma.Pages[1].TabVisible := True; // Contas a Receber
      If MeValorCp.Text <> '' Then
        MeValorCpExit(Self); 
     End
    Else
      If pNomePagina = 'FUTURA' Then
        PCConfirma.Pages[2].TabVisible := True // Futura
      Else
        If pNomePagina = 'CONFIRMA' Then
        Begin
          PCConfirma.Pages[3].TabVisible := True; // Confirmação
          BtCancelar.Enabled := False;
        End
        Else
          If pNomePagina = 'ERRO' Then
          Begin
            BtAvancar.Enabled := False;
            PCConfirma.Pages[4].TabVisible := True // Erro
          End
          Else
            Raise Exception.Create('Página Inválida!');
End;

procedure TFNotaSaida_Confirma.MEDepartamentoExit(Sender: TObject);
begin
  If Trim(MEDepartamento.Text) <> '' Then
    EdDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MEDepartamento.Text)
  Else
    EdDepartamento.Text := '';
end;

procedure TFNotaSaida_Confirma.BtConsDepartamentoClick(Sender: TObject);
begin
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
  Begin
    MEDepartamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    MEDepartamentoExit(Self);
  End;

end;

procedure TFNotaSaida_Confirma.MEDepContaPagarExit(Sender: TObject);
begin
  If Trim(MEDepContaPagar.Text) <> '' Then
    EdDepContaPagar.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MEDepContaPagar.Text)
  Else
    EdDepContaPagar.Text := '';
end;

procedure TFNotaSaida_Confirma.BtConsDepContaPagarClick(Sender: TObject);
begin
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
  Begin
    MEDepContaPagar.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    MEDepContaPagarExit(Self);
  End;
end;

procedure TFNotaSaida_Confirma.BtConsBancoClick(Sender: TObject);
begin
  If FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.showModal = mrOk then
  Begin
    MeBanco.Text := DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Text;
    MeContaCorrente.Text := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Text;
    MeContaCorrenteExit(Self);
  End;
end;

procedure TFNotaSaida_Confirma.BtPrazoClick(Sender: TObject);
begin
  If FPrazoVencimentoCons = Nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  If FPrazoVencimentoCons.showModal = mrOk then
  Begin
    MePrazo.Text := DMPrazoVencimento.QPrazoVencimento_ConsCod_Prazo_Vencimento.Text;
    MePrazoExit(Self);
  End;
end;

procedure TFNotaSaida_Confirma.MePrazoExit(Sender: TObject);
Var wLinha, wAux, wParc : String;
    wParcela,wSoma,wDiferenca : Real;
    wCont : Integer;
Const wBranco : String = '                            ';
begin
  If Trim(MePrazo.Text) <> '' Then
   Begin
    wParc := DMOracle.BuscaNome('SELECT NUM_PARCELAS FROM TB_PRAZO_VENCIMENTO','COD_PRAZO_VENCIMENTO = '+Trim(MePrazo.Text));
    If wParc = '' Then
       Raise Exception.Create('Código de parcelas inexistente');
    DMPrazoVencimento.QPrazoVencimentoDias.Close;
    DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('COD_PRAZO_VENCIMENTO',Trim(MePrazo.Text));
    DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('NUM_DIAS',Null);
    DMPrazoVencimento.QPrazoVencimentoDias.Open;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' then
      wParcela := (StrToFloat(EdTotalNF.Text)-DMNotaSaida.QSomaItemNotaSVAL_IPI.Value) / StrToFloat(wParc)
    else
      wParcela := Trunc(StrToFloat(EdTotalNF.Text) / StrToFloat(wParc) * 100) / 100;
    wCont := 0;
    wSoma := 0;
    While Not (DMPrazoVencimento.QPrazoVencimentoDias.Eof) Do
     Begin
       Inc(wCont);
       if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS') and  (wCont = 1)) then
         wSoma := wSoma + wParcela + DMNotaSaida.QSomaItemNotaSVAL_IPI.Value
       else
         wSoma := wSoma + wParcela;
       If wCont = StrToInt(wParc) Then
        Begin
          wDiferenca := StrToFloat(EdTotalNF.Text) - wSoma;
          wParcela := wParcela + wDiferenca;
        End;
       wLinha := DateToStr( Date + DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value );
       if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS') and  (wCont = 1)) then
         wAux := FormatFloat('###,###,##0.00',wParcela + DMNotaSaida.QSomaItemNotaSVAL_IPI.Value)
       else
         wAux := FormatFloat('###,###,##0.00',wParcela);
       wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
       wLinha := wLinha + wAux;
       LBContaReceber.Items.Add(wLinha);
       DMPrazoVencimento.QPrazoVencimentoDias.Next;
     End;
    MEDataCP.Text := '';
    MEValorCP.Text := '';
    MEDiasCP.SetFocus;
    MePrazo.Text := '';
    BtAvancarClick(Self);
  End;
end;

procedure TFNotaSaida_Confirma.BitBtn1Click(Sender: TObject);
Var wQtde,wQtBaixar : Real;
begin
  With DMNotaSaida do
  Begin
    wQtde := QItemNFQt_Quantidade.Value;
    While Not QNFAuxAberto.Eof Do
    Begin
      Try
        If wQtde > QNFAuxAbertoQt_Saldo.Value Then
         Begin
           wQtBaixar := QNFAuxAbertoQt_Saldo.Value;
           wQtde := wQtde - QNFAuxAbertoQt_Saldo.Value;
         End
        Else
         Begin
           wQtBaixar := wQtde;
           wQtde := 0;
         End;
        QBaixaAux.Insert;
        QBaixaAuxCod_Nota_Item.Value := QItemNFCod_Nota_Item.Value;
        QBaixaAuxCod_Nota_Aux.Value := QNFAuxAbertoCod_Nota_Aux.Value;
        QBaixaAuxQt_Quantidade.Value := wQtBaixar;
        QBaixaAux.Post;
        QNFAuxAberto.Close;
        QNFAuxAberto.Open;
        If wQtde = 0 Then
           Exit;
      Except
        If QBaixaAux.State in [dsEdit,dsInsert] then
          QBaixaAux.Cancel;
        Raise;
      End;
    End;
    QBaixaAux.Close;
    QNFAuxAberto.Close;
  End;
end;

procedure TFNotaSaida_Confirma.MeContaCorrenteExit(Sender: TObject);
begin
  If Trim(MeContaCorrente.Text) <> '' Then
   Begin
    MeBanco.Text := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+Trim(MeContaCorrente.Text));
    If Trim(MeBanco.Text) = '' Then
       Raise Exception.Create('Conta Corrente Não Cadastrada');
    EdBanco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MEBanco.Text);
   End
  Else
    EdBanco.Text := '';

end;

procedure TFNotaSaida_Confirma.BtInsertContaCorrenteClick(Sender: TObject);
Var wLinha, wAux : String;
Const wBranco : String = '                            ';
begin
  If StrToDate(MeDtCheque.Text) < Date Then
     Raise Exception.Create('Data do Cheque Menor que Data Atual!');
  wLinha := FormatMaskText('CCCCCC',Trim(MeContaCorrente_Cheque.Text)) + ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCC',Trim(MeDepartamento_Cheque.Text)) + ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCC',Trim(MeHistorico.Text)) + ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCC',Trim(MeNrCheque.Text)) + ' - ';
  wAux := FormatFloat('###,###,##0.00',StrToFloat(MeValorCheque.Text)) + ' - ';
  wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
  wLinha := wLinha + wAux;
  wLinha := wLinha + DateToStr( StrToDate(MeDtCheque.Text) )+ ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',MeObservacao.Text)+ ' - ';
  wLinha := wLinha + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',MeObservacao1.Text);
  LbCheques.Items.Add(wLinha);
End;

procedure TFNotaSaida_Confirma.BtExcluiContaCorrenteClick(Sender: TObject);
begin
  LBCheques.Items.Delete(LBCheques.ItemIndex);
end;

procedure TFNotaSaida_Confirma.BtConsContaCorrenteClick(Sender: TObject);
begin
  If FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.showModal = mrOk then
    MeContaCorrente_Cheque.Text := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Text;

end;

procedure TFNotaSaida_Confirma.BtDepartamentoClick(Sender: TObject);
begin
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
    MEDepartamento_Cheque.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;

end;

procedure TFNotaSaida_Confirma.BtConsHistoricoClick(Sender: TObject);
begin
  If FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  If FHistoricoCons.showModal = mrOk then
    MEHistorico.Text := DMHistorico.QHistoricoConsCod_Historico.Text;

end;

end.
