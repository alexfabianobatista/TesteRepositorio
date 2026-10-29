unit UNotaEntrada_Confirma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Db, Grids, Mask, DBGrids, DBCtrls, ExtCtrls,
  UBibliotecaDb;

type
  TFNotaEntrada_Confirma = class(TForm)
    BtAvancar: TBitBtn;
    BtCancelar: TBitBtn;
    PCConfirma: TPageControl;
    TSContaPagar: TTabSheet;
    Label2: TLabel;
    TSContabiliza: TTabSheet;
    TSFutura: TTabSheet;
    LFutura: TLabel;
    TSImpostos: TTabSheet;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBEMudaAux: TDBEdit;
    DBGrid4: TDBGrid;
    DBGrid2: TDBGrid;
    Label9: TLabel;
    Label10: TLabel;
    DBGrid5: TDBGrid;
    Label11: TLabel;
    BtBaixaAux: TBitBtn;
    BtCancelaBaixaAux: TBitBtn;
    MEQtBaixarAux: TMaskEdit;
    Label12: TLabel;
    GBCPNota: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    MEDataCP: TMaskEdit;
    MEValorCP: TMaskEdit;
    BtApagaParcela: TBitBtn;
    LBContaPagar: TListBox;
    Label6: TLabel;
    MEFinalidade: TMaskEdit;
    BtConsFinalidade: TBitBtn;
    EdFinalidade: TEdit;
    MEBaseICM: TMaskEdit;
    MEICM: TMaskEdit;
    METotalNF: TMaskEdit;
    Label7: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    MEBaseCF: TMaskEdit;
    MEICM_CF: TMaskEdit;
    Label18: TLabel;
    Label19: TLabel;
    MEDiasCP: TMaskEdit;
    Label20: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label22: TLabel;
    MEIndexado: TMaskEdit;
    TabSheet1: TTabSheet;
    GBCPFrete: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    MEDtParcFrete: TMaskEdit;
    MEValParcFrete: TMaskEdit;
    BtApagaParcFrete: TBitBtn;
    LBContaPagarFrete: TListBox;
    MEFinalidadeFrete: TMaskEdit;
    BtConsFinalidadeFrete: TBitBtn;
    EdFinalidadeFrete: TEdit;
    MEDiasCPFrete: TMaskEdit;
    MEIndexadoCF: TMaskEdit;
    Label24: TLabel;
    Panel1: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Panel2: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    MEDepartamento: TMaskEdit;
    BtConsDepartamento: TBitBtn;
    EdDepartamento: TEdit;
    Label32: TLabel;
    MEDepFrete: TMaskEdit;
    BtConsDepFrete: TBitBtn;
    EdDepFrete: TEdit;
    TabSheet2: TTabSheet;
    Label33: TLabel;
    BitBtn1: TBitBtn;
    Label34: TLabel;
    MeBaixado: TMaskEdit;
    Label35: TLabel;
    lblTotalImposto: TLabel;
    Label36: TLabel;
    MeAntecipacao: TMaskEdit;
    Label37: TLabel;
    MePontualidade: TMaskEdit;
    LblObs: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    MeBanco: TMaskEdit;
    MeAgencia: TMaskEdit;
    MeContaCorrente: TMaskEdit;
    MeCnpjCpf: TMaskEdit;
    MeNomeTitular: TMaskEdit;
    RgFormaPagto: TRadioGroup;
    Label43: TLabel;
    lblDeposito: TLabel;
    cbConsideraFreteIPI: TCheckBox;
    lbBaseIPI: TLabel;
    BtPrazo: TBitBtn;
    MePrazo: TMaskEdit;
    Label44: TLabel;
    EdTotalNF: TEdit;
    Label45: TLabel;
    Label46: TLabel;
    EDTotalFrete: TEdit;
    procedure BtAvancarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MEValorCPExit(Sender: TObject);
    procedure BtApagaParcelaClick(Sender: TObject);
    procedure BtConsFinalidadeClick(Sender: TObject);
    procedure MEFinalidadeExit(Sender: TObject);
    procedure DBEMudaAuxChange(Sender: TObject);
    procedure BtBaixaAuxClick(Sender: TObject);
    procedure BtCancelaBaixaAuxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BtConsFinalidadeFreteClick(Sender: TObject);
    procedure MEFinalidadeFreteExit(Sender: TObject);
    procedure BtApagaParcFreteClick(Sender: TObject);
    procedure MEValParcFreteExit(Sender: TObject);
    procedure MEDiasCPExit(Sender: TObject);
    procedure MEDiasCPFreteExit(Sender: TObject);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure MEDepartamentoExit(Sender: TObject);
    procedure BtConsDepFreteClick(Sender: TObject);
    procedure MEDepFreteExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MEDataCPExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PCConfirmaEnter(Sender: TObject);
    procedure cbConsideraFreteIPIClick(Sender: TObject);
    procedure BtPrazoClick(Sender: TObject);
    procedure MePrazoExit(Sender: TObject);
  private
    { Private declarations }
    despesaNoIPI: Boolean;
    Procedure ValidaImpostos;
    Procedure DoContaPagarNF;
    Procedure DoContaPagarCF;
    Procedure Finaliza;
    Procedure AtivaPagina(pNomePagina:String);
    Procedure geraParcelas();
    property pDespesaNoIpi: Boolean read despesaNoIPI write despesaNoIPI default True;
  public
    FContrato : Boolean;
    property pContrato : Boolean read FContrato write FContrato default False;
    Procedure EmiteReciboEntrada40Col;
    Procedure EmiteReciboVoltaEntrada40Col;

    { Public declarations }
  end;

var
  FNotaEntrada_Confirma: TFNotaEntrada_Confirma;

implementation

uses UNotaEntrada_cl, UFinalidadeCons, UFinalidade_cl, UOracle_cl,
  UUsuario_cl, UOperacao_cl, UTributacao_cl, USerie_cl, UBiblioteca,
  UDepartamentoCons, UDepartamento_cl, UNotaImpressao,UParamSistema_cl,
  UProduto_cl, UHistoricoCons, UHistorico_cl, UCadastro_cl, Ucontrato_cl,
  UNfe_cl, UFilial_cl, UPrazoVencimentoCons, UPrazoVencimento_cl,
  UPagamentosNFe4;

{$R *.DFM}

procedure TFNotaEntrada_Confirma.BtAvancarClick(Sender: TObject);
Var wFinalizar : Boolean;
    wQt_Baixa  : Real;
begin
  if MEValorCP.Text <> '' then
    MEValorCPExit(Self);
  Try
    DMNotaEntrada.QNotaEntrada.AutoCalcFields:=False; //
    DMNotaEntrada.QItemNF.AutoCalcFields:=False;      //
    DMNotaEntrada.QItemNF.DisableControls;            //
    // Passo 1 - Gerar Contas a Pagar - Atualiza Estoque e Custo
    Case PcConfirma.ActivePage.PageIndex of
      0 : Begin // Aba de Conta Pagar
            FNotaEntrada_Confirma.DoContaPagarNF;
          End;
      1 : Begin // Aba de Conta Pagar
            FNotaEntrada_Confirma.DoContaPagarCF;
          End;
      2 : Begin // Impostos
            With DMNotaEntrada do
            Begin
              if not(pContrato) and not(pTR) then
                ValidaImpostos
              else
                AtivaPagina('FIM');
              wFinalizar := True;
              // Devolução de Depósitos em outras empresas
              DMNotaEntrada.QBaixaAux.Close;
              If DMOperacao.QOperacaoInd_Deposito_Outras.Value = 'E' Then
              Begin
                LFutura.Caption := 'Devolução de Depósito em Outras Empresas';
                DMNotaEntrada.QNFAuxAberto.Close;
                If DMNotaEntrada.QNotaEntradaCod_Armazem_Alfandegado.Text <> '' Then
                  DMNotaEntrada.QNFAuxAberto.SetVariable('COD_CADASTRO_SUBSTITUICAO','COD_ARMAZEM_ALFANDEGADO = ' + DMNotaEntrada.QNotaEntradaCod_Armazem_Alfandegado.Text)
                Else
                  DMNotaEntrada.QNFAuxAberto.SetVariable('COD_CADASTRO_SUBSTITUICAO','COD_CADASTRO = ' + DMNotaEntrada.QNotaEntradaCod_Cadastro.Text);
                DMNotaEntrada.QNFAuxAberto.SetVariable('TIPO','DEP_OUT'); // Deposito outras empresas
                DMNotaEntrada.QNFAuxAberto.Open;
                DMNotaEntrada.QBaixaAux.SetVariable('COD_NOTA_ITEM',DMNotaEntrada.QItemNfCOD_NOTA_ITEM.Value);
                DMNotaEntrada.QBaixaAux.Open;
                wFinalizar := False;
              End;

              // Devolução de Depósitos na empresas
              If DMOperacao.QOperacaoInd_Deposito_Empresa.Value = 'S' Then
              Begin
                LFutura.Caption := 'Devolução de Depósito na Empresas';
                DMNotaEntrada.QNFAuxAberto.Close;
                If DMNotaEntrada.QNotaEntradaCod_Armazem_Alfandegado.Text <> '' Then
                  DMNotaEntrada.QNFAuxAberto.SetVariable('COD_CADASTRO_SUBSTITUICAO','COD_ARMAZEM_ALFANDEGADO = ' + DMNotaEntrada.QNotaEntradaCod_Armazem_Alfandegado.Text)
                Else
                  DMNotaEntrada.QNFAuxAberto.SetVariable('COD_CADASTRO_SUBSTITUICAO','COD_CADASTRO = ' + DMNotaEntrada.QNotaEntradaCod_Cadastro.Text);
                DMNotaEntrada.QNFAuxAberto.SetVariable('TIPO','DEP_EMP'); // Deposito outras empresas
                DMNotaEntrada.QNFAuxAberto.Open;
                DMNotaEntrada.QBaixaAux.SetVariable('COD_NOTA_ITEM',DMNotaEntrada.QItemNfCOD_NOTA_ITEM.Value);
                DMNotaEntrada.QBaixaAux.Open;
                wFinalizar := False;
              End;

              // Devolução de Venda Futura
              If DMOperacao.QOperacaoInd_Futura_Cliente.Value = 'D' Then
              Begin
                LFutura.Caption := 'Devolução de Venda Futura';
                DMNotaEntrada.QNFAuxAberto.Close;
                If DMNotaEntrada.QNotaEntradaCod_Armazem_Alfandegado.Text <> '' Then
                  DMNotaEntrada.QNFAuxAberto.SetVariable('COD_CADASTRO_SUBSTITUICAO','COD_ARMAZEM_ALFANDEGADO = ' + DMNotaEntrada.QNotaEntradaCod_Armazem_Alfandegado.Text)
                Else
                  DMNotaEntrada.QNFAuxAberto.SetVariable('COD_CADASTRO_SUBSTITUICAO','COD_CADASTRO = ' + DMNotaEntrada.QNotaEntradaCod_Cadastro.Text);
                DMNotaEntrada.QNFAuxAberto.SetVariable('TIPO','VEN_FUT'); // Compra Futura
                DMNotaEntrada.QNFAuxAberto.Open;
                DMNotaEntrada.QBaixaAux.SetVariable('COD_NOTA_ITEM',DMNotaEntrada.QItemNfCOD_NOTA_ITEM.Value);
                DMNotaEntrada.QBaixaAux.Open;
                wFinalizar := False;
              End;

              // Remessa de Compra Futura
              If DMOperacao.QOperacaoInd_Futura_Fornecedor.Value = 'S' Then // Simples Remessa
              Begin
                LFutura.Caption := 'Simples Remessa de Compra Futura';
                DMNotaEntrada.QNFAuxAberto.Close;
                If DMNotaEntrada.QNotaEntradaCod_Armazem_Alfandegado.Text <> '' Then
                  DMNotaEntrada.QNFAuxAberto.SetVariable('COD_CADASTRO_SUBSTITUICAO','COD_ARMAZEM_ALFANDEGADO = ' + DMNotaEntrada.QNotaEntradaCod_Armazem_Alfandegado.Text)
                Else
                  DMNotaEntrada.QNFAuxAberto.SetVariable('COD_CADASTRO_SUBSTITUICAO','COD_CADASTRO = ' + DMNotaEntrada.QNotaEntradaCod_Cadastro.Text);
                DMNotaEntrada.QNFAuxAberto.SetVariable('TIPO','COM_FUT'); // Compra Futura
                DMNotaEntrada.QNFAuxAberto.Open;
                DMNotaEntrada.QBaixaAux.SetVariable('COD_NOTA_ITEM',DMNotaEntrada.QItemNfCOD_NOTA_ITEM.Value);
                DMNotaEntrada.QBaixaAux.Open;
                wFinalizar := False;
              End;
              //comentado pois foi adicionado no
              // Devolucao de Mercadoria em Consignação
              If DMOperacao.QOperacaoInd_Consignacao_Cliente.Value = 'D' Then
              Begin
                LFutura.Caption := 'Devolução de Consignação';
                DMNotaEntrada.QNFAuxAberto.Close;
                If DMNotaEntrada.QNotaEntradaCod_Armazem_Alfandegado.Text <> '' Then
                  DMNotaEntrada.QNFAuxAberto.SetVariable('COD_CADASTRO_SUBSTITUICAO','COD_ARMAZEM_ALFANDEGADO = ' + DMNotaEntrada.QNotaEntradaCod_Armazem_Alfandegado.Text)
                Else
                  DMNotaEntrada.QNFAuxAberto.SetVariable('COD_CADASTRO_SUBSTITUICAO','COD_CADASTRO = ' + DMNotaEntrada.QNotaEntradaCod_Cadastro.Text);
                DMNotaEntrada.QNFAuxAberto.SetVariable('TIPO','CON_CLI'); // Vendas para Clientes - em Consignação
                DMNotaEntrada.QNFAuxAberto.Open;
               { if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'DAMBONI' then // na Damboni essa mensagem já é adicionada na inclusao dos itens na NF.
                begin
                  //adiciona referencia para a nota de saída de consignaçao
                  DMNotaEntrada.QNotaEntradaOBS_COMPLEMENTO.Value :=
                  DMNotaEntrada.QNotaEntradaOBS_COMPLEMENTO.Value +
                  ' Referente a NF ' + DMNotaEntrada.QNFAuxAbertoNUM_NOTA.Text +
                  ' do dia ' + DMNotaEntrada.QNFAuxAbertoDT_EMISSAO.Text;
                  //-------------------------------------------------------
                end;       }
                DMNotaEntrada.QBaixaAux.SetVariable('COD_NOTA_ITEM',DMNotaEntrada.QItemNfCOD_NOTA_ITEM.Value);
                DMNotaEntrada.QBaixaAux.Open;
                wFinalizar := False;
              End;

              // Devolucao de Empréstimo
              If DMOperacao.QOperacaoInd_Emprestimo_Cliente.Value = 'D' Then
              Begin
                LFutura.Caption := 'Devolução de Empréstimo';
                DMNotaEntrada.QNFAuxAberto.Close;
                If DMNotaEntrada.QNotaEntradaCod_Armazem_Alfandegado.Text <> '' Then
                  DMNotaEntrada.QNFAuxAberto.SetVariable('COD_CADASTRO_SUBSTITUICAO','COD_ARMAZEM_ALFANDEGADO = ' + DMNotaEntrada.QNotaEntradaCod_Armazem_Alfandegado.Text)
                Else
                  DMNotaEntrada.QNFAuxAberto.SetVariable('COD_CADASTRO_SUBSTITUICAO','COD_CADASTRO = ' + DMNotaEntrada.QNotaEntradaCod_Cadastro.Text);
                DMNotaEntrada.QNFAuxAberto.SetVariable('TIPO','EMP_CLI'); // Vendas para Clientes - em Consignação
                DMNotaEntrada.QNFAuxAberto.Open;
                DMNotaEntrada.QBaixaAux.SetVariable('COD_NOTA_ITEM',DMNotaEntrada.QItemNfCOD_NOTA_ITEM.Value);
                DMNotaEntrada.QBaixaAux.Open;
                wFinalizar := False;
              End;
              If wFinalizar = True then
                FNotaEntrada_Confirma.Finaliza
              Else
              Begin
                DMNotaEntrada.QNotaEntrada.AutoCalcFields:=True; //
                DMNotaEntrada.QItemNF.AutoCalcFields:=True;      //
                DMNotaEntrada.QItemNF.EnableControls;            //
                pOperacaoInterna := 1;
                QItemNF.First;
                DMNotaEntrada.QNotaEntrada.AutoCalcFields:=False; //
                DMNotaEntrada.QItemNF.AutoCalcFields:=False;      //
//                DMNotaEntrada.QItemNF.DisableControls;            //
                pOperacaoInterna := 3;
                AtivaPagina('FUTURA');
              End;
            End; // With
          End;
      3 : Begin   // Futura
            With DMNotaEntrada do
            Begin
              QItemNF.First;
              While not QItemNF.Eof do
              Begin
                wQt_Baixa := 0;
                DMNotaEntrada.QBaixaAux.Close;
                DMNotaEntrada.QBaixaAux.SetVariable('COD_NOTA_ITEM',DMNotaEntrada.QItemNfCOD_NOTA_ITEM.Value);
                DMNotaEntrada.QBaixaAux.Open;
                While not QBaixaAux.Eof do
                Begin
                  wQt_Baixa := wQt_Baixa + QBaixaAuxQt_Quantidade.Value;
                  QBaixaAux.Next;
                End;
                If Trunc(wQt_Baixa) <> Trunc(QItemNFQt_Beneficiado.Value) then
                  begin
                    DMNotaEntrada.QNotaEntrada.AutoCalcFields:=True; //
                    DMNotaEntrada.QItemNF.AutoCalcFields:=True;      //
                    DMNotaEntrada.QItemNF.EnableControls;            //
                    Raise Exception.Create('Quantidade de rateio inválida!');
                  end;
                QItemNF.Next;
              End;
            End;
            FNotaEntrada_Confirma.Finaliza;
          End;
      4: Begin
           If DMNotaEntrada.QNotaEntrada.State <> dsBrowse then
             DMNotaEntrada.QNotaEntrada.Cancel;
           If DMOracle.DBCemapa.InTransaction then
             DMOracle.DBCemapa.Rollback;
         End;
      5: Close;
    End; // Case
  Except
    ModalResult := mrNone;
    DMNotaEntrada.QNotaEntrada.AutoCalcFields:=True; //
    DMNotaEntrada.QItemNF.AutoCalcFields:=True;      //
    DMNotaEntrada.QItemNF.EnableControls;            //
    Raise;
  End;
  DMNotaEntrada.QNotaEntrada.AutoCalcFields:=True;   //
  DMNotaEntrada.QItemNF.AutoCalcFields:=True;        //
  DMNotaEntrada.QItemNF.EnableControls;              //
end;

procedure TFNotaEntrada_Confirma.BtCancelarClick(Sender: TObject);
begin
  If DMNotaEntrada.QNotaEntrada.State <> dsBrowse then
    DMNotaEntrada.QNotaEntrada.Cancel;
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback;
//  If DMNotaSaida.pTR then
//    DMNotaEntrada.pCF:=True;
end;

procedure TFNotaEntrada_Confirma.FormActivate(Sender: TObject);
begin
  If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO') and
      (DMParamSistema.QParamSistemaCod_Empresa.Value <> '.') Then //Base vermelha do moinho esta com COD_EMPRESA = '.'
  Begin
    Label38.Visible := False;
    Label39.Visible := False;
    Label40.Visible := False;
    Label41.Visible := False;
    Label42.Visible := False;
    MeBanco.Visible := False;
    MeBanco.Visible := False;
    MeAgencia.Visible := False;
    MeContaCorrente.Visible := False;
    MeCnpjCpf.Visible := False;
    MeNomeTitular.Visible := False;
    LBContaPagar.Height := 161;
    RgFormaPagto.ItemIndex := 0;
    RgFormaPagto.Visible := False;
  End;

  DMOperacao.QOperacao.AutoCalcFields:=False;
  DMOperacao.QOperacao.Close;
  DMOperacao.QOperacao.SetVariable('PK',DMNotaEntrada.QNotaEntradaCod_Operacao.Value);
  DMOperacao.QOperacao.Open;
  DMOperacao.QOperacao.AutoCalcFields:=True;
  MeBanco.Clear;
  MeAgencia.Clear;
  MeContaCorrente.Clear;
  MeCnpjCpf.Clear;
  MeNomeTitular.Clear;
  If (DMOperacao.QOperacaoInd_Conta_Pagar.Value = 'S') And
     (DMNotaEntrada.QNotaEntradaInd_Condicao_Pagto.Value = '2') Then
   Begin
     AtivaPagina('CONTA_PAGAR');
     DMCadastro.QCadastro.Close;
     DMCadastro.QCadastro.SetVariable('Pk',DMNotaEntrada.QNotaEntradaCod_Cadastro.Value);
     DMCadastro.QCadastro.Open;
     MeBanco.Text := DMCadastro.QCadastroCod_Banco_Agencia.Text;
     MeAgencia.Text := DMCadastro.QCadastroDesc_Agencia.Text;
     MeContaCorrente.Text := DMCadastro.QCadastroDesc_Conta_Corrente.Text;
     MeCnpjCpf.Text := DMCadastro.QCadastroDESC_COMPLEMENTO.Text;
     MeNomeTitular.Text := DMCadastro.QCadastroNome_Titular.Text;
     MeDepartamento.SetFocus;
   End
  Else
   FNotaEntrada_Confirma.DoContaPagarNF;
  MEBaseICM.Text := '0';
  MEICM.Text := '0';
  METotalNF.Text := '0';
  MEBaseCF.Text := '0';
  MEICM_CF.Text := '0';
  MePontualidade.Clear;
  MeAntecipacao.Clear;
  LBContaPagar.Items.Clear;
  LBContaPagarFrete.Items.Clear;
  if DMUsuario.CodFinalidadePagarUsuario > 0  then
  begin
    MeFinalidade.Text := IntToStr(DMUsuario.CodFinalidadePagarUsuario);
    MEFinalidadeExit(Self);
  end;

  DMNotaEntrada.QSomaItemNota.Close;
  DMNotaEntrada.QSomaItemNota.Open;

  MEBaseICM.Text := Bib.LimpaString(DMNotaEntrada.QSomaItemNotaSVal_ICM_Base.Text, '.');
  MEICM.Text := Bib.LimpaString(DMNotaEntrada.QSomaItemNotaSVal_ICM.Text, '.');
  METotalNF.Text := Bib.LimpaString(DMNotaEntrada.QSomaItemNotaSVal_Total_nota.Text, '.');
  MEBaseCF.Text := Bib.LimpaString(DMNotaEntrada.QNotaEntradaVal_ICM_Base_Frete.Text, '.');
  MEICM_CF.Text := Bib.LimpaString(DMNotaEntrada.QNotaEntradaVal_ICM_Frete.Text, '.');
  pDespesaNoIpi := true;

  EdTotalNF.Text := FloatToStr((DMNotaEntrada.QSomaItemNotasval_total_nota.Value
    - DMNotaEntrada.QNotaEntradaVAL_AVISTA.Value));
  //Label para aparecer o valor de frete quando gerar o CONTAS A PAGAR DO FRETE. Junior - 12/11/2015 - Solicitação: Pap. Costa Oeste
  EDTotalFrete.Text := FloatToStr(DMNotaEntrada.QNotaEntradaVAL_FRETE.Value);
end;

procedure TFNotaEntrada_Confirma.MEValorCPExit(Sender: TObject);
Var wLinha, wAux : String;
Const wBranco : String = '                              ';
begin
  If (MEDataCP.Text <> '') and
     (MEValorCP.Text <> '') then
  Begin
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
       If RgFormaPagto.ItemIndex = -1 Then
          Raise Exception.Create('Escolher Forma Pagamento');
//Tomate SMI para lançar parcelamento com data retroativa. Alex 21/08/2023
    If (DMParamSistema.CodEmpresa <> 'TOMATESMI') then
       If StrToDate(MeDataCp.Text) < DMNotaEntrada.QNotaEntradaDt_Emissao.Value Then
          Raise Exception.Create('Data de Vencimento Menor que Data de Emissão');
    wLinha := FormatDateTime('dd/MM/yyyy', StrToDate(MEDataCP.Text));
    wAux := FormatFloat('###,###,##0.00',StrToFloat(MEValorCP.Text));
    wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
    wLinha := wLinha + wAux;
    wAux := FormatFloat('###,###,##0.00',StrToFloat(MeIndexado.Text + '0'));
    wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
    wLinha := wLinha + wAux;
    wAux := '-' + Copy(wBranco,1,4-Length(MeBanco.Text)) + MeBanco.Text;
    wAux := wAux + '-' + Copy(wBranco,1,6-Length(MeAgencia.Text)) + MeAgencia.Text;
    wAux := wAux + '-' + Copy(wBranco,1,10-Length(MeContaCorrente.Text)) + MeContaCorrente.Text;
    wAux := wAux + '-' + Copy(wBranco,1,18-Length(MeCnpjCpf.Text)) + MeCnpjCpf.Text;
    wAux := wAux + '-' + Copy(wBranco,1,30-Length(MeNomeTitular.Text)) + MeNomeTitular.Text;
    wLinha := wLinha + wAux;
    LBContaPagar.Items.Add(wLinha);
    MEDataCP.Text := '';
    MEValorCP.Text := '';
    MEIndexado.Text := '';
    MEDiasCP.SetFocus;
  End;
end;

procedure TFNotaEntrada_Confirma.BtApagaParcelaClick(Sender: TObject);
begin
  LBContaPagar.Items.Delete(LBContaPagar.ItemIndex);
end;

procedure TFNotaEntrada_Confirma.BtConsFinalidadeClick(Sender: TObject);
begin
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.showModal = mrOk then
  Begin
    MEFinalidade.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    MEFinalidadeExit(Self);
  End;
end;

procedure TFNotaEntrada_Confirma.MEFinalidadeExit(Sender: TObject);
var
  IndFinalidade: string;
begin
  if Trim(MEFinalidade.Text) <> '' then
    begin
      EdFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE', 'COD_FINALIDADE = ' + MEFinalidade.Text, True);
      if (DMOracle.BuscaNome('SELECT IND_LIBERADO FROM TB_FINALIDADE',
                             'COD_FINALIDADE = ' + MEFinalidade.Text, True)) <> 'SIM' then
        begin
          MEFinalidade.SetFocus;
          raise Exception.Create('Finalidade não liberada para uso.');
        end;
      IndFinalidade := DMOracle.BuscaNome('SELECT IND_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = ' + MEFinalidade.Text, True);
      if UpperCase(Trim(IndFinalidade)) = 'R' then
        begin
          MEFinalidade.SetFocus;
          raise Exception.Create('Não é permitido selecionar uma finalidade de "Receber" em Contas a Pagar.');
        end;
    end
  else
    EdFinalidade.Text := '';
end;



procedure TFNotaEntrada_Confirma.DBEMudaAuxChange(Sender: TObject);
begin

  If (DMNotaEntrada.QNotaEntradaCod_Armazem_Alfandegado.Text <> '') Or
     (DMNotaEntrada.QNotaEntradaCod_Cadastro.Text <> '') Then
    With DMNotaEntrada do
    Begin
      QNFAuxAberto.Close;
      QNFAuxAberto.SetVariable('COD_FILIAL',QNotaEntradaCod_FILIAL.Value);
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MARICOTA' Then
         QNFAuxAberto.SetVariable('COD_PRODUTO_SUBSTITUICAO','1=1')  // SERVE PARA MOSTRAR TODOS OS PRODUTOS
      Else
         QNFAuxAberto.SetVariable('COD_PRODUTO_SUBSTITUICAO','TB_NOTA_ITEM.COD_PRODUTO = 0' + QItemNFCod_Produto.Text);
//      QNFAuxAberto.SetVariable('COD_PRODUTO',QItemNFCod_Produto.Value);
      If QNotaEntradaCod_Armazem_Alfandegado.Text <> '' Then
         QNFAuxAberto.SetVariable('COD_CADASTRO_SUBSTITUICAO','COD_ARMAZEM_ALFANDEGADO = ' + QNotaEntradaCod_Armazem_Alfandegado.Text)
      Else
         QNFAuxAberto.SetVariable('COD_CADASTRO_SUBSTITUICAO','COD_CADASTRO = ' + QNotaEntradaCod_Cadastro.Text);
  //    QNFAuxAberto.ParamByName('COD_LOTE_TIPO').AsFloat := QItemNFCod_Lote_Tipo.Value;
      QNFAuxAberto.Open;
      MEQtBaixarAux.Text := QItemNFQt_Beneficiado.Text;
    End;
end;


procedure TFNotaEntrada_Confirma.BtBaixaAuxClick(Sender: TObject);
Var wQtde : Real;
begin
  wQtde := StrToFloat(MEQtBaixarAux.Text);
  With DMNotaEntrada do
  Begin
    Try
       If (wQtde > QNFAuxAbertoQt_Saldo.Value)
          or (wQtde > QItemNFQt_Beneficiado.Value) then
         Raise Exception.Create('Quantidade inválida!');
      QBaixaAux.Insert;
      QBaixaAuxCod_Nota_Item.Value := QItemNFCod_Nota_Item.Value;
      QBaixaAuxCod_Nota_Aux.Value := QNFAuxAbertoCod_Nota_Aux.Value;
      QBaixaAuxQt_Quantidade.Value := wQtde;
      QBaixaAux.Post;
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'DAMBONI' then // na Damboni essa mensagem já é adicionada na inclusao dos itens na NF.
      begin
        If QNotaEntradaOBS_COMPLEMENTO.Value = '' Then
           QNotaEntradaOBS_COMPLEMENTO.Value := 'Referente Nf. Nr.' + QNFAuxAbertoNum_Nota.Text +  ' de ' + QNFAuxAbertoDt_Emissao.Text
        Else
           QNotaEntradaOBS_COMPLEMENTO.Text := QNotaEntradaOBS_COMPLEMENTO.Text + ',' + QNFAuxAbertoNum_Nota.Text +  ' de ' + QNFAuxAbertoDt_Emissao.Text;
      end;
      if QNotaEntradaCOD_SERIE_MODELO.Value = '55' then
      begin
        if (QNotaEntradaIND_FINALIDADE_NFE.Value = 4) and (QNFAuxAbertoDESC_CHAVE_ACESSO.Value <> '') then
        begin
          try
            QNotaReferenciada.Insert;
            QNotaReferenciadaCOD_NOTA_CAB.Value :=  QNotaEntradaCOD_NOTA_CAB.Value;
            QNotaReferenciadaCOD_NOTA_CAB_REF.Value := QNFAuxAbertoCOD_NOTA_CAB.Value;
            QNotaReferenciadaDESC_CHAVE_ACESSO.Value := Bib.LimpaNumero(QNFAuxAbertoDESC_CHAVE_ACESSO.Value);
            QNotaReferenciadaNUM_NOTA.Value := QNFAuxAbertoNUM_NOTA.Value;
            QNotaReferenciadaCOD_SERIE.Value := QNFAuxAbertoCOD_SERIE.Value;
            QNotaReferenciadaCOD_SERIE_MODELO.Value := QNFAuxAbertoCOD_SERIE_MODELO.Value;
            QNotaReferenciadaDT_EMISSAO.Value := QNFAuxAbertoDT_EMISSAO.Value;
            QNotaReferenciada.Post;
          Except
            QNotaReferenciada.Cancel;
          end;
        end;
      end;
      QNFAuxAberto.Close;
      QNFAuxAberto.Open;
      MeBaixado.Text := DMOracle.BuscaNome('SELECT Sum(QT_QUANTIDADE) FROM TB_BAIXA_AUX','COD_NOTA_ITEM = '+FloatToStr(QItemNFCod_Nota_Item.Value));
    Except
      If QBaixaAux.State in [dsEdit,dsInsert] then
        QBaixaAux.Cancel;
      Raise;
    End;
  End;
end;

procedure TFNotaEntrada_Confirma.BtCancelaBaixaAuxClick(Sender: TObject);
begin
  With DMNotaEntrada do
  Begin
    QBaixaAux.Delete;
    QNFAuxAberto.Close;
    QNFAuxAberto.Open;
    MeBaixado.Text := DMOracle.BuscaNome('SELECT Sum(QT_QUANTIDADE) FROM TB_BAIXA_AUX','COD_NOTA_ITEM = '+FloatToStr(QItemNFCod_Nota_Item.Value));
  End;
end;

Procedure TFNotaEntrada_Confirma.DoContaPagarNF;
Begin
  With DMNotaEntrada do
  Begin
    If (DMOperacao.QOperacaoInd_Conta_Pagar.Value = 'S') and
       (DMNotaEntrada.QNotaEntradaInd_Condicao_Pagto.Value = '2') and
       (not(pTR)) then // Contas a Pagar da Nota
    Begin
      If Trim(MEFinalidade.Text) = '' Then
         Raise Exception.Create('Finalidade do Contas a Pagar não informado!');
      If Trim(MEDepartamento.Text) = '' Then
         Raise Exception.Create('Departamento do Contas a Pagar não informado!');
      If DMParamSistema.QParamSistemaCod_Empresa.value = 'MOINHO' Then
       Begin
        If Trim(MeAntecipacao.Text) = '' Then
           Raise Exception.Create('Informar Percentual de antecipacao');
        If Trim(MePontualidade.Text) = '' Then
           Raise Exception.Create('Informar Percentual de pontualidade');
       End;
       if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
        if RGFormaPagto.ItemIndex = 1 then
         begin
           if (MEBanco.Text = '') or (MEAgencia.Text = '') or (MEContaCorrente.Text = '') or (MECnpjCpf.Text = '') or
             (MENomeTitular.Text = '') then
             Raise Exception.Create('Dados bancários não preenchidos corretamente');
         end;
      DMNotaEntrada.ValidaContaPagar(QNotaEntradaCod_Nota_Cab.Value,LBContaPagar.Items,StrToFloat(MEFinalidade.Text),'NOTA');
    End;
    Try
      QNotaEntrada.Edit; // Abre Transaçao
      QNotaEntradaInd_Situacao.Value := '2'; // Confirmada
      If (DMOperacao.QOperacaoInd_Conta_Pagar.Value = 'S') and
         (DMNotaEntrada.QNotaEntradaInd_Condicao_Pagto.Value = '2') and
         (not(pTR)) then // Contas a Pagar da Nota
         DMNotaEntrada.GeraContaPagar(QNotaEntradaCod_Nota_Cab.Value,LBContaPagar.Items, StrToInt(Trim(MEFinalidade.Text)),RgFormaPagto.ItemIndex,'NOTA',MEDepartamento.Text,DMNotaEntrada.QNotaEntradaCOD_SERIE.Value,0, DMNotaEntrada.QNotaEntradaCOD_OBRA.Value,MePontualidade.Text,MeAntecipacao.Text,FNotaEntrada_Confirma.lblDeposito.Caption);
      If not(pTR) then
         DMNotaEntrada.AtualizaEstoque(QNotaEntradaCod_Nota_Cab.Value,1);
      DMNotaEntrada.IncluiNotaAux;
      If (DMParamSistema.CodEmpresa <> 'IRRIGASOLO') and    //Irrigasolo solicitou para não aparecer CTS_Pagar do Frete. Junior 20/02/2023
         (((DMNotaEntrada.QNotaEntradaVal_Frete.Value > 0)              And // para a AB somente gera contas a pagar de frete
           (DMNotaEntrada.QNotaEntradaNUM_CONHECIMENTO_FRETE.Value > 0))And
          ((DMNotaEntrada.QNotaEntradaInd_Tipo_Frete.Value = 'FOB')     And // se val frete > 0, tipo = FOB e imprime frete=S
           (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'AB'))     Or
          ((DMNotaEntrada.QNotaEntradaInd_Imprime_Frete.Value = 'S')    And
           (DMNotaEntrada.QNotaEntradaInd_Tipo_Frete.Value = 'FOB')))   Then
       begin
         AtivaPagina('CONTA_PAGAR_CF');
         MeDepFrete.SetFocus;
       End
      Else
        begin
          AtivaPagina('IMPOSTO');
          MeBaseIcm.SetFocus;
          if (pContrato) or (pTr) then BtAvancarClick(Self);
        end;
    Except
      AtivaPagina('ERRO');
      Raise;
    End;
  End;
End;

Procedure TFNotaEntrada_Confirma.DoContaPagarCF;
Begin
  // Gerar Contas a Pagar do Frete
  If DMNotaEntrada.QNotaEntradaVal_Frete.Value > 0 then
  With DMNotaEntrada do
  Begin
    If Trim(MEFinalidadeFrete.Text) = '' Then
      Raise Exception.Create('Finalidade do Contas a Pagar do Frete não informado!');
    If Trim(MEDepFrete.Text) = '' Then
      Raise Exception.Create('Departamento do Contas a Pagar do Frete não informado!');
    DMNotaEntrada.ValidaContaPagar(QNotaEntradaCod_Nota_Cab.Value,LBContaPagarFrete.Items, StrToFloat(MEFinalidadeFrete.Text),'FRETE' );
    Try
      QNotaEntrada.Edit; // Abre Transaçao
      QNotaEntradaInd_Situacao.Value := '2'; // Confirmada
      // Alterado por Djeison - 20/06/2013
      // Passar a Série do Conhecimento de Frete ao invés da série da Nota
      DMNotaEntrada.GeraContaPagar(QNotaEntradaCod_Nota_Cab.Value,LBContaPagarFrete.Items, StrToInt(Trim(MEFinalidadeFrete.Text)),1,'FRETE',MEDepFrete.Text,DMNotaEntrada.QNotaEntradaCOD_SERIE_CF.Value,0, DMNotaEntrada.QNotaEntradaCOD_OBRA.Value ,'','','');
      if not(pContrato) then
        AtivaPagina('IMPOSTO');
    Except
      AtivaPagina('ERRO');
      Raise;
    End;
  End;
End;

Procedure TFNotaEntrada_Confirma.Finaliza;
var wTipoDocumento,wComando, wResult: String;
    mVAL_MENOSICMS, mPercICM, mVAL_VAREJO, mPercentualLucro,wVal_Caixa, wValImposto :Real;
    wVal : string;
    strl : TStringList;
    cont,wHistorico_Caixa, wLote : integer;
Begin
  With DMNotaEntrada do
  Begin
    Try

      PagamentosNFe4.GeraPagamentos('E');
      if pDespesaNoIpi then
        AcertaValoresNota; //Chamando procedure no banco para acertar valores da nota.
      wVal := '';
      wVal := '0' + DMOracle.BuscaNome('SELECT NVL(SUM(VAL_IMPOSTO),0) FROM TB_NOTA_IMPOSTO_SERVICO','COD_NOTA_CAB = ' + DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.Text);
      wValImposto := StrToFloat(wVal);
      wVal := '';

      //gera o contas a pagar dos impostos de servicos (mesmo que a nota for a vista) 01/08/2005 - Fabiano
      strl := TStringList.Create;
      DMNotaEntrada.QNotaImpostoServico.close;
      DMNotaEntrada.QNotaImpostoServico.open;
      cont := 0;
      while not DMNotaEntrada.QNotaImpostoServico.Eof do
      begin
        strl.Clear;
        strl.Add(DMNotaEntrada.QNotaImpostoServicoDT_VENCIMENTO.Text + Bib.FormataTextoEsq(FloatToStr(DMNotaEntrada.QNotaImpostoServicoVAL_IMPOSTO.Value), 15) + '      ' + Bib.FormataTextoEsq(floattostr(0),15));
        wVal := DMOracle.BuscaNome('SELECT COD_FINALIDADE FROM TB_IMPOSTO','COD_IMPOSTO = ' + DMNotaEntrada.QNotaImpostoServicoCOD_IMPOSTO.Text,True);

        if wVal <> '' then
          DMNotaEntrada.GeraContaPagar( QNotaEntradaCod_Nota_Cab.Value,strl, StrToInt(Trim(wVal)),1, 'NOTA', MEDepartamento.Text, 'IMP', cont,0,'','','');

        DMNotaEntrada.QNotaImpostoServico.next;
        cont := cont + 1;
      end;
      strl.Free;
      //-------------------------------------

      If QNotaEntradaNum_Nota.Value = 0 then
      Begin
        QNotaEntradaNum_Nota.Value := DMSerie.NumeroSerie(QNotaEntradaCod_Filial.Value,QNotaEntradaCod_Serie.Value,
          QNotaEntradaCOD_SERIE_MODELO.Value);
        QContaPagar.Close;
        QContaPagar.Open;
        While not QContaPagar.Eof do
        Begin
          QContaPagar.Edit;
          QContaPagarNUM_TITULO.Value := QNotaEntradaNum_Nota.Value;
          QContaPagar.Next;
        End;
        QContaPagar.Close;
      End;
      {
      QItemNF.First;
      While not QItemNF.Eof do
      Begin
        QItemNF.Edit;
        QItemNFPerc_Comissao.Value := DMNotaSaida.CalculaComissao(QNotaEntradaCod_Nota_Cab.Value,
                                      FloatToStr(QNotaEntradaCod_Operacao.Value),
                                      FloatToStr(QNotaEntradaCod_Vendedor.Value),
                                      FloatToStr(QItemNFCod_Produto.Value),
                                      QItemNFVal_Total.Value/QItemNFQT_Quantidade.Value,
                                      QItemNFPerc_Comissao.Value);
        QItemNF.Post;
        QItemNF.Next;
      End;
      }
      If (DMParamSistema.QParamSistemaCod_Empresa.Value        = 'AB') And
         (DMNotaEntrada.QNotaEntradaVal_Frete.Value            <> 0) And
         (DMNotaEntrada.QNotaEntradaCod_Tributacao_Frete.Value <> 0) And
         (DMNotaEntrada.QNotaEntradaCod_Operacao_Cf.Value      <> 0) And
         (Trim(DMNotaEntrada.QNotaEntradaNum_Conhecimento_Frete.Text) <> '') Then
         DMNotaEntrada.Atualiza_Conhecimento;
      DMNotaEntrada.AtuOrdemCompra(1);  // Baixa Ordem de Compra e lancamento de despesa na OBRA
      If DMParamSistema.QparamSistemaInd_Contabiliza.Value = 'S' Then
         DMNotaEntrada.Contabiliza(QNotaEntradaCod_Nota_Cab.Value);
//    DMNotaEntrada.GeraCPFunRural(1);
      If (DMNotaEntrada.QNotaEntradaVal_AVista.Value > 0) or
         (DMNotaEntrada.QNotaEntradaInd_Condicao_Pagto.Value = '1') Then
      Begin
        Try
          If DMOperacao.QOperacaoCod_Operacao.Value <> QNotaEntradaCod_Operacao.Value then
          With DMOperacao do
          Begin
            QOperacao.AutoCalcFields:=False;    //
            QOperacao.Close;
            QOperacao.SetVariable('PK',QNotaEntradaCod_Operacao.Value);
            QOperacao.Open;
            QOperacao.AutoCalcFields:=True;    //
          End;
          wHistorico_Caixa := DMOperacao.QOperacaoCod_Historico_Caixa.Value;
          If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then  // isso foi solicitacao do joao 14/06/2007
            If (DMNotaEntrada.QNotaEntradaIND_CONDICAO_PAGTO.Value = '1') And
               (DMOperacao.QOperacaoCod_Historico_Caixa.Value = 999999) Then //contabiliza pelas contas do historico de caixa
               wHistorico_Caixa := DMHistorico.QHistoricoConsCod_Historico.Value;
          If (wHistorico_Caixa = 0) And (DMOperacao.QOperacaoIND_COMPRAS.Value = 'C') Then
           // esta rotina serve para quando lancar uma nova a vista sem codigo de historico de caixa
           Begin
             If FHistoricoCons = Nil Then
                FHistoricoCons := TFHistoricoCons.Create(Application);
             If FHistoricoCons.ShowModal = MrOk Then
               wHistorico_Caixa := DMHistorico.QHistoricoConsCod_Historico.Value
             Else
               wHistorico_Caixa := 0;
           End;
          If wHistorico_Caixa > 0 Then
          Begin
            wVal_Caixa := DMNotaEntrada.QNotaEntradaVal_AVista.Value;
            If DMNotaEntrada.QNotaEntradaInd_Condicao_Pagto.Value = '1' Then
               wVal_Caixa := DMNotaEntrada.QSomaItemNotasVal_Total_Nota.Value;
            QCaixa.Close;
            QCaixa.Open;
            QCaixa.Insert;
            QCaixaCOD_CAIXA_MOV.Value := DMOracle.Sequencia('CAIXA_MOV');
            QCaixaCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
            If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') And (Trim(QNotaEntradaCod_Serie.Value) = 'PE') Then
               QCaixaCOD_FILIAL.Value := 99
            Else
               QCaixaCOD_FILIAL.Value := QNotaEntradaCod_Filial.Value;
            QCaixaCOD_DEPARTAMENTO.Value := QNotaEntradaCod_Departamento.Value;
            QCaixaCOD_HISTORICO.Value := wHistorico_Caixa;
            QCaixaDT_MOVIMENTO.Value := QNotaEntradaDt_Recebimento.Value;
            QCaixaVAL_MOVIMENTO.Value := wVal_Caixa - wValImposto;
            QCaixaNUM_DOCUMENTO.Value := QNotaEntradaNum_Nota.Value;
            QCaixaDESC_COMPLEMENTO.Value := 'Compra a Vista Cfe Nf Nr:'+QNotaEntradaNum_Nota.Text;
            QCaixaNUM_DOCUMENTO.Value := QNotaEntradaNum_Nota.Value;
            QCaixaCOD_CADASTRO.Value := QNotaEntradaCod_Cadastro.Value;
            QCaixaCOD_NOTA_CAB.Value := QNotaEntradaCod_Nota_Cab.Value;
            QCaixaDT_USUARIO.Value := DMOracle.DataServ;
            QCaixa.Post;
          End;
        Except
          If QCaixa.State = dsInsert then
            QCaixa.Cancel;
          Raise;
        End;
        QCaixa.Close;
      End;
      If DMNotaEntrada.QNotaEntradaCod_Ordem_Carregamento_Cab.Text <> '' then
        With DMOracle do
        Begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_ORDEM_CARREGAMENTO_CAB SET IND_SITUACAO=' +Chr(39) + 'B' + Chr(39);
          wComando := wComando + ',COD_NOTA_CAB='+QNotaEntradaCod_Nota_Cab.Text+' WHERE COD_ORDEM_CARREGAMENTO_CAB = '+FloatToStr(DMNotaEntrada.QNotaEntradaCod_Ordem_Carregamento_Cab.Value);
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;
          If DMOracle.DBCemapa.InTransaction then
             DMOracle.DBCemapa.Commit;
        End;
      DMNotaEntrada.QNotaEntrada.Post;
{      wTipoDocumento := DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO, TB_NOTA_CAB',
                    'TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
                   +' AND TB_NOTA_CAB.COD_NOTA_CAB = '+FloatToStr(QNotaEntradaCod_Nota_Cab.Value));
}
      If DMNotaEntrada.QNotaEntradaCOD_CONTRATO_VEND.Text <> '' Then
       Begin
         DMContrato.QContrato_Vend.Close;
         DMContrato.QContrato_Vend.SetVariable('Pk',DMNotaEntrada.QNotaEntradaCOD_CONTRATO_VEND.Value);
         DMContrato.QContrato_Vend.Open;
         If Not(DMContrato.QContrato_Vend.Eof) Then
          Begin
            DMContrato.QContrato_Vend.Edit;
            DMContrato.AtualizaContrato;  // atualizar os saldos de embarque - usa no contrato de venda e nas notas de entrada
            DMContrato.QContrato_Vend.Post;
          End;
       End;
      if not(pContrato) and not(pTR) then
        DMOracle.DBCemapa.Commit;
      wTipoDocumento := DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO ','COD_OPERACAO='+FloatToStr(QNotaEntradaCod_Operacao.Value),True);
      if wTipoDocumento <> 'N' then
      begin
        wResult := DMOracle.BuscaNome('SELECT ID_LOTE FROM TB_NF_ELETRONICA','COD_NOTA_CAB = '+QNotaEntradaCOD_NOTA_CAB.Text);
        if wResult = '' then
          wLote := 0
        else
          wLote := StrToInt(wResult);
        If (DMParamSistema.QParamSistemaIND_CONFIRMA_EMISSAO.Value = 'N') Or // não solicita uma confirmação para imprimir
          (wTipoDocumento = 'F') Then                  // Quando for nota fiscal nao solicita confirmação
          FNotaImpressao.EmiteNF(QNotaEntradaCod_Nota_Cab.Value,'',wLote,true)
        Else
          if MessageDlg('Deseja emitir a NOTA/PEDIDO?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            FNotaImpressao.EmiteNF(QNotaEntradaCod_Nota_Cab.Value,'',wLote,true);
      end;
    Except
      AtivaPagina('ERRO');
      DMNotaEntrada.QNotaEntrada.Cancel;
      Raise;
    End;

    // Atualiza preço de venda (Varejo/Atacado) empresa MEDIBENS by Robson em 06/04/2001 ®
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIBENS') and
      (DMOracle.BuscaNome('SELECT IND_REMESSA_ENTRADA FROM TB_OPERACAO ',
      'COD_OPERACAO='+FloatToStr(QNotaEntradaCod_Operacao.Value),True) = 'NAO')
      then
    begin
      QItemNF.First;
      while not QItemNF.Eof do
      begin
        with DMProduto do
        begin
          try
           QAtualizaPrecoTabelaParametro.Close;
           QAtualizaPrecoTabelaParametro.SetVariable('PK',DMNotaEntrada.QItemNFCOD_PRODUTO.Value);
           QAtualizaPrecoTabelaParametro.Open;
           If QAtualizaPrecoTabelaParametro.RecordCount > 0 then
           begin
             // Abre consulta com percentual a ser atualizado.
             QAtualizaPrecoPercentualLucro.Close;
             QAtualizaPrecoPercentualLucro.SetVariable('VAL_ITEM',DMNotaEntrada.QItemNFVAL_UNITARIO.Value);
             //QAtualizaPrecoPercentualLucro.SetVariable('VAL_MAXIMO',DMNotaEntrada.QItemNFVAL_UNITARIO.Value);
             QAtualizaPrecoPercentualLucro.Open;
             if QAtualizaPrecoPercentualLucro.RecordCount > 0 then
             begin
               mPercICM := StrToFloat( DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+FloatToStr(QItemNFCod_Tributacao.Value),True ));
               mPercentualLucro:= QAtualizaPrecoPercentualLucroPERC_LUCRO.Value;
               mVAL_MENOSICMS:=DMNotaEntrada.QItemNFVAL_UNITARIO.Value-(DMNotaEntrada.QItemNFVAL_UNITARIO.Value*mPercICM/100);
               mVAL_VAREJO:= mVAL_MENOSICMS + (mVAL_MENOSICMS * mPercentualLucro / 100);
               mVAL_VAREJO:=mVAL_VAREJO+QItemNFVAL_FRETE.Value;
               QAtualizaPrecoTabelaParametro.Edit;
               QAtualizaPrecoTabelaParametroVAL_VAREJO.Value:= mVAL_VAREJO;
               QAtualizaPrecoTabelaParametro.Post;
             end
             else
                raise exception.Create('Percentual de atualização invalido!');
           end
           else
              raise exception.Create('Produto não encontrado no cadastro!');
          except
              raise exception.Create('Erro na tentativa de atualiza preço de venda do produto!');
          end;
        end;
        QItemNF.Next;
      end;
      // ----------- Final atualização preço venda varejo. ------------ \\
    end;

    // Emitir Recibo - De Devolução - Djeison A. Selzlein - 21/08/2013
    if (DMOperacao.QOperacaoIND_VENDAS.Value = 'D')               and
       (DMOperacao.QOperacaoIND_EMITE_RECIBO_ENTRADA.Value = 'S') then
    begin
      if MessageDlg('Deseja emitir recibo de Devolução?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        EmiteReciboEntrada40Col;
    end;
  End;
  Close;
End;


procedure TFNotaEntrada_Confirma.FormCreate(Sender: TObject);
Var wQtdePagina : Integer;
begin
  For wQtdePagina := 0 to PCConfirma.PageCount-1 do
  Begin
    PCConfirma.Pages[wQtdePagina].TabVisible := False;
  End;
  if DMNotaEntrada.QNotaEntradaCOD_DEPARTAMENTO.Text = '' then    //Sempre buscava o dep. do usuário. Junior 15/02/2021.
    MEDepartamento.Text := FloatToStr(DMUsuario.CodDepartamentoUsuario)
  else
    MEDepartamento.Text := DMNotaEntrada.QNotaEntradaCOD_DEPARTAMENTO.Text;
  MEDepartamentoExit(self);
  MEDepFrete.Text := FloatToStr(DMUsuario.CodDepartamentoUsuario);
  MEDepFreteExit(Self);
end;

procedure TFNotaEntrada_Confirma.FormDeactivate(Sender: TObject);
Var wQtdePagina : Integer;
begin
  For wQtdePagina := 0 to PCConfirma.PageCount-1 do
  Begin
    PCConfirma.Pages[wQtdePagina].TabVisible := False;
  End;
  pContrato:=False;
end;

procedure TFNotaEntrada_Confirma.BtConsFinalidadeFreteClick(
  Sender: TObject);
begin
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.showModal = mrOk then
  Begin
    MEFinalidadeFrete.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    MEFinalidadeFreteExit(Self);
  End;
end;

procedure TFNotaEntrada_Confirma.MEFinalidadeFreteExit(Sender: TObject);
begin
  If Trim(MEFinalidadeFrete.Text) <> '' Then
    EdFinalidadeFrete.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MEFinalidadeFrete.Text,True)
  Else
    EdFinalidadeFrete.Text := '';
end;

procedure TFNotaEntrada_Confirma.BtApagaParcFreteClick(Sender: TObject);
begin
  LBContaPagarFrete.Items.Delete(LBContaPagarFrete.ItemIndex);
end;

procedure TFNotaEntrada_Confirma.MEValParcFreteExit(Sender: TObject);
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

    If Trim(MEIndexadoCF.Text) <> '' Then
    Begin
      wAux := FormatFloat('###,###,##0.00',StrToFloat(MEIndexadoCF.Text));
      wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
      wLinha := wLinha + wAux;
    End;

    LBContaPagarFrete.Items.Add(wLinha);
    MEDtParcFrete.Text := '';
    MEValParcFrete.Text := '';
    MEIndexadoCF.Text := '';
    MEDiasCPFrete.SetFocus;
  End;
end;

Procedure TFNotaEntrada_Confirma.ValidaImpostos;
Var wAux, wAux2 : Real;

Begin
  With DMNotaEntrada do
  Begin
    // **** Valida Nota Fiscal ************
    QSomaItemNota.Close;
    QSomaItemNota.Open;


    If StrToFloat(MEBaseICM.Text) <> QSomaItemNotaSVal_ICM_Base.Value then
    Begin
      If Abs(StrToFloat(MEBaseICM.Text) - QSomaItemNotaSVal_ICM_Base.Value) >= 0.05 then
         Raise Exception.Create('Base de Calculo não confere com os itens da Nota!')
      Else
      Begin
        QItemNF.Edit;
        QItemNFVal_ICM_Base.Value := QItemNFVal_ICM_Base.Value + StrToFloat(MEBaseICM.Text) - QSomaItemNotaSVal_ICM_Base.Value;
        QItemNF.Post;
      End;
    End;
    If StrToFloat(MEICM.Text) <> QSomaItemNotaSVal_ICM.Value then
       If Abs(StrToFloat(MEICM.Text) - QSomaItemNotaSVal_ICM.Value) >= 0.05 then
         Raise Exception.Create('Valor do ICMS não confere com os Itens da Nota!')
       Else
       Begin
        QItemNF.Edit;
        QItemNFVal_ICM.Value := QItemNFVal_ICM.Value + StrToFloat(MEICM.Text) - QSomaItemNotaSVal_ICM.Value;
        QItemNF.Post;
       End;
    wAux := QSomaItemNotaSVal_Total_nota.Value;
    wAux2 := StrToFloat(METotalNF.Text);

    If Not Bib.ComparaNumero(wAux2,wAux,2) then
       Raise Exception.Create('Valor total da nota não confere com os Itens da Nota!');

    // **** Valida Conhecimento ************
    If Not Bib.ComparaNumero( StrToFloat(MEBaseCF.Text),QNotaEntradaVal_ICM_Base_Frete.Value,2) then
       Raise Exception.Create('Base de Cálculo do Frete está diferente!');
    If Not Bib.ComparaNumero(StrToFloat(MEICM_CF.Text),QNotaEntradaVal_ICM_Frete.Value,2) then
       Raise Exception.Create('ICMS do Frete está diferente!');

  End;
End;

procedure TFNotaEntrada_Confirma.MEDiasCPExit(Sender: TObject);
begin
  If Trim(MEDiasCP.Text) <> '' then
  Begin
    MEDataCP.Text := DateToStr( DMNotaEntrada.QNotaEntradaDt_Emissao.Value + StrToFloat(MEDiasCP.Text) );
    MEDiasCP.Text := '';
  End;
end;

procedure TFNotaEntrada_Confirma.MEDiasCPFreteExit(Sender: TObject);
begin
  If Trim(MEDiasCPFrete.Text) <> '' then
  Begin
    MEDtParcFrete.Text := DateToStr(DMNotaEntrada.QNotaEntradaDt_Emissao.Value + StrToFloat(MEDiasCPFrete.Text) );
    MEDiasCPFrete.Text := '';
  End;
end;

Procedure TFNotaEntrada_Confirma.AtivaPagina(pNomePagina:String);
begin
  If PCConfirma.ActivePage <> Nil Then
    PCConfirma.ActivePage.TabVisible := False;

  If pNomePagina = 'CONTA_PAGAR' Then
    PCConfirma.Pages[0].TabVisible := True // Contas a Pagar
  Else
    If pNomePagina = 'CONTA_PAGAR_CF' Then
      PCConfirma.Pages[1].TabVisible := True // Contas a Pagar do Frete
    Else
      If pNomePagina = 'IMPOSTO' Then
        PCConfirma.Pages[2].TabVisible := True // Imposto
      Else
        If pNomePagina = 'FUTURA' Then
          PCConfirma.Pages[3].TabVisible := True // Futura
        Else
          If pNomePagina = 'ERRO' Then
            PCConfirma.Pages[4].TabVisible := True // Erro
          Else
            If pNomePagina = 'FIM' Then
              PCConfirma.Pages[5].TabVisible := True // Erro
            Else
              Raise Exception.Create('Página Inválida!');

End;


procedure TFNotaEntrada_Confirma.BtConsDepartamentoClick(Sender: TObject);
begin
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
  Begin
    MEDepartamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    MEDepartamentoExit(Self);
  End;
end;

procedure TFNotaEntrada_Confirma.MEDepartamentoExit(Sender: TObject);
begin
  If Trim(MEDepartamento.Text) <> '' Then
    EdDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MEDepartamento.Text,True)
  Else
    EdDepartamento.Text := '';
end;

procedure TFNotaEntrada_Confirma.BtConsDepFreteClick(Sender: TObject);
begin
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
  Begin
    MEDepFrete.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    MEDepFreteExit(Self);
  End;
end;

procedure TFNotaEntrada_Confirma.MEDepFreteExit(Sender: TObject);
begin
  If Trim(MEDepFrete.Text) <> '' Then
    EdDepFrete.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MEDepFrete.Text,True)
  Else
    EdDepFrete.Text := '';
end;

procedure TFNotaEntrada_Confirma.BitBtn1Click(Sender: TObject);
Var wQtde,wQtBaixar : Real;
begin
  With DMNotaEntrada do
  Begin
    wQtde := QItemNFQt_Beneficiado.Value;
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
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'DAMBONI' then // na Damboni essa mensagem já é adicionada na inclusao dos itens na NF.
        begin
          If QNotaEntradaOBS_COMPLEMENTO.Value = '' Then
             QNotaEntradaOBS_COMPLEMENTO.Value := 'Referente Nf. Nr.' + QNFAuxAbertoNum_Nota.Text +  ' de ' + QNFAuxAbertoDt_Emissao.Text
          Else
             QNotaEntradaOBS_COMPLEMENTO.Text := QNotaEntradaOBS_COMPLEMENTO.Text + ',' + QNFAuxAbertoNum_Nota.Text +  ' de ' + QNFAuxAbertoDt_Emissao.Text;
        end;
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

procedure TFNotaEntrada_Confirma.MEDataCPExit(Sender: TObject);
begin
//  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'ZADIMEL') and
//       (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'FAVILLE') then
//Tomate SMI para lançar parcelamento com data retroativa. Alex 21/08/2023
  if (DMParamSistema.CodEmpresa <> 'TOMATESMI') then
    If Trim(MeDataCP.Text) <> '' Then
      If StrToDate(MeDataCP.Text) < Date Then
        Raise Exception.Create('Data de vencimento nao pode ser menor que data atual');
end;

procedure TFNotaEntrada_Confirma.FormShow(Sender: TObject);
var
  wAux : string;
begin
  //calcula o valor da soma dos impostos e mostra na tela de confirmacao
  wAux := '0' + DMOracle.BuscaNome('SELECT NVL(SUM(VAL_IMPOSTO),0) FROM TB_NOTA_IMPOSTO_SERVICO','COD_NOTA_CAB = ' + DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.Text);
  FNotaEntrada_Confirma.lblTotalImposto.Caption := FormatFloat('#,##0.00', strtofloat(wAux));
end;

procedure TFNotaEntrada_Confirma.PCConfirmaEnter(Sender: TObject);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'MOINHO' then
  begin
    if PCConfirma.ActivePage = TSContaPagar then
    begin
      RGFormaPagto.Items.Delete(0);
      RGFormaPagto.Items.Insert(0,'Boleto/Guia/Fatura');
    end;
  end;
end;

procedure TFNotaEntrada_Confirma.EmiteReciboEntrada40Col;
var wVal : string;
    wContador : integer;
begin
  // Impressão de Recibo - Matricial - Modificado por Djeison A. Selzlein - 17/08/2013
  if Imp = Nil Then
     Imp := TImp.Create;

  wVal := DMOracle.BuscaNome('SELECT DESC_LPT_RECIBO FROM TB_FILIAL','COD_FILIAL = '
    + DMNotaEntrada.QNotaEntradaCOD_FILIAL.Text);
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
  DMFilial.QFilial.SetVariable('PK', DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.Text);
  DMFilial.QFilial.open;

  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('PK', DMNotaEntrada.QNotaEntradaCOD_CADASTRO.Text);
  DMCadastro.QCadastro.open;

  wContador := 7;
  Imp.WriteXY(0,wContador,Copy(DMFilial.QFilialDESC_FILIAL.Value,1,40));
  Inc(wContador);
  Imp.WriteXY(0,wContador,Copy(DMFilial.QFilialDESC_ENDERECO.Value,1,40));
  Inc(wContador);
  Imp.WriteXY(0,wContador,Copy(DMFilial.QFilialDESC_TELEFONE.Value,1,40));
  Inc(wContador);
  With DMNotaEntrada do
  begin
    Imp.WriteXY(0,wContador,'RECIBO DE DEVOLUCAO');
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    Inc(wContador);
    Imp.WriteXY(0,wContador,DateToStr(DMOracle.DataServ) + '            N. Nota.:  ' + QNotaEntradaNUM_NOTA.AsString);
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    Inc(wContador);
    Imp.WriteXY(0,wContador,'CLI.:' + copy(DMCadastro.QCadastroNOME.Text, 1, 35));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'END.:' + copy(DMCadastro.QCadastroDESC_ENDERECO.Text,1,35));
    Inc(wContador);
    Imp.WriteXY(0,wContador,copy(DMCadastro.QCadastroDESC_CIDADE.Text,1,40));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Num. Nota..: ' + Bib.NumToTexto(QNotaEntradaNUM_NOTA.Value,0,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Dt. Emissao: ' + DateToStr(QNotaEntradaDT_EMISSAO.Value));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Val. Prod..: ' + Bib.NumToTexto(QSomaItemNotaSVAL_TOTAL.Value,2,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Desconto...: ' + Bib.NumToTexto(QSomaItemNotaSVAL_DESCONTO.Value,2,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Total......: ' + Bib.NumToTexto(QSomaItemNotasval_total_nota.Value,2,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    wContador := wContador + 6;
    Imp.WriteXY(0,wContador,' ');
  end;

  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
end;

procedure TFNotaEntrada_Confirma.cbConsideraFreteIPIClick(Sender: TObject);
var exec: TExecutador;
begin
  pDespesaNoIpi := cbConsideraFreteIPI.Checked;
  exec := TExecutador.Create;
  with DMNotaEntrada do
  begin
    if pDespesaNoIpi then
    begin
      exec.Adiciona('UPDATE TB_NOTA_ITEM SET IND_CONSIDERA_DESPESA_BC_IPI = ' +
        quotedStr('SIM')+
        ' WHERE COD_NOTA_CAB = ' + QNotaEntradaCOD_NOTA_CAB.Text);
      exec.Executar(true,true);
      lbBaseIPI.Caption := FormatFloat('#0.00',(QSomaItemNotaSVAL_TOTAL.Value +
        QSomaItemNotaSVAL_DESPESAS.Value -
        QSomaItemNotaSVAL_DESCONTO.Value));
    end
    else
    begin
      exec.Adiciona('UPDATE TB_NOTA_ITEM SET IND_CONSIDERA_DESPESA_BC_IPI = ' +
        quotedStr('NAO')+
        ' WHERE COD_NOTA_CAB = ' + QNotaEntradaCOD_NOTA_CAB.Text);
      exec.Executar(true,true);
      lbBaseIPI.Caption := FormatFloat('#0.00',(QSomaItemNotaSVAL_TOTAL.Value -
        QSomaItemNotaSVAL_DESCONTO.Value));
    end;
  end;
end;

procedure TFNotaEntrada_Confirma.EmiteReciboVoltaEntrada40Col;
var wVal : string;
    wContador : integer;
begin
  // Impressão de Recibo - Matricial - Modificado por Djeison A. Selzlein - 17/08/2013
  if Imp = Nil Then
     Imp := TImp.Create;

  wVal := DMOracle.BuscaNome('SELECT DESC_LPT_RECIBO FROM TB_FILIAL','COD_FILIAL = '
    + DMNotaEntrada.QNotaEntradaCOD_FILIAL.Text);
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
  DMFilial.QFilial.SetVariable('PK', DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.Text);
  DMFilial.QFilial.open;

  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('PK', DMNotaEntrada.QNotaEntradaCOD_CADASTRO.Text);
  DMCadastro.QCadastro.open;

  wContador := 7;
  Imp.WriteXY(0,wContador,Copy(DMFilial.QFilialDESC_FILIAL.Value,1,40));
  Inc(wContador);
  Imp.WriteXY(0,wContador,Copy(DMFilial.QFilialDESC_ENDERECO.Value,1,40));
  Inc(wContador);
  Imp.WriteXY(0,wContador,Copy(DMFilial.QFilialDESC_TELEFONE.Value,1,40));
  Inc(wContador);
  With DMNotaEntrada do
  begin
    Imp.WriteXY(0,wContador,'RECIBO DE CANCELAMENTO DE DEVOLUCAO');
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    Inc(wContador);
    Imp.WriteXY(0,wContador,DateToStr(DMOracle.DataServ) + '            N. Nota.:  ' + QNotaEntradaNUM_NOTA.AsString);
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    Inc(wContador);
    Imp.WriteXY(0,wContador,'CLI.:' + copy(DMCadastro.QCadastroNOME.Text, 1, 35));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'END.:' + copy(DMCadastro.QCadastroDESC_ENDERECO.Text,1,35));
    Inc(wContador);
    Imp.WriteXY(0,wContador,copy(DMCadastro.QCadastroDESC_CIDADE.Text,1,40));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Num. Nota..: ' + Bib.NumToTexto(QNotaEntradaNUM_NOTA.Value,0,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Dt. Emissao: ' + DateToStr(QNotaEntradaDT_EMISSAO.Value));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Val. Prod..: ' + Bib.NumToTexto(QSomaItemNotaSVAL_TOTAL.Value,2,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Desconto...: ' + Bib.NumToTexto(QSomaItemNotaSVAL_DESCONTO.Value,2,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'  Total......: ' + Bib.NumToTexto(QSomaItemNotasval_total_nota.Value,2,10));
    Inc(wContador);
    Imp.WriteXY(0,wContador,'----------------------------------------');
    wContador := wContador + 6;
    Imp.WriteXY(0,wContador,' ');
  end;

  Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
  Imp.FechaImpressora;  // Finaliza os serviços de Impressao
end;

procedure TFNotaEntrada_Confirma.BtPrazoClick(Sender: TObject);
begin
  if FPrazoVencimentoCons = nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  if FPrazoVencimentoCons.showModal = mrOk then
  begin
    MePrazo.Text := DMPrazoVencimento.QPrazoVencimento_ConsCod_Prazo_Vencimento.Text;
    MePrazoExit(Self);
  end;
end;

procedure TFNotaEntrada_Confirma.MePrazoExit(Sender: TObject);
begin
  if Trim(MePrazo.Text) <> '' then
  begin
    geraParcelas;
    MEDiasCP.SetFocus;
  end;
end;

procedure TFNotaEntrada_Confirma.geraParcelas;
var wLinha, wAux, wParc: string;
  wParcela, wSoma, wDiferenca: Real;
  wCont: Integer;
  wComissao: Extended;
const wBranco: string = '                            ';
begin
  if Trim(MePrazo.Text) <> '' then
  begin
    wParc := DMOracle.BuscaNome('SELECT NUM_PARCELAS FROM TB_PRAZO_VENCIMENTO', 'COD_PRAZO_VENCIMENTO = ' + Trim(MePrazo.Text));
    if wParc = '' then
      raise Exception.Create('Código de parcelas inexistente');
//    wAux := DMOracle.BuscaNome('SELECT VAL_MINIMO_VENDA FROM TB_PRAZO_VENCIMENTO', 'COD_PRAZO_VENCIMENTO = ' + Trim(MePrazo.Text));
//    if StrToFloat(wAux) <> 0 then
//      if StrToFloat(EdTotalNF.Text) < StrToFloat(wAux) then
//      begin
//        MePrazo.SetFocus;
//        raise Exception.Create('Valor da nota menor que mínimo exigido para este prazo');
//      end;
    DMPrazoVencimento.QPrazoVencimentoDias.Close;
    DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('COD_PRAZO_VENCIMENTO', Trim(MePrazo.Text));
//    DMPrazoVencimento.QPrazoVencimentoDias.SetVariable('NUM_DIAS', NULL);
    DMPrazoVencimento.QPrazoVencimentoDias.Open;
    LBContaPagar.Items.Clear;
//    if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEBONA') and (not DMNotaEntrada.QNotaEntradaCOD_VENDEDOR.IsNull)) then //and (not DMNotaSaida.QNotaSaidaNUM_PEDIDO.IsNull)) then
//    begin
//      wComissao := StrToFloat(Bib.LimpaNumero(EComissao.Text, True)); //StrToFloat(DMOracle.FastSelect('VAL_COMISSAO', 'TB_PEDIDO_CAB', 'NUM_PEDIDO = ' + DMNotaSaida.QNotaSaidaNUM_PEDIDO.Text + ' AND COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCOD_FILIAL.Text));
//      if wParc = '1' then
//        wParcela := Trunc(StrToFloat(EdTotalNF.Text) / StrToFloat(wParc) * 100) / 100
//      else
//        wParcela := Trunc((StrToFloat(EdTotalNF.Text) - wComissao) / (StrToFloat(wParc) - 1) * 100) / 100;
//      wCont := 0;
//      wSoma := 0;
//      while not (DMPrazoVencimento.QPrazoVencimentoDias.Eof) do
//      begin
//        if ((wParc <> '1') and (DMPrazoVencimento.QPrazoVencimentoDias.RecNo = 1)) then
//        begin
//          wLinha := DateToStr(Date + DMPrazoVencimento.QPrazoVencimentoDiasNUM_DIAS.Value);
//          wAux := FormatFloat('###,###,##0.00', wComissao);
//          EDataComissao.Text := FormatDateTime('dd/mm/yyyy', Date + DMPrazoVencimento.QPrazoVencimentoDiasNUM_DIAS.Value);
//          Inc(wCont);
//          wSoma := wSoma + wComissao;
//        end
//        else
//        begin
//          if DMPrazoVencimento.QPrazoVencimentoDias.RecNo = 1 then
//            EDataComissao.Text := FormatDateTime('dd/mm/yyyy', Date + DMPrazoVencimento.QPrazoVencimentoDiasNUM_DIAS.Value);
//          Inc(wCont);
//          wSoma := wSoma + wParcela;
//          if wCont = StrToInt(wParc) then
//          begin
//            wDiferenca := StrToFloat(EdTotalNF.Text) - wSoma;
//            wParcela := wParcela + wDiferenca;
//          end;
//          wLinha := DateToStr(Date + DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value);
//          wAux := FormatFloat('###,###,##0.00', wParcela);
//        end;
//        wAux := Copy(wBranco, 1, 15 - Length(waux)) + wAux;
//        wLinha := wLinha + wAux;
//        LBContaReceber.Items.Add(wLinha);
//        DMPrazoVencimento.QPrazoVencimentoDias.Next;
//      end;
//    end
//    else
//    begin
//      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' then
//        wParcela := (StrToFloat(EdTotalNF.Text) - DMNotaSaida.QSomaItemNotaSVAL_IPI.Value) / StrToFloat(wParc)
//      else
      wParcela := Trunc(StrToFloat(EdTotalNF.Text) / StrToFloat(wParc) * 100) / 100;
      wCont := 0;
      wSoma := 0;
      while not (DMPrazoVencimento.QPrazoVencimentoDias.Eof) do
      begin
        Inc(wCont);
//        if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS') and (wCont = 1)) then
//          wSoma := wSoma + wParcela + DMNotaSaida.QSomaItemNotaSVAL_IPI.Value
//        else
        wSoma := wSoma + wParcela;
        if wCont = StrToInt(wParc) then
        begin
          wDiferenca := StrToFloat(EdTotalNF.Text) - wSoma;
          wParcela := wParcela + wDiferenca;
        end;
        wLinha := DateToStr(DMNotaEntrada.QNotaEntradaDT_RECEBIMENTO.Value + DMPrazoVencimento.QPrazoVencimentoDiasNum_Dias.Value);  //estava pegando a data do servidor. Vanessa 17/11/2014
//        if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS') and (wCont = 1)) then
//          wAux := FormatFloat('###,###,##0.00', wParcela + DMNotaSaida.QSomaItemNotaSVAL_IPI.Value)
//        else
        wAux := FormatFloat('###,###,##0.00', wParcela);
        wAux := Copy(wBranco, 1, 15 - Length(waux)) + wAux;
        wLinha := wLinha + wAux;
        LBContaPagar.Items.Add(wLinha);
        DMPrazoVencimento.QPrazoVencimentoDias.Next;
      end;
//    end;
    MEDataCP.Text := '';
    MEValorCP.Text := '';
    MePrazo.Text := '';
  end;
end;

End.
