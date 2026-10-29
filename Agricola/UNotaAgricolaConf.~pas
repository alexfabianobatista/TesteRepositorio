unit UNotaAgricolaConf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ComCtrls, Buttons, Db, DBTables, ExtCtrls;

type
  TFNotaAgricolaConf = class(TForm)
    BtAvanca: TBitBtn;
    BtCancela: TBitBtn;
    PCConfirma: TPageControl;
    TabSheet1: TTabSheet;
    GBCPNota: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MEDataCP: TMaskEdit;
    MEValorCP: TMaskEdit;
    BtApagaParcela: TBitBtn;
    LBContaPagar: TListBox;
    MEFinalidade: TMaskEdit;
    BtConsFinalidade: TBitBtn;
    EdFinalidade: TEdit;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    MEDias: TMaskEdit;
    Label7: TLabel;
    MEDepartamento: TMaskEdit;
    BtConsDepartamento: TBitBtn;
    EdDepartamento: TEdit;
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
    Label3: TLabel;
    METotalNF: TMaskEdit;
    RgFormaPagto: TRadioGroup;
    procedure MEFinalidadeExit(Sender: TObject);
    procedure BtConsFinalidadeClick(Sender: TObject);
    procedure BtApagaParcelaClick(Sender: TObject);
    procedure MEValorCPExit(Sender: TObject);
    procedure BtAvancaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MEDiasExit(Sender: TObject);
    procedure BtCancelaClick(Sender: TObject);
    procedure MEDepartamentoExit(Sender: TObject);
    procedure BtConsDepartamentoClick(Sender: TObject);
  private
    procedure confirmanota;
    procedure finaliza;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaAgricolaConf: TFNotaAgricolaConf;

implementation

uses UOracle_cl, UFinalidadeCons, UFinalidade_cl,
  UNotaEntrada_cl, USerie_cl, UOperacao_cl,
  UDepartamento_cl, UNotaImpressao, UDepartamentoCons, UParamSistema_cl,
  UCadastro_cl, UNfe_cl, UPagamentosNFe4, UNotaSaida_cl;

{$R *.DFM}

procedure TFNotaAgricolaConf.MEFinalidadeExit(Sender: TObject);
begin
  If Trim(MEFinalidade.Text) <> '' Then
    EdFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MEFinalidade.Text);
end;

procedure TFNotaAgricolaConf.BtConsFinalidadeClick(Sender: TObject);
begin
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.showModal = mrOk then
  Begin
    MEFinalidade.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    MEFinalidadeExit(Self);
  End;

end;

procedure TFNotaAgricolaConf.BtApagaParcelaClick(Sender: TObject);
begin
  LBContaPagar.Items.Delete(LBContaPagar.ItemIndex);
end;

procedure TFNotaAgricolaConf.MEValorCPExit(Sender: TObject);
Var wLinha, wAux : String;
Const wBranco : String = '                            ';
begin
  If (MEDataCP.Text <> '') and
     (MEValorCP.Text <> '') then
  Begin
    If StrToDate(MEDataCP.Text) < Date Then
       Raise Exception.Create('Data de vencimento deve ser maior ou igual que data atual');
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
       If RgFormaPagto.ItemIndex = -1 Then
          Raise Exception.Create('Escolher Forma Pagamento');
    wLinha := DateToStr( StrToDate(MEDataCP.Text) );
    wAux := FormatFloat('###,###,##0.00',StrToFloat(MEValorCP.Text));
    wAux := Copy(wBranco,1,15-Length(waux)) + wAux;
    wLinha := wLinha + wAux;
    wAux := Copy(wBranco,1,15);  // ISSO É O VALOR INDEXADO QUE NA FIXACAO NAO TEM
    wAux := wAux + '-' + Copy(wBranco,1,4-Length(MeBanco.Text)) + MeBanco.Text;
    wAux := wAux + '-' + Copy(wBranco,1,6-Length(MeAgencia.Text)) + MeAgencia.Text;
    wAux := wAux + '-' + Copy(wBranco,1,10-Length(MeContaCorrente.Text)) + MeContaCorrente.Text;
    wAux := wAux + '-' + Copy(wBranco,1,18-Length(MeCnpjCpf.Text)) + MeCnpjCpf.Text;
    wAux := wAux + '-' + Copy(wBranco,1,30-Length(MeNomeTitular.Text)) + MeNomeTitular.Text;
    wLinha := wLinha + wAux;
    LBContaPagar.Items.Add(wLinha);
    MEDataCP.Clear;
    MEValorCP.Clear;
    MEDataCP.SetFocus;
  End;
end;

procedure TFNotaAgricolaConf.BtAvancaClick(Sender: TObject);
begin
  Case PcConfirma.ActivePage.PageIndex of
    0 : Begin // Aba de Conta Pagar
    //      GeraContasPagar;
          If RgFormaPagto.ItemIndex = 1 Then
             If (Trim(MeBanco.Text) = '') Or (Trim(MeAgencia.Text) = '') Or (Trim(MeContaCorrente.Text) = '') Or
                (Trim(MeCnpjCpf.Text) = '') Or (Trim(MeNomeTitular.Text) = '') Then
                Raise Exception.Create('Para deposito bancario - Preencher os dados corretos');
          If DMNotaEntrada.QNotaEntradaInd_Condicao_Pagto.Value = '2' Then
             DMNotaEntrada.ValidaContaPagar(DMNotaEntrada.QnotaEntradaCod_Nota_Cab.Value,
                           LBContaPagar.Items, StrToFloat(MEFinalidade.Text),
                           'NOTA_AGRICOLA');
          DMNotaEntrada.QNotaEntrada.Edit;
          If DMNotaEntrada.QNotaEntradaNum_Nota.Value = 0 then
               DMNotaEntrada.QNotaEntradaNum_Nota.Value := DMSerie.NumeroSerie(DMNotaEntrada.QNotaEntradaCod_Filial.Value,DMNotaEntrada.QNotaEntradaCod_Serie.Value,
                DMNotaEntrada.QNotaEntradaCOD_SERIE_MODELO.Value);
          If DMNotaEntrada.QNotaEntradaInd_Condicao_Pagto.Value = '2' Then
             DMNotaEntrada.GeraContaPagar(DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Value,LBContaPagar.Items,StrToInt(Trim(MEFinalidade.Text)),RgFormaPagto.ItemIndex,'NOTA',MEDepartamento.Text,'',0,0,'','','');
          ConfirmaNota;
//          PCConfirma.Pages[0].TabVisible := False;
//          PCConfirma.Pages[1].TabVisible := True;
          Finaliza;
        end;
    1 : Finaliza;
  end;
end;

procedure TFNotaAgricolaConf.FormActivate(Sender: TObject);
Var wContaPagarContrato : String;
begin
  MeBanco.Clear;
  MeAgencia.Clear;
  MeContaCorrente.Clear;
  MeCnpjCpf.Clear;
  MeNomeTitular.Clear;
  Try
    DMNotaEntrada.QSomaItemNota.Close;
//    DMNotaEntrada.QSomaItemNota.SetVariable('COD_NOTA_CAB',DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Value);
    DMNotaEntrada.QSomaItemNota.Open;
//    DMNotaEntrada.QNotaEntrada.Edit;
    METotalNF.Text := FloatToStr(DMNotaEntrada.QSomaItemNotaSVal_Total_Nota.Value + DMNotaEntrada.QNotaEntradaVal_Desconto.Value - DMNotaEntrada.QSomaItemNotaSVal_Dpi_Transgenicos.Value -
                      DMNotaEntrada.QNotaEntradaVal_Desconto_Fitas.Value - DMNotaEntrada.QSomaItemNotaSVal_Facs.Value - DMNotaEntrada.QSomaItemNotaSVal_Fethab.Value);
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
     Begin
       MeDepartamento.Text := '5';
       Case Trunc(DMNotaEntrada.QItemNFCod_Produto.Value) Of
         41,1723,1731 : MeFinalidade.Text := '20';
         42,411 : MeFinalidade.Text := '21';
         243,244,267,270 : MeFinalidade.Text := '22';
       End;
       DMCadastro.QCadastro.Close;
       DMCadastro.QCadastro.SetVariable('Pk',DMNotaEntrada.QNotaEntradaCod_Cadastro.Value);
       DMCadastro.QCadastro.Open;
       MeBanco.Text := DMCadastro.QCadastroCod_Banco_Agencia.Text;
       MeAgencia.Text := DMCadastro.QCadastroDesc_Agencia.Text;
       MeContaCorrente.Text := DMCadastro.QCadastroDesc_Conta_Corrente.Text;
       MeCnpjCpf.Text := DMCadastro.QCadastroDESC_COMPLEMENTO.Text;
       MeNomeTitular.Text := DMCadastro.QCadastroNome_Titular.Text;
     End
    Else
     Begin
       RgFormaPagto.ItemIndex := 0;
       RgFormaPagto.Visible := False;
     End;
    With DMOperacao do
    Begin
      QOperacao.Close;
      QOperacao.SetVariable('PK',DMNotaEntrada.QNotaEntradaCod_Operacao.Value);
      QOperacao.Open;
    End;
    If (DMNotaEntrada.QNotaEntradaCod_Contrato_Mov.Text = '') or (DMParamSistema.QparamSistemaCod_Empresa.Value = 'GRASEL') Then  // PARA GERAR CONTAS A PAGAR DO CONTRATO COMPRA FUTURA
       wContaPagarContrato := 'Sim'
    else
       wContaPagarContrato := 'Nao';
    If (DMOperacao.QOperacaoInd_Conta_Pagar.Value = 'S') and (wContaPagarContrato = 'Sim') then
    begin
      PCConfirma.Pages[0].TabVisible := True;
      PCConfirma.Pages[1].TabVisible := False;
    end
    else
    begin
      PCConfirma.Pages[0].TabVisible := False;
      PCConfirma.Pages[1].TabVisible := True;
      DMNotaEntrada.QNotaEntrada.Edit;
      If DMNotaEntrada.QNotaEntradaNum_Nota.Value = 0 then
         DMNotaEntrada.QNotaEntradaNum_Nota.Value := DMSerie.NumeroSerie(DMNotaEntrada.QNotaEntradaCod_Filial.Value,DMNotaEntrada.QNotaEntradaCod_Serie.Value,
          DMNotaEntrada.QNotaEntradaCOD_SERIE_MODELO.Value);
      ConfirmaNota;
    end;
    LBContaPagar.Items.Clear;
//    DMNotaEntrada.QSomaItemNota.Close;
  Except
    If DMNotaEntrada.QNotaEntrada.State = dsEdit then
      DMNotaEntrada.QNotaEntrada.Cancel;
    If DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Rollback;
    ModalResult := mrCancel;
    Raise;
  End;

end;

procedure TFNotaAgricolaConf.confirmanota;
Var wTipo : Integer;
begin
  // Este procedimento realiza as seguintes operações
  // Atualiza Tributação está sendo feito na before post a query QItemNF
  // Atualiza estoque
  DMNotaEntrada.QNotaEntradaInd_Situacao.Value := '2';
  If (DMNotaEntrada.QNotaEntradaVal_Desconto.Text = '') or
     (DMNotaEntrada.QNotaEntradaVal_Desconto.Value = 0) Then
     If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MOINHO') Or
        (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CITY')   Then
        DMNotaEntrada.CalculaDesconto(DMNotaEntrada.QNotaEntradaCOD_CADASTRO.Value,DMNotaEntrada.QNotaEntradaCOD_FILIAL.Value,DMNotaEntrada.QNotaEntradaCOD_OPERACAO.Value,DMNotaEntrada.QItemNFCOD_NOTA_ITEM.Value,DMNotaEntrada.QItemNFCOD_PRODUTO.Value,DMNotaEntrada.QItemNFQT_QUANTIDADE.Value,'E',DMNotaEntrada.QNotaEntradaCOD_CADASTRO_PARCEIRO.Text)
     Else
       If DMOperacao.QOperacaoInd_Fixar_Empresa.Value = 'F' Then  // para moinho notas de compra nao tem desconto e nem msg 
        DMNotaEntrada.CalculaDesconto(DMNotaEntrada.QNotaEntradaCOD_CADASTRO.Value,DMNotaEntrada.QNotaEntradaCOD_FILIAL.Value,DMNotaEntrada.QNotaEntradaCOD_OPERACAO.Value,DMNotaEntrada.QItemNFCOD_NOTA_ITEM.Value,DMNotaEntrada.QItemNFCOD_PRODUTO.Value,DMNotaEntrada.QItemNFQT_QUANTIDADE.Value,'E',DMNotaEntrada.QNotaEntradaCOD_CADASTRO_PARCEIRO.Text);
  DMNotaEntrada.QSomaItemNota.Close;
  DMNotaEntrada.QSomaItemNota.Open;
  If (DMNotaEntrada.QSomaItemNotasVal_total_nota.Value) < 0 Then
     Raise Exception.Create ('Nota Com Valor Total Negativo - Favor Verificar');
  If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GONZATTI' Then
     DMNotaEntrada.pTipo_Lote := 1;  // resolver problema de atualização estoque de trigo
  wTipo := 1;
  If DMOperacao.QOperacaoInd_Tipo_Operacao.Value = 'S' Then
     wTipo := -1;
  DMNotaEntrada.AtualizaEstoque(DMNotaEntrada.QnotaEntradaCod_Nota_Cab.Value,wTipo);
  DMNotaEntrada.pTipo_Lote := 0;
   // Atualiza contabilidade
  DMNotaEntrada.Contabiliza(DMNotaEntrada.QnotaEntradaCod_Nota_Cab.Value);
  If DMNotaEntrada.QNotaEntradaVal_Desconto_Fitas.Value > 0 Then
   Begin  // esta marcando o ind_baixado como SIM para dar baixa no pagamento das fitas gerado na fixacao
     DMOracle.QExecSQL.Close;  // e na volta da baixa marca como NAO 
     DMOracle.QExecSQL.SQL.Clear;
     DMOracle.QExecSQL.SQL.Add('UPDATE TB_ROMANEIO_FITAS SET IND_BAIXADO = ' + Chr(39) + 'SIM' + Chr(39) + ' WHERE COD_NOTA_CAB = ' + DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.Text);
     DMOracle.QExecSQL.ExecSQL;
   End;
  // Atualiza contas a pagar de funrural
  //  DMNotaEntrada.GeraCPFunRural(1);
  // Atualiza nota fiscal
End;

procedure TFNotaAgricolaConf.finaliza;
Var
  wCodNota : Integer;
Begin 
  wCodNota := DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Value;
  If DMOperacao.QOperacaoInd_Tipo_Operacao.Value = 'S' Then
  begin
    DMNotaEntrada.QNotaEntradaInd_Entrada_Saida.Value := 'S';
    DMNotaEntrada.QNotaEntrada.Post;
    DMNotaSaida.QNotaSaida.Close;
    DMNotaSaida.QNotaSaida.SetVariable('PK', wCodNota);
    DMNotaSaida.QNotaSaida.Open;
  end
  else
    DMNotaEntrada.QNotaEntrada.Post;
  PagamentosNFe4.GeraPagamentos(DMOperacao.QOperacaoInd_Tipo_Operacao.Value);
  DMOracle.DBCemapa.Commit;
  FNotaImpressao.EmiteNF(wCodNota);
  ModalResult := MrOk;
End;

procedure TFNotaAgricolaConf.MEDiasExit(Sender: TObject);
Begin
 If Trim(MEDias.Text) <> '' Then
    MEDataCP.Text := DateToStr(DMNotaEntrada.QNotaEntradaDt_Emissao.Value + strToFloat(MEDias.Text));
End;

procedure TFNotaAgricolaConf.BtCancelaClick(Sender: TObject);
begin
  With DMNotaEntrada do
  Begin
    If QNotaEntrada.State = dsEdit then
      QNotaEntrada.Cancel;
  End;
end;

procedure TFNotaAgricolaConf.MEDepartamentoExit(Sender: TObject);
begin
  If Trim(MEDepartamento.Text) <> '' Then
    EdDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MEDepartamento.Text)
  Else
    EdDepartamento.Text := '';
end;

procedure TFNotaAgricolaConf.BtConsDepartamentoClick(Sender: TObject);
begin
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
  Begin
    MEDepartamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    MEDepartamentoExit(Self);
  End;
end;

end.
