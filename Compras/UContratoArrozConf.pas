unit UContratoArrozConf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TFContratoArrozConf = class(TForm)
    GPContasPagar: TGroupBox;
    Label31: TLabel;
    MEDepartamento: TMaskEdit;
    BtConsDepartamento: TBitBtn;
    EdDepartamento: TEdit;
    Label6: TLabel;
    MEFinalidade: TMaskEdit;
    BtConsFinalidade: TBitBtn;
    EdFinalidade: TEdit;
    LBContaPagar: TListBox;
    Panel1: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    MEDiasCP: TMaskEdit;
    Label20: TLabel;
    Label4: TLabel;
    MEDataCP: TMaskEdit;
    MEValorCP: TMaskEdit;
    Label5: TLabel;
    BtApagaParcela: TBitBtn;
    BtAvancar: TBitBtn;
    BtCancelar: TBitBtn;
    Label1: TLabel;
    MeTotalContrato: TMaskEdit;
    RgFormaPagto: TRadioGroup;
    Label38: TLabel;
    MeBanco: TMaskEdit;
    MeAgencia: TMaskEdit;
    Label39: TLabel;
    MeContaCorrente: TMaskEdit;
    Label40: TLabel;
    MeCnpjCpf: TMaskEdit;
    Label41: TLabel;
    Label42: TLabel;
    MeNomeTitular: TMaskEdit;
    LblGeraCp: TLabel;
    procedure MEDepartamentoExit(Sender: TObject);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure MEFinalidadeExit(Sender: TObject);
    procedure BtConsFinalidadeClick(Sender: TObject);
    procedure MEDiasCPExit(Sender: TObject);
    procedure MEValorCPExit(Sender: TObject);
    procedure BtApagaParcelaClick(Sender: TObject);
    procedure BtAvancarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoArrozConf: TFContratoArrozConf;

implementation

uses UOracle_cl, UDepartamentoCons, UDepartamento_cl, UFinalidadeCons,
  UFinalidade_cl, UContratoArroz, UContratoArroz_cl, UBiblioteca, UUsuario_cl,
  USerie_cl, UParamSistema_cl, UPlanilha_cl;

{$R *.DFM}

procedure TFContratoArrozConf.MEDepartamentoExit(Sender: TObject);
begin
  If Trim(MEDepartamento.Text) <> '' Then
    EdDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MEDepartamento.Text)
  Else
    EdDepartamento.Text := '';

end;

procedure TFContratoArrozConf.BtConsDepartamentoClick(Sender: TObject);
begin
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
  Begin
    MEDepartamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    MEDepartamentoExit(Self);
  End;

end;

procedure TFContratoArrozConf.MEFinalidadeExit(Sender: TObject);
begin
  If Trim(MEFinalidade.Text) <> '' Then
    EdFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MEFinalidade.Text)
  Else
    EdFinalidade.Text := '';

end;

procedure TFContratoArrozConf.BtConsFinalidadeClick(Sender: TObject);
begin
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.showModal = mrOk then
  Begin
    MEFinalidade.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    MEFinalidadeExit(Self);
  End;

end;

procedure TFContratoArrozConf.MEDiasCPExit(Sender: TObject);
begin
  If Trim(MEDiasCP.Text) <> '' then
  Begin
    MEDataCP.Text := DateToStr( DMContratoArroz.QContrato_ArrozDt_Emissao.Value + StrToFloat(MEDiasCP.Text) );
    MEDiasCP.Text := '';
  End;
end;

procedure TFContratoArrozConf.MEValorCPExit(Sender: TObject);
Var wLinha, wAux : String;
Const wBranco : String = '                            ';
begin
  If (MEDataCP.Text <> '') and
     (MEValorCP.Text <> '') then
  Begin
    wLinha := DateToStr( StrToDate(MEDataCP.Text) );
    wAux := '     '+FormatFloat('###,###,##0.00',StrToFloat(MEValorCP.Text));
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
    MEDiasCP.SetFocus;
  End;

end;

procedure TFContratoArrozConf.BtApagaParcelaClick(Sender: TObject);
begin
  LBContaPagar.Items.Delete(LBContaPagar.ItemIndex);

end;

procedure TFContratoArrozConf.BtAvancarClick(Sender: TObject);
Var wTotalParcelas, wFunrural, wDesconto : Real;
     wCont : Integer;
     wAux :String;
     wListaParcela : TStrings;
     x, y: array of string;
begin
  If LblGeraCp.Caption = 'SIM' Then
   Begin
     wTotalParcelas := 0;
     wListaParcela := LbContaPagar.Items;
     For wCont := 0 to wListaParcela.Count - 1 do
     Begin
       wAux := Copy(wListaParcela[wCont],11,15);
       wAux := Bib.LimpaString(wAux,'.');
       wTotalParcelas := wTotalParcelas + StrToFloat(wAux);
     End;
     If Not Bib.ComparaNumero( wTotalParcelas, StrToFloat(MeTotalContrato.Text),2) then
        Raise Exception.Create('Soma das parcelas diferente do valor total da nota!');
     If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
      If RGFormaPagto.ItemIndex = 1 then
       if (MEBanco.Text = '') or (MEAgencia.Text = '') or (MEContaCorrente.Text = '') or (MECnpjCpf.Text = '') or
          (MENomeTitular.Text = '') then
          Raise Exception.Create('Dados bancários não preenchidos corretamente');
   End;
  // gera contas a pagar
  With DMContratoArroz Do
  Begin
    Try
      If LblGeraCp.Caption = 'SIM' Then
         GeraContaPagar(QContrato_ArrozCod_Contrato_Arroz.Value,LBContaPagar.Items, StrToInt(Trim(MEFinalidade.Text)),Trim(MEDepartamento.Text),RgFormaPagto.ItemIndex);
      setLength(x, 11); //11 sql diferentes
      setLength(y, 11);
      x[0] := 'SELECT COD_ESTADO FROM TB_CADASTRO WHERE COD_CADASTRO = '+QContrato_ArrozCod_Cadastro.Text;
      x[1] := 'SELECT COD_SERIE FROM TB_OPERACAO WHERE COD_OPERACAO = '+QContrato_ArrozCod_Operacao.Text;
      x[2] := 'SELECT IND_TIPO_OPERACAO FROM TB_OPERACAO WHERE COD_OPERACAO = '+QContrato_ArrozCod_Operacao.Text;
      x[3] := 'SELECT COD_SERIE FROM TB_FILIAL WHERE COD_FILIAL = '+QContrato_ArrozCod_Filial.Text;
      x[4] := 'SELECT NUM_EMBALAGEM FROM TB_PRODUTO WHERE COD_PRODUTO = '+QContrato_ArrozCod_Produto.Text;
      x[5] := 'SELECT IND_CONTRATO_ARROZ FROM TB_OPERACAO WHERE COD_OPERACAO = '+QContrato_ArrozCod_Operacao.Text;
      x[6] := 'SELECT VAL_VAREJO FROM TB_PRODUTO WHERE COD_PRODUTO = '+QContrato_ArrozCod_Produto.Text;
      x[7] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+QContrato_ArrozCod_Cadastro.Text;
      x[8] := 'SELECT COD_CONTABIL_CONTRATO_INC_DEB FROM TB_OPERACAO WHERE COD_OPERACAO = '+QContrato_ArrozCod_Operacao.Text;
      x[9] := 'SELECT COD_CONTABIL_CONTRATO_INC_CRED FROM TB_OPERACAO WHERE COD_OPERACAO = '+QContrato_ArrozCod_Operacao.Text;
      x[10] := 'SELECT COD_HISTORICO_CONTABIL FROM TB_OPERACAO WHERE COD_OPERACAO = '+QContrato_ArrozCod_Operacao.Text;

      DMOracle.BuscaNomes(x, y);

      QNotaSaidaCab.Open;
      QNotaItem.Open;
      QNotaSaidaCab.Insert;
      QNotaSaidaCabNUM_NOTA.Value := 0;
      QNotaSaidaCabCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
      QNotaSaidaCabCOD_FILIAL.Value := QContrato_ArrozCod_Filial.Value;
      QNotaSaidaCabCOD_OPERACAO.Value := QContrato_ArrozCod_Operacao.Value;
      QNotaSaidaCabCOD_ESTADO.Value := Y[0];
//      QNotaSaidaCabCOD_VENDEDOR.Value
      QNotaSaidaCabCOD_CADASTRO.Value := QContrato_ArrozCod_Cadastro.Value;
      If Y[1] <> '' Then
         QNotaSaidaCabCOD_SERIE.Value := Y[1] // serie do cadastro de operacao
      Else
         QNotaSaidaCabCOD_SERIE.Value := Y[3]; // serie do cadastro de filial
      QNotaSaidaCabIND_SITUACAO.Value := '1';
      If LblGeraCp.Caption = 'SIM' Then
         QNotaSaidaCabIND_CONDICAO_PAGTO.Value := '2'
      Else
         QNotaSaidaCabIND_CONDICAO_PAGTO.Value := '1';
      QNotaSaidaCabDT_EMISSAO.Value := QContrato_ArrozDt_Emissao.Value;
      QNotaSaidaCabDT_MOVIMENTO.Value := DMOracle.DataHoraServ;
      QNotaSaidaCabDT_RECEBIMENTO.Value := DMOracle.DataServ;
      QNotaSaidaCabVAL_DESPESAS.Value := 0;
      QNotaSaidaCabIND_ENTRADA_SAIDA.Value := Y[2];
      QNotaSaidaCabVAL_FRETE.Value := 0;
      QNotaSaidaCabVAL_DESCONTO.Value := 0;
      QNotaSaidaCabVAL_AVISTA.Value := 0;
      QNotaSaidaCabIND_TIPO_FRETE.Value := 'CIF';
      QNotaSaidaCabOBS.Value := 'Ref. contrato arroz nr ' + QContrato_ArrozNum_Contrato.Text;
      QNotaSaidaCabDT_USUARIO.Value := DMOracle.DataHoraServ;
      QNotaSaidaCabVAL_TOTAL_IPI.Value := 0;
      QNotaSaidaCabVAL_ICM_FRETE.Value := 0;
      QNotaSaidaCabVAL_ICM_BASE_FRETE.Value := 0;
      QNotaSaidaCabVAL_FUNRURAL.Value := 0;
      QNotaSaidaCabPERC_COMISSAO.Value := 0;
      QNotaSaidaCabCOD_DEPARTAMENTO.Value := DMUsuario.CodDepartamentoUsuario;
      QNotaSaidaCabVAL_PEDAGIO.Value := 0;
      QNotaSaidaCabVAL_IMPOSTO.Value := 0;
      QNotaSaidaCabVAL_DESCONTO_FITAS.Value := 0;
      wDesconto := 0;
      if (QContrato_ArrozCod_Operacao.Value = 196) Or
         (QContrato_ArrozCod_Operacao.Value = 197) Or
         (QContrato_ArrozCod_Operacao.Value = 198) Or
         (QContrato_ArrozCod_Operacao.Value = 199) Then  // foi solicitacao do Joao Fernando dia 05/06/2007
       Begin
         wDesconto := QContrato_ArrozQt_Quantidade.Value * StrToFloat(Y[6]) / StrToFloat(y[4]);
         QNotaSaidaCabVal_Desconto.Value := wDesconto;
       End;
      QNotaSaidaCab.Post;

      QNotaItem.Insert;
      QNotaItemCOD_NOTA_CAB.Value := QNotaSaidaCabCod_Nota_Cab.Value;
      QNotaItemCOD_TRIBUTACAO.Value := QContrato_ArrozCod_Tributacao.Value;
      QNotaItemQT_QUANTIDADE.Value := QContrato_ArrozQt_Quantidade.Value;
      If QNotaSaidaCabCOD_SERIE.Value = 'CON' Then
       Begin
         wFunrural := (QContrato_ArrozQt_Quantidade.Value * QContrato_ArrozVl_Preco_Saca.Value / StrToFloat(Y[4]) + QContrato_ArrozVl_Arredondamento.Value) * QContrato_ArrozPerc_Funrural.Value / 100;
         QNotaItemVAL_TOTAL.Value := QContrato_ArrozQt_Quantidade.Value * QContrato_ArrozVl_Preco_Saca.Value / StrToFloat(Y[4]) + QContrato_ArrozVl_Arredondamento.Value - wFunrural;
       End
      Else
         QNotaItemVAL_TOTAL.Value := QContrato_ArrozQt_Quantidade.Value * QContrato_ArrozVl_Preco_Saca.Value / StrToFloat(Y[4]) + QContrato_ArrozVl_Arredondamento.Value;
      QNotaItemPERC_IPI.Value := 0;
      QNotaItemPERC_COMISSAO.Value := 0;
      QNotaItemCOD_PRODUTO.Value := QContrato_ArrozCod_Produto.Value;
      QNotaItemCOD_LOTE_TIPO.Value := 1;
      QNotaItemVAL_DESCONTO.Value := wDesconto;
      QNotaItemVAL_DESPESAS.Value := 0;
      QNotaItemVAL_FRETE.Value := 0;
      QNotaItemPERC_DESCONTO.Value := 0;
      QNotaItemVAL_IPI.Value := 0;
      QNotaItemVAL_UNITARIO.Value := QContrato_ArrozVl_Preco_Saca.Value;
      QNotaItemVAL_ICM_BASE.Value := 0;
      QNotaItemVAL_ICM.Value := 0;
      QNotaItemIND_CLASS_IPI.Value := '5';
      QNotaItemVAL_CUSTO.Value := wTotalParcelas;
      QNotaItemVAL_ISS.Value := 0;
      QNotaItemPERC_INSS.Value := 0;
      QNotaItemPERC_BENEFICIADO.Value := 0;
      QNotaItemIND_BX_CONTR_VEND.Value := 'N';
      QNotaItemQT_CHEGADA.Value := 0;
      QNotaItemVAL_PIS.Value := 0;
      QNotaItemPERC_DESC.Value := 0;
      QNotaItemVAL_CONFINS.Value := 0;
      QNotaItemVAL_BASE_SUBST.Value := 0;
      QNotaItemVAL_ICMS_SUBST.Value := 0;
      QNotaItemVAL_UNITARIO_TABELA.Value := QContrato_ArrozVl_Preco_Saca.Value;
      QNotaItemVAL_DPI_TRANSGENICOS.Value := 0;
      QNotaItemQT_CREDITO_TRANSGENICOS.Value := 0;
      QNotaItemVAL_FACS.Value := 0;
      QNotaItemVAL_FETHAB.Value := 0;
      QNotaItemDesc_Renda.Value := IntToStr(Trunc(QContrato_ArrozPERC_GRAOS_INTEIROS.Value)) + '/' + IntToStr(Trunc(QContrato_ArrozPERC_GRAOS_QUEBRADOS.Value));
      QNotaItem.Post;
      QNotaItem.CommitUpdates;
    Except
      DMOracle.DBCemapa.RollBack;
      Raise;
    End;
  End;

  // contabiliza contrato de arroz - inclusao

  If (Y[8] <> '') And (Y[9] <> '') Then
   Begin
     If Y[10] = '' Then
        Raise exception.Create('Historico contabil da operação esta em branco ');
      DMPlanilha.GravaLanc('ARROZ',
                         DMContratoArroz.QContrato_ArrozCOD_CONTRATO_ARROZ.Value,
                         FloatToStr(DMContratoArroz.QContrato_ArrozNUM_CONTRATO.Value)+'-'+Y[7],
                         DMContratoArroz.QContrato_ArrozCod_Filial.Value,
                         Y[9],
                         'CREDITO',
                         DMContratoArroz.QContrato_ArrozCod_Cadastro.Value,
                         StrToInt(Y[10]),
                         DMContratoArroz.QNotaItemVAL_TOTAL.Value,
                         DMContratoArroz.QContrato_ArrozDt_Emissao.Value,
                         Y[8]);

      DMPlanilha.GravaLanc('ARROZ',
                         DMContratoArroz.QContrato_ArrozCOD_CONTRATO_ARROZ.Value,
                         FloatToStr(DMContratoArroz.QContrato_ArrozNUM_CONTRATO.Value)+'-'+Y[7],
                         DMContratoArroz.QContrato_ArrozCod_Filial.Value,
                         Y[8],
                         'DEBITO',
                         DMContratoArroz.QContrato_ArrozCod_Cadastro.Value,
                         StrToInt(Y[10]),
                         DMContratoArroz.QNotaItemVAL_TOTAL.Value,
                         DMContratoArroz.QContrato_ArrozDt_Emissao.Value,
                         Y[9]);
   End;



  DMOracle.DBCemapa.Commit;
  DMContratoArroz.QContrato_Arroz.Edit;
  DMContratoArroz.QContrato_ArrozInd_Situacao.Value := '2';
  DMContratoArroz.QContrato_ArrozCOD_NOTA_CAB.value := DMContratoArroz.QNotaSaidaCabCOD_NOTA_CAB.Value;
  DMContratoArroz.QContrato_Arroz.Post;
  DMContratoArroz.QNotaSaidaCab.Close;
  DMContratoArroz.QNotaItem.Close;
  MeBanco.Clear;
  MeAgencia.Clear;
  MeContaCorrente.Clear;
  MeCnpjCpf.Clear;
  MeNomeTitular.Clear;
end;

procedure TFContratoArrozConf.FormActivate(Sender: TObject);
Var wEmbalagem,wFunrural,wValorContrato:Real;
begin
  With DMContratoArroz do
  Begin
    wEmbalagem := StrToFloat(DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QContrato_ArrozCod_Produto.Value)));
    wFunrural := QContrato_ArrozQt_Quantidade.Value * QContrato_ArrozVl_Preco_Saca.Value / wEmbalagem * QContrato_ArrozPerc_Funrural.Value / 100;
    wValorContrato := QContrato_ArrozQt_Quantidade.Value * QContrato_ArrozVl_Preco_Saca.Value / wEmbalagem - wFunrural - QContrato_ArrozVl_Adiantamento.Value + QContrato_ArrozVl_Arredondamento.Value;
//    MeTotalContrato.Text := FloatToStr(wValorContrato);
    MeTotalContrato.Text := FormatFloat('#####0.00',wValorContrato);
  End;
  If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO' Then
  Begin
    RgFormaPagto.ItemIndex := 0;
    RgFormaPagto.Visible := False;
  End;

  LBContaPagar.Items.Clear;
end;

end.
