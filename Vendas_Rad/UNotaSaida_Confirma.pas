unit UNotaSaida_Confirma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ComCtrls, Db, Grids, DBGrids, DBCtrls, ExtCtrls, variants;

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
    Label3: TLabel;
    MEBancoAgencia: TMaskEdit;
    BtConsBancoAgencia: TBitBtn;
    DBEdit1: TDBEdit;
    DBLCBContaCorrente: TDBLookupComboBox;
    Label7: TLabel;
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
    procedure BtConsBancoAgenciaClick(Sender: TObject);
    procedure MEBancoAgenciaExit(Sender: TObject);
    procedure MEDiasCPExit(Sender: TObject);
    procedure MEDepartamentoExit(Sender: TObject);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure MEDepContaPagarExit(Sender: TObject);
    procedure BtConsDepContaPagarClick(Sender: TObject);
    procedure BtConsBancoClick(Sender: TObject);
    procedure MeBancoExit(Sender: TObject);
    procedure BtPrazoClick(Sender: TObject);
    procedure MePrazoExit(Sender: TObject);
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
    procedure EmiteReciboEntrada40Col;
    procedure EmiteReciboVoltaEntrada40Col;    
  end;

var
  FNotaSaida_Confirma: TFNotaSaida_Confirma;

implementation

uses UOperacao_cl, UNotaSaida_cl, UFinalidade_cl, UOracle_cl,
  UFinalidadeCons, USerie_cl, UBancoAgencia_cl, UBancosCons, URBloqueto,
  UNotaEntrada_cl, UDepartamentoCons, UDepartamento_cl, UGuiaAplicacaoParam,
  UNotaImpressao, UParamSistema_cl, UContasReceber_cl,
  URContasReceber_Duplicatas_Ab, UReceitaCad, UReceita_cl,
  URelatorioVenda_cl, UImpressoraFiscal, Ubiblioteca, UPrazoVencimentoCons,
  UPrazoVencimento_cl, UFilial_cl, UCadastro_cl;

{$R *.DFM}

procedure TFNotaSaida_Confirma.FormActivate(Sender: TObject);
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
      LBContaReceber.Items.Clear;
      LBContaPagarFrete.Items.Clear;
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
begin
  For wQtdePagina := 0 to PCConfirma.PageCount-1 do
  Begin
    PCConfirma.Pages[wQtdePagina].TabVisible := False;
  End;
  pAtivado := False;
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
    EdFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MEFinalidade.Text)
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
            If Trim(MEBancoAgencia.Text) = '' Then
              Raise Exception.Create('Banco agência não informado!');
//            If (Trim(DBLCBContaCorrente.Text) = '')
//               and (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '3') then
//              Raise Exception.Create('Conta Corrente não informada!');
            EdTotalNF.Text := FloatToStr((DMNotaSaida.QSomaItemNotaSVal_Total_Nota.Value - DMNotaSaida.QNotaSaidaVal_AVista.Value));
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
      If (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'AB') or
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
  End;
end;

procedure TFNotaSaida_Confirma.BtConsBancoAgenciaClick(Sender: TObject);
begin
  If FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  If FBancosCons.showModal = mrOk then
  Begin
    MEBancoAgencia.Text := DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Text;
    MEBancoAgenciaExit(Self);
    DMBancoAgencia.QContaCorrente.Open;
  End;
end;

procedure TFNotaSaida_Confirma.MEBancoAgenciaExit(Sender: TObject);
begin
  If Trim(MEBancoAgencia.Text) <> '' Then
  With DMBancoAgencia do
  Begin
    QBancoAgencia.Close;
    QBancoAgencia.SetVariable('PK',MEBancoAgencia.Text);
    QBancoAgencia.Open;
  End;
end;

Procedure TFNotaSaida_Confirma.SetaContaReceber;
Begin
  // Verifica se será gerado contas a Receber ou Contas a Pagar
  If (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '2') Or
     ((DMNotaSaida.QNotaSaidaVal_Frete.Value > 0) and
      (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'AB') and
      (DMNotaSaida.QNotaSaidaInd_Tipo_Frete.Value = 'CIF')) then
  Begin
    GBCPNota.Enabled := DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '2'; // A Prazo
    GBCPFrete.Enabled := DMNotaSaida.QNotaSaidaVal_Frete.Value > 0;
    MeDepartamento.Text := '1';
    MeFinalidade.Text := '1';
    If DMNotaSaida.QNotaSaidaCod_Prazo_Vencimento.Value > 0 Then
     Begin
       MePrazo.Text := DMNotaSaida.QNotaSaidaCod_Prazo_Vencimento.Text;
       MePrazoExit(Self);
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
  //If (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value <> '1') and
  //   (DMOperacao.QOperacaoInd_Bloqueto.Value = 'S') Then // Conta Corrente
  //  AtivaPagina('CONTA_CORRENTE')
  //Else
  //  FNotaSaida_Confirma.SetaContaReceber;


 // If (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value <> '1') Then // Conta Corrente
 //   AtivaPagina('CONTA_CORRENTE')
 // Else
    FNotaSaida_Confirma.SetaContaReceber;
End;

Procedure TFNotaSaida_Confirma.SetaConfirma;
Var wComando : String;
Begin
  With DMNotaSaida do
  Begin
    Try
      QItemNF.AutoCalcfields := False;
      If QNotaSaidaNum_Nota.Value = 0 then
      begin
        If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') Then
           QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(1,QNotaSaidaCod_Serie.Value,QNotaSaidaCOD_SERIE_MODELO.Value)
        Else
           QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value,QNotaSaidaCod_Serie.Value,QNotaSaidaCOD_SERIE_MODELO.Value);
      end;
      If QNotaSaidaInd_Condicao_Pagto.Value = '1' then // A Vista
         AtuCaixa(QSomaItemNotaSVal_Total_Nota.Value);
      If QNotaSaidaVal_AVista.Value > 0 then // Valor da Entrada
         AtuCaixa(QNotaSaidaVal_AVista.Value);
      If QNotaSaidaInd_Condicao_Pagto.Value = '2' then // A Prazo
         GeraContaReceber(LBContaReceber.Items, StrToInt(Trim(MEFinalidade.Text)), MEBanco.Text,Trim(MEDepartamento.Text));
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
      QNotaSaida.Post;
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
         If DMOperacao.QOperacaoInd_Emite.Value <> 'N' Then
            FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
      if (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value <> '1')
         and (DMOperacao.QOperacaoInd_Bloqueto.Value = 'S') Then
      begin
        DMRelatorio_Venda.QRBloqueto.Open;
        if FRBloqueto = Nil then
          FRBloqueto := TFRBloqueto.Create(Application);
        // QRBloqueto.Open;
        FRBloqueto.QRPrimario.Preview;
        DMRelatorio_Venda.QRBloqueto.Close;
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
          if FRContasReceberDuplicatas_Ab=Nil then
             FRContasReceberDuplicatas_Ab:=TFRContasReceberDuplicatas_Ab.Create(Application);
          FRContasReceberDuplicatas_Ab.QRPrimario.Preview;
        End;
      End;

      If (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '1')     Or
         ((DMNotaSaida.QNotaSaidaVAL_AVISTA.Value >= 0.01)          and
          (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value <> '3'))  Then
         If (DMOperacao.QOperacaoIND_EMITE_RECIBO_ENTRADA.Value = 'S') Then
            if MessageDlg('Deseja emitir recibo de Venda?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              // Se a Operaçao emite Pedido 40 Colunas, o recibo deve ser
              // emitido em 40 Colunas - Djeison A. Selzlein - 19/08/2013
              EmiteReciboEntrada40Col;
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
      PCConfirma.Pages[1].TabVisible := True // Contas a Receber
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
  If FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  If FBancosCons.showModal = mrOk then
  Begin
    MEBanco.Text := DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Text;
    MEBancoExit(Self);
  End;
end;

procedure TFNotaSaida_Confirma.MeBancoExit(Sender: TObject);
begin
  If Trim(MEBanco.Text) <> '' Then
    EdBanco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MEBanco.Text)
  Else
    EdBanco.Text := '';
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
    wParcela := Trunc(StrToFloat(EdTotalNF.Text) / StrToFloat(wParc) * 100) / 100;
    wCont := 0;
    wSoma := 0;
    While Not (DMPrazoVencimento.QPrazoVencimentoDias.Eof) Do  // quando tem carencia nao gera a ultima parcela
     Begin
       Inc(wCont);
       wSoma := wSoma + wParcela;
       If wCont = StrToInt(wParc) Then
        Begin
          wDiferenca := StrToFloat(EdTotalNF.Text) - wSoma;
          wParcela := wParcela + wDiferenca;
        End;                                            // a primeira parcela é os dias de carencia
       If (wCont = 1) And (DMNotaSaida.QNotaSaidaNum_Dias_Carencia.Value <> 0) Then
          wLinha := DateToStr( DMNotaSaida.QNotaSaidaDt_Emissao.Value + DMNotaSaida.QNotaSaidaNum_Dias_Carencia.Value)
       Else
        Begin
          wLinha := DateToStr( DMNotaSaida.QNotaSaidaDt_Emissao.Value + DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value + DMNotaSaida.QNotaSaidaNum_Dias_Carencia.Value);
          DMPrazoVencimento.QPrazoVencimentoDias.Next;
        End;
       wParcela := Trunc((wParcela + 0.05) * 10) / 10;
       wAux := FormatFloat('###,###,##0.00',wParcela);
       wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
       wLinha := wLinha + wAux;
       LBContaReceber.Items.Add(wLinha);
       If wCont = StrToInt(wParc) Then  // Para gerar uma parcela pela carencia
          Exit;
     End;
    MEDataCP.Text := '';
    MEValorCP.Text := '';
//    MEDiasCP.SetFocus;
    MePrazo.Text := '';
//    BtAvancarClick(Self);
  End;
end;

procedure TFNotaSaida_Confirma.EmiteReciboEntrada40Col;
var wEndereco, wCidade, wCliente, wVal : string;
    wContador : integer;
begin
  // Impressão de Recibo - Matricial - Modificado por Djeison A. Selzlein - 17/08/2013
  if Imp = Nil Then
     Imp := TImp.Create;

  wVal := DMOracle.BuscaNome('SELECT DESC_LPT_RECIBO FROM TB_FILIAL','COD_FILIAL = '
    + DMNotaSaida.QNotaSaidaCOD_FILIAL.AsString);
  if wVal = 'LPT1' then
    imp.AbreImpressora;
  if wVal = 'LPT2' then
    imp.AbreImpressora_Lpt2;
  if wVal = 'LPT3' then
    imp.AbreImpressora_Lpt3;
  if wval = 'COM2' then
    imp.AbreImpressora_Com2;

  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',3);

  DMFilial.QFilial.close;
  DMFilial.QFilial.SetVariable('PK', DMNotaSaida.QNotaSaidaCOD_FILIAL.AsString);
  DMFilial.QFilial.open;

  wEndereco := DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO',
    'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
  wCliente :=  DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
    'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
  wCidade   := DMOracle.BuscaNome('SELECT DESC_CIDADE || '' - '' || COD_ESTADO FROM TB_CADASTRO',
    'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);

  wContador := 7;
  Imp.WriteXY(0,wContador,Copy(DMFilial.QFilialDESC_FILIAL.Value,1,40));
  Inc(wContador);
  Imp.WriteXY(0,wContador,Copy(DMFilial.QFilialDESC_ENDERECO.Value,1,40));
  Inc(wContador);
  Imp.WriteXY(0,wContador,Copy(DMFilial.QFilialDESC_TELEFONE.Value,1,40));
  Inc(wContador);
  With DMNotaSaida do
  begin
    Imp.WriteXY(0,wContador,'RECIBO DE VENDA');
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    Inc(wContador);
    Imp.WriteXY(0,wContador,DateToStr(DMOracle.DataServ) + '            N. Nota.:  ' + QNotaSaidaNUM_NOTA.AsString);
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    Inc(wContador);
    Imp.WriteXY(0,wContador,'CLI.:' + copy(wCliente, 1, 35));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'END.:' + copy(wEndereco,1,35));
    Inc(wContador);
    Imp.WriteXY(0,wContador,copy(wCidade,1,40));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Num. Nota..: ' + Bib.NumToTexto(QNotaSaidaNUM_NOTA.Value,0,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Dt. Emissao: ' + DateToStr(QNotaSaidaDT_EMISSAO.Value));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Val. Prod..: ' + Bib.NumToTexto(QSomaItemNotaSVAL_TOTAL.Value,2,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Desconto...: ' + Bib.NumToTexto(QSomaItemNotaSVAL_DESCONTO.Value,2,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Total......: ' + Bib.NumToTexto(QSomaItemNotasval_total_nota.Value,2,10));
    Inc(wContador);
    if(QNotaSaidaVAL_AVISTA.Value > 0.01) then
    begin
      Imp.WriteXY(0,wContador,'  Val.Pago...: ' + Bib.NumToTexto(QNotaSaidaVAL_AVISTA.Value,2,10));
      Inc(wContador);
      Imp.WriteXY(0,wContador,'  Val.a.Pagar: ' + Bib.NumToTexto(QSomaItemNotasval_total_nota.Value -
                                              QNotaSaidaVAL_AVISTA.Value,2,10));
      Inc(wContador);
    end;
    Imp.WriteXY(0,wContador,'----------------------------------------');
    wContador := wContador + 6;
    Imp.WriteXY(0,wContador,' ');
  end;

  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
end;

procedure TFNotaSaida_Confirma.EmiteReciboVoltaEntrada40Col;
var wEndereco, wCidade, wCliente, wVal : string;
    wContador : integer;
begin
  // Impressão de Recibo - Matricial - Modificado por Djeison A. Selzlein - 17/08/2013
  if Imp = Nil Then
     Imp := TImp.Create;

  wVal := DMOracle.BuscaNome('SELECT DESC_LPT_RECIBO FROM TB_FILIAL','COD_FILIAL = '
    + DMNotaSaida.QNotaSaidaCOD_FILIAL.AsString);
  if wVal = 'LPT1' then
    imp.AbreImpressora;
  if wVal = 'LPT2' then
    imp.AbreImpressora_Lpt2;
  if wVal = 'LPT3' then
    imp.AbreImpressora_Lpt3;
  if wval = 'COM2' then
    imp.AbreImpressora_Com2;

  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',3);

  DMFilial.QFilial.close;
  DMFilial.QFilial.SetVariable('PK', DMNotaSaida.QNotaSaidaCOD_FILIAL.AsString);
  DMFilial.QFilial.open;

  wEndereco := DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO',
    'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
  wCliente :=  DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
    'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
  wCidade   := DMOracle.BuscaNome('SELECT DESC_CIDADE || '' - '' || COD_ESTADO FROM TB_CADASTRO',
    'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);

  wContador := 7;
  Imp.WriteXY(0,wContador,Copy(DMFilial.QFilialDESC_FILIAL.Value,1,40));
  Inc(wContador);
  Imp.WriteXY(0,wContador,Copy(DMFilial.QFilialDESC_ENDERECO.Value,1,40));
  Inc(wContador);
  Imp.WriteXY(0,wContador,Copy(DMFilial.QFilialDESC_TELEFONE.Value,1,40));
  Inc(wContador);
  With DMNotaSaida do
  begin
    Imp.WriteXY(0,wContador,'RECIBO DE CANCELAMENTO DE ENTRADA');
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    Inc(wContador);
    Imp.WriteXY(0,wContador,DateToStr(DMOracle.DataServ) + '            N. Nota.:  ' + QNotaSaidaNUM_NOTA.AsString);
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    Inc(wContador);
    Imp.WriteXY(0,wContador,'CLI.:' + copy(wCliente, 1, 35));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'END.:' + copy(wEndereco,1,35));
    Inc(wContador);
    Imp.WriteXY(0,wContador,copy(wCidade,1,40));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Num. Nota..: ' + Bib.NumToTexto(QNotaSaidaNUM_NOTA.Value,0,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Dt. Emissao: ' + DateToStr(QNotaSaidaDT_EMISSAO.Value));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Val. Prod..: ' + Bib.NumToTexto(QSomaItemNotaSVAL_TOTAL.Value,2,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Desconto...: ' + Bib.NumToTexto(QSomaItemNotaSVAL_DESCONTO.Value,2,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Total......: ' + Bib.NumToTexto(QSomaItemNotasval_total_nota.Value,2,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Val.Pago...: ' + Bib.NumToTexto(QNotaSaidaVAL_AVISTA.Value,2,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    wContador := wContador + 6;
    Imp.WriteXY(0,wContador,' ');
  end;

  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
end;

end.
