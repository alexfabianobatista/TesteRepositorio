unit UObra_Req_Conf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask;

type
  TFObra_Req_Conf = class(TForm)
    GBCPNota: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label20: TLabel;
    Label31: TLabel;
    MEDataCP: TMaskEdit;
    MEValorCP: TMaskEdit;
    BtApagaParcela: TBitBtn;
    LBContaPagar: TListBox;
    MEFinalidade: TMaskEdit;
    BtConsFinalidade: TBitBtn;
    EdFinalidade: TEdit;
    MEDiasCP: TMaskEdit;
    Panel1: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    MEDepartamento: TMaskEdit;
    BtConsDepartamento: TBitBtn;
    EdDepartamento: TEdit;
    LblTitulo: TLabel;
    BtAvancar: TBitBtn;
    BtCancelar: TBitBtn;
    MeTotal: TMaskEdit;
    Label1: TLabel;
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
  FObra_Req_Conf: TFObra_Req_Conf;

implementation

uses UOracle_cl, UDepartamentoCons, UDepartamento_cl, UFinalidadeCons,
  UFinalidade_cl, UObra_cl, UBiblioteca, UUsuario_cl, UParamSistema_cl,
  UOperacao_cl, UEstoque_cl, UPlanilha_cl;

{$R *.DFM}

procedure TFObra_Req_Conf.MEDepartamentoExit(Sender: TObject);
begin
  If Trim(MEDepartamento.Text) <> '' Then
    EdDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MEDepartamento.Text)
  Else
    EdDepartamento.Text := '';
end;

procedure TFObra_Req_Conf.BtConsDepartamentoClick(Sender: TObject);
begin
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
  Begin
    MEDepartamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
    MEDepartamentoExit(Self);
  End;
end;

procedure TFObra_Req_Conf.MEFinalidadeExit(Sender: TObject);
begin
  If Trim(MEFinalidade.Text) <> '' Then
    EdFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MEFinalidade.Text)
  Else
    EdFinalidade.Text := '';
end;

procedure TFObra_Req_Conf.BtConsFinalidadeClick(Sender: TObject);
begin
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.showModal = mrOk then
  Begin
    MEFinalidade.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    MEFinalidadeExit(Self);
  End;
end;

procedure TFObra_Req_Conf.MEDiasCPExit(Sender: TObject);
begin
  If Trim(MEDiasCP.Text) <> '' then
  Begin
    MEDataCP.Text := DateToStr( DMObra.QObra_Req_CabDt_Emissao.Value + StrToFloat(MEDiasCP.Text) );
    MEDiasCP.Text := '';
  End;
end;

procedure TFObra_Req_Conf.MEValorCPExit(Sender: TObject);
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
    LBContaPagar.Items.Add(wLinha);
    MEDataCP.Text := '';
    MEValorCP.Text := '';
    MEDiasCP.SetFocus;
  End;
end;

procedure TFObra_Req_Conf.BtApagaParcelaClick(Sender: TObject);
begin
  LBContaPagar.Items.Delete(LBContaPagar.ItemIndex);
end;

procedure TFObra_Req_Conf.BtAvancarClick(Sender: TObject);
Var wTotalParcelas, wQt_Atu_Estoque, wValImpostos : Real;
    wCont,wNumero : Integer;
    wAux,wContra,wConta_Cred : String;
    wValContabilizacaoNota : real;
Begin

  try
    DMOperacao.QOperacao.Close;
    DMOperacao.QOperacao.SetVariable('PK',DMObra.QObra_Req_CabCod_Operacao.Value);
    DMOperacao.QOperacao.Open;
    wTotalParcelas := 0;
    For wCont := 0 to LBContaPagar.Items.Count - 1 do
    Begin
      wAux := Copy(LBContaPagar.Items[wCont],11,15);
      wAux := Bib.LimpaString(wAux,'.');
      wTotalParcelas := wTotalParcelas + StrToFloat(wAux);
    End;
    DmObra.QSomaObraReq.Close;
    DmObra.QSomaObraReq.Open;

    wValImpostos := DMObra.QObra_Req_CabVAL_PIS.Value +
                    DMObra.QObra_Req_CabVAL_COFINS.Value +
                    DMObra.QObra_Req_CabVAL_IRRF.Value +
                    DMObra.QObra_Req_CabVAL_CSLL.Value +
                    DMObra.QObra_Req_CabVAL_INSS.Value +
                    DMObra.QObra_Req_CabVAL_ISSQN.Value;

    If DMObra.QObra_Req_CabNum_Nota_Fiscal.Text <> '' Then
      wNumero := DMObra.QObra_Req_CabNum_Nota_Fiscal.Value
    Else
      wNumero := DMObra.QObra_Req_CabNum_Requisicao.Value;
    If DMObra.QObra_Req_CabInd_Condicao_Pagto.Value = '2' Then // A prazo
    Begin
      If Not Bib.ComparaNumero(wTotalParcelas, DmObra.QSomaObraReqTotal.Value-DMObra.QObra_Req_CabVal_Desconto.Value +DMObra.QObra_Req_CabVal_Acrescimo.Value - wValImpostos,2) then
        Raise Exception.Create('Soma das parcelas diferente do valor total da Requisição!');
      For wCont := 0 to LBContaPagar.Items.Count - 1 do
      Begin
        DMObra.QContasPagar_Cab.Open;
        DMObra.QContasPagar_Mov.Open;
        Try
          DMObra.QContasPagar_Cab.Insert;
          DMObra.QContasPagar_CabCOD_FINALIDADE.Value := StrToInt(Trim(MeFinalidade.Text));
          DMObra.QContasPagar_CabCOD_CADASTRO.Value := DMObra.QObra_Req_CabCod_Cadastro.Value;
          DMObra.QContasPagar_CabDT_EMISSAO.Value := Trunc(Date); // DMObra.QObra_Req_CabDt_Emissao.Value; foi solicitado pelo Leandro Para Trocar pela data atual
          DMObra.QContasPagar_CabDT_MOVIMENTO.Value := Trunc(Date); //DMObra.QObra_Req_CabDt_Emissao.Value;
          DMObra.QContasPagar_CabNUM_TITULO.Value := wNumero;
          DMObra.QContasPagar_CabCOD_FILIAL.Value := DMObra.QObra_Req_CabCod_Filial.Value;
          DMObra.QContasPagar_CabCOD_DEPARTAMENTO.Value := StrToInt(Trim(MeDepartamento.Text));
          DMObra.QContasPagar_CabNUM_PARCELA.Value := wCont+1;
          DMObra.QContasPagar_CabDESC_TIPO_DOCUMENTO.Value := 'REQ';
          If DMObra.QObra_Req_CabInd_Tipo_Requisicao.Value = 'PROVISORIA' Then
             DMObra.QContasPagar_CabIND_ACEITE.Value := 'NAO'
          Else
             DMObra.QContasPagar_CabIND_ACEITE.Value := 'SIM';
          DMObra.QContasPagar_CabIND_SITUACAO.Value := 'ABERTO';
          DMObra.QContasPagar_CabDT_VENCIMENTO.Value := StrToDate(Copy(LBContaPagar.Items[wCont],1,10) );
          DMObra.QContasPagar_CabDT_CAPITALIZACAO.Value := StrToDate(Copy(LBContaPagar.Items[wCont],1,10) );
          DMObra.QContasPagar_CabCOD_OBRA_REQ_CAB.Value := DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value;
          DMObra.QContasPagar_CabCod_Obra.Value := DMObra.QObra_Req_ItemCod_Obra.Value;
          wAux := Copy(LBContaPagar.Items[wCont],11,15);
          wAux := Bib.LimpaString(wAux,'.');
          DMObra.QContasPagar_CabVAL_TITULO.Value := StrToFloat(wAux );
          DMObra.QContasPagar_CabVAL_ORIGINAL.Value := StrToFloat(wAux );
          DMObra.QContasPagar_Cab.Post;
          DMObra.QContasPagar_Mov.Open;
          DMObra.QContasPagar_Mov.Insert;
          DMObra.QContasPagar_MovCOD_CONTA_PAGAR_CAB.Value := DMObra.QContasPagar_CabCOD_CONTA_PAGAR_CAB.Value;
          DMObra.QContasPagar_MovDt_Movimento.Value := Trunc(Date); // DMObra.QObra_Req_CabDt_Emissao.Value;
          DMObra.QContasPagar_MovInd_Tipo_Movimento.Value := 'PRINCIPAL';
          DMObra.QContasPagar_MovDT_Usuario.Value := DMOracle.DataHoraServ;
          DMObra.QContasPagar_MovCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
          DMObra.QContasPagar_MovVal_Movimento.Value :=  DMObra.QContasPagar_CabVAL_TITULO.Value;
          DMObra.QContasPagar_Mov.Post;
        Except
          DMObra.QContasPagar_Cab.Cancel;
          DMObra.QContasPagar_Mov.Cancel;
          Raise;
        End;
      End;
    End;
    {DMObra.QObra_Req_Cab.Edit;
    DMObra.QObra_Req_CabInd_Situacao.Value := '2';
    DMObra.QObra_Req_Cab.Post;}
    DMObra.OPRequisicaoCab.CallProcedure(
          'CONFIRMA_REQUISICAO',[DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value]);

  //----COMENTADO POR FABIO 28/06/2005 PARA AUMENTAR VELOCIDADE ACESSO VPN-------

    If (DMParamSistema.QparamSistemaInd_Contabiliza.Value = 'S') And
       (DMObra.QObra_Req_CabInd_Tipo_Requisicao.Value <> 'PROVISORIA') And
       (DMObra.QObra_Req_CabCod_Filial.Value < 80) Then
    Begin
      {*** se nao for informado as contas contabeis dos descontos e dos acrecimos os valores devem ser somados ao total da nota ***}
      wValContabilizacaoNota := DmObra.QSomaObraReqTotal.Value;

      if (trim(DMOperacao.QOperacaoCod_Contabil_Contrato_Deb.Value) = '') or
         (trim(DMOperacao.QOperacaoCod_Contabil_Contrato_Cred.Value) = '') then
        wValContabilizacaoNota := wValContabilizacaoNota + DMObra.QObra_Req_CabVal_Acrescimo.Value;

      if (trim(DMOperacao.QOperacaoCod_Contabil_Desc_AFixar_Deb.Value) = '') or
         (trim(DMOperacao.QOperacaoCod_Contabil_Desc_AFixar_Cred.Value) = '') then
        wValContabilizacaoNota := wValContabilizacaoNota - DMObra.QObra_Req_CabVAL_ACRESCIMO.Value;
      {*** fim ***} //fabiano 27/01/2006


      // Valor da Nota
      wContra := DMOperacao.QOperacaoCod_Contabil_Val_Nota_APrazo.Value;
      wConta_Cred := DMOperacao.QOperacaoCod_Contabil_Val_Nota_Cred.Value;
      DMPlanilha.GravaLanc( 'OBRA',
                           DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                           FloatToStr(wNumero),
                           DMObra.QObra_Req_CabCod_Filial.Value,
                           wConta_Cred,
                           'CREDITO',
                           DMObra.QObra_Req_CabCod_Cadastro.Value,
                           DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                           wValContabilizacaoNota,
                           Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                           wContra);
      DMPlanilha.GravaLanc('OBRA',
                           DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                           FloatToStr(wNumero),
                           DMObra.QObra_Req_CabCod_Filial.Value,
                           wContra,
                           'DEBITO',
                           DMObra.QObra_Req_CabCod_Cadastro.Value,
                           DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                           wValContabilizacaoNota,
                           Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                           wConta_Cred);

      // Valor da Acrescimo (se nao tiver conta informada na operacao, será jogado o valor na contabilizacao do total da nota, que está mais acima)
      If DMObra.QObra_Req_CabVal_Acrescimo.Value <> 0 Then
      Begin
        wContra := DMOperacao.QOperacaoCod_Contabil_Contrato_Deb.Value;
        wConta_Cred := DMOperacao.QOperacaoCod_Contabil_Contrato_Cred.Value;
        DMPlanilha.GravaLanc('OBRA',
                             DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                             FloatToStr(wNumero),
                             DMObra.QObra_Req_CabCod_Filial.Value,
                             wConta_Cred,
                             'CREDITO',
                             DMObra.QObra_Req_CabCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             DMObra.QObra_Req_CabVal_Acrescimo.Value,
                             Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                             wContra);
        DMPlanilha.GravaLanc('OBRA',
                             DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                             FloatToStr(wNumero),
                             DMObra.QObra_Req_CabCod_Filial.Value,
                             wContra,
                             'DEBITO',
                             DMObra.QObra_Req_CabCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             DMObra.QObra_Req_CabVal_Acrescimo.Value,
                             Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                             wConta_Cred);
      End;

      // Valor da Desconto (se nao tiver conta informada na operacao, será jogado o valor na contabilizacao do total da nota, que está mais acima)
      If DMObra.QObra_Req_CabVal_Desconto.Value <> 0 Then
      Begin
        wContra := DMOperacao.QOperacaoCod_Contabil_Desc_AFixar_Deb.Value;
        wConta_Cred := DMOperacao.QOperacaoCod_Contabil_Desc_AFixar_Cred.Value;
        DMPlanilha.GravaLanc('OBRA',
                             DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                             FloatToStr(wNumero),
                             DMObra.QObra_Req_CabCod_Filial.Value,
                             wConta_Cred,
                             'CREDITO',
                             DMObra.QObra_Req_CabCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             DMObra.QObra_Req_CabVal_Desconto.Value,
                             Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                             wContra);
        DMPlanilha.GravaLanc('OBRA',
                             DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                             FloatToStr(wNumero),
                             DMObra.QObra_Req_CabCod_Filial.Value,
                             wContra,
                             'DEBITO',
                             DMObra.QObra_Req_CabCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             DMObra.QObra_Req_CabVal_Desconto.Value,
                             Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                             wConta_Cred);
      End;


      //valor do pis
      If DMObra.QObra_Req_CabVAL_PIS.Value <> 0 Then
      Begin
        wContra := DMOperacao.QOperacaoCOD_CONTABIL_PIS_DEB.Value;
        wConta_Cred := DMOperacao.QOperacaoCOD_CONTABIL_PIS_CRED.Value;
        DMPlanilha.GravaLanc('OBRA',
                             DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                             FloatToStr(wNumero),
                             DMObra.QObra_Req_CabCod_Filial.Value,
                             wConta_Cred,
                             'CREDITO',
                             DMObra.QObra_Req_CabCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             DMObra.QObra_Req_CabVAL_PIS.Value,
                             Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                             wContra);
        DMPlanilha.GravaLanc('OBRA',
                             DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                             FloatToStr(wNumero),
                             DMObra.QObra_Req_CabCod_Filial.Value,
                             wContra,
                             'DEBITO',
                             DMObra.QObra_Req_CabCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             DMObra.QObra_Req_CabVAL_PIS.Value,
                             Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                             wConta_Cred);
      End;


      //valor do COFINS
      If DMObra.QObra_Req_CabVAL_COFINS.Value <> 0 Then
      Begin
        wContra := DMOperacao.QOperacaoCOD_CONTABIL_COFINS_DEB.Value;
        wConta_Cred := DMOperacao.QOperacaoCOD_CONTABIL_COFINS_CRED.Value;
        DMPlanilha.GravaLanc('OBRA',
                             DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                             FloatToStr(wNumero),
                             DMObra.QObra_Req_CabCod_Filial.Value,
                             wConta_Cred,
                             'CREDITO',
                             DMObra.QObra_Req_CabCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             DMObra.QObra_Req_CabVAL_COFINS.Value,
                             Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                             wContra);
        DMPlanilha.GravaLanc('OBRA',
                             DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                             FloatToStr(wNumero),
                             DMObra.QObra_Req_CabCod_Filial.Value,
                             wContra,
                             'DEBITO',
                             DMObra.QObra_Req_CabCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             DMObra.QObra_Req_CabVAL_COFINS.Value,
                             Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                             wConta_Cred);
      End;


      //valor do IRRF
      If DMObra.QObra_Req_CabVAL_IRRF.Value <> 0 Then
      Begin
        wContra := DMOperacao.QOperacaoCOD_CONTABIL_IRRF_DEB.Value;
        wConta_Cred := DMOperacao.QOperacaoCOD_CONTABIL_IRRF_CRED.Value;
        DMPlanilha.GravaLanc('OBRA',
                             DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                             FloatToStr(wNumero),
                             DMObra.QObra_Req_CabCod_Filial.Value,
                             wConta_Cred,
                             'CREDITO',
                             DMObra.QObra_Req_CabCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             DMObra.QObra_Req_CabVAL_IRRF.Value,
                             Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                             wContra);
        DMPlanilha.GravaLanc('OBRA',
                             DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                             FloatToStr(wNumero),
                             DMObra.QObra_Req_CabCod_Filial.Value,
                             wContra,
                             'DEBITO',
                             DMObra.QObra_Req_CabCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             DMObra.QObra_Req_CabVAL_IRRF.Value,
                             Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                             wConta_Cred);
      End;


      //valor do CSLL
      If DMObra.QObra_Req_CabVAL_CSLL.Value <> 0 Then
      Begin
        wContra := DMOperacao.QOperacaoCOD_CONTABIL_CSLL_DEB.Value;
        wConta_Cred := DMOperacao.QOperacaoCOD_CONTABIL_CSLL_CRED.Value;
        DMPlanilha.GravaLanc('OBRA',
                             DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                             FloatToStr(wNumero),
                             DMObra.QObra_Req_CabCod_Filial.Value,
                             wConta_Cred,
                             'CREDITO',
                             DMObra.QObra_Req_CabCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             DMObra.QObra_Req_CabVAL_CSLL.Value,
                             Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                             wContra);
        DMPlanilha.GravaLanc('OBRA',
                             DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                             FloatToStr(wNumero),
                             DMObra.QObra_Req_CabCod_Filial.Value,
                             wContra,
                             'DEBITO',
                             DMObra.QObra_Req_CabCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             DMObra.QObra_Req_CabVAL_CSLL.Value,
                             Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                             wConta_Cred);
      End;


      //valor do INSS
      If DMObra.QObra_Req_CabVAL_INSS.Value <> 0 Then
      Begin
        wContra := DMOperacao.QOperacaoCOD_CONTABIL_INSS_DEB.Value;
        wConta_Cred := DMOperacao.QOperacaoCOD_CONTABIL_INSS_CRED.Value;
        DMPlanilha.GravaLanc('OBRA',
                             DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                             FloatToStr(wNumero),
                             DMObra.QObra_Req_CabCod_Filial.Value,
                             wConta_Cred,
                             'CREDITO',
                             DMObra.QObra_Req_CabCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             DMObra.QObra_Req_CabVAL_INSS.Value,
                             Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                             wContra);
        DMPlanilha.GravaLanc('OBRA',
                             DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                             FloatToStr(wNumero),
                             DMObra.QObra_Req_CabCod_Filial.Value,
                             wContra,
                             'DEBITO',
                             DMObra.QObra_Req_CabCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             DMObra.QObra_Req_CabVAL_INSS.Value,
                             Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                             wConta_Cred);
      End;


      //valor do ISSQN
      If DMObra.QObra_Req_CabVAL_ISSQN.Value <> 0 Then
      Begin
        wContra := DMOperacao.QOperacaoCOD_CONTABIL_ISSQN_DEB.Value;
        wConta_Cred := DMOperacao.QOperacaoCOD_CONTABIL_ISSQN_CRED.Value;
        DMPlanilha.GravaLanc('OBRA',
                             DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                             FloatToStr(wNumero),
                             DMObra.QObra_Req_CabCod_Filial.Value,
                             wConta_Cred,
                             'CREDITO',
                             DMObra.QObra_Req_CabCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             DMObra.QObra_Req_CabVAL_ISSQN.Value,
                             Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                             wContra);
        DMPlanilha.GravaLanc('OBRA',
                             DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,
                             FloatToStr(wNumero),
                             DMObra.QObra_Req_CabCod_Filial.Value,
                             wContra,
                             'DEBITO',
                             DMObra.QObra_Req_CabCod_Cadastro.Value,
                             DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                             DMObra.QObra_Req_CabVAL_ISSQN.Value,
                             Trunc(Date),    // DMObra.QObra_Req_CabDt_Emissao.Value, solicitacao do Leandro 02/02/2006
                             wConta_Cred);
      End;
    End;

    If DMOperacao.QOperacaoInd_Estoque.Value = 'S' Then
     Begin
       DMObra.QObra_Req_Item.First;
       While Not DMObra.QObra_Req_Item.Eof Do
        Begin
          //Para Produto Serviço estava dando erro ao confirmar a requisição dizendo que o produto não pode ficar negativo.
          //Junior - 13/05/2014. Solicitacao MARLISE - RA ELETRO.
          if DMOracle.FastSelect('IND_TIPO_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + DMObra.QObra_Req_ItemCOD_PRODUTO.Text) <> 'SERVIÇO' then
          begin
            If DMOperacao.QOperacaoInd_Tipo_Operacao.Value = 'S' Then
              wQt_Atu_Estoque := DMObra.QObra_Req_ItemQt_Quantidade.Value * -1
            else
              wQt_Atu_Estoque := DMObra.QObra_Req_ItemQt_Quantidade.Value;

            DMEstoque.Atualiza_Estoque(DMObra.QObra_Req_CabCod_Operacao.Value,DMObra.QObra_Req_CabCod_Filial.Value,
                                     DMObra.QObra_Req_ItemCod_Produto.Value,DMObra.QObra_Req_ItemCOD_LOTE_TIPO.Value,wQt_Atu_Estoque,
                                     DMObra.QObra_Req_ItemVal_Total.Value,DMObra.QObra_Req_CabDt_Emissao.Value,DMObra.QObra_Req_CabDt_Emissao.Value);
          end;
          DMObra.QObra_Req_Item.Next;
        End;
     End;

    if DMOracle.DBCemapa.inTransaction then
       DMOracle.DBCemapa.Commit;
    DMObra.QContasPagar_Cab.Close;
    DMObra.QContasPagar_Mov.Close;
    DMObra.QObra_Req_Cab.Close;
    DMObra.QObra_Req_Cab.Open;

    except //junior - 28/11/2014. Dava erro de estoque negativo mas continuava o processo de baixar do estoque os produtos.
       DMOracle.DBCemapa.Rollback;
      raise;
  end; //try

end;

procedure TFObra_Req_Conf.FormActivate(Sender: TObject);
var wValImpostos : real;
begin
  DMOperacao.QOperacao.Close;
  DMOperacao.QOperacao.SetVariable('PK',DMObra.QObra_Req_CabCod_Operacao.Value);
  DMOperacao.QOperacao.Open;
  If DMObra.QObra_Req_CabInd_Condicao_Pagto.Value = '1' Then // A vista
   Begin
    GBCPNota.Visible := False;
    LblTitulo.Caption := 'Finaliza';
   End
  Else
   Begin
    GBCPNota.Visible := True;
    LblTitulo.Caption := 'Gerar Contas a Pagar';
    LBContaPagar.Items.Clear;
    DmObra.QSomaObraReq.Close;
    DmObra.QSomaObraReq.Open;

    wValImpostos := DMObra.QObra_Req_CabVAL_PIS.Value +
                    DMObra.QObra_Req_CabVAL_COFINS.Value +
                    DMObra.QObra_Req_CabVAL_IRRF.Value +
                    DMObra.QObra_Req_CabVAL_CSLL.Value +
                    DMObra.QObra_Req_CabVAL_INSS.Value +
                    DMObra.QObra_Req_CabVAL_ISSQN.Value;

    MeTotal.Text :=FloatToStr(DmObra.QSomaObraReqTotal.Value -
                              DMObra.QObra_Req_CabVal_Desconto.Value +
                              DMObra.QObra_Req_CabVal_Acrescimo.Value -
                              wValImpostos);

      //o Leandro pediu para nao definir com esses valores ao confirmar. Fabiano 06/01/2006
    MeDepartamento.Text := IntToStr(DMUsuario.CodDepartamentoUsuario);
    MeDepartamentoExit(Self);
    MeFinalidade.Text := IntToStr(DMUsuario.CodFinalidadeUsuario);
    MEFinalidadeExit(Self);
    MeDiasCp.SetFocus;
   End;
end;

end.
